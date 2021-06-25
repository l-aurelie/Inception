#!/bin/sh

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

wp core download --path=/var/www --locale=fr_FR

wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost=mariadb --path=/var/www/ --dbprefix=wp_

wp core install --url="aleconte.42.fr" --title="Beau site" --admin_user="$WP_ADMIN" --admin_password="$WP_ADPASS" --admin_email="$WP_ADMIN@email.com" --path=/var/www/

wp user create $WP_USER $WP_USER@email.com --role="author" --user_pass="$WP_USPASS" --path="/var/www"

exec "$@"
