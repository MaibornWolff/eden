# Local PoW Ethereum Network

A set of Docker images to create a local PoW Ethereum network with one mining node which is also used for bootstrapping, a scalable number of fullnodes, an explorer, a monitor and its corresponding dashboard. This was built to understand how local PoW Ethereum networks have to be set up and to provide a local test environment. Never use this in a productive environment, as the repository contains hardcoded passwords and private keys for convenience.

The testnet consists of several parts:

- 1 miner: also used for bootstrapping.
- n fullnodes: default number of fullnodes is 1.
- 1 blockchain explorer
- 1 monitor and its corresponding dashboard

## Quick start

Setting up this network requires you to install Docker and Docker Compose. Clone the repository, and run `docker-compose up` or use Makefile commands from this directory.

```
# Start the network
$ make start
# Restart the network
$ make restart
# Stop the network
$ make stop

# Scale the number of fullnodes with the following command, where n is the number of nodes to create
$ docker-compose up -d --scale geth-node=n
```

The network should start and synchronize without any further configuration. The network always uses the latest available stable version of Ethereum (geth), the network is set up for PoW.
