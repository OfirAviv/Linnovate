FROM php:7.4-fpm

RUN apt-get update && apt-get install -y nginx vim

RUN rm /etc/nginx/sites-enabled/default

COPY nginx.conf /etc/nginx/sites-enabled/

COPY src/index.php /var/www/html/index.php

CMD service nginx start && php-fpm
