#!/bin/bash

write_variable() {
    echo -n "$1"=
    read VAR
    echo >> srcs/.env $1"="$VAR
}

rm -f srcs/.env
touch srcs/.env

write_variable "WP_ADMIN_NAME"
write_variable "WP_ADMIN_PASSWORD"
write_variable "WP_ADMIN_EMAIL"

echo >> srcs/.env ""

write_variable "WP_USER_NAME"
write_variable "WP_USER_PASSWORD"
write_variable "WP_USER_EMAIL"

echo >> srcs/.env ""

write_variable "DB_ROOT_PASSWORD"
write_variable "DB_USER_NAME"
write_variable "DB_USER_PASSWORD"
