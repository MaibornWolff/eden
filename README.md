# Ethereum Docker

Get started creating Ethereum development and test single and multi-node clusters
rapidly using Docker.

We provide full Ethereum test nodes (using the [Ethereum Go client](https://github.com/ethereum/go-ethereum) with all APIs enabled by default as well as a monitoring dashboard (for the cluster version) provided
via [Netstats](https://github.com/cubedro/eth-netstats).

#### Alternative projects

TestRPC - [https://github.com/ethereumjs/testrpc](https://github.com/ethereumjs/testrpc)

# Getting started

## 1. Installing

### 1.1. Standalone Ethereum node

#### Prerequisites

Docker Toolbox installed.
> To download and install Docker Toolbox for your environment please
follow [the Docker Toolbox instructions](https://www.docker.com/products/docker-toolbox).

After Docker Toolbox has been installed, create a ```default``` machine to run Docker against.

All command from now on are run within the "ethereum-docker" directory.

```
cd ethereum-docker
```

#### Lets go

To run a single test Ethereum node run the following:

```
$ docker-compose -f docker-compose-standalone.yml up -d
```

To run a standalone Proof of Authority Developer Chain with prefunded Account use:

```
$ docker-compose -f docker-compose-standalone.dev.yml up -d
```

Prefunded Account: `0x99429f64cf4d5837620dcc293c1a537d58729b68`

If using docker-machine you should be able to get to the JSON RPC client by doing:

```
open http://$(docker-machine ip default):8545 or 0.0.0.0:8545 if run locally.
```

Assuming you ran docker-compose against the ```default``` machine.

### 1.2. Ethereum Cluster with netstats monitoring

To run an Ethereum Docker cluster run the following:

```
$ docker-compose up -d
```

By default this will create:

* 1 Ethereum Bootstrapped container
* 1 Ethereum container (which connects to the bootstrapped container on launch)
* 1 Netstats container (with a Web UI to view activity in the cluster)

To access the Netstats Web UI:

```
open http://$(docker-machine ip default):3000 or 0.0.0.0:3000 if run locally.
```

#### Scaling the number of nodes/containers in the cluster

```
docker-compose up --scale eth=3 -d
```

Will scale the number of Ethereum nodes upwards (replace 3 with however many nodes
you prefer). These nodes will connect to the P2P network (via the bootstrap node)
by default.

### 1.3. Test accounts ready for use

As part of the bootstrapping process we bootstrap 10 Ethereum accounts for use
pre-filled with 20 Ether for use in transactions by default.

If you want to change the amount of Ether for those accounts
See ```files/genesis.json```.

## 2. Interact with geth

If you want to start mining or stop mining you need to connect to the node via:
```
docker exec -it node_2 geth attach ipc://root/.ethereum/devchain/geth.ipc
```
Replace node_2 with the container name you wish to connect to.

### 2.1 Use existing DAG

To speed up the process, you can use a pre-generated DAG. All you need to do is add something like this
```
ADD dag/full-R23-0000000000000000 /root/.ethash/full-R23-0000000000000000
```
to the monitored-geth-client Dockerfile.

## 3. Interact with swarm

You can add files to swarm with
```
swarm up <filename>
```

and afterwards you can download the file with a http request on port 8500:
```
http://localhost:8500/bzz:/c5cca2b6d692c13e497bbf5d6d9399e2e3c1693e34c32129c7dbc85361147821/
```

## 4. Interact with ENS

You can use the pre-deployed ENS registry and FIFS registrar for your projects

Open bootstrap container console and connect to the running geth instance:
```
geth attach /root/.ethereum/devchain/geth.ipc
```

Then load ensutils.js with:
```
loadScript('/root/files/ensutils.js’)
```

More: http://docs.ens.domains/en/latest/userguide.html#interacting

ENS address:
0x52db67a188a2ddad8433a80c494cbbb15002d125

FIFS Registrar(root):
0x90dd5486a271235be9508f62acebfd275d6e6404

## 5. Purge everything

```
docker-compose stop && docker-compose rm -f
```
