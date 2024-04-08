# Selecting the image
FROM debian:buster-slim AS wordpress
 
# Update and install necessary packages and remove the cache in order to make the image smaller
RUN apt-get update && \
    apt-get install -y php php-fpm php-mysql curl && \
    rm -fr /var/lib/apt/lists/*

RUN mkdir -p /var/www/html && \
    curl -o /tmp/wordpress.tar.gz -sSL https://wordpress.org/latest.tar.gz && \
    tar xvzf /tmp/wordpress.tar.gz -C /var/www/html --strip-components=1 && \
    rm /tmp/wordpress.tar.gz


RUN chown -R www-data:www-data /var/www/html

# Expose ports
EXPOSE 9000
EXPOSE 3306

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
