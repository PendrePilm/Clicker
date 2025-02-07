<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: http://192.168.1.18:8080');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
require 'db.php';

$data = json_decode(file_get_contents('php://input'), true);
$username = $data['username'];
$clicks = $data['clicks'];
$buildings = json_encode($data['buildings']); // Encoder les bâtiments en JSON

try {
    $stmt = $pdo->prepare('UPDATE users SET clicks = ?, buildings = ? WHERE username = ?');
    $stmt->execute([$clicks, $buildings, $username]);

    echo json_encode(['success' => true]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erreur lors de la sauvegarde des données']);
}
?>