# Dockerfile
FROM php:7.0-apache

RUN docker-php-ext-install pdo_mysql
RUN a2enmod rewrite

ADD . /var/www
ADD ./public /var/www/html

RUN chmod -R 777 /var/www/storage
RUN chmod -R 777 /var/www/bootstrap/cache
RUN cp -a /var/www/.env.example /var/www/.env
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
WORKDIR "/var/www"
RUN php artisan key:generate
