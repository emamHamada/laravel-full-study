-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: May 09, 2020 at 07:21 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `authdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$10$CqqSFcSZ6kmctAGbTWxEE.It5avq7LOiOEpUvP5wfcI33WzguBzUi');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(1, 'مصر'),
(2, 'فلسطين');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
CREATE TABLE IF NOT EXISTS `doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `hospital_id` int(10) UNSIGNED NOT NULL,
  `medical_id` int(11) DEFAULT NULL,
  `gender` tinyint(1) NOT NULL COMMENT '1 -> male 2-> female',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `title`, `hospital_id`, `medical_id`, `gender`, `created_at`, `updated_at`) VALUES
(3, 'ايه محمد', 'اخصائي ', 2, 1, 2, NULL, NULL),
(4, 'اسماء جمال', 'استشاري', 2, 2, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_service`
--

DROP TABLE IF EXISTS `doctor_service`;
CREATE TABLE IF NOT EXISTS `doctor_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(10) UNSIGNED NOT NULL,
  `service_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doctor_service`
--

INSERT INTO `doctor_service` (`id`, `doctor_id`, `service_id`) VALUES
(25, 3, 3),
(24, 4, 3),
(21, 3, 1),
(19, 3, 4),
(18, 4, 2),
(17, 4, 1),
(23, 4, 4),
(22, 3, 2);

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
-- Table structure for table `hospitals`
--

DROP TABLE IF EXISTS `hospitals`;
CREATE TABLE IF NOT EXISTS `hospitals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `address`, `country_id`, `created_at`, `updated_at`) VALUES
(2, 'مستشفي الاهلي للعظام', 'شارع محمد علي  ', 1, NULL, NULL),
(3, 'مستشفي  ألامل للعظام', 'شارع  علي علي  ', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `medicals`
--

DROP TABLE IF EXISTS `medicals`;
CREATE TABLE IF NOT EXISTS `medicals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pdf` varchar(100) NOT NULL,
  `patient_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `medicals`
--

INSERT INTO `medicals` (`id`, `pdf`, `patient_id`) VALUES
(1, 'mahoud.pdf', 1),
(2, 'ahmed.pdf', 2);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
CREATE TABLE IF NOT EXISTS `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` varchar(20) NOT NULL,
  `photo` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name_ar` varchar(100) NOT NULL,
  `name_en` varchar(100) NOT NULL,
  `details_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `details_en` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `price`, `photo`, `created_at`, `updated_at`, `name_ar`, `name_en`, `details_ar`, `details_en`, `status`) VALUES
(21, '39439', '1587591235.png', '2020-04-22 19:33:55', '2020-04-22 19:33:55', 'عرض5', 'offer5', 'ndfjdjfj', 'kcvkckvcv', 1),
(19, '39439', '1587591235.png', '2020-04-22 19:33:55', '2020-04-22 19:33:55', 'عرض3', 'offer3', 'ndfjdjfj', 'kcvkckvcv', 0),
(20, '2323232', '1588864562.png', '2020-05-07 12:16:02', '2020-05-07 12:16:02', 'عرض 4', 'offers4', 'sdsdsds', 'sldlsdssdsd', 1),
(16, '39439', '1587591235.png', '2020-04-22 19:33:55', '2020-04-22 19:33:55', 'عرض 2', 'offer2', NULL, 'kcvkckvcv', 0),
(18, '2323232', '1588864562.png', '2020-05-07 12:16:02', '2020-05-07 12:16:02', 'عرض 1', 'offer1', 'sdsdsds', 'sldlsdssdsd', 1),
(22, '2323232', '1588864562.png', '2020-05-07 12:16:02', '2020-05-07 12:16:02', 'عرض 5', 'offers5', 'sdsdsds', 'sldlsdssdsd', 1),
(23, '39439', '1587591235.png', '2020-04-22 19:33:55', '2020-04-22 19:33:55', 'عرض 6', 'offer6', 'ndfjdjfj', 'kcvkckvcv', 0),
(24, '2323232', '1588864562.png', '2020-05-07 12:16:02', '2020-05-07 12:16:02', 'عرض 7', 'offer7', 'sdsdsds', 'sldlsdssdsd', 1),
(25, '39439', '1587591235.png', '2020-04-22 19:33:55', '2020-04-22 19:33:55', 'عرض 8', 'offer8', 'ndfjdjfj', 'kcvkckvcv', 1),
(26, '2323232', '1588864562.png', '2020-05-07 12:16:02', '2020-05-07 12:16:02', 'عرض 9', 'offer9', 'sdsdsds', 'sldlsdssdsd', 1),
(27, '32323', '1588884761.jpg', '2020-05-07 17:52:41', '2020-05-07 17:52:41', 'ٍينسينسين', 'offer name', 'dfdfdfk', 'kdfkdfkdfdf', 1),
(28, '32323', '1588884897.jpg', '2020-05-07 17:54:57', '2020-05-07 17:54:57', 'ٍينسينسين', 'OFFER NAME', 'dfdfdfk', 'kdfkdfkdfdf', 1),
(29, '32323', '1588884980.jpg', '2020-05-07 17:56:20', '2020-05-07 17:56:20', 'ٍينسينسين', 'OFFER NAME', 'dfdfdfk', 'kdfkdfkdfdf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `age`) VALUES
(1, 'محمود علي', 25),
(2, 'احمد حسن', 45);

-- --------------------------------------------------------

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
CREATE TABLE IF NOT EXISTS `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `phone` varchar(100) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `phone`
--

INSERT INTO `phone` (`id`, `code`, `phone`, `user_id`) VALUES
(1, '02', '013256237237', 15);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'تقويم اسنان', NULL, NULL),
(2, 'تنظيف اسنان', NULL, NULL),
(3, 'حشو عصب', NULL, NULL),
(4, 'حشو عادي', NULL, NULL),
(5, 'تبيض اسنان', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=>  active 1 => expired',
  `age` int(11) DEFAULT '14',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `mobile`, `remember_token`, `expire`, `age`, `created_at`, `updated_at`) VALUES
(15, 'Ahmed Emam', 'ahmed.emam.dev@gmail.com', '2020-04-10 15:49:48', '$2y$10$CqqSFcSZ6kmctAGbTWxEE.It5avq7LOiOEpUvP5wfcI33WzguBzUi', '232323', 'ZUvxWytpH7LbfkbTVLjTvWJgvkWOEPrZeGhiH7KKSI1lZplMsyyU37sWueGz', 1, 10, '2020-04-10 15:49:03', '2020-04-25 18:28:43'),
(16, 'Ahmed ali', 'ahmed.emam.dev2@gmail.com', '2020-04-10 15:49:48', '$2y$10$3UAduOPlv4ShSgT4swNEROR9kn5uDIkrPX./n8fNLtQgYpxM3wyKi', '348384834', 'GQnezVbASUhoN77uyCvTxc3c0TEe6YcCtVMY8GUf2YmkVPvRk2QqhrSmtwLC', 1, 14, '2020-04-10 15:49:03', '2020-04-12 21:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `viewers` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `name`, `viewers`) VALUES
(1, 'name of video', 24);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
