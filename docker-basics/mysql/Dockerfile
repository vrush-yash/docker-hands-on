## INPUTS REQUIRED:
## 1. New user to connect to same database: MYSQL_USER
## 2. Password for new user to connect to same database: MYSQL_PASSWORD
## 3. MYSQL_ROOT_PASSWORD
## 4. MYSQL_DATABASE



# Using latest version of mysql server database
#FROM mysql:5.7.26
FROM mariadb:latest

#RUN apt update \
#   && apt install procps vim telnet net-tools -y

# Environment variable to capture username and password for new test database testDB
# Have provided default values which can be overridden by passing values to below mentioned
# environment variables while starting the container
ENV MYSQL_USER=test
ENV MYSQL_PASSWORD=mysql123
ENV MYSQL_ROOT_PASSWORD=mysql123
ENV MYSQL_DATABASE=testDB

# Need to Mount volume to data directory /var/lib/mysql
#VOLUME /var/lib/mysql

#RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
#    && chmod 777 /var/run/mysqld \
#    && chmod 777 /var/lib/mysql

# Copy .sql file to create testDB database
ADD createDB.sql /tmp

# Execute commands to
# 1. Create sample testDB database
# 2. Create new user/password as provided in input
# 3. Provided permissions on above user to perform on sample testDB database remotely
ADD database.sh /tmp

RUN chmod 777 /tmp/database.sh

# RUN set -x \
#    && mysql -h localhost -u root mysql < /tmp/createDB.sql \
#    && mysql -e "DROP USER IF EXISTS '$MYSQL_USER'@'localhost';" \
#    && mysql -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD;" \
#    && mysql -e "GRANT ALL PRIVILEGES ON MYSQL_DATABASE.* TO '$MYSQL_USER'@'localhost';" \
#    && mysql -e "GRANT ALL PRIVILEGES ON MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" \
#    && mysql -e "flush privileges;" \
#    && cat "bind-address = 0.0.0.0" >> /etc/mysql/my.cnf

ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306 3306

CMD ["/tmp/database.sh"]

