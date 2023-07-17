all:
	make build_nginx
	make run_nginx

fclean:
	docker system prune -a

build_nginx:
	docker build --tag nginx --file srcs/requirements/nginx/Dockerfile .

run_nginx:
	docker rm nginx; docker run -d -p 443:443 --name nginx nginx