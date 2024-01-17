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
                -subj "/C=FR/ST=IDF/L=Lyon/O=42/OU=42/CN=lboulatr.42.fr/UID=lboulatr"

RUN		mkdir -p /var/run/nginx

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN		chmod 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

EXPOSE 	443

CMD 	["nginx"]




# Nous rajouterons ensuite le mot clef -x509 pour préciser le type du certificat.
#    openssl req -x509
# Maintenant si nous créons notre certificat, OpenSSL nous demandera un mot de passe, et souvenez vous, si on demande quelque chose à saisir dans le démarrage du container, celui-ci ne va pas pouvoir se build. Il faut donc éviter cela à tout prix !
# Heureusement, OpenSSL a prévu le coup, avec l’option -nodes, notre clef privée se retrouvera simplement sans mot de passe.
#    openssl req -x509 -nodes
# Il faut ensuite indiquer à OpenSSL où l’on souhaite stocker le certificat et la clef de notre SSL en rajoutant les options -out et -keyout
#    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key
# Si nous lançons cette commande nous risquons d’avoir un prompt qui requiert certaines informations pour le certificat.
# Heureusement, OpenSSL a encore prévu le coup et nous permet de les préremplir en rajoutant une option appelé    -subj
#    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login" 