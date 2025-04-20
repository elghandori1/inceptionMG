FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN rm -f /etc/nginx/sites-enabled/default
COPY ./conf/nginx.conf /etc/nginx/sites-enabled/nginx.conf
RUN chmod 644 /etc/nginx/sites-enabled/nginx.conf

COPY ./tools/certif.sh /usr/local/bin/certif.sh
RUN chmod +x /usr/local/bin/certif.sh

EXPOSE 443

CMD ["/usr/local/bin/certif.sh"]