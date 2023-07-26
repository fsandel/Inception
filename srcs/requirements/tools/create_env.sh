#!/bin/bash

write_variable() {
    echo -n "$1"=
    read VAR
    echo >> srcs/.env $1"="$VAR
}

rm -f srcs/.env
touch srcs/.env

write_variable "DOMAIN_NAME"
write_variable "HOSTNAME"
write_variable "WEBSITE_TITLE"
write_variable "WEBSITE_EMAIL"
write_variable "DATABASE"
write_variable "USER_NAME"
write_variable "USER_PASSWORD"
write_variable "ROOT_PASSWORD"
write_variable "PLEB_NAME"
write_variable "PLEB_PASSWORD"
write_variable "PLEB_EMAIL"