<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: http://192.168.1.18:8080');
header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');
require 'db.php';

$data = json_decode(file_get_contents('php://input'), true);
$username = $data['username'];

try {
    $stmt = $pdo->prepare('SELECT clicks, buildings FROM users WHERE username = ?');
    $stmt->execute([$username]);
    $user = $stmt->fetch();

    if ($user) {
        echo json_encode([
            'success' => true,
            'clicks' => $user['clicks'],
            'buildings' => json_decode($user['buildings'], true), // Décoder les bâtiments
        ]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Utilisateur non trouvé']);
    }
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erreur lors du chargement des données']);
}
?>
