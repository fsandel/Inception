ENV = ./srcs/.env
DATABASE = ./data

all: $(ENV) $(DATABASE) up

up:
	docker-compose -f srcs/docker-compose.yml up -d --build

re:
	-make down
	-make all

datare:
	-make down
	-make remove_volumes
	-make prep_volumes
	-make up

down:
	docker-compose -f srcs/docker-compose.yml down

clean:
	-docker-compose -f srcs/docker-compose.yml down --volumes --rmi all
	-make -i remove_volumes

fclean:
	-docker-compose -f srcs/docker-compose.yml down --volumes --rmi all
	-docker system prune -af --volumes
	-docker volume rm -f $(shell docker volume ls -q)
	-docker network rm $(shell docker network ls -q)
	-make -i remove_volumes

evalclean:
	docker stop $(shell docker ps -qa); \
	docker rm $(shell docker ps -qa); \
	docker rmi -f $(shell docker images -qa); \
	docker volume rm $(shell docker volume ls -q); \
	docker network rm $(shell docker network ls -q) 2>/dev/null

remove_volumes:
	-sudo rm -rf data/*/*
	-sudo rm -rf data/*
	-sudo rm -rf data
	-sudo rm -rf ~/data

kill_all:
	docker kill $(shell docker ps -q)

prep_volumes: $(DATABASE)

$(DATABASE):
	mkdir -p /home/fsandel/data/wordpress_database
	mkdir -p /home/fsandel/data/wordpress_website_files
	ln -s /home/fsandel/data data

$(ENV):
	./srcs/requirements/tools/create_env.sh
