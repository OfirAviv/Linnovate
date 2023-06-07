FROM php:7.4-fpm

COPY src/ /var/www/html/

CMD ["php-fpm"]
