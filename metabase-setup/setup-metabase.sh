#!/bin/sh

# Script para configurar automaticamente o Metabase
# Coloque este arquivo em: ./metabase-setup/setup-metabase.sh

METABASE_URL="http://metabase:3000"
MAX_ATTEMPTS=30
ATTEMPT=1

echo "🚀 Iniciando configuração automática do Metabase..."

# Aguarda o Metabase estar pronto
while [ $ATTEMPT -le $MAX_ATTEMPTS ]; do
    echo "⏳ Tentativa $ATTEMPT/$MAX_ATTEMPTS - Verificando se Metabase está pronto..."
    
    if curl -s -f "$METABASE_URL/api/health" > /dev/null 2>&1; then
        echo "✅ Metabase está respondendo!"
        break
    fi
    
    if [ $ATTEMPT -eq $MAX_ATTEMPTS ]; then
        echo "❌ Timeout: Metabase não respondeu após $MAX_ATTEMPTS tentativas"
        exit 1
    fi
    
    sleep 10
    ATTEMPT=$((ATTEMPT + 1))
done

# Verifica se já foi configurado
echo "🔍 Verificando se Metabase já foi configurado..."
SETUP_STATUS=$(curl -s "$METABASE_URL/api/session/properties" | grep -o '"setup-complete":[^,}]*' | cut -d':' -f2)

if [ "$SETUP_STATUS" = "true" ]; then
    echo "ℹ️  Metabase já foi configurado anteriormente."
    echo "📊 Configurando conexão com banco da aplicação..."
    
    # Faz login como admin
    SESSION_TOKEN=$(curl -s -X POST \
        -H "Content-Type: application/json" \
        -d '{
            "username": "admin@terravision.local",
            "password": "terravision_admin_2024"
        }' \
        "$METABASE_URL/api/session" | \
        grep -o '"id":"[^"]*' | cut -d'"' -f4)
    
    if [ -n "$SESSION_TOKEN" ]; then
        echo "✅ Login realizado com sucesso!"
        
        # Verifica se a conexão com banco da aplicação já existe
        DB_EXISTS=$(curl -s -H "X-Metabase-Session: $SESSION_TOKEN" \
            "$METABASE_URL/api/database" | \
            grep -o '"name":"Terravision DB"')
        
        if [ -z "$DB_EXISTS" ]; then
            echo "🔗 Criando conexão com banco da aplicação..."
            
            # Cria conexão com banco da aplicação
            curl -s -X POST \
                -H "Content-Type: application/json" \
                -H "X-Metabase-Session: $SESSION_TOKEN" \
                -d '{
                    "engine": "postgres",
                    "name": "Terravision DB",
                    "details": {
                        "host": "postgres",
                        "port": 5432,
                        "dbname": "terravision",
                        "user": "postgres",
                        "password": "postgres",
                        "ssl": false,
                        "tunnel-enabled": false
                    },
                    "auto_run_queries": true,
                    "is_full_sync": true,
                    "is_on_demand": false,
                    "schedules": {
                        "cache_field_values": {
                            "schedule_day": null,
                            "schedule_frame": null,
                            "schedule_hour": 0,
                            "schedule_minute": 0,
                            "schedule_type": "daily"
                        },
                        "metadata_sync": {
                            "schedule_day": null,
                            "schedule_frame": null,
                            "schedule_hour": null,
                            "schedule_minute": 0,
                            "schedule_type": "hourly"
                        }
                    }
                }' \
                "$METABASE_URL/api/database"
            
            echo "✅ Conexão com banco da aplicação configurada!"
        else
            echo "ℹ️  Conexão com banco da aplicação já existe."
        fi
    else
        echo "❌ Erro ao fazer login no Metabase"
    fi
else
    echo "🛠️  Executando configuração inicial do Metabase..."
    
    # Configuração inicial completa
    curl -s -X POST \
        -H "Content-Type: application/json" \
        -d '{
            "token": "your_setup_token_here_change_me",
            "user": {
                "first_name": "Admin",
                "last_name": "Terravision",
                "email": "admin@terravision.local",
                "password": "terravision_admin_2024"
            },
            "database": null,
            "invite": null,
            "prefs": {
                "site_name": "Terravision Analytics",
                "site_locale": "pt_BR",
                "allow_tracking": false
            }
        }' \
        "$METABASE_URL/api/setup"
    
    echo "✅ Configuração inicial concluída!"
    
    # Aguarda um pouco e faz login para configurar a conexão
    sleep 5
    
    echo "🔗 Configurando conexão com banco da aplicação..."
    
    # Faz login
    SESSION_TOKEN=$(curl -s -X POST \
        -H "Content-Type: application/json" \
        -d '{
            "username": "admin@terravision.local",
            "password": "terravision_admin_2024"
        }' \
        "$METABASE_URL/api/session" | \
        grep -o '"id":"[^"]*' | cut -d'"' -f4)
    
    if [ -n "$SESSION_TOKEN" ]; then
        # Cria conexão com banco da aplicação
        curl -s -X POST \
            -H "Content-Type: application/json" \
            -H "X-Metabase-Session: $SESSION_TOKEN" \
            -d '{
                "engine": "postgres",
                "name": "Terravision DB",
                "details": {
                    "host": "postgres",
                    "port": 5432,
                    "dbname": "terravision",
                    "user": "postgres",
                    "password": "postgres",
                    "ssl": false,
                    "tunnel-enabled": false
                },
                "auto_run_queries": true,
                "is_full_sync": true,
                "is_on_demand": false,
                "schedules": {
                    "cache_field_values": {
                        "schedule_day": null,
                        "schedule_frame": null,
                        "schedule_hour": 0,
                        "schedule_minute": 0,
                        "schedule_type": "daily"
                    },
                    "metadata_sync": {
                        "schedule_day": null,
                        "schedule_frame": null,
                        "schedule_hour": null,
                        "schedule_minute": 0,
                        "schedule_type": "hourly"
                    }
                }
            }' \
            "$METABASE_URL/api/database"
        
        echo "✅ Conexão com banco da aplicação configurada!"
    else
        echo "❌ Erro ao fazer login após configuração inicial"
    fi
fi

echo ""
echo "🎉 Configuração do Metabase concluída!"
echo "📊 Acesse: http://localhost:3001"
echo "👤 Login: admin@terravision.local"
echo "🔐 Senha: terravision_admin_2024"
echo ""