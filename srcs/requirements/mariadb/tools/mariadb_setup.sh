#!/bin/bash

/sql_setup.sh

# sleep infinity

service mariadb start
mariadb -u root < /conf.sql
service mariadb stop

mariadbd -u root --bind-address=0.0.0.0
