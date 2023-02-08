FROM php:8.2-fpm

RUN mkdir -p /var/www

RUN apt-get update && apt-get install -y \
        curl \
        libpq-dev \
        libicu-dev \
        libzip-dev \
        libxml2-dev \
        zip \
        git && \
        docker-php-ext-install -j$(nproc) iconv pdo pdo_pgsql pgsql bcmath intl zip soap && \
        docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql  && \
        docker-php-ext-enable pdo_pgsql && \
        apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install php-redis
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

WORKDIR /var/www/

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["php-fpm"]
