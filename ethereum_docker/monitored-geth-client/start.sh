#!/bin/bash
set -e
cd /root/eth-net-intelligence-api
perl -pi -e "s/XXX/$(hostname)/g" app.json
/usr/bin/pm2 start ./app.json
sleep 3
geth --datadir=~/.ethereum/devchain init "/root/files/genesis.json"
sleep 3
BOOTSTRAP_IP=`getent hosts bootstrap | cut -d" " -f1`
GETH_OPTS=${@/XXX/$BOOTSTRAP_IP}
nohup geth $GETH_OPTS  >/root/geth.log 2>&1 &

sleep 3
echo "GETH started"
DATADIR="/root/.ethereum/devchain"
KEYS=`geth account list --datadir $DATADIR | sed "s/.*{\(.*\)}.*/\1/1"`
BZZKEY=$(echo $KEYS| cut -d' ' -f 1)

sleep 3
swarm --bzzaccount $BZZKEY \
       --datadir $DATADIR \
       --bzznetworkid 456719 \
       --keystore $DATADIR/keystore \
       --ens-api $DATADIR/geth.ipc \
       --httpaddr "0.0.0.0" \
       --bootnodes "enode://288b97262895b1c7ec61cf314c2e2004407d0a5dc77566877aad1f2a36659c8b698f4b56fd06c4a0c0bf007b4cfb3e7122d907da3b005fa90e724441902eb19e@$BOOTSTRAP_IP:30303" \
        < <(echo "")