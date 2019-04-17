#!/bin/sh
docker-compose -f geth-poa-docker/docker-compose.yml push
docker-compose -f geth-pow-docker/docker-compose.yml push
docker-compose -f parity-poa-docker/docker-compose.yml push
docker-compose -f toolbox-docker/docker-compose.yml push
npx semantic-release
