FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb_config.sh /mariadb_config.sh

RUN chmod +x /mariadb_config.sh

CMD [ "bash", "mariadb_config.sh" ]
