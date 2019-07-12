# Using latest tomcat8 image
FROM tomcat:latest

# Copying mysql connector jar file so that application on tomcat server can connect to mysql server
ADD mariadb-java-client-2.4.1.jar /usr/local/tomcat/lib

# Copying sample jsp file that makes a GET query to testDB database on mysql server using user vrushal
ADD jdbctest.jsp /usr/local/tomcat/webapps/ROOT

# Copy script to configure connection of jdbc application to mysql container
ADD configure_connection.sh /tmp 

RUN chmod 775 /tmp/configure_connection.sh

# Set mysql server hostname, port(default as 3306), username, password to connect to the server
ENV MYSQL_SERVER_HOST=localhost 
ENV MYSQL_SERVER_PORT=3306
ENV MYSQL_SERVER_DB_NAME=test
ENV MYSQL_SERVER_USER=test
ENV MYSQL_SERVER_PASSWORD=test123

ENTRYPOINT ["/tmp/configure_connection.sh"]

EXPOSE 8080

#CMD ["catalina.sh", "run"]

