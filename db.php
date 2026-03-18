<?php
$host = getenv('DB_HOST') ?: 'sql307.infinityfree.com';
$dbname = getenv('DB_NAME') ?: 'if0_38904313_phplinebot';
$username = getenv('DB_USER') ?: 'if0_38904313';
$password = getenv('DB_PASSWORD') ?: 'RyvwsdTAZ3LMj';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("เชื่อมต่อฐานข้อมูลล้มเหลว: " . $e->getMessage());
}
?>
