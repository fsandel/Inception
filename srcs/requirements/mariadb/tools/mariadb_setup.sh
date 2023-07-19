#!/bin/bash

/sql_setup.sh

/etc/init.d/mariadb start < /conf.sql
/etc/init.d/mariadb stop

mariadbd -u root
