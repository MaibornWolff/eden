.PHONY: build build-no-cache clean clean-schain-datadir copy-schain-config logs reset restart start start-attached stop

build: copy-schain-config
	docker-compose build

build-no-cache: copy-schain-config
	docker-compose build --no-cache

clean: clean-schain-datadir
	docker-compose down --rmi all --volumes --remove-orphans

clean-schain-datadir:
	rm -rf ./schain/data_dir && mkdir ./schain/data_dir

copy-schain-config:
	mkdir ./schain/data_dir && cp ./schain/config.json.in ./schain/data_dir/config.json

logs:
	docker-compose logs -f

reset: stop clean
	docker-compose up -d --build --force-recreate --remove-orphans

restart: stop start

start:
	docker-compose up -d --remove-orphans

start-attached:
	docker-compose up --remove-orphans

stop:
	docker-compose down --volumes --remove-orphans
