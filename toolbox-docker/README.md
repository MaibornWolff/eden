# Dockerized toolbox for smart contract and dApp development

Dockerized toolboxes with various pre-configured tools, e.g. **n** for node versions, **ganache-cli** as testrpc, **solcjs** and **solc**, **truffle** as dApp development suite (alternatively, use **hardhat** as project dependency), **oyente** and **smartcheck** for solc <= v0.4.21 and **mythril** and **smartcheck** for solc <= latest as smart contract analyzer. Additionally, it comes with various tools, such as **@0x/abi-gen**, **solhint**, **solidity-docgen** and **solgraph**.
The `volume` directory is shared with the toolbox containers. Simply, create a project locally in `volume` in order to evaluate, test and develop the project with the two toolboxes.

## Quick start

Setting up this dockerized toolboxes requires you to install Docker and Docker Compose. Clone the repository and use Makefile commands from this directory.

```bash
# Start the toolbox setup
make start
# Stop the toolbox setup
$ make stop
# Restart the toolbox setup
$ make restart
```

For solc <= v0.4.21 with oyente python scripts and smartcheck as smart contract analyzer use the following commands.

```bash
# Attach to /bin/bash when setup is started
$ make attach-bash-oyente

# Start the setup and attach directly to /bin/bash for toolbox with oyente and smartcheck
$ make start-attached-bash-oyente
# Start the setup and start ganache-cli for toolbox with oyente and smartcheck
$ make start-ganache-cli-oyente
```

For solc > v0.4.21 with mythril and smartcheck as smart contract analyzer use the following commands.

```bash
# Attach to /bin/bash when setup is started
$ make attach-bash-mythril

# Start the setup and attach directly to /bin/bash for toolbox with mythril and smartcheck
$ make start-attached-bash-mythril
# Start the setup and start ganache-cli for toolbox with mythril and smartcheck
$ make start-ganache-cli-mythril
```
