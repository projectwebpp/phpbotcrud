<?php
$host = 'localhost';
$dbname = 'crud_keyword';
$username = 'root';   // ปรับตามการตั้งค่าของคุณ
$password = '';       // ปรับตามการตั้งค่าของคุณ

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("เชื่อมต่อฐานข้อมูลล้มเหลว: " . $e->getMessage());
}
?>
