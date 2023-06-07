FROM php:7.4-fpm

COPY ./src/index.php /var/www/html/

CMD ["php-fpm"]
