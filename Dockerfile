FROM php:8.2-apache

# ติดตั้ง dependencies ที่จำเป็นสำหรับ pdo_mysql (ใช้ MariaDB development library)
RUN apt-get update && apt-get install -y libmariadb-dev \
    && docker-php-ext-install pdo_mysql

# เปิดใช้งาน mod_rewrite (ถ้าต้องการ)
RUN a2enmod rewrite

# กำหนดให้ Apache ใช้พอร์ตจาก environment variable $PORT
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# คัดลอกไฟล์ทั้งหมดไปยัง document root
COPY . /var/www/html/

# กำหนด ownership ให้ www-data
RUN chown -R www-data:www-data /var/www/html

# เปิดเผยพอร์ต (Apache จะใช้พอร์ตที่กำหนดผ่าน $PORT)
EXPOSE ${PORT}
