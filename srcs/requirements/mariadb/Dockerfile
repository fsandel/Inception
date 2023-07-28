FROM debian:11.0

LABEL version="1.0"
LABEL maintainer="fsandel@student.42heilbronn.de"
LABEL description="MariaDB Server"

RUN apt update && apt upgrade -y

RUN apt install mariadb-server -y

COPY ./tools/mariadb_setup.sh /
RUN chmod +x /mariadb_setup.sh

COPY ./tools/sql_setup.sh /
RUN chmod +x /sql_setup.sh

RUN mkdir -p /etc/mysql
RUN rm -f /etc/mysql/my.cnf
COPY ./conf/my.cnf /etc/mysql/

ENTRYPOINT ["/mariadb_setup.sh"]
