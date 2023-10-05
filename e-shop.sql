-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2023 at 01:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Shop All Male & Female Clothings', 'aaaaaaaaa', '/storage/photos/1/Banner/banner-design (1).jpg', '<p>up to 10%</p>', 'inactive', '2023-09-30 00:21:03', '2023-10-05 04:59:55'),
(2, 'up to 10%', 'up-to-10', '/storage/photos/1/banner-design.jpg', '<p>Male &amp; Female Clothings<br></p>', 'active', '2023-10-05 04:19:40', '2023-10-05 04:54:54');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Easy', 'easy', 'active', '2023-09-30 00:28:16', '2023-09-30 00:28:16'),
(2, 'Yellow', 'yellow', 'active', '2023-09-30 00:28:41', '2023-09-30 00:28:41'),
(3, 'Richman', 'richman', 'active', '2023-09-30 00:28:54', '2023-09-30 00:28:54');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 2, 900.00, 'new', 4, 3600.00, '2023-09-30 01:14:06', '2023-09-30 01:15:36'),
(2, 8, 2, 2, 2200.00, 'new', 2, 4400.00, '2023-09-30 03:27:18', '2023-09-30 03:34:38'),
(3, 8, 3, 2, 2200.00, 'new', 5, 11000.00, '2023-09-30 03:36:33', '2023-09-30 03:38:52'),
(4, 8, NULL, 2, 2200.00, 'new', 3, 6600.00, '2023-09-30 03:39:52', '2023-09-30 03:39:52'),
(6, 10, 7, 1, 2200.00, 'new', 2, 4400.00, '2023-10-05 05:06:44', '2023-10-05 05:25:39'),
(7, 9, 7, 1, 2200.00, 'new', 3, 6600.00, '2023-10-05 05:07:05', '2023-10-05 05:25:39'),
(8, 7, 7, 1, 3600.00, 'new', 2, 8000.00, '2023-10-05 05:09:51', '2023-10-05 05:25:39'),
(9, 8, 7, 1, 2200.00, 'new', 3, 6600.00, '2023-10-05 05:13:34', '2023-10-05 05:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dress', 'dress', '<h2 class=\"elementor-heading-title elementor-size-default\" style=\"color: rgb(84, 84, 84); margin-right: 0px; margin-bottom: 0px; margin-left: 0px; text-rendering: optimizespeed; width: 1104px; line-height: 1; font-size: 1.6em; font-family: var( --e-global-typography-primary-font-family ),Sans-serif; font-weight: var( --e-global-typography-primary-font-weight ); padding: 0px; text-align: center;\">Shop All Male &amp; Female Clothings</h2>', '/storage/photos/1/Category/mini-banner1.jpg', 1, NULL, NULL, 'active', '2023-09-30 00:26:48', '2023-09-30 00:26:48'),
(2, 'Female', 'female', NULL, '/storage/photos/1/Category/mini-banner2.jpg', 1, NULL, NULL, 'active', '2023-09-30 00:27:18', '2023-09-30 00:27:38'),
(3, 'man', 'man', NULL, '/storage/photos/1/Category/mini-banner3.jpg', 1, NULL, NULL, 'active', '2023-09-30 00:44:43', '2023-09-30 00:44:43');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'summer', 'percent', 5.00, 'active', '2023-09-30 03:53:20', '2023-09-30 03:53:20'),
(2, 'fall', 'fixed', 50.00, 'active', '2023-09-30 03:53:34', '2023-09-30 03:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_07_10_021010_create_brands_table', 1),
(6, '2020_07_10_025334_create_banners_table', 1),
(7, '2020_07_10_112147_create_categories_table', 1),
(8, '2020_07_11_063857_create_products_table', 1),
(9, '2020_07_12_073132_create_post_categories_table', 1),
(10, '2020_07_12_073701_create_post_tags_table', 1),
(11, '2020_07_12_083638_create_posts_table', 1),
(12, '2020_07_13_151329_create_messages_table', 1),
(13, '2020_07_14_023748_create_shippings_table', 1),
(14, '2020_07_15_054356_create_orders_table', 1),
(15, '2020_07_15_102626_create_carts_table', 1),
(16, '2020_07_16_041623_create_notifications_table', 1),
(17, '2020_07_16_053240_create_coupons_table', 1),
(18, '2020_07_23_143757_create_wishlists_table', 1),
(19, '2020_07_24_074930_create_product_reviews_table', 1),
(20, '2020_07_24_131727_create_post_comments_table', 1),
(21, '2020_08_01_143408_create_settings_table', 1),
(22, '2023_06_21_164432_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('3ae7a3c2-d60d-4a55-a79f-07c1a7b84781', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2023-10-05 05:13:23', '2023-10-05 05:13:23'),
('618817cc-db58-4cae-bdee-4a7ec6376593', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/blog-detail\\/you-are-not-just-talented-you-are-spiritually-gifted\",\"fas\":\"fas fa-comment\"}', NULL, '2023-09-30 03:58:51', '2023-09-30 03:58:51'),
('85a3a054-fe52-40e0-88ee-d427b7875821', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', NULL, '2023-09-30 03:34:38', '2023-09-30 03:34:38'),
('881bddf5-e782-4313-9b1f-9e86cf36f0af', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2023-10-05 05:25:39', '2023-10-05 05:25:39'),
('8e05634d-7355-4e6c-a8df-9f7a2de973fc', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2023-10-05 05:08:26', '2023-10-05 05:08:26'),
('ace0affe-6b9c-4012-8ab5-041ce4cff3be', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', '2023-09-30 01:51:50', '2023-09-30 01:15:36', '2023-09-30 01:51:50'),
('f59da461-e1ca-439a-b0fc-9ff2246b46e6', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2023-10-05 05:16:45', '2023-10-05 05:16:45'),
('f7cb57f6-c369-4354-9d44-0810ebccb710', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2023-09-30 03:38:52', '2023-09-30 03:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') NOT NULL DEFAULT 'new',
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `country` varchar(191) NOT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text NOT NULL,
  `address2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(1, 'ORD-XNIMABUOGT', 2, 3600.00, 1, NULL, 3670.00, 4, 'cod', 'unpaid', 'new', 'maria', 'mondol', 'hamim7@gmail.com', '38', 'NP', 'Culpa ad suscipit s', '90 Green Old Street', 'Dolores minus et ali', '2023-09-30 01:15:36', '2023-09-30 01:15:36'),
(2, 'ORD-Y6ZCBRX6UT', 2, 4400.00, NULL, NULL, 4400.00, 2, 'paypal', 'paid', 'new', 'Elmo', 'Weiss', 'dubesos@mailinator.com', '89', 'NP', 'Ratione consequatur', '277 Oak Drive', 'Ipsum ut sint asper', '2023-09-30 03:34:38', '2023-09-30 03:34:38'),
(3, 'ORD-20USVZNUCP', 2, 11000.00, 1, NULL, 11070.00, 5, 'cod', 'unpaid', 'new', 'Shannon', 'Campos', 'admin@gmail.com', '01965235458', 'BD', '1230', '90 Green Old Street', 'Dolores minus et ali', '2023-09-30 03:38:52', '2023-09-30 03:38:52'),
(7, 'ORD-5XGGFMH32D', 1, 25600.00, 1, NULL, 25670.00, 10, 'cod', 'unpaid', 'new', 'Shannon', 'Campos', 'hamim@gmail.com', '01652369512', 'NP', 'Et sapiente rerum ex', '766 East Hague Court', 'Facilis suscipit eos', '2023-10-05 05:25:39', '2023-10-05 05:25:39');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '$2y$10$fRHP62xcReFNa55mD0GLxOaJqPQugNu7yVPn4Pjv3ZLOEfh0t/rMW', '2023-09-30 00:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'You Are Not Just Talented, You Are Spiritually Gifted', 'you-are-not-just-talented-you-are-spiritually-gifted', '<p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif; font-size: 17.5px;\"><em>Now about&nbsp;<span style=\"font-weight: 700;\">the gifts of the Spirit</span>, brothers and sisters, I do not want you to be uninformed…</em></p>', '<p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\">We are not talking about “spiritual” as some nebulous, impersonal energy. Rather, spiritual gifts come exclusively from the Holy Spirit. He is the source and sustenance of spiritual gifts. Having the Holy Spirit is a necessary prerequisite to unleashing our spiritual gifts.</p><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\">Each of us is purposed to make a contribution in this life that echoes into eternity. This means that we each have an assignment, and we each need to see and accept that assignment if we are going to fulfill the calling of our lives. You and I can talk circles around purpose all day, but at the end of the day there is something crucial to understand.</p><h3 style=\"font-family: proxima-nova, sans-serif; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 24px;\">We are&nbsp;<em>united</em>&nbsp;in purpose and&nbsp;<em>unique</em>&nbsp;in calling.</h3><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\">There is&nbsp;<em>unity</em>&nbsp;in our singular purpose to glorify God and enjoy him forever (shoutout to the credible&nbsp;<em>Westminster Catechism</em>). We are teammates, working together to enact God’s plan of redemption in the world. Yet, we are&nbsp;<em>unique</em>&nbsp;in our calling. Our calling is the unique way in which God has wired us, equipped us, and assigned us to contribute to and advance his kingdom. This is not limited to our spiritual gifts, but it certainly includes them! And even in 1 Corinthians 12, Paul is not exhausting all the spiritual gifts, but using a few as an example to serve his point about how the body of Christ (you, me,&nbsp;<em>we</em>) works together.</p><blockquote style=\"padding: 10px 20px; margin-bottom: 20px; font-size: 17.5px; border-left: 5px solid rgb(230, 230, 230); border-top-color: rgb(230, 230, 230); border-right-color: rgb(230, 230, 230); border-bottom-color: rgb(230, 230, 230); color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\"><p class=\"p1\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><em>“For those who lead and have a tendency toward pride and self-sufficiency, it may be humbling to know that God wants them to depend on and be built up by others with different gifts. For others, though, this will mean accepting what God has given them and then living and working in the community for the benefit of the body, knowing that this is their God-given and Spirit-enabled duty to the body. Just as there is no place for pride, so there is no place for false humility.”</em><span class=\"Apple-converted-space\">&nbsp;(</span>Paul Gardner,&nbsp;<i>1 Corinthians</i>, Zondervan Exegetical Commentary on the New Testament, 554.)</p></blockquote><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\">Our spiritual gifts are an essential part of our contribution to the kingdom of God. They are one of the primary ways the gospel works itself in our lives as we serve others. But how can we walk in them if we are not aware of them?</p><h3 style=\"font-family: proxima-nova, sans-serif; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 24px;\">We need to know our Holy Spirit-given gifts if we want to walk in our full purpose and potential.</h3><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\">Here are four action steps to take from here.</p><ul style=\"margin-bottom: 10px; color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\"><li><span style=\"font-weight: 700;\">First</span>, take our&nbsp;<a href=\"https://newbreak.church/spiritual-gifts/\" style=\"color: rgb(0, 7, 213);\"><span style=\"font-weight: 700;\">spiritual gifts test by clicking HERE</span></a>. It is not infallible, but it is a good tool to help you consider how God’s empowering presence (Holy Spirit) wants to work in and through you.</li><li><span style=\"font-weight: 700;\">Second</span>, talk to some other Christians who you respect and who know you well. Ask them what spiritual gifts they see in you. Do not underestimate how someone else can see in you what you might not see in yourself!</li><li><span style=\"font-weight: 700;\">Third</span>, study biblical passages on these things. You may have noticed we did not unpack the spiritual gifts in this blog post. It would take quite some time to do so! Plus, let’s give you some homework and ownership here. Pick up some commentaries on 1 Corinthians and read how scholars shed light on what Paul is saying about spiritual gifts (especially 1 Corinthians 12-14). The&nbsp;<a href=\"https://www.christianbook.com/corinthians-zondervan-exegetical-commentary-new-testament/paul-gardner/9780310243694/pd/243690\" style=\"color: rgb(0, 7, 213);\">Zondervan Exegetical Commentary on 1 Corinthians</a>&nbsp;is phenomenal, though at times it can be geared toward an academic audience. If you need a more lay-level commentary try the&nbsp;<a href=\"https://www.amazon.com/1-Corinthians-NIV-Application-Commentary/dp/0310484901/ref=sr_1_1?crid=2TZI7QH1CO4S0&amp;keywords=1+corinthians+niv+application+commentary&amp;qid=1675800424&amp;sprefix=1+corinthians+niv+application+commentary%2Caps%2C134&amp;sr=8-1\" style=\"color: rgb(0, 7, 213);\">NIV Application Commentary on 1 Corinthians</a>&nbsp;or&nbsp;<a href=\"https://www.amazon.com/Corinthians-You-Gods-Word/dp/1784986232/ref=sr_1_17_sspa?crid=DWALOLXQUY5&amp;keywords=zent+1+corinthians&amp;qid=1675800244&amp;sprefix=zecnt+1+corinthians%2Caps%2C448&amp;sr=8-17-spons&amp;psc=1&amp;spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUExRk5MVThIMlNQNkdWJmVuY3J5cHRlZElkPUEwNTc1MTgwMkhDTFRRWFMwVVhLOCZlbmNyeXB0ZWRBZElkPUEwNTk1OTc2MjFaMUwxUVJHNTlQMyZ3aWRnZXROYW1lPXNwX210ZiZhY3Rpb249Y2xpY2tSZWRpcmVjdCZkb05vdExvZ0NsaWNrPXRydWU=\" style=\"color: rgb(0, 7, 213);\">1 Corinthians For You</a>.</li><li><span style=\"font-weight: 700;\">Fourth</span>, but not least, put your spiritual gifts into practice!</li></ul><h3 style=\"font-family: proxima-nova, sans-serif; line-height: 1.4; color: rgb(51, 51, 51); margin-top: 20px; margin-bottom: 10px; font-size: 24px;\">The Holy Spirit does not give you these gifts for them to be like a trophy on a shelf. They are meant to be used for the sake of others!</h3><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\">As we read what Paul said:</p><blockquote style=\"padding: 10px 20px; margin-bottom: 20px; font-size: 17.5px; border-left: 5px solid rgb(230, 230, 230); border-top-color: rgb(230, 230, 230); border-right-color: rgb(230, 230, 230); border-bottom-color: rgb(230, 230, 230); color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\"><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\"><em>Now to each one the manifestation of the Spirit is given&nbsp;<span style=\"font-weight: 700;\">for the common good</span>.&nbsp;</em>(<a class=\"rtBibleRef\" href=\"https://biblia.com/bible/niv/1%20Cor%2012.7\" data-reference=\"1 Cor 12.7\" data-version=\"niv\" data-purpose=\"bible-reference\" style=\"color: rgb(0, 7, 213);\">1 Corinthians 12:7, NIV</a>)</p></blockquote><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\">You want to make a difference in the world, right? Learn and use your spiritual gifts!</p>', '<p><span style=\"color: rgb(27, 27, 27); font-family: proxima-nova, sans-serif;\">And I am not that special for saying that. Most of us want to leave an imprint on the world that makes it better. Sure, maybe our ambitions are vastly different. Some of us dream of influencing the WHOLE world while some of us see OUR world as the people we aim to influence. Nevertheless, all of us want to make a good difference. And that’s a good thing! God wants that for us too.</span><br></p>', '/storage/photos/1/Blog/blog-single1.jpg', 'dress,female,shop,online dress', 1, NULL, 1, 'active', '2023-09-30 03:48:46', '2023-09-30 03:50:46');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Female Dress', 'female-dress', 'active', '2023-09-30 03:44:58', '2023-09-30 03:44:58');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'jfkladjkw', 'active', NULL, NULL, '2023-09-30 03:58:51', '2023-09-30 03:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'dress', 'dress', 'active', '2023-09-30 03:45:14', '2023-09-30 03:45:14'),
(2, 'female', 'female', 'active', '2023-09-30 03:45:30', '2023-09-30 03:45:30'),
(3, 'shop', 'shop', 'active', '2023-09-30 03:45:39', '2023-09-30 03:45:39'),
(4, 'online dress', 'online-dress', 'active', '2023-09-30 03:45:51', '2023-09-30 03:45:51');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Blue Luxury Slim-Fit Formal Shirt by RICHMAN', 'blue-luxury-slim-fit-formal-shirt-by-richman', '<ul style=\"margin-right: 0px; margin-bottom: 25px; margin-left: 0px; padding-left: 0px; list-style-position: initial; list-style-image: initial; clear: both; font-family: &quot;open sans&quot;, sans-serif; font-size: 14px;\"><li style=\"position: relative;\">100% Cotton</li><li style=\"position: relative;\">Slim-fit</li><li style=\"position: relative;\">Button-down collar</li><li style=\"position: relative;\">Adjustable cuffs with buttons</li><li style=\"position: relative;\">Available in sizes S to XXL</li><li style=\"position: relative;\">Blue color</li><li style=\"position: relative;\">Suitable for formal occasions.</li></ul>', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(134, 134, 134); font-family: &quot;open sans&quot;, sans-serif; font-size: 14px;\">Make a lasting impression with this premium Oxford shirt. Crafted from 100% high-quality cotton shirt, this shirt is designed for both comfort and style. The classic white color makes it versatile and suitable for any formal occasion, while the button-down collar adds a touch of sophistication. The shirt features a tailored fit, ensuring a flattering and professional look. The cuffs are finished with adjustable buttons, allowing you to personalize the fit to your preference. Available in sizes S to XXL, you’re sure to find the perfect size for you.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; color: rgb(134, 134, 134); font-family: &quot;open sans&quot;, sans-serif; font-size: 14px;\">4107210651<br>4107210652<br>4107210653<br>4107210654<br>4107210655</p>', '/storage/photos/1/Products/3c47b-pwt001a_1.jpg', 5000, 'S,M,L,XL', 'new', 'active', 3467.00, 5.00, 1, 1, NULL, 3, '2023-09-30 00:42:54', '2023-09-30 00:42:54'),
(2, 'Side Stripe T-shirt by RICHMAN', 'side-stripe-t-shirt-by-richman', '<p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(134, 134, 134); font-family: &quot;open sans&quot;, sans-serif; font-size: 14px;\"><img class=\"alignnone size-medium wp-image-22387\" src=\"https://richmanbd.com/wp-content/uploads/2023/09/Mens-T-Shirt-300x89.png\" alt=\"\" width=\"300\" height=\"89\" style=\"height: auto; max-width: 100%; border: 0px; margin: 0px;\"></p><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px; color: rgb(134, 134, 134); font-family: &quot;open sans&quot;, sans-serif; font-size: 14px;\">Code: 3601110968</p><ul style=\"margin-right: 0px; margin-bottom: 25px; margin-left: 0px; padding-left: 0px; list-style-position: initial; list-style-image: initial; clear: both; font-family: &quot;open sans&quot;, sans-serif; font-size: 14px;\"><li style=\"position: relative;\">100% Cotton</li><li style=\"position: relative;\">White Color</li><li style=\"position: relative;\">Short sleeves</li><li style=\"position: relative;\">Available in sizes S to XXL</li></ul>', '<ul class=\"tabs wc-tabs\" role=\"tablist\" style=\"margin-right: auto; margin-bottom: 0px; margin-left: auto; padding-left: 0px; text-align: center; list-style: none; clear: both; position: relative; display: table; color: rgb(134, 134, 134); font-family: &quot;open sans&quot;, sans-serif; font-size: 14px;\"><li class=\"description_tab active\" id=\"tab-title-description\" role=\"tab\" aria-controls=\"tab-description\" style=\"list-style: none; display: inline-block; margin-right: 20px; margin-left: 20px; text-align: center;\"><a href=\"https://richmanbd.com/product/side-stripe-t-shirt-by-richman/#tab-description\" style=\"color: rgb(0, 0, 0); transition: color 0.3s ease 0s, background-color 0.3s ease 0s, border-color 0.3s ease 0s; font-weight: 700; display: inline-block; text-transform: uppercase; line-height: 26px; letter-spacing: 1px; position: relative; padding: 10px 0px;\">DESCRIPTION</a></li><li class=\"additional_information_tab\" id=\"tab-title-additional_information\" role=\"tab\" aria-controls=\"tab-additional_information\" style=\"list-style: none; display: inline-block; margin-right: 20px; margin-left: 20px; text-align: center;\"><a href=\"https://richmanbd.com/product/side-stripe-t-shirt-by-richman/#tab-additional_information\" style=\"color: rgb(134, 134, 134); transition: color 0.3s ease 0s, background-color 0.3s ease 0s, border-color 0.3s ease 0s; font-weight: 700; display: inline-block; text-transform: uppercase; line-height: 26px; letter-spacing: 1px; position: relative; padding: 10px 0px;\">ADDITIONAL INFORMATION</a></li><li class=\"reviews_tab\" id=\"tab-title-reviews\" role=\"tab\" aria-controls=\"tab-reviews\" style=\"list-style: none; display: inline-block; margin-right: 20px; margin-left: 20px; text-align: center;\"><a href=\"https://richmanbd.com/product/side-stripe-t-shirt-by-richman/#tab-reviews\" style=\"color: rgb(134, 134, 134); transition: color 0.3s ease 0s, background-color 0.3s ease 0s, border-color 0.3s ease 0s; font-weight: 700; display: inline-block; text-transform: uppercase; line-height: 26px; letter-spacing: 1px; position: relative; padding: 10px 0px;\">REVIEWS (0)</a></li></ul><div class=\"woocommerce-Tabs-panel woocommerce-Tabs-panel--description panel entry-content wc-tab\" id=\"tab-description\" role=\"tabpanel\" aria-labelledby=\"tab-title-description\" style=\"margin-bottom: 50px; border: none; border-radius: 4px; box-shadow: none; max-width: 100%; margin-top: 30px; color: rgb(134, 134, 134); font-family: &quot;open sans&quot;, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 20px; margin-left: 0px;\">This classic cotton t-shirt is the perfect addition to your wardrobe. Made from 100% soft and durable cotton, it is designed for all-day comfort. The t-shirt features a classic fit with a ribbed crew neck and short sleeves, making it ideal for casual wear. The black color is versatile and easy to style, making it a must-have for any fashion-conscious individual. Available in sizes S to XXL, you’re sure to find the perfect fit. Whether you’re running errands, hanging out with friends, or just lounging at home, this t-shirt is sure to keep you comfortable and stylish.</p><p style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px;\">3601110967<br>3601110968<br>3601110969<br>3601110970<br>3601110971</p></div>', '/storage/photos/1/Products/0455e-c1.jpg', 1000, 'S,M,L', 'hot', 'active', 900.00, 0.00, 1, 3, NULL, 1, '2023-09-30 00:46:38', '2023-09-30 00:46:38'),
(3, 'Women\'s Twill Pants', 'womens-twill-pants', '<div class=\"product-info\" style=\"margin-bottom: 15px; clear: both; width: 1045.91px; font-family: Arimo; font-size: 12px;\"><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em;\">SKU</label>&nbsp;<span class=\"variant-sku\" style=\"text-transform: capitalize;\">YWT388SL SP23</span><p class=\"product-type\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 1045.91px;\"><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em;\">Product Type</label>&nbsp;<span style=\"text-transform: capitalize;\">Womens Wear</span></p></div><div class=\"short-description\" style=\"margin-bottom: 22px; clear: both; line-height: 20px; font-family: Arimo; font-size: 12px;\"><div class=\"lang1\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px;\"><br></p></div></div>', '<div class=\"product-info\" style=\"margin-bottom: 15px; clear: both; width: 1045.91px; font-family: Arimo; font-size: 12px;\">Women\'s Twill Pants<br></div><div class=\"short-description\" style=\"margin-bottom: 22px; clear: both; line-height: 20px; font-family: Arimo; font-size: 12px;\"><div class=\"lang1\"><ul style=\"margin-bottom: 20px; padding: 0px 0px 0px 30px; list-style-position: inside; list-style-image: none;\"><li style=\"margin-bottom: 0.25em;\">Indigo Stripe</li></ul></div></div>', '/storage/photos/1/Products/4a8a8-image4xxl-2-.jpg', 60, 'S,M,L', 'default', 'active', 499.00, NULL, 1, 2, NULL, 2, '2023-09-30 01:05:42', '2023-09-30 01:05:42'),
(4, 'Women\'s Skirt - Disney', 'womens-skirt-disney', '<p><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em; font-family: Arimo; font-size: 12px;\">SKU</label><span style=\"font-family: Arimo; font-size: 12px;\">&nbsp;</span><span class=\"variant-sku\" style=\"text-transform: capitalize; font-family: Arimo; font-size: 12px;\">DDYLS04 FALL23</span><span style=\"font-family: Arimo; font-size: 12px;\"></span></p><p class=\"product-type\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 1045.91px; font-family: Arimo; font-size: 12px;\"><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em;\">Product Type</label>&nbsp;<span style=\"text-transform: capitalize;\">Womens Wear</span></p>', '<div class=\"short-description\" style=\"margin-bottom: 22px; clear: both; line-height: 20px;\"><div class=\"lang1\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px;\">Women\'s Skirt - Disney</p><ul style=\"margin-bottom: 20px; padding: 0px 0px 0px 30px; list-style-position: inside; list-style-image: none;\"><li style=\"margin-bottom: 0.25em;\">White Printed</li></ul></div></div><div itemprop=\"offers\" itemscope=\"\" itemtype=\"http://schema.org/Offer\"><form action=\"https://www.yellowclothing.net/cart/add\" method=\"post\" enctype=\"multipart/form-data\" id=\"add-to-cart-form\"><variant-swatch-king style=\"font-family: Arimo; font-size: 12px; max-width: 100%;\"><div class=\"swatches swatches-type-products hover-enabled\" style=\"margin-top: 10px; margin-bottom: 10px; max-width: 100%; min-width: 100%; direction: ltr;\"><div id=\"swatch-option1\" option-name=\"Color\" option-target=\"option1\" class=\"\"><div class=\"swatch-single swatch-preset-140749 swatch-view-slide\" style=\"margin-bottom: 10px; padding-right: 0px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-image\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Color</span>&nbsp;<span class=\"swatch-variant-name\" style=\"font-style: inherit;\"><span class=\"swatch-split-symbol\">-</span>&nbsp;WHITE PRINTED</span></label></legend><div class=\"swatch-navigable-wrapper\" style=\"position: relative;\"><div class=\"swatch-navigable\" swatch-slider=\"true\" data-slider-data=\"{&quot;swatchSliderItemWidth&quot;:90,&quot;totalScrollWidth&quot;:90,&quot;sliderWidth&quot;:1045.90625,&quot;visibleSwatches&quot;:10,&quot;marginRight&quot;:16.211805555555557,&quot;assocViewType&quot;:&quot;swatch&quot;,&quot;arrowMode&quot;:&quot;mode_1&quot;}\" style=\"width: 1045.91px; margin: unset; overflow: hidden; padding: 0px !important;\"><ul class=\"swatch-view swatch-view-image \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; text-wrap: nowrap; transition: none 0s ease 0s; transform: translateX(0px); display: flex; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"WHITE PRINTED\" aria-label=\"WHITE PRINTED\" role=\"radio\" tabindex=\"0\" aria-checked=\"true\" style=\"margin: 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-left: 0px; padding-right: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-selected swatch-allow-animation\" type=\"image\" data-value=\"WHITE PRINTED\" orig-value=\"WHITE PRINTED\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(0, 0, 0); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/files/YLWJULY_1655.jpg?v=1690369495&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li></ul></div></div></fieldset></div></div><div id=\"swatch-option2\" option-name=\"Size\" option-target=\"option2\" class=\"\"><div class=\"swatch-single swatch-preset-140746 swatch-view-stack\" style=\"margin-bottom: 10px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-button\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Size</span></label></legend><ul class=\"swatch-view swatch-view-button \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"XL\" aria-label=\"XL\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px 12px 0.5rem 0px; position: relative; display: inline-block; max-width: 100%; outline: none; list-style: none !important;\"><div><span swatch-inside=\"true\"><br></span></div></li></ul></fieldset></div></div></div></variant-swatch-king><span style=\"font-family: Arimo; font-size: 12px;\"></span><div id=\"product-variants\" style=\"font-family: Arimo; font-size: 12px;\"><select id=\"product-selectors\" name=\"id\" style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.35; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; appearance: none; padding: 9px 10px; height: auto; border-color: rgb(222, 222, 222); display: none;\">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option selected=\"selected\" value=\"44474470957308\">WHITE PRINTED / S - Tk 2,795.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44474470990076\">WHITE PRINTED / M - Tk 2,795.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44474471022844\">WHITE PRINTED / L - Tk 2,795.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44474471055612\">WHITE PRINTED / XL - Tk 2,795.00</option>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</select></div></form></div>', '/storage/photos/1/Products/0a402-image4xxl-3-.jpg', 600, 'S,M,L,XL', 'hot', 'active', 3000.00, NULL, 1, 2, NULL, 2, '2023-09-30 01:55:47', '2023-09-30 01:55:47'),
(5, 'Women\'s Fashion Tank Top', 'womens-fashion-tank-top', '<p><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em; font-family: Arimo; font-size: 12px;\">SKU</label><span style=\"font-family: Arimo; font-size: 12px;\">&nbsp;</span><span class=\"variant-sku\" style=\"text-transform: capitalize; font-family: Arimo; font-size: 12px;\">WTTF155 EIDF23</span><span style=\"font-family: Arimo; font-size: 12px;\"></span></p><p class=\"product-type\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 1045.91px; font-family: Arimo; font-size: 12px;\"><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em;\">Product Type</label>&nbsp;<span style=\"text-transform: capitalize;\">Womens Wear</span></p>', '<div class=\"short-description\" style=\"margin-bottom: 22px; clear: both; line-height: 20px;\"><div class=\"lang1\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">A sleeveless fashionable tank top for your casual day with nice tassel &amp; frill details in neck made with stripe chiffon fabric for comfort.</span></p><ul style=\"margin-bottom: 20px; padding: 0px 0px 0px 30px; list-style-position: inside; list-style-image: none;\"><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Georgette fabric</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Straight shape</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Casual fit</span></li></ul></div></div><div itemprop=\"offers\" itemscope=\"\" itemtype=\"http://schema.org/Offer\"><form action=\"https://www.yellowclothing.net/cart/add\" method=\"post\" enctype=\"multipart/form-data\" id=\"add-to-cart-form\"><variant-swatch-king style=\"font-family: Arimo; font-size: 12px; max-width: 100%;\"><div class=\"swatches swatches-type-products hover-enabled\" style=\"margin-top: 10px; margin-bottom: 10px; max-width: 100%; min-width: 100%; direction: ltr;\"><div id=\"swatch-option1\" option-name=\"Color\" option-target=\"option1\" class=\"\"><div class=\"swatch-single swatch-preset-140749 swatch-view-slide\" style=\"margin-bottom: 10px; padding-right: 0px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-image\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Color</span>&nbsp;<span class=\"swatch-variant-name\" style=\"font-style: inherit;\"><span class=\"swatch-split-symbol\">-</span>&nbsp;BEIGE STRIPE</span></label></legend><div class=\"swatch-navigable-wrapper\" style=\"position: relative;\"><div class=\"swatch-navigable\" swatch-slider=\"true\" data-slider-data=\"{&quot;swatchSliderItemWidth&quot;:90,&quot;totalScrollWidth&quot;:196.21180555555554,&quot;sliderWidth&quot;:1045.90625,&quot;visibleSwatches&quot;:10,&quot;marginRight&quot;:16.211805555555557,&quot;assocViewType&quot;:&quot;swatch&quot;,&quot;arrowMode&quot;:&quot;mode_1&quot;}\" style=\"width: 1045.91px; margin: unset; overflow: hidden; padding: 0px !important;\"><ul class=\"swatch-view swatch-view-image \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; text-wrap: nowrap; transition: none 0s ease 0s; transform: translateX(0px); display: flex; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"BEIGE STRIPE\" aria-label=\"BEIGE STRIPE\" role=\"radio\" tabindex=\"0\" aria-checked=\"true\" style=\"margin: 0px 16.2118px 0px 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-left: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-selected swatch-allow-animation\" type=\"image\" data-value=\"BEIGE STRIPE\" orig-value=\"BEIGE STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(0, 0, 0); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1769.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li><li class=\"swatch-view-item\" orig-value=\"AQUA STRIPE\" aria-label=\"AQUA STRIPE\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-right: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-allow-animation\" type=\"image\" data-value=\"AQUA STRIPE\" orig-value=\"AQUA STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1731.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li></ul></div></div></fieldset></div></div><div id=\"swatch-option2\" option-name=\"Size\" option-target=\"option2\" class=\"\"><div class=\"swatch-single swatch-preset-140746 swatch-view-stack\" style=\"margin-bottom: 10px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-button\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Size</span></label></legend><ul class=\"swatch-view swatch-view-button \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"XL\" aria-label=\"XL\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px 12px 0.5rem 0px; position: relative; display: inline-block; max-width: 100%; outline: none; list-style: none !important;\"><div><span swatch-inside=\"true\"><br></span></div></li></ul></fieldset></div></div></div></variant-swatch-king><span style=\"font-family: Arimo; font-size: 12px;\"></span><div id=\"product-variants\" style=\"font-family: Arimo; font-size: 12px;\"><select id=\"product-selectors\" name=\"id\" style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.35; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; appearance: none; padding: 9px 10px; height: auto; border-color: rgb(222, 222, 222); display: none;\">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option selected=\"selected\" value=\"44262072910076\">BEIGE STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072942844\">BEIGE STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072975612\">BEIGE STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073008380\">BEIGE STRIPE / XL - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073041148\">AQUA STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073073916\">AQUA STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073106684\">AQUA STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073139452\">AQUA STRIPE / XL - Tk 1,095.00</option>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</select></div></form></div>', '/storage/photos/1/Products/21951-image4xxl.jpg', 1200, 'S,M,L,XL', 'hot', 'active', 4000.00, 9.00, 1, 2, NULL, 1, '2023-09-30 01:58:48', '2023-09-30 01:58:48'),
(6, 'Women\'s Fashion Tank Top', 'womens-fashion-tank-top-2309305901-333', '<p><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em; font-family: Arimo; font-size: 12px;\">SKU</label><span style=\"font-family: Arimo; font-size: 12px;\">&nbsp;</span><span class=\"variant-sku\" style=\"text-transform: capitalize; font-family: Arimo; font-size: 12px;\">WTTF155 EIDF23</span><span style=\"font-family: Arimo; font-size: 12px;\"></span></p><p class=\"product-type\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 1045.91px; font-family: Arimo; font-size: 12px;\"><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em;\">Product Type</label>&nbsp;<span style=\"text-transform: capitalize;\">Womens Wear</span></p>', '<div class=\"short-description\" style=\"margin-bottom: 22px; clear: both; line-height: 20px;\"><div class=\"lang1\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">A sleeveless fashionable tank top for your casual day with nice tassel &amp; frill details in neck made with stripe chiffon fabric for comfort.</span></p><ul style=\"margin-bottom: 20px; padding: 0px 0px 0px 30px; list-style-position: inside; list-style-image: none;\"><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Georgette fabric</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Straight shape</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Casual fit</span></li></ul></div></div><div itemprop=\"offers\" itemscope=\"\" itemtype=\"http://schema.org/Offer\"><form action=\"https://www.yellowclothing.net/cart/add\" method=\"post\" enctype=\"multipart/form-data\" id=\"add-to-cart-form\"><variant-swatch-king style=\"font-family: Arimo; font-size: 12px; max-width: 100%;\"><div class=\"swatches swatches-type-products hover-enabled\" style=\"margin-top: 10px; margin-bottom: 10px; max-width: 100%; min-width: 100%; direction: ltr;\"><div id=\"swatch-option1\" option-name=\"Color\" option-target=\"option1\" class=\"\"><div class=\"swatch-single swatch-preset-140749 swatch-view-slide\" style=\"margin-bottom: 10px; padding-right: 0px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-image\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Color</span>&nbsp;<span class=\"swatch-variant-name\" style=\"font-style: inherit;\"><span class=\"swatch-split-symbol\">-</span>&nbsp;BEIGE STRIPE</span></label></legend><div class=\"swatch-navigable-wrapper\" style=\"position: relative;\"><div class=\"swatch-navigable\" swatch-slider=\"true\" data-slider-data=\"{&quot;swatchSliderItemWidth&quot;:90,&quot;totalScrollWidth&quot;:196.21180555555554,&quot;sliderWidth&quot;:1045.90625,&quot;visibleSwatches&quot;:10,&quot;marginRight&quot;:16.211805555555557,&quot;assocViewType&quot;:&quot;swatch&quot;,&quot;arrowMode&quot;:&quot;mode_1&quot;}\" style=\"width: 1045.91px; margin: unset; overflow: hidden; padding: 0px !important;\"><ul class=\"swatch-view swatch-view-image \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; text-wrap: nowrap; transition: none 0s ease 0s; transform: translateX(0px); display: flex; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"BEIGE STRIPE\" aria-label=\"BEIGE STRIPE\" role=\"radio\" tabindex=\"0\" aria-checked=\"true\" style=\"margin: 0px 16.2118px 0px 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-left: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-selected swatch-allow-animation\" type=\"image\" data-value=\"BEIGE STRIPE\" orig-value=\"BEIGE STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(0, 0, 0); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1769.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li><li class=\"swatch-view-item\" orig-value=\"AQUA STRIPE\" aria-label=\"AQUA STRIPE\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-right: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-allow-animation\" type=\"image\" data-value=\"AQUA STRIPE\" orig-value=\"AQUA STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1731.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li></ul></div></div></fieldset></div></div><div id=\"swatch-option2\" option-name=\"Size\" option-target=\"option2\" class=\"\"><div class=\"swatch-single swatch-preset-140746 swatch-view-stack\" style=\"margin-bottom: 10px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-button\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Size</span></label></legend><ul class=\"swatch-view swatch-view-button \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"XL\" aria-label=\"XL\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px 12px 0.5rem 0px; position: relative; display: inline-block; max-width: 100%; outline: none; list-style: none !important;\"><div><span swatch-inside=\"true\"><br></span></div></li></ul></fieldset></div></div></div></variant-swatch-king><span style=\"font-family: Arimo; font-size: 12px;\"></span><div id=\"product-variants\" style=\"font-family: Arimo; font-size: 12px;\"><select id=\"product-selectors\" name=\"id\" style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.35; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; appearance: none; padding: 9px 10px; height: auto; border-color: rgb(222, 222, 222); display: none;\">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option selected=\"selected\" value=\"44262072910076\">BEIGE STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072942844\">BEIGE STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072975612\">BEIGE STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073008380\">BEIGE STRIPE / XL - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073041148\">AQUA STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073073916\">AQUA STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073106684\">AQUA STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073139452\">AQUA STRIPE / XL - Tk 1,095.00</option>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</select></div></form></div>', '/storage/photos/1/Products/calvin.jpg', 1200, 'S,M,L,XL', 'hot', 'active', 4000.00, 9.00, 1, 2, NULL, 2, '2023-09-30 01:59:01', '2023-09-30 02:09:55');
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(7, 'Women Fashion Tank Top', 'women-fashion-tank-top', '<p><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em; font-family: Arimo; font-size: 12px;\">SKU</label><span style=\"font-family: Arimo; font-size: 12px;\">&nbsp;</span><span class=\"variant-sku\" style=\"text-transform: capitalize; font-family: Arimo; font-size: 12px;\">WTTF155 EIDF23</span><span style=\"font-family: Arimo; font-size: 12px;\"></span></p><p class=\"product-type\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 1045.91px; font-family: Arimo; font-size: 12px;\"><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em;\">Product Type</label>&nbsp;<span style=\"text-transform: capitalize;\">Women\'s Wear</span></p>', '<div class=\"short-description\" style=\"margin-bottom: 22px; clear: both; line-height: 20px;\"><div class=\"lang1\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">A sleeveless fashionable tank top for your casual day with nice tassel &amp; frill details in neck made with stripe chiffon fabric for comfort.</span></p><ul style=\"margin-bottom: 20px; padding: 0px 0px 0px 30px; list-style-position: inside; list-style-image: none;\"><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Georgette fabric</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Straight shape</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Casual fit</span></li></ul></div></div><div itemprop=\"offers\" itemscope=\"\" itemtype=\"http://schema.org/Offer\"><form action=\"https://www.yellowclothing.net/cart/add\" method=\"post\" enctype=\"multipart/form-data\" id=\"add-to-cart-form\"><variant-swatch-king style=\"font-family: Arimo; font-size: 12px; max-width: 100%;\"><div class=\"swatches swatches-type-products hover-enabled\" style=\"margin-top: 10px; margin-bottom: 10px; max-width: 100%; min-width: 100%; direction: ltr;\"><div id=\"swatch-option1\" option-name=\"Color\" option-target=\"option1\" class=\"\"><div class=\"swatch-single swatch-preset-140749 swatch-view-slide\" style=\"margin-bottom: 10px; padding-right: 0px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-image\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Color</span>&nbsp;<span class=\"swatch-variant-name\" style=\"font-style: inherit;\"><span class=\"swatch-split-symbol\">-</span>&nbsp;BEIGE STRIPE</span></label></legend><div class=\"swatch-navigable-wrapper\" style=\"position: relative;\"><div class=\"swatch-navigable\" swatch-slider=\"true\" data-slider-data=\"{&quot;swatchSliderItemWidth&quot;:90,&quot;totalScrollWidth&quot;:196.21180555555554,&quot;sliderWidth&quot;:1045.90625,&quot;visibleSwatches&quot;:10,&quot;marginRight&quot;:16.211805555555557,&quot;assocViewType&quot;:&quot;swatch&quot;,&quot;arrowMode&quot;:&quot;mode_1&quot;}\" style=\"width: 1045.91px; margin: unset; overflow: hidden; padding: 0px !important;\"><ul class=\"swatch-view swatch-view-image \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; text-wrap: nowrap; transition: none 0s ease 0s; transform: translateX(0px); display: flex; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"BEIGE STRIPE\" aria-label=\"BEIGE STRIPE\" role=\"radio\" tabindex=\"0\" aria-checked=\"true\" style=\"margin: 0px 16.2118px 0px 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-left: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-selected swatch-allow-animation\" type=\"image\" data-value=\"BEIGE STRIPE\" orig-value=\"BEIGE STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(0, 0, 0); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1769.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li><li class=\"swatch-view-item\" orig-value=\"AQUA STRIPE\" aria-label=\"AQUA STRIPE\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-right: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-allow-animation\" type=\"image\" data-value=\"AQUA STRIPE\" orig-value=\"AQUA STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1731.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li></ul></div></div></fieldset></div></div><div id=\"swatch-option2\" option-name=\"Size\" option-target=\"option2\" class=\"\"><div class=\"swatch-single swatch-preset-140746 swatch-view-stack\" style=\"margin-bottom: 10px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-button\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Size</span></label></legend><ul class=\"swatch-view swatch-view-button \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"XL\" aria-label=\"XL\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px 12px 0.5rem 0px; position: relative; display: inline-block; max-width: 100%; outline: none; list-style: none !important;\"><div><span swatch-inside=\"true\"><br></span></div></li></ul></fieldset></div></div></div></variant-swatch-king><span style=\"font-family: Arimo; font-size: 12px;\"></span><div id=\"product-variants\" style=\"font-family: Arimo; font-size: 12px;\"><select id=\"product-selectors\" name=\"id\" style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.35; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; appearance: none; padding: 9px 10px; height: auto; border-color: rgb(222, 222, 222); display: none;\">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option selected=\"selected\" value=\"44262072910076\">BEIGE STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072942844\">BEIGE STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072975612\">BEIGE STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073008380\">BEIGE STRIPE / XL - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073041148\">AQUA STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073073916\">AQUA STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073106684\">AQUA STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073139452\">AQUA STRIPE / XL - Tk 1,095.00</option>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</select></div></form></div>', '/storage/photos/1/Products/d3fdb-image2xxl-4-.jpg', 1200, 'S,M,L,XL', 'hot', 'active', 4000.00, 10.00, 1, 2, NULL, 2, '2023-09-30 02:00:31', '2023-09-30 02:09:36'),
(8, 'Women\'s Fashion Tank Top', 'womens-fashion-tank-top-2309300218-654', '<p><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em; font-family: Arimo; font-size: 12px;\">SKU</label><span style=\"font-family: Arimo; font-size: 12px;\">&nbsp;</span><span class=\"variant-sku\" style=\"text-transform: capitalize; font-family: Arimo; font-size: 12px;\">WTTF155 EIDF23</span><span style=\"font-family: Arimo; font-size: 12px;\"></span></p><p class=\"product-type\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 1045.91px; font-family: Arimo; font-size: 12px;\"><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em;\">Product Type</label>&nbsp;<span style=\"text-transform: capitalize;\">Womens Wear</span></p>', '<div class=\"short-description\" style=\"margin-bottom: 22px; clear: both; line-height: 20px;\"><div class=\"lang1\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">A sleeveless fashionable tank top for your casual day with nice tassel &amp; frill details in neck made with stripe chiffon fabric for comfort.</span></p><ul style=\"margin-bottom: 20px; padding: 0px 0px 0px 30px; list-style-position: inside; list-style-image: none;\"><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Georgette fabric</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Straight shape</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Casual fit</span></li></ul></div></div><div itemprop=\"offers\" itemscope=\"\" itemtype=\"http://schema.org/Offer\"><form action=\"https://www.yellowclothing.net/cart/add\" method=\"post\" enctype=\"multipart/form-data\" id=\"add-to-cart-form\"><variant-swatch-king style=\"font-family: Arimo; font-size: 12px; max-width: 100%;\"><div class=\"swatches swatches-type-products hover-enabled\" style=\"margin-top: 10px; margin-bottom: 10px; max-width: 100%; min-width: 100%; direction: ltr;\"><div id=\"swatch-option1\" option-name=\"Color\" option-target=\"option1\" class=\"\"><div class=\"swatch-single swatch-preset-140749 swatch-view-slide\" style=\"margin-bottom: 10px; padding-right: 0px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-image\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Color</span>&nbsp;<span class=\"swatch-variant-name\" style=\"font-style: inherit;\"><span class=\"swatch-split-symbol\">-</span>&nbsp;BEIGE STRIPE</span></label></legend><div class=\"swatch-navigable-wrapper\" style=\"position: relative;\"><div class=\"swatch-navigable\" swatch-slider=\"true\" data-slider-data=\"{&quot;swatchSliderItemWidth&quot;:90,&quot;totalScrollWidth&quot;:196.21180555555554,&quot;sliderWidth&quot;:1045.90625,&quot;visibleSwatches&quot;:10,&quot;marginRight&quot;:16.211805555555557,&quot;assocViewType&quot;:&quot;swatch&quot;,&quot;arrowMode&quot;:&quot;mode_1&quot;}\" style=\"width: 1045.91px; margin: unset; overflow: hidden; padding: 0px !important;\"><ul class=\"swatch-view swatch-view-image \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; text-wrap: nowrap; transition: none 0s ease 0s; transform: translateX(0px); display: flex; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"BEIGE STRIPE\" aria-label=\"BEIGE STRIPE\" role=\"radio\" tabindex=\"0\" aria-checked=\"true\" style=\"margin: 0px 16.2118px 0px 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-left: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-selected swatch-allow-animation\" type=\"image\" data-value=\"BEIGE STRIPE\" orig-value=\"BEIGE STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(0, 0, 0); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1769.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li><li class=\"swatch-view-item\" orig-value=\"AQUA STRIPE\" aria-label=\"AQUA STRIPE\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-right: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-allow-animation\" type=\"image\" data-value=\"AQUA STRIPE\" orig-value=\"AQUA STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(0, 0, 0); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1731.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li></ul></div></div></fieldset></div></div><div id=\"swatch-option2\" option-name=\"Size\" option-target=\"option2\" class=\"\"><div class=\"swatch-single swatch-preset-140746 swatch-view-stack\" style=\"margin-bottom: 10px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-button\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Size</span></label></legend><ul class=\"swatch-view swatch-view-button \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"XL\" aria-label=\"XL\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px 12px 0.5rem 0px; position: relative; display: inline-block; max-width: 100%; outline: none; list-style: none !important;\"><div><span swatch-inside=\"true\"><br></span></div></li></ul></fieldset></div></div></div></variant-swatch-king><span style=\"font-family: Arimo; font-size: 12px;\"></span><div id=\"product-variants\" style=\"font-family: Arimo; font-size: 12px;\"><select id=\"product-selectors\" name=\"id\" style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.35; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; appearance: none; padding: 9px 10px; height: auto; border-color: rgb(222, 222, 222); display: none;\">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option selected=\"selected\" value=\"44262072910076\">BEIGE STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072942844\">BEIGE STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072975612\">BEIGE STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073008380\">BEIGE STRIPE / XL - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073041148\">AQUA STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073073916\">AQUA STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073106684\">AQUA STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073139452\">AQUA STRIPE / XL - Tk 1,095.00</option>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</select></div></form></div>', '/storage/photos/1/Products/a1fe9-pwd002a.jpg', 280, 'S,M,L,XL', 'hot', 'active', 2200.00, NULL, 1, 2, NULL, 1, '2023-09-30 02:02:18', '2023-09-30 02:09:15'),
(9, 'Women\'s Fashion Tank Top', 'womens-fashion-tank-top-2309300248-729', '<p><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em; font-family: Arimo; font-size: 12px;\">SKU</label><span style=\"font-family: Arimo; font-size: 12px;\">&nbsp;</span><span class=\"variant-sku\" style=\"text-transform: capitalize; font-family: Arimo; font-size: 12px;\">WTTF155 EIDF23</span><span style=\"font-family: Arimo; font-size: 12px;\"></span></p><p class=\"product-type\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 1045.91px; font-family: Arimo; font-size: 12px;\"><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em;\">Product Type</label>&nbsp;<span style=\"text-transform: capitalize;\">Womens Wear</span></p>', '<div class=\"short-description\" style=\"margin-bottom: 22px; clear: both; line-height: 20px;\"><div class=\"lang1\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">A sleeveless fashionable tank top for your casual day with nice tassel &amp; frill details in neck made with stripe chiffon fabric for comfort.</span></p><ul style=\"margin-bottom: 20px; padding: 0px 0px 0px 30px; list-style-position: inside; list-style-image: none;\"><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Georgette fabric</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Straight shape</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Casual fit</span></li></ul></div></div><div itemprop=\"offers\" itemscope=\"\" itemtype=\"http://schema.org/Offer\"><form action=\"https://www.yellowclothing.net/cart/add\" method=\"post\" enctype=\"multipart/form-data\" id=\"add-to-cart-form\"><variant-swatch-king style=\"font-family: Arimo; font-size: 12px; max-width: 100%;\"><div class=\"swatches swatches-type-products hover-enabled\" style=\"margin-top: 10px; margin-bottom: 10px; max-width: 100%; min-width: 100%; direction: ltr;\"><div id=\"swatch-option1\" option-name=\"Color\" option-target=\"option1\" class=\"\"><div class=\"swatch-single swatch-preset-140749 swatch-view-slide\" style=\"margin-bottom: 10px; padding-right: 0px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-image\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Color</span>&nbsp;<span class=\"swatch-variant-name\" style=\"font-style: inherit;\"><span class=\"swatch-split-symbol\">-</span>&nbsp;BEIGE STRIPE</span></label></legend><div class=\"swatch-navigable-wrapper\" style=\"position: relative;\"><div class=\"swatch-navigable\" swatch-slider=\"true\" data-slider-data=\"{&quot;swatchSliderItemWidth&quot;:90,&quot;totalScrollWidth&quot;:196.21180555555554,&quot;sliderWidth&quot;:1045.90625,&quot;visibleSwatches&quot;:10,&quot;marginRight&quot;:16.211805555555557,&quot;assocViewType&quot;:&quot;swatch&quot;,&quot;arrowMode&quot;:&quot;mode_1&quot;}\" style=\"width: 1045.91px; margin: unset; overflow: hidden; padding: 0px !important;\"><ul class=\"swatch-view swatch-view-image \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; text-wrap: nowrap; transition: none 0s ease 0s; transform: translateX(0px); display: flex; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"BEIGE STRIPE\" aria-label=\"BEIGE STRIPE\" role=\"radio\" tabindex=\"0\" aria-checked=\"true\" style=\"margin: 0px 16.2118px 0px 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-left: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-selected swatch-allow-animation\" type=\"image\" data-value=\"BEIGE STRIPE\" orig-value=\"BEIGE STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(0, 0, 0); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1769.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li><li class=\"swatch-view-item\" orig-value=\"AQUA STRIPE\" aria-label=\"AQUA STRIPE\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-right: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-allow-animation\" type=\"image\" data-value=\"AQUA STRIPE\" orig-value=\"AQUA STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1731.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li></ul></div></div></fieldset></div></div><div id=\"swatch-option2\" option-name=\"Size\" option-target=\"option2\" class=\"\"><div class=\"swatch-single swatch-preset-140746 swatch-view-stack\" style=\"margin-bottom: 10px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><ul class=\"swatch-view swatch-view-button \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"XL\" aria-label=\"XL\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px 12px 0.5rem 0px; position: relative; display: inline-block; max-width: 100%; outline: none; list-style: none !important;\"><div><span swatch-inside=\"true\"><br></span></div></li></ul></fieldset></div></div></div></variant-swatch-king><span style=\"font-family: Arimo; font-size: 12px;\"></span><div id=\"product-variants\" style=\"font-family: Arimo; font-size: 12px;\"><select id=\"product-selectors\" name=\"id\" style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.35; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; appearance: none; padding: 9px 10px; height: auto; border-color: rgb(222, 222, 222); display: none;\">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option selected=\"selected\" value=\"44262072910076\">BEIGE STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072942844\">BEIGE STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072975612\">BEIGE STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073008380\">BEIGE STRIPE / XL - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073041148\">AQUA STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073073916\">AQUA STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073106684\">AQUA STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073139452\">AQUA STRIPE / XL - Tk 1,095.00</option>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</select></div></form></div>', '/storage/photos/1/Products/2282b-wsd008t.jpg', 280, 'S,M,L,XL', 'hot', 'active', 2200.00, NULL, 1, 2, NULL, 2, '2023-09-30 02:02:48', '2023-09-30 02:07:13');
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(10, 'Women\'s Fashion Tank Top', 'womens-fashion-tank-top-2309300425-651', '<p><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em; font-family: Arimo; font-size: 12px;\">SKU</label><span style=\"font-family: Arimo; font-size: 12px;\">&nbsp;</span><span class=\"variant-sku\" style=\"text-transform: capitalize; font-family: Arimo; font-size: 12px;\">WTTF155 EIDF23</span><span style=\"font-family: Arimo; font-size: 12px;\"></span></p><p class=\"product-type\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; width: 1045.91px; font-family: Arimo; font-size: 12px;\"><label class=\"lang1\" style=\"font-weight: 700; margin: 0px; padding-right: 5px; min-width: 120px; line-height: 25px; letter-spacing: 0.02em;\">Product Type</label>&nbsp;<span style=\"text-transform: capitalize;\">Womens Wear</span></p>', '<div class=\"short-description\" style=\"margin-bottom: 22px; clear: both; line-height: 20px;\"><div class=\"lang1\"><p style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">A sleeveless fashionable tank top for your casual day with nice tassel &amp; frill details in neck made with stripe chiffon fabric for comfort.</span></p><ul style=\"margin-bottom: 20px; padding: 0px 0px 0px 30px; list-style-position: inside; list-style-image: none;\"><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Georgette fabric</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Straight shape</span></li><li style=\"margin-bottom: 0.25em;\"><span data-sheets-userformat=\"{&quot;2&quot;:12861,&quot;3&quot;:{&quot;1&quot;:0},&quot;5&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;6&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;7&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;8&quot;:{&quot;1&quot;:[{&quot;1&quot;:2,&quot;2&quot;:0,&quot;5&quot;:{&quot;1&quot;:2,&quot;2&quot;:0}},{&quot;1&quot;:0,&quot;2&quot;:0,&quot;3&quot;:3},{&quot;1&quot;:1,&quot;2&quot;:0,&quot;4&quot;:1}]},&quot;12&quot;:0,&quot;15&quot;:&quot;Calibri&quot;,&quot;16&quot;:12}\" data-sheets-value=\"{&quot;1&quot;:2,&quot;2&quot;:&quot;*Georgette fabric*Straight shape*Casual fit&quot;}\">Casual fit</span></li></ul></div></div><div itemprop=\"offers\" itemscope=\"\" itemtype=\"http://schema.org/Offer\"><form action=\"https://www.yellowclothing.net/cart/add\" method=\"post\" enctype=\"multipart/form-data\" id=\"add-to-cart-form\"><variant-swatch-king style=\"font-family: Arimo; font-size: 12px; max-width: 100%;\"><div class=\"swatches swatches-type-products hover-enabled\" style=\"margin-top: 10px; margin-bottom: 10px; max-width: 100%; min-width: 100%; direction: ltr;\"><div id=\"swatch-option1\" option-name=\"Color\" option-target=\"option1\" class=\"\"><div class=\"swatch-single swatch-preset-140749 swatch-view-slide\" style=\"margin-bottom: 10px; padding-right: 0px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><legend style=\"color: rgb(51, 51, 51); font-size: 21px; -webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; margin: 0px !important; min-width: 0px !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><label class=\"swatch-label swatch-label-image\" style=\"font-weight: inherit; margin: 0px; color: rgb(0, 0, 0); font-size: 14px;\"><span class=\"swatch-option-name\">Color</span>&nbsp;<span class=\"swatch-variant-name\" style=\"font-style: inherit;\"><span class=\"swatch-split-symbol\">-</span>&nbsp;BEIGE STRIPE</span></label></legend><div class=\"swatch-navigable-wrapper\" style=\"position: relative;\"><div class=\"swatch-navigable\" swatch-slider=\"true\" data-slider-data=\"{&quot;swatchSliderItemWidth&quot;:90,&quot;totalScrollWidth&quot;:196.21180555555554,&quot;sliderWidth&quot;:1045.90625,&quot;visibleSwatches&quot;:10,&quot;marginRight&quot;:16.211805555555557,&quot;assocViewType&quot;:&quot;swatch&quot;,&quot;arrowMode&quot;:&quot;mode_1&quot;}\" style=\"width: 1045.91px; margin: unset; overflow: hidden; padding: 0px !important;\"><ul class=\"swatch-view swatch-view-image \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; text-wrap: nowrap; transition: none 0s ease 0s; transform: translateX(0px); display: flex; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"BEIGE STRIPE\" aria-label=\"BEIGE STRIPE\" role=\"radio\" tabindex=\"0\" aria-checked=\"true\" style=\"margin: 0px 16.2118px 0px 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-left: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-selected swatch-allow-animation\" type=\"image\" data-value=\"BEIGE STRIPE\" orig-value=\"BEIGE STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(0, 0, 0); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1769.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li><li class=\"swatch-view-item\" orig-value=\"AQUA STRIPE\" aria-label=\"AQUA STRIPE\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px; position: relative; display: inline-block; max-width: 100%; outline: none; padding-right: 0px; width: 90px; list-style: none !important;\"><div class=\"swatch-image swatch-selector swatch-allow-animation\" type=\"image\" data-value=\"AQUA STRIPE\" orig-value=\"AQUA STRIPE\" swatch-option=\"option1\" style=\"position: relative; display: grid; grid-template-columns: auto auto auto; align-items: center; background-color: inherit; overflow: visible; cursor: pointer; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); border-radius: 0px; padding: 4px; appearance: none !important; transition: all 0.3s ease-in-out 0s !important;\"><div class=\"star-set-image\" swatch-inside=\"true\" style=\"position: relative; display: inline-block; vertical-align: middle; background-position: center top; background-size: cover; background-repeat: no-repeat; touch-action: manipulation; user-select: none; text-transform: uppercase; height: 80px; width: 80px; border-radius: 0px; border-style: solid; border-width: 1px; border-color: rgb(221, 221, 221); background-image: url(&quot;//www.yellowclothing.net/cdn/shop/products/02MAR23_1731.jpg?v=1678631596&amp;width=160&amp;height=160&amp;crop=top&amp;format=pjpg&quot;); transition: all 0.3s ease-in-out 0s !important;\"></div></div></li></ul></div></div></fieldset></div></div><div id=\"swatch-option2\" option-name=\"Size\" option-target=\"option2\" class=\"\"><div class=\"swatch-single swatch-preset-140746 swatch-view-stack\" style=\"margin-bottom: 10px;\"><fieldset style=\"-webkit-box-align: inherit; align-items: inherit; touch-action: manipulation; user-select: none; display: contents !important; border-width: initial !important; border-style: none !important; background-image: none !important; background-color: transparent !important; appearance: none !important;\"><ul class=\"swatch-view swatch-view-button \" role=\"radiogroup\" style=\"margin: 10px 0px; padding: 0px; list-style: none !important;\"><li class=\"swatch-view-item\" orig-value=\"XL\" aria-label=\"XL\" role=\"radio\" tabindex=\"0\" style=\"margin: 0px 12px 0.5rem 0px; position: relative; display: inline-block; max-width: 100%; outline: none; list-style: none !important;\"><div><span swatch-inside=\"true\"><br></span></div></li></ul></fieldset></div></div></div></variant-swatch-king><span style=\"font-family: Arimo; font-size: 12px;\"></span><div id=\"product-variants\" style=\"font-family: Arimo; font-size: 12px;\"><select id=\"product-selectors\" name=\"id\" style=\"font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.35; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; appearance: none; padding: 9px 10px; height: auto; border-color: rgb(222, 222, 222); display: none;\">&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option selected=\"selected\" value=\"44262072910076\">BEIGE STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072942844\">BEIGE STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262072975612\">BEIGE STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073008380\">BEIGE STRIPE / XL - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073041148\">AQUA STRIPE / S - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073073916\">AQUA STRIPE / M - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073106684\">AQUA STRIPE / L - Tk 1,095.00</option>&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<option value=\"44262073139452\">AQUA STRIPE / XL - Tk 1,095.00</option>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;</select></div></form></div>', '/storage/photos/1/Products/74840-image4xxl-6-.jpg', 280, 'S,M,L,XL', 'hot', 'active', 2200.00, NULL, 1, 2, NULL, 3, '2023-09-30 02:04:25', '2023-09-30 02:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, eu vulputate magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', '<div style=\"text-align: justify;\">Custom software development, web design , graphics design , digital marketing , Apps development, a cyber security company in Bangladesh since 2019 in Bangladesh</div>', '/storage/photos/1/1 (1).png', '/storage/photos/1/blog3.jpg', 'House # 85/2, Road # 4, Mohommadia Housing ltd, Mohommadpur Dhaka-1207', '01303-523442', 'nugortech@gmail.com', '2023-09-30 06:51:49', '2023-10-05 04:02:10');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 70.00, 'active', '2023-09-30 00:57:20', '2023-09-30 00:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'hamim', 'hamim@gmail.com', '2023-09-29 05:30:03', '$2y$10$7mqicALR2R4KDLUyGg3fGOzzJ2BydcQJd1f0yIW69rtvlMQBfDK4K', '/storage/photos/1/D79D48C9-BFDA-48C5-B922-BD17156382DD.jpeg', 'admin', 'fdfd', 'dffd', 'active', 'ltlu0SnazKPZr02mVWSVX09laYytCZxUsxzr24KIpDLSI8E0KeG6j4MZU1TH', '2023-09-29 05:29:54', '2023-09-30 00:50:24'),
(2, 'hamim7', 'hamim7@gmail.com', NULL, '$2y$10$7mqicALR2R4KDLUyGg3fGOzzJ2BydcQJd1f0yIW69rtvlMQBfDK4K', NULL, 'user', NULL, NULL, 'active', NULL, '2023-09-30 00:16:13', '2023-09-30 00:16:13');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, 2, 900.00, 1, 900.00, '2023-09-30 01:13:55', '2023-09-30 01:13:55'),
(2, 9, NULL, 1, 2200.00, 1, 2200.00, '2023-10-05 05:06:57', '2023-10-05 05:06:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
