FROM debian:12.0

LABEL version="1.0"
LABEL maintainer="fsandel@student.42heilbronn.de"
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

RUN apt install curl -y

COPY ./tools/wordpress_setup.sh /
RUN chmod +x /wordpress_setup.sh

COPY ./tools/wordpress_config_setup.sh /
RUN chmod +x /wordpress_config_setup.sh

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/wordpress_setup.sh"]
