-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 28, 2020 at 06:13 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `article_title`, `article_author`, `article_date`, `article_content`, `article_cat_id`, `created_at`, `updated_at`) VALUES
(1, 'In aut.', 'Lilyan Donnelly', '2020-06-02', 'Nobis inventore consectetur neque. Nam in delectus eos deleniti non expedita odit qui. Consectetur fugit officia et non. Ducimus qui repellat quis impedit. Inventore beatae dolore et quasi.', 2, '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(2, 'Omnis.', 'Alycia Collins', '2020-06-09', 'Rerum sunt vel accusamus doloribus voluptatem ducimus a. Hic aut sapiente occaecati. Maiores illum dolores qui reiciendis ratione.', 3, '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(3, 'Atque et.', 'Esta Rodriguez PhD', '2020-06-23', 'Voluptas mollitia qui eum quas odit voluptate. Quis in aliquam ut autem est. Fuga fugit voluptates illum et nemo.', 1, '2020-06-26 07:21:19', '2020-06-26 07:21:19');

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_desc`, `created_at`, `updated_at`) VALUES
(1, 'graham.info', 'Quo eaque excepturi inventore rerum voluptas.', '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(2, 'schuster.com', 'Eos ut vero sit vel.', '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(3, 'gorczany.biz', 'Id et blanditiis culpa fugiat ut qui.', '2020-06-26 07:21:19', '2020-06-26 07:21:19');

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
(1, 'images/article_1.jpg', 2, '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(2, 'images/article_1.jpg', 1, '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(3, 'images/article_1.jpg', 2, '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(4, 'images/article_1.jpg', 3, '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(5, 'images/article_1.jpg', 1, '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(6, 'images/article_1.jpg', 3, '2020-06-26 07:21:19', '2020-06-26 07:21:19');

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
(1, 'Jake Dickens', 'rahul.witting@example.org', '2020-06-26 07:21:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'zyoHLn7TiL', 'user', '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(2, 'Prof. Cloyd Sanford', 'angelica67@example.org', '2020-06-26 07:21:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'HX4uQItglH', 'user', '2020-06-26 07:21:19', '2020-06-26 07:21:19'),
(3, 'Prof. Pasquale Ernser', 'zaria.dubuque@example.org', '2020-06-26 07:21:19', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'OuhQ7mngAl', 'user', '2020-06-26 07:21:19', '2020-06-26 07:21:19');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
