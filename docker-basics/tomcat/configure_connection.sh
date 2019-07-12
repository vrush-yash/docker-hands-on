#!/bin/bash

# Using environment variables passed to container
mysql_conn="$MYSQL_SERVER_HOST:$MYSQL_SERVER_PORT\\/$MYSQL_SERVER_DB_NAME?user=$MYSQL_SERVER_USER\\&password=$MYSQL_SERVER_PASSWORD"

# Modifying connection information in the .jsp app on tomcat server
sed -i "s/MYSQL_CONNECTION/$mysql_conn/g" /usr/local/tomcat/webapps/ROOT/jdbctest.jsp

# start tomcat
/usr/local/tomcat/bin/catalina.sh run &

# to keep the process running
tail -F -n0 /etc/hosts
