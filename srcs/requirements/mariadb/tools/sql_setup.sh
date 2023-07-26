#!/bin/bash

rm -f /conf.sql
touch /conf.sql

echo >> /conf.sql "CREATE DATABASE $DATABASE;"
echo >> /conf.sql "CREATE USER '$USER_NAME'@'%' IDENTIFIED BY '$USER_PASSWORD';"
echo >> /conf.sql "GRANT ALL PRIVILEGES ON $DATABASE.* to '$USER_NAME'@'%';"
echo >> /conf.sql "CREATE USER '$USER_NAME'@'%localhost' IDENTIFIED BY '$USER_PASSWORD';"
echo >> /conf.sql "GRANT ALL PRIVILEGES ON $DATABASE.* to '$USER_NAME'@'localhost';"
echo >> /conf.sql "ALTER USER 'root'@'localhost' IDENTIFIED by '$ROOT_PASSWORD';"
echo >> /conf.sql "FLUSH PRIVILEGES;"
