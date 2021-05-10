.PHONY: build build-no-cache clean clean-data logs reset restart start start-attached stop

build:
	docker-compose build

build-no-cache:
	docker-compose build --no-cache

clean: clean-data
	docker-compose down --rmi all --volumes --remove-orphans

clean-data:
	rm -rf ./data

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
