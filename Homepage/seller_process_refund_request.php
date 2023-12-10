<?php
include "../include/DBconn.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $request_id = $_POST['request_id'];
    $action = $_POST['action'];
    $seller_id = $_SESSION['seller_id']; // Get the seller's ID from the session

    mysqli_begin_transaction($conn);

    try {
        $update_refund_query = "";
        $order_status = "";
        $message = "";

        if ($action === 'accept') {
            // Seller accepts the refund request
            $update_refund_query = "UPDATE refundrequests SET status = 'approved' WHERE request_id = ?";
            $order_status = "cancelled";
            $message = "Your refund request #$request_id has been approved by the seller.";
        } elseif ($action === 'deny') {
            // Seller denies the refund request
            $update_refund_query = "UPDATE refundrequests SET status = 'rejected' WHERE request_id = ?";
            $message = "Your refund request #$request_id has been denied by the seller.";
        } else {
            // Invalid action
            throw new Exception('Invalid action');
        }

        // Update the refund request status
        $stmt = mysqli_prepare($conn, $update_refund_query);
        mysqli_stmt_bind_param($stmt, "i", $request_id);
        mysqli_stmt_execute($stmt);

        // Update order status if necessary
        if ($action === 'accept') {
            $update_order_query = "UPDATE orders SET order_status = ? WHERE order_id = (SELECT order_id FROM refundrequests WHERE request_id = ?)";
            $stmt = mysqli_prepare($conn, $update_order_query);
            mysqli_stmt_bind_param($stmt, "si", $order_status, $request_id);
            mysqli_stmt_execute($stmt);
        }

        // Get the user_id to send a notification
        $user_query = "SELECT user_id FROM refundrequests WHERE request_id = ?";
        $stmt = mysqli_prepare($conn, $user_query);
        mysqli_stmt_bind_param($stmt, "i", $request_id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        $user = mysqli_fetch_assoc($result);
        $user_id = $user['user_id'];

        // Insert a notification for the user
        $insert_notification_query = "INSERT INTO notifications (user_id, message) VALUES (?, ?)";
        $stmt = mysqli_prepare($conn, $insert_notification_query);
        mysqli_stmt_bind_param($stmt, "is", $user_id, $message);
        mysqli_stmt_execute($stmt);

        mysqli_commit($conn);
        header('Location: seller_notifications.php?success=ActionProcessed');
    } catch (Exception $e) {
        mysqli_rollback($conn);
        header('Location: seller_notifications.php?error=ActionFailed');
    }
} else {
    header('Location: seller_notifications.php');
}
exit;
?>
