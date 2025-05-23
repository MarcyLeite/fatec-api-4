#!/bin/bash

# Script para fazer backup dos dashboards do Metabase
# Arquivo: create-backup-metabase.sh

set -e

echo "📊 Iniciando backup dos dashboards do Metabase..."

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

SESSION_TOKEN=$(echo "$SESSION_RESPONSE" | grep -o '"id":"[^"]*' | cut -d'"' -f4)

if [ -z "$SESSION_TOKEN" ] || [ "$SESSION_TOKEN" = "null" ]; then
    echo "❌ Erro ao fazer login no Metabase"
    echo "🔍 Verifique se as credenciais estão corretas:"
    echo "   Email: admin@terravision.local"
    echo "   Senha: terravision_admin_2024"
    exit 1
fi

echo "✅ Login realizado com sucesso!"

# Criar diretório de backup
mkdir -p ./metabase-backup

# Backup dos dashboards
echo "📊 Exportando dashboards..."
curl -s -H "X-Metabase-Session: $SESSION_TOKEN" \
    "http://localhost:3001/api/dashboard" > ./metabase-backup/dashboards.json

# Backup das perguntas/cards
echo "❓ Exportando perguntas/cards..."
curl -s -H "X-Metabase-Session: $SESSION_TOKEN" \
    "http://localhost:3001/api/card" > ./metabase-backup/cards.json

# Backup das coleções
echo "📁 Exportando coleções..."
curl -s -H "X-Metabase-Session: $SESSION_TOKEN" \
    "http://localhost:3001/api/collection" > ./metabase-backup/collections.json

# Backup das configurações de database
echo "🗄️  Exportando configurações de database..."
curl -s -H "X-Metabase-Session: $SESSION_TOKEN" \
    "http://localhost:3001/api/database" > ./metabase-backup/databases.json

# Backup dos usuários
echo "👥 Exportando usuários..."
curl -s -H "X-Metabase-Session: $SESSION_TOKEN" \
    "http://localhost:3001/api/user" > ./metabase-backup/users.json

echo "📋 Criando metadata do backup..."
cat > ./metabase-backup/metadata.json << EOF
{
    "backup_date": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
    "backup_version": "1.0",
    "metabase_version": "0.48.4",
    "project": "terravision",
    "description": "Backup automático dos dashboards e configurações do Metabase"
}
EOF

curl -s -X DELETE \
    -H "X-Metabase-Session: $SESSION_TOKEN" \
    "http://localhost:3001/api/session" >/dev/null

echo ""
echo "✅ Backup concluído com sucesso!"
echo "📁 Arquivos salvos em: ./metabase-backup/"
echo ""
echo "📋 Arquivos criados:"
echo "   - dashboards.json   (dashboards e visualizações)"
echo "   - cards.json        (perguntas/queries)"
echo "   - collections.json  (organização em pastas)"
echo "   - databases.json    (conexões de banco)"
echo "   - users.json        (usuários do sistema)"
echo "   - metadata.json     (informações do backup)"
echo ""