export UID=$(id -u)
export GID=$(id -g)


docker compose -f compose-dev.yaml up -d --build --remove-orphans