export DUID=$(id -u)
export DGID=$(id -g)

mkdir ~/.gradle 
docker compose -f compose-dev.yaml up -d --build --remove-orphans
