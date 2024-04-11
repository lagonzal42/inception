# Selecting the image 
# FROM debian:buster-slim AS mariadb

# # Update and install necessary packages and remove the cache in order to make the image smaller
# RUN apt-get update && \
#     apt-get upgrade -y && \
#     apt-get install -y mariadb-server && \
#     rm -fr /var/lib/apt/lists/*

# EXPOSE 3306

# RUN sed -i 's/^socket\s*=.*/socket=\/var\/run\/mysqld\/mysqld.sock/' /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN rm -fr 

# RUN sed -i "s/bind-address = 127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf

# #Comenta lineas inecesarias en 50-server.cnf  para permitir conexiones externas
# RUN sed -i "s/skip-networking/#skip-networking/g" /etc/mysql/mariadb.conf.d/50-server.cnf

# #Establece el puerto 3306
# RUN sed -i "s/#\?port\s*=.*/port=3306/" /etc/mysql/mariadb.conf.d/50-server.cnf


# COPY entrypoint.sh /tmp/entrypoint.sh

# RUN chmod +x /tmp/entrypoint.sh && /tmp/entrypoint.sh

#ENTRYPOINT ["exec /usr/bin/mysqld --user=root --console --skip-name-resolve --skip-networking=0 \"$@\""]

# Selecting the image 
 FROM debian:buster-slim AS mariadb

# Update and install necessary packages and remove the cache in order to make the image smaller
RUN apt-get update && \
    apt-get install -y mariadb-server && \
    rm -fr /var/lib/apt/lists/*

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./entrypoint.sh /

RUN chmod +x /entrypoint.sh

RUN ls -l /

ENTRYPOINT ["/entrypoint.sh"]