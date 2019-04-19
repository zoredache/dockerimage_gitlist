FROM php:7.1-apache-stretch
WORKDIR /var/www/html/
ADD https://github.com/klaussilveira/gitlist/releases/download/1.0.1/gitlist-1.0.1.tar.gz /var/www/html/gitlist.tar.gz

RUN echo "3da0643f710c5c6b9b86efa46f87bc4a14069b8d31702f21a81213882b7783ea  gitlist.tar.gz" | \
  sha256sum --check && tar --strip-components=1 -xzvf gitlist.tar.gz \
  && mkdir /var/www/html/cache \
  && chown www-data:www-data /var/www/html/cache \
  && a2enmod rewrite

RUN apt-get update \
  && apt-get --yes --no-install-recommends install git \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
ADD config.ini /var/www/html/config.ini

VOLUME /repos

