FILE = srcs/docker-compose.yml
HOME = /home/saguesse/

build:
	mkdir -p $(HOME)data
	mkdir -p $(HOME)data/mariadb
	mkdir -p $(HOME)data/wordpress
	docker compose -f $(FILE) up --build -d

stop:
	docker-compose -f $(FILE) stop

clean: stop
	docker container prune -f
	sudo rm -rf $(HOME)data/mariadb/*
	sudo rm -rf $(HOME)data/wordpress/*

.PHONY: build stop clean
