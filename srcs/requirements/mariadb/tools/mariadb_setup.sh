#!/bin/bash

if test -f "/conf.sql"; then
    mariadbd -u root
else
    /sql_setup.sh

    /etc/init.d/mariadb start < /conf.sql
    /etc/init.d/mariadb stop

    mariadbd -u root
fi
