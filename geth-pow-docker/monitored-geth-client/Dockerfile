FROM alpine:latest

RUN apk add --update git go make gcc musl-dev linux-headers bash pwgen
RUN git clone https://github.com/ethereum/go-ethereum.git

RUN \
  (cd go-ethereum && make geth && make swarm)             && \
  cp go-ethereum/build/bin/geth /usr/local/bin/           && \
  cp go-ethereum/build/bin/swarm /usr/local/bin/           && \
  apk del git go make gcc musl-dev linux-headers          && \
  rm -rf /go-ethereum && rm -rf /var/cache/apk/*

RUN apk update &&\
    apk add git nodejs-npm bash perl

RUN cd /root &&\
    git clone https://github.com/cubedro/eth-net-intelligence-api &&\
    cd eth-net-intelligence-api &&\
    npm install &&\
    npm install -g pm2

COPY start.sh /root/start.sh
COPY app.json /root/eth-net-intelligence-api/app.json
RUN chmod +x /root/start.sh

# copy existing BC state to the nodes, so swarm ENS address is always the same
COPY devchain /root/.ethereum/devchain
