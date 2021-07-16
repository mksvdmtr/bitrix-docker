FROM php:7.0-apache

RUN apt-get update && apt-get install libxml2-dev libxslt-dev libcurl4-openssl-dev pkg-config libssl-dev libpng-dev -y && \
	docker-php-ext-install gd && \
	docker-php-ext-install xsl && \
	docker-php-ext-install zip
RUN docker-php-ext-install pdo pdo_mysql && \ 
	docker-php-ext-enable pdo_mysql && \
	docker-php-ext-install mysqli && \
	docker-php-ext-enable mysqli


RUN a2enmod rewrite

RUN groupadd user -g 1000 && useradd -ms /bin/bash -u 1000 -g 1000 user
COPY custom.ini $PHP_INI_DIR/conf.d/
