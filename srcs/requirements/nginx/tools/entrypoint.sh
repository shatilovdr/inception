#!/bin/sh

if [ ! -f "/etc/ssl/certs/nginx.crt" ] || [ ! -f "/etc/ssl/private/nginx.key" ]; then
    echo "SSL certificate or key not found. Generating new certificate..."
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/nginx.key \
        -out /etc/ssl/certs/nginx.crt \
        -subj "/C=FI/L=Helsinki/O=Hive/CN=dshatilo.42.fr"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to generate SSL certificate. Exiting."
        exit 1
    fi
    echo "SSL certificate and key successfully generated."
else
    echo "SSL certificate and key already exist. Skipping generation."
fi

echo "Starting NGINX..."
exec nginx -g "daemon off;"