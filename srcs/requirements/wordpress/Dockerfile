FROM alpine:3.20

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        php83 \
        php83-fpm \
        php83-phar \
        php83-mysqli \
        php83-curl \
        php83-mbstring \
        php83-tokenizer \
        php83-iconv \
        mariadb-client


COPY conf /etc/php83/php-fpm.d

WORKDIR /var/www/html
ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar .
COPY tools .
RUN ./install.sh 

EXPOSE 9000

ENTRYPOINT [ "sh", "entrypoint.sh" ]    