RUN apt-get update && apt-get install -y libmariadb-dev libpq-dev \
    && docker-php-ext-install pdo_mysql pdo_pgsql
