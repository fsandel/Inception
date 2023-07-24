all:
	make compose

re:
	make -i fclean
	make all

wordpress:
	make -i rm_wordpress
	make build_wordpress
	make run_wordpress

clean:
	make -i kill_all
	docker rm wordpress nginx mariadb
	docker rmi wordpress nginx mariadb
	sudo rm -rf wordpress_database/*
	sudo rm -rf wordpress_website_files/*
	
fclean:
	make -i kill_all
	docker system prune -af
	docker volume rm -f $(shell docker volume ls -q)
	sudo rm -rf wordpress_database/*
	sudo rm -rf wordpress_website_files/*

kill_all:
	docker kill $(shell docker ps -q)

build_nginx:
	docker build --tag nginx --file srcs/requirements/nginx/Dockerfile .

build_wordpress:
	docker build --tag wordpress --file srcs/requirements/wordpress/Dockerfile .

run_nginx:
	docker run -d -p 443:443 --name nginx nginx

run_wordpress:
	docker run -it --name wordpress wordpress

interactive:
	docker run -it -p 443:443 --name nginx -v ~/Inception/srcs/requirements/nginx/html:/usr/share/nginx/html -v ~/Inception/srcs/requirements/nginx/conf:/etc/nginx/conf.d nginx /bin/bash


rm_nginx:
	docker kill nginx; docker rm nginx

rm_wordpress:
	docker kill wordpress; docker rm wordpress; docker rmi wordpress

compose:
	docker-compose -f srcs/docker-compose.yml up -d --build

down:
	docker-compose -f srcs/docker-compose.yml down