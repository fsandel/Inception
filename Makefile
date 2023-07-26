ENV = ./srcs/.env
DATABASE = ./data

all: $(ENV) $(DATABASE) up

up:
	docker-compose -f srcs/docker-compose.yml up -d --build

re:
	-make down
	-make all

$(ENV):
	./srcs/requirements/tools/create_env.sh

down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	-docker-compose -f srcs/docker-compose.yml down --volumes --rmi all
	-sudo rm -rf data/*/*
	-sudo rm -rf data/*
	-sudo rm -rf data
	
fclean:
	-docker-compose -f srcs/docker-compose.yml down --volumes --rmi all
	-docker system prune -af --volumes
	-docker volume rm -f $(shell docker volume ls -q)
	-docker network rm $(shell docker network ls -q)
	-sudo rm -rf data/*/*
	-sudo rm -rf data/*
	-sudo rm -rf data

kill_all:
	docker kill $(shell docker ps -q)

$(DATABASE):
	mkdir -p /home/fsandel/data/wordpress_database
	mkdir -p /home/fsandel/data/wordpress_website_files
	mkdir -p data
	ln -s /home/fsandel/data/wordpress_database data/wordpress_database
	ln -s /home/fsandel/data/wordpress_website_files data/wordpress_website_files
