#!/bin/bash
#sleep 10

if [ -e wp-config.sh ]
then
	echo "wp-config.sh already exists"
else
	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb:3306 --path='/var/www/wordpress'

	wp core install 
	wp user create 
fi
