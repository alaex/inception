#! /bin/sh

echo "bind-address = mariadb" >> /etc/mysql/mariadb.conf.d/50-server.cnf

mysqld_safe &

sleep 6

mariadb -u root -p"$ROOT_PASSWORD_DB" <<SQL
CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
CREATE USER 'root'@'%' IDENTIFIED BY '$ROOT_PASSWORD_DB';
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$MYSQL_USER'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
SQL

mariadb-admin -u root -p"$ROOT_PASSWORD_DB" shutdown

mysqld_safe
