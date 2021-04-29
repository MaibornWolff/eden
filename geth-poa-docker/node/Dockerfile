FROM ubuntu:xenial

RUN apt-get update \
    && apt-get install -y wget software-properties-common \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN add-apt-repository -y ppa:ethereum/ethereum

ARG binary
RUN apt-get update \
    && apt-get install -y ethereum

ARG password
ARG privatekey
RUN echo $password > ~/.accountpassword
RUN echo $privatekey > ~/.privatekey
ADD ./genesis.json ./genesis.json
RUN geth init genesis.json
RUN geth account import --password ~/.accountpassword  ~/.privatekey

ENV address=""
ENV bootnodeId=""
ENV bootnodeIp=""

CMD exec geth --bootnodes "enode://$bootnodeId@$bootnodeIp:30301" --networkid "6660001" --verbosity 4 --http --http.addr "0.0.0.0" --http.port 8545 --http.api "eth,web3,net,admin,debug,miner,personal" --http.corsdomain "*" --ws --ws.addr "0.0.0.0" --ws.port 8546 --ws.api "eth,web3,net,admin,debug,miner,personal" --ws.origins "*" --syncmode full --gcmode archive

EXPOSE 8545
EXPOSE 8546
EXPOSE 30303
