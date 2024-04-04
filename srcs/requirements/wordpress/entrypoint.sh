#!/bin/bash

# Configure WordPress database connection
sed -i "s/database_name_here//" /var/www/html/wp-config.php
sed -i "s/username_here//" /var/www/html/wp-config.php
sed -i "s/password_here//" /var/www/html/wp-config.php
sed -i "s/localhost//" /var/www/html/wp-config.php

# Start php-fpm
exec php-fpm

