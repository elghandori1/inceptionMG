#!/bin/bash

mkdir -p /var/run/vsftpd/empty

useradd -m -d /var/www/html -s /bin/bash $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd

echo "$FTP_USER" > /etc/vsftpd.userlist

mkdir -p /var/www/html
chown -R $FTP_USER:$FTP_USER /var/www/html
chmod -R 755 /var/www/html

exec /usr/sbin/vsftpd /etc/vsftpd.conf