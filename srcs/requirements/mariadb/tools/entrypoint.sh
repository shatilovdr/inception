#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB system tables..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
fi

echo "Starting temporary MariaDB server..."
mysqld --datadir=/var/lib/mysql &

echo "Waiting for MariaDB to start..."
until mysqladmin ping --silent; do
    sleep 2
done

if ! mysql -u root -e "USE $DB_NAME;" 2>/dev/null; then
    echo "Creating WordPress database and user, and setting permissions..."
    mysql -u root --execute \
    "CREATE DATABASE IF NOT EXISTS $DB_NAME;
    CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
    GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
    FLUSH PRIVILEGES;"
else
    echo "WordPress database already exists. Skipping database setup."
fi

# Stop the temporary MariaDB server
echo "Shutting down temporary MariaDB server..."
mysqladmin -u root shutdown

# Start MariaDB server in foreground
echo "Starting MariaDB server in safe mode for regular use..."
exec mysqld --datadir=/var/lib/mysql
