FROM node:6.11-alpine

LABEL org.opencontainers.image.source https://github.com/maibornwolff/eden

WORKDIR "/opt"

RUN apk add --update git make g++ && \
    git clone https://bitbucket.org/designisdead/blockchain-explorer.git

WORKDIR "/opt/blockchain-explorer"
RUN git checkout c6e12f1
RUN npm install

CMD npm run start

EXPOSE 8080
