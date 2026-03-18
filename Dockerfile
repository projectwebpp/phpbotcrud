FROM php:8.2-apache

# ติดตั้ง dependencies และ PHP extensions ที่จำเป็น
RUN apt-get update && apt-get install -y \
        libmariadb-dev \
        libpq-dev \
    && docker-php-ext-install pdo_mysql pdo_pgsql

# เปิดใช้งาน mod_rewrite (ถ้าต้องการ)
RUN a2enmod rewrite

# คัดลอกไฟล์ทั้งหมดไปยัง document root
COPY . /var/www/html/

# กำหนด ownership ให้ www-data
RUN chown -R www-data:www-data /var/www/html

# เปิดพอร์ต 80 (Render จะแมปพอร์ตจาก $PORT ให้อัตโนมัติ)
EXPOSE 80
