FROM ubuntu:focal

RUN apt-get update \
    && apt-get install -y \
      software-properties-common curl

# Install solc
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get update \
    && apt-get install -y solc

# Install mythril
RUN apt install -y libssl-dev python3-dev python3-pip
RUN pip3 install mythril

# Install node.js, but manage version via n
RUN apt-get update \
    && apt-get install -y \
      nodejs npm

# n is node.js version management
RUN npm install -g n
RUN n stable

# Install solcjs
RUN npm install -g solc

# testrpc, now ganache-cli
RUN npm install -g ganache-cli

RUN npm install -g truffle
# Hardhat is used as local dependency, e.g in your local project run npm install --save-dev harthat

# @0x/abi-gen enables the generation of TypeScript or Python contract wrappers from ABI files
RUN npm install -g @0x/abi-gen

# smartCheck is an extensible static analysis tool for discovering vulnerabilities and other code issues in Ethereum smart contracts written in the Solidity programming language.
# e.g. smartcheck -p .
RUN npm install -g @smartdec/smartcheck

# solgraph generating DOT graph that visualizes function control flow of a Solidity contract
# e.g. solgraph MyContract.sol > MyContract.dot
RUN npm install -g solgraph --unsafe-perm=true --allow-root

# solhint is a solidity linter
RUN npm install -g solhint

# solidity-docgen is used to generate documentation from solidity files
RUN npm install -g solidity-docgen
