#!/bin/bash

# stop db temporarily
#mysqladmin -u root -p shutdown

# remove old files
rm -R /var/lib/mysql/*

# Add entry to configuration file for remote access to mysql database
# no bind-address in mariaDB
#touch /etc/mysql/mariadb.conf.d/mysql.cnf
#printf "[mysql]\nbind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/mysql.cnf

# making sure permissions are there on below mentioned paths
chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
chmod 777 /var/run/mysqld
chmod 777 /var/lib/mysql

# re-install mariadb
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

# start mysqld
/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &
#/usr/sbin/mysqld --user=mysql --datadir=/var/lib/mysql

# wait for server to come online
sleep 15;

# script to execute commands on mysql db
# create testDB database, and populate values in employee sample table
mysql -h localhost -u root mysql < /tmp/createDB.sql

# Provide remote privileges to testDB database using non-admin user
#mysql -e "DROP USER IF EXISTS '$MYSQL_USER'@'localhost';"
mysql -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD';"
mysql -e "flush privileges;"

# set root password
/usr/bin/mysqladmin -u root password '$(MYSQL_ROOT_PASSWORD)'

# to keep the process running
tail -F -n0 /etc/hosts

