#!/bin/sh
cd geth-poa-docker
docker-compose build --pull
cd geth-pow-docker
docker-compose build --pull
cd parity-poa-docker
docker-compose build --pull
