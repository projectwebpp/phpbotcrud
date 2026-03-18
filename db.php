<?php
$host = 'localhost';
$dbname = 'if0_38904313_phplinebot';
$username = 'if0_38904313';   // ปรับตามการตั้งค่าของคุณ
$password = 'RyvwsdTAZ3LMj';       // ปรับตามการตั้งค่าของคุณ

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("เชื่อมต่อฐานข้อมูลล้มเหลว: " . $e->getMessage());
}
?>
