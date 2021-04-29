# Local IPFS network

A set of Docker images to create a local dockerized IPFS network including three IPFS peers and three corresponding IPFS clusters.

The testnet consists of the following parts:

- 3 IPFS peers
- 3 IPFS clusters

By default, IPFS and IPFS cluster have the following ports:

**IPFS:**

- 4001: ipfs swarm
- 5001: ipfs api
- 8080: ipfs gateway

**IPFS cluster:**

- 9094: http api endpoint
- 9095: ipfs cluster proxy endpoint
- 9096: cluster swarm

**peer0** and **cluster0** have just mentioned ports exposed. E.g. list cluster nodes via `curl http://localhost:9094/peers`. Otherwise use **ipfs-cluster-ctl** to access cluster REST API.

Cluster REST API specification can be found [here](https://cluster.ipfs.io/documentation/reference/api/)

## Quick start

Setting up this network requires you to install Docker and Docker Compose. Clone the repository, and use Makefile commands from this directory.

```
# Set up cluster secret
cp ./.env.example ./.env
# Or
export CLUSTER_SECRET=$(od -vN 32 -An -tx1 /dev/urandom | tr -d ' \n')

# Start the network
$ make start
# Stop the network
$ make stop
# Clean environments
$ make clean
```

## References

- https://labs.eleks.com/2019/03/ipfs-network-data-replication.html
- https://medium.com/rahasak/ipfs-cluster-with-docker-db2ec20a6cc1
