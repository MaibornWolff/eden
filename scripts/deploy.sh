#!/bin/sh
cd geth-poa-docker
docker-compose push
cd geth-pow-docker
docker-compose push
cd parity-poa-docker
docker-compose push
