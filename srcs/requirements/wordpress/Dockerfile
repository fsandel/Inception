FROM debian:11.0

LABEL version="1.0"
LABEL maintainer="fsandel@student.42heilbronn.de"
LABEL description="WordPress Server"

RUN apt update && apt upgrade -y

ARG PHP_VERSION=7.4
ENV PHP_VERSION=${PHP_VERSION}

RUN apt install php${PHP_VERSION}-fpm \
                php${PHP_VERSION}-cli \
                php${PHP_VERSION}-common \
                php${PHP_VERSION}-mysql \
                php${PHP_VERSION}-mysqli \
                php${PHP_VERSION}-gd \
                php${PHP_VERSION}-curl \
                php${PHP_VERSION}-mbstring \
                php${PHP_VERSION}-xml -y

RUN apt install curl -y

COPY ./tools/wordpress_setup.sh /
RUN chmod +x /wordpress_setup.sh

RUN rm -f /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf
COPY ./conf/www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf

WORKDIR /var/www/html/

ENTRYPOINT ["/wordpress_setup.sh"]
