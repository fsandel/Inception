#!/bin/bash

sed -i "s/username_here/$USER_NAME/" /var/www/html/wp-config-sample.php
sed -i "s/password_here/$USER_PASSWORD/" /var/www/html/wp-config-sample.php
sed -i "s/database_name_here/$DATABASE/" /var/www/html/wp-config-sample.php
sed -i "s/localhost/mariadb/" /var/www/html/wp-config-sample.php

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
