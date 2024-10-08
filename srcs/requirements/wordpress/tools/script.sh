#!/bin/bash

sleep 20
# sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf
# sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|' /etc/php/7.4/fpm/pool.d/www.conf

wp core download --allow-root --path='/var/www/wordpress' || echo "Error download wp core"

wp config create --allow-root \
	--dbname=$DATABASE_NAME \
	--dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD \
	--dbhost=$DB_HOSTNAME \
	--path=$WP_PATH \
|| echo "Error creating wp-config.php"

wp core install --allow-root \
	--url=$WORDPRESS_URL \
	--title=$WORDPRESS_TITLE \
	--admin_user=$WORDPRESS_ADMIN \
	--admin_password=$WORDPRESS_ADMIN_PASSWORD \
	--admin_email=$WORDPRESS_ADMIN_EMAIL \
	--path=$WP_PATH \
|| echo "Error installing WordPress";

wp user create --allow-root $WORDPRESS_USER $WORDPRESS_USER_EMAIL \
    --user_pass=$WORDPRESS_USER_PASSWORD \
    --role=author --path=$WP_PATH || echo "error 3"

exec php-fpm7.4 -F
