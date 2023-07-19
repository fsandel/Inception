#!/bin/bash

echo "CREATE DATABASE $MYSQL_DATABASE IF NOT EXISTS;" > /conf.sql
echo "CREATE USER $MYSQL_USER IF NOT EXISTS IDENTIFIED BY $MYSQL_PASSWORD;" >> /conf.sql
echo "GRANT ALL PRIVILEGES ON database to '$MYSQL_USER'@'%'" >> /conf.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED by $MYSQL_ROOT_PASSWORD;" >> /conf.sql
echo "FLUSH PRIVILEGES;" >> /conf.sql
