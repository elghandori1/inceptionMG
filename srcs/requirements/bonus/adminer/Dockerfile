FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y nginx php7.4 php7.4-mysql php7.4-fpm wget && \
    apt-get clean

RUN mkdir -p /run/php && \
    sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9001|' /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/adminer && \
    wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O /var/www/adminer/index.php && \
    chmod 644 /var/www/adminer/index.php

COPY conf/adminer.conf /etc/nginx/sites-enabled/adminer.conf

RUN chown -R www-data:www-data /var/www/adminer && \
    chmod -R 755 /var/www/adminer

EXPOSE 8081

CMD service php7.4-fpm start && nginx -g "daemon off;"