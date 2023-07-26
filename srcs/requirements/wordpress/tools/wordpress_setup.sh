#!/bin/bash
# https://wp-cli.org/de/

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
            --url="fsandel.42.fr" \
            --title="my_inception_website" \
            --admin_user="$WP_ADMIN_NAME" \
            --admin_password="$WP_ADMIN_PASSWORD" \
            --admin_email="$WP_ADMIN_EMAIL" \
            --allow-root; then
            break  
        else
            echo 1>&2 "Installation failed, retrying..."
            sleep 1
        fi
    done

    wp user create $WP_USER_NAME \
                    $WP_USER_EMAIL \
                    --user_pass=$WP_USER_PASSWORD \
                    --allow-root

    executable
fi
