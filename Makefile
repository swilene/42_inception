FILE = srcs/docker-compose.yml

build:
	mkdir -p data
	mkdir -p data/mariadb
	mkdir -p data/wordpress
	docker compose -f $(FILE) up --build -d

stop:
	docker-compose -f $(FILE) stop

clean: stop
	docker container prune -f
	sudo rm -rf data/mariadb/*
	sudo rm -rf data/wordpress/*

.PHONY: build stop clean
