FROM alpine:3.12.7

COPY . /srcs

RUN apk update

RUN apk add mariadb mariadb-client

RUN mkdir /run/mysqld && chown mysql /run/mysqld

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

RUN chown mysql /var/lib/mysql

RUN sed -i "s|.*skip-networking.*|skip-networking = false|g" /etc/my.cnf.d/mariadb-server.cnf && sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

RUN mysqld -umysql &\
    sleep 5 && \ 
    echo "CREATE DATABASE wp_db;" | mysql &&\
    echo "CREATE USER 'username'@'%' IDENTIFIED BY 'userpasss';" | mysql &&\
    echo "GRANT ALL PRIVILEGES ON wp_db.* TO 'username'@'%';" | mysql &&\
    echo "FLUSH PRIVILEGES;" | mysql

CMD ["mysqld", "--user=mysql"]




