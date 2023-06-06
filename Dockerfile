FROM php:7.4-fpm

# Update the package lists, install Nginx and Supervisor, then clean up the apt cache to save space
RUN apt-get update && apt-get install -y nginx supervisor && rm -rf /var/lib/apt/lists/*

# Create necessary directories for PHP and Supervisor logs
RUN mkdir -p /run/php && \
    mkdir -p /var/log/supervisor

# Copy the Nginx configuration file to the default sites-available directory
COPY nginx.conf /etc/nginx/sites-available/default

# Copy the Supervisor configuration file to the Supervisor conf.d directory
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy the PHP source code into the web root directory
COPY ./src/index.php /var/www/html/index.php

# Start supervisord when the container starts, don't daemonize it, and use the specified configuration file
CMD ["supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
