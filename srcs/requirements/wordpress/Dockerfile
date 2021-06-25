FROM alpine:3.12.7

COPY . /srcs

RUN apk update

RUN apk add php php7-fpm php7-mysqli php7-json php7-phar php7-iconv php7-mbstring mariadb-client

RUN mkdir -p /var/www

RUN sed -i 's/listen = 127\.0\.0\.1:9000/listen = 0\.0\.0\.0:9000/g' /etc/php7/php-fpm.d/www.conf

ENTRYPOINT ["sh", "/srcs/init-wp.sh"]

CMD ["php-fpm7", "-F"]

EXPOSE 9000
