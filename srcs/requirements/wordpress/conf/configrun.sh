#!/bin/bash

sleep 5

cd /var/www/html
wp core download --allow-root
wp config create \
    --dbhost="$WORDPRESS_DB_HOST" \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD" \
    --allow-root

wp config set WP_CACHE true --allow-root
wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root

wp core install \
    --url="$DOMAIN_NAME" \
    --title="My_WordPress" \
    --admin_user="$WORDPRESS_ADMIN" \
    --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" \
    --allow-root

wp user create \
    "$WORDPRESS_USER" "$WORDPRESS_USER_EMAIL" \
    --user_pass="$WORDPRESS_USER_PASSWORD" \
    --allow-root
    
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

exec php-fpm7.4 -F