#!/bin/bash

if test -f "/var/www/html/wp-config.php"; then
    exit 0
fi

mkdir -p /var/www/html
cd /var/www/html
rm -rf /var/www/html/*

wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

/wordpress_config_setup.sh

php -S 0.0.0.0:9000 -t .
