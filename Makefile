all:
	make compose

compose:
	docker-compose -f srcs/docker-compose.yml up -d --build

re:
	make -i fclean
	make all

clean:
	docker-compose -f srcs/docker-compose.yml down --volumes --rmi all
	sudo rm -rf wordpress_database/*
	sudo rm -rf wordpress_website_files/*
	
fclean:
	docker-compose -f srcs/docker-compose.yml down --volumes --rmi all
	docker system prune -af
	docker volume rm -f $(shell docker volume ls -q)
	docker network rm $(shell docker network ls -q)
	sudo rm -rf wordpress_database/*
	sudo rm -rf wordpress_website_files/*

kill_all:
	docker kill $(shell docker ps -q)
