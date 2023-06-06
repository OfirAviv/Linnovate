FROM php:7.4-fpm

RUN apt-get update && apt-get install -y nginx supervisor && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && \
    mkdir -p /var/log/supervisor

COPY nginx.conf /etc/nginx/sites-available/default

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY ./src/index.php /var/www/html/index.php

CMD ["supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
