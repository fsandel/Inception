#!/bin/bash

# mysql_install_db

/etc/init.d/mariadb start < /conf.sql
/etc/init.d/mariadb stop

mariadbd -u root

# /etc/init.d/mariadb stop
# /etc/init.d/mariadb start
