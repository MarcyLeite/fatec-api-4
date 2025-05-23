#!/bin/bash

# Script para subir o ambiente de desenvolvimento
# Arquivo: dev-up.sh

set -e

echo "🚀 Iniciando ambiente de desenvolvimento Terravision..."

# Cria diretório para scripts do Metabase se não existir
if [ ! -d "./metabase-setup" ]; then
    echo "📁 Criando diretório metabase-setup..."
    mkdir -p ./metabase-setup
fi

# Verifica se o script de setup existe
if [ ! -f "./metabase-setup/setup-metabase.sh" ]; then
    echo "⚠️  Script de setup do Metabase não encontrado!"
    echo "📝 Crie o arquivo ./metabase-setup/setup-metabase.sh com o script de configuração."
    echo "💡 Você pode encontrar o conteúdo do script na documentação do projeto."
fi

# Torna o script executável
if [ -f "./metabase-setup/setup-metabase.sh" ]; then
    chmod +x ./metabase-setup/setup-metabase.sh
    echo "✅ Script de setup do Metabase configurado"
fi

echo "🐳 Subindo containers..."
docker compose -f compose-dev.yaml up -d --build --remove-orphans

echo ""
echo "⏳ Aguardando serviços ficarem prontos..."
echo "   - PostgreSQL (aplicação): localhost:5433"
echo "   - PostgreSQL (metabase): container interno"
echo "   - Aplicação: localhost:8080 e localhost:3000"
echo "   - Metabase: localhost:3001"
echo ""

# Aguarda os serviços principais ficarem prontos
echo "🔍 Verificando status dos serviços..."

# Verifica PostgreSQL da aplicação
echo -n "📊 PostgreSQL (aplicação): "
for i in {1..30}; do
    if docker compose -f compose-dev.yaml exec -T postgres pg_isready -U postgres -d terravision >/dev/null 2>&1; then
        echo "✅ Pronto"
        break
    fi
    if [ $i -eq 30 ]; then
        echo "❌ Timeout"
        exit 1
    fi
    sleep 2
done

# Verifica Metabase
echo -n "📈 Metabase: "
for i in {1..60}; do
    if curl -s -f http://localhost:3001/api/health >/dev/null 2>&1; then
        echo "✅ Pronto"
        break
    fi
    if [ $i -eq 60 ]; then
        echo "⚠️  Timeout (mas pode estar inicializando ainda)"
        break
    fi
    sleep 3
done

echo ""
echo "🎉 Ambiente iniciado com sucesso!"
echo ""
echo "📋 INFORMAÇÕES DE ACESSO:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🗄️  PostgreSQL (aplicação):"
echo "   Host: localhost:5433"
echo "   Database: terravision"
echo "   User: postgres"
echo "   Password: postgres"
echo ""
echo "📊 Metabase Analytics:"
echo "   URL: http://localhost:3001"
echo "   Email: admin@terravision.local"
echo "   Password: terravision_admin_2024"
echo ""
echo "🚀 Aplicação:"
echo "   Backend: http://localhost:8080"
echo "   Frontend: http://localhost:3000"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "💡 Dicas:"
echo "   • O Metabase já está configurado automaticamente"
echo "   • A conexão com o banco da aplicação já foi criada"
echo "   • Para parar: docker compose -f compose-dev.yaml down"
echo "   • Para logs: docker compose -f compose-dev.yaml logs -f [serviço]"
echo ""