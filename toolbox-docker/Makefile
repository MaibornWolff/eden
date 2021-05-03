.PHONY: attach-bash-oyente attach-bash-mythril build build-no-cache clean logs reset restart start start-attached start-attached-bash-oyente start-attached-bash-mythril start-ganache-cli-oyente start-ganache-cli-mythril stop

attach-bash-oyente:
	docker attach toolbox-oyente

attach-bash-mythril:
	docker attach toolbox-mythril

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

start-attached-bash-oyente: start attach-bash-oyente

start-attached-bash-mythril: start attach-bash-mythril

start-ganache-cli-oyente: start
	docker exec -d toolbox-oyente ganache-cli --host 0.0.0.0 --port 8545 --gasLimit=0x1fffffffffffff --gasPrice=1024 --defaultBalanceEther 1000 --deterministic --mnemonic 'brick hollow kit person enjoy bitter soda situate next juice tape genuine'

start-ganache-cli-mythril: start
	docker exec -d toolbox-mythril ganache-cli --host 0.0.0.0 --port 8545 --gasLimit=0x1fffffffffffff --gasPrice=1024 --defaultBalanceEther 1000 --deterministic --mnemonic 'brick hollow kit person enjoy bitter soda situate next juice tape genuine'

stop:
	docker-compose down --volumes --remove-orphans
