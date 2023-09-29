#!/bin/bash
sleep 15
if [ ! -f "/var/www/html/wp-config.php" ]
then
	wp core download --path=/var/www/html --allow-root

	cd /var/www/html
	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 --path='/var/www/html'

	wp core install --title=$WP_TITLE \
		--admin_user=$ADMIN \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL \
		--url=$WP_URL --allow-root --skip-email


	wp user create --allow-root $USER_LOGIN $USER_EMAIL --user_pass=$USER_PASSWORD --role='author'
fi

if [ ! -d "/run/php" ]
then
	mkdir /run/php
fi

#tail -f

exec /usr/sbin/php-fpm7.4 -F
