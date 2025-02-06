<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: http://192.168.1.18:8080'); // Autorise l'accès depuis le frontend
header('Access-Control-Allow-Methods: POST, GET, OPTIONS'); // Autorise les méthodes HTTP
header('Access-Control-Allow-Headers: Content-Type'); // Autorise les en-têtes

// Gérer les requêtes OPTIONS pour le pré-vol (preflight)
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}

require 'db.php';

$data = json_decode(file_get_contents('php://input'), true);

$username = $data['username'];
$password = password_hash($data['password'], PASSWORD_BCRYPT);

$stmt = $pdo->prepare('INSERT INTO users (username, password) VALUES (?, ?)');
if ($stmt->execute([$username, $password])) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false, 'message' => 'Erreur lors de l\'inscription']);
}
?>