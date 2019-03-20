FROM node:9-alpine
WORKDIR /app

RUN apk add --no-cache --virtual .gyp \
    python \
    make \
    g++ \
    git

RUN npm install -g bower
RUN git clone https://github.com/appliedblockchain/explorer.git .
COPY config.js .
RUN npm install
RUN bower install --allow-root

EXPOSE 3000

CMD npm run start
