FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y nginx

COPY ./site /var/www/static_site
COPY ./conf/static_site.conf /etc/nginx/sites-available/default

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]