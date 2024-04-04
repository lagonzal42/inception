# Selecting the image
FROM debian:buster-slim AS wordpress
 
# Update and install necessary packages and remove the cache in order to make the image smaller
RUN apt-get update && \
    apt-get install -y php-fpm php-mysql  && \
    rm -fr /var/lib/apt/lists/*

# Expose ports
EXPOSE 9000
EXPOSE 3306

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
