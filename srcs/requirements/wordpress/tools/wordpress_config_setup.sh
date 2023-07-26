#!/bin/bash

sed -i "s/username_here/$DB_USER_NAME/" /var/www/html/wp-config-sample.php
sed -i "s/password_here/$DB_USER_PASSWORD/" /var/www/html/wp-config-sample.php
sed -i "s/database_name_here/$DATABASE_NAME/" /var/www/html/wp-config-sample.php
sed -i "s/localhost/mariadb/" /var/www/html/wp-config-sample.php

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/" /etc/php/8.2/fpm/pool.d/www.conf
