FROM debian:12.0
LABEL maintainer="fsandel@student.42heilbronn.de"

RUN apt update && apt upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/fsandel.crt \ 
        -keyout /etc/nginx/ssl/fsandel.key \
        -subj "/C=DE/ST=Heilbronn/L=Heilbronn/O=42Heilbronn/OU=fsandel/CN=fsandel/"

RUN mkdir -p /run/nginx
COPY srcs/requirements/nginx/conf/nginx.conf /etc/nginx/conf.d/default.conf
COPY srcs/requirements/nginx/html/index.html /var/www/html
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]