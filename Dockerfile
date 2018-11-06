FROM mariadb:10.1

ENV MYSQL_ROOT_PASSWORD=root

COPY docker-mariadbdiff-entrypoint.sh /usr/local/bin/docker-mariadbdiff-entrypoint

RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    curl \
    git \
    unzip && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y \
    php5.6 \
    php5.6-pdo \
    php5.6-dom


RUN chmod +x /usr/local/bin/docker-mariadbdiff-entrypoint && \
    curl https://github.com/DBDiff/DBDiff/archive/master.zip -sL -o ~/dbdiff.zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    unzip -qq -d ~ ~/dbdiff.zip  && rm ~/dbdiff.zip && \
    mv ~/DBDiff-master /opt/dbdiff &&  ln -s /opt/dbdiff/dbdiff /usr/local/bin/dbdiff


ENTRYPOINT ["/usr/local/bin/docker-mariadbdiff-entrypoint"]
