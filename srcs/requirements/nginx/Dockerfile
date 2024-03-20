FROM	debian:bullseye

RUN		apt-get update -y
RUN		apt-get upgrade -y
RUN     apt autoremove --yes
RUN     apt clean autoclean

RUN		DEBIAN_FRONTEND=noninteractive apt-get install nginx -y

RUN		mkdir -p /etc/nginx/ssl
RUN		apt-get install -y openssl

RUN 	openssl req -x509 \
                -nodes \
                -out /etc/nginx/ssl/ssl_certificate.crt \
                -keyout /etc/nginx/ssl/ssl_certificate_key.key \
                -subj "/C=FR/ST=IDF/L=Lyon/O=42/OU=42/CN=maujogue.42.fr/UID=maujogue"

RUN		mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN		chmod 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

EXPOSE 	443

CMD 	["nginx"]
