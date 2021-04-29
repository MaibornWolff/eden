FROM ethereum/client-go:stable

WORKDIR /root

COPY ./start.sh .
RUN chmod +x ./start.sh

COPY ./genesis.json .

ENTRYPOINT ./start.sh
