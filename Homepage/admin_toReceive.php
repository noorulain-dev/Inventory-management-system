<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Admin Dashboard - Delivered Orders</title>

    <!-- CSS -->
    <link href="../style/Homepagex.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .product-img {
            width: 100px; /* Adjust as needed */
        }
        /* Add any additional custom styles here */
    </style>
</head>

<body>
    <!-- Nav bar -->
    <div class="">
        <br><br><br>
        <?php include("../include/navigation.php"); ?>
    </div>

    <?php
    include "../include/DBconn.php";

    $orders = [];
    $error_message = '';

    // Handling the confirm delivery action
    if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['confirmDelivery']) && isset($_POST['orderId'])) {
        $orderId = $_POST['orderId'];

        // Update the order status to 'delivered' or any other status as needed
        $update_stmt = $conn->prepare("UPDATE Orders SET order_status = 'delivered' WHERE order_id = ?");
        $update_stmt->bind_param("i", $orderId);
        $update_stmt->execute();
        $update_stmt->close();

        // Reload the page to reflect the change
        header("Location: ".$_SERVER['PHP_SELF']);
        exit;
    }

    try {
        // Fetch all delivered orders along with customer and seller names
        $stmt = $conn->prepare("
            SELECT 
                Orders.order_id as order_id,  
                Orders.order_status, 
                OrderDetails.product_id, 
                OrderDetails.quantity, 
                Products.product_name, 
                Products.product_price,
                Products.seller_id,
                Users.id as customer_id,
                Users.first_name as customer_name,
                Sellers.id as seller_id,
                Sellers.first_name as seller_name
            FROM Orders 
            JOIN OrderDetails ON Orders.order_id = OrderDetails.order_id 
            JOIN Products ON OrderDetails.product_id = Products.product_ID 
            JOIN Users ON Orders.user_id = Users.id
            JOIN Users as Sellers ON Products.seller_id = Sellers.id
            WHERE Orders.order_status = 'shipped'
        ");
        $stmt->execute();
        $result = $stmt->get_result();

        // Fetch data
        while ($row = $result->fetch_assoc()) {
            $orders[] = $row;
        }

        $stmt->close();

    } catch (Exception $e) {
        $error_message = "Error: Could not retrieve orders. " . $e->getMessage();
    }
    ?>

    <div class="container">
        <br><br>
        <hr class="col-9 mx-auto" style="border-top: 3px double;">
        <h1 class="text-center" style="font-size: 45px; font-style: normal; text-rendering: optimizeLegibility; padding-top: 30px;">Shipped Orders</h1>
        <hr class="col-9 mx-auto" style="border-top: 3px double;">

        <?php if(!empty($error_message)): ?>
            <div class="alert alert-danger" role="alert">
                <?php echo $error_message; ?>
            </div>
        <?php endif; ?>

        <?php if(count($orders) > 0): ?>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Customer Name</th>
                        <th scope="col">Seller Name</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($orders as $order): ?>
                        <tr>
                            <td>
                                <a href="customer_details.php?customerId=<?php echo $order['customer_id']; ?>">
                                    <?php echo htmlspecialchars($order['customer_name'], ENT_QUOTES, 'UTF-8'); ?>
                                </a>
                            </td>
                            <td>
                                <a href="seller_details.php?sellerId=<?php echo $order['seller_id']; ?>">
                                    <?php echo htmlspecialchars($order['seller_name'], ENT_QUOTES, 'UTF-8'); ?>
                                </a>
                            </td>
                            <td><?php echo htmlspecialchars($order['product_name'], ENT_QUOTES, 'UTF-8'); ?></td>
                            <td><?php echo htmlspecialchars($order['quantity'], ENT_QUOTES, 'UTF-8'); ?></td>
                            <td>$<?php echo htmlspecialchars($order['product_price'], ENT_QUOTES, 'UTF-8'); ?></td>
                            <td><?php echo htmlspecialchars($order['order_status'], ENT_QUOTES, 'UTF-8'); ?></td>
                            <td>
                                <form method="post">
                                    <input type="hidden" name="orderId" value="<?php echo $order['order_id']; ?>">
                                    <input type="submit" name="confirmDelivery" value="Confirm Delivery" class="btn btn-primary">
                                </form>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No delivered orders to display.</p>
        <?php endif; ?>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvx6vNjK9UpQqKfJAF4JwNf6k5e2l5u7JpBb7k7lvoJtjRvJQaSF2p1w8jL" crossorigin="anonymous"></script>

</body>
</html>
