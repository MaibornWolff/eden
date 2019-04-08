#!/bin/sh
docker-compose -f geth-poa-docker/docker-compose.yml build --pull
docker-compose -f geth-pow-docker/docker-compose.yml build --pull
docker-compose -f parity-poa-docker/docker-compose.yml build --pull
