.PHONY: attach-bash build build-no-cache clean logs reset restart start start-attached start-attached-bash stop

attach-bash:
	docker attach toolbox

build:
	docker-compose build

build-no-cache:
	docker-compose build --no-cache

clean:
	docker-compose down --rmi all --volumes --remove-orphans

logs:
	docker-compose logs -f

reset: stop clean
	docker-compose up -d --build --force-recreate --remove-orphans

restart: stop start

start:
	docker-compose up -d --remove-orphans

start-attached:
	docker-compose up --remove-orphans

start-attached-bash: start attach-bash

start-ganache-cli: start
	docker exec -d toolbox ganache-cli --host 0.0.0.0 --port 8545 --gasLimit=0x1fffffffffffff --gasPrice=1024 --defaultBalanceEther 1000 --deterministic --mnemonic 'brick hollow kit person enjoy bitter soda situate next juice tape genuine'

stop:
	docker-compose down --volumes --remove-orphans
