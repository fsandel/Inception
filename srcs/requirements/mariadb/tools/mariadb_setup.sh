#!/bin/bash

executable() {
    # /bin/bash
    mariadbd -u root
    # /bin/bash

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
