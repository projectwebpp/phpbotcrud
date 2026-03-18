<?php
$host     = getenv('DB_HOST') ?: 'sql307.infinityfree.com';
$port     = getenv('DB_PORT') ?: '3306';
$dbname   = getenv('DB_NAME') ?: 'if0_38904313_phplinebot';
$username = getenv('DB_USER') ?: 'if0_38904313';
$password = getenv('DB_PASSWORD') ?: 'RyvwsdTAZ3LMj';

try {
    $dsn = "mysql:host=$host;port=$port;dbname=$dbname;charset=utf8mb4";
    $pdo = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE          => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    die("เชื่อมต่อฐานข้อมูลล้มเหลว: " . $e->getMessage());
}
?>
