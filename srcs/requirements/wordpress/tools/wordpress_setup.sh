#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html
rm -rf /var/www/html/*

wget http://wordpress.org/latest.tar.gz
tar xfz latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

php -S 0.0.0.0:9000 -t .