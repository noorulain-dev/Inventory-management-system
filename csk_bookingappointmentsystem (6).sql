-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Dec 03, 2023 at 09:21 AM
-- Server version: 10.6.16-MariaDB-1:10.6.16+maria~ubu2004
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csk_bookingappointmentsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` enum('login','logout') NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `action`, `timestamp`) VALUES
(1, 12, 'login', '2023-12-01 05:03:54'),
(2, 10, 'login', '2023-12-01 10:34:55'),
(3, 12, 'login', '2023-12-01 10:35:27'),
(4, 12, 'login', '2023-12-01 10:53:24'),
(5, 10, 'login', '2023-12-01 11:28:18'),
(6, 12, 'login', '2023-12-01 11:40:23'),
(7, 12, 'login', '2023-12-01 13:44:26'),
(8, 10, 'login', '2023-12-01 13:49:35'),
(9, 10, 'login', '2023-12-03 13:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `role_type` int(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `role_type`) VALUES
(1, 'admin@admin.com', '$2y$10$fnb.o2jNQHJPwAULY088N.wUth/ylBqoW6sSQSxyOh7cacK2EInhm', 3);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, 10, NULL, NULL),
(2, NULL, NULL, NULL),
(3, NULL, NULL, NULL),
(4, NULL, NULL, NULL),
(5, NULL, NULL, NULL),
(6, NULL, NULL, NULL),
(7, NULL, NULL, NULL),
(8, NULL, NULL, NULL),
(9, NULL, NULL, NULL),
(10, NULL, NULL, NULL),
(11, NULL, NULL, NULL),
(12, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `added_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `cart_id`, `product_id`, `quantity`, `added_at`) VALUES
(56, 4, 2, 1, NULL),
(57, 5, 2, 1, NULL),
(58, 6, 2, 1, NULL),
(59, 7, 2, 1, NULL),
(60, 8, 4, 1, NULL),
(61, 9, 2, 1, NULL),
(62, 10, 3, 1, NULL),
(63, 11, 2, 1, NULL),
(64, 12, 2, 1, NULL),
(65, 1, 2, 19, NULL),
(66, NULL, 2, 1, NULL),
(67, 1, 3, 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_bi`
--

CREATE TABLE `enquiry_bi` (
  `BI_Outlet_ID` int(255) NOT NULL,
  `BI_Outlet_name` varchar(255) NOT NULL,
  `BI_operating_time` varchar(255) NOT NULL,
  `BI_phoneNo` int(255) NOT NULL,
  `BI_Email` varchar(255) NOT NULL,
  `BI_Location` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquiry_bi`
--

INSERT INTO `enquiry_bi` (`BI_Outlet_ID`, `BI_Outlet_name`, `BI_operating_time`, `BI_phoneNo`, `BI_Email`, `BI_Location`) VALUES
(1, 'Cacti-Succulent kuching', 'Monday - Friday | 9am - 9pm', 8888888, 'isnowypanterx@gmail.com', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63815.574538863766!2d110.25891013125!3d1.4877164000000023!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31fb0bfe6c7989b1%3A0xddaf7e6f55cb2195!2zVGhlIEdvbGRlbiBCbG9vbSBHYXJkZW5zIC0g6YeR5py16Iqx5Zut!5e0!3m2!1sen!2smy!4v1668431855943!5m2!1sen!2smy');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_faqs`
--

CREATE TABLE `enquiry_faqs` (
  `FAQs_ID` int(255) NOT NULL,
  `FAQs_enquiry` varchar(1000) NOT NULL,
  `FAQs_answer` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enquiry_faqs`
--

INSERT INTO `enquiry_faqs` (`FAQs_ID`, `FAQs_enquiry`, `FAQs_answer`) VALUES
(1, 'Why An FAQ Resource?', 'Firstly, FAQ pages can bring new visitors to your website via organic search and drive them quickly to related pages – most typically deeper blog pages and service pages closely related to the questions being resolved.'),
(2, 'Why FAQ Pages Are A Priority', 'FAQ pages continue to be a priority area for SEO and digital marketing professionals.  An FAQ page is one of the simplest ways to improve your site and help site visitors and users.'),
(3, 'What Are the Benefits of a Good FAQ Page?', 'An FAQ page is a helpful type of technical documentation that streamlines the customer service experience.');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `message`, `created_at`) VALUES
(1, 10, 'Your refund request #1 has been approved.', '2023-11-10 01:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 14, 2, 4, 200.00),
(2, 15, 2, 2, 200.00),
(3, 16, 2, 1, 200.00),
(4, 18, 2, 1, 200.00),
(5, 19, 2, 1, 200.00),
(6, 20, 2, 1, 200.00),
(7, 21, 2, 1, 200.00),
(8, 22, 3, 1, 123.00),
(9, 23, 3, 1, 123.00),
(10, 24, 1, 1, 200.00),
(11, 25, 1, 1, 200.00),
(12, 26, 1, 1, 200.00),
(13, 27, 1, 1, 200.00),
(14, 28, 1, 1, 200.00),
(15, 29, 1, 1, 200.00),
(16, 30, 4, 1, 111.00),
(17, 32, 4, 1, 111.00),
(18, 33, 4, 1, 111.00),
(19, 34, 4, 1, 111.00),
(20, 35, 4, 1, 111.00),
(21, 36, 4, 1, 111.00),
(22, 37, 4, 1, 111.00),
(23, 38, 1, 1, 200.00),
(24, 39, 2, 1, 200.00),
(25, 40, 2, 1, 200.00),
(26, 41, 2, 1, 200.00),
(27, 42, 2, 1, 200.00),
(28, 43, 2, 1, 200.00),
(29, 44, 2, 1, 200.00),
(30, 45, 2, 1, 200.00),
(31, 46, 2, 1, 200.00),
(32, 47, 2, 1, 200.00),
(33, 48, 2, 1, 200.00),
(34, 49, 2, 1, 200.00),
(35, 50, 2, 1, 200.00),
(36, 51, 2, 1, 200.00),
(37, 52, 2, 1, 200.00),
(38, 53, 2, 1, 200.00),
(39, 54, 2, 1, 200.00),
(40, 55, 2, 1, 200.00),
(41, 57, 2, 1, 200.00),
(42, 58, 2, 1, 200.00),
(43, 59, 3, 2, 123.00),
(44, 60, 2, 1, 200.00);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_method` varchar(50) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `order_status` varchar(50) DEFAULT 'Processing',
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `order_date`, `payment_method`, `total_price`, `order_status`, `customer_id`) VALUES
(14, 10, '2023-10-20 15:16:56', 'CashNGo', NULL, 'shipped', 0),
(15, 10, '2023-11-28 14:21:23', 'CashNGo', NULL, 'confirmed', 0),
(16, 10, '2023-11-28 14:27:48', 'CashNGo', NULL, 'confirmed', 0),
(18, 10, '2023-11-28 14:31:42', 'CashNGo', NULL, 'confirmed', 0),
(19, 10, '2023-11-28 14:34:45', 'CashNGo', NULL, 'confirmed', 0),
(20, 10, '2023-11-28 14:36:39', 'CashNGo', NULL, 'confirmed', 0),
(21, 10, '2023-11-28 14:40:17', 'CashNGo', NULL, 'confirmed', 0),
(22, 10, '2023-11-28 14:41:40', 'CashNGo', NULL, 'confirmed', 0),
(23, 10, '2023-11-28 14:42:21', 'CashNGo', NULL, 'confirmed', 0),
(24, 10, '2023-11-28 14:48:46', 'CashNGo', NULL, 'shipped', 0),
(25, 10, '2023-11-28 15:00:02', 'CashNGo', NULL, 'confirmed', 0),
(26, 10, '2023-11-28 15:02:47', 'CashNGo', NULL, 'confirmed', 0),
(27, 10, '2023-11-28 15:08:37', 'CashNGo', NULL, 'confirmed', 0),
(28, 10, '2023-11-28 15:09:16', 'CashNGo', NULL, 'confirmed', 0),
(29, 10, '2023-11-28 15:10:03', 'CashNGo', NULL, 'confirmed', 0),
(30, 10, '2023-11-30 15:58:52', 'CashNGo', NULL, 'confirmed', 0),
(32, 10, '2023-11-30 15:59:54', 'CashNGo', NULL, 'confirmed', 0),
(33, 10, '2023-11-30 16:01:24', 'CashNGo', NULL, 'confirmed', 0),
(34, 10, '2023-11-30 16:04:23', 'CashNGo', NULL, 'confirmed', 0),
(35, 10, '2023-11-30 16:09:08', 'CashNGo', NULL, 'confirmed', 0),
(36, 10, '2023-11-30 16:21:20', 'CashNGo', NULL, 'confirmed', 0),
(37, 10, '2023-11-30 16:26:46', 'CashNGo', NULL, 'confirmed', 0),
(38, 10, '2023-11-30 16:28:11', 'CashNGo', NULL, 'confirmed', 0),
(39, 10, '2023-11-30 16:30:44', 'CashNGo', NULL, 'confirmed', 0),
(40, 10, '2023-11-30 16:41:48', 'CashNGo', NULL, 'confirmed', 0),
(41, 10, '2023-11-30 16:46:11', 'CashNGo', NULL, 'confirmed', 0),
(42, 10, '2023-11-30 16:46:49', 'CashNGo', NULL, 'confirmed', 0),
(43, 10, '2023-11-30 16:50:39', 'CashNGo', NULL, 'confirmed', 0),
(44, 10, '2023-11-30 16:51:53', 'CashNGo', NULL, 'confirmed', 0),
(45, 10, '2023-11-30 16:53:46', 'CashNGo', NULL, 'confirmed', 0),
(46, 10, '2023-11-30 17:22:12', 'CashNGo', NULL, 'confirmed', 0),
(47, 10, '2023-11-30 17:27:41', 'CashNGo', NULL, 'confirmed', 0),
(48, 10, '2023-11-30 17:31:07', 'CashNGo', NULL, 'confirmed', 0),
(49, 10, '2023-11-30 17:33:44', 'CashNGo', NULL, 'confirmed', 0),
(50, 10, '2023-11-30 17:36:46', 'CashNGo', NULL, 'confirmed', 0),
(51, 10, '2023-11-30 17:46:56', 'CashNGo', NULL, 'confirmed', 0),
(52, 10, '2023-11-30 17:48:44', 'CashNGo', NULL, 'confirmed', 0),
(53, 10, '2023-11-30 17:51:17', 'CashNGo', NULL, 'confirmed', 0),
(54, 10, '2023-11-30 17:57:11', 'CashNGo', NULL, 'confirmed', 0),
(55, 10, '2023-11-30 18:00:06', 'CashNGo', NULL, 'confirmed', 0),
(57, 10, '2023-11-30 18:02:08', 'CashNGo', NULL, 'confirmed', 0),
(58, 10, '2023-11-30 18:09:31', 'CashNGo', NULL, 'confirmed', 0),
(59, 10, '2023-12-01 05:51:12', 'CashOnDelivery', NULL, 'confirmed', 0),
(60, 10, '2023-12-03 05:03:25', 'CashNGo', NULL, 'confirmed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"csk_bookingappointmentsystem\",\"table\":\"cart_items\"},{\"db\":\"csk_bookingappointmentsystem\",\"table\":\"cart\"},{\"db\":\"csk_bookingappointmentsystem\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-12-03 06:44:18', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Users and their assignments to user groups';

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_ID` int(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_desc` text NOT NULL,
  `product_qnt` bigint(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `category` varchar(55) NOT NULL,
  `seller_id` int(55) NOT NULL,
  `promoted` varchar(10) NOT NULL,
  `sold_quantity` int(10) NOT NULL,
  `promo_price` int(56) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_ID`, `product_image`, `product_desc`, `product_qnt`, `product_name`, `product_price`, `category`, `seller_id`, `promoted`, `sold_quantity`, `promo_price`, `date`) VALUES
(1, 'promo_plant1.jpg', '', 2, 'Rickrack cactus', '200', 'Plants', 12, 'Yes', 0, 0, NULL),
(2, 'promo_plant2.jpg', '', 2, 'Christmas Cactus', '200', 'Plants', 12, 'No', 0, 0, NULL),
(3, 'Screenshot 2023-10-10 045705.png', 'rewrew', 11, 'rando', '123', 'clothing', 12, 'Yes', 0, 0, NULL),
(4, 'Screenshot 2023-10-10 045416.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 12, 'shirt', '111', 'clothing', 12, 'No', 0, 0, '2023-10-17 02:39:56'),
(5, 'Screenshot (221).png', '', 0, 'skirts', '0', '', 0, '0', 0, 0, '2023-12-01 13:45:33');

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `product_ID` int(255) NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_sname` varchar(255) NOT NULL,
  `product_price` int(255) NOT NULL,
  `product_discount` int(255) NOT NULL,
  `product_dprice` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `promotions`
--

INSERT INTO `promotions` (`product_ID`, `product_image`, `product_name`, `product_sname`, `product_price`, `product_discount`, `product_dprice`) VALUES
(1, 'promo_plant1.jpg', 'Rickrack cactus', 'Selenicereus anthonyanus', 200, 50, 100),
(2, 'promo_plant2.jpg', 'Christmas Cactus', 'Schlumbergera bridgesii', 200, 50, 100),
(3, 'promo_plant3.jpg', 'Fairy Castle Cactus', 'Acanthocereus tetragonus', 200, 50, 100),
(4, 'promo_plant4.jpg', 'Star Cactus', 'Astrophytum asterias', 200, 50, 100),
(5, 'promo_plant5.jpg', 'Golden Barrel Cactus', 'Echinocactus grusonii', 100, 50, 50),
(6, 'promo_plant6.jpg', 'Easter Cactus', 'Schlumbergera gaertneri', 100, 50, 100),
(7, 'promo_plant7.jpg', 'Moon Cactus', 'Grafted hybrid', 100, 50, 100),
(8, 'promo_plant8.jpg', 'Old Lady Cactus', 'Mammillaria hahniana', 100, 50, 100),
(1, 'promo_plant1.jpg', 'Rickrack cactus', 'Selenicereus anthonyanus', 200, 50, 100),
(2, 'promo_plant2.jpg', 'Christmas Cactus', 'Schlumbergera bridgesii', 200, 50, 100),
(3, 'promo_plant3.jpg', 'Fairy Castle Cactus', 'Acanthocereus tetragonus', 200, 50, 100),
(4, 'promo_plant4.jpg', 'Star Cactus', 'Astrophytum asterias', 200, 50, 100),
(5, 'promo_plant5.jpg', 'Golden Barrel Cactus', 'Echinocactus grusonii', 100, 50, 50),
(6, 'promo_plant6.jpg', 'Easter Cactus', 'Schlumbergera gaertneri', 100, 50, 100),
(7, 'promo_plant7.jpg', 'Moon Cactus', 'Grafted hybrid', 100, 50, 100),
(8, 'promo_plant8.jpg', 'Old Lady Cactus', 'Mammillaria hahniana', 100, 50, 100);

-- --------------------------------------------------------

--
-- Table structure for table `refundrequests`
--

CREATE TABLE `refundrequests` (
  `request_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `admin_response` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `refundrequests`
--

INSERT INTO `refundrequests` (`request_id`, `order_id`, `user_id`, `reason`, `details`, `images`, `status`, `admin_response`, `created_at`, `updated_at`) VALUES
(1, 14, 10, 'Damaged item', 'rgerfefw', '', 'approved', '', '2023-11-10 00:16:02', '2023-11-10 01:01:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `first_name` text NOT NULL,
  `last_name` text NOT NULL,
  `username` text NOT NULL,
  `email` text NOT NULL,
  `role_type` int(11) NOT NULL DEFAULT 1,
  `phone_number` text NOT NULL,
  `dob` date NOT NULL,
  `password` text NOT NULL,
  `validation_key` text NOT NULL,
  `seller_location` text DEFAULT NULL,
  `registration_date` date NOT NULL,
  `is_active` int(11) NOT NULL,
  `otp` text NOT NULL,
  `pp` text NOT NULL DEFAULT 'avatar3.png',
  `country_code` varchar(10) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `username`, `email`, `role_type`, `phone_number`, `dob`, `password`, `validation_key`, `seller_location`, `registration_date`, `is_active`, `otp`, `pp`, `country_code`, `address`, `postcode`) VALUES
(2, '', 'Hassaan', 'Ghayas', 'Has123', 'kingharispro7@gmail.com', 1, '09120901290', '1999-05-03', '$2y$10$juoAk4s1CDqKoqNwtO5izeMkbibrzPSFa8biOm13bDTqAbi4Mpmj6', 'ZWFmZGFhMWJkNGMyYTc2ZGNhZjE2YTcz', NULL, '2022-11-08', 1, '', 'demo636a9a79713fa2.04158188.jpg', NULL, NULL, NULL),
(9, '', 'Seller', 'sell', 'seller', 'seller@sell.com', 2, '1234567890', '2023-09-27', '$2y$10$u8YxqL5KBJcA1jnoZ/vDX.glsWzWKkcmUeKW3NtoNqnn4v24lToXu', '', 'mumbai', '2023-10-09', 1, '', 'avatar3.png', NULL, NULL, NULL),
(10, '', 'Osama', 'Iftikhar', 'samifti', 'nooruain.17@gmail.com', 1, '245245425', '1999-02-02', '$2y$10$hp/tm3mv0yjSskGQ7/gDDOP0pzt38BPkwJ5CDBpxBTnvMuSi.H/h2', 'ODU2ZjRlNWYxZjYxYjc4NWIxNzYyNWJk', 'kuching', '2023-10-09', 1, '', 'pp.jpg', '+60', 'swinburne city, swin street, swinville', '83001'),
(12, '', 'noor', 'ain', 'sam12', 'babysofia5601@gmail.com', 2, '97502718', '1999-02-01', '$2y$10$UEjY5pEzP6iWriue64MmIeFw0eS9MvQLTEklFP4Zj0dmFtnREULnS', 'MzY1MjdjZjU0MmRhNTg2OTkxYzJhNDFl', 'swinburne city', '2023-10-09', 1, '', 'pp.jpg', NULL, 'swinburne city, swin street, swinville', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `enquiry_bi`
--
ALTER TABLE `enquiry_bi`
  ADD PRIMARY KEY (`BI_Outlet_ID`);

--
-- Indexes for table `enquiry_faqs`
--
ALTER TABLE `enquiry_faqs`
  ADD PRIMARY KEY (`FAQs_ID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`order_detail_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_ID`);

--
-- Indexes for table `refundrequests`
--
ALTER TABLE `refundrequests`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `enquiry_bi`
--
ALTER TABLE `enquiry_bi`
  MODIFY `BI_Outlet_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enquiry_faqs`
--
ALTER TABLE `enquiry_faqs`
  MODIFY `FAQs_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_ID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `refundrequests`
--
ALTER TABLE `refundrequests`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_ID`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `refundrequests`
--
ALTER TABLE `refundrequests`
  ADD CONSTRAINT `refundrequests_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `refundrequests_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `e` ON SCHEDULE EVERY 1 SECOND STARTS '2022-11-17 08:22:06' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE
            notification_tb
        SET
            curr_time = CURRENT_TIMESTAMP
        WHERE
            apt_status = 'Active' OR apt_status = 'Alert'$$

CREATE DEFINER=`root`@`localhost` EVENT `e1` ON SCHEDULE EVERY 1 SECOND STARTS '2022-11-17 09:08:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE notification_tb SET appointment_type = "Appointment Alert", details = "**REMINDER** You Have An Upcoming Appointment!!!", apt_status = "Alert" WHERE alert_time = curr_time$$

CREATE DEFINER=`root`@`localhost` EVENT `e2` ON SCHEDULE EVERY 1 SECOND STARTS '2022-11-17 09:41:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE notification_tb SET appointment_type = "Ended", details = "Your Appointment Has Ended", apt_status = "Inactive" WHERE end_time = curr_time$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
