FROM alpine:3.20

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    	nginx \
    	openssl

COPY conf /etc/nginx/http.d      
COPY tools .

ENTRYPOINT [ "sh", "entrypoint.sh" ]