<?php
include "../include/DBconn.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $request_id = $_POST['request_id'];
    $action = $_POST['action'];
    $admin_response = $_POST['admin_response'] ?? '';

    mysqli_begin_transaction($conn);

    try {
        // Update refund request status
        $update_refund_query = "UPDATE refundrequests SET status = ?, admin_response = ? WHERE request_id = ?";
        $stmt = mysqli_prepare($conn, $update_refund_query);
        mysqli_stmt_bind_param($stmt, "ssi", $action, $admin_response, $request_id);
        mysqli_stmt_execute($stmt);

        // Retrieve user and order IDs
        $order_user_query = "SELECT user_id, order_id FROM refundrequests WHERE request_id = ?";
        $stmt = mysqli_prepare($conn, $order_user_query);
        mysqli_stmt_bind_param($stmt, "i", $request_id);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        $order_user = mysqli_fetch_assoc($result);
        $user_id = $order_user['user_id'];
        $order_id = $order_user['order_id'];

        $message = "";
        $order_status = "";

        // Handling based on action
        if ($action === 'approved') {
            $order_status = 'cancelled';
            $message = "Your refund request #$request_id has been approved.";
        } elseif ($action === 'rejected') {
            $order_status = 'rejected';
            $message = "Your refund request #$request_id has been rejected.";
        } elseif ($action === 'forwarded') {
            $message = "Your refund request #$request_id has been forwarded to the seller.";
            // Additional logic if needed for 'forwarded' action
        }

        // Update order status if necessary
        if ($action === 'approved' || $action === 'rejected') {
            $update_order_query = "UPDATE orders SET order_status = ? WHERE order_id = ?";
            $stmt = mysqli_prepare($conn, $update_order_query);
            mysqli_stmt_bind_param($stmt, "si", $order_status, $order_id);
            mysqli_stmt_execute($stmt);
        }

        // Insert notification for the user
        $insert_notification_query = "INSERT INTO notifications (user_id, message) VALUES (?, ?)";
        $stmt = mysqli_prepare($conn, $insert_notification_query);
        mysqli_stmt_bind_param($stmt, "is", $user_id, $message);
        mysqli_stmt_execute($stmt);

        // Commit transaction
        mysqli_commit($conn);
        header('Location: admin_homepage.php?success=ActionProcessed');
        exit;
    } catch (Exception $e) {
        mysqli_rollback($conn);
        header('Location: admin_complaints.php?error=ActionFailed');
        exit;
    }
} else {
    header('Location: admin_homepage.php');
    exit;
}
?>
