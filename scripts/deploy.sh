#!/bin/bash

docker-compose -f geth-poa-docker/docker-compose.yml push
docker-compose -f geth-pow-docker/docker-compose.yml push
docker-compose -f ipfs-docker/docker-compose.yml push
docker-compose -f openethereum-docker/docker-compose.yml push
docker-compose -f parity-poa-docker/docker-compose.yml push
docker-compose -f skale-docker/docker-compose.yml push
docker-compose -f toolbox-docker/docker-compose.yml push

npx semantic-release
