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

Inside the oyente container and path `/oyente/oyente`, use the following commands for analysis. Contracts are placed at `/oyente/oyente/contracts`. Refer to oyente repository [here](https://github.com/enzymefinance/oyente).

```bash
# Evaluate a local solidity contract
$ python oyente.py -s <path/to/contract>
# E.g. run the following to analyze the example.sol contract
$ python oyente.py -s ./contracts/example.sol

# Evaluate a local solidity with option -a to verify assertions in the contract
$ python oyente.py -a -s <path/to/contract>

# Evaluate a local evm contract
$ python oyente.py -s <contract_filename> -b

# Evaluate a remote contract
$ python oyente.py -ru https://gist.githubusercontent.com/loiluu/d0eb34d473e421df12b38c12a7423a61/raw/2415b3fb782f5d286777e0bcebc57812ce3786da/puzzle.sol
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

Inside the mythril container, use the following commands for analysis. Refer to mythril and smartcheck repository [here](https://github.com/ConsenSys/mythril) and [here](https://github.com/enzymefinance/oyente).

```bash
# Check for mythril version
$ myth version
# Evaluate a local solidity contract
$ myth analyze <path/to/contract> --solv <solc-version>
# E.g. run the following to analyze the example2.sol contract
$ myth analyze ./root/volume/contracts/example2.sol

# Check for smartcheck version
$ smartcheck --version
# Evaluate local solidity contracts
$ smartcheck -p <path/to/contracts>
# E.g. run the following to analyze contracts in ./root/volume/contracts
$ smartcheck -p ./root/volume/contracts/
```
