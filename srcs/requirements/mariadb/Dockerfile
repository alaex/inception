FROM debian:bullseye

RUN	apt update -y 
RUN apt upgrade -y
RUN	apt install mariadb-server -y

COPY ./tools/script.sh /script.sh

CMD ["bash", "script.sh"]