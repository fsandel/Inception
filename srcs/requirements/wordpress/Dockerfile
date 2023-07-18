FROM debian:12.0
LABEL maintainer="fsandel@student.42heilbronn.de"

RUN apt update && apt upgrade -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install curl -y

RUN apt install bash

COPY ./tools/wordpress_setup.sh /var/tmp
RUN chmod +x /var/tmp/wordpress_setup.sh
ENTRYPOINT [ "/var/tmp/wordpress_setup.sh" ]

COPY ./conf/www.conf /etc/php/7.3/fmp/pool.de

RUN mkdir -p /run/php

EXPOSE 9000
CMD ["/usr/sbin/php7.3", "-F"]