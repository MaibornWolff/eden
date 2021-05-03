FROM ethereum/client-go:stable

LABEL org.opencontainers.image.source https://github.com/maibornwolff/eden

WORKDIR /root

COPY ./start.sh .
RUN chmod +x ./start.sh

COPY ./genesis.json .

ENTRYPOINT ./start.sh
