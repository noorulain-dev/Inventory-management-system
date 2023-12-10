<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="Homepage" content="Homepage">
    <title>Admin Dashboard - Delivered Orders</title>
    <!-- CSS -->
    <link href="../style/Homepagex.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .product-img {
            width: 100px; /* Adjust as needed */
        }
        /* Additional custom styles */
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

    try {
        // Fetch all delivered orders with customer and seller details
        $stmt = $conn->prepare("
            SELECT 
                Orders.order_id as order_id,
                Orders.order_status,
                OrderDetails.product_id,
                OrderDetails.quantity,
                Products.product_name,
                Products.product_price,
                Users.id as customer_id,
                Users.first_name as customer_name,
                Sellers.id as seller_id,
                Sellers.first_name as seller_name
            FROM Orders 
            JOIN OrderDetails ON Orders.order_id = OrderDetails.order_id 
            JOIN Products ON OrderDetails.product_id = Products.product_id 
            JOIN Users ON Orders.user_id = Users.id
            JOIN Users AS Sellers ON Products.seller_id = Sellers.id
            WHERE Orders.order_status = 'delivered'
        ");
        $stmt->execute();
        $result = $stmt->get_result();

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
        <h1 class="text-center" style="font-size: 45px;">Delivered Orders</h1>
        <hr class="col-9 mx-auto" style="border-top: 3px double;">

        <?php if (!empty($error_message)): ?>
            <div class="alert alert-danger" role="alert">
                <?php echo $error_message; ?>
            </div>
        <?php endif; ?>

        <!-- Display delivered orders -->
        <?php if (count($orders) > 0): ?>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Customer Name</th>
                        <th scope="col">Seller Name</th>
                        <th scope="col">Product Name</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Price</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($orders as $order): ?>
                        <tr>
                            <td><a href="customer_details.php?customerId=<?php echo $order['customer_id']; ?>">
                                <?php echo htmlspecialchars($order['customer_name'], ENT_QUOTES, 'UTF-8'); ?></a>
                            </td>
                            <td><a href="seller_details.php?sellerId=<?php echo $order['seller_id']; ?>">
                                <?php echo htmlspecialchars($order['seller_name'], ENT_QUOTES, 'UTF-8'); ?></a>
                            </td>
                            <td><?php echo htmlspecialchars($order['product_name'], ENT_QUOTES, 'UTF-8'); ?></td>
                            <td><?php echo htmlspecialchars($order['quantity'], ENT_QUOTES, 'UTF-8'); ?></td>
                            <td>$<?php echo htmlspecialchars($order['product_price'], ENT_QUOTES, 'UTF-8'); ?></td>
                            <td><?php echo htmlspecialchars($order['order_status'], ENT_QUOTES, 'UTF-8'); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No delivered orders to display.</p>
        <?php endif; ?>
    </div>

    <!-- Bootstrap Bundle with Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvx6vNjK9UpQqKfJAF4JwNf6k5e2l5u7JpBb7k7lvoJtjRvJQaSF2p1w8jL" crossorigin="anonymous"></script>
</body>
</html>
