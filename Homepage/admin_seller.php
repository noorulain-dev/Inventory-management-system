<?php
include "../include/DBconn.php";

// Fetch approved sellers
$approved_sellers_query = "SELECT id, first_name, last_name, email FROM users WHERE role_type = '2' AND is_active = 1";
$approved_sellers_result = mysqli_query($conn, $approved_sellers_query);

// Fetch unapproved sellers
$unapproved_sellers_query = "SELECT id, first_name, last_name, email FROM users WHERE role_type = '2' AND is_active = 0";
$unapproved_sellers_result = mysqli_query($conn, $unapproved_sellers_query);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Seller List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style>
        body {
            padding-top: 70px; /* Adjust this value based on your navigation bar's height */
            background: #f7f7f7; /* Light grey background */
            font-family: 'Arial', sans-serif; /* Stylish font-family */
        }
        .container {
            background: #fff; /* White background for the content */
            border-radius: 8px; /* Rounded corners for the container */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            padding: 20px; /* Spacing inside the container */
            margin-bottom: 30px; /* Spacing below the container */
        }
        .list-group-item {
            border: none; /* Remove borders from list items */
            margin-bottom: 10px; /* Add space between list items */
            transition: transform 0.2s; /* Smooth transition for hover effect */
        }
        .list-group-item:hover {
            transform: scale(1.02); /* Slightly scale up list items on hover */
            background-color: #f0f0f0; /* Change background color on hover */
        }
        .list-group-item-action {
            color: #333; /* Dark text color for better readability */
            font-size: 18px; /* Increase font size for better visibility */
        }
        .list-group-item-action:after {
            content: '→';
            float: right; /* Arrow to indicate clickable items */
            color: #888; /* Lighter color for the arrow */
        }
        h1 {
            text-align: center; /* Center the heading */
            margin-bottom: 30px; /* Spacing below the heading */
            color: #333; /* Dark color for the heading */
        }
    </style>
</head>
<body>
    <div class="">
        <br><br><br>
        <?php include("../include/navigation.php"); ?>
    </div>

    
    <div class="container">
        <h1>Approved Sellers</h1>
        <div class="list-group">
            <?php while($seller = mysqli_fetch_assoc($approved_sellers_result)) { ?>
                <a href="seller_details.php?id=<?php echo $seller['id']; ?>" class="list-group-item list-group-item-action">
                    <?php echo $seller['first_name'] . " " . $seller['last_name']; ?> - <?php echo $seller['email']; ?>
                </a>
            <?php } ?>
        </div>

        <h1>Unapproved Sellers</h1>
        <div class="list-group">
            <?php while($seller = mysqli_fetch_assoc($unapproved_sellers_result)) { ?>
                <div class="list-group-item">
                    <a href="seller_details.php?id=<?php echo $seller['id']; ?>" class="list-group-item-action">
                        <?php echo $seller['first_name'] . " " . $seller['last_name']; ?> - <?php echo $seller['email']; ?>
                    </a>
                    <div>
                        <a href="approve_seller.php?id=<?php echo $seller['id']; ?>" class="btn btn-success">Approve</a>
                        <a href="dismiss_seller.php?id=<?php echo $seller['id']; ?>" class="btn btn-danger">Dismiss</a>
                    </div>
                </div>
            <?php } ?>
        </div>
    </div>

    <?php include('../include/footer.php') ?>
</body>
</html>
