#!/bin/sh

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

wp core download --path=/var/www --locale=fr_FR

wp config create --dbname=wp_db --dbuser=username --dbpass=userpass --dbhost=mariadb --path=/var/www/ --dbprefix=fyw43WP

wp core install --url="localhost" --title="Beau site" --admin_user="chief" --admin_password="chiefpass" --admin_email="chief@email.com" --path=/var/www/

wp user create membername member@email.com --role="author" --user_pass="memberpass" --path="/var/www"

exec "$@"
