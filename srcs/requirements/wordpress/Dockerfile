FROM debian:12.0

LABEL maintainer="fsandel@student.42heilbronn.de"
LABEL version="1.0"
LABEL description="WordPress Server"

RUN apt update && apt upgrade -y
RUN apt install php -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install curl -y
RUN apt install wget -y

COPY ./tools/wordpress_setup.sh /
RUN chmod +x /wordpress_setup.sh

COPY ./conf/www.conf /etc/php/7.3/fmp/pool.de

RUN mkdir -p /run/php

EXPOSE 9000
#CMD ["php", "-S", "0.0.0.0:80", "-t", "."]
# CMD [ "/bin/bash" ]
CMD [ "/wordpress_setup.sh" ]
