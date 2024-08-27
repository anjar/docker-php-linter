FROM php:7.3-cli-alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=alpine/git /usr/bin/git /usr/bin/git
ENV COMPOSER_MEMORY_LIMIT=-1

RUN apk add --no-cache zip libzip-dev \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install zip \
    && rm -rf /var/lib/apt/lists/* \
    && composer global require symplify/easy-coding-standard phpunit/phpunit pdepend/pdepend:2.10.0 phpmd/phpmd \
    && composer clear-cache \
    && rm -rf /var/cache/* /var/tmp/* /tmp/* /var/lib/apt/lists/*  /usr/share/man /var/lib/dpkg/info \
    && ln -s /root/.composer/vendor/bin/ecs /usr/bin \ 
    && ln -s /root/.composer/vendor/bin/phpunit /usr/bin \ 
    && ln -s /root/.composer/vendor/bin/pdepend  /usr/bin \ 
    && ln -s /root/.composer/vendor/bin/phpmd /usr/bin

WORKDIR /app
CMD ["php", "-a"]