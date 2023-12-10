<?php
include "../include/DBconn.php";

if(isset($_GET['id']) && is_numeric($_GET['id'])) {
    $seller_id = $_GET['id'];

    // Prepare statement to avoid SQL injection
    $stmt = $conn->prepare("DELETE FROM users WHERE id = ? AND role_type = '2'");
    $stmt->bind_param("i", $seller_id);

    if ($stmt->execute()) {
        // Redirect back to admin_seller.php with a success message
        header("Location: admin_seller.php?status=dismissed");
    } else {
        // Redirect back with an error message
        header("Location: admin_seller.php?status=error");
    }

    $stmt->close();
} else {
    // Redirect back with an error message
    header("Location: admin_seller.php?status=invalid");
}

$conn->close();
?>
