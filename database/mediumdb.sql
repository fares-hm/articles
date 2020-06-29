-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 29, 2020 at 05:02 PM
-- Server version: 5.7.19
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mediumdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `article_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_author` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_date` date NOT NULL,
  `article_content` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_cat_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_article_cat_id_foreign` (`article_cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `article_title`, `article_author`, `article_date`, `article_content`, `article_cat_id`, `created_at`, `updated_at`) VALUES
(1, 'Natus aut.', 'Andres Corwin', '2020-06-17', 'Error saepe eligendi ut voluptas ea. Voluptatem iure necessitatibus quae et natus placeat aut. Eos repellat est nam voluptatum ipsa. Eos voluptatem ut quasi voluptatem vitae.', 2, '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(2, 'Eius.', 'Kamren Rodriguez', '2020-06-09', 'Et pariatur voluptates voluptas dolor non dolores omnis. Et quos quis quo fugit molestiae. Pariatur et soluta impedit odit et quisquam in.', 1, '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(3, 'Neque eum.', 'Martina Wintheiser', '2020-06-21', 'Neque dicta eveniet ipsum. Minus adipisci mollitia culpa dolores rerum. Quo laboriosam quis velit et eaque quae. Et rerum recusandae dolores vero qui voluptas deleniti.', 3, '2020-06-29 13:01:10', '2020-06-29 13:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_desc` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_desc`, `created_at`, `updated_at`) VALUES
(1, 'gutkowski.com', 'Sed minus et distinctio nostrum nihil.', '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(2, 'casper.info', 'Repudiandae molestias odio totam omnis.', '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(3, 'heathcote.com', 'Commodi numquam ipsa veniam veniam.', '2020-06-29 13:01:10', '2020-06-29 13:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image_url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_article_id_foreign` (`article_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image_url`, `article_id`, `created_at`, `updated_at`) VALUES
(1, 'article_1.jpg', 3, '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(2, 'article_1.jpg', 3, '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(3, 'article_1.jpg', 1, '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(4, 'article_1.jpg', 2, '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(5, 'article_1.jpg', 1, '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(6, 'article_1.jpg', 2, '2020-06-29 13:01:10', '2020-06-29 13:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_06_25_070055_create_articles_table', 1),
(5, '2020_06_25_070129_create_images_table', 1),
(6, '2020_06_25_092527_create_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Nathanial Bosco V', 'conn.rashawn@example.org', '2020-06-29 13:01:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'qcarhoLORP', 'user', '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(2, 'Johanna Schaden MD', 'weissnat.cletus@example.com', '2020-06-29 13:01:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'MypJXwG7ij', 'user', '2020-06-29 13:01:10', '2020-06-29 13:01:10'),
(3, 'Tiara Herzog II', 'isteuber@example.org', '2020-06-29 13:01:10', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'e2jjSv56EO', 'user', '2020-06-29 13:01:10', '2020-06-29 13:01:10');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
