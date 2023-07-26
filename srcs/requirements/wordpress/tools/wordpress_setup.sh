#!/bin/bash

executable() {
    # /bin/bash
    php-fpm8.2 -F -R
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
    rm -rf latest.tar.gz wordpress

    /wordpress_config_setup.sh

    while true; do
        if wp core install \
            --url="$DOMAIN_NAME" \
            --title="$WEBSITE_TITLE" \
            --admin_user="$USER_NAME" \
            --admin_password="$USER_PASSWORD" \
            --admin_email="$WEBSITE_EMAIL" \
            --allow-root; then
            break  
        else
            echo "Installation failed, retrying..."
            sleep 1
        fi
    done

    wp user create $PLEB_NAME $PLEB_EMAIL --user_pass=$PLEB_PASSWORD --allow-root

    executable
fi
