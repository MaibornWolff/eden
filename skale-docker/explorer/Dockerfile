FROM node:14-alpine

RUN apk add --update git

RUN git clone https://github.com/skalenetwork/skale-demo.git /opt/skale-demo

WORKDIR /opt/skale-demo/block-explorer
RUN git checkout d47fd33

RUN npm install

CMD npm start

EXPOSE 3000
