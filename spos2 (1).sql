-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 16, 2019 at 04:26 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spos2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tec_categories`
--

CREATE TABLE `tec_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'G01', 'General', 'no_image.png'),
(2, 'C1', 'African Dishes', 'no_image.png'),
(3, 'C2', 'Beverages', 'no_image.png'),
(4, 'C3', 'Breakfast', 'no_image.png'),
(5, 'C4', 'Drinks', 'no_image.png'),
(6, 'C5', 'Pasta', 'no_image.png'),
(7, 'C6', 'Protein', 'no_image.png'),
(8, 'C7', 'Rice ', 'no_image.png'),
(9, 'C8', 'Small Chops', 'no_image.png'),
(10, 'C9', 'Soups', 'no_image.png'),
(11, 'C10', 'Swallows', 'no_image.png');

-- --------------------------------------------------------

--
-- Table structure for table `tec_combo_items`
--

CREATE TABLE `tec_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_customers`
--

CREATE TABLE `tec_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`, `store_id`) VALUES
(1, 'Walk-in Client', '', '', '012345678', 'customer@tecdiary.com', NULL),
(2, 'Waiting  Customer', '', '', '08095205404', 'hazdelightrestaurant@yahoo.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_expenses`
--

CREATE TABLE `tec_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_gift_cards`
--

CREATE TABLE `tec_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_groups`
--

CREATE TABLE `tec_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Table structure for table `tec_login_attempts`
--

CREATE TABLE `tec_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_payments`
--

CREATE TABLE `tec_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`, `store_id`) VALUES
(1, '2019-04-27 01:56:22', 1, 1, NULL, 'cash', '', '', '', '', '', '', '500.0000', NULL, 1, NULL, '', '500.0000', '0.0000', '', NULL, NULL, NULL, 1),
(2, '2019-04-27 02:36:12', 2, 1, NULL, 'cash', '', '', '', '', '', '', '2000.0000', NULL, 2, NULL, '', '2000.0000', '0.0000', '', NULL, NULL, NULL, 1),
(3, '2019-04-27 02:37:30', 2, 1, NULL, 'cash', '', '', '', '', '', 'Visa', '700.0000', NULL, 2, NULL, '', '0.0000', '0.0000', '', '', NULL, NULL, 1),
(4, '2019-04-27 14:18:03', 3, 2, NULL, 'cash', '', '', '', '', '', '', '5145.0000', NULL, 1, NULL, '', '6000.0000', '855.0000', '', NULL, NULL, NULL, 1),
(5, '2019-05-10 13:01:26', 4, 1, NULL, 'cash', '', '', '', '', '', '', '7100.0000', NULL, 1, NULL, '', '8000.0000', '900.0000', '', NULL, NULL, NULL, 1),
(6, '2019-06-28 19:15:00', 5, 2, NULL, 'cash', NULL, NULL, NULL, NULL, NULL, NULL, '2700.0000', NULL, 1, NULL, '', '300.0000', '-2700.0000', NULL, '', 1, '2019-06-28 19:16:45', 1),
(7, '2019-06-29 10:17:32', 6, 1, NULL, 'cash', '', '', '', '', '', '', '63000.0000', NULL, 1, NULL, '', '63000.0000', '0.0000', '', NULL, NULL, NULL, 1),
(8, '2019-06-29 11:58:21', 7, 1, NULL, 'cash', '', '', '', '', '', '', '800.0000', NULL, 1, NULL, '', '800.0000', '0.0000', '', NULL, NULL, NULL, 1),
(9, '2019-07-01 04:14:13', 8, 1, NULL, 'cash', '', '', '', '', '', '', '2700.0000', NULL, 1, NULL, '', '2700.0000', '0.0000', '', NULL, NULL, NULL, 1),
(10, '2019-07-04 15:21:49', 9, 1, NULL, 'cash', '', '', '', '', '', '', '6800.0000', NULL, 1, NULL, '', '6800.0000', '0.0000', '', NULL, NULL, NULL, 1),
(11, '2019-07-04 17:01:41', 10, 1, NULL, 'cash', '', '', '', '', '', '', '1400.0000', NULL, 1, NULL, '', '1400.0000', '0.0000', '', NULL, NULL, NULL, 1),
(12, '2019-07-04 17:22:24', 11, 1, NULL, 'cash', '', '', '', '', '', '', '2000.0000', NULL, 1, NULL, '', '2000.0000', '0.0000', '', NULL, NULL, NULL, 1),
(13, '2019-07-06 11:54:21', 12, 1, NULL, 'cash', '', '', '', '', '', '', '3600.0000', NULL, 1, NULL, '', '3600.0000', '0.0000', '', NULL, NULL, NULL, 1),
(14, '2019-07-06 11:56:02', 13, 1, NULL, 'cash', '', '', '', '', '', '', '1300.0000', NULL, 1, NULL, '', '1300.0000', '0.0000', '', NULL, NULL, NULL, 1),
(15, '2019-07-06 14:35:24', 14, 1, NULL, 'Debit Card', '', '', '', '', '', '', '500.0000', NULL, 1, NULL, '', '500.0000', '-500.0000', '', NULL, NULL, NULL, 1),
(16, '2019-07-06 14:40:51', 15, 1, NULL, 'cash', '', '', '', '', '', '', '1200.0000', NULL, 2, NULL, '', '1200.0000', '0.0000', '', NULL, NULL, NULL, 1),
(17, '2019-07-06 14:42:26', 16, 2, NULL, 'Debit Card', '', '', '', '', '', '', '830.0000', NULL, 2, NULL, '', '830.0000', '-830.0000', '', NULL, NULL, NULL, 1),
(18, '2019-07-06 14:43:02', 17, 1, NULL, 'Debit Card', '', '', '', '', '', '', '500.0000', NULL, 2, NULL, '', '500.0000', '-500.0000', '', NULL, NULL, NULL, 1),
(19, '2019-07-13 19:02:18', 18, 2, NULL, 'cash', '', '', '', '', '', '', '80000.0000', NULL, 1, NULL, '', '80000.0000', '0.0000', '', NULL, NULL, NULL, 1),
(20, '2019-07-13 19:03:32', 19, 1, NULL, 'cash', '', '', '', '', '', '', '80000.0000', NULL, 1, NULL, '', '80000.0000', '0.0000', '', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_printers`
--

CREATE TABLE `tec_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_printers`
--

INSERT INTO `tec_printers` (`id`, `title`, `type`, `profile`, `char_per_line`, `path`, `ip_address`, `port`) VALUES
(1, 'XPrinter', 'network', 'default', 45, '', 0x3139322e3136382e312e323030, '9100');

-- --------------------------------------------------------

--
-- Table structure for table `tec_products`
--

CREATE TABLE `tec_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `price` decimal(25,4) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT '1',
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text,
  `alert_quantity` decimal(10,4) DEFAULT '0.0000',
  `sellasid` smallint(6) NOT NULL DEFAULT '0',
  `sellasvalue` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`, `sellasid`, `sellasvalue`) VALUES
(1, 'PR-001', 'Afang Soup', 10, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 3, 40),
(2, 'PR-002', 'Amala', 11, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(3, 'PR-003', 'Amstel Malta', 5, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(4, 'PR-004', 'Assorted', 7, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(5, 'PR-005', 'Beans Porridge (Mama Africa)', 2, '800.0000', 'no_image.png', '0', '800.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(6, 'PR-006', 'Beef', 7, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(7, 'PR-007', 'Big Coke', 5, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(8, 'PR-008', 'Bitter Leaf Soup', 10, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(9, 'PR-009', 'Boiled yam / Tomato egg sauce', 4, '600.0000', 'no_image.png', '0', '600.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(10, 'PR-010', 'Chicken', 7, '500.0000', 'no_image.png', '0', '500.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(11, 'PR-011', 'Chinese Egg Fried Rice', 8, '600.0000', 'no_image.png', '0', '600.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(12, 'PR-012', 'Chinese Special Fried Rice', 8, '800.0000', 'no_image.png', '0', '800.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(13, 'PR-013', 'Chivita', 5, '700.0000', 'no_image.png', '0', '700.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(14, 'PR-014', 'Club Sandwich', 9, '500.0000', 'no_image.png', '0', '500.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(15, 'PR-015', 'Complete English Breakfast (Toast Bread, Sunny side up eggs, pancake, kidey sauce, baked beans, chicken part)', 4, '2000.0000', 'no_image.png', '0', '2000.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(16, 'PR-016', 'Coslow', 6, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(17, 'PR-017', 'Cow Leg', 7, '600.0000', 'no_image.png', '0', '600.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(18, 'PR-018', 'Dry', 7, '800.0000', 'no_image.png', '0', '800.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(19, 'PR-019', 'Eba', 11, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(20, 'PR-020', 'Egusi Soup', 10, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(21, 'PR-021', 'Ewedu /Gbegiri (Abula)', 10, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(22, 'PR-022', 'Fayrouz', 5, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(23, 'PR-023', 'Fish Titus', 7, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(24, 'PR-024', 'Five Alive', 5, '700.0000', 'no_image.png', '0', '700.0000', 1, '1.0000', 'code39', 'standard', '', '0.0000', 1, 24),
(25, 'PR-025', 'French Fries Sausages or Eggs', 4, '700.0000', 'no_image.png', '0', '700.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(26, 'PR-026', 'Fresh Fish(Cat Fish)', 7, '1000.0000', 'no_image.png', '0', '1000.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(27, 'PR-027', 'Fried Rice', 8, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', '', '0.0000', 1, 24),
(28, 'PR-028', 'Fried Yam wit Omelet Vegetable Sauce', 4, '700.0000', 'no_image.png', '0', '700.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(29, 'PR-029', 'Goat Meat', 7, '300.0000', 'no_image.png', '0', '300.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(30, 'PR-030', 'Green Salad', 6, '300.0000', 'no_image.png', '0', '300.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(31, 'PR-031', 'Haz Delight Chicken Salad', 6, '1500.0000', 'no_image.png', '0', '1500.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(32, 'PR-032', 'Haz Delight Chinese Rice Combo', 8, '1500.0000', 'no_image.png', '0', '1500.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(33, 'PR-033', 'Jollof Rice', 8, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(34, 'PR-034', 'Maltina', 5, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(35, 'PR-035', 'Moi Moi', 2, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', '', '0.0000', 1, 24),
(36, 'PR-036', 'Ogbono Soup', 10, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(37, 'PR-037', 'Oha Soup', 10, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(38, 'PR-038', 'Pounded Yam', 11, '300.0000', 'no_image.png', '0', '300.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(39, 'PR-039', 'Semovita', 11, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(40, 'PR-040', 'Spaghetti Bolognese (Spaghetti in mincemeat tomato sauce on a bed of vegetables)', 6, '1500.0000', 'no_image.png', '0', '1500.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(41, 'PR-041', 'Spaghetti Jollof', 6, '500.0000', 'no_image.png', '0', '500.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(42, 'PR-042', 'Spaghetti with tomato sauce', 6, '500.0000', 'no_image.png', '0', '500.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(43, 'PR-043', 'Tea and Coffee', 3, '250.0000', 'no_image.png', '0', '250.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 2, 24),
(44, 'PR-044', 'Vegetable Soup', 10, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(45, 'PR-045', 'Water', 5, '100.0000', 'no_image.png', '0', '100.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(46, 'PR-046', 'Wheat', 11, '200.0000', 'no_image.png', '0', '200.0000', 1, '1.0000', 'code39', 'standard', NULL, '0.0000', 1, 24),
(47, 'PR-047', 'White Rice', 8, '400.0000', 'no_image.png', '0', '400.0000', 1, '1.0000', 'code39', 'standard', '', '0.0000', 1, 24),
(48, 'PR048', 'White Soup(With Chicken or Goat)', 10, '1400.0000', 'no_image.png', '0', '1400.0000', 1, '1.0000', 'code39', 'standard', '', '0.0000', 1, 24),
(49, 'TIGAErr', 'Crate Of Malt', 5, '2700.0000', 'no_image.png', '0', '2400.0000', 1, '0.0000', 'code128', 'standard', 'crates', '1.0000', 3, 40),
(50, 'TIGAEsad', 'Half Crate Of Malt', 5, '1400.0000', 'no_image.png', '0', '1200.0000', 1, '0.0000', 'code128', 'standard', '', '1.0000', 2, 24),
(51, '18539dd', 'Beta Malt', 5, '150.0000', 'no_image.png', '0', '100.0000', 1, '0.0000', 'code128', 'standard', '', '0.0000', 1, 24),
(52, '18539dd565', 'Zureta Malt', 5, '150.0000', 'no_image.png', '0', '100.0000', 1, '0.0000', 'code128', 'standard', '', '0.0000', 1, 24),
(53, '7216782135ef', 'Zuri Malt', 5, '530.0000', 'no_image.png', '0', '330.0000', 1, '0.0000', 'code128', 'standard', '', '0.0000', 1, 24),
(54, '100001hhhhhhh', 'chrispie juice half pack', 3, '1400.0000', 'no_image.png', '0', '100.0000', 1, '0.0000', 'code128', 'standard', '', '4.0000', 3, 40),
(55, '18539', 'Glow', 11, '1400.0000', 'no_image.png', '0', '100.0000', 1, '0.0000', 'code128', 'standard', '', '5.0000', 3, 40),
(56, '18539rfdd', 'Mary Kay', 1, '5000.0000', 'no_image.png', '0', '330.0000', 1, '0.0000', 'code128', 'standard', '', '0.0000', 1, 24),
(57, '8996882', 'Isakobo', 3, '400.0000', 'no_image.png', '0', '200.0000', 1, '0.0000', 'code128', 'standard', '', '0.0000', 3, 40),
(58, 'sfdsdf', 'lkldf', 4, '4455.0000', 'no_image.png', '0', '450.0000', 0, '0.0000', 'code128', 'standard', '', '0.0000', 2, 24),
(59, '44444', 'Omo', 3, '500.0000', 'no_image.png', '0', '100.0000', 1, '0.0000', 'code128', 'standard', '', '5.0000', 3, 40);

-- --------------------------------------------------------

--
-- Table structure for table `tec_product_store_qty`
--

CREATE TABLE `tec_product_store_qty` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_product_store_qty`
--

INSERT INTO `tec_product_store_qty` (`id`, `product_id`, `store_id`, `quantity`, `price`) VALUES
(1, 48, 1, '155.0000', '1400.0000'),
(2, 47, 1, '10.0000', '400.0000'),
(3, 24, 1, '3.0000', '700.0000'),
(4, 27, 1, '200.0000', '400.0000'),
(5, 35, 1, '184.0000', '400.0000'),
(6, 49, 1, '1152.0000', '2700.0000'),
(7, 50, 1, '60.0000', '1400.0000'),
(8, 52, 1, '-1.0000', '150.0000'),
(9, 53, 1, '5.0000', '530.0000'),
(10, 54, 1, '143.0000', '1400.0000'),
(11, 55, 1, '3.0000', '1400.0000'),
(12, 56, 1, '96.0000', '5000.0000'),
(13, 57, 1, '188.0000', '400.0000'),
(14, 58, 1, '5.0000', '4455.0000'),
(15, 59, 1, '49.0000', '500.0000');

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchases`
--

CREATE TABLE `tec_purchases` (
  `id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchase_items`
--

CREATE TABLE `tec_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_registers`
--

CREATE TABLE `tec_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`, `store_id`) VALUES
(1, '2019-04-26 23:12:34', 1, '0.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, '2019-04-27 02:11:08', 2, '0.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_sales`
--

CREATE TABLE `tec_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(10,4) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `hold_ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`, `store_id`, `hold_ref`) VALUES
(1, '2019-04-27 02:56:22', 1, 'Walk-in Client', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '500.0000', 1, '2.0000', '500.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(2, '2019-04-27 03:36:12', 1, 'Walk-in Client', '2000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '2000.0000', 1, '1.0000', '2700.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(3, '2019-04-27 15:18:03', 2, 'Waiting  Customer', '4900.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '5%', '245.0000', '245.0000', '5145.0000', 3, '10.0000', '5145.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, 'hey'),
(4, '2019-05-10 14:01:26', 1, 'Walk-in Client', '7100.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '7100.0000', 4, '10.0000', '7100.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(5, '2019-06-28 20:15:29', 2, 'Waiting  Customer', '3000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '3000.0000', 1, '5.0000', '2700.0000', 1, 1, '2019-06-28 21:50:43', '', 'partial', '0.0000', 1, ''),
(6, '2019-06-29 11:17:32', 1, 'Walk-in Client', '63000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '63000.0000', 1, '45.0000', '63000.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(7, '2019-06-29 12:58:21', 1, 'Walk-in Client', '800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '800.0000', 1, '2.0000', '800.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(8, '2019-07-01 05:14:13', 1, 'Walk-in Client', '2700.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '2700.0000', 1, '1.0000', '2700.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(9, '2019-07-04 16:21:49', 1, 'Walk-in Client', '6800.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '6800.0000', 3, '11.0000', '6800.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(10, '2019-07-04 18:01:41', 1, 'Walk-in Client', '1400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '1400.0000', 1, '1.0000', '1400.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(11, '2019-07-04 18:22:24', 1, 'Walk-in Client', '2000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '2000.0000', 2, '3.0000', '2000.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(12, '2019-07-06 12:54:21', 1, 'Walk-in Client', '3600.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '3600.0000', 2, '8.0000', '3600.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(13, '2019-07-06 12:56:02', 1, 'Walk-in Client', '1300.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '1300.0000', 2, '3.0000', '1300.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(14, '2019-07-06 15:35:24', 1, 'Walk-in Client', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '500.0000', 1, '1.0000', '500.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(15, '2019-07-06 15:40:51', 1, 'Walk-in Client', '1200.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '1200.0000', 2, '2.0000', '1200.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(16, '2019-07-06 15:42:26', 2, 'Waiting  Customer', '830.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '830.0000', 3, '3.0000', '830.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(17, '2019-07-06 15:43:02', 1, 'Walk-in Client', '500.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '500.0000', 2, '2.0000', '500.0000', 2, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(18, '2019-07-13 20:02:18', 2, 'Waiting  Customer', '80000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '80000.0000', 1, '5.0000', '80000.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(19, '2019-07-13 20:03:32', 1, 'Walk-in Client', '80000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '0%', '0.0000', '0.0000', '80000.0000', 1, '5.0000', '80000.0000', 1, NULL, NULL, '', 'paid', '0.0000', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_sale_items`
--

CREATE TABLE `tec_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT '0.0000',
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`, `product_code`, `product_name`, `comment`) VALUES
(1, 1, 43, '2.0000', '250.0000', '250.0000', '0', '0.0000', 0, '0.0000', '500.0000', '250.0000', '250.0000', 'PR-043', 'Tea and Coffee', ''),
(2, 2, 15, '1.0000', '2000.0000', '2000.0000', '0', '0.0000', 0, '0.0000', '2000.0000', '2000.0000', '2000.0000', 'PR-015', 'Complete English Breakfast (Toast Bread, Sunny sid', ''),
(3, 3, 32, '1.0000', '1500.0000', '1500.0000', '0', '0.0000', 0, '0.0000', '1500.0000', '1500.0000', '1500.0000', 'PR-032', 'Haz Delight Chinese Rice Combo', ''),
(4, 3, 39, '1.0000', '200.0000', '200.0000', '0', '0.0000', 0, '0.0000', '200.0000', '200.0000', '200.0000', 'PR-039', 'Semovita', ''),
(5, 3, 47, '8.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '3200.0000', '400.0000', '400.0000', 'PR-047', 'White Rice', ''),
(6, 4, 11, '6.0000', '600.0000', '600.0000', '0', '0.0000', 0, '0.0000', '3600.0000', '600.0000', '600.0000', 'PR-011', 'Chinese Egg Fried Rice', ''),
(7, 4, 12, '2.0000', '800.0000', '800.0000', '0', '0.0000', 0, '0.0000', '1600.0000', '800.0000', '800.0000', 'PR-012', 'Chinese Special Fried Rice', ''),
(8, 4, 27, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '400.0000', 'PR-027', 'Fried Rice', ''),
(9, 4, 32, '1.0000', '1500.0000', '1500.0000', '0', '0.0000', 0, '0.0000', '1500.0000', '1500.0000', '1500.0000', 'PR-032', 'Haz Delight Chinese Rice Combo', ''),
(13, 5, 11, '5.0000', '600.0000', '600.0000', '0', '0.0000', 0, '0.0000', '3000.0000', '600.0000', '600.0000', 'PR-011', 'Chinese Egg Fried Rice', ''),
(14, 6, 48, '45.0000', '1400.0000', '1400.0000', '0', '0.0000', 0, '0.0000', '63000.0000', '1400.0000', '1400.0000', 'PR048', 'White Soup(With Chicken or Goat)', ''),
(15, 7, 35, '2.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '800.0000', '400.0000', '400.0000', 'PR-035', 'Moi Moi', ''),
(16, 8, 49, '1.0000', '2700.0000', '2700.0000', '0', '0.0000', 0, '0.0000', '2700.0000', '2700.0000', '2400.0000', 'TIGAErr', 'Crate Of Malt', ''),
(17, 9, 5, '2.0000', '800.0000', '800.0000', '0', '0.0000', 0, '0.0000', '1600.0000', '800.0000', '800.0000', 'PR-005', 'Beans Porridge (Mama Africa)', ''),
(18, 9, 18, '4.0000', '800.0000', '800.0000', '0', '0.0000', 0, '0.0000', '3200.0000', '800.0000', '800.0000', 'PR-018', 'Dry', ''),
(19, 9, 35, '5.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '2000.0000', '400.0000', '400.0000', 'PR-035', 'Moi Moi', ''),
(20, 10, 54, '1.0000', '1400.0000', '1400.0000', '0', '0.0000', 0, '0.0000', '1400.0000', '1400.0000', '100.0000', '100001hhhhhhh', 'chrispie juice half pack', ''),
(21, 11, 5, '2.0000', '800.0000', '800.0000', '0', '0.0000', 0, '0.0000', '1600.0000', '800.0000', '800.0000', 'PR-005', 'Beans Porridge (Mama Africa)', ''),
(22, 11, 35, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '400.0000', 'PR-035', 'Moi Moi', ''),
(23, 12, 5, '1.0000', '800.0000', '800.0000', '0', '0.0000', 0, '0.0000', '800.0000', '800.0000', '800.0000', 'PR-005', 'Beans Porridge (Mama Africa)', ''),
(24, 12, 35, '7.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '2800.0000', '400.0000', '400.0000', 'PR-035', 'Moi Moi', ''),
(25, 13, 10, '1.0000', '500.0000', '500.0000', '0', '0.0000', 0, '0.0000', '500.0000', '500.0000', '500.0000', 'PR-010', 'Chicken', ''),
(26, 13, 57, '2.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '800.0000', '400.0000', '200.0000', '8996882', 'Isakobo', ''),
(27, 14, 59, '1.0000', '500.0000', '500.0000', '0', '0.0000', 0, '0.0000', '500.0000', '500.0000', '100.0000', '44444', 'Omo', ''),
(28, 15, 5, '1.0000', '800.0000', '800.0000', '0', '0.0000', 0, '0.0000', '800.0000', '800.0000', '800.0000', 'PR-005', 'Beans Porridge (Mama Africa)', ''),
(29, 15, 35, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '400.0000', 'PR-035', 'Moi Moi', ''),
(30, 16, 51, '1.0000', '150.0000', '150.0000', '0', '0.0000', 0, '0.0000', '150.0000', '150.0000', '100.0000', '18539dd', 'Beta Malt', ''),
(31, 16, 52, '1.0000', '150.0000', '150.0000', '0', '0.0000', 0, '0.0000', '150.0000', '150.0000', '100.0000', '18539dd565', 'Zureta Malt', ''),
(32, 16, 53, '1.0000', '530.0000', '530.0000', '0', '0.0000', 0, '0.0000', '530.0000', '530.0000', '330.0000', '7216782135ef', 'Zuri Malt', ''),
(33, 17, 16, '1.0000', '200.0000', '200.0000', '0', '0.0000', 0, '0.0000', '200.0000', '200.0000', '200.0000', 'PR-016', 'Coslow', ''),
(34, 17, 30, '1.0000', '300.0000', '300.0000', '0', '0.0000', 0, '0.0000', '300.0000', '300.0000', '300.0000', 'PR-030', 'Green Salad', ''),
(35, 18, 57, '5.0000', '16000.0000', '16000.0000', '0', '0.0000', 0, '0.0000', '80000.0000', '16000.0000', '200.0000', '8996882', 'Isakobo', ''),
(36, 19, 57, '5.0000', '16000.0000', '16000.0000', '0', '0.0000', 0, '0.0000', '80000.0000', '16000.0000', '200.0000', '8996882', 'Isakobo', '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_sellas`
--

CREATE TABLE `tec_sellas` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `sellasvalue` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sellas`
--

INSERT INTO `tec_sellas` (`id`, `code`, `name`, `sellasvalue`) VALUES
(1, '20carton', 'Carton', 24),
(2, '12carton', 'Carton', 12),
(3, '40carton', 'Carton', 40);

-- --------------------------------------------------------

--
-- Table structure for table `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('09722d112ca49d3a09e1631b7e5c3e47c455407d', '::1', 1562862057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323836323035373b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383435343337223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('0b501a1bad9a4a06ec631b68f271a868f5180440', '::1', 1563033131, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033333133313b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('0f6418afbaf4e6063f825bb26c94243432076ea6', '::1', 1562865044, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323836353034343b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383435343337223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('122358728c59ac3ab239a8f42d5bcb0545ec9bc4', '::1', 1563266222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333236343937333b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353633313832363537223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('13eabd361852685dab69fa26698965d158298870', '::1', 1562863689, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323836333638393b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383435343337223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('201363faf614779763133288b54fa23ca00faf4e', '::1', 1562864293, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323836343239333b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383435343337223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('22adffa45036183b0db20110ed6cb3d64b6bcfbe', '::1', 1563034697, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033343639373b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('2cd1fc10637dcb3a07e1d2efefda3bd71203ea0a', '::1', 1563021124, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333032313132323b6572726f727c733a33373a223c703e4c6f67696e204661696c65642c20506c656173652074727920616761696e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226e6577223b7d),
('3523265bd80174db43cf9c9163c1af0178cf011c', '::1', 1562860283, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323836303238333b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383435343337223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('35c9ca044d28bc3c08a445807a1296bfc8bde808', '::1', 1563028338, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333032383333383b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('3a641fe06780abfd6dcaa5a249646c66f2652abd', '::1', 1562861304, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323836313330343b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383435343337223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('586ec2a58d9adedb80601606d46a4c29587b1d12', '::1', 1562880414, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323838303336383b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383538323131223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b637372666b65797c733a383a22774f4e556c304546223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a224f6d6e3453446371424a56476b517a5278483574223b),
('5b8e3751fc5c26e8b31a15125c0bce1c573fd5d4', '::1', 1563034237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033343233373b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('5dd15f873737cc0f7d1d0dbb63db6a7d91a2b0ec', '::1', 1563024599, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333032343539393b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('6415a8cab4bdb5283a79ec83888c722a15167bb2', '::1', 1563162515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333136323531353b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353633303836313135223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('677996dcd1831e6fd2ac7ccb8fbcfa91440b41a3', '::1', 1563037900, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033373635363b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('6e0666343cc655dae5ed124f1355d5a2208b1183', '::1', 1562905199, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323930353139363b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383830333734223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('6e63abd31d0404a4f32b9c25e9f886630809cb7d', '::1', 1562944315, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323934343331353b),
('7884dc2de7b977d3b6da2d41ebd7193696a52dd5', '::1', 1563019686, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333031393638363b),
('82a4038bd8d05cc1710d52fd35d303dd81918106', '::1', 1563036582, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033363538323b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('8750c4f141b6f72f5f24c4a8bcc5b3c876dc6f68', '::1', 1563162088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333136323038383b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353633303836313135223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('960376aea68b51e145be3d024ceeae693d72ffaf', '::1', 1563021638, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333032313633383b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('9c3620689992d2b1396f2d3412bacea60a7871bc', '::1', 1562870115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323837303034313b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383435343337223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('9d9bc84d09849f717cd5200a388e512ae8ce24ea', '::1', 1563037656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033373635363b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('9da63282537e9a5d5833ab94309684c2a94e67ef', '::1', 1562865345, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323836353334353b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383435343337223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('a1bc382879e28df8995624189b54ddaf79846c60', '::1', 1563028034, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333032383033343b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('a35cbe8b6e62edfc9790c7da73d7405caf50ec6d', '::1', 1562870041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323837303034313b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383435343337223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('a6cbc96b97be184aa6dbe149b36a24b0bd154454', '::1', 1563032237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033323233373b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('ac826a6800c8af21a4d96bde274416f6e901dbb4', '::1', 1563032822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033323832323b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('b9cf09275015601f19272e9a37f8c5873495d186', '::1', 1563033907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033333930373b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('c99c76ff191a09ee68a0b476cba755c1e2e6e9ef', '::1', 1563086240, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333038363130373b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353633303231313531223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('d2da34111d0f5cf6f9908eb7f9b5b338ed4b44d1', '::1', 1563182664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333138323635373b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353633313630363233223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('d5b2d9e194c1258272933684e947246e50414512', '::1', 1562858749, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536323835383734393b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632383435343337223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('da290555b50b69c3ef59651cc12a6bbe245f5602', '::1', 1563162515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333136323531353b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353633303836313135223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('dd6da0ea8a0f7247c4484eed51b701ec5c0f627b', '::1', 1563160947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333136303934373b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353633303836313135223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('eda6e8c43733099f93bf7734855aa0be3abd9f47', '::1', 1563031719, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033313731393b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('f32dadcc1a73c8b97f3cb60600499349ed0277cb', '::1', 1563033490, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033333439303b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b),
('fe772e36c47c6b159c4a421b8f641bdfdeba25d0', '::1', 1563035292, 0x5f5f63695f6c6173745f726567656e65726174657c693a313536333033353239323b6964656e746974797c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a32313a226b72697370796f6e756d7340676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353632393035313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323031392d30342d32372030303a31323a3334223b);

-- --------------------------------------------------------

--
-- Table structure for table `tec_settings`
--

CREATE TABLE `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `header` varchar(1000) DEFAULT NULL,
  `footer` varchar(1000) DEFAULT NULL,
  `bsty` tinyint(4) NOT NULL,
  `display_kb` tinyint(4) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) DEFAULT NULL,
  `pro_limit` tinyint(4) NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT '2',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint(4) DEFAULT '42',
  `rounding` tinyint(1) DEFAULT '0',
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `theme_style` varchar(25) DEFAULT 'green',
  `after_sale_page` tinyint(1) DEFAULT NULL,
  `overselling` tinyint(1) DEFAULT '1',
  `multi_store` tinyint(1) DEFAULT NULL,
  `qty_decimals` tinyint(1) DEFAULT '2',
  `symbol` varchar(55) DEFAULT NULL,
  `sac` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `local_printers` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `print_img` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`, `theme_style`, `after_sale_page`, `overselling`, `multi_store`, `qty_decimals`, `symbol`, `sac`, `display_symbol`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `rtl`, `print_img`) VALUES
(1, 'logo.png', 'Krispy POS', '08095205404', 'D j M Y', 'h:i A', 'hazdelightrestaurant@yahoo.com', 'english', '4.0.24', 'default', 'Asia/Kuala_Lumpur', 'mail', 'pop.gmail.com', 'noreply@spos.tecdiary.my', '', '25', '', 0, 0, NULL, 'NGN', 1, '0%', 10, 30, NULL, NULL, 3, 0, 5, '0', 1, NULL, 10, 2, ',', '.', 'ALT+F1', 'ALT+F2', 'ALT+F10', 'ALT+F5', 'ALT+F6', 'ALT+F11', 'ALT+F12', 'FCT', 'Ctrl+F1', 'Ctrl+F2', 'ALT+F7', 0, '', '', '', 42, 1, '1324', 0, '', '', '65806230-5697-4f94-89f4-49275c3c19d8', 'sgr1875', 'black-light', 0, 1, 0, 0, 'N', 0, 0, 1, 1, 'null', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tec_stores`
--

CREATE TABLE `tec_stores` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `receipt_header` text,
  `receipt_footer` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_stores`
--

INSERT INTO `tec_stores` (`id`, `name`, `code`, `logo`, `email`, `phone`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `currency_code`, `receipt_header`, `receipt_footer`) VALUES
(1, 'HazDelight Restaurant', 'POS', 'logo.png', 'hazdelightrestaurant@yahoo.com', '08095205404', '106 Ajose Adeogun Street Utako Abuja    ', '', 'Utako', 'FCT', '900108', 'Nigeria', 'MYR', '', 'Thanks for your patronage');

-- --------------------------------------------------------

--
-- Table structure for table `tec_suppliers`
--

CREATE TABLE `tec_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_suppliers`
--

INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(1, 'Test Supplier', '1', '2', '0123456789', 'supplier@tecdairy.com');

-- --------------------------------------------------------

--
-- Table structure for table `tec_suspended_items`
--

CREATE TABLE `tec_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_suspended_sales`
--

CREATE TABLE `tec_suspended_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_users`
--

CREATE TABLE `tec_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '2',
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) VALUES
(1, 0x3a3a31, 0x3132372e302e302e31, 'admin', '025cda468f1fa1240a22b0d6917387accad39051', NULL, 'krispyonums@gmail.com', NULL, NULL, NULL, '2c99086cecda49cdbd33c79239b0b24680dccbe7', 1435204774, 1563264996, 1, 'Admin', 'Admin', 'Tecdiary', '012345678', NULL, 'male', 1, NULL),
(2, 0x3a3a31, 0x3a3a31, 'salesperson', '5ee2e844f7bce6e88e6a0d83287afaf65f438ec0', NULL, 'ngandapps@gmail.com', NULL, NULL, NULL, 'a54f7b5fe81c2dd2af0bc8c9cbb4ac8360135a2a', 1556314676, 1562407813, 1, 'Sales', 'Person', NULL, '07083789726', '360f42850a774348e359b3180d57b1f2.png', 'male', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_user_logins`
--

CREATE TABLE `tec_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_user_logins`
--

INSERT INTO `tec_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2019-04-26 18:39:26'),
(2, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2019-04-26 21:32:19'),
(3, 2, NULL, 0x3a3a31, 'salesperson', '2019-04-26 21:39:47'),
(4, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-04-26 21:40:40'),
(5, 1, NULL, 0x3139322e3136382e34332e313335, 'krispyonums@gmail.com', '2019-04-27 09:45:32'),
(6, 1, NULL, 0x3139322e3136382e34332e3434, 'krispyonums@gmail.com', '2019-04-27 09:49:04'),
(7, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-05-05 12:09:00'),
(8, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-05-10 08:30:41'),
(9, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-05-20 09:45:13'),
(10, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-05-21 12:57:44'),
(11, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-05-24 07:53:21'),
(12, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-05-24 07:54:20'),
(13, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-11 16:26:35'),
(14, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-13 12:54:29'),
(15, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-16 13:43:08'),
(16, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-18 19:18:10'),
(17, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-19 10:33:24'),
(18, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-20 03:17:05'),
(19, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-24 15:53:13'),
(20, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-26 02:53:26'),
(21, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-28 07:02:15'),
(22, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-29 05:46:25'),
(23, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-06-30 06:34:04'),
(24, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-01 06:26:00'),
(25, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-02 02:50:48'),
(26, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-02 20:10:31'),
(27, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-03 15:29:03'),
(28, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-04 05:32:15'),
(29, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-05 05:16:40'),
(30, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-05 19:34:17'),
(31, 2, NULL, 0x3a3a31, 'salesperson', '2019-07-06 10:10:13'),
(32, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-07 05:48:33'),
(33, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-08 00:38:25'),
(34, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-08 19:46:51'),
(35, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-08 19:54:30'),
(36, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-11 04:06:45'),
(37, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-11 21:26:14'),
(38, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-13 12:32:31'),
(39, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-14 06:35:15'),
(40, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-15 03:17:03'),
(41, 1, NULL, 0x3a3a31, 'krispyonums@gmail.com', '2019-07-16 08:16:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tec_categories`
--
ALTER TABLE `tec_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_customers`
--
ALTER TABLE `tec_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `tec_groups`
--
ALTER TABLE `tec_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_payments`
--
ALTER TABLE `tec_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_printers`
--
ALTER TABLE `tec_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_products`
--
ALTER TABLE `tec_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_registers`
--
ALTER TABLE `tec_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sales`
--
ALTER TABLE `tec_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sellas`
--
ALTER TABLE `tec_sellas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sessions`
--
ALTER TABLE `tec_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tec_settings`
--
ALTER TABLE `tec_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `tec_stores`
--
ALTER TABLE `tec_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_users`
--
ALTER TABLE `tec_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_customers`
--
ALTER TABLE `tec_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_groups`
--
ALTER TABLE `tec_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_payments`
--
ALTER TABLE `tec_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tec_printers`
--
ALTER TABLE `tec_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_products`
--
ALTER TABLE `tec_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_registers`
--
ALTER TABLE `tec_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tec_sales`
--
ALTER TABLE `tec_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tec_sellas`
--
ALTER TABLE `tec_sellas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_stores`
--
ALTER TABLE `tec_stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
