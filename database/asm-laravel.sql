-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 13, 2024 at 04:05 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asm-laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 17, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(2, 12, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(3, 10, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(4, 2, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(5, 16, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(6, 6, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(7, 11, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(8, 5, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(9, 19, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(10, 4, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(12, 18, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(13, 14, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(14, 3, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(15, 7, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(16, 15, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(17, 8, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(18, 9, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(19, 1, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(20, 13, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(21, 25, '2024-10-11 02:39:35', '2024-10-11 02:39:35'),
(22, 26, '2024-10-11 03:35:36', '2024-10-11 03:35:36'),
(23, 31, '2024-10-12 22:20:24', '2024-10-12 22:20:24'),
(24, 33, '2024-11-07 03:52:50', '2024-11-07 03:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `cart_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 19, 4, 6, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(2, 4, 7, 8, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(3, 14, 2, 6, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(4, 10, 2, 6, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(5, 8, 1, 6, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(6, 6, 10, 7, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(7, 15, 9, 5, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(8, 17, 6, 7, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(9, 18, 5, 5, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(10, 3, 10, 4, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(11, 7, 9, 1, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(12, 2, 8, 2, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(13, 20, 7, 1, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(14, 13, 8, 9, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(15, 16, 2, 8, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(16, 5, 9, 7, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(17, 1, 3, 2, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(18, 12, 5, 1, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(19, 9, 7, 7, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(34, 22, 97, 1, '2024-10-14 19:53:08', '2024-10-14 19:53:08'),
(37, 24, 98, 1, '2024-11-07 03:52:50', '2024-11-07 03:52:50');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Rau1', '2024-10-10 08:43:32', '2024-10-12 20:35:57'),
(2, 'Similique.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(3, 'Et.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(4, 'Doloribus.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(5, 'Qui et.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(6, 'Esse.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(7, 'Excepturi.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(8, 'Fugiat.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(9, 'Nobis sit.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(10, 'Illum.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(11, 'Et sed.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(12, 'Facilis.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(13, 'Quia.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(14, 'Mollitia.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(15, 'Quibusdam.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(16, 'Aut.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(17, 'Enim.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(18, 'Ea ut eum.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(19, 'Sed.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(20, 'Tempore.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(21, 'Dolores.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(22, 'Pariatur.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(23, 'Possimus.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(24, 'Numquam.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(25, 'Omnis.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(26, 'Cumque.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(27, 'Vel.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(28, 'Eum vel.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(29, 'Atque eum.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(30, 'Enim quod.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(31, 'Dolor id.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(32, 'Dolore.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(33, 'Aperiam.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(34, 'Quo.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(35, 'Ea.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(36, 'Unde.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(37, 'Rerum.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(38, 'Iure.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(39, 'Atque.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(40, 'Neque.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(41, 'Explicabo.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(42, 'Iusto.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(43, 'Totam.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(44, 'Labore.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(45, 'Autem vel.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(46, 'Eum.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(47, 'Quo eos.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(48, 'Velit.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(49, 'Molestiae.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(50, 'Nesciunt.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(51, 'Dolorem.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(52, 'Quis qui.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(53, 'Incidunt.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(54, 'Modi.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(55, 'Placeat.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(56, 'Quaerat.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(57, 'Facere.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(58, 'Porro.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(59, 'A veniam.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(60, 'Earum.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(61, 'Eos dicta.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(62, 'Et sit.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(63, 'Repellat.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(64, 'Ipsum.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(65, 'Quis.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(66, 'Ut velit.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(67, 'Culpa.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(68, 'Assumenda.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(69, 'At.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(70, 'Harum.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(71, 'Nihil.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(72, 'Expedita.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(73, 'Eum odit.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(74, 'Vitae.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(75, 'Optio in.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(76, 'Quod.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(77, 'Sed ut.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(78, 'Ex beatae.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(79, 'Est.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(80, 'Officia.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(81, 'Vel at.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(82, 'Ducimus.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(83, 'Et rerum.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(84, 'Ut sit.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(85, 'Debitis.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(86, 'Eaque.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(87, 'Id quod.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(88, 'Rem qui.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(89, 'Voluptate.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(90, 'Illum qui.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(91, 'Non.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(92, 'Natus.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(93, 'Qui.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(94, 'Ut facere.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(95, 'Ea optio.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(96, 'Dolor.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(97, 'Sed hic.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(98, 'Sapiente.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(99, 'Cum sed.', '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(100, 'Aut enim.', '2024-10-10 08:43:32', '2024-10-10 08:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_28_110059_create_categories_table', 1),
(6, '2024_09_28_110231_create_products_table', 1),
(9, '2024_10_09_124828_create_carts_table', 1),
(10, '2024_10_09_125003_create_cart_items_table', 1),
(13, '2024_09_28_110249_create_orders_table', 2),
(14, '2024_09_28_135053_create_order_items_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `total_amount` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','completed','canceled') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `name`, `address`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(3, 31, 9094598, 'Anh', 'Vĩnh Phúc', '0357395821', 'completed', '2024-10-14 09:33:11', '2024-10-14 09:33:11'),
(6, 31, 9094598, 'Anh', 'Vĩnh Phúc', '0357395821', 'completed', '2024-10-14 09:33:11', '2024-10-14 09:33:11'),
(7, 31, 3292598, 'Anh', 'Vĩnh Phúc', '0357395821', 'pending', '2024-10-14 20:57:29', '2024-10-14 20:57:29'),
(8, 31, 0, 'Anh', 'Vĩnh Phúc', '0357395821', 'pending', '2024-10-14 20:58:15', '2024-10-14 20:58:15'),
(9, 31, 8004577, 'Anh', 'Vĩnh Phúc', '0357395821', 'pending', '2024-10-14 20:58:55', '2024-10-14 20:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `price` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(5, 3, 99, 2, 3378007, '2024-10-14 09:33:11', '2024-10-14 09:33:11'),
(6, 3, 97, 1, 2338584, '2024-10-14 09:33:11', '2024-10-14 09:33:11'),
(7, 7, 94, 1, 3292598, '2024-10-14 20:57:29', '2024-10-14 20:57:29'),
(8, 9, 98, 1, 8004577, '2024-10-14 20:58:55', '2024-10-14 20:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('anh119kzt12@gmail.com', '$2y$12$sNeOO8zCJYLv/Umw7jaljepjG/KurGom8zw098eIcazd8TYIUSs8O', '2024-10-11 08:31:08'),
('anh119kzt6@gmail.com', '$2y$12$Kxxejo.d6LUL0R47sBPUpeLhhb4QGuRheRjrcrWu6ajUx/yAqwmyC', '2024-10-12 02:38:27');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(8, 'App\\Models\\User', 26, 'Fruitables', '7ec7b41e4386beb34e848f3345dd7ff469d1dd4011b29e079b4c3e9c6f2c3ab1', '[\"*\"]', '2024-10-12 20:45:34', NULL, '2024-10-12 07:09:51', '2024-10-12 20:45:34'),
(12, 'App\\Models\\User', 31, 'Fruitables', 'd6d73ef63e6403054533bc7f22a5b120144c46c824a45595970bfb813d3ebc91', '[\"read\"]', '2024-10-14 20:21:26', NULL, '2024-10-14 08:25:10', '2024-10-14 20:21:26');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` int UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `description`, `price`, `quantity`, `image`, `views`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Miss Jailyn Emmerich Sr.', 99, NULL, 3203383, 5132, 'https://via.placeholder.com/640x480.png/008822?text=magni', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(2, 'Florine Maggio', 96, NULL, 8705160, 5585, 'https://via.placeholder.com/640x480.png/001177?text=neque', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(3, 'Mabel Sauer', 92, NULL, 877913, 4073, 'https://via.placeholder.com/640x480.png/008844?text=sapiente', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(4, 'Mr. Randy Bayer', 95, NULL, 7027340, 3683, 'https://via.placeholder.com/640x480.png/007755?text=voluptatem', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(5, 'Shanie Will', 98, NULL, 7976281, 9629, 'https://via.placeholder.com/640x480.png/0088dd?text=et', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(6, 'Ansley Dickens', 98, NULL, 9298519, 2708, 'https://via.placeholder.com/640x480.png/00aa88?text=quos', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(7, 'Dr. Wanda O\'Connell DVM', 96, NULL, 3815943, 3275, 'https://via.placeholder.com/640x480.png/004411?text=reiciendis', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(8, 'Ms. Reina Vandervort', 99, NULL, 833056, 5729, 'https://via.placeholder.com/640x480.png/004422?text=dolorum', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(9, 'Prof. Katarina Rolfson DDS', 96, NULL, 8480429, 6099, 'https://via.placeholder.com/640x480.png/000055?text=consequuntur', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(10, 'Ms. Ila Corwin', 95, NULL, 3788438, 4901, 'https://via.placeholder.com/640x480.png/003355?text=repellat', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(11, 'Mr. Noe Dare', 92, NULL, 2057243, 9179, 'https://via.placeholder.com/640x480.png/0011dd?text=magni', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(12, 'Dr. Alessia Bayer PhD', 91, NULL, 1713593, 7546, 'https://via.placeholder.com/640x480.png/0000aa?text=quis', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(13, 'Ms. Isobel Goyette III', 95, NULL, 9165864, 6321, 'https://via.placeholder.com/640x480.png/0055ff?text=ipsum', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(14, 'Leonor Beier', 94, NULL, 8461445, 8647, 'https://via.placeholder.com/640x480.png/00dd77?text=aperiam', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(15, 'Roxanne Watsica V', 92, NULL, 9382901, 9514, 'https://via.placeholder.com/640x480.png/00ffaa?text=sit', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(16, 'Prof. Mozell Waelchi', 98, NULL, 10083, 5972, 'https://via.placeholder.com/640x480.png/008822?text=est', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(17, 'Easter Leannon', 92, NULL, 7507520, 3990, 'https://via.placeholder.com/640x480.png/00ee88?text=quae', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(18, 'Lela Collins', 97, NULL, 7000656, 5408, 'https://via.placeholder.com/640x480.png/002255?text=repudiandae', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(19, 'Lavon Lindgren', 90, NULL, 3322639, 4970, 'https://via.placeholder.com/640x480.png/00ff44?text=molestias', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(20, 'Dr. Brandy Schuster', 99, NULL, 4753408, 7812, 'https://via.placeholder.com/640x480.png/0088cc?text=doloremque', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(21, 'Kaylie Dickens DVM', 95, NULL, 4126674, 7568, 'https://via.placeholder.com/640x480.png/00aa33?text=quibusdam', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(22, 'Mr. Danial Waters MD', 96, NULL, 6261650, 1305, 'https://via.placeholder.com/640x480.png/0000aa?text=rerum', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(23, 'Princess Rolfson', 95, NULL, 9916062, 6682, 'https://via.placeholder.com/640x480.png/00ff22?text=eligendi', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(24, 'Prof. Kelton Boehm', 100, NULL, 6158272, 3164, 'https://via.placeholder.com/640x480.png/00dd88?text=hic', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(25, 'Josephine Gislason', 97, NULL, 4630670, 3858, 'https://via.placeholder.com/640x480.png/006622?text=ab', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(26, 'Elouise Sipes', 91, NULL, 7965878, 3442, 'https://via.placeholder.com/640x480.png/00dd99?text=at', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(27, 'Miles Stamm DDS', 91, NULL, 3015749, 7967, 'https://via.placeholder.com/640x480.png/0033ff?text=optio', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(28, 'Elijah Treutel', 96, NULL, 4662647, 5684, 'https://via.placeholder.com/640x480.png/00aa44?text=optio', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(29, 'Dr. Bryce Larkin', 96, NULL, 9419125, 5255, 'https://via.placeholder.com/640x480.png/00ff11?text=non', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(30, 'Prof. Deion Ledner PhD', 90, NULL, 9336975, 545, 'https://via.placeholder.com/640x480.png/000088?text=dolor', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(31, 'Gennaro Jacobs PhD', 93, NULL, 7808380, 68, 'https://via.placeholder.com/640x480.png/002266?text=atque', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(32, 'Hardy Klein', 98, NULL, 9754516, 4325, 'https://via.placeholder.com/640x480.png/00dd99?text=aliquid', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(33, 'Dr. Felton Wunsch', 95, NULL, 6334543, 8803, 'https://via.placeholder.com/640x480.png/003377?text=voluptas', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(34, 'Caitlyn Bins', 96, NULL, 8731164, 752, 'https://via.placeholder.com/640x480.png/0077cc?text=non', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(35, 'Fredrick Roob', 97, NULL, 9271748, 1707, 'https://via.placeholder.com/640x480.png/00aa11?text=qui', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(36, 'Prof. Gonzalo O\'Conner', 99, NULL, 1755742, 2546, 'https://via.placeholder.com/640x480.png/0000cc?text=id', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(37, 'Jessyca Kautzer', 96, NULL, 7237538, 6207, 'https://via.placeholder.com/640x480.png/006622?text=ea', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(38, 'Mr. Abner Hills', 90, NULL, 3802206, 5725, 'https://via.placeholder.com/640x480.png/00aa33?text=vel', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(39, 'Ezekiel Turner', 100, NULL, 6212344, 7158, 'https://via.placeholder.com/640x480.png/005588?text=minus', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(40, 'Mrs. Corrine Braun II', 91, NULL, 9180232, 6010, 'https://via.placeholder.com/640x480.png/0000dd?text=at', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(41, 'Mrs. Katharina Volkman', 97, NULL, 2796361, 4279, 'https://via.placeholder.com/640x480.png/00cc11?text=autem', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(42, 'Alex Wehner', 94, NULL, 2635946, 5078, 'https://via.placeholder.com/640x480.png/006611?text=explicabo', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(43, 'Rosalind Denesik', 96, NULL, 2423954, 8890, 'https://via.placeholder.com/640x480.png/005599?text=tempora', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(44, 'Abdiel Feil', 90, NULL, 2315041, 1985, 'https://via.placeholder.com/640x480.png/001144?text=voluptatem', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(45, 'Opal Kutch', 96, NULL, 582607, 7110, 'https://via.placeholder.com/640x480.png/004400?text=dolore', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(46, 'Dr. Mattie Mayert', 98, NULL, 9837370, 6744, 'https://via.placeholder.com/640x480.png/00aa00?text=id', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(47, 'Hulda Nikolaus', 94, NULL, 7568397, 3394, 'https://via.placeholder.com/640x480.png/004488?text=et', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(48, 'Miss Tatyana Lakin', 90, NULL, 2303779, 1784, 'https://via.placeholder.com/640x480.png/0000dd?text=repellendus', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(49, 'Zack Durgan', 94, NULL, 2626649, 6491, 'https://via.placeholder.com/640x480.png/002288?text=non', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(50, 'Prof. Lindsay Boyle', 100, NULL, 7439266, 9018, 'https://via.placeholder.com/640x480.png/00aadd?text=aut', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(51, 'Keeley Rempel', 94, NULL, 7742354, 7475, 'https://via.placeholder.com/640x480.png/00dd99?text=ducimus', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(52, 'Damien Waelchi', 91, NULL, 2921519, 7528, 'https://via.placeholder.com/640x480.png/002299?text=sed', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(53, 'Delilah Reichert', 92, NULL, 1171401, 4001, 'https://via.placeholder.com/640x480.png/007777?text=qui', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(54, 'Jayson Keebler', 90, NULL, 8960842, 7691, 'https://via.placeholder.com/640x480.png/0000bb?text=distinctio', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(55, 'Prof. Caden Kohler Sr.', 95, NULL, 9261152, 9613, 'https://via.placeholder.com/640x480.png/008866?text=odit', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(56, 'Norwood Daniel II', 100, NULL, 8737049, 8498, 'https://via.placeholder.com/640x480.png/0055dd?text=quae', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(57, 'Dr. Tad Zieme II', 91, NULL, 24841, 4777, 'https://via.placeholder.com/640x480.png/005588?text=optio', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(58, 'Jan Hagenes DDS', 98, NULL, 2369093, 4585, 'https://via.placeholder.com/640x480.png/001111?text=porro', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(59, 'Abdul Witting', 95, NULL, 1174830, 3605, 'https://via.placeholder.com/640x480.png/00ddcc?text=eius', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(60, 'Aisha Heaney', 93, NULL, 7634517, 1921, 'https://via.placeholder.com/640x480.png/008866?text=labore', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(61, 'Stephania Reinger', 94, NULL, 3527287, 3329, 'https://via.placeholder.com/640x480.png/003377?text=quaerat', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(62, 'Mr. Benjamin Borer', 92, NULL, 7319765, 7758, 'https://via.placeholder.com/640x480.png/005511?text=suscipit', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(63, 'Esteban Medhurst', 98, NULL, 492302, 7541, 'https://via.placeholder.com/640x480.png/0011bb?text=qui', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(64, 'Esta Hayes', 99, NULL, 7591957, 3863, 'https://via.placeholder.com/640x480.png/0055bb?text=possimus', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(65, 'Delta Gibson', 94, NULL, 2341415, 9957, 'https://via.placeholder.com/640x480.png/00ffdd?text=est', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(66, 'Lawrence Runolfsson II', 97, NULL, 8839953, 2521, 'https://via.placeholder.com/640x480.png/009977?text=atque', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(67, 'Elfrieda Rolfson', 99, NULL, 2594334, 6520, 'https://via.placeholder.com/640x480.png/00bb22?text=aperiam', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(68, 'Velda Feeney Sr.', 90, NULL, 3228402, 3624, 'https://via.placeholder.com/640x480.png/00ddff?text=eligendi', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(69, 'Lilliana Ullrich', 90, NULL, 2680748, 598, 'https://via.placeholder.com/640x480.png/003322?text=qui', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(70, 'Camila Stehr', 100, NULL, 9317986, 4024, 'https://via.placeholder.com/640x480.png/00bb22?text=impedit', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(71, 'Lukas Graham', 95, NULL, 8888682, 3345, 'https://via.placeholder.com/640x480.png/00ffee?text=et', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(72, 'Cayla Mueller', 90, NULL, 9093247, 2459, 'https://via.placeholder.com/640x480.png/005577?text=voluptatibus', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(73, 'Prof. Cyrus Kohler', 100, NULL, 9529143, 8686, 'https://via.placeholder.com/640x480.png/00eecc?text=aut', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(74, 'Quinten Glover', 97, NULL, 3455669, 3637, 'https://via.placeholder.com/640x480.png/005500?text=saepe', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(75, 'Helena Littel', 97, NULL, 7567642, 3812, 'https://via.placeholder.com/640x480.png/0088cc?text=quisquam', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(76, 'Drake Willms', 99, NULL, 6046149, 8955, 'https://via.placeholder.com/640x480.png/0022bb?text=consequuntur', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(77, 'Mrs. Jazmyn Braun II', 100, NULL, 5787691, 7629, 'https://via.placeholder.com/640x480.png/0088aa?text=dicta', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(78, 'Katharina Carroll', 96, NULL, 2723283, 2916, 'https://via.placeholder.com/640x480.png/003399?text=est', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(79, 'Evelyn Smith', 100, NULL, 9264612, 3930, 'https://via.placeholder.com/640x480.png/00dd99?text=in', 0, '2024-10-10 08:43:32', '2024-10-10 08:43:32', NULL),
(80, 'Ramon Larkin', 90, NULL, 6092451, 7600, 'images/1O41S0BcJ1smKLN0UmC9SzvVtAc0X7vImYVDiO20.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:08:59', NULL),
(81, 'Joaquin Botsford MD', 100, NULL, 7867622, 4676, 'images/KAeVwDUnHNFNeZVHR6DPTlncJ55Id8ZkIvyEKu5i.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:08:49', NULL),
(82, 'Mr. Stevie Rice', 99, NULL, 5645034, 4921, 'images/n87sLlgUwYVqhy6lZmFm7yf8QLaWtPAdBykcjKbh.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:08:39', NULL),
(83, 'Jayson Wisozk V', 91, NULL, 6137485, 6982, 'images/zBm2DTSHCV7o3nCK2IhETPNPGfRqMlw5dxRG5wMB.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:08:29', NULL),
(84, 'Elouise Abbott', 93, NULL, 5677832, 3084, 'images/dR0vaJCXkgRiDMDf6TE4Wv8bJRGolLilyfX22AK5.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:07:45', NULL),
(85, 'Ervin Kihn', 99, NULL, 5823062, 2228, 'images/jsB1s7o2MRxaQSVtGMqJCfzlSxKKsAgkdMGXxSLk.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:07:33', NULL),
(86, 'Prof. Stephanie Wunsch', 99, NULL, 7033000, 6324, 'images/hVX6gOCEbZXCckaid647EmxOjvx6RZkb2RWgLq4K.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:07:24', NULL),
(87, 'Nathanael Wilderman IV', 95, NULL, 3155958, 5001, 'images/rMyXPgwJbvr7wcJbFDCr0v4aYAZV3zL3GX8bFZ4r.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:07:14', NULL),
(88, 'Lavinia Hand', 91, NULL, 9124045, 9328, 'images/KWoFkeurrQfqqrYfT2LZ3ZDJD7FbPexh14yMvdQm.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:07:04', NULL),
(89, 'Izaiah Kling MD', 91, NULL, 7549904, 2579, 'images/HrfWPnEnB7OWrh1Ldw2m85TL0uvbp1PNjTGziGH8.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:06:54', NULL),
(90, 'Quentin Zboncak IV', 93, NULL, 4913634, 9678, 'images/gPjnnIFQzyTpFETyyyGQNf9Rt0gJxfpTifUuTjFh.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:03:11', NULL),
(91, 'Esther Gislason Jr.', 94, NULL, 9100137, 3748, 'images/h0NJK90qxqdWDaYRFuOX0TdozDCSB2PvAVC6wxUO.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:03:01', NULL),
(92, 'Prof. Hertha Willms DDS', 97, NULL, 3992484, 9387, 'images/vJfB1YHuiiIYJ3u6jLvih2v7DdlnkrjmrYWDoF8I.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:02:53', NULL),
(93, 'Virginia Schaefer', 91, NULL, 5271661, 2637, 'images/sEDHDBO45Wur97Co6mERjX60MXpAsIFmBT2Orcft.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:02:44', NULL),
(94, 'Avery Bosco', 91, NULL, 3292598, 220, 'images/Q275uQk7WKToEYldszOiJFxkgTsZ3UocBZzqauj3.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:02:29', NULL),
(95, 'Earl Turner', 98, NULL, 74179, 998, 'images/aFYOxLmt3hirxfu5HenFUjdEWDbpSBhKnAgNYayp.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:02:22', NULL),
(96, 'Jennyfer Schultz', 94, NULL, 7355288, 4112, 'images/CfPXc7UQYlytuyRU0ET3DefZdBKAxBXvbXluaFlm.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:02:14', NULL),
(97, 'Celestino Block', 92, NULL, 2338584, 4491, 'images/YJSI4kA5elCKDWkJzKCwlvtEz3aMYm6WvI0LCExj.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:02:06', NULL),
(98, 'Prof. Dorian Davis I', 91, NULL, 8004577, 3925, 'images/34rnF34WD5NrY6ZI2lWGbNjD2ohbPQUozfBViTYM.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:01:58', NULL),
(99, 'Dr. Kelley Bechtelar Sr.', 91, NULL, 3378007, 1666, 'images/XmlV7xgC7zMOVmDjuE2E9GJZUShDAKhl5k67rTwQ.jpg', 0, '2024-10-10 08:43:32', '2024-10-11 07:01:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('admin','customer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dr. Mustafa Oberbrunner IV', 'white.alexane@trantow.com', NULL, '$2y$12$v5g96KNfhoPHWxG9Hiu3XeV.Mvr/uFQRkWIwkN0/OpJ8D1RaddfgG', 'customer', NULL, '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(2, 'Miss Mathilde Kutch III', 'greta.donnelly@yahoo.com', NULL, '$2y$12$X4.FwGvLXTlPN8UEVOUHOOQtAuIQGqblGrGJYq/Nfywk7Exyx44qi', 'customer', NULL, '2024-10-10 08:43:32', '2024-10-10 08:43:32'),
(3, 'Delphine Durgan II', 'price.werner@schaden.com', NULL, '$2y$12$K1H4UjkqtFHKeLJ6ww7SsOYgqnzUuT9.bKehtHF2YsoIOCvRr6y4e', 'customer', NULL, '2024-10-10 08:43:33', '2024-10-10 08:43:33'),
(4, 'Mrs. Zoey Bailey DDS', 'max.blanda@yahoo.com', NULL, '$2y$12$Hbmz.PconYm72ymL2M68UuI0bcVcSMiYCFTggAyT38T281G4kl7K6', 'customer', NULL, '2024-10-10 08:43:33', '2024-10-10 08:43:33'),
(5, 'Luna Okuneva IV', 'madonna.tromp@johnson.info', NULL, '$2y$12$6mUKHkzTpgud.InHH7BjsesG4lYIgIQS2DHCapkC.8YoeKGc881hm', 'customer', NULL, '2024-10-10 08:43:33', '2024-10-10 08:43:33'),
(6, 'Ashton Emard', 'josefina29@hotmail.com', NULL, '$2y$12$7L/2mf8R2Q.wc5KCv3ZuReq9HVhfS5pjUwuozk.0./wWOdNwyQA.u', 'customer', NULL, '2024-10-10 08:43:33', '2024-10-10 08:43:33'),
(7, 'Prof. Garret Hand MD', 'roberts.mikayla@gmail.com', NULL, '$2y$12$8ZdS0N3p5uEpeGcBNoh4le/.pzydMAgxO8Lc4R94wWIEwivdlw9tK', 'customer', NULL, '2024-10-10 08:43:34', '2024-10-10 08:43:34'),
(8, 'Rachelle Johns', 'simone92@jacobson.com', NULL, '$2y$12$K9nusNyzYBkQKYiO/KvLsuMj/PaKudibQrPuX2Hf.0TxkJhxzBsKS', 'customer', NULL, '2024-10-10 08:43:34', '2024-10-10 08:43:34'),
(9, 'Dr. Joshua Waelchi', 'trace70@gmail.com', NULL, '$2y$12$70z6pkEONpNifje1lR4CHuu4zWghWxsXv0yDqgswpiiJukcDJfjGG', 'customer', NULL, '2024-10-10 08:43:34', '2024-10-10 08:43:34'),
(10, 'Cristina Carter', 'gdickinson@wisoky.info', NULL, '$2y$12$bb12CBhjqd9b0IADFTsBiOc1j67OCJO9v0BVHQMXHVKpAzYYa1SDa', 'customer', NULL, '2024-10-10 08:43:34', '2024-10-10 08:43:34'),
(11, 'Watson Lowe', 'jstoltenberg@mcdermott.com', NULL, '$2y$12$b3OU/dROhkNbikVjhfDREO8iSm6VrVmUX/v3UQVMDcEu.WuUKMKcW', 'customer', NULL, '2024-10-10 08:43:34', '2024-10-10 08:43:34'),
(12, 'Marc Conn', 'constantin.doyle@spencer.org', NULL, '$2y$12$7hDYMZ6T9k0Ri3ieSY4zqOAiaut8xpYdwi9E/nq7Ak2UzXRGwfV96', 'customer', NULL, '2024-10-10 08:43:35', '2024-10-10 08:43:35'),
(13, 'Krystal Breitenberg', 'zulauf.arlie@hotmail.com', NULL, '$2y$12$/9yhIokCVig5aYI.PgDfbuYvADHD1x371lUBHsX5tMKHzohNhhkdO', 'customer', NULL, '2024-10-10 08:43:35', '2024-10-10 08:43:35'),
(14, 'Bettye Erdman', 'pkovacek@yahoo.com', NULL, '$2y$12$GizBiCCMgqYAeW4AIR8QAunrxzPF6dFuHfSMLFctU4./QH2B54Iti', 'customer', NULL, '2024-10-10 08:43:35', '2024-10-10 08:43:35'),
(15, 'Jesus Vandervort', 'russell58@johnson.biz', NULL, '$2y$12$vYWlLAsWTJIKQD5r8Ccsg.DNy223xa7hO/m09/bJLvMS42Gcl6Wym', 'customer', NULL, '2024-10-10 08:43:35', '2024-10-10 08:43:35'),
(16, 'Paula Willms', 'hilton17@wintheiser.com', NULL, '$2y$12$zR0w9W4WLGsst73oA9p3Qu7EWNiLpXsE7CUTGsIGiLmGsSg3RPZca', 'customer', NULL, '2024-10-10 08:43:35', '2024-10-10 08:43:35'),
(17, 'Miss Tiffany Oberbrunner', 'collins.ashtyn@gleichner.com', NULL, '$2y$12$65dYQ6O/PKoonDBDipxUneLH1hV2AlLbKAOxqU8jeJd.TnHSvAPru', 'customer', NULL, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(18, 'Justina Hessel', 'pfeffer.zelda@hotmail.com', NULL, '$2y$12$Sq1pRLcENlhhA.46YJxFreXpNo4RbMupuJLdLmYZmof.AoUZFpiA2', 'customer', NULL, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(19, 'Carmel Prohaska', 'margarete.dietrich@hotmail.com', NULL, '$2y$12$Lk0hyw3ZEyhXESJRsxgnAexwypo4DOuff1a.bYVb332sK2xon2gC.', 'customer', NULL, '2024-10-10 08:43:36', '2024-10-10 08:43:36'),
(23, 'Nguyễn Văn Tèo', 'anh119kzt12@gmail.com', NULL, '$2y$12$aS53O/IBQ.FDd9tASy0BP.D/IZ1GProGP0oBhxDIJy4X43pPhE3a2', 'customer', NULL, '2024-10-10 22:03:20', '2024-10-10 22:03:20'),
(24, 'Nguyễn Văn Tè', 'anh119kzt121@gmail.com', NULL, '$2y$12$M25x3CwYfRavgtQhtOZnaekOqRU.z2q4UgsvHCyddJJUGmr97Jl5S', 'admin', NULL, '2024-10-10 22:04:22', '2024-10-10 23:27:07'),
(25, 'Lê Đức Anh', 'anh119kzt112@gmail.com', NULL, '$2y$12$Dneuw97R2ColY00DSDQEhe31i.GnpvYZ1BmFStANecFyqAIB7r1kO', 'customer', NULL, '2024-10-11 02:27:34', '2024-10-11 02:27:34'),
(26, 'Lê Đức Anh', 'anh119kzt2@gmail.com', '2024-10-02 10:35:19', '$2y$12$A0Fd/OR2lSFp8ciVk825POA9ZBVn2d1oeK6f6LkMmqFSdYoCbA7s2', 'admin', 'GZwALDvVzCZla5fV6S0w5tx5avD4srRAiRMDHz9moyh0o2LqLb4kCgy3RbJQ', '2024-10-11 02:52:47', '2024-10-11 08:33:35'),
(28, 'Lê Đức Anh', 'anh119kzt12111@gmail.com', NULL, '$2y$12$NrZNWPgBUWyKmPCmxPmwWOjolHHkmZmtQYWAXNhOB.swe7TyyhAYG', 'customer', NULL, '2024-10-11 05:33:14', '2024-10-11 05:33:14'),
(29, 'Lê Đức Anh', 'anh119kzt121111@gmail.com', NULL, '$2y$12$5uwwYgTgGPIarfwAz4R9/uaLUyFQ4FeC5J.Dy8YT54/7HcMFZLQZq', 'customer', NULL, '2024-10-11 21:01:34', '2024-10-11 21:01:34'),
(30, 'Lê Đức Anh', 'anh119kzt6@gmail.com', NULL, '$2y$12$4WeJ6qq.nJcXLZ2fOxlHN.XdKJ7dk0mdw0YrAQeJkUBWk5wHHOVRK', 'customer', NULL, '2024-10-12 02:37:57', '2024-10-12 02:37:57'),
(31, 'Anh', 'anhldph45102@fpt.edu.vn', '2024-10-12 21:47:18', '$2y$12$8aSsLikYKUlRR4uRErZgW.4afIDUmYw4Get7c96zmrES7vk3l01Pu', 'customer', NULL, '2024-10-12 04:54:23', '2024-10-12 21:47:18'),
(32, 'Anh', 'anhldph451021@fpt.edu.vn', NULL, '$2y$12$wGlq/AwQQEmVKpP4bVaH7uvL8TnrIMtNe.DS74xpDrvPHpMlq/Vr2', 'customer', NULL, '2024-10-12 04:56:44', '2024-10-12 04:56:44'),
(33, 'Lê Đức Anh', 'anh119kzt1112@gmail.com', NULL, '$2y$12$v3mOemDiz6HlsbXVl4rcPeer2.lNNDnjvh6s5XeU.4CQKwGIn7ecC', 'customer', NULL, '2024-11-07 03:49:40', '2024-11-07 03:49:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carts_user_id_unique` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
