FROM debian:bullseye

RUN apt-get update -y &&\
    apt-get install -y curl php7.4 php7.4-mysql php7.4-curl php7.4-fpm mariadb-client php7.4-redis

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php && \
    sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

COPY conf/configrun.sh /usr/local/bin/configrun.sh
RUN chmod +x /usr/local/bin/configrun.sh && \
    mkdir -p /var/www/html && \
    chmod -R 755 /var/www/html

EXPOSE 9000

CMD ["/usr/local/bin/configrun.sh"]