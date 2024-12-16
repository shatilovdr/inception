FROM alpine:3.20

RUN apk update && \
    apk upgrade

RUN apk add nginx \
            openssl

WORKDIR /nginx_42
COPY tools .
COPY conf /etc/nginx/http.d
RUN ./initscript.sh

ENTRYPOINT ["nginx", "-g", "daemon off;"]