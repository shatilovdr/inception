#/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048\
    -keyout ./nginx.key\
    -out ./nginx.crt \
    -subj "/C=FI/L=Helsinki/O=Hive/CN=shatilovdr.42.fr"
