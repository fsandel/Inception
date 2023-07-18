all:
	make wordpress

#	make compose

wordpress:
	make -i rm_wordpress
	make build_wordpress
	make run_wordpress

fclean:
	docker system prune -a

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
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down