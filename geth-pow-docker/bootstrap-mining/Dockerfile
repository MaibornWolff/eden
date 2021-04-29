FROM ethereum/client-go:stable

WORKDIR /root

COPY ./genesis.json ./start.sh ./.accountpassword ./.privatekey .

RUN chmod +x ./start.sh

ENTRYPOINT ./start.sh
