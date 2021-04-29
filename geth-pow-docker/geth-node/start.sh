#!/bin/sh
set -e

geth init /root/genesis.json

sleep 3
# Get IP of bootstrap node
BOOTSTRAP_IP=`getent hosts bootstrap-mining | cut -d" " -f1`
# Replace XXX for IP of bootstrap node
GETH_OPTS=${@/XXX/$BOOTSTRAP_IP}
geth $GETH_OPTS
