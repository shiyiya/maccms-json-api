FROM php:7.4.2-fpm-alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk update && apk add --no-cache --virtual .build-deps \
  imagemagick-dev \
  libjpeg-turbo-dev \
  freetype-dev \
  libzip-dev \
  libpng-dev \
  curl-dev \
  libjpeg-turbo-dev && \
  docker-php-ext-configure gd --with-freetype --with-jpeg && \
  docker-php-ext-install -j "$(nproc)" gd \
  bcmath \
  exif \
  mysqli \
  opcache \
  pdo_mysql \
  zip \
  curl

ADD ./fpm.conf /etc/nginx/conf.d

COPY docker-maccms-entrypoint.sh /usr/local/bin
# ENTRYPOINT [ "docker-maccms-entrypoint.sh" ]

USER www-data
RUN curl -L https://github.com/magicblack/maccms10/tarball/v2022.1000.3032 | tar zx -C /var/www/html/ --strip-components 1

USER root
CMD ["php-fpm"]