#!/bin/bash

executable() {
    php-fpm8.2 -F -R
}

mkdir -p /var/www/html
cd /var/www/html
rm -rf /var/www/html/*

curl -o /usr/local/bin/wp -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x /usr/local/bin/wp

wp core download --allow-root

wp config create \
    --dbname="wordpress_database" \
    --dbuser="$DB_USER_NAME" \
    --dbpass="$DB_USER_PASSWORD" \
    --dbhost="mariadb" \
    --force \
    --skip-check \
    --allow-root

sleep 10

while ! wp core install \
        --url="fsandel.42.fr" \
        --title="my_inception_website" \
        --admin_user="$WP_ADMIN_NAME" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --allow-root
do
    echo 1>&2 "Wordpress: Waiting for database ..."
    sleep 1
done

wp user create $WP_USER_NAME \
                $WP_USER_EMAIL \
                --user_pass=$WP_USER_PASSWORD \
                --allow-root

executable
