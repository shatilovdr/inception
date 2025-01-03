#!/bin/sh

sleep 5
until mysql -h mariadb -u "$DB_USER" -p"$DB_PASSWORD" -e "SHOW DATABASES;"; do
    echo "Waiting for MariaDB..."
    sleep 5
done

if [ ! -f "/var/www/html/wp-config.php" ]; then
    echo "Configuring WordPress..."

    wp core config --dbhost=${DB_HOSTNAME} --dbname=${DB_NAME} --dbuser=${DB_USER} --dbpass=${DB_PASSWORD} --allow-root
    if [ $? -ne 0 ]; then
        echo "Error: Failed to configure WordPress. Exiting."
        exit 1
    fi

    wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root
    if [ $? -ne 0 ]; then
        echo "Error: Failed to configure WordPress. Exiting."
        exit 1
    fi

    wp user create ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_USER_PASSWORD} --allow-root
    if [ $? -ne 0 ]; then
        echo "Error: Failed to configure WordPress. Exiting."
        exit 1
    fi

    wp theme install generatepress --activate --allow-root
    
fi

echo "Starting PHP-FPM..."
exec php-fpm83 --nodaemonize