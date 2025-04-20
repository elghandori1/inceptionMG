FROM debian:bullseye

RUN apt-get update -y && \
	apt-get install -y mariadb-server

COPY conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf

COPY tools/init_db.sh /usr/local/bin/init_db.sh

RUN chmod +x /usr/local/bin/init_db.sh

EXPOSE 3306

CMD ["/usr/local/bin/init_db.sh"]
