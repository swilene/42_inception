#!/bin/bash

if [ -d "/var/lib/mysql/${MYSQL_DATABASE}" ]
then
	echo "${MYSQL_DATABASE} already exists"
else
	service mariadb start # demarrer MySQL
	sleep 5
	mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} ;" # creer une table si elle n'existe pas deja, du nom de la variable d'environnement MYSQL_DATABASE
	mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' ;" # creer un user qui pourra manipuler la base de donnees
	mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" # donner tous les droits a l'utilisateur
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
	sleep 5

fi
exec mysqld
