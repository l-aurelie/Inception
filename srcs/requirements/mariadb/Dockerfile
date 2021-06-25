FROM alpine:3.12.7


COPY . /srcs

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG ROOT_PASS

RUN apk update

RUN apk add mariadb mariadb-client

RUN mkdir /run/mysqld && chown mysql /run/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal

#RUN chown mysql /var/lib/mysql

RUN sed -i "s|.*skip-networking.*|skip-networking = false|g" /etc/my.cnf.d/mariadb-server.cnf && sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

RUN mysqld -umysql &\
    sleep 5 && \ 
    echo "CREATE DATABASE wp_db;" | mysql &&\
    echo "CREATE USER 'username'@'%' IDENTIFIED BY '$DB_PASS';" | mysql &&\
    echo "GRANT ALL PRIVILEGES ON wp_db.* TO 'username'@'%';" | mysql &&\
    echo "FLUSH PRIVILEGES;" | mysql &&\
    echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$ROOT_PASS');" | mysql
CMD ["mysqld", "--user=mysql"]

EXPOSE 3306


