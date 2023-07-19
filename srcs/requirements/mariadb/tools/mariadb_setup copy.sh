#!/bin/bash

mysql_install_db

/etc/init.d/mysql start

mysql_secure_installation << EOF

Y
root4life
root4life
Y
n
Y
Y
EOF

mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

/etc/init.d/mysql stop

