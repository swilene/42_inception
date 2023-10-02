FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install wget -y # programme de telechargement de fichiers depuis le web -> Wordpress s'installe par un lien de telechargement donc il faut d'abord installer wget pour telecharger Wordpress
RUN apt-get install -y php-phar php7.4 php-fpm php-mysql mariadb-client # installer php version 7.4 celle supportee par bullseye et des dependances
RUN mkdir -p /var/www/html

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh /auto_config.sh
CMD [ "bash", "auto_config.sh" ]
