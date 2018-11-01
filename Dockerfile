FROM php:5.6-cli-jessie

COPY docker-mariadbdiff-entrypoint.sh /usr/local/bin/docker-mariadbdiff-entrypoint

RUN apt-get update && apt-get install -y \
    git \
    unzip && \
    docker-php-ext-install pdo pdo_mysql && \
    chmod +x /usr/local/bin/docker-mariadbdiff-entrypoint && \
    curl https://github.com/DBDiff/DBDiff/archive/master.zip -sL -o ~/dbdiff.zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    unzip -qq -d ~ ~/dbdiff.zip  && rm ~/dbdiff.zip && \
    mv ~/DBDiff-master /opt/dbdiff &&  ln -s /opt/dbdiff/dbdiff /usr/local/bin/dbdiff && \
    composer install -q --no-scripts --no-plugins -d /opt/dbdiff/


ENTRYPOINT ["/usr/local/bin/docker-mariadbdiff-entrypoint"]
