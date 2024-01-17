FROM	debian:bullseye

RUN		apt update -y
RUN		apt upgrade -y

RUN 	apt-get -y install wget
RUN 	apt-get install -y php7.4
RUN 	apt-get install -y php-fpm
RUN 	apt-get install -y php-mysql
RUN 	apt-get install -y mariadb-client
RUN 	rm -rf /var/lib/apt/lists/*

COPY 	conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN 	wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
RUN 	chmod +x wp-cli-2.7.0.phar
RUN		chown -R root:root wp-cli-2.7.0.phar
RUN 	mv wp-cli-2.7.0.phar /usr/local/bin/wp

COPY 	tools/config.sh /var/

EXPOSE	9000

CMD ["bash", "/var/config.sh"]