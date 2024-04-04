# Selecting the image 
FROM debian:buster-slim AS mariadb

# Update and install necessary packages and remove the cache in order to make the image smaller
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server && \
    rm -fr /var/lib/apt/lists/*

# Setting enviroment
ENV MYSQL_ROOT_PASSWORD=rootpassword\
    MYSQL_DATABASE=wordpress\
    MYSQL_USER=wordpress\
    MYSQL_PASSWORD=password\

# Expose mariadb ports
EXPOSE 3306

HEALTHCHECK --interval=30s --timeout=5s \
    CMD mysqladmin ping -h localhosrt || exit 1
