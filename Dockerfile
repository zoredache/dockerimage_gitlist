FROM php:7.3-apache-stretch
WORKDIR /var/www/html/
ADD https://github.com/klaussilveira/gitlist/releases/download/1.0.2/gitlist-1.0.2.tar.gz /var/www/html/gitlist.tar.gz

RUN echo "38728b688f6600ad97b6d5900b472da6529ff7f3b8c0669ada25ae0bb65d34d9  gitlist.tar.gz" | \
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

