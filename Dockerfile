FROM php:8.2-apache

# ติดตั้ง dependencies และ PHP extensions ที่จำเป็น
RUN apt-get update && apt-get install -y \
        libpq-dev \
    && docker-php-ext-install pdo_pgsql pgsql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# เปิดใช้งาน mod_rewrite
RUN a2enmod rewrite

# คัดลอกไฟล์ทั้งหมดไปยัง document root
COPY . /var/www/html/

# กำหนด ownership ให้ www-data
RUN chown -R www-data:www-data /var/www/html

# Render ใช้ environment variable $PORT
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data

# แก้ Apache ให้ฟัง $PORT จาก Render
RUN sed -i 's/Listen 80/Listen ${PORT:-80}/' /etc/apache2/ports.conf \
    && sed -i 's/<VirtualHost \*:80>/<VirtualHost *:${PORT:-80}>/' /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80

# Start Apache ด้วย environment variable
CMD ["sh", "-c", "apache2ctl -D FOREGROUND"]
