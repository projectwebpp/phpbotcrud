FROM php:8.2-apache

# ติดตั้ง dependencies และ PHP extensions ที่จำเป็น
RUN apt-get update && apt-get install -y \
        libmariadb-dev \      # สำหรับ pdo_mysql (MySQL)
        libpq-dev \           # สำหรับ pdo_pgsql (PostgreSQL)
    && docker-php-ext-install pdo_mysql pdo_pgsql

# (ไม่จำเป็น) เปิด mod_rewrite ถ้าต้องการใช้งาน .htaccess
RUN a2enmod rewrite

# ปรับให้ Apache ใช้พอร์ตที่ Render กำหนดผ่าน environment variable $PORT
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# คัดลอกไฟล์ทั้งหมดจากโปรเจกต์ไปยัง document root ของ Apache
COPY . /var/www/html/

# กำหนด ownership ให้ www-data เพื่อให้ Apache เขียนไฟล์ได้ (ถ้าจำเป็น)
RUN chown -R www-data:www-data /var/www/html

# เปิดพอร์ต (Render จะแมปพอร์ตจาก $PORT มาให้)
EXPOSE ${PORT}
