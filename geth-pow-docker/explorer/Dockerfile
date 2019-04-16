FROM node:8-alpine

WORKDIR /app

RUN apk add --update git python make g++
RUN git clone --depth=1 https://github.com/gobitfly/etherchain-light --recursive .

RUN npm install
COPY config.js .

EXPOSE 3000

CMD [ "npm", "start" ]
