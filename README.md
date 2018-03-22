# Geth proof-of-work Docker

Credit for eth-netstats goes to [Netstats](https://github.com/cubedro/eth-netstats).


## 1. Setup

#### Prerequisites

Docker Toolbox installed.
> To download and install Docker Toolbox for your environment please
follow [the Docker Toolbox instructions](https://www.docker.com/products/docker-toolbox).



### Ethereum Cluster with netstats monitoring

To run an Ethereum Docker cluster run the following:

```
$ docker-compose up -d
```

By default this will create:

* 1 Ethereum Geth (mining) container
* 1 Ethereum Geth (not mining) container (which connects to the first container on launch)
* 1 Netstats container (with a Web UI to view activity in the cluster)

To access the Netstats Web UI:

> open localhost:3000


### Test accounts ready for use

You have 10 prefilled accounts, which you can find under
> /files/keystore

If you want to change the amount of Ether for those accounts
>files/genesis.json



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
