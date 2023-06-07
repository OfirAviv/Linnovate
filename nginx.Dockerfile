FROM nginx:latest

COPY ./nginx/nginx.conf /etc/nginx/conf.d/

COPY ./src/index.php /var/www/html
