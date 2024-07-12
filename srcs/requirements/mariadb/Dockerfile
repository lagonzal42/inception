# FROM debian:bullseye

# # Install MariaDB server and client
# RUN apt-get update -y
# RUN apt-get upgrade -y
# RUN apt-get install mariadb-server -y
# RUN apt-get install mariadb-client -y
# RUN rm -rf /var/lib/apt/lists/*

# # Give permissions on specific folders
# RUN mkdir -p /var/run/mysqld
# RUN chown -R mysql:mysql /var/run/mysqld
# RUN chmod 777 /var/run/mysqld

# # Set the working directory inside the container
# #RUN mkdir -p /etc/mysql
# #WORKDIR /etc/mysql/

# # Copy the MariaDB configuration
# COPY tools/my.cnf /etc/mysql/my.cnf

# # Copy the init DB script
# COPY tools/dbCreate.sh /tmp
# COPY tools/init.sql /tmp

# # Grant execute permissions to the init DB script
# RUN chmod +x /tmp/dbCreate.sh

# # Expose the default MariaDB port
# EXPOSE 3306

# # Start the MariaDB server on container startup
# ENTRYPOINT [ "/tmp/dbCreate.sh" ]

## DOCKERFILE FILE ##

FROM    debian:bullseye

RUN     apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server mariadb-client -y && \
        mkdir -p /var/run/mysqld && \
        chown -R mysql:mysql /var/run/mysqld && chown -R mysql:mysql /etc/mysql/

COPY    tools/dbCreate.sh /tmp/
COPY    tools/init.sql /tmp/
COPY    tools/my.cnf /etc/mysql

RUN     chown -R mysql:mysql /tmp/ && \
        chown -R mysql:mysql /etc/mysql

USER    mysql

EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/dbCreate.sh"]
