FROM debian:12.0
LABEL maintainer="fsandel@student.42heilbronn.de"

RUN apt update && apt upgrade -y
RUN apt install -y mariadb-server

RUN apt install -y vim 


EXPOSE 3306

LABEL version="1.0"
LABEL description="MariaDB Server"


COPY ./tools/mariadb_setup.sh /
RUN chmod +x /mariadb_setup.sh

ENV MYSQL_ROOT_PASSWORD=rootpw
ENV MYSQL_DATABASE=database

COPY ./conf/conf.sql /
ENTRYPOINT [ "/mariadb_setup.sh" ]
# CMD ["/bin/bash"]