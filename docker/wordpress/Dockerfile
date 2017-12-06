FROM debian:stretch-slim

RUN export DEBIAN_FRONTEND=noninteractive \
  && apt-get install apt-transport-https ca-certificates gnupg \
  && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
  && echo "deb https://packages.sury.org/php/ stretch main" | sudo tee /etc/apt/sources.list.d/php-ondrej-sury.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    php7.1-cli \
    php7.1-curl \
    php7.1-json \
    php7.1-mysql \
    php7.1-gd \
    php7.1-fpm \
    php7.1-mbstring \
    php7.1-opcache \
    php7.1-zip \
    php7.1-xml \
    php7.1-readline

# Download wp-cli latest version
RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod 755 /usr/local/bin/wp

# WordPress setup
WORKDIR /srv/www/wordpress

ARG WP_VERSION="4.9.1"

# WordPress download via wp-cli
RUN wp core download --version=${WP_VERSION}

# Create dirs and set proper permissions
COPY content ${SITE_ROOT}/content

COPY wp-config.php ${SITE_ROOT}

RUN chown -R www-data:www-data ${SITE_ROOT} \
  && chmod -R 755 ${SITE_ROOT}

VOLUME ${WP_ROOT} ${SITE_ROOT}/content
