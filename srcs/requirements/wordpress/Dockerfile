# Selecting the image
FROM debian:bullseye
 
# Update and install necessary packages and remove the cache in order to make the image smaller
RUN apt-get update && \
    apt-get install -y php php-fpm php-mysql curl && \
    rm -fr /var/lib/apt/lists/*

# Expose ports

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
