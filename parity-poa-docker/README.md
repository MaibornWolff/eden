# Local Parity PoA Network

**Note that Parity is deprecated, however this setup is pinned to the latest stable parity version.**

Docker Ethereum environment with Parity PoA network including 3 authorities, 3 members, 1 explorer, 1 monitor and its dashboard.

## Quick start

Setting up this network requires you to install Docker and Docker Compose. Clone the repository, and run `docker-compose up` or use Makefile commands from this directory.

```
# Start the network
$ make start
# Restart the network
$ make restart
# Stop the network
$ make stop
```

The network should start and synchronize without any further configuration. The network always uses the latest stable version of Parity, the network is set up for PoA.

## JSON-RPC

```
$ curl --data '{"jsonrpc":"2.0","method":"personal_sendTransaction","params":[{"from":"0x6B0c56d1Ad5144b4d37fa6e27DC9afd5C2435c3B","to":"0x00E3d1Aa965aAfd61217635E5f99f7c1e567978f","value":"0xde0b6b3a7640000"}, ""],"id":0}' -H "Content-Type: application/json" -X POST localhost:8545
```
