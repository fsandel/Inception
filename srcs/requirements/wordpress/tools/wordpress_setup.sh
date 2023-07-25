#!/bin/bash

executable() {
    # /bin/bash
    # php-fpm -F
    # php -S 0.0.0.0:9000 -t .
    php-fpm8.2 -F

}
if test -f "/var/www/html/wp-config.php"; then
    executable
else
    mkdir -p /var/www/html
    cd /var/www/html
    rm -rf /var/www/html/*

    wget http://wordpress.org/latest.tar.gz
    tar xfz latest.tar.gz
    mv wordpress/* .
    rm -rf latest.tar.gz
    rm -rf wordpress

    /wordpress_config_setup.sh

    wp core install \
        --url=$DOMAIN_NAME \
        --title=$TITLE \
        --admin_user=$MYSQL_USER \
        --admin_password=$MYSQL_PASSWORD \
        --admin_email=$EMAIL \
        --allow-root

    executable
fi
