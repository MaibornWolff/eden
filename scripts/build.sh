#!/bin/bash

docker-compose -f geth-poa-docker/docker-compose.yml build --no-cache --compress --progress plain --memory 6g
docker-compose -f geth-pow-docker/docker-compose.yml build --no-cache --compress --progress plain
docker-compose -f parity-poa-docker/docker-compose.yml build
docker-compose -f toolbox-docker/docker-compose.yml build --no-cache --compress --progress plain
