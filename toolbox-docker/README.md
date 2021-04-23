# Dockerized toolbox for smart contract and dApp development

Dockerized toolbox with various pre-configured tools, e.g. **n** for node versions, **ganache-cli** as testrpc, **solcjs** and **solc**, **truffle** as dApp development suite (alternatively, use **hardhat** as project dependency), **oyente** and/or **smartcheck** as a static/dynamic smart contract analyzer. Additionally, it comes with various tools, such as **@0x/abi-gen**, **solhint**, **solidity-docgen** and **solgraph**.
Replace `dockerfile` in `docker-compose.yml` either with `oyente.Dockerfile` for oyente and smartcheck as analyzer and solc <= v0.4.21 or `smartcheck.Dockerfile` for smartcheck as analyzer and solc <= latest. The `volume` directory is shared with the toolbox container. Simply, create a project locally in `volume` in order to evaluate, test and develop the project with the toolbox.

## Quick start

Setting up this dockerized toolbox requires you to install Docker and Docker Compose. Clone the repository, and use Makefile commands from this directory.

```
# Start the dockerized toolbox and attach /bin/bash
$ make start-attached-bash
# Start the dockerized setup and start ganache-cli
$ make start-ganache-cli
# Attach /bin/bash when setup is started
$ make attach-bash
# Stop the dockerized setup
$ make stop
```
