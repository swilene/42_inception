FROM debian:bullseye

#installation des paquets de base
RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install curl -y

#mise en place du TLS
RUN mkdir -p /etc/nginx/ssl #creation d'un dossier pour stocker le certificat et la clef pour une connexion securisee
RUN apt install openssl -y #installation d'OpenSSL, outil principal pour la gestion/creation de certificat SSL
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=saguesse.42.fr/UID=saguesse"
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
