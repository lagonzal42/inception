# Selecting the image
FROM debian:bullseye-slim AS nginx

# Update and install necessary packages and remove the cache in order to make the image smaller
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    rm -fr /var/lib/apt/lists/*

# Generate openssl key and certificate
RUN openssl gepkey -algorithm RSA -out /etc/nginx/server.key && \
    openssl req -new -key /etc/nginx/server.csr -subj "/CN=lagonzal" && \
    openssl x509 -req -days 365 -in /etc/nginx/server.csr - signkey /etc/nginx/server.key -out /etc/nginx/server.crt

# Set nginx configuration
COPY ./tools/conf/nginx.conf /etc/nginx/nginx.conf

# Expose ports
EXPOSE 443
EXPOSE 9000

ENTRYPOINT nginx -g "daemon off;"
