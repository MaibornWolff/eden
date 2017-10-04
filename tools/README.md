GET STARTED:

1. Build the docker container using:

user$   docker-compose build


2. Start the container and attach to its console whith:

user$   docker-compose up -d && docker attach tools



CONTENTS:

1. truffle

The "volume" folder is shared with the container and we can use

~/volume#   mkdir my_project && cd my_project
~/volume#   truffle init

to make a new project that will also show up on our local environment.


2. oyente

We can use the oyente.py script to check our smart contract for common mistakes and bugs

oyente/oyente#   python oyente.py -s ~/volume/contracts/example.sol


3. testrpc

testrpc is also installed, learn how to use it at:

https://github.com/ethereumjs/testrpc

port is mapped to 8546, not 8545 to avoid interference with 'ethereum-docker' testnet


4. string utils

the string utils can be found at ~/volume/contracts/strings.sol
