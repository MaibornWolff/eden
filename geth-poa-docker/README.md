# Local PoA Ethereum Network

A set of Docker images to create a local PoA Ethereum network with one bootnode, two miners, one fullnode, two swarm bee nodes with clef as key management service, three explorers, a monitor and its corresponding dashboard. This was built to understand how local PoA Ethereum networks have to be set up and to provide a local test environment. **Never use this in a productive environment, as the `docker-compose.yml` contains hardcoded passwords and private keys for convenience.**

The testnet consists of several parts:

- 1 bootnode: registers existing nodes on the network, discovery service.
- 2 miners: also called **sealers** within proof-of-authority (PoA). They validate the blocks.
- 1 fullnode: this serves as **transaction relay** and is a fullnode that does not mine, is locked but has RPC exposed.
- 2 swarm bee nodes: these nodes make up the **peer-to-peer CDN**.
- 3 blockchain explorer: 2 lightweight web applications to explore the blockchain and 1 blockscout explorer.
- 1 monitor and its corresponding dashboard: the monitor collects data from the fullnode which is displayed through the dashboard.

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

The network should start and synchronize without any further configuration. The network always uses the latest available version of Ethereum (geth), the network is set up for clique proof-of-authority similar to the Ethereum Rinkeby testnet.

## Topology

### Bootnode

The nodes in the network are connecting with the bootnode. This is a special Ethereum node, designed to provide a register of the existing nodes in the network. The parameter `nodekeyhex` in the `docker-compose.yml` is needed to derive the `enodeId` which is later passed to the other nodes. The IP needs to be fixed, as the other nodes need to know where to find the bootnode, and DNS is not supported. The bootnode does not participate in synchronization of state or mining.

### Miners and fullnode

There are three nodes that participate in the network. The state is synchronized between them and they are trying to create blocks with mining. Initially, they connect to the bootnode with the information derived from the fixed IP and the `nodekeyhex`. If you want to interact with the network, you need to connect via RPC. You can attach a geth instance, connect Remix IDE or connect your browser with web3 and build a dApp.

The RPC Ports of the nodes are mapped to your localhost, the addresses are:

- geth-dev-miner-1: [http://localhost:8541](http://localhost:8541)
- geth-dev-miner-2: [http://localhost:8543](http://localhost:8543)
- geth-dev-node: [http://localhost:8545](http://localhost:8545)

### Swarm bee / IPFS

Work in progress

### Blockchain explorer

A blockchain explorer fetches the data from `geth-dev-node` through RPC calls. The blockchain explorers can be found at the addresses:

- geth-explorer: [http://localhost:8080](http://localhost:8080)
- lite-explorer: [http://localhost:8800](http://localhost:8800)
- blockscout-explorer: [http://localhost:8800](http://localhost:4000)

### Blockchain monitor and dashboard

The blockchain dashboard is a simple node.js web application being provided by two separate containers: `monitor` and `dashboard`. The monitor collects data from `geth-dev-node` which is displayed through the dashboard. The blockchain dashboard can be found at [http://localhost:8008](http://localhost:8008).
