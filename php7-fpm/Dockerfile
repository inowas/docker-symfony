# See https://github.com/docker-library/php/blob/4677ca134fe48d20c820a19becb99198824d78e3/7.0/fpm/Dockerfile
FROM php:7.0-fpm

MAINTAINER Maxence POUTORD <maxence.poutord@gmail.com>

# Install other needed extensions
RUN apt-get update && apt-get install -y \
    libfreetype6 \
    libjpeg62-turbo \
    libmcrypt4 \
    libpng12-0 \
    git \
    unzip \
    phpunit \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN buildDeps="ibfreetype6-dev libjpeg-dev libmcrypt-dev libpq-dev libpng12-dev zlib1g-dev libzip-dev libicu-dev" && \
    apt-get update && \
    apt-get install -y $buildDeps --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install \
        gd \
        pdo \
        pdo_pgsql \
        pgsql \
        sockets \
        intl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN "date"

RUN echo 'alias sf3="php bin/console"' >> ~/.bashrc

RUN mkdir -p /fixtures
COPY . /fixtures

WORKDIR /var/www/inowas
