#!/bin/bash

sed -i "s/username_here/$MYSQL_USER/" /var/www/html/wp-config-sample.php
sed -i "s/password_here/$MYSQL_PASSWORD/" /var/www/html/wp-config-sample.php
sed -i "s/database_name_here/$MYSQL_DATABASE/" /var/www/html/wp-config-sample.php
sed -i "s/localhost/$HOSTNAME/" /var/www/html/wp-config-sample.php

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
