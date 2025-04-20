FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y vsftpd && \
    apt-get clean && \
    mkdir -p /var/run/vsftpd/empty

COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/setup_ftp.sh /usr/local/bin/setup_ftp.sh

RUN chmod +x /usr/local/bin/setup_ftp.sh

EXPOSE 21 20 21100-21110

CMD ["/usr/local/bin/setup_ftp.sh"]