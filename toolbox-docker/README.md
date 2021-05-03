# Dockerized toolbox for smart contract and dApp development

Dockerized toolboxes with various pre-configured tools, e.g. **n** for node versions, **ganache-cli** as testrpc, **solcjs** and **solc**, **truffle** as dApp development suite (alternatively, use **hardhat** as project dependency), **oyente** and **smartcheck** for solc <= v0.4.21 and **mythril** and **smartcheck** for solc <= latest as smart contract analyzer. Additionally, it comes with various tools, such as **@0x/abi-gen**, **solhint**, **solidity-docgen** and **solgraph**.
The `volume` directory is shared with the toolbox containers. Simply, create a project locally in `volume` in order to evaluate, test and develop the project with the two toolboxes.

## Quick start

Setting up this dockerized toolboxes requires you to install Docker and Docker Compose. Clone the repository, and use Makefile commands from this directory.

```
# Start the dockerized toolbox-oyente and attach /bin/bash
$ make start-attached-bash-oyente
# Start the dockerized toolbox-mythril and attach /bin/bash
$ make start-attached-bash-mythril
# Start the dockerized setup and start ganache-cli
$ make start-ganache-cli-oyente
# Or
$ make start-ganache-cli-mythril
# Attach /bin/bash when setup is started
$ make attach-bash-oyente
# Or
$ make attach-bash-mythril
# Stop the dockerized setup
$ make stop
```
