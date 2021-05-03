FROM ethereum/client-go:stable

LABEL org.opencontainers.image.source https://github.com/maibornwolff/eden

WORKDIR /root

COPY ./genesis.json ./start.sh ./.accountpassword ./.privatekey ./

RUN chmod +x ./start.sh

ENTRYPOINT ./start.sh
