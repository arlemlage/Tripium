FROM composer:2.7.6 as build
WORKDIR /app
COPY . /app
RUN composer install --ignore-platform-reqs

FROM php:8.1-apache
EXPOSE 80
COPY --from=build /app /app
COPY vhost.conf /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:www-data /app

