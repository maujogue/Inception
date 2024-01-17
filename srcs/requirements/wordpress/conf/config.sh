#!/bin/bash

sleep 10

wp core download --allow-root

if [ ! -f "${WP_PATH}/wp-config.php" ]; then

  wp core download --path=$WP_PATH --allow-root

  wp config create --allow-root \
  			  --dbname=$SQL_DATABASE \
              --dbuser=$SQL_USER \
              --dbpass=$SQL_PASSWORD \
              --dbhost=mariadb:3306 \
              --path=$WP_PATH

  wp core install --url="${WP_URL}" \
              --title="${WP_TITLE}" \
              --admin_user="${WP_ADMIN_USER}" \
              --admin_password="${WP_ADMIN_PASSWORD}" \
              --admin_email="${WP_ADMIN_EMAIL}" \
              --allow-root \
              --path=$WP_PATH

  wp user create $WP_USER $WP_USER_EMAIL \
              --allow-root \
              --path=$WP_PATH

fi

mkdir -p /run/php
php-fpm7.4 -F