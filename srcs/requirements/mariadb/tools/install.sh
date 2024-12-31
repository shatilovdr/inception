#!/bin/sh

mkdir -p /run/mysqld 
chown -R mysql:mysql /var/lib/mysql /run/mysqld

mariadb-install-db --user=mysql --datadir=/var/lib/mysq

rm -f install.sh