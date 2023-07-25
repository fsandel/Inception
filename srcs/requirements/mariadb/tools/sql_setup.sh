#!/bin/bash

echo "CREATE DATABASE $MYSQL_DATABASE;"                                          > /conf.sql
echo "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"    >> /conf.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'localhost';"   >> /conf.sql
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"            >> /conf.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'%';"           >> /conf.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED by '$MYSQL_ROOT_PASSWORD';"       >> /conf.sql
echo "FLUSH PRIVILEGES;"                                                         >> /conf.sql
