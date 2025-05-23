#!/bin/bash

# Script para restaurar backup dos dashboards do Metabase
# Arquivo: restore-backup-metabase.sh

set -e

echo "📊 Iniciando restauração do backup do Metabase..."

# Verifica se o diretório de backup existe
if [ ! -d "./metabase-backup" ]; then
    echo "❌ Diretório de backup não encontrado: ./metabase-backup"
    echo "💡 Execute primeiro o script de backup: ./create-backup-metabase.sh"
    exit 1
fi

# Verifica se os arquivos de backup existem (excluindo databases)
REQUIRED_FILES=("dashboards.json" "cards.json" "collections.json" "users.json" "metadata.json")
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "./metabase-backup/$file" ]; then
        echo "❌ Arquivo de backup não encontrado: ./metabase-backup/$file"
        exit 1
    fi
done

echo "✅ Arquivos de backup encontrados!"

# Verifica se o Metabase está rodando
if ! curl -s -f http://localhost:3001/api/health >/dev/null 2>&1; then
    echo "❌ Metabase não está rodando ou não está acessível em localhost:3001"
    echo "💡 Execute primeiro: ./dev-up.sh"
    exit 1
fi

# Faz login no Metabase
echo "🔐 Fazendo login no Metabase..."
SESSION_RESPONSE=$(curl -s -X POST \
    -H "Content-Type: application/json" \
    -d '{
        "username": "admin@terravision.local",
        "password": "terravision_admin_2024"
    }' \
    "http://localhost:3001/api/session")

SESSION_TOKEN=$(echo "$SESSION_RESPONSE" | jq -r '.id' 2>/dev/null)

if [ "$SESSION_TOKEN" = "null" ] || [ -z "$SESSION_TOKEN" ]; then
    echo "❌ Erro ao fazer login no Metabase"
    echo "🔍 Verifique se as credenciais estão corretas:"
    echo "   Email: admin@terravision.local"
    echo "   Senha: terravision_admin_2024"
    echo "📋 Resposta do servidor:"
    echo "$SESSION_RESPONSE" | jq '.' 2>/dev/null || echo "$SESSION_RESPONSE"
    exit 1
fi

echo "✅ Login realizado com sucesso!"

# Função para verificar se jq está instalado
check_jq() {
    if ! command -v jq &> /dev/null; then
        echo "❌ jq não está instalado. Instalando..."
        if command -v apt-get &> /dev/null; then
            sudo apt-get update && sudo apt-get install -y jq
        elif command -v yum &> /dev/null; then
            sudo yum install -y jq
        elif command -v brew &> /dev/null; then
            brew install jq
        else
            echo "❌ Não foi possível instalar jq automaticamente"
            echo "💡 Instale manualmente: https://stedolan.github.io/jq/download/"
            exit 1
        fi
    fi
}

check_jq

# Ler informações do metadata
echo "📋 Lendo informações do backup..."
BACKUP_DATE=$(jq -r '.backup_date' ./metabase-backup/metadata.json 2>/dev/null || echo "Data não encontrada")
BACKUP_VERSION=$(jq -r '.backup_version' ./metabase-backup/metadata.json 2>/dev/null || echo "Versão não encontrada")
echo "   📅 Data do backup: $BACKUP_DATE"
echo "   🔢 Versão: $BACKUP_VERSION"

# Listar estado atual antes da restauração
echo ""
echo "📊 Verificando estado atual do Metabase..."
CURRENT_DASHBOARDS=$(curl -s -H "X-Metabase-Session: $SESSION_TOKEN" "http://localhost:3001/api/dashboard")
CURRENT_CARDS=$(curl -s -H "X-Metabase-Session: $SESSION_TOKEN" "http://localhost:3001/api/card")
CURRENT_COLLECTIONS=$(curl -s -H "X-Metabase-Session: $SESSION_TOKEN" "http://localhost:3001/api/collection")

DASHBOARD_COUNT=$(echo "$CURRENT_DASHBOARDS" | jq '. | length' 2>/dev/null || echo "0")
CARD_COUNT=$(echo "$CURRENT_CARDS" | jq '. | length' 2>/dev/null || echo "0")
COLLECTION_COUNT=$(echo "$CURRENT_COLLECTIONS" | jq '. | length' 2>/dev/null || echo "0")

echo "   📊 Dashboards atuais: $DASHBOARD_COUNT"
echo "   ❓ Cards atuais: $CARD_COUNT"
echo "   📁 Coleções atuais: $COLLECTION_COUNT"

# Confirmar antes de prosseguir
echo ""
echo "⚠️  ATENÇÃO: Este processo irá:"
echo "   1. Importar coleções do backup"
echo "   2. Importar cards (perguntas/queries) do backup"
echo "   3. Importar dashboards do backup"
echo "   4. NÃO irá alterar configurações de database"
echo "   5. NÃO irá alterar usuários existentes"
echo ""
read -p "🤔 Deseja continuar com a restauração? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Restauração cancelada pelo usuário"
    exit 0
fi

# 1. Restaurar Coleções primeiro (necessário para organização)
echo ""
echo "📁 Restaurando coleções..."
BACKUP_COLLECTIONS=$(cat ./metabase-backup/collections.json)
COLLECTION_SUCCESS=0
COLLECTION_ERRORS=0

# Filtrar apenas coleções não-root (id != null e não é coleção do sistema)
echo "$BACKUP_COLLECTIONS" | jq -c '.[] | select(.id != null and .name != "Root" and .personal_owner_id == null)' | while read -r collection; do
    COLLECTION_NAME=$(echo "$collection" | jq -r '.name')
    COLLECTION_DESC=$(echo "$collection" | jq -r '.description // ""')
    COLLECTION_COLOR=$(echo "$collection" | jq -r '.color // "#509EE3"')
    
    echo "   📁 Importando coleção: $COLLECTION_NAME"
    
    CREATE_RESPONSE=$(curl -s -X POST \
        -H "Content-Type: application/json" \
        -H "X-Metabase-Session: $SESSION_TOKEN" \
        -d "{
            \"name\": \"$COLLECTION_NAME\",
            \"description\": \"$COLLECTION_DESC\",
            \"color\": \"$COLLECTION_COLOR\"
        }" \
        "http://localhost:3001/api/collection" 2>/dev/null)
    
    if echo "$CREATE_RESPONSE" | jq -e '.id' >/dev/null 2>&1; then
        COLLECTION_SUCCESS=$((COLLECTION_SUCCESS + 1))
        echo "      ✅ Criada com sucesso"
    else
        COLLECTION_ERRORS=$((COLLECTION_ERRORS + 1))
        echo "      ⚠️  Erro ou já existe: $(echo "$CREATE_RESPONSE" | jq -r '.message // "Erro desconhecido"')"
    fi
done

# 2. Restaurar Cards/Perguntas
echo ""
echo "❓ Restaurando cards (perguntas/queries)..."
BACKUP_CARDS=$(cat ./metabase-backup/cards.json)
CARD_SUCCESS=0
CARD_ERRORS=0

echo "$BACKUP_CARDS" | jq -c '.[]' | while read -r card; do
    CARD_NAME=$(echo "$card" | jq -r '.name')
    CARD_DATASET_QUERY=$(echo "$card" | jq -c '.dataset_query')
    CARD_DISPLAY=$(echo "$card" | jq -r '.display')
    CARD_VISUALIZATION_SETTINGS=$(echo "$card" | jq -c '.visualization_settings // {}')
    
    echo "   ❓ Importando card: $CARD_NAME"
    
    CREATE_RESPONSE=$(curl -s -X POST \
        -H "Content-Type: application/json" \
        -H "X-Metabase-Session: $SESSION_TOKEN" \
        -d "{
            \"name\": \"$CARD_NAME\",
            \"dataset_query\": $CARD_DATASET_QUERY,
            \"display\": \"$CARD_DISPLAY\",
            \"visualization_settings\": $CARD_VISUALIZATION_SETTINGS
        }" \
        "http://localhost:3001/api/card" 2>/dev/null)
    
    if echo "$CREATE_RESPONSE" | jq -e '.id' >/dev/null 2>&1; then
        CARD_SUCCESS=$((CARD_SUCCESS + 1))
        echo "      ✅ Criado com sucesso"
    else
        CARD_ERRORS=$((CARD_ERRORS + 1))
        echo "      ⚠️  Erro: $(echo "$CREATE_RESPONSE" | jq -r '.message // "Erro desconhecido"')"
    fi
done

# 3. Restaurar Dashboards
echo ""
echo "📊 Restaurando dashboards..."
BACKUP_DASHBOARDS=$(cat ./metabase-backup/dashboards.json)
DASHBOARD_SUCCESS=0
DASHBOARD_ERRORS=0

echo "$BACKUP_DASHBOARDS" | jq -c '.[]' | while read -r dashboard; do
    DASHBOARD_NAME=$(echo "$dashboard" | jq -r '.name')
    DASHBOARD_DESC=$(echo "$dashboard" | jq -r '.description // ""')
    DASHBOARD_PARAMETERS=$(echo "$dashboard" | jq -c '.parameters // []')
    
    echo "   📊 Importando dashboard: $DASHBOARD_NAME"
    
    CREATE_RESPONSE=$(curl -s -X POST \
        -H "Content-Type: application/json" \
        -H "X-Metabase-Session: $SESSION_TOKEN" \
        -d "{
            \"name\": \"$DASHBOARD_NAME\",
            \"description\": \"$DASHBOARD_DESC\",
            \"parameters\": $DASHBOARD_PARAMETERS
        }" \
        "http://localhost:3001/api/dashboard" 2>/dev/null)
    
    if echo "$CREATE_RESPONSE" | jq -e '.id' >/dev/null 2>&1; then
        DASHBOARD_SUCCESS=$((DASHBOARD_SUCCESS + 1))
        NEW_DASHBOARD_ID=$(echo "$CREATE_RESPONSE" | jq -r '.id')
        echo "      ✅ Criado com sucesso (ID: $NEW_DASHBOARD_ID)"
        echo "      🔗 Acesse em: http://localhost:3001/dashboard/$NEW_DASHBOARD_ID"
    else
        DASHBOARD_ERRORS=$((DASHBOARD_ERRORS + 1))
        echo "      ⚠️  Erro: $(echo "$CREATE_RESPONSE" | jq -r '.message // "Erro desconhecido"')"
    fi
done

# Fazer logout
curl -s -X DELETE \
    -H "X-Metabase-Session: $SESSION_TOKEN" \
    "http://localhost:3001/api/session" >/dev/null

echo ""
echo "🎯 Restauração concluída!"
echo ""
echo "📊 Resumo da importação:"
echo "   📁 Coleções: $COLLECTION_SUCCESS criadas, $COLLECTION_ERRORS erros"
echo "   ❓ Cards: $CARD_SUCCESS criados, $CARD_ERRORS erros"
echo "   📊 Dashboards: $DASHBOARD_SUCCESS criados, $DASHBOARD_ERRORS erros"
echo ""
echo "🌐 Acesse o Metabase em: http://localhost:3001"
echo "📋 Verifique os dashboards importados na interface web"
echo ""

# Verificar estado final
echo "📊 Verificando estado final..."
FINAL_DASHBOARDS=$(curl -s -H "X-Metabase-Session: $SESSION_TOKEN" "http://localhost:3001/api/dashboard" 2>/dev/null || echo "[]")
FINAL_DASHBOARD_COUNT=$(echo "$FINAL_DASHBOARDS" | jq '. | length' 2>/dev/null || echo "0")
echo "   📊 Total de dashboards após importação: $FINAL_DASHBOARD_COUNT"