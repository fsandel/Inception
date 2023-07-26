#!/bin/bash

rm -f /conf.sql
touch /conf.sql

echo >> /conf.sql "CREATE DATABASE $DATABASE_NAME;"
echo >> /conf.sql "CREATE USER '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
echo >> /conf.sql "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* to '$DB_USER_NAME'@'%';"
echo >> /conf.sql "CREATE USER '$DB_USER_NAME'@'localhost' IDENTIFIED BY '$DB_USER_PASSWORD';"
echo >> /conf.sql "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* to '$DB_USER_NAME'@'localhost';"
echo >> /conf.sql "ALTER USER 'root'@'localhost' IDENTIFIED by '$DB_ROOT_PASSWORD';"
echo >> /conf.sql "FLUSH PRIVILEGES;"
