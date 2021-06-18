FROM alpine:3.12.7

COPY . /srcs

RUN apk update

RUN apk add nginx

RUN mkdir -p /run/nginx

RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.orig && mv /srcs/default.conf /etc/nginx/conf.d/default.conf 
#RUN mv /srcs/index.html /var/www/index.html && mv /srcs/index.php /var/www/index.php

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 80
