#!/bin/sh

adduser -S www-data -G www-data

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --allow-root

rm -f install.sh