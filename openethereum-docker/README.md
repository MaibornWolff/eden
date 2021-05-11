# Open-Ethereum development chain

A set of Docker images to create a local containerized development chain for developing and testing Ethereum dApps with Open-Ethereum.

```
docker run -ti -p 8545:8545 -p 8546:8546 -p 30303:30303 -p 30303:30303/udp openethereum/openethereum:latest --config dev --jsonrpc-interface all --reseal-min-period 0 --gas-price-percentile 0
```

The environment consists of the following parts:

- 1 dev node
- 1 explorer
- 1 monitor and corresponding dashboard

# Quick start

Setting up this development environment requires you to install Docker and Docker Compose. Clone the repository, run `docker-compose up` or use Makefile commands from this directory.

```
# Start the network
$ make start
# Stop the network
$ make stop
```

This setup uses the Open-Ethereum built-in `dev` mode/chain, i.e the development environment is set up with a instant seal consensus engine. The created chain is initialized with an address that contains Ether: `0x00a329c0648769a73afac7f9381e08fb43dbea72`. Its private key is `0x4d5db4107d237df6a3d58ee5f70ae63d73d7658d4026f2eefd2f204c81682cb7`.

Query the balance of the account via

```
$ curl -X POST localhost:8545 \
        -H "Content-Type: application/json" \
        --data \
          '
            {
              "jsonrpc": "2.0",
              "method": "eth_getBalance",
              "params": ["0x00a329c0648769a73afac7f9381e08fb43dbea72", "latest"],
              "id": 1
            }
          '

> {"jsonrpc":"2.0","result":"0x100000000000000000000000000000000000000000000000000","id":1}
```

Open-Ethereum available chain presets are: dev, mining, non-standard-ports, insecure, dev-insecure...
