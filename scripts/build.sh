#!/bin/bash

docker-compose -f geth-poa-docker/docker-compose.yml build --no-cache --compress --progress plain --memory 6g
docker-compose -f geth-pow-docker/docker-compose.yml build --no-cache --compress --progress plain
docker-compose -f ipfs-docker/docker-compose.yml build --no-cache --compress --progress plain
docker-compose -f openethereum-docker/docker-compose.yml build --no-cache --compress --progress plain
docker-compose -f parity-poa-docker/docker-compose.yml build --no-cache --compress --progress plain
docker-compose -f skale-docker/docker-compose.yml build --no-cache --compress --progress plain
docker-compose -f toolbox-docker/docker-compose.yml build --no-cache --compress --progress plain
