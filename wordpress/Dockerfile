FROM debian:bullseye

RUN apt update && apt install php8.2 wget mariadb-client php-fpm php-mysql

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

COPY script.sh /script.sh

RUN chmod +x /script.sh

WORKDIR /run/php/wordpress

CMD ["bash", "script.sh"]