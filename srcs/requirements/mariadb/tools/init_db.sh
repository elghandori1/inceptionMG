#!/bin/bash

service mariadb start

sleep 2

echo "CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;" | mariadb
echo "CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';" | mariadb
echo "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER';" | mariadb
echo "FLUSH PRIVILEGES;" | mariadb

service mariadb stop

exec mariadbd