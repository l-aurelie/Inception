FROM alpine:3.12.7

COPY . /srcs

RUN apk update

RUN apk add php-fpm

RUN mkdir /var/www

RUN sed -i 's/listen = 127\.0\.0\.1:9000/listen = 0\.0\.0\.0:9000/g' /etc/php7/php-fpm.d/www.conf

#RUN 


CMD ["php-fpm7", "-F"]



