# Single node SKALE environment

A set of Docker images to create a local containerized single node environment for developing and testing Ethereum dApps on SKALE.

The environment consists of the following parts:

- 1 schain node
- 1 explorer

## Quick start

Setting up this development environment requires you to install Docker and Docker Compose. Clone the repository and use Makefile commands from this directory.

```bash
# Build images and setup volumes
$ make build
# Start the development chain after build process
$ make start
# Stop the setup
$ make stop
```

The development environment is set up for ethash PoW.

RPC is exposed at `http://localhost:1234`. Instead of the containerized explorer at `localhost:3000`, you can also use the official SKALE block explorer at `https://explorer.skale.network/`.
