FROM debian:bullseye

RUN apt-get update -y
# RUN mkdir -p /var/www/wordpress && chmod -R 755 /var/www/wordpress
RUN apt-get install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/L=KH/O=1337/OU=student/CN=aen-nass@42.ma"

COPY config/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
