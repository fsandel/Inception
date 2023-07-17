all:
	make rm_nginx
	make build_nginx
	make run_nginx

fclean:
	docker system prune -a

build_nginx:
	docker build --tag nginx --file srcs/requirements/nginx/Dockerfile .

run_nginx:
	docker run -d -p 443:443 --name nginx -v ~/Inception/srcs/requirements/nginx/html:/usr/share/nginx/html nginx


rm_nginx:
	docker kill nginx; docker rm nginx