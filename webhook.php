<?php
require 'db.php';

// รับเฉพาะ method POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['error' => 'Method not allowed']);
    exit;
}

// รับข้อมูลที่ส่งมา (รองรับ JSON และ form-data)
$input = file_get_contents('php://input');
$data = json_decode($input, true);

if (!$data) {
    // ถ้าไม่ใช่ JSON ให้ลองรับแบบ form-data
    $data = $_POST;
}

$keyword = $data['keyword'] ?? '';

if (empty($keyword)) {
    echo json_encode(['error' => 'Missing keyword']);
    exit;
}

// ค้นหาคำตอบจากฐานข้อมูล (ใช้ LIKE หรือ = ก็ได้)
$stmt = $pdo->prepare("SELECT answer FROM responses WHERE keyword = ? LIMIT 1");
$stmt->execute([$keyword]);
$result = $stmt->fetch(PDO::FETCH_ASSOC);

if ($result) {
    echo json_encode(['keyword' => $keyword, 'answer' => $result['answer']]);
} else {
    echo json_encode(['error' => 'Keyword not found']);
}
