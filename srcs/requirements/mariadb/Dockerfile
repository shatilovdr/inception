FROM alpine:3.20

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    mariadb \
    mariadb-client

COPY conf /etc/my.cnf.d

COPY tools .
RUN ./install.sh 

EXPOSE 3306

ENTRYPOINT [ "sh", "entrypoint.sh" ]