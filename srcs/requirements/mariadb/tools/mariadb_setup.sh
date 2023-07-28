#!/bin/bash

/sql_setup.sh

service mariadb start
mariadb -u root < /conf.sql
mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown

mariadbd -u root --bind-address=0.0.0.0
