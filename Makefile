all:
	make -i rm_nginx
	make build_nginx
	make run_nginx

fclean:
	docker system prune -a

build_nginx:
	docker build --tag nginx --file srcs/requirements/nginx/Dockerfile .

run_nginx:
	docker run -d -p 443:443 --name nginx nginx

interactive:
	docker run -it -p 443:443 --name nginx -v ~/Inception/srcs/requirements/nginx/html:/usr/share/nginx/html -v ~/Inception/srcs/requirements/nginx/conf:/etc/nginx/conf.d nginx /bin/bash


rm_nginx:
	docker kill nginx; docker rm nginx