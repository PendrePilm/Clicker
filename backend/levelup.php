<?php
header('Content-Type: application/json');
require 'db.php';

$data = json_decode(file_get_contents('php://input'), true);
$username = $data['username'];

try {
    // Réinitialiser les colonnes clicks et buildings
    $stmt = $pdo->prepare('UPDATE users SET clicks = 0, buildings = NULL WHERE username = ?');
    $stmt->execute([$username]);

    // Augmenter le niveau de l'utilisateur
    $stmt = $pdo->prepare('UPDATE users SET level = level + 1 WHERE username = ?');
    $stmt->execute([$username]);

    echo json_encode(['success' => true]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Erreur lors de la mise à jour du niveau']);
}
?>