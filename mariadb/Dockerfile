FROM debian:bullseye

RUN	apt update -y 
RUN	apt install mariadb-server -y

COPY ./script.sh /script.sh

CMD ["bash", "script.sh"]