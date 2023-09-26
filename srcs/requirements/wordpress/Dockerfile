FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget -y # programme de telechargement de fichiers depuis le web -> Wordpress s'installe par un lien de telechargement donc il faut d'abord installer wget pour telecharger Wordpress
RUN apt-get install -y php7.4 php-fpm php-mysql mariadb-client # installer php version 7.4 celle supportee par bullseye et des dependances
RUN wget https://fr.wordpress.org/wordpress-6.3-fr_FR.tar.gz -P /var/www # telecharger la derniere version de Wordpress dans le dossier (-P) /var/www, celui indique dans le container NGINX

RUN cd /var/www && tar xzf wordpress-6.3-fr_FR.tar.gz && rm wordpress-6.3-fr_FR.tar.gz
# aller dans le dossier /var/www
# decompresser le dossier Wordpress que nous venons de telecharger et obtenir le dossier wordpress
# supprimer le dossier .tar car il ne nous servira plus

#RUN chown -R root:root /var/www/wordpress # changer le proprietaire de wordpress pour que root ait les droits d'ecriture dans le fichier

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh /auto_config.sh
CMD [ "bash", "auto_config.sh" ]
