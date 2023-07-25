FROM debian:12.0

LABEL maintainer="fsandel@student.42heilbronn.de"
LABEL version="1.0"
LABEL description="WordPress Server"

RUN apt update && apt upgrade -y

RUN apt install php8.2-fpm \
                php8.2-cli \
                php8.2-common \
                php8.2-mysql \
                php8.2-mysqli \
                php8.2-gd \
                php8.2-curl \
                php8.2-mbstring \
                php8.2-xml -y

RUN apt install wget -y
RUN apt install curl -y

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY ./tools/wordpress_setup.sh /
RUN chmod +x /wordpress_setup.sh

COPY ./tools/wordpress_config_setup.sh /
RUN chmod +x /wordpress_config_setup.sh

RUN rm -rf /etc/php/8.2/fpm/pool.d/www.conf
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/wordpress_setup.sh"]
