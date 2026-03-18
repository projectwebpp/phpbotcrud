# ใช้ PHP 8.2 กับ Apache เป็น base image
FROM php:8.2-apache

# ติดตั้ง extension ที่จำเป็นสำหรับการเชื่อมต่อฐานข้อมูล
# - pdo_pgsql สำหรับ PostgreSQL (ถ้าใช้ PostgreSQL)
# - pdo_mysql สำหรับ MySQL (ถ้าใช้ MySQL) - เลือกตามที่คุณใช้
RUN docker-php-ext-install pdo_pgsql

# เปิดใช้งาน mod_rewrite ของ Apache (ถ้าใช้ .htaccess)
RUN a2enmod rewrite

# กำหนดให้ Apache ฟังพอร์ตที่ Render กำหนดผ่าน environment variable $PORT
# Render จะส่งพอร์ตมาในตัวแปร $PORT เสมอ
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# คัดลอกไฟล์ทั้งหมดจากโปรเจกต์ไปยัง document root ของ Apache
COPY . /var/www/html/

# กำหนด ownership ให้ www-data เพื่อให้ Apache เขียนไฟล์ได้ (ถ้าจำเป็น)
RUN chown -R www-data:www-data /var/www/html

# เปิดเผยพอร์ต (Apache จะใช้พอร์ตที่เรากำหนดไว้ข้างต้น)
EXPOSE ${PORT}
