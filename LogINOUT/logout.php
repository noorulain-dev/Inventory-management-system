<?php
ob_start();
session_start();

// Include the database connection file
include("../include/DBconn.php");

function logActivity($userId, $action, $conn) {
    $stmt = $conn->prepare("INSERT INTO activity_logs (user_id, action) VALUES (?, ?)");
    $stmt->bind_param("is", $userId, $action);
    $stmt->execute();
    $stmt->close();
}

// Check if session ID is set before calling logActivity
if (isset($_SESSION['id'])) {
    logActivity($_SESSION['id'], 'logout', $conn);
}

session_destroy();
session_unset();
header("location:login.php");
?>
