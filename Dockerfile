# Using Debian-based PHP-FPM image
FROM php:7.4-fpm

# Installing necessary packages
RUN apt-get update && apt-get install -y nginx supervisor && rm -rf /var/lib/apt/lists/*

# Creating directories
RUN mkdir -p /run/php && \
    mkdir -p /var/log/supervisor

# Copying nginx configuration
COPY nginx.conf /etc/nginx/sites-available/default

# Copying supervisord configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copying PHP file
COPY ./src/index.php /var/www/html/index.php

# Exposing necessary port
EXPOSE 80

# Starting supervisord
CMD ["supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
