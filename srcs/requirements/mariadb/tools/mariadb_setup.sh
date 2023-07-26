#!/bin/bash

executable() {
    # /bin/bash
    mariadbd -u root --bind-address=0.0.0.0
}

if test -f "/conf.sql"; then
    executable
else
    /sql_setup.sh

    service mariadb start
    mariadb -u root < /conf.sql
    service mariadb stop

    executable
fi
