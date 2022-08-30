-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for aurora
CREATE DATABASE IF NOT EXISTS `aurora` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `aurora`;

-- Dumping structure for table aurora.businesses
CREATE TABLE IF NOT EXISTS `businesses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_en` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.businesses: ~2 rows (approximately)
DELETE FROM `businesses`;
INSERT INTO `businesses` (`id`, `name`, `name_en`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Nghề 2', NULL, 0, '2021-10-17 08:36:32', '2021-10-19 18:57:32'),
	(2, 'nghề 1', NULL, 1, '2021-10-18 18:32:51', '2021-10-18 18:32:51'),
	(3, 'a', NULL, 1, '2021-12-29 20:55:50', '2021-12-29 20:55:50');

-- Dumping structure for table aurora.business_languages
CREATE TABLE IF NOT EXISTS `business_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.business_languages: ~8 rows (approximately)
DELETE FROM `business_languages`;
INSERT INTO `business_languages` (`id`, `business_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
	(8, 2, 'nghề 1', 'vi', '2021-10-18 18:32:52', '2021-10-18 18:32:52'),
	(9, 2, 'nghề 1', 'en', '2021-10-18 18:32:52', '2021-10-18 18:32:52'),
	(10, 2, 'nghề 1', 'un', '2021-10-18 18:32:52', '2021-10-18 18:32:52'),
	(11, 2, 'nghề 1', 'ca', '2021-10-18 18:32:52', '2021-10-18 18:32:52'),
	(12, 1, 'Nghề 2', 'vi', '2021-10-19 01:33:43', '2021-10-19 18:57:32'),
	(16, 1, 'Nghề 2', 'en', '2021-10-19 18:57:32', '2021-10-19 18:57:39'),
	(17, 3, 'a', 'vi', '2021-12-29 20:55:50', '2021-12-29 20:55:50'),
	(18, 3, 'a', 'en', '2021-12-29 20:55:50', '2021-12-29 20:55:50');

-- Dumping structure for table aurora.business_styles
CREATE TABLE IF NOT EXISTS `business_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.business_styles: ~2 rows (approximately)
DELETE FROM `business_styles`;
INSERT INTO `business_styles` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Khách hàng trực tiếp', 1, '2021-10-19 07:43:55', '2021-10-19 07:43:55'),
	(3, 'Đơn vị tư vấn, hỗ trợ', 1, '2021-10-19 07:46:26', '2021-10-19 07:47:10');

-- Dumping structure for table aurora.business_style_languages
CREATE TABLE IF NOT EXISTS `business_style_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business_style_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.business_style_languages: ~8 rows (approximately)
DELETE FROM `business_style_languages`;
INSERT INTO `business_style_languages` (`id`, `business_style_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
	(8, 1, 'Khách hàng trực tiếp', 'vi', '2021-10-19 07:43:55', '2021-10-19 07:43:55'),
	(9, 1, 'Direct customers', 'en', '2021-10-19 07:43:55', '2021-12-27 00:08:58'),
	(10, 1, 'Khách hàng trực tiếp', 'un', '2021-10-19 07:43:55', '2021-10-19 07:43:55'),
	(11, 1, 'Khách hàng trực tiếp', 'ca', '2021-10-19 07:43:56', '2021-10-19 07:43:56'),
	(16, 3, 'Đơn vị tư vấn, hỗ trợ', 'vi', '2021-10-19 07:46:26', '2021-10-19 07:46:26'),
	(17, 3, 'Consulting and support unit', 'en', '2021-10-19 07:46:26', '2021-12-27 00:08:44'),
	(18, 3, 'Đơn vị tư vấn, hỗ trợ', 'un', '2021-10-19 07:46:26', '2021-10-19 07:46:26'),
	(19, 3, 'Đơn vị tư vấn, hỗ trợ', 'ca', '2021-10-19 07:46:26', '2021-10-19 07:46:26');

-- Dumping structure for table aurora.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `link` text DEFAULT NULL,
  `style_event` int(11) DEFAULT NULL COMMENT '1: Di chyển đến cảnh, 2: Show nội dung, 3: chuyển đến page khác',
  `name_scene` varchar(255) DEFAULT NULL,
  `name_hotspot` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.categories: ~15 rows (approximately)
DELETE FROM `categories`;
INSERT INTO `categories` (`id`, `name`, `link`, `style_event`, `name_scene`, `name_hotspot`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'TỔNG QUAN', NULL, NULL, NULL, NULL, 0, 1, NULL, '2021-10-19 19:03:55'),
	(3, 'KCN Dệt may Rạng Đông (view 1)', NULL, 1, 'scene_view_1', NULL, 1, 1, NULL, '2021-12-01 00:41:20'),
	(4, 'KCN Dệt may Rạng Đông (view 2)', NULL, 1, 'scene_view_2', NULL, 1, 1, '2021-10-18 06:46:40', '2021-12-01 00:41:30'),
	(5, 'KCN Dệt may Rạng Đông (view 3)', NULL, 1, 'scene_view_3', NULL, 1, 1, '2021-10-18 06:47:36', '2021-12-01 00:41:43'),
	(6, 'SẢN PHẨM', NULL, NULL, NULL, NULL, 0, 1, '2021-10-18 06:47:52', '2021-10-19 19:03:47'),
	(8, 'Đất công nghiệp cho thuê', NULL, 1, 'scene_view_2', NULL, 6, 1, '2021-10-18 08:06:14', '2021-10-19 19:14:23'),
	(9, 'Đất kho bãi cho thuê', 'https://www.youtube.com/results?search_query=nhac+nhe+nhang+thu+gian', 1, 'scene_view_5', NULL, 6, 1, '2021-10-19 18:24:32', '2021-12-01 00:02:21'),
	(10, 'TIỆN ÍCH', NULL, NULL, NULL, NULL, 0, 1, '2021-10-19 19:01:59', '2021-10-19 19:01:59'),
	(11, 'Văn phòng điều hành', NULL, 1, 'scene_view_6', NULL, 10, 1, '2021-10-19 19:02:54', '2021-10-19 19:09:15'),
	(12, 'Nhà ở chuyên gia', NULL, 1, 'scene_nha_chuyen_gia_ben_trong', NULL, 10, 1, '2021-10-19 19:03:36', '2021-10-19 19:10:45'),
	(13, 'Khu làm việc chung cho chuyên gia', NULL, 1, 'scene_phong_lam_viec_chuyen_gia', NULL, 10, 1, '2021-10-19 19:04:12', '2021-12-23 01:52:07'),
	(14, 'Nhà máy xử lý nước thải', NULL, 1, 'scene_view_4', NULL, 10, 1, '2021-10-19 19:04:27', '2021-12-01 00:35:45'),
	(15, 'Nhà máy xử lý nước cấp', NULL, 1, 'scene_view_2', 'nha_may_xu_ly_cap_nuoc', 10, 1, '2021-10-19 19:04:40', '2021-12-14 19:22:54'),
	(16, 'Trạm bơm cấp 1 (ngoại khu)', NULL, 2, 'scene_tram_cap_nuoc', NULL, 10, 0, '2021-10-19 19:04:56', '2021-12-23 02:07:18'),
	(17, 'Khu nhà ở  và dịch vụ', NULL, 1, 'scene_view_1', 'khu_nha_o_va_dich_vu', 10, 1, '2021-10-19 19:05:26', '2021-12-01 20:22:57');

-- Dumping structure for table aurora.category_languages
CREATE TABLE IF NOT EXISTS `category_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.category_languages: ~33 rows (approximately)
DELETE FROM `category_languages`;
INSERT INTO `category_languages` (`id`, `category_id`, `name`, `content`, `lang`, `created_at`, `updated_at`) VALUES
	(8, 6, 'SẢN PHẨM', '<p><img alt="" src="/userfiles/images/Congrats%403x%20Copy.png" style="height:201px; width:891px" /></p>', 'vi', '2021-10-18 06:47:52', '2021-10-19 19:03:47'),
	(12, 8, 'Đất công nghiệp cho thuê', '<p>Đất c&ocirc;ng nghiệp cho thu&ecirc;</p>', 'vi', '2021-10-18 08:06:14', '2021-10-19 18:25:04'),
	(13, 8, 'Industrial land for lease', '<p>Đất c&ocirc;ng nghiệp cho thu&ecirc;</p>', 'en', '2021-10-18 08:06:14', '2021-12-01 00:02:55'),
	(14, 8, 'Đất công nghiệp cho thuê', NULL, 'un', '2021-10-18 08:06:14', '2021-10-19 18:25:04'),
	(15, 6, 'PRODUCT', NULL, 'en', '2021-10-18 18:42:47', '2021-12-01 00:42:11'),
	(16, 6, 'SẢN PHẨM', NULL, 'un', '2021-10-18 18:42:47', '2021-10-19 19:03:47'),
	(18, 6, 'SẢN PHẨM', NULL, 'ca', '2021-10-18 19:00:41', '2021-10-19 19:03:47'),
	(19, 3, 'KCN Dệt may Rạng Đông (view 1)', NULL, 'vi', '2021-10-19 18:23:34', '2021-12-01 00:52:58'),
	(20, 3, 'Aurora IP (view 1)', NULL, 'en', '2021-10-19 18:23:34', '2021-11-30 23:57:06'),
	(21, 4, 'KCN Dệt may Rạng Đông (view 2)', NULL, 'vi', '2021-10-19 18:23:47', '2021-12-01 00:41:30'),
	(22, 4, 'Aurora IP (view 2)', NULL, 'en', '2021-10-19 18:23:47', '2021-11-30 23:57:28'),
	(23, 5, 'KCN Dệt may Rạng Đông (view 3)', NULL, 'vi', '2021-10-19 18:24:02', '2021-12-01 00:41:43'),
	(24, 5, 'Aurora IP (view 3)', NULL, 'en', '2021-10-19 18:24:02', '2021-11-30 23:57:48'),
	(25, 9, 'Đất kho bãi cho thuê', NULL, 'vi', '2021-10-19 18:24:32', '2021-12-01 00:02:21'),
	(26, 9, 'Warehouse land for lease', NULL, 'en', '2021-10-19 18:24:32', '2021-12-01 00:25:24'),
	(27, 1, 'TỔNG QUAN', NULL, 'vi', '2021-10-19 18:34:03', '2021-10-19 19:03:55'),
	(28, 1, 'OVERVIEW', NULL, 'en', '2021-10-19 18:34:03', '2021-11-30 23:58:08'),
	(29, 10, 'TIỆN ÍCH', NULL, 'vi', '2021-10-19 19:01:59', '2021-10-19 19:01:59'),
	(30, 10, 'UTILITIES', NULL, 'en', '2021-10-19 19:01:59', '2021-12-01 00:05:32'),
	(31, 11, 'Văn phòng điều hành', NULL, 'vi', '2021-10-19 19:02:54', '2021-10-19 19:02:54'),
	(32, 11, 'Administration Office', NULL, 'en', '2021-10-19 19:02:54', '2021-12-23 01:52:28'),
	(33, 12, 'Nhà ở chuyên gia', NULL, 'vi', '2021-10-19 19:03:36', '2021-10-19 19:03:36'),
	(34, 12, 'Houses for experts', NULL, 'en', '2021-10-19 19:03:36', '2021-12-23 01:52:49'),
	(35, 13, 'Khu làm việc chung cho chuyên gia', NULL, 'vi', '2021-10-19 19:04:12', '2021-12-23 01:52:07'),
	(36, 13, 'Co-working space for expert', NULL, 'en', '2021-10-19 19:04:12', '2021-12-23 01:52:07'),
	(37, 14, 'Nhà máy xử lý nước thải', NULL, 'vi', '2021-10-19 19:04:27', '2021-12-01 00:04:21'),
	(38, 14, 'Wastewater treatment plan', NULL, 'en', '2021-10-19 19:04:27', '2021-12-01 00:08:47'),
	(39, 15, 'Nhà máy xử lý nước cấp', '<p>Hiển thị nội dung nh&agrave; m&aacute;y xử l&yacute; nước c&acirc;p</p>', 'vi', '2021-10-19 19:04:40', '2021-12-01 00:40:54'),
	(40, 15, 'Water treatment plan', NULL, 'en', '2021-10-19 19:04:40', '2021-12-01 00:09:36'),
	(41, 16, 'Trạm bơm cấp 1 (ngoại khu)', '<p>Hiển thị nội dung giới thiệu về trạm bơm cấp 1</p>', 'vi', '2021-10-19 19:04:56', '2021-12-01 00:32:55'),
	(42, 16, 'Pump station 1 level (outside)', NULL, 'en', '2021-10-19 19:04:56', '2021-12-01 00:13:53'),
	(43, 17, 'Khu nhà ở  và dịch vụ', NULL, 'vi', '2021-10-19 19:05:26', '2021-10-19 19:05:26'),
	(44, 17, 'Housing and services', NULL, 'en', '2021-10-19 19:05:26', '2021-12-01 00:14:19');

-- Dumping structure for table aurora.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `company_type` int(11) DEFAULT NULL,
  `company_type_name` varchar(255) DEFAULT NULL,
  `company_nationality` int(11) DEFAULT NULL,
  `company_nationality_name` varchar(50) DEFAULT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  `enquiry` text DEFAULT NULL,
  `enquiry_name` text DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `business` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` tinyint(4) DEFAULT 0 COMMENT '1: new, 0: old',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.contacts: ~0 rows (approximately)
DELETE FROM `contacts`;

-- Dumping structure for table aurora.countries
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country_en` varchar(100) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.countries: ~249 rows (approximately)
DELETE FROM `countries`;
INSERT INTO `countries` (`id`, `code`, `name`, `country_en`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'AF', 'Afghanistan', 'Afghanistan', 1, '2020-09-20 12:19:23', '2020-09-20 05:21:55'),
	(2, 'AX', 'Åland Islands', 'Åland Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(3, 'AL', 'Albania', 'Albania', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(4, 'DZ', 'Algeria', 'Algeria', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(5, 'AS', 'American Samoa', 'American Samoa', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(6, 'AD', 'Andorra', 'Andorra', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(7, 'AO', 'Angola', 'Angola', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(8, 'AI', 'Anguilla', 'Anguilla', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(9, 'AQ', 'Antarctica', 'Antarctica', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(10, 'AG', 'Antigua & Barbuda', 'Antigua & Barbuda', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(11, 'AR', 'Argentina', 'Argentina', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(12, 'AM', 'Armenia', 'Armenia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(13, 'AW', 'Aruba', 'Aruba', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(14, 'AU', 'Australia', 'Australia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(15, 'AT', 'Austria', 'Austria', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(16, 'AZ', 'Azerbaijan', 'Azerbaijan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(17, 'BS', 'Bahamas', 'Bahamas', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(18, 'BH', 'Bahrain', 'Bahrain', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(19, 'BD', 'Bangladesh', 'Bangladesh', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(20, 'BB', 'Barbados', 'Barbados', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(21, 'BY', 'Belarus', 'Belarus', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(22, 'BE', 'Belgium', 'Belgium', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(23, 'BZ', 'Belize', 'Belize', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(24, 'BJ', 'Benin', 'Benin', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(25, 'BM', 'Bermuda', 'Bermuda', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(26, 'BT', 'Bhutan', 'Bhutan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(27, 'BO', 'Bolivia', 'Bolivia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(28, 'BA', 'Bosnia & Herzegovina', 'Bosnia & Herzegovina', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(29, 'BW', 'Botswana', 'Botswana', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(30, 'BV', 'Bouvet Island', 'Bouvet Island', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(31, 'BR', 'Brazil', 'Brazil', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(32, 'IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(33, 'VG', 'British Virgin Islands', 'British Virgin Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(34, 'BN', 'Brunei', 'Brunei', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(35, 'BG', 'Bulgaria', 'Bulgaria', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(36, 'BF', 'Burkina Faso', 'Burkina Faso', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(37, 'BI', 'Burundi', 'Burundi', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(38, 'KH', 'Cambodia', 'Cambodia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(39, 'CM', 'Cameroon', 'Cameroon', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(40, 'CA', 'Canada', 'Canada', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(41, 'CV', 'Cape Verde', 'Cape Verde', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(42, 'BQ', 'Caribbean Netherlands', 'Caribbean Netherlands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(43, 'KY', 'Cayman Islands', 'Cayman Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(44, 'CF', 'Central African Republic', 'Central African Republic', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(45, 'TD', 'Chad', 'Chad', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(46, 'CL', 'Chile', 'Chile', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(47, 'CN', 'China', 'China', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(48, 'CX', 'Christmas Island', 'Christmas Island', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(49, 'CC', 'Cocos (Keeling) Islands', 'Cocos (Keeling) Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(50, 'CO', 'Colombia', 'Colombia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(51, 'KM', 'Comoros', 'Comoros', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(52, 'CG', 'Congo - Brazzaville', 'Congo - Brazzaville', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(53, 'CD', 'Congo - Kinshasa', 'Congo - Kinshasa', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(54, 'CK', 'Cook Islands', 'Cook Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(55, 'CR', 'Costa Rica', 'Costa Rica', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(56, 'CI', 'Côte d’Ivoire', 'Côte d’Ivoire', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(57, 'HR', 'Croatia', 'Croatia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(58, 'CU', 'Cuba', 'Cuba', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(59, 'CW', 'Curaçao', 'Curaçao', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(60, 'CY', 'Cyprus', 'Cyprus', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(61, 'CZ', 'Czechia', 'Czechia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(62, 'DK', 'Denmark', 'Denmark', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(63, 'DJ', 'Djibouti', 'Djibouti', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(64, 'DM', 'Dominica', 'Dominica', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(65, 'DO', 'Dominican Republic', 'Dominican Republic', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(66, 'EC', 'Ecuador', 'Ecuador', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(67, 'EG', 'Egypt', 'Egypt', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(68, 'SV', 'El Salvador', 'El Salvador', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(69, 'GQ', 'Equatorial Guinea', 'Equatorial Guinea', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(70, 'ER', 'Eritrea', 'Eritrea', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(71, 'EE', 'Estonia', 'Estonia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(72, 'SZ', 'Eswatini', 'Eswatini', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(73, 'ET', 'Ethiopia', 'Ethiopia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(74, 'FK', 'Falkland Islands', 'Falkland Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(75, 'FO', 'Faroe Islands', 'Faroe Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(76, 'FJ', 'Fiji', 'Fiji', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(77, 'FI', 'Finland', 'Finland', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(78, 'FR', 'France', 'France', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(79, 'GF', 'French Guiana', 'French Guiana', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(80, 'PF', 'French Polynesia', 'French Polynesia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(81, 'TF', 'French Southern Territories', 'French Southern Territories', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(82, 'GA', 'Gabon', 'Gabon', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(83, 'GM', 'Gambia', 'Gambia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(84, 'GE', 'Georgia', 'Georgia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(85, 'DE', 'Germany', 'Germany', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(86, 'GH', 'Ghana', 'Ghana', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(87, 'GI', 'Gibraltar', 'Gibraltar', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(88, 'GR', 'Greece', 'Greece', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(89, 'GL', 'Greenland', 'Greenland', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(90, 'GD', 'Grenada', 'Grenada', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(91, 'GP', 'Guadeloupe', 'Guadeloupe', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(92, 'GU', 'Guam', 'Guam', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(93, 'GT', 'Guatemala', 'Guatemala', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(94, 'GG', 'Guernsey', 'Guernsey', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(95, 'GN', 'Guinea', 'Guinea', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(96, 'GW', 'Guinea-Bissau', 'Guinea-Bissau', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(97, 'GY', 'Guyana', 'Guyana', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(98, 'HT', 'Haiti', 'Haiti', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(99, 'HM', 'Heard & McDonald Islands', 'Heard & McDonald Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(100, 'HN', 'Honduras', 'Honduras', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(101, 'HK', 'Hong Kong SAR China', 'Hong Kong SAR China', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(102, 'HU', 'Hungary', 'Hungary', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(103, 'IS', 'Iceland', 'Iceland', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(104, 'IN', 'India', 'India', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(105, 'ID', 'Indonesia', 'Indonesia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(106, 'IR', 'Iran', 'Iran', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(107, 'IQ', 'Iraq', 'Iraq', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(108, 'IE', 'Ireland', 'Ireland', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(109, 'IM', 'Isle of Man', 'Isle of Man', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(110, 'IL', 'Israel', 'Israel', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(111, 'IT', 'Italy', 'Italy', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(112, 'JM', 'Jamaica', 'Jamaica', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(113, 'JP', 'Japan', 'Japan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(114, 'JE', 'Jersey', 'Jersey', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(115, 'JO', 'Jordan', 'Jordan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(116, 'KZ', 'Kazakhstan', 'Kazakhstan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(117, 'KE', 'Kenya', 'Kenya', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(118, 'KI', 'Kiribati', 'Kiribati', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(119, 'KW', 'Kuwait', 'Kuwait', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(120, 'KG', 'Kyrgyzstan', 'Kyrgyzstan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(121, 'LA', 'Laos', 'Laos', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(122, 'LV', 'Latvia', 'Latvia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(123, 'LB', 'Lebanon', 'Lebanon', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(124, 'LS', 'Lesotho', 'Lesotho', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(125, 'LR', 'Liberia', 'Liberia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(126, 'LY', 'Libya', 'Libya', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(127, 'LI', 'Liechtenstein', 'Liechtenstein', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(128, 'LT', 'Lithuania', 'Lithuania', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(129, 'LU', 'Luxembourg', 'Luxembourg', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(130, 'MO', 'Macao SAR China', 'Macao SAR China', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(131, 'MG', 'Madagascar', 'Madagascar', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(132, 'MW', 'Malawi', 'Malawi', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(133, 'MY', 'Malaysia', 'Malaysia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(134, 'MV', 'Maldives', 'Maldives', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(135, 'ML', 'Mali', 'Mali', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(136, 'MT', 'Malta', 'Malta', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(137, 'MH', 'Marshall Islands', 'Marshall Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(138, 'MQ', 'Martinique', 'Martinique', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(139, 'MR', 'Mauritania', 'Mauritania', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(140, 'MU', 'Mauritius', 'Mauritius', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(141, 'YT', 'Mayotte', 'Mayotte', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(142, 'MX', 'Mexico', 'Mexico', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(143, 'FM', 'Micronesia', 'Micronesia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(144, 'MD', 'Moldova', 'Moldova', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(145, 'MC', 'Monaco', 'Monaco', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(146, 'MN', 'Mongolia', 'Mongolia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(147, 'ME', 'Montenegro', 'Montenegro', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(148, 'MS', 'Montserrat', 'Montserrat', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(149, 'MA', 'Morocco', 'Morocco', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(150, 'MZ', 'Mozambique', 'Mozambique', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(151, 'MM', 'Myanmar (Burma)', 'Myanmar (Burma)', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(152, 'NA', 'Namibia', 'Namibia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(153, 'NR', 'Nauru', 'Nauru', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(154, 'NP', 'Nepal', 'Nepal', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(155, 'NL', 'Netherlands', 'Netherlands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(156, 'NC', 'New Caledonia', 'New Caledonia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(157, 'NZ', 'New Zealand', 'New Zealand', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(158, 'NI', 'Nicaragua', 'Nicaragua', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(159, 'NE', 'Niger', 'Niger', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(160, 'NG', 'Nigeria', 'Nigeria', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(161, 'NU', 'Niue', 'Niue', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(162, 'NF', 'Norfolk Island', 'Norfolk Island', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(163, 'KP', 'North Korea', 'North Korea', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(164, 'MK', 'North Macedonia', 'North Macedonia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(165, 'MP', 'Northern Mariana Islands', 'Northern Mariana Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(166, 'NO', 'Norway', 'Norway', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(167, 'OM', 'Oman', 'Oman', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(168, 'PK', 'Pakistan', 'Pakistan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(169, 'PW', 'Palau', 'Palau', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(170, 'PS', 'Palestinian Territories', 'Palestinian Territories', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(171, 'PA', 'Panama', 'Panama', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(172, 'PG', 'Papua New Guinea', 'Papua New Guinea', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(173, 'PY', 'Paraguay', 'Paraguay', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(174, 'PE', 'Peru', 'Peru', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(175, 'PH', 'Philippines', 'Philippines', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(176, 'PN', 'Pitcairn Islands', 'Pitcairn Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(177, 'PL', 'Poland', 'Poland', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(178, 'PT', 'Portugal', 'Portugal', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(179, 'PR', 'Puerto Rico', 'Puerto Rico', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(180, 'QA', 'Qatar', 'Qatar', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(181, 'RE', 'Réunion', 'Réunion', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(182, 'RO', 'Romania', 'Romania', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(183, 'RU', 'Russia', 'Russia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(184, 'RW', 'Rwanda', 'Rwanda', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(185, 'WS', 'Samoa', 'Samoa', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(186, 'SM', 'San Marino', 'San Marino', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(187, 'ST', 'São Tomé & Príncipe', 'São Tomé & Príncipe', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(188, 'SA', 'Saudi Arabia', 'Saudi Arabia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(189, 'SN', 'Senegal', 'Senegal', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(190, 'RS', 'Serbia', 'Serbia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(191, 'SC', 'Seychelles', 'Seychelles', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(192, 'SL', 'Sierra Leone', 'Sierra Leone', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(193, 'SG', 'Singapore', 'Singapore', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(194, 'SX', 'Sint Maarten', 'Sint Maarten', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(195, 'SK', 'Slovakia', 'Slovakia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(196, 'SI', 'Slovenia', 'Slovenia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(197, 'SB', 'Solomon Islands', 'Solomon Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(198, 'SO', 'Somalia', 'Somalia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(199, 'ZA', 'South Africa', 'South Africa', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(200, 'GS', 'South Georgia & South Sandwich Islands', 'South Georgia & South Sandwich Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(201, 'KR', 'South Korea', 'South Korea', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(202, 'SS', 'South Sudan', 'South Sudan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(203, 'ES', 'Spain', 'Spain', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(204, 'LK', 'Sri Lanka', 'Sri Lanka', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(205, 'BL', 'St. Barthélemy', 'St. Barthélemy', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(206, 'SH', 'St. Helena', 'St. Helena', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(207, 'KN', 'St. Kitts & Nevis', 'St. Kitts & Nevis', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(208, 'LC', 'St. Lucia', 'St. Lucia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(209, 'MF', 'St. Martin', 'St. Martin', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(210, 'PM', 'St. Pierre & Miquelon', 'St. Pierre & Miquelon', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(211, 'VC', 'St. Vincent & Grenadines', 'St. Vincent & Grenadines', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(212, 'SD', 'Sudan', 'Sudan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(213, 'SR', 'Suriname', 'Suriname', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(214, 'SJ', 'Svalbard & Jan Mayen', 'Svalbard & Jan Mayen', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(215, 'SE', 'Sweden', 'Sweden', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(216, 'CH', 'Switzerland', 'Switzerland', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(217, 'SY', 'Syria', 'Syria', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(218, 'TW', 'Taiwan', 'Taiwan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(219, 'TJ', 'Tajikistan', 'Tajikistan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(220, 'TZ', 'Tanzania', 'Tanzania', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(221, 'TH', 'Thailand', 'Thailand', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(222, 'TL', 'Timor-Leste', 'Timor-Leste', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(223, 'TG', 'Togo', 'Togo', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(224, 'TK', 'Tokelau', 'Tokelau', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(225, 'TO', 'Tonga', 'Tonga', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(226, 'TT', 'Trinidad & Tobago', 'Trinidad & Tobago', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(227, 'TN', 'Tunisia', 'Tunisia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(228, 'TR', 'Turkey', 'Turkey', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(229, 'TM', 'Turkmenistan', 'Turkmenistan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(230, 'TC', 'Turks & Caicos Islands', 'Turks & Caicos Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(231, 'TV', 'Tuvalu', 'Tuvalu', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(232, 'UM', 'U.S. Outlying Islands', 'U.S. Outlying Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(233, 'VI', 'U.S. Virgin Islands', 'U.S. Virgin Islands', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(234, 'UG', 'Uganda', 'Uganda', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(235, 'UA', 'Ukraine', 'Ukraine', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(236, 'AE', 'United Arab Emirates', 'United Arab Emirates', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(237, 'GB', 'United Kingdom', 'United Kingdom', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(238, 'US', 'United States', 'United States', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(239, 'UY', 'Uruguay', 'Uruguay', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(240, 'UZ', 'Uzbekistan', 'Uzbekistan', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(241, 'VU', 'Vanuatu', 'Vanuatu', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(242, 'VA', 'Vatican City', 'Vatican City', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(243, 'VE', 'Venezuela', 'Venezuela', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(244, 'VN', 'Vietnam', 'Vietnam', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(245, 'WF', 'Wallis & Futuna', 'Wallis & Futuna', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(246, 'EH', 'Western Sahara', 'Western Sahara', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(247, 'YE', 'Yemen', 'Yemen', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(248, 'ZM', 'Zambia', 'Zambia', 1, '2020-09-20 12:19:23', '2020-09-20 12:19:24'),
	(249, 'ZW', 'Zimbabwe', 'Zimbabwe', 1, '2020-09-20 12:19:23', '2021-10-18 18:50:15');

-- Dumping structure for table aurora.country_languages
CREATE TABLE IF NOT EXISTS `country_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.country_languages: ~6 rows (approximately)
DELETE FROM `country_languages`;
INSERT INTO `country_languages` (`id`, `country_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
	(5, 249, 'zimbabwe', 'vi', '2021-10-18 18:49:54', '2021-10-18 18:50:15'),
	(6, 249, 'ZIMBABWE', 'en', '2021-10-18 18:49:54', '2021-10-18 18:49:54'),
	(7, 249, 'ZIMBABWE', 'un', '2021-10-18 18:49:54', '2021-10-18 18:49:54'),
	(8, 249, 'ZIMBABWE', 'ca', '2021-10-18 18:49:54', '2021-10-18 18:49:54'),
	(9, 188, 'Ả Rập Xê-út', 'vi', '2021-12-27 00:10:11', '2021-12-27 00:10:11'),
	(10, 188, 'Saudi Arabic', 'en', '2021-12-27 00:10:11', '2021-12-27 00:10:11');

-- Dumping structure for table aurora.enquiries
CREATE TABLE IF NOT EXISTS `enquiries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.enquiries: ~2 rows (approximately)
DELETE FROM `enquiries`;
INSERT INTO `enquiries` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Thuê đất', 1, '2021-10-19 05:55:33', '2021-10-19 06:05:39'),
	(2, 'Thuê nhà xưởng', 1, '2021-10-19 06:05:34', '2021-10-19 06:05:34');

-- Dumping structure for table aurora.enquiry_languages
CREATE TABLE IF NOT EXISTS `enquiry_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enquiry_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.enquiry_languages: ~8 rows (approximately)
DELETE FROM `enquiry_languages`;
INSERT INTO `enquiry_languages` (`id`, `enquiry_id`, `name`, `note`, `lang`, `created_at`, `updated_at`) VALUES
	(8, 1, 'Thuê đất', 'Nhỏ nhất 10.000m2', 'vi', '2021-10-19 05:55:33', '2021-10-19 05:55:33'),
	(9, 1, 'Thuê đất', NULL, 'en', '2021-10-19 05:55:33', '2021-10-19 05:55:33'),
	(10, 1, 'Thuê đất', NULL, 'un', '2021-10-19 05:55:33', '2021-10-19 05:55:33'),
	(11, 1, 'Thuê đất', NULL, 'ca', '2021-10-19 05:55:33', '2021-10-19 05:55:33'),
	(12, 2, 'Thuê nhà xưởng', 'Tối thiểu 2.500m2', 'vi', '2021-10-19 06:05:34', '2021-10-19 06:05:34'),
	(13, 2, 'Thuê nhà xưởng', NULL, 'en', '2021-10-19 06:05:34', '2021-10-19 06:05:34'),
	(14, 2, 'Thuê nhà xưởng', NULL, 'un', '2021-10-19 06:05:34', '2021-10-19 06:05:34'),
	(15, 2, 'Thuê nhà xưởng', NULL, 'ca', '2021-10-19 06:05:34', '2021-10-19 06:05:34');

-- Dumping structure for table aurora.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table aurora.lands
CREATE TABLE IF NOT EXISTS `lands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_land` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1 COMMENT '1: Còn trống, 2: Đang giữ chỗ, 3: Đã cho thuê',
  `style` int(11) DEFAULT 1 COMMENT '1: Lô đất, 2: Nhà xưởng xây sẵn',
  `view` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.lands: ~19 rows (approximately)
DELETE FROM `lands`;
INSERT INTO `lands` (`id`, `name`, `name_land`, `status`, `style`, `view`, `created_at`, `updated_at`) VALUES
	(3, 'CN1', 'CN1', 1, 1, 2, '2021-10-18 09:34:24', '2021-12-01 01:58:12'),
	(4, 'CN2', 'CN2', 1, 1, 0, '2021-10-18 09:34:34', '2021-10-18 09:34:34'),
	(5, 'CN3', 'CN3', 1, 1, 0, '2021-10-18 09:34:41', '2021-10-18 09:34:41'),
	(6, 'CN4', 'CN4', 1, 1, 0, '2021-10-18 09:34:49', '2021-10-18 09:34:49'),
	(7, 'CN5', 'CN5', 1, 1, 1, '2021-10-18 09:35:01', '2021-12-01 02:23:50'),
	(8, 'CN6', 'CN6', 1, 1, 0, '2021-10-18 09:35:09', '2021-10-18 09:35:09'),
	(9, 'CN7', 'CN7', 1, 1, 1, '2021-10-18 09:35:18', '2021-12-01 02:23:30'),
	(10, 'CN8', 'CN8', 1, 1, 0, '2021-10-18 09:35:25', '2021-10-18 09:35:25'),
	(11, 'CN9', 'CN9', 1, 1, 0, '2021-10-18 09:35:33', '2021-10-18 09:35:33'),
	(12, 'CN10', 'CN10', 1, 1, 6, '2021-10-18 09:35:40', '2021-12-08 04:44:41'),
	(13, 'CN11', 'CN11', 1, 1, 6, '2021-10-18 09:35:47', '2021-12-08 04:34:29'),
	(14, 'CN12', 'CN12', 1, 1, 9, '2021-10-18 09:35:54', '2021-12-08 04:46:19'),
	(15, 'CN13', 'CN13', 1, 1, 1, '2021-10-18 09:36:01', '2021-12-08 04:46:09'),
	(16, 'CN14', 'CN14', 1, 1, 0, '2021-10-18 09:36:08', '2021-10-18 09:36:08'),
	(17, 'CN15', 'CN15', 1, 1, 1, '2021-10-18 09:36:16', '2021-12-08 04:30:47'),
	(18, 'CN16', 'CN16', 1, 1, 1, '2021-10-18 09:36:23', '2021-12-08 04:30:50'),
	(19, 'CN17', 'CN17', 1, 1, 0, '2021-10-18 09:36:31', '2021-10-18 09:36:31'),
	(20, 'CN14B', 'CN14B', 1, 1, 0, '2021-10-18 09:43:27', '2021-10-18 09:43:27'),
	(21, 'HT1', 'HT1', 1, 2, 0, '2021-12-10 19:34:47', '2021-12-10 19:34:47');

-- Dumping structure for table aurora.land_languages
CREATE TABLE IF NOT EXISTS `land_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `land_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.land_languages: ~57 rows (approximately)
DELETE FROM `land_languages`;
INSERT INTO `land_languages` (`id`, `land_id`, `name`, `content`, `lang`, `created_at`, `updated_at`) VALUES
	(16, 3, 'CN1', '<p>- T&ecirc;n l&ocirc; đất: CN1<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 20.13 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:34:24', '2021-12-14 06:53:07'),
	(17, 3, 'CN1', NULL, 'en', '2021-10-18 09:34:24', '2021-10-18 09:34:24'),
	(18, 3, 'CN1', NULL, 'un', '2021-10-18 09:34:24', '2021-10-18 09:34:24'),
	(19, 4, 'CN2', '<p>- T&ecirc;n l&ocirc; đất: CN2<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 19.05 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:34:34', '2021-12-14 06:53:18'),
	(20, 4, 'CN2', NULL, 'en', '2021-10-18 09:34:34', '2021-10-18 09:34:34'),
	(21, 4, 'CN2', NULL, 'un', '2021-10-18 09:34:34', '2021-10-18 09:34:34'),
	(22, 5, 'CN3', '<p>- T&ecirc;n l&ocirc; đất: CN3<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 12.75 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:34:41', '2021-12-14 06:53:23'),
	(23, 5, 'CN3', NULL, 'en', '2021-10-18 09:34:41', '2021-10-18 09:34:41'),
	(24, 5, 'CN3', NULL, 'un', '2021-10-18 09:34:41', '2021-10-18 09:34:41'),
	(25, 6, 'CN4', '<p>- T&ecirc;n l&ocirc; đất: CN4<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 7.82 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:34:49', '2021-12-14 06:53:29'),
	(26, 6, 'CN4', NULL, 'en', '2021-10-18 09:34:49', '2021-10-18 09:34:49'),
	(27, 6, 'CN4', NULL, 'un', '2021-10-18 09:34:49', '2021-10-18 09:34:49'),
	(28, 7, 'CN5', '<p>- T&ecirc;n l&ocirc; đất: CN5<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 12.34 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:35:01', '2021-12-14 06:53:36'),
	(29, 7, 'CN5', NULL, 'en', '2021-10-18 09:35:02', '2021-10-18 09:35:02'),
	(30, 7, 'CN5', NULL, 'un', '2021-10-18 09:35:02', '2021-10-18 09:35:02'),
	(31, 8, 'CN6', '<p>- T&ecirc;n l&ocirc; đất: CN6<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 10.73 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:35:09', '2021-12-14 06:53:43'),
	(32, 8, 'CN6', NULL, 'en', '2021-10-18 09:35:09', '2021-10-18 09:35:09'),
	(33, 8, 'CN6', NULL, 'un', '2021-10-18 09:35:09', '2021-10-18 09:35:09'),
	(34, 9, 'CN7', '<p>- T&ecirc;n l&ocirc; đất: CN7<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 26.42 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:35:18', '2021-12-14 06:53:50'),
	(35, 9, 'CN7', NULL, 'en', '2021-10-18 09:35:18', '2021-10-18 09:35:18'),
	(36, 9, 'CN7', NULL, 'un', '2021-10-18 09:35:18', '2021-10-18 09:35:18'),
	(37, 10, 'CN8', '<p>- T&ecirc;n l&ocirc; đất: CN8<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 11.5 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:35:25', '2021-12-14 06:54:05'),
	(38, 10, 'CN8', NULL, 'en', '2021-10-18 09:35:26', '2021-10-18 09:35:26'),
	(39, 10, 'CN8', NULL, 'un', '2021-10-18 09:35:26', '2021-10-18 09:35:26'),
	(40, 11, 'CN9', '<p>- T&ecirc;n l&ocirc; đất: CN9<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 12.79 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:35:33', '2021-12-14 06:54:12'),
	(41, 11, 'CN9', NULL, 'en', '2021-10-18 09:35:33', '2021-10-18 09:35:33'),
	(42, 11, 'CN9', NULL, 'un', '2021-10-18 09:35:33', '2021-10-18 09:35:33'),
	(43, 12, 'CN10', '<p>C&ocirc;ng ty TNHH TOP Textiles<br />\r\n&nbsp;</p>', 'vi', '2021-10-18 09:35:41', '2021-12-23 02:03:13'),
	(44, 12, 'CN10', '<p>TOP Textiles Co.,ltd</p>', 'en', '2021-10-18 09:35:41', '2021-12-23 02:19:14'),
	(45, 12, 'CN10', NULL, 'un', '2021-10-18 09:35:41', '2021-10-18 09:35:41'),
	(46, 13, 'CN11', '<p>- T&ecirc;n l&ocirc; đất: CN11<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 22.24 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:35:47', '2021-12-14 06:54:27'),
	(47, 13, 'CN11', NULL, 'en', '2021-10-18 09:35:47', '2021-10-18 09:35:47'),
	(48, 13, 'CN11', NULL, 'un', '2021-10-18 09:35:48', '2021-10-18 09:35:48'),
	(49, 14, 'CN12', '<p>- T&ecirc;n l&ocirc; đất: CN12<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 24.37 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:35:54', '2021-12-14 06:54:39'),
	(50, 14, 'CN12', NULL, 'en', '2021-10-18 09:35:55', '2021-10-18 09:35:55'),
	(51, 14, 'CN12', NULL, 'un', '2021-10-18 09:35:55', '2021-10-18 09:35:55'),
	(52, 15, 'CN13', '<p>- T&ecirc;n l&ocirc; đất: CN13<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 14.46 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:36:01', '2021-12-14 06:54:45'),
	(53, 15, 'CN13', NULL, 'en', '2021-10-18 09:36:01', '2021-10-18 09:36:01'),
	(54, 15, 'CN13', NULL, 'un', '2021-10-18 09:36:01', '2021-10-18 09:36:01'),
	(55, 16, 'CN14', '<p>- T&ecirc;n l&ocirc; đất: CN14<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 9.67 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:36:09', '2021-12-14 06:54:53'),
	(56, 16, 'CN14', NULL, 'en', '2021-10-18 09:36:09', '2021-10-18 09:36:09'),
	(57, 16, 'CN14', NULL, 'un', '2021-10-18 09:36:09', '2021-10-18 09:36:09'),
	(58, 17, 'CN15', '<p>C&ocirc;ng ty TNHH Jehong Textile</p>', 'vi', '2021-10-18 09:36:16', '2021-12-23 02:03:24'),
	(59, 17, 'CN15', '<p>Jehong Textile Co.,ltd</p>', 'en', '2021-10-18 09:36:16', '2021-12-23 02:19:32'),
	(60, 17, 'CN15', NULL, 'un', '2021-10-18 09:36:16', '2021-10-18 09:36:16'),
	(61, 18, 'CN16', '<p>- T&ecirc;n l&ocirc; đất: CN16<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 24.16 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:36:24', '2021-12-14 06:56:06'),
	(62, 18, 'CN16', NULL, 'en', '2021-10-18 09:36:24', '2021-10-18 09:36:24'),
	(63, 18, 'CN16', NULL, 'un', '2021-10-18 09:36:24', '2021-10-18 09:36:24'),
	(64, 19, 'CN17', '<p>- T&ecirc;n l&ocirc; đất: CN17<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 34.34 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:36:31', '2021-12-14 06:55:58'),
	(65, 19, 'CN17', NULL, 'en', '2021-10-18 09:36:31', '2021-10-18 09:36:31'),
	(66, 19, 'CN17', NULL, 'un', '2021-10-18 09:36:31', '2021-10-18 09:36:31'),
	(67, 20, 'CN14B', '<p>- T&ecirc;n l&ocirc; đất: CN14B<br />\r\n- Diện t&iacute;ch l&ocirc; đất: 6.68 ha<br />\r\n- Mật độ x&acirc;y dựng: 60 %<br />\r\n- Hệ số sử dụng đất: 1.5<br />\r\n- Cao tầng x&acirc;y dựng: 2.5</p>', 'vi', '2021-10-18 09:43:27', '2021-12-14 06:55:52'),
	(68, 20, 'CN14B', NULL, 'en', '2021-10-18 09:43:27', '2021-10-18 09:43:27'),
	(69, 20, 'CN14B', NULL, 'un', '2021-10-18 09:43:27', '2021-10-18 09:43:27'),
	(70, 3, 'CN1', NULL, 'ca', '2021-10-18 19:05:53', '2021-10-18 19:05:53'),
	(71, 21, 'HT1', '<p>Trạm biến &aacute;p<br />\r\nĐiện &aacute;p: 110kV<br />\r\nC&ocirc;ng suất: 2x63MVA</p>', 'vi', '2021-12-10 19:34:47', '2021-12-14 06:56:48'),
	(72, 21, 'HT1', NULL, 'en', '2021-12-10 19:34:47', '2021-12-10 19:34:47');

-- Dumping structure for table aurora.land_styles
CREATE TABLE IF NOT EXISTS `land_styles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.land_styles: ~2 rows (approximately)
DELETE FROM `land_styles`;
INSERT INTO `land_styles` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'loại 1', '2021-10-19 02:25:52', '2021-10-19 02:25:52'),
	(2, 'Thuê đất', '2021-10-19 05:53:53', '2021-10-19 05:53:53');

-- Dumping structure for table aurora.land_style_languages
CREATE TABLE IF NOT EXISTS `land_style_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `land_style_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.land_style_languages: ~8 rows (approximately)
DELETE FROM `land_style_languages`;
INSERT INTO `land_style_languages` (`id`, `land_style_id`, `name`, `note`, `lang`, `created_at`, `updated_at`) VALUES
	(8, 1, 'loại 1', '112', 'vi', '2021-10-19 02:25:53', '2021-10-19 02:41:46'),
	(9, 1, 'loại 1', NULL, 'en', '2021-10-19 02:25:53', '2021-10-19 02:25:53'),
	(10, 1, 'loại 1', NULL, 'un', '2021-10-19 02:25:53', '2021-10-19 02:25:53'),
	(11, 1, 'loại 4', NULL, 'ca', '2021-10-19 02:25:53', '2021-10-19 02:39:05'),
	(12, 2, 'Thuê đất', 'Nhỏ nhất 10.000m2', 'vi', '2021-10-19 05:53:54', '2021-10-19 05:53:54'),
	(13, 2, 'Thuê đất', NULL, 'en', '2021-10-19 05:53:54', '2021-10-19 05:53:54'),
	(14, 2, 'Thuê đất', NULL, 'un', '2021-10-19 05:53:54', '2021-10-19 05:53:54'),
	(15, 2, 'Thuê đất', NULL, 'ca', '2021-10-19 05:53:54', '2021-10-19 05:53:54');

-- Dumping structure for table aurora.land_uses
CREATE TABLE IF NOT EXISTS `land_uses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.land_uses: ~2 rows (approximately)
DELETE FROM `land_uses`;
INSERT INTO `land_uses` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Thuê đất 2', 1, '2021-12-15 01:44:37', '2021-12-15 01:47:07'),
	(2, 'Mở rộng sản xuất', 1, '2021-12-15 01:47:38', '2021-12-15 01:47:38');

-- Dumping structure for table aurora.land_use_languages
CREATE TABLE IF NOT EXISTS `land_use_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `land_use_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.land_use_languages: ~4 rows (approximately)
DELETE FROM `land_use_languages`;
INSERT INTO `land_use_languages` (`id`, `land_use_id`, `name`, `note`, `lang`, `created_at`, `updated_at`) VALUES
	(1, 2, 'Mở rộng sản xuất', NULL, 'vi', '2021-12-15 01:55:24', '2021-12-15 01:55:24'),
	(2, 2, 'Mở rộng sản xuất', NULL, 'en', '2021-12-15 01:55:24', '2021-12-15 01:55:24'),
	(3, 1, 'Thuê đất', NULL, 'vi', '2021-12-15 01:55:28', '2021-12-15 01:55:38'),
	(4, 1, 'Thuê đất 2', NULL, 'en', '2021-12-15 01:55:29', '2021-12-15 01:55:29');

-- Dumping structure for table aurora.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `is_delete` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.languages: ~2 rows (approximately)
DELETE FROM `languages`;
INSERT INTO `languages` (`id`, `name`, `code`, `photo`, `status`, `is_delete`, `created_at`, `updated_at`) VALUES
	(1, 'Việt nam', 'vi', 'language-image-1640782699.png', 1, 0, '2021-10-15 09:50:10', '2021-12-29 05:58:19'),
	(3, 'English', 'en', 'language-image-1640782689.png', 1, 0, '2021-10-15 13:18:53', '2021-12-29 05:58:09');

-- Dumping structure for table aurora.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.migrations: ~5 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2021_10_13_035143_create_permission_tables', 2);

-- Dumping structure for table aurora.model_has_permissions
CREATE TABLE IF NOT EXISTS `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.model_has_permissions: ~0 rows (approximately)
DELETE FROM `model_has_permissions`;

-- Dumping structure for table aurora.model_has_roles
CREATE TABLE IF NOT EXISTS `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.model_has_roles: ~3 rows (approximately)
DELETE FROM `model_has_roles`;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
	(1, 'App\\Models\\User', 1),
	(1, 'App\\Models\\User', 2),
	(1, 'App\\Models\\User', 3);

-- Dumping structure for table aurora.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;

-- Dumping structure for table aurora.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.permissions: ~0 rows (approximately)
DELETE FROM `permissions`;

-- Dumping structure for table aurora.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table aurora.reservations
CREATE TABLE IF NOT EXISTS `reservations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_dk` varchar(200) DEFAULT NULL,
  `sdt` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `ten_doanh_nghiep` varchar(200) DEFAULT NULL,
  `loai` int(11) DEFAULT 1 COMMENT '1: dat giu cho, 2: tham quan',
  `business` text DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `muc_dich_su_dung` varchar(100) DEFAULT NULL COMMENT '1: mở rộng sản xuất, 2: thành lập doanh nghiệp mới',
  `muc_dich_su_dung_khac` text DEFAULT NULL,
  `dat_cho_thue` int(11) DEFAULT NULL,
  `nha_xuong_cho_thue` int(11) DEFAULT NULL,
  `visiting` text DEFAULT NULL,
  `muc_dich_tham_quan_khac` text DEFAULT NULL,
  `so_nguoi_tham_quan` int(11) DEFAULT NULL,
  `tham_quan_tu_ngay` date DEFAULT NULL,
  `tham_quan_den_ngay` date DEFAULT NULL,
  `content` text DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.reservations: ~10 rows (approximately)
DELETE FROM `reservations`;
INSERT INTO `reservations` (`id`, `ten_dk`, `sdt`, `email`, `ten_doanh_nghiep`, `loai`, `business`, `country_id`, `muc_dich_su_dung`, `muc_dich_su_dung_khac`, `dat_cho_thue`, `nha_xuong_cho_thue`, `visiting`, `muc_dich_tham_quan_khac`, `so_nguoi_tham_quan`, `tham_quan_tu_ngay`, `tham_quan_den_ngay`, `content`, `new`, `created_at`, `updated_at`) VALUES
	(30, 'test', '0987478541', 'test@gmail.com', 'test69', 2, NULL, 188, NULL, NULL, NULL, NULL, '', 'khac', 9, '2021-12-01', '2021-12-31', 'abc', 0, '2021-12-29 07:28:34', '2021-12-29 07:28:34'),
	(31, 'test', '0987478541', 'test@gmail.com', 'test69', 2, NULL, 188, NULL, NULL, NULL, NULL, '', 'khac', 9, '2021-12-01', '2021-12-31', 'abc', 0, '2021-12-29 07:28:43', '2021-12-29 07:28:43'),
	(32, 'test', '0985748541', 'test@gmail.com', 'test69', 2, '2', 188, NULL, NULL, NULL, NULL, 'loại 1,loại 2,', 'khac', 69, '2021-12-01', '2021-12-31', '958', 0, '2021-12-29 07:30:29', '2021-12-29 07:30:29'),
	(33, 'test 1', '0985748541', 'test@gmail.com', 'test69', 2, '2', 188, NULL, NULL, NULL, NULL, 'loại 1,loại 2,', 'khac', 69, '2021-12-01', '2021-12-31', '958', 1, '2021-12-29 07:33:01', '2021-12-29 07:33:11'),
	(34, 'test 1', '0985748541', 'test@gmail.com', 'test69', 2, '2', 188, NULL, NULL, NULL, NULL, 'loại 1,loại 2,', 'khac', 69, '2021-12-01', '2021-12-31', '958', 0, '2021-12-29 07:36:47', '2021-12-29 07:36:47'),
	(35, 'test 1', '0985748541', 'test@gmail.com', 'test69', 2, '2', 188, NULL, NULL, NULL, NULL, 'loại 1,loại 2,', 'khac', 69, '2021-12-01', '2021-12-31', '958', 0, '2021-12-29 07:38:22', '2021-12-29 07:38:22'),
	(36, 'test 1', '0985748541', 'test@gmail.com', 'test69', 2, '2', 188, NULL, NULL, NULL, NULL, 'loại 1,loại 2,', 'khac', 69, '2021-12-01', '2021-12-31', '958', 0, '2021-12-29 07:40:39', '2021-12-29 07:40:39'),
	(37, 'test 1', '0985748541', 'test@gmail.com', 'test69', 2, '2', 188, NULL, NULL, NULL, NULL, 'loại 1,loại 2,', 'khac', 69, '2021-12-01', '2021-12-31', '958', 0, '2021-12-29 07:41:05', '2021-12-29 07:41:05'),
	(38, 'test 1', '0985748541', 'test@gmail.com', 'test69', 2, '2', 188, NULL, NULL, NULL, NULL, 'loại 1,loại 2', 'khac', 69, '2021-12-01', '2021-12-31', '958', 0, '2021-12-29 07:43:03', '2021-12-29 07:43:03'),
	(39, 'test', '098574854', 'test@gmail.com', 'test 12', 2, '2', 188, NULL, NULL, NULL, NULL, 'loại 1, loại 2', 'aaaaaa', 56, '2021-12-30', '2021-12-31', 'ssssssss', 0, '2021-12-29 20:10:47', '2021-12-29 20:10:47'),
	(40, 'test a', '0985784854', 'test@gmail.com', 'test', 2, 'test 582', 1, NULL, NULL, NULL, NULL, 'loại 1, loại 2', 'ax', 58, '2021-12-01', '2021-12-30', 'aaax', 0, '2021-12-30 04:46:27', '2021-12-30 04:46:27');

-- Dumping structure for table aurora.reservation_registers
CREATE TABLE IF NOT EXISTS `reservation_registers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_dk` varchar(200) DEFAULT NULL,
  `sdt` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `ten_doanh_nghiep` varchar(200) DEFAULT NULL,
  `business` varchar(200) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `land_use_id` varchar(100) DEFAULT NULL,
  `land_use_name` text DEFAULT NULL,
  `muc_dich_su_dung_khac` text DEFAULT NULL,
  `land_id` text DEFAULT NULL,
  `land_name` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.reservation_registers: ~0 rows (approximately)
DELETE FROM `reservation_registers`;
INSERT INTO `reservation_registers` (`id`, `ten_dk`, `sdt`, `email`, `ten_doanh_nghiep`, `business`, `country_id`, `land_use_id`, `land_use_name`, `muc_dich_su_dung_khac`, `land_id`, `land_name`, `content`, `new`, `created_at`, `updated_at`) VALUES
	(8, 'test', '09857452114', 'test@gmail.com', 'aaaaa', 'sssss', 1, NULL, NULL, 'aaaaaa', '3, 4', 'CN1, CN2', NULL, 1, '2021-12-29 21:56:41', '2021-12-29 22:00:34'),
	(9, 'test', '0251458657', 'test@gmail.com', 'aaaasd', 'bgc', 1, '1, 2', 'Thuê đất 2, Mở rộng sản xuất', '77g', '4, 5', 'CN2, CN3', 'sss', 1, '2021-12-30 00:17:08', '2021-12-30 00:17:43');

-- Dumping structure for table aurora.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.roles: ~2 rows (approximately)
DELETE FROM `roles`;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin', '2021-10-13 03:53:38', '2021-10-13 03:53:39'),
	(2, 'trongktvn', 'admin', '2021-10-17 12:44:36', '2021-10-17 12:44:37');

-- Dumping structure for table aurora.role_has_permissions
CREATE TABLE IF NOT EXISTS `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.role_has_permissions: ~0 rows (approximately)
DELETE FROM `role_has_permissions`;

-- Dumping structure for table aurora.scenes
CREATE TABLE IF NOT EXISTS `scenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `name_scene` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.scenes: ~17 rows (approximately)
DELETE FROM `scenes`;
INSERT INTO `scenes` (`id`, `name`, `name_scene`, `created_at`, `updated_at`) VALUES
	(3, 'Tổng quan KCN Dệt may Rạng Đông', 'scene_view_1', '2021-10-19 00:55:01', '2021-12-29 00:34:23'),
	(4, 'Khu vực đất công nghiệp', 'scene_view_2', '2021-10-19 00:55:09', '2021-12-29 00:34:11'),
	(5, 'KCN Dệt may Rạng Đông - view 3', 'scene_view_3', '2021-10-19 00:55:17', '2021-12-29 00:34:00'),
	(6, 'Nhà máy xử lý nước thải', 'scene_view_4', '2021-10-19 00:55:24', '2021-12-29 00:33:50'),
	(7, 'Khu vực kho tàng, bến bãi', 'scene_view_5', '2021-10-19 00:55:31', '2021-12-29 00:33:37'),
	(8, 'Khu vực hành chính , dịch vụ', 'scene_view_6', '2021-10-19 00:55:38', '2021-12-29 00:33:10'),
	(9, 'Cổng chào Khu công nghiệp', 'scene_cong_khu_cong_nghiep', '2021-10-19 00:55:44', '2021-12-01 00:16:30'),
	(10, 'Hành lang ra khu nhà ở nhân viên', 'scene_hanh_lang_ra_khu_nha_nhan_vien', '2021-10-19 00:55:51', '2021-12-01 23:40:38'),
	(11, 'Khu làm việc chung cho chuyên gia', 'scene_nha_chuyen_gia_ben_ngoai_hanh_lang', '2021-10-19 00:56:02', '2021-12-01 00:20:35'),
	(12, 'Nhà ở chuyên gia', 'scene_nha_chuyen_gia_ben_trong', '2021-10-19 00:56:12', '2021-12-01 00:20:07'),
	(13, 'Khu làm việc chung', 'scene_phong_lam_viec_chuyen_gia', '2021-10-19 00:56:23', '2021-12-01 00:23:56'),
	(14, 'Văn phòng điều hành', 'scene_tang_1_sanh', '2021-10-19 00:56:37', '2021-12-01 00:21:08'),
	(15, 'Khu vực sảnh tầng 1', 'scene_tang_1_phong_cho', '2021-10-19 00:56:45', '2021-12-01 00:19:27'),
	(16, 'Phòng làm việc 2', 'scene_tang_1_phong_ke_toan', '2021-10-19 00:56:54', '2021-12-01 00:34:05'),
	(17, 'Phòng làm việc 1', 'scene_tang_1_phong_lam_viec', '2021-10-19 00:57:02', '2021-12-01 00:34:24'),
	(18, 'Tầng 2 Văn phòng điều hành', 'scene_tang_2_sanh', '2021-10-19 00:57:08', '2021-12-01 00:19:02'),
	(19, 'Phòng họp chung', 'scene_tang_2_phong_hop', '2021-10-19 00:57:14', '2021-12-01 00:18:29');

-- Dumping structure for table aurora.scene_languages
CREATE TABLE IF NOT EXISTS `scene_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scene_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `lang` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.scene_languages: ~71 rows (approximately)
DELETE FROM `scene_languages`;
INSERT INTO `scene_languages` (`id`, `scene_id`, `name`, `content`, `lang`, `photo`, `created_at`, `updated_at`) VALUES
	(9, 3, 'Tổng quan KCN Dệt may Rạng Đông', '<p style="text-align:start"><span style="color:#ffffff"><span style="font-family:&quot;Times New Roman&quot;; font-size:10pt">Ch&agrave;o mừng Qu&yacute; kh&aacute;ch đến với Khu c&ocirc;ng nghiệp Dệt may Rạng Đ&ocirc;ng &ndash; Aurora</span><span style="font-family:&quot;Times New Roman&quot;; font-size:10pt"> IP</span><span style="font-family:&quot;Times New Roman&quot;; font-size:10pt">, một dự &aacute;n của Tập đo&agrave;n Địa ốc C&aacute;t Tường. Được khởi c&ocirc;ng x&acirc;y dựng v&agrave;o ng&agrave;y 18/04/2017 với tổng diện t&iacute;ch 519,6 ha, Aurora IP định hướng trở th&agrave;nh Khu c&ocirc;ng nghiệp Dệt may Xanh &ndash; Sạch &ndash; Bền vững với mục ti&ecirc;u sản xuất 1 tỉ m&eacute;t vải</span><span style="font-family:&quot;Times New Roman&quot;; font-size:10pt"> mỗi năm cho chuỗi cung ứng dệt may trong nước</span><span style="font-family:&quot;Times New Roman&quot;; font-size:10pt">, g&oacute;p phần đưa Nam Định trở th&agrave;nh trung t&acirc;m dệt may lớn của miền Bắc.</span></span></p>\r\n\r\n<p style="text-align:start"><span style="color:#ffffff"><span style="font-size:medium"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">Aurora IP l&agrave; một trong số &iacute;t c&aacute;c khu c&ocirc;ng nghiệp hiện hữu tại Việt Nam được cấp ph&eacute;p tiếp nhận ng&agrave;nh dệt nhuộm v&agrave; được đầu tư x&acirc;y dựng hạ tầng kỹ thuật đồng bộ, đ&aacute;p ứng những y&ecirc;u cầu khắt khe của kh&acirc;u dệt nhuộm với:</span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- 320 ha</span><span style="font-size:10pt"> đất c&ocirc;ng nghiệp cho thu&ecirc;</span></span></span></li>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- Hệ thống nước cấp với c&ocirc;ng suất 170.000 m<sup>3</sup>/ng&agrave;y-đ&ecirc;m</span></span></span></li>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- Hệ thống xử l&yacute; nước thải với c&ocirc;ng suất 110.000 m3/ng&agrave;y-đ&ecirc;m</span></span></span></li>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- Hệ thống điện &aacute;p v&agrave; viễn th&ocirc;ng cung cấp đến ch&acirc;n h&agrave;ng r&agrave;o nh&agrave; m&aacute;y</span></span></span></li>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- Cơ chế ưu đ&atilde;i đối với nh&agrave; đầu tư theo điều kiện chung v&agrave; điều kiện ưu ti&ecirc;n</span></span></span></li>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- Dịch vụ một cửa đ&aacute;p ứng theo nhu cầu của nh&agrave; đầu tư.</span></span></span></li>\r\n</ul>', 'vi', NULL, '2021-10-19 00:55:01', '2021-12-29 00:34:23'),
	(10, 3, 'Overview Aurora IP', '<p style="text-align:start"><span style="color:#ffffff"><span style="font-size:medium"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">Welcome to Rang Dong Textile Industrial Park &ndash; Aurora IP</span><span style="font-size:10pt">, a project of Cat Tuong Real Estate Group. Commenced on 18 April, 2017, in the area of 519,6 ha of land, Aurora IP is oriented as the Green, Clean and Sustainable textile park, which has been</span><span style="font-size:10pt"> targeted to </span><span style="font-size:10pt">provide one billion meters of fabric annually for Vietnam textile supply chain</span><span style="font-size:10pt">, contributing to promote Nam Dinh </span><span style="font-size:10pt">as the textile hub in the northern part of Vietnam.</span></span></span></span></p>\r\n\r\n<p style="text-align:justify"><span style="color:#ffffff"><span style="font-size:medium"><span style="font-family:Calibri"><span style="font-size:10pt"><span style="font-family:&quot;Times New Roman&quot;">Aurora</span></span> <span style="font-size:10pt"><span style="font-family:&quot;Times New Roman&quot;">IP is one of a very few IZ/IPs in Vietnam with&nbsp;eligible legality and prepared with synchronous infrastructure to serve the demanding requirements of dyeing and weaving sector, including:</span></span></span></span></span></p>\r\n\r\n<ul>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- 320 hectares of industrial land&nbsp;for lease</span></span></span></li>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- Water supply capacity of 170,000 m3&nbsp;per day-night</span></span></span></li>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- Wastewater treatment capacity of 110,000 m3 per day-night</span></span></span></li>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- Electricity and telecommunication supplied to the fence</span></span></span></li>\r\n	<li style="text-align:justify"><span style="font-size:12pt"><span style="font-family:&quot;Times New Roman&quot;"><span style="font-size:10pt">- Favoured incentives&nbsp;for regular and preferential investment</span></span></span></li>\r\n</ul>\r\n\r\n<p><span style="font-size:10pt"><span style="color:#000000"><span style="font-family:Calibri">One-stop customer service&nbsp;dedicated to all tenants&rsquo; requests</span></span></span><span style="font-size:10pt"><span style="color:#000000"><span style="font-family:Calibri">.</span></span></span></p>', 'en', NULL, '2021-10-19 00:55:01', '2021-12-29 00:34:23'),
	(11, 3, 'Tổng quan KCN Dệt may Rạng Đông', NULL, 'un', NULL, '2021-10-19 00:55:01', '2021-12-29 00:34:23'),
	(12, 3, 'Tổng quan KCN Dệt may Rạng Đông', NULL, 'ca', NULL, '2021-10-19 00:55:01', '2021-12-29 00:34:23'),
	(13, 4, 'Khu vực đất công nghiệp', NULL, 'vi', NULL, '2021-10-19 00:55:09', '2021-12-29 00:34:12'),
	(14, 4, 'Industrial land area', NULL, 'en', NULL, '2021-10-19 00:55:09', '2021-12-29 00:34:12'),
	(15, 4, 'Khu vực đất công nghiệp', NULL, 'un', NULL, '2021-10-19 00:55:09', '2021-12-29 00:34:12'),
	(16, 4, 'Khu vực đất công nghiệp', NULL, 'ca', NULL, '2021-10-19 00:55:09', '2021-12-29 00:34:12'),
	(17, 5, 'KCN Dệt may Rạng Đông - view 3', NULL, 'vi', NULL, '2021-10-19 00:55:17', '2021-12-29 00:34:00'),
	(18, 5, 'Aurora IP - view3', NULL, 'en', NULL, '2021-10-19 00:55:17', '2021-12-29 00:34:00'),
	(19, 5, 'KCN Dệt may Rạng Đông - view 3', NULL, 'un', NULL, '2021-10-19 00:55:17', '2021-12-29 00:34:00'),
	(20, 5, 'KCN Dệt may Rạng Đông - view 3', NULL, 'ca', NULL, '2021-10-19 00:55:17', '2021-12-29 00:34:00'),
	(21, 6, 'Nhà máy xử lý nước thải', NULL, 'vi', NULL, '2021-10-19 00:55:24', '2021-12-29 00:33:50'),
	(22, 6, 'Wastewater treatment plan', NULL, 'en', NULL, '2021-10-19 00:55:24', '2021-12-29 00:33:50'),
	(23, 6, 'Nhà máy xử lý nước thải', NULL, 'un', NULL, '2021-10-19 00:55:24', '2021-12-29 00:33:50'),
	(24, 6, 'Nhà máy xử lý nước thải', NULL, 'ca', NULL, '2021-10-19 00:55:24', '2021-12-29 00:33:50'),
	(25, 7, 'Khu vực kho tàng, bến bãi', NULL, 'vi', NULL, '2021-10-19 00:55:31', '2021-12-29 00:33:37'),
	(26, 7, 'Warehouse and yard area', NULL, 'en', NULL, '2021-10-19 00:55:31', '2021-12-29 00:33:37'),
	(27, 7, 'Khu vực kho tàng, bến bãi', NULL, 'un', NULL, '2021-10-19 00:55:31', '2021-12-29 00:33:37'),
	(28, 7, 'Khu vực kho tàng, bến bãi', NULL, 'ca', NULL, '2021-10-19 00:55:31', '2021-12-29 00:33:37'),
	(29, 8, 'Khu vực hành chính , dịch vụ', NULL, 'vi', NULL, '2021-10-19 00:55:38', '2021-12-29 00:33:10'),
	(30, 8, 'Administrative and service areas', NULL, 'en', NULL, '2021-10-19 00:55:38', '2021-12-29 00:33:10'),
	(31, 8, 'Khu vực hành chính , dịch vụ', NULL, 'un', NULL, '2021-10-19 00:55:38', '2021-12-29 00:33:10'),
	(32, 8, 'Khu vực hành chính , dịch vụ', NULL, 'ca', NULL, '2021-10-19 00:55:38', '2021-12-29 00:33:10'),
	(33, 9, 'Cổng chào Khu công nghiệp', NULL, 'vi', NULL, '2021-10-19 00:55:44', '2021-12-01 00:16:30'),
	(34, 9, 'Aurora IP gate', NULL, 'en', NULL, '2021-10-19 00:55:44', '2021-12-01 00:16:30'),
	(35, 9, 'Cổng chào Khu công nghiệp', NULL, 'un', NULL, '2021-10-19 00:55:44', '2021-12-01 00:16:30'),
	(36, 9, 'Cổng chào Khu công nghiệp', NULL, 'ca', NULL, '2021-10-19 00:55:44', '2021-12-01 00:16:30'),
	(37, 10, 'Hành lang ra khu nhà ở nhân viên', NULL, 'vi', NULL, '2021-10-19 00:55:51', '2021-12-01 23:40:38'),
	(38, 10, 'Corridor to the staff quarters', NULL, 'en', NULL, '2021-10-19 00:55:51', '2021-12-01 23:40:38'),
	(39, 10, 'Hành lang ra khu nhà ở nhân viên', NULL, 'un', NULL, '2021-10-19 00:55:51', '2021-12-01 23:40:38'),
	(40, 10, 'Hành lang ra khu nhà ở nhân viên', NULL, 'ca', NULL, '2021-10-19 00:55:51', '2021-12-01 23:40:38'),
	(41, 11, 'Khu làm việc chung cho chuyên gia', NULL, 'vi', NULL, '2021-10-19 00:56:03', '2021-12-01 00:20:35'),
	(42, 11, 'Co-working area for experts', NULL, 'en', NULL, '2021-10-19 00:56:03', '2021-12-01 00:20:35'),
	(43, 11, 'Khu làm việc chung cho chuyên gia', NULL, 'un', NULL, '2021-10-19 00:56:03', '2021-12-01 00:20:35'),
	(44, 11, 'Khu làm việc chung cho chuyên gia', NULL, 'ca', NULL, '2021-10-19 00:56:03', '2021-12-01 00:20:35'),
	(45, 12, 'Nhà ở chuyên gia', NULL, 'vi', NULL, '2021-10-19 00:56:12', '2021-12-01 00:20:07'),
	(46, 12, 'Houses for experts', NULL, 'en', NULL, '2021-10-19 00:56:12', '2021-12-24 19:41:15'),
	(47, 12, 'Nhà ở chuyên gia', NULL, 'un', NULL, '2021-10-19 00:56:12', '2021-12-01 00:20:07'),
	(48, 12, 'Nhà ở chuyên gia', NULL, 'ca', NULL, '2021-10-19 00:56:12', '2021-12-01 00:20:07'),
	(49, 13, 'Khu làm việc chung', NULL, 'vi', NULL, '2021-10-19 00:56:23', '2021-12-01 00:23:56'),
	(50, 13, 'Co-working area', NULL, 'en', NULL, '2021-10-19 00:56:23', '2021-12-01 00:23:56'),
	(51, 13, 'Khu làm việc chung', NULL, 'un', NULL, '2021-10-19 00:56:23', '2021-12-01 00:23:56'),
	(52, 13, 'Khu làm việc chung', NULL, 'ca', NULL, '2021-10-19 00:56:23', '2021-12-01 00:23:56'),
	(53, 14, 'Văn phòng điều hành', NULL, 'vi', NULL, '2021-10-19 00:56:37', '2021-12-01 00:21:08'),
	(54, 14, 'Administration Office', NULL, 'en', NULL, '2021-10-19 00:56:37', '2021-12-24 19:40:55'),
	(55, 14, 'Văn phòng điều hành', NULL, 'un', NULL, '2021-10-19 00:56:37', '2021-12-01 00:21:08'),
	(56, 14, 'Văn phòng điều hành', NULL, 'ca', NULL, '2021-10-19 00:56:37', '2021-12-01 00:21:08'),
	(57, 15, 'Khu vực sảnh tầng 1', NULL, 'vi', NULL, '2021-10-19 00:56:45', '2021-12-01 00:19:27'),
	(58, 15, '1st floor lobby area', NULL, 'en', NULL, '2021-10-19 00:56:45', '2021-12-01 00:19:27'),
	(59, 15, 'Khu vực sảnh tầng 1', NULL, 'un', NULL, '2021-10-19 00:56:45', '2021-12-01 00:19:27'),
	(60, 15, 'Khu vực sảnh tầng 1', NULL, 'ca', NULL, '2021-10-19 00:56:45', '2021-12-01 00:19:27'),
	(61, 16, 'Phòng làm việc 2', NULL, 'vi', NULL, '2021-10-19 00:56:54', '2021-12-01 00:34:05'),
	(62, 16, 'Office 2', NULL, 'en', NULL, '2021-10-19 00:56:54', '2021-12-01 00:34:05'),
	(63, 16, 'Phòng làm việc 2', NULL, 'un', NULL, '2021-10-19 00:56:54', '2021-12-01 00:34:05'),
	(64, 16, 'Phòng làm việc 2', NULL, 'ca', NULL, '2021-10-19 00:56:54', '2021-12-01 00:34:05'),
	(65, 17, 'Phòng làm việc 1', NULL, 'vi', NULL, '2021-10-19 00:57:02', '2021-12-01 00:34:24'),
	(66, 17, 'Office 1', NULL, 'en', NULL, '2021-10-19 00:57:02', '2021-12-01 00:34:24'),
	(67, 17, 'Phòng làm việc 1', NULL, 'un', NULL, '2021-10-19 00:57:02', '2021-12-01 00:34:24'),
	(68, 17, 'Phòng làm việc 1', NULL, 'ca', NULL, '2021-10-19 00:57:02', '2021-12-01 00:34:24'),
	(69, 18, 'Tầng 2 Văn phòng điều hành', NULL, 'vi', NULL, '2021-10-19 00:57:08', '2021-12-01 00:19:02'),
	(70, 18, '2nd floor Administration office', NULL, 'en', NULL, '2021-10-19 00:57:08', '2021-12-24 19:42:20'),
	(71, 18, 'Tầng 2 Văn phòng điều hành', NULL, 'un', NULL, '2021-10-19 00:57:08', '2021-12-01 00:19:02'),
	(72, 18, 'Tầng 2 Văn phòng điều hành', NULL, 'ca', NULL, '2021-10-19 00:57:08', '2021-12-01 00:19:02'),
	(73, 19, 'Phòng họp chung', NULL, 'vi', NULL, '2021-10-19 00:57:15', '2021-12-01 00:18:29'),
	(74, 19, 'Meeting room', NULL, 'en', NULL, '2021-10-19 00:57:15', '2021-12-24 19:42:40'),
	(75, 19, 'Phòng họp chung', NULL, 'un', NULL, '2021-10-19 00:57:15', '2021-12-01 00:18:29'),
	(76, 19, 'Phòng họp chung', NULL, 'ca', NULL, '2021-10-19 00:57:15', '2021-12-01 00:18:29'),
	(77, 20, 'Trạm cấp nước', NULL, 'vi', NULL, '2021-10-19 00:57:21', '2021-12-01 00:27:53'),
	(78, 20, 'Water supply station', NULL, 'en', NULL, '2021-10-19 00:57:21', '2021-12-01 00:27:53');

-- Dumping structure for table aurora.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_setting` varchar(50) NOT NULL,
  `value` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code_setting`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.settings: ~7 rows (approximately)
DELETE FROM `settings`;
INSERT INTO `settings` (`id`, `code_setting`, `value`, `created_at`, `updated_at`) VALUES
	(1, 'to_email', 'ntrong0603.dgt@gmail.com', '2020-08-02 14:00:09', '2021-10-19 09:59:01'),
	(2, 'company_name', 'Aurora IP', '2020-08-02 08:59:54', '2021-10-19 18:59:51'),
	(3, 'title', 'Khu công nghiệp dệt may Rạng Đông', '2020-08-02 08:59:54', '2021-12-27 00:15:31'),
	(4, 'keywork', 'Khu công nghiệp Aurora', '2020-08-02 08:59:54', '2021-10-17 02:59:43'),
	(5, 'description', 'Khu công nghiệp Aurora', '2020-08-02 08:59:54', '2021-10-17 02:59:43'),
	(6, 'logo', 'setting-image-1634699055.png', '2020-08-02 09:00:33', '2021-10-19 20:04:15'),
	(7, 'hotline', 'Khu công nghiệp Aurora', '2020-09-15 07:21:12', '2021-10-19 07:47:55');

-- Dumping structure for table aurora.texts
CREATE TABLE IF NOT EXISTS `texts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.texts: ~30 rows (approximately)
DELETE FROM `texts`;
INSERT INTO `texts` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
	(1, 'Họ tên', 'ht', '2021-10-19 06:25:10', '2021-10-19 06:25:10'),
	(2, 'Điện thoại', 'sdt', '2021-10-19 06:25:29', '2021-10-19 06:25:29'),
	(3, 'Email', 'e', '2021-10-19 06:25:44', '2021-10-19 06:25:44'),
	(4, 'Ngành nghề kinh doanh', 'nnkd', '2021-10-19 06:28:20', '2021-10-19 06:28:20'),
	(5, 'Tên doanh nghiệp', 'tdn', '2021-10-19 06:28:36', '2021-10-19 06:28:36'),
	(6, 'Doanh nghiệp thuộc quốc gia', 'dntqg', '2021-10-19 06:29:01', '2021-10-19 06:29:01'),
	(7, 'Mục đích tham quan', 'mdtq', '2021-10-19 06:29:16', '2021-10-19 06:29:16'),
	(8, 'Số người tham quan', 'sntq', '2021-10-19 06:29:34', '2021-10-19 06:29:34'),
	(9, 'Nội dung', 'nd', '2021-10-19 06:29:48', '2021-10-19 06:29:48'),
	(10, 'Khác', 'k', '2021-10-19 06:30:02', '2021-10-19 06:30:02'),
	(11, 'Thời gian đăng ký tham quan', 'tgdktq', '2021-10-19 06:30:21', '2021-10-19 06:30:21'),
	(12, 'Từ', 't', '2021-10-19 06:30:31', '2021-10-19 06:30:31'),
	(13, 'Đến', 'd', '2021-10-19 06:30:38', '2021-10-19 06:30:38'),
	(14, 'Diện tích', 'dt', '2021-10-19 06:30:50', '2021-10-19 06:30:50'),
	(15, 'Loại danh nghiệp', 'ldn', '2021-10-19 06:31:49', '2021-12-27 00:22:51'),
	(16, 'Gửi', 'g', '2021-10-19 06:32:17', '2021-10-19 06:32:17'),
	(17, 'Làm lại', 'll', '2021-10-19 06:32:26', '2021-12-27 00:22:35'),
	(18, 'Đăng ký', 'dk', '2021-10-19 06:32:35', '2021-10-19 06:32:35'),
	(19, 'Liên hệ', 'lh', '2021-10-19 06:32:47', '2021-10-19 06:32:47'),
	(20, 'Đăng ký tham quan', 'dktq', '2021-10-19 06:33:00', '2021-10-19 06:33:00'),
	(21, 'Chọn', 'c', '2021-10-19 06:33:18', '2021-10-19 06:33:18'),
	(22, 'Ghi chú', 'gc', '2021-10-19 06:36:27', '2021-10-19 06:36:27'),
	(23, 'Chọn ngày', 'cn', NULL, NULL),
	(25, 'Vui lòng điền thông tin', 'vldtt', '2021-10-19 09:29:01', '2021-10-19 09:29:01'),
	(26, 'Địa chỉ email không hợp lệ', 'dcemkhl', '2021-10-19 09:30:27', '2021-10-19 09:30:27'),
	(27, 'Số điện thoại không hợp lệ', 'sdtkhl', '2021-10-19 09:30:55', '2021-10-19 09:30:55'),
	(28, 'Nhu cầu', 'nc', '2021-10-19 10:53:07', '2021-10-19 10:53:07'),
	(29, 'Đăng ký đặt giữ chỗ', 'dkdgc', '2021-12-15 00:00:30', '2021-12-15 00:00:30'),
	(30, 'Mục đích sử dụng', 'mdsd', '2021-12-15 01:21:18', '2021-12-15 01:21:18'),
	(31, 'Sản phẩm quan tâm', 'spqt', '2021-12-15 01:22:23', '2021-12-15 01:22:23'),
	(32, 'Phối cảnh 3D minh họa', 'pc3dmh', '2021-12-29 07:31:47', '2021-12-29 07:31:48');

-- Dumping structure for table aurora.text_languages
CREATE TABLE IF NOT EXISTS `text_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.text_languages: ~104 rows (approximately)
DELETE FROM `text_languages`;
INSERT INTO `text_languages` (`id`, `text_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
	(8, 1, 'Họ tên', 'vi', '2021-10-19 06:25:10', '2021-10-19 06:25:10'),
	(9, 1, 'Name', 'en', '2021-10-19 06:25:10', '2021-12-27 00:24:57'),
	(10, 1, 'Họ tên', 'un', '2021-10-19 06:25:10', '2021-10-19 06:25:10'),
	(11, 1, 'Họ tên', 'ca', '2021-10-19 06:25:10', '2021-10-19 06:25:10'),
	(12, 2, 'Điện thoại', 'vi', '2021-10-19 06:25:29', '2021-10-19 06:25:29'),
	(13, 2, 'Telephone', 'en', '2021-10-19 06:25:29', '2021-12-27 00:25:10'),
	(14, 2, 'Điện thoại', 'un', '2021-10-19 06:25:29', '2021-10-19 06:25:29'),
	(15, 2, 'Điện thoại', 'ca', '2021-10-19 06:25:30', '2021-10-19 06:25:30'),
	(16, 3, 'Email', 'vi', '2021-10-19 06:25:44', '2021-10-19 06:25:44'),
	(17, 3, 'Email', 'en', '2021-10-19 06:25:45', '2021-10-19 06:25:45'),
	(18, 3, 'Email', 'un', '2021-10-19 06:25:45', '2021-10-19 06:25:45'),
	(19, 3, 'Email', 'ca', '2021-10-19 06:25:45', '2021-10-19 06:25:45'),
	(20, 4, 'Ngành nghề kinh doanh', 'vi', '2021-10-19 06:28:20', '2021-10-19 06:28:20'),
	(21, 4, 'Business', 'en', '2021-10-19 06:28:20', '2021-12-27 00:24:47'),
	(22, 4, 'Ngành nghề kinh doanh', 'un', '2021-10-19 06:28:20', '2021-10-19 06:28:20'),
	(23, 4, 'Ngành nghề kinh doanh', 'ca', '2021-10-19 06:28:20', '2021-10-19 06:28:20'),
	(24, 5, 'Tên doanh nghiệp', 'vi', '2021-10-19 06:28:36', '2021-10-19 06:28:36'),
	(25, 5, 'Company\'s name', 'en', '2021-10-19 06:28:36', '2021-12-27 00:24:28'),
	(26, 5, 'Tên doanh nghiệp', 'un', '2021-10-19 06:28:36', '2021-10-19 06:28:36'),
	(27, 5, 'Tên doanh nghiệp', 'ca', '2021-10-19 06:28:36', '2021-10-19 06:28:36'),
	(28, 6, 'Doanh nghiệp thuộc quốc gia', 'vi', '2021-10-19 06:29:01', '2021-10-19 06:29:01'),
	(29, 6, 'National enterprise', 'en', '2021-10-19 06:29:01', '2021-12-27 00:24:19'),
	(30, 6, 'Doanh nghiệp thuộc quốc gia', 'un', '2021-10-19 06:29:01', '2021-10-19 06:29:01'),
	(31, 6, 'Doanh nghiệp thuộc quốc gia', 'ca', '2021-10-19 06:29:01', '2021-10-19 06:29:01'),
	(32, 7, 'Mục đích tham quan', 'vi', '2021-10-19 06:29:16', '2021-10-19 06:29:16'),
	(33, 7, 'Purpose of visit', 'en', '2021-10-19 06:29:16', '2021-12-27 00:24:06'),
	(34, 7, 'Mục đích tham quan', 'un', '2021-10-19 06:29:16', '2021-10-19 06:29:16'),
	(35, 7, 'Mục đích tham quan', 'ca', '2021-10-19 06:29:16', '2021-10-19 06:29:16'),
	(36, 8, 'Số người tham quan', 'vi', '2021-10-19 06:29:34', '2021-10-19 06:29:34'),
	(37, 8, 'Visitors', 'en', '2021-10-19 06:29:34', '2021-12-27 00:23:55'),
	(38, 8, 'Số người tham quan', 'un', '2021-10-19 06:29:34', '2021-10-19 06:29:34'),
	(39, 8, 'Số người tham quan', 'ca', '2021-10-19 06:29:34', '2021-10-19 06:29:34'),
	(40, 9, 'Nội dung', 'vi', '2021-10-19 06:29:48', '2021-10-19 06:29:48'),
	(41, 9, 'Content', 'en', '2021-10-19 06:29:48', '2021-12-27 00:23:43'),
	(42, 9, 'Nội dung', 'un', '2021-10-19 06:29:48', '2021-10-19 06:29:48'),
	(43, 9, 'Nội dung', 'ca', '2021-10-19 06:29:48', '2021-10-19 06:29:48'),
	(44, 10, 'Khác', 'vi', '2021-10-19 06:30:02', '2021-10-19 06:30:02'),
	(45, 10, 'Another', 'en', '2021-10-19 06:30:02', '2021-12-27 00:23:33'),
	(46, 10, 'Khác', 'un', '2021-10-19 06:30:02', '2021-10-19 06:30:02'),
	(47, 10, 'Khác', 'ca', '2021-10-19 06:30:02', '2021-10-19 06:30:02'),
	(48, 11, 'Thời gian đăng ký tham quan', 'vi', '2021-10-19 06:30:21', '2021-10-19 06:30:21'),
	(49, 11, 'Time to register to visit', 'en', '2021-10-19 06:30:21', '2021-12-27 00:23:24'),
	(50, 11, 'Thời gian đăng ký tham quan', 'un', '2021-10-19 06:30:21', '2021-10-19 06:30:21'),
	(51, 11, 'Thời gian đăng ký tham quan', 'ca', '2021-10-19 06:30:21', '2021-10-19 06:30:21'),
	(52, 12, 'Từ', 'vi', '2021-10-19 06:30:31', '2021-10-19 06:30:31'),
	(53, 12, 'From', 'en', '2021-10-19 06:30:31', '2021-12-27 00:23:15'),
	(54, 12, 'Từ', 'un', '2021-10-19 06:30:31', '2021-10-19 06:30:31'),
	(55, 12, 'Từ', 'ca', '2021-10-19 06:30:31', '2021-10-19 06:30:31'),
	(56, 13, 'Đến', 'vi', '2021-10-19 06:30:38', '2021-10-19 06:30:38'),
	(57, 13, 'To', 'en', '2021-10-19 06:30:38', '2021-12-27 00:23:06'),
	(58, 13, 'Đến', 'un', '2021-10-19 06:30:38', '2021-10-19 06:30:38'),
	(59, 13, 'Đến', 'ca', '2021-10-19 06:30:38', '2021-10-19 06:30:38'),
	(60, 14, 'Diện tích', 'vi', '2021-10-19 06:30:50', '2021-10-19 06:30:50'),
	(61, 14, 'Area', 'en', '2021-10-19 06:30:50', '2021-12-27 00:22:58'),
	(62, 14, 'Diện tích', 'un', '2021-10-19 06:30:50', '2021-10-19 06:30:50'),
	(63, 14, 'Diện tích', 'ca', '2021-10-19 06:30:50', '2021-10-19 06:30:50'),
	(64, 15, 'Loại danh nghiệp', 'vi', '2021-10-19 06:31:50', '2021-10-19 06:31:50'),
	(65, 15, 'Type of business', 'en', '2021-10-19 06:31:50', '2021-12-27 00:22:51'),
	(66, 15, 'Loại danh nghiệp', 'un', '2021-10-19 06:31:50', '2021-10-19 06:31:50'),
	(67, 15, 'Loại danh nghiệp', 'ca', '2021-10-19 06:31:50', '2021-10-19 06:31:50'),
	(68, 16, 'Gửi', 'vi', '2021-10-19 06:32:17', '2021-10-19 06:32:17'),
	(69, 16, 'Send', 'en', '2021-10-19 06:32:17', '2021-12-27 00:22:43'),
	(70, 16, 'Gửi', 'un', '2021-10-19 06:32:17', '2021-10-19 06:32:17'),
	(71, 16, 'Gửi', 'ca', '2021-10-19 06:32:17', '2021-10-19 06:32:17'),
	(72, 17, 'Làm lại', 'vi', '2021-10-19 06:32:26', '2021-12-27 00:22:35'),
	(73, 17, 'Undo', 'en', '2021-10-19 06:32:26', '2021-12-27 00:22:35'),
	(74, 17, 'Làm lại', 'un', '2021-10-19 06:32:26', '2021-12-27 00:22:35'),
	(75, 17, 'Làm lại', 'ca', '2021-10-19 06:32:26', '2021-12-27 00:22:35'),
	(76, 18, 'Đăng ký', 'vi', '2021-10-19 06:32:36', '2021-10-19 06:32:36'),
	(77, 18, 'Registration', 'en', '2021-10-19 06:32:36', '2021-12-27 00:22:13'),
	(78, 18, 'Đăng ký', 'un', '2021-10-19 06:32:36', '2021-10-19 06:32:36'),
	(79, 18, 'Đăng ký', 'ca', '2021-10-19 06:32:36', '2021-10-19 06:32:36'),
	(80, 19, 'Liên hệ', 'vi', '2021-10-19 06:32:47', '2021-10-19 06:32:47'),
	(81, 19, 'Contact', 'en', '2021-10-19 06:32:47', '2021-10-19 06:32:47'),
	(82, 19, 'Liên hệ', 'un', '2021-10-19 06:32:47', '2021-10-19 06:32:47'),
	(83, 19, 'Liên hệ', 'ca', '2021-10-19 06:32:47', '2021-10-19 06:32:47'),
	(84, 20, 'Đăng ký tham quan', 'vi', '2021-10-19 06:33:01', '2021-10-19 06:33:01'),
	(85, 20, 'Register to visit', 'en', '2021-10-19 06:33:01', '2021-12-27 00:19:30'),
	(86, 20, 'Đăng ký tham quan', 'un', '2021-10-19 06:33:01', '2021-10-19 06:33:01'),
	(87, 20, 'Đăng ký tham quan', 'ca', '2021-10-19 06:33:01', '2021-10-19 06:33:01'),
	(88, 21, 'Chọn', 'vi', '2021-10-19 06:33:19', '2021-10-19 06:33:19'),
	(89, 21, 'Choose', 'en', '2021-10-19 06:33:19', '2021-12-27 00:21:36'),
	(90, 21, 'Chọn', 'un', '2021-10-19 06:33:19', '2021-10-19 06:33:19'),
	(91, 21, 'Chọn', 'ca', '2021-10-19 06:33:19', '2021-10-19 06:33:19'),
	(92, 22, 'Ghi chú', 'vi', '2021-10-19 06:36:27', '2021-10-19 06:36:27'),
	(93, 22, 'Note', 'en', '2021-10-19 06:36:27', '2021-12-27 00:21:28'),
	(94, 22, 'Ghi chú', 'un', '2021-10-19 06:36:27', '2021-10-19 06:36:27'),
	(95, 22, 'Ghi chú', 'ca', '2021-10-19 06:36:27', '2021-10-19 06:36:27'),
	(96, 23, 'Chọn ngày', 'vi', '2021-10-19 09:22:28', '2021-10-19 09:22:28'),
	(97, 23, 'Choose a date', 'en', '2021-10-19 09:22:28', '2021-12-27 00:21:19'),
	(100, 25, 'Vui lòng điền thông tin', 'vi', '2021-10-19 09:29:01', '2021-10-19 09:29:01'),
	(101, 25, 'Please fill in the information', 'en', '2021-10-19 09:29:01', '2021-12-27 00:21:10'),
	(102, 26, 'Địa chỉ email không hợp lệ', 'vi', '2021-10-19 09:30:27', '2021-10-19 09:30:27'),
	(103, 26, 'Email address is not valid', 'en', '2021-10-19 09:30:27', '2021-12-27 00:20:54'),
	(104, 27, 'Số điện thoại không hợp lệ', 'vi', '2021-10-19 09:30:55', '2021-10-19 09:30:55'),
	(105, 27, 'invalid phone number', 'en', '2021-10-19 09:30:55', '2021-12-27 00:20:37'),
	(106, 28, 'Nhu cầu', 'vi', '2021-10-19 10:53:07', '2021-10-19 10:53:07'),
	(107, 28, 'Demand', 'en', '2021-10-19 10:53:07', '2021-12-27 00:20:24'),
	(108, 29, 'Đăng ký đặt giữ chỗ', 'vi', '2021-12-15 00:00:30', '2021-12-15 00:00:30'),
	(109, 29, 'Register for a reservation', 'en', '2021-12-15 00:00:30', '2021-12-27 00:19:16'),
	(110, 30, 'Mục đích sử dụng', 'vi', '2021-12-15 01:21:18', '2021-12-15 01:21:18'),
	(111, 30, 'Uses', 'en', '2021-12-15 01:21:18', '2021-12-27 00:19:03'),
	(112, 31, 'Sản phẩm quan tâm', 'vi', '2021-12-15 01:22:24', '2021-12-15 01:22:24'),
	(113, 31, 'Products of interest', 'en', '2021-12-15 01:22:24', '2021-12-27 00:18:37'),
	(114, 32, 'Phối cảnh 3D minh họa', 'vi', '2021-12-29 00:32:18', '2021-12-29 00:32:18'),
	(115, 32, 'illustrated 3D perspective', 'en', '2021-12-29 00:32:18', '2021-12-29 00:32:18');

-- Dumping structure for table aurora.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.users: ~3 rows (approximately)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `username`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$QSWynfJDirid6xo2yXPan.sGThBGRvV4ScFjf4jwuiW4Xb8IoCDNK', NULL, NULL, '2021-10-10 08:27:03', '2021-10-10 08:27:04'),
	(2, 'trongktvn', 'trongktvn', 'trongktvn001@gmail.com', NULL, '$2y$10$GrvkG.CHRZiWptTKfLTzIOpLXwT/eIgozmFPeJmWAYC1PzdMATCsq', NULL, NULL, '2021-10-17 05:42:53', '2021-10-17 05:42:53'),
	(3, 'trongktvn5', 'trongktvn2', 'trongktvn002@gmail.com', NULL, '$2y$10$ASjuym/g5PeMxyrmEvzIKu4FnydurBM6JL3kjQ04ps/d7elYD9UqS', NULL, NULL, '2021-10-17 05:50:14', '2021-10-17 06:01:52');

-- Dumping structure for table aurora.utilities
CREATE TABLE IF NOT EXISTS `utilities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_hotspot` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.utilities: ~16 rows (approximately)
DELETE FROM `utilities`;
INSERT INTO `utilities` (`id`, `name`, `name_hotspot`, `created_at`, `updated_at`) VALUES
	(7, 'Cảng Hải Thịnh', 'utilities1', '2021-10-18 08:49:25', '2021-10-19 19:21:10'),
	(8, 'Cảng Hải Phòng', 'utilities2', '2021-10-18 08:49:36', '2021-10-19 19:22:13'),
	(9, 'Cảng nước sâu Cái Lân', 'utilities3', '2021-10-18 08:49:48', '2021-10-19 19:22:27'),
	(10, 'Trung tâm TP Nam Định', 'utilities4', '2021-10-18 08:49:59', '2021-10-19 19:23:49'),
	(11, 'Trung tâm TP Hà Nội', 'utilities5', '2021-10-18 08:50:27', '2021-10-19 19:24:04'),
	(12, 'Trung tâm TP Ninh Bình', 'utilities6', '2021-10-18 08:50:38', '2021-10-19 19:24:30'),
	(13, 'Trung tâm TP Thái Bình', 'utilities7', '2021-10-18 08:50:53', '2021-10-19 19:24:43'),
	(14, 'Sân bay Nội Bài - Hà Nội', 'utilities8', '2021-10-18 08:51:12', '2021-10-19 19:25:02'),
	(15, 'Sân bay Cát Bi - Hải Phòng', 'utilities9', '2021-10-18 08:51:24', '2021-10-19 19:25:18'),
	(16, 'Quốc lộ 1A', 'utilities10', '2021-10-18 08:51:34', '2021-10-19 19:25:29'),
	(17, 'Cao tốc Bắc Nam', 'utilities11', '2021-10-18 08:51:42', '2021-10-19 19:25:40'),
	(18, 'Cao tốc Ninh Bình - Hải Phòng - Quảng Ninh', 'utilities12', '2021-10-18 08:51:55', '2021-10-19 19:26:00'),
	(19, 'Quốc lộ 10', 'utilities13', '2021-10-18 08:52:03', '2021-10-19 19:26:12'),
	(20, 'Tuyến ven biển', 'utilities14', '2021-10-18 08:52:13', '2021-12-23 19:37:09'),
	(21, 'Tuyến kết nối Khu kinh tế ven biển Nam Định và Cầu Giẽ - Cao tốc Ninh Bình', 'utilities15', '2021-10-18 08:52:22', '2021-12-23 19:37:16'),
	(22, 'Khu nhà ở nhân viên', 'khu_nha_o_nhan_vien', '2021-12-10 20:09:31', '2021-12-10 20:19:43'),
	(23, 'Nhà máy xử lý cấp nước', 'nha_may_xu_ly_cap_nuoc', NULL, NULL);

-- Dumping structure for table aurora.utilities_languages
CREATE TABLE IF NOT EXISTS `utilities_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilities_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(50) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.utilities_languages: ~48 rows (approximately)
DELETE FROM `utilities_languages`;
INSERT INTO `utilities_languages` (`id`, `utilities_id`, `name`, `lang`, `photo`, `content`, `created_at`, `updated_at`) VALUES
	(26, 7, 'Cảng Hải Thịnh', 'vi', 'utilities-image-vi-1638497820.png', NULL, '2021-10-18 08:49:25', '2021-12-02 19:17:00'),
	(27, 7, 'Tiện ích 1', 'en', 'utilities-image-en-1639106500.png', NULL, '2021-10-18 08:49:25', '2021-12-09 20:21:40'),
	(28, 7, 'Cảng Hải Thịnh', 'un', NULL, NULL, '2021-10-18 08:49:25', '2021-10-19 19:21:10'),
	(29, 8, 'Cảng Hải Phòng', 'vi', 'utilities-image-vi-1638497838.png', NULL, '2021-10-18 08:49:36', '2021-12-02 19:17:18'),
	(30, 8, 'Tiện ích 2', 'en', 'utilities-image-en-1638497838.png', NULL, '2021-10-18 08:49:36', '2021-12-02 19:17:18'),
	(31, 8, 'Cảng Hải Phòng', 'un', NULL, NULL, '2021-10-18 08:49:36', '2021-10-19 19:22:13'),
	(32, 9, 'Cảng nước sâu Cái Lân', 'vi', 'utilities-image-vi-1638497967.png', NULL, '2021-10-18 08:49:48', '2021-12-02 19:19:27'),
	(33, 9, 'Tiện ích 3', 'en', 'utilities-image-en-1638497967.png', NULL, '2021-10-18 08:49:48', '2021-12-02 19:19:27'),
	(34, 9, 'Cảng nước sâu Cái Lân', 'un', NULL, NULL, '2021-10-18 08:49:48', '2021-10-19 19:22:27'),
	(35, 10, 'Trung tâm TP Nam Định', 'vi', 'utilities-image-vi-1638498000.png', NULL, '2021-10-18 08:49:59', '2021-12-02 19:20:00'),
	(36, 10, 'Tiện ích 4', 'en', 'utilities-image-en-1638498000.png', NULL, '2021-10-18 08:49:59', '2021-12-02 19:20:00'),
	(37, 10, 'Trung tâm TP Nam Định', 'un', NULL, NULL, '2021-10-18 08:49:59', '2021-10-19 19:23:49'),
	(38, 11, 'Trung tâm TP Hà Nội', 'vi', 'utilities-image-vi-1638498017.png', NULL, '2021-10-18 08:50:27', '2021-12-02 19:20:17'),
	(39, 11, 'Tiện ích 5', 'en', 'utilities-image-en-1638498017.png', NULL, '2021-10-18 08:50:27', '2021-12-02 19:20:17'),
	(40, 11, 'Trung tâm TP Hà Nội', 'un', NULL, NULL, '2021-10-18 08:50:27', '2021-10-19 19:24:04'),
	(41, 12, 'Trung tâm TP Ninh Bình', 'vi', 'utilities-image-vi-1638498039.png', NULL, '2021-10-18 08:50:38', '2021-12-02 19:20:39'),
	(42, 12, 'Tiện ích 6', 'en', 'utilities-image-en-1638498039.png', NULL, '2021-10-18 08:50:38', '2021-12-02 19:20:39'),
	(43, 12, 'Trung tâm TP Ninh Bình', 'un', NULL, NULL, '2021-10-18 08:50:38', '2021-10-19 19:24:30'),
	(44, 13, 'Trung tâm TP Thái Bình', 'vi', 'utilities-image-vi-1638498058.png', NULL, '2021-10-18 08:50:53', '2021-12-02 19:20:58'),
	(45, 13, 'Tiện ích 7', 'en', 'utilities-image-en-1638498058.png', NULL, '2021-10-18 08:50:54', '2021-12-02 19:20:58'),
	(46, 13, 'Trung tâm TP Thái Bình', 'un', NULL, NULL, '2021-10-18 08:50:54', '2021-10-19 19:24:43'),
	(47, 14, 'Sân bay Nội Bài - Hà Nội', 'vi', 'utilities-image-vi-1638498085.png', NULL, '2021-10-18 08:51:12', '2021-12-02 19:21:25'),
	(48, 14, 'Tiện ích 8', 'en', 'utilities-image-en-1638498085.png', NULL, '2021-10-18 08:51:12', '2021-12-02 19:21:25'),
	(49, 14, 'Sân bay Nội Bài - Hà Nội', 'un', NULL, NULL, '2021-10-18 08:51:12', '2021-10-19 19:25:02'),
	(50, 15, 'Sân bay Cát Bi - Hải Phòng', 'vi', 'utilities-image-vi-1638498106.png', NULL, '2021-10-18 08:51:24', '2021-12-02 19:21:46'),
	(51, 15, 'Tiện ích 9', 'en', 'utilities-image-en-1638498106.png', NULL, '2021-10-18 08:51:24', '2021-12-02 19:21:46'),
	(52, 15, 'Sân bay Cát Bi - Hải Phòng', 'un', NULL, NULL, '2021-10-18 08:51:24', '2021-10-19 19:25:18'),
	(53, 16, 'Quốc lộ 1A', 'vi', 'utilities-image-vi-1640315262.png', NULL, '2021-10-18 08:51:34', '2021-12-23 20:07:42'),
	(54, 16, '1A Highway', 'en', 'utilities-image-en-1640315262.png', NULL, '2021-10-18 08:51:34', '2021-12-23 20:07:42'),
	(55, 16, 'Quốc lộ 1A', 'un', NULL, NULL, '2021-10-18 08:51:34', '2021-10-19 19:25:29'),
	(56, 17, 'Cao tốc Bắc Nam', 'vi', 'utilities-image-vi-1640315244.png', NULL, '2021-10-18 08:51:42', '2021-12-23 20:07:24'),
	(57, 17, 'North-South Expressway', 'en', 'utilities-image-en-1640315244.png', NULL, '2021-10-18 08:51:42', '2021-12-23 20:07:24'),
	(58, 17, 'Cao tốc Bắc Nam', 'un', NULL, NULL, '2021-10-18 08:51:42', '2021-10-19 19:25:40'),
	(59, 18, 'Cao tốc Ninh Bình - Hải Phòng - Quảng Ninh', 'vi', 'utilities-image-vi-1640315224.png', NULL, '2021-10-18 08:51:55', '2021-12-23 20:07:04'),
	(60, 18, 'Ninh Binh - Hai Phong - Quang Ninh Expressway', 'en', 'utilities-image-en-1640315224.png', NULL, '2021-10-18 08:51:55', '2021-12-23 20:07:04'),
	(61, 18, 'Cao tốc Ninh Bình - Hải Phòng - Quảng Ninh', 'un', NULL, NULL, '2021-10-18 08:51:56', '2021-10-19 19:26:00'),
	(62, 19, 'Quốc lộ 10', 'vi', 'utilities-image-vi-1640315207.png', NULL, '2021-10-18 08:52:04', '2021-12-23 20:06:47'),
	(63, 19, '10 Highway', 'en', 'utilities-image-en-1640315207.png', NULL, '2021-10-18 08:52:04', '2021-12-23 20:06:47'),
	(64, 19, 'Quốc lộ 10', 'un', NULL, NULL, '2021-10-18 08:52:04', '2021-10-19 19:26:12'),
	(65, 20, 'Tuyến ven biển', 'vi', 'utilities-image-vi-1640313429.png', NULL, '2021-10-18 08:52:13', '2021-12-23 19:37:09'),
	(66, 20, 'Coastal road', 'en', 'utilities-image-en-1640313429.png', NULL, '2021-10-18 08:52:13', '2021-12-23 19:37:09'),
	(67, 20, 'Tuyến ven biển', 'un', NULL, NULL, '2021-10-18 08:52:13', '2021-12-23 19:37:09'),
	(68, 21, 'Tuyến kết nối Khu kinh tế ven biển Nam Định và Cầu Giẽ - Cao tốc Ninh Bình', 'vi', 'utilities-image-vi-1640315189.png', NULL, '2021-10-18 08:52:22', '2021-12-23 20:06:29'),
	(69, 21, 'Route connecting Nam Dinh coastal economic zone and Cau Gie - Ninh Binh Expressway', 'en', 'utilities-image-en-1640315189.png', NULL, '2021-10-18 08:52:22', '2021-12-23 20:06:29'),
	(70, 21, 'Tuyến kết nối Khu kinh tế ven biển Nam Định và Cầu Giẽ - Cao tốc Ninh Bình', 'un', NULL, NULL, '2021-10-18 08:52:22', '2021-12-23 19:37:16'),
	(71, 21, 'Tuyến kết nối Khu kinh tế ven biển Nam Định và Cầu Giẽ - Cao tốc Ninh Bình', 'ca', 'utilities-image-ca-1634609640.jpg', NULL, '2021-10-18 19:14:00', '2021-12-23 19:37:16'),
	(72, 22, 'Khu nhà ở nhân viên 11', 'vi', NULL, '<p>Khu nh&agrave; ở d&agrave;nh cho nh&acirc;n vi&ecirc;n gồm 4 ph&ograve;ng ngủ, 1 ph&ograve;ng giặt v&agrave; 1 nh&agrave; bếp; phục vụ cho c&aacute;n bộ nh&acirc;n vi&ecirc;n lưu tr&uacute; tại KCN.</p>', '2021-12-10 20:09:31', '2021-12-23 01:59:48'),
	(73, 22, 'Employee housing area', 'en', NULL, '<p>Living quarters for staff includes 4 bedrooms, 1 laundry room and 1 kitchen, which are used for staff staying in the IP.</p>', '2021-12-10 20:09:31', '2021-12-23 01:59:48'),
	(74, 23, 'Nhà máy xử lý cấp nước', 'vi', NULL, NULL, '2021-12-29 22:06:48', '2021-12-29 22:06:48'),
	(75, 23, 'Nhà máy xử lý cấp nước', 'en', NULL, NULL, '2021-12-29 22:06:48', '2021-12-29 22:06:48');

-- Dumping structure for table aurora.views
CREATE TABLE IF NOT EXISTS `views` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_agent` text NOT NULL,
  `ip` varchar(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=422 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.views: ~394 rows (approximately)
DELETE FROM `views`;
INSERT INTO `views` (`id`, `user_agent`, `ip`, `created_at`, `updated_at`) VALUES
	(1, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-12-05 03:08:25', '2020-12-05 03:08:25'),
	(2, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-12-04 03:08:25', '2020-12-04 03:08:25'),
	(3, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-12-03 03:08:25', '2020-12-03 03:08:25'),
	(4, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-12-02 03:08:25', '2020-12-02 03:08:25'),
	(5, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-12-01 03:08:25', '2020-12-01 03:08:25'),
	(6, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-11-01 03:08:25', '2020-12-01 03:08:25'),
	(7, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-12-01 03:48:25', '2020-12-01 03:48:25'),
	(8, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-09-01 03:47:25', '2020-12-01 03:48:25'),
	(9, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-12-05 07:18:39', '2020-12-05 07:18:39'),
	(10, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-12-05 11:27:32', '2020-12-05 11:27:32'),
	(11, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '127.0.0.1', '2020-12-04 19:27:32', '2020-12-05 11:27:32'),
	(12, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', '127.0.0.1', '2020-12-22 13:11:40', '2020-12-22 13:11:40'),
	(13, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', '127.0.0.1', '2021-01-27 14:44:20', '2021-01-27 14:44:20'),
	(14, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36', '127.0.0.1', '2021-02-17 04:17:23', '2021-02-17 04:17:23'),
	(15, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', '127.0.0.1', '2021-03-07 01:28:44', '2021-03-07 01:28:44'),
	(16, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '127.0.0.1', '2021-05-07 14:07:01', '2021-05-07 14:07:01'),
	(17, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.93 Safari/537.36', '127.0.0.1', '2021-05-08 08:23:09', '2021-05-08 08:23:09'),
	(18, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36', '127.0.0.1', '2021-06-10 16:15:03', '2021-06-10 16:15:03'),
	(19, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '127.0.0.1', '2021-10-15 01:10:33', '2021-10-15 01:10:33'),
	(20, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '127.0.0.1', '2021-10-17 09:04:50', '2021-10-17 09:04:50'),
	(21, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '42.119.201.244', '2021-10-19 20:03:00', '2021-10-19 20:03:00'),
	(22, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '42.119.201.244', '2021-10-19 20:04:22', '2021-10-19 20:04:22'),
	(23, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.122.87', '2021-10-19 20:04:28', '2021-10-19 20:04:28'),
	(24, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '42.113.160.131', '2021-10-19 20:07:56', '2021-10-19 20:07:56'),
	(25, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '42.113.160.131', '2021-10-19 21:42:28', '2021-10-19 21:42:28'),
	(26, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '42.113.160.131', '2021-10-20 00:04:43', '2021-10-20 00:04:43'),
	(27, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) QtWebEngine/5.15.2 Chrome/83.0.4103.122 Safari/537.36', '42.113.160.131', '2021-10-20 00:04:49', '2021-10-20 00:04:49'),
	(28, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36 Edg/94.0.992.50', '14.169.151.222', '2021-10-20 00:04:54', '2021-10-20 00:04:54'),
	(29, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '14.169.151.222', '2021-10-20 00:05:33', '2021-10-20 00:05:33'),
	(30, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '203.210.208.151', '2021-10-20 01:50:35', '2021-10-20 01:50:35'),
	(31, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-10-20 01:51:03', '2021-10-20 01:51:03'),
	(32, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 412', '203.210.208.151', '2021-10-20 01:51:43', '2021-10-20 01:51:43'),
	(33, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '203.210.208.171', '2021-10-20 01:52:35', '2021-10-20 01:52:35'),
	(34, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '42.113.160.131', '2021-10-20 02:04:07', '2021-10-20 02:04:07'),
	(35, 'Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUriPreview Preview/0.5', '52.114.32.212', '2021-10-20 02:16:15', '2021-10-20 02:16:15'),
	(36, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '42.119.201.244', '2021-10-20 02:16:21', '2021-10-20 02:16:21'),
	(37, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '42.113.136.116', '2021-10-20 02:21:43', '2021-10-20 02:21:43'),
	(38, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '203.210.208.151', '2021-10-20 02:34:03', '2021-10-20 02:34:03'),
	(39, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '203.210.208.171', '2021-10-20 02:34:30', '2021-10-20 02:34:30'),
	(40, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '42.113.160.131', '2021-10-20 02:43:25', '2021-10-20 02:43:25'),
	(41, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 412', '42.116.183.205', '2021-10-20 02:49:28', '2021-10-20 02:49:28'),
	(42, 'Mozilla/5.0 (Linux; Android 10) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/78.0.3904.108 Mobile Safari/537.36 Zalo android/12100583 ZaloTheme/dark ZaloLanguage/vi', '171.248.32.152', '2021-10-20 05:33:19', '2021-10-20 05:33:19'),
	(43, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '171.248.32.152', '2021-10-20 07:08:45', '2021-10-20 07:08:45'),
	(44, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '203.210.208.171', '2021-10-20 20:12:40', '2021-10-20 20:12:40'),
	(45, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-10-20 21:00:18', '2021-10-20 21:00:18'),
	(46, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '42.119.201.244', '2021-10-22 01:44:47', '2021-10-22 01:44:47'),
	(47, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.62.149', '2021-10-22 20:44:26', '2021-10-22 20:44:26'),
	(48, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-10-22 20:47:21', '2021-10-22 20:47:21'),
	(49, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '113.176.43.152', '2021-10-24 18:07:19', '2021-10-24 18:07:19'),
	(50, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '42.0.28.84', '2021-10-24 18:07:31', '2021-10-24 18:07:31'),
	(51, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '50.31.240.172', '2021-10-24 18:07:31', '2021-10-24 18:07:31'),
	(52, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.62.149', '2021-10-24 23:58:37', '2021-10-24 23:58:37'),
	(53, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-10-25 00:01:42', '2021-10-25 00:01:42'),
	(54, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Mobile/15E148 Safari/604.1', '113.185.54.230', '2021-10-25 00:23:09', '2021-10-25 00:23:09'),
	(55, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.53.130.212', '2021-10-25 00:24:10', '2021-10-25 00:24:10'),
	(56, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '203.210.208.171', '2021-10-25 00:35:50', '2021-10-25 00:35:50'),
	(57, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '113.176.43.152', '2021-10-25 02:06:37', '2021-10-25 02:06:37'),
	(58, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '50.31.255.133', '2021-10-25 02:06:49', '2021-10-25 02:06:49'),
	(59, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '50.31.240.180', '2021-10-25 02:06:50', '2021-10-25 02:06:50'),
	(60, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36 Edg/94.0.992.50', '1.53.130.212', '2021-10-25 02:18:42', '2021-10-25 02:18:42'),
	(61, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.53.130.212', '2021-10-25 02:33:40', '2021-10-25 02:33:40'),
	(62, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36', '1.53.130.212', '2021-10-25 02:45:31', '2021-10-25 02:45:31'),
	(63, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', '104.43.48.244', '2021-10-25 02:45:45', '2021-10-25 02:45:45'),
	(64, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1 Mobile/15E148 Safari/604.1', '113.185.48.56', '2021-10-25 03:39:26', '2021-10-25 03:39:26'),
	(65, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '1.53.130.212', '2021-10-25 03:49:55', '2021-10-25 03:49:55'),
	(66, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', '50.31.240.167', '2021-10-25 03:50:21', '2021-10-25 03:50:21'),
	(67, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', '50.31.255.140', '2021-10-25 03:50:21', '2021-10-25 03:50:21'),
	(68, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.53.130.212', '2021-10-25 04:14:00', '2021-10-25 04:14:00'),
	(69, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '1.53.130.212', '2021-10-25 18:43:34', '2021-10-25 18:43:34'),
	(70, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', '1.53.130.212', '2021-10-25 19:06:34', '2021-10-25 19:06:34'),
	(71, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '50.31.240.5', '2021-10-25 19:06:50', '2021-10-25 19:06:50'),
	(72, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36', '50.31.240.193', '2021-10-25 19:06:50', '2021-10-25 19:06:50'),
	(73, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', '1.53.130.212', '2021-10-25 19:38:02', '2021-10-25 19:38:02'),
	(74, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.53.130.212', '2021-10-25 21:05:17', '2021-10-25 21:05:17'),
	(75, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36 Edg/95.0.1020.30', '1.53.130.212', '2021-10-26 00:08:15', '2021-10-26 00:08:15'),
	(76, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.53.130.212', '2021-10-26 00:19:35', '2021-10-26 00:19:35'),
	(77, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.53.130.212', '2021-10-26 20:36:30', '2021-10-26 20:36:30'),
	(78, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '1.53.130.212', '2021-10-26 21:53:34', '2021-10-26 21:53:34'),
	(79, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '50.31.240.181', '2021-10-26 21:53:49', '2021-10-26 21:53:49'),
	(80, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '50.31.240.173', '2021-10-26 21:53:49', '2021-10-26 21:53:49'),
	(81, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.53.130.212', '2021-10-27 04:19:00', '2021-10-27 04:19:00'),
	(82, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.53.130.212', '2021-10-27 19:01:10', '2021-10-27 19:01:10'),
	(83, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '1.52.162.16', '2021-10-28 06:40:57', '2021-10-28 06:40:57'),
	(84, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '1.52.162.16', '2021-10-28 18:18:56', '2021-10-28 18:18:56'),
	(85, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '1.52.162.16', '2021-10-29 01:11:49', '2021-10-29 01:11:49'),
	(86, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', '42.114.56.27', '2021-10-29 02:53:36', '2021-10-29 02:53:36'),
	(87, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '40.94.227.14', '2021-10-29 02:53:47', '2021-10-29 02:53:47'),
	(88, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', '40.94.227.96', '2021-10-29 02:53:47', '2021-10-29 02:53:47'),
	(89, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '1.52.162.16', '2021-10-31 18:46:15', '2021-10-31 18:46:15'),
	(90, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', '203.210.208.151', '2021-10-31 20:37:52', '2021-10-31 20:37:52'),
	(91, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-10-31 20:37:58', '2021-10-31 20:37:58'),
	(92, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.121.234', '2021-10-31 20:39:18', '2021-10-31 20:39:18'),
	(93, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-10-31 20:42:38', '2021-10-31 20:42:38'),
	(94, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '1.52.162.16', '2021-10-31 21:17:43', '2021-10-31 21:17:43'),
	(95, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', '203.210.208.151', '2021-11-01 00:01:39', '2021-11-01 00:01:39'),
	(96, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '1.52.162.16', '2021-11-01 19:54:18', '2021-11-01 19:54:18'),
	(97, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '58.187.253.199', '2021-11-01 20:18:30', '2021-11-01 20:18:30'),
	(98, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '58.187.253.199', '2021-11-01 20:48:38', '2021-11-01 20:48:38'),
	(99, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '1.52.162.16', '2021-11-01 20:57:57', '2021-11-01 20:57:57'),
	(100, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '58.187.253.199', '2021-11-02 02:27:20', '2021-11-02 02:27:20'),
	(101, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.62.149', '2021-11-02 02:27:34', '2021-11-02 02:27:34'),
	(102, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', '113.176.43.152', '2021-11-02 03:06:24', '2021-11-02 03:06:24'),
	(103, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '58.187.253.199', '2021-11-02 03:10:51', '2021-11-02 03:10:51'),
	(104, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.2 Safari/605.1.15', '1.52.162.16', '2021-11-02 07:06:52', '2021-11-02 07:06:52'),
	(105, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '203.210.208.151', '2021-11-02 19:48:31', '2021-11-02 19:48:31'),
	(106, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-11-02 19:57:17', '2021-11-02 19:57:17'),
	(107, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '203.210.208.151', '2021-11-02 19:57:24', '2021-11-02 19:57:24'),
	(108, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-11-02 19:59:41', '2021-11-02 19:59:41'),
	(109, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '203.210.208.171', '2021-11-02 20:02:09', '2021-11-02 20:02:09'),
	(110, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '203.210.208.151', '2021-11-03 18:32:29', '2021-11-03 18:32:29'),
	(111, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '113.22.176.105', '2021-11-03 20:41:24', '2021-11-03 20:41:24'),
	(112, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-11-03 20:42:48', '2021-11-03 20:42:48'),
	(113, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '222.252.67.68', '2021-11-03 20:51:20', '2021-11-03 20:51:20'),
	(114, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', '40.94.226.75', '2021-11-03 20:51:35', '2021-11-03 20:51:35'),
	(115, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', '40.94.226.82', '2021-11-03 20:51:35', '2021-11-03 20:51:35'),
	(116, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '113.22.176.105', '2021-11-03 21:20:44', '2021-11-03 21:20:44'),
	(117, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:94.0) Gecko/20100101 Firefox/94.0', '14.161.6.103', '2021-11-03 21:36:15', '2021-11-03 21:36:15'),
	(118, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.136 Safari/537.36', '40.94.226.54', '2021-11-03 21:36:27', '2021-11-03 21:36:27'),
	(119, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.136 Safari/537.36', '40.94.226.3', '2021-11-03 21:36:27', '2021-11-03 21:36:27'),
	(120, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '113.22.176.105', '2021-11-04 02:51:08', '2021-11-04 02:51:08'),
	(121, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-11-04 02:51:30', '2021-11-04 02:51:30'),
	(122, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '203.210.208.171', '2021-11-04 03:05:07', '2021-11-04 03:05:07'),
	(123, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '203.210.208.151', '2021-11-05 00:27:14', '2021-11-05 00:27:14'),
	(124, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '27.72.137.64', '2021-11-08 22:16:57', '2021-11-08 22:16:57'),
	(125, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.62.149', '2021-11-08 22:17:14', '2021-11-08 22:17:14'),
	(126, 'Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUrlPreview Preview/0.5 skype-url-preview@microsoft.com', '52.114.32.212', '2021-11-08 22:17:55', '2021-11-08 22:17:55'),
	(127, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '118.71.89.38', '2021-11-08 22:18:13', '2021-11-08 22:18:13'),
	(128, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-11-08 22:20:09', '2021-11-08 22:20:09'),
	(129, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '118.71.44.152', '2021-11-10 01:18:12', '2021-11-10 01:18:12'),
	(130, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '118.71.44.152', '2021-11-10 01:55:26', '2021-11-10 01:55:26'),
	(131, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '203.210.208.171', '2021-11-11 19:19:54', '2021-11-11 19:19:54'),
	(132, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.52.177.87', '2021-11-15 00:18:21', '2021-11-15 00:18:21'),
	(133, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.52.177.87', '2021-11-15 01:44:03', '2021-11-15 01:44:03'),
	(134, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.119.201.93', '2021-11-15 19:01:34', '2021-11-15 19:01:34'),
	(135, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko)', '1.52.177.87', '2021-11-15 21:07:02', '2021-11-15 21:07:02'),
	(136, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1', '1.52.177.87', '2021-11-15 21:07:03', '2021-11-15 21:07:03'),
	(137, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.52.177.87', '2021-11-16 01:25:14', '2021-11-16 01:25:14'),
	(138, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.119.201.93', '2021-11-16 02:32:39', '2021-11-16 02:32:39'),
	(139, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '203.210.208.171', '2021-11-16 03:23:22', '2021-11-16 03:23:22'),
	(140, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '203.210.208.171', '2021-11-18 02:49:21', '2021-11-18 02:49:21'),
	(141, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.62.149', '2021-11-18 20:03:06', '2021-11-18 20:03:06'),
	(142, 'ZaloPC-win32-24v448', '113.176.43.152', '2021-11-18 20:03:06', '2021-11-18 20:03:06'),
	(143, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '113.176.43.152', '2021-11-18 20:03:10', '2021-11-18 20:03:10'),
	(144, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-11-18 20:06:23', '2021-11-18 20:06:23'),
	(145, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-11-18 20:10:21', '2021-11-18 20:10:21'),
	(146, 'ZaloPC-win32-24v448', '27.79.205.71', '2021-11-21 07:24:30', '2021-11-21 07:24:30'),
	(147, 'ZaloPC-darwin-23v447', '1.52.177.87', '2021-11-21 18:58:07', '2021-11-21 18:58:07'),
	(148, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.121.234', '2021-11-22 08:15:17', '2021-11-22 08:15:17'),
	(149, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-11-22 08:16:54', '2021-11-22 08:16:54'),
	(150, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '1.55.122.238', '2021-11-23 00:20:33', '2021-11-23 00:20:33'),
	(151, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '103.6.84.37', '2021-11-23 00:21:56', '2021-11-23 00:21:56'),
	(152, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36', '50.31.240.185', '2021-11-23 00:21:56', '2021-11-23 00:21:56'),
	(153, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '1.55.122.238', '2021-11-23 02:02:32', '2021-11-23 02:02:32'),
	(154, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '113.176.43.152', '2021-11-24 19:16:37', '2021-11-24 19:16:37'),
	(155, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '113.176.43.152', '2021-11-24 19:19:37', '2021-11-24 19:19:37'),
	(156, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Safari/605.1.15', '113.176.43.152', '2021-11-24 20:09:42', '2021-11-24 20:09:42'),
	(157, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '203.210.208.171', '2021-11-24 23:47:05', '2021-11-24 23:47:05'),
	(158, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '113.185.50.5', '2021-11-26 02:28:37', '2021-11-26 02:28:37'),
	(159, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '58.187.199.178', '2021-11-27 00:44:37', '2021-11-27 00:44:37'),
	(160, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', '43.224.34.131', '2021-11-27 00:44:52', '2021-11-27 00:44:52'),
	(161, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36', '50.31.240.180', '2021-11-27 00:44:53', '2021-11-27 00:44:53'),
	(162, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '203.210.208.151', '2021-11-28 20:23:26', '2021-11-28 20:23:26'),
	(163, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.121.234', '2021-11-28 20:23:31', '2021-11-28 20:23:31'),
	(164, 'Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '49.213.78.31', '2021-11-28 20:43:01', '2021-11-28 20:43:01'),
	(165, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '203.210.208.151', '2021-11-28 21:02:23', '2021-11-28 21:02:23'),
	(166, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '203.210.208.151', '2021-11-29 02:02:19', '2021-11-29 02:02:19'),
	(167, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-11-30 19:49:29', '2021-11-30 19:49:29'),
	(168, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.119.6.138', '2021-11-30 20:00:21', '2021-11-30 20:00:21'),
	(169, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-11-30 20:49:12', '2021-11-30 20:49:12'),
	(170, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-11-30 23:54:31', '2021-11-30 23:54:31'),
	(171, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.122.87', '2021-11-30 23:56:26', '2021-11-30 23:56:26'),
	(172, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-11-30 23:59:40', '2021-11-30 23:59:40'),
	(173, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-12-01 00:27:56', '2021-12-01 00:27:56'),
	(174, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.190.196', '2021-12-01 01:02:29', '2021-12-01 01:02:29'),
	(175, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-12-01 01:03:15', '2021-12-01 01:03:15'),
	(176, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-12-01 01:44:05', '2021-12-01 01:44:05'),
	(177, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-12-01 02:23:26', '2021-12-01 02:23:26'),
	(178, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '1.53.49.104', '2021-12-01 20:22:19', '2021-12-01 20:22:19'),
	(179, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.122.1', '2021-12-01 20:23:10', '2021-12-01 20:23:10'),
	(180, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-12-01 20:26:21', '2021-12-01 20:26:21'),
	(181, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-12-01 23:31:02', '2021-12-01 23:31:02'),
	(182, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.122.87', '2021-12-01 23:47:18', '2021-12-01 23:47:18'),
	(183, 'Mozilla/5.0 (Linux; Android 11; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Mobile Safari/537.36', '171.252.155.93', '2021-12-02 00:24:51', '2021-12-02 00:24:51'),
	(184, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.119.6.138', '2021-12-02 01:43:04', '2021-12-02 01:43:04'),
	(185, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '171.252.155.93', '2021-12-02 07:22:20', '2021-12-02 07:22:20'),
	(186, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.190.196', '2021-12-02 18:36:17', '2021-12-02 18:36:17'),
	(187, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.190.196', '2021-12-02 19:15:50', '2021-12-02 19:15:50'),
	(188, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', '42.113.190.196', '2021-12-02 19:25:27', '2021-12-02 19:25:27'),
	(189, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.62.149', '2021-12-02 19:33:42', '2021-12-02 19:33:42'),
	(190, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-12-02 19:37:11', '2021-12-02 19:37:11'),
	(191, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-12-02 20:15:37', '2021-12-02 20:15:37'),
	(192, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.190.196', '2021-12-02 20:40:03', '2021-12-02 20:40:03'),
	(193, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-12-02 21:09:35', '2021-12-02 21:09:35'),
	(194, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '1.53.49.104', '2021-12-02 21:12:26', '2021-12-02 21:12:26'),
	(195, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-12-02 23:49:30', '2021-12-02 23:49:30'),
	(196, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.121.234', '2021-12-02 23:50:13', '2021-12-02 23:50:13'),
	(197, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.62.149', '2021-12-02 23:53:02', '2021-12-02 23:53:02'),
	(198, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-12-02 23:55:35', '2021-12-02 23:55:35'),
	(199, 'Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '49.213.78.31', '2021-12-02 23:58:26', '2021-12-02 23:58:26'),
	(200, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '171.249.18.57', '2021-12-02 23:59:55', '2021-12-02 23:59:55'),
	(201, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', '202.60.105.229', '2021-12-02 23:59:57', '2021-12-02 23:59:57'),
	(202, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '171.249.18.57', '2021-12-03 00:35:52', '2021-12-03 00:35:52'),
	(203, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.119.6.138', '2021-12-03 00:44:19', '2021-12-03 00:44:19'),
	(204, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '14.241.224.98', '2021-12-03 00:50:30', '2021-12-03 00:50:30'),
	(205, 'Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '49.213.78.31', '2021-12-03 00:55:05', '2021-12-03 00:55:05'),
	(206, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 422', '14.241.224.139', '2021-12-03 00:57:41', '2021-12-03 00:57:41'),
	(207, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 422', '171.249.18.57', '2021-12-03 01:02:18', '2021-12-03 01:02:18'),
	(208, 'Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUriPreview Preview/0.5 skype-url-preview@microsoft.com', '52.114.32.212', '2021-12-03 01:07:34', '2021-12-03 01:07:34'),
	(209, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '171.249.18.57', '2021-12-03 01:21:09', '2021-12-03 01:21:09'),
	(210, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.113.190.196', '2021-12-03 01:21:42', '2021-12-03 01:21:42'),
	(211, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '42.119.6.138', '2021-12-03 01:21:57', '2021-12-03 01:21:57'),
	(212, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.119.6.138', '2021-12-03 01:22:29', '2021-12-03 01:22:29'),
	(213, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '14.241.224.98', '2021-12-03 01:22:31', '2021-12-03 01:22:31'),
	(214, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.41', '171.249.18.57', '2021-12-03 01:24:37', '2021-12-03 01:24:37'),
	(215, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', '14.241.224.139', '2021-12-03 01:26:16', '2021-12-03 01:26:16'),
	(216, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '14.241.224.98', '2021-12-03 01:26:46', '2021-12-03 01:26:46'),
	(217, 'Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '49.213.78.31', '2021-12-03 01:29:19', '2021-12-03 01:29:19'),
	(218, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.119.6.138', '2021-12-03 02:21:37', '2021-12-03 02:21:37'),
	(219, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.122.87', '2021-12-04 00:33:19', '2021-12-04 00:33:19'),
	(220, 'ZaloPC-win32-24v451', '42.116.163.58', '2021-12-04 00:33:19', '2021-12-04 00:33:19'),
	(221, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 422', '113.185.50.101', '2021-12-04 00:33:37', '2021-12-04 00:33:37'),
	(222, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-12-04 00:35:32', '2021-12-04 00:35:32'),
	(223, 'Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '49.213.78.31', '2021-12-04 00:38:45', '2021-12-04 00:38:45'),
	(224, 'ZaloPC-darwin-23v449', '42.119.6.138', '2021-12-05 18:52:48', '2021-12-05 18:52:48'),
	(225, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36', '14.241.224.139', '2021-12-05 19:50:17', '2021-12-05 19:50:17'),
	(226, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-12-05 20:26:03', '2021-12-05 20:26:03'),
	(227, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.119.6.138', '2021-12-06 00:10:44', '2021-12-06 00:10:44'),
	(228, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.119.6.138', '2021-12-06 03:03:49', '2021-12-06 03:03:49'),
	(229, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '14.241.224.98', '2021-12-06 19:25:48', '2021-12-06 19:25:48'),
	(230, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.119.6.138', '2021-12-07 01:39:58', '2021-12-07 01:39:58'),
	(231, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Safari/605.1.15', '118.70.185.147', '2021-12-07 21:46:12', '2021-12-07 21:46:12'),
	(232, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.119.6.138', '2021-12-07 22:26:28', '2021-12-07 22:26:28'),
	(233, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '14.241.224.139', '2021-12-07 23:37:38', '2021-12-07 23:37:38'),
	(234, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.119.6.138', '2021-12-08 03:05:33', '2021-12-08 03:05:33'),
	(235, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '118.68.239.136', '2021-12-08 04:17:33', '2021-12-08 04:17:33'),
	(236, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '118.68.239.136', '2021-12-08 05:44:01', '2021-12-08 05:44:01'),
	(237, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '14.241.224.139', '2021-12-08 19:13:24', '2021-12-08 19:13:24'),
	(238, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '118.68.239.136', '2021-12-08 19:28:21', '2021-12-08 19:28:21'),
	(239, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '14.241.224.139', '2021-12-08 19:55:05', '2021-12-08 19:55:05'),
	(240, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '14.241.224.139', '2021-12-08 20:40:18', '2021-12-08 20:40:18'),
	(241, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '27.72.144.151', '2021-12-08 20:44:33', '2021-12-08 20:44:33'),
	(242, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '14.241.224.139', '2021-12-09 03:10:57', '2021-12-09 03:10:57'),
	(243, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '14.241.224.139', '2021-12-09 19:19:54', '2021-12-09 19:19:54'),
	(244, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '1.55.195.162', '2021-12-09 20:06:57', '2021-12-09 20:06:57'),
	(245, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '1.55.195.162', '2021-12-09 20:20:37', '2021-12-09 20:20:37'),
	(246, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '118.68.239.136', '2021-12-09 21:17:27', '2021-12-09 21:17:27'),
	(247, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '118.68.239.136', '2021-12-09 23:05:09', '2021-12-09 23:05:09'),
	(248, 'ZaloPC-darwin-23v449', '118.68.239.136', '2021-12-09 23:05:27', '2021-12-09 23:05:27'),
	(249, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-12-09 23:05:45', '2021-12-09 23:05:45'),
	(250, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-12-09 23:07:55', '2021-12-09 23:07:55'),
	(251, 'ZaloPC-win32-24v451', '113.176.43.152', '2021-12-09 23:09:33', '2021-12-09 23:09:33'),
	(252, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.55 Safari/537.36 Edg/96.0.1054.43', '113.176.43.152', '2021-12-09 23:17:29', '2021-12-09 23:17:29'),
	(253, 'ZaloPC-win32-24v451', '118.68.239.136', '2021-12-09 23:34:46', '2021-12-09 23:34:46'),
	(254, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '14.241.224.139', '2021-12-09 23:37:51', '2021-12-09 23:37:51'),
	(255, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '1.55.195.162', '2021-12-10 00:38:40', '2021-12-10 00:38:40'),
	(256, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '1.55.195.162', '2021-12-10 02:05:55', '2021-12-10 02:05:55'),
	(257, 'ZaloPC-win32-24v451', '123.16.85.106', '2021-12-10 18:13:10', '2021-12-10 18:13:10'),
	(258, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '117.2.232.21', '2021-12-10 18:50:48', '2021-12-10 18:50:48'),
	(259, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '117.2.232.21', '2021-12-10 19:34:12', '2021-12-10 19:34:12'),
	(260, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '1.55.195.162', '2021-12-11 01:20:59', '2021-12-11 01:20:59'),
	(261, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '118.68.239.136', '2021-12-12 19:33:46', '2021-12-12 19:33:46'),
	(262, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '1.55.195.162', '2021-12-12 20:37:21', '2021-12-12 20:37:21'),
	(263, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '14.241.224.139', '2021-12-12 20:37:48', '2021-12-12 20:37:48'),
	(264, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '27.2.199.4', '2021-12-12 20:38:27', '2021-12-12 20:38:27'),
	(265, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '112.197.13.71', '2021-12-12 20:38:29', '2021-12-12 20:38:29'),
	(266, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '118.68.239.136', '2021-12-13 00:18:52', '2021-12-13 00:18:52'),
	(267, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '118.68.239.136', '2021-12-13 02:01:46', '2021-12-13 02:01:46'),
	(268, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '118.68.239.136', '2021-12-13 03:43:37', '2021-12-13 03:43:37'),
	(269, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '118.68.239.136', '2021-12-13 19:31:50', '2021-12-13 19:31:50'),
	(270, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '1.55.195.162', '2021-12-14 06:50:41', '2021-12-14 06:50:41'),
	(271, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '1.55.195.162', '2021-12-14 07:38:51', '2021-12-14 07:38:51'),
	(272, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '1.55.195.162', '2021-12-14 18:44:56', '2021-12-14 18:44:56'),
	(273, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '117.2.230.157', '2021-12-14 19:21:50', '2021-12-14 19:21:50'),
	(274, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '117.2.230.157', '2021-12-14 23:36:38', '2021-12-14 23:36:38'),
	(275, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '118.68.239.136', '2021-12-15 02:38:30', '2021-12-15 02:38:30'),
	(276, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '171.224.83.226', '2021-12-15 23:14:35', '2021-12-15 23:14:35'),
	(277, 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 410', '42.1.89.165', '2021-12-16 00:03:09', '2021-12-16 00:03:09'),
	(278, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '1.54.125.166', '2021-12-16 00:17:59', '2021-12-16 00:17:59'),
	(279, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.122.1', '2021-12-16 00:30:25', '2021-12-16 00:30:25'),
	(280, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '14.241.224.139', '2021-12-16 00:31:20', '2021-12-16 00:31:20'),
	(281, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.62.149', '2021-12-16 00:32:37', '2021-12-16 00:32:37'),
	(282, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.77.66.161', '2021-12-16 00:33:29', '2021-12-16 00:33:29'),
	(283, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 424', '14.241.224.98', '2021-12-16 00:43:21', '2021-12-16 00:43:21'),
	(284, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '171.226.38.68', '2021-12-16 00:50:15', '2021-12-16 00:50:15'),
	(285, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '1.54.125.166', '2021-12-16 00:57:10', '2021-12-16 00:57:10'),
	(286, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '14.241.224.139', '2021-12-16 01:01:39', '2021-12-16 01:01:39'),
	(287, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 424', '14.241.224.139', '2021-12-16 01:04:01', '2021-12-16 01:04:01'),
	(288, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '14.241.224.98', '2021-12-16 01:05:40', '2021-12-16 01:05:40'),
	(289, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.93 Safari/537.36', '14.241.224.139', '2021-12-16 02:15:07', '2021-12-16 02:15:07'),
	(290, 'Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUriPreview Preview/0.5 skype-url-preview@microsoft.com', '52.114.32.212', '2021-12-16 02:15:31', '2021-12-16 02:15:31'),
	(291, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '1.54.125.166', '2021-12-16 02:31:35', '2021-12-16 02:31:35'),
	(292, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '171.224.83.226', '2021-12-16 02:35:04', '2021-12-16 02:35:04'),
	(293, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '171.224.83.226', '2021-12-17 01:36:09', '2021-12-17 01:36:09'),
	(294, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '171.224.83.226', '2021-12-17 07:49:16', '2021-12-17 07:49:16'),
	(295, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.3 Mobile/15E148 Safari/604.1', '27.76.233.181', '2021-12-19 00:40:13', '2021-12-19 00:40:13'),
	(296, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '117.1.192.83', '2021-12-19 21:01:19', '2021-12-19 21:01:19'),
	(297, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '117.1.192.83', '2021-12-20 00:58:16', '2021-12-20 00:58:16'),
	(298, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.185.7', '2021-12-20 00:58:34', '2021-12-20 00:58:34'),
	(299, 'ZaloPC-darwin-23v451', '117.1.192.83', '2021-12-20 19:40:12', '2021-12-20 19:40:12'),
	(300, 'ZaloPC-win32-24v451', '42.113.157.60', '2021-12-20 19:41:22', '2021-12-20 19:41:22'),
	(301, 'ZaloPC-win32-24v451', '123.16.85.106', '2021-12-20 19:41:22', '2021-12-20 19:41:22'),
	(302, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.62.149', '2021-12-20 19:41:23', '2021-12-20 19:41:23'),
	(303, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.122.87', '2021-12-20 19:41:24', '2021-12-20 19:41:24'),
	(304, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '117.1.192.83', '2021-12-20 19:41:32', '2021-12-20 19:41:32'),
	(305, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '123.16.85.106', '2021-12-20 19:41:42', '2021-12-20 19:41:42'),
	(306, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.122.1', '2021-12-20 19:43:03', '2021-12-20 19:43:03'),
	(307, 'Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '49.213.78.31', '2021-12-20 19:45:10', '2021-12-20 19:45:10'),
	(308, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', '42.113.157.60', '2021-12-20 19:45:16', '2021-12-20 19:45:16'),
	(309, 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '113.176.43.152', '2021-12-20 19:53:23', '2021-12-20 19:53:23'),
	(310, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '171.224.181.181', '2021-12-20 19:59:23', '2021-12-20 19:59:23'),
	(311, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 424', '123.16.85.106', '2021-12-20 20:03:18', '2021-12-20 20:03:18'),
	(312, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_4_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 424', '117.1.192.83', '2021-12-20 20:03:48', '2021-12-20 20:03:48'),
	(313, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '117.1.192.83', '2021-12-20 20:29:35', '2021-12-20 20:29:35'),
	(314, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', '42.113.157.60', '2021-12-20 20:54:40', '2021-12-20 20:54:40'),
	(315, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Zalo iOS / 424', '42.113.157.60', '2021-12-20 21:15:27', '2021-12-20 21:15:27'),
	(316, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '171.224.181.181', '2021-12-20 21:21:38', '2021-12-20 21:21:38'),
	(317, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '171.224.181.181', '2021-12-20 21:54:53', '2021-12-20 21:54:53'),
	(318, 'Mozilla/5.0 (Linux; Android 11; SM-G780G Build/RP1A.200720.012;) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/96.0.4664.104 Mobile Safari/537.36 Zalo android/12100593 ZaloTheme/light ZaloLanguage/vi', '171.224.181.181', '2021-12-20 22:12:50', '2021-12-20 22:12:50'),
	(319, 'Mozilla/5.0 (Linux; Android 11; SM-G780G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36', '171.224.181.181', '2021-12-20 22:13:01', '2021-12-20 22:13:01'),
	(320, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '117.1.192.83', '2021-12-21 01:10:09', '2021-12-21 01:10:09'),
	(321, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.185.7', '2021-12-21 20:04:49', '2021-12-21 20:04:49'),
	(322, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.185.7', '2021-12-21 20:49:28', '2021-12-21 20:49:28'),
	(323, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '59.153.220.96', '2021-12-22 03:17:56', '2021-12-22 03:17:56'),
	(324, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '59.153.220.96', '2021-12-22 04:10:29', '2021-12-22 04:10:29'),
	(325, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '59.153.220.96', '2021-12-22 04:49:59', '2021-12-22 04:49:59'),
	(326, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.185.7', '2021-12-22 19:06:23', '2021-12-22 19:06:23'),
	(327, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.113.136.102', '2021-12-22 21:48:17', '2021-12-22 21:48:17'),
	(328, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-12-22 21:55:08', '2021-12-22 21:55:08'),
	(329, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '42.113.136.102', '2021-12-22 21:55:31', '2021-12-22 21:55:31'),
	(330, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.74.104.67', '2021-12-22 21:57:36', '2021-12-22 21:57:36'),
	(331, 'Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUriPreview Preview/0.5 skype-url-preview@microsoft.com', '52.114.14.71', '2021-12-22 21:59:35', '2021-12-22 21:59:35'),
	(332, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', '14.241.239.150', '2021-12-22 23:18:29', '2021-12-22 23:18:29'),
	(333, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.136 Safari/537.36', '40.94.227.96', '2021-12-22 23:18:40', '2021-12-22 23:18:40'),
	(334, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.136 Safari/537.36', '40.94.227.84', '2021-12-22 23:18:40', '2021-12-22 23:18:40'),
	(335, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.185.7', '2021-12-23 01:36:58', '2021-12-23 01:36:58'),
	(336, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.185.7', '2021-12-23 02:07:20', '2021-12-23 02:07:20'),
	(337, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '42.113.136.102', '2021-12-23 04:09:16', '2021-12-23 04:09:16'),
	(338, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.185.7', '2021-12-23 19:30:19', '2021-12-23 19:30:19'),
	(339, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.185.7', '2021-12-23 20:07:43', '2021-12-23 20:07:43'),
	(340, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '42.113.185.7', '2021-12-24 02:20:18', '2021-12-24 02:20:18'),
	(341, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '42.113.185.83', '2021-12-24 19:40:03', '2021-12-24 19:40:03'),
	(342, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '59.153.220.96', '2021-12-26 00:07:53', '2021-12-26 00:07:53'),
	(343, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '113.23.108.131', '2021-12-26 23:35:35', '2021-12-26 23:35:35'),
	(344, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.62.149', '2021-12-26 23:41:18', '2021-12-26 23:41:18'),
	(345, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '113.23.108.131', '2021-12-26 23:58:06', '2021-12-26 23:58:06'),
	(346, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '113.23.108.131', '2021-12-27 00:08:10', '2021-12-27 00:08:10'),
	(347, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '117.2.230.157', '2021-12-27 00:12:53', '2021-12-27 00:12:53'),
	(348, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-12-27 00:14:34', '2021-12-27 00:14:34'),
	(349, 'Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '49.213.78.31', '2021-12-27 00:37:37', '2021-12-27 00:37:37'),
	(350, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '115.74.253.42', '2021-12-27 01:18:03', '2021-12-27 01:18:03'),
	(351, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '112.197.8.75', '2021-12-27 01:18:17', '2021-12-27 01:18:17'),
	(352, 'Mozilla/5.0 (Windows NT 6.1; WOW64) SkypeUriPreview Preview/0.5 skype-url-preview@microsoft.com', '52.114.32.212', '2021-12-27 01:19:00', '2021-12-27 01:19:00'),
	(353, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', '115.74.253.42', '2021-12-27 01:19:08', '2021-12-27 01:19:08'),
	(354, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-27 01:19:19', '2021-12-27 01:19:19'),
	(355, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '14.241.224.98', '2021-12-27 01:19:20', '2021-12-27 01:19:20'),
	(356, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko)', '113.23.123.115', '2021-12-27 01:19:58', '2021-12-27 01:19:58'),
	(357, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1', '113.23.123.115', '2021-12-27 01:19:59', '2021-12-27 01:19:59'),
	(358, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/96.0.4664.116 Mobile/15E148 Safari/604.1', '14.241.224.139', '2021-12-27 01:22:39', '2021-12-27 01:22:39'),
	(359, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '113.23.108.131', '2021-12-27 01:28:10', '2021-12-27 01:28:10'),
	(360, 'Mozilla/5.0 (Linux; Android 10; ELS-NX9) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Mobile Safari/537.36', '171.226.38.68', '2021-12-27 01:29:28', '2021-12-27 01:29:28'),
	(361, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.8.123', '2021-12-27 01:44:10', '2021-12-27 01:44:10'),
	(362, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.74.104.67', '2021-12-27 01:49:02', '2021-12-27 01:49:02'),
	(363, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/96.0.4664.116 Mobile/15E148 Safari/604.1', '14.241.224.139', '2021-12-27 02:00:14', '2021-12-27 02:00:14'),
	(364, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '113.23.108.131', '2021-12-27 02:11:42', '2021-12-27 02:11:42'),
	(365, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '14.241.224.98', '2021-12-27 02:20:23', '2021-12-27 02:20:23'),
	(366, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '113.23.108.131', '2021-12-27 02:20:30', '2021-12-27 02:20:30'),
	(367, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.2 Safari/605.1.15', '113.23.108.131', '2021-12-27 02:52:41', '2021-12-27 02:52:41'),
	(368, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-27 03:24:15', '2021-12-27 03:24:15'),
	(369, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '14.241.224.98', '2021-12-27 18:28:18', '2021-12-27 18:28:18'),
	(370, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.122.87', '2021-12-27 18:30:41', '2021-12-27 18:30:41'),
	(371, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '14.241.224.98', '2021-12-27 19:26:36', '2021-12-27 19:26:36'),
	(372, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko)', '113.23.123.115', '2021-12-27 19:26:53', '2021-12-27 19:26:53'),
	(373, 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1', '113.23.123.115', '2021-12-27 19:26:54', '2021-12-27 19:26:54'),
	(374, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '14.241.224.98', '2021-12-27 20:00:01', '2021-12-27 20:00:01'),
	(375, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/96.0.4664.116 Mobile/15E148 Safari/604.1', '14.241.224.98', '2021-12-27 20:28:08', '2021-12-27 20:28:08'),
	(376, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '14.241.224.98', '2021-12-27 20:45:21', '2021-12-27 20:45:21'),
	(377, 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/96.0.4664.116 Mobile/15E148 Safari/604.1', '14.241.224.98', '2021-12-27 21:24:26', '2021-12-27 21:24:26'),
	(378, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-27 23:21:58', '2021-12-27 23:21:58'),
	(379, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.122.87', '2021-12-27 23:22:38', '2021-12-27 23:22:38'),
	(380, 'Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '49.213.78.31', '2021-12-27 23:46:17', '2021-12-27 23:46:17'),
	(381, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-28 00:12:59', '2021-12-28 00:12:59'),
	(382, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-28 01:04:30', '2021-12-28 01:04:30'),
	(383, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-28 01:36:25', '2021-12-28 01:36:25'),
	(384, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-28 02:07:22', '2021-12-28 02:07:22'),
	(385, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-28 02:38:01', '2021-12-28 02:38:01'),
	(386, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-28 03:13:27', '2021-12-28 03:13:27'),
	(387, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-28 19:01:35', '2021-12-28 19:01:35'),
	(388, 'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php) _zbot', '139.99.121.234', '2021-12-28 19:01:49', '2021-12-28 19:01:49'),
	(389, 'Mozilla/5.0 (Linux; Android 9; SM-N976V) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.89 Mobile Safari/537.36 Zalo android/12100553', '115.74.104.67', '2021-12-28 19:03:23', '2021-12-28 19:03:23'),
	(390, 'Chrome/41.0.2272.96 Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', '49.213.78.31', '2021-12-28 19:27:06', '2021-12-28 19:27:06'),
	(391, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', '113.23.123.115', '2021-12-28 22:07:33', '2021-12-28 22:07:33'),
	(392, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-28 22:15:56', '2021-12-28 22:15:56'),
	(393, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36 Edg/96.0.1054.62', '113.23.123.115', '2021-12-28 23:11:11', '2021-12-28 23:11:11'),
	(394, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Safari/605.1.15', '113.23.123.115', '2021-12-28 23:12:31', '2021-12-28 23:12:31'),
	(395, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 00:22:01', '2021-12-29 00:22:01'),
	(396, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 01:27:22', '2021-12-29 01:27:22'),
	(397, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 02:04:32', '2021-12-29 02:04:32'),
	(398, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 02:35:14', '2021-12-29 02:35:14'),
	(399, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 04:42:33', '2021-12-29 04:42:33'),
	(400, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 05:54:21', '2021-12-29 05:54:21'),
	(401, 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', '127.0.0.1', '2021-12-29 06:45:07', '2021-12-29 06:45:07'),
	(402, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 07:03:27', '2021-12-29 07:03:27'),
	(403, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 07:49:16', '2021-12-29 07:49:16'),
	(404, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 08:57:46', '2021-12-29 08:57:46'),
	(405, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 19:07:08', '2021-12-29 19:07:08'),
	(406, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 19:37:24', '2021-12-29 19:37:24'),
	(407, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Mobile Safari/537.36', '127.0.0.1', '2021-12-29 20:02:06', '2021-12-29 20:02:06'),
	(408, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 20:14:59', '2021-12-29 20:14:59'),
	(409, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 21:00:49', '2021-12-29 21:00:49'),
	(410, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 21:59:08', '2021-12-29 21:59:08'),
	(411, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-29 23:45:29', '2021-12-29 23:45:29'),
	(412, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-30 00:19:21', '2021-12-30 00:19:21'),
	(413, 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Mobile Safari/537.36', '127.0.0.1', '2021-12-30 00:27:58', '2021-12-30 00:27:58'),
	(414, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-30 01:08:29', '2021-12-30 01:08:29'),
	(415, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-30 01:52:47', '2021-12-30 01:52:47'),
	(416, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-30 04:40:42', '2021-12-30 04:40:42'),
	(417, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36', '127.0.0.1', '2021-12-30 08:48:51', '2021-12-30 08:48:51'),
	(418, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36', '127.0.0.1', '2022-03-07 00:03:43', '2022-03-07 00:03:43'),
	(419, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36', '127.0.0.1', '2022-03-16 01:38:44', '2022-03-16 01:38:44'),
	(420, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '127.0.0.1', '2022-03-30 03:29:07', '2022-03-30 03:29:07'),
	(421, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36', '127.0.0.1', '2022-03-31 02:03:24', '2022-03-31 02:03:24');

-- Dumping structure for table aurora.visitings
CREATE TABLE IF NOT EXISTS `visitings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.visitings: ~2 rows (approximately)
DELETE FROM `visitings`;
INSERT INTO `visitings` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(2, 'loại 1', 1, '2021-10-19 02:25:06', '2021-10-19 02:25:06'),
	(3, 'loại 2', 1, '2021-10-19 10:28:11', '2021-10-19 10:28:11');

-- Dumping structure for table aurora.visiting_languages
CREATE TABLE IF NOT EXISTS `visiting_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visiting_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lang` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Dumping data for table aurora.visiting_languages: ~6 rows (approximately)
DELETE FROM `visiting_languages`;
INSERT INTO `visiting_languages` (`id`, `visiting_id`, `name`, `lang`, `created_at`, `updated_at`) VALUES
	(13, 2, 'loại 1', 'vi', '2021-10-19 02:25:06', '2021-10-19 02:25:06'),
	(14, 2, 'loại 1', 'en', '2021-10-19 02:25:06', '2021-10-19 02:25:06'),
	(15, 2, 'loại 1', 'un', '2021-10-19 02:25:06', '2021-10-19 02:25:06'),
	(16, 2, 'loại 1', 'ca', '2021-10-19 02:25:07', '2021-10-19 02:25:07'),
	(17, 3, 'loại 2', 'vi', '2021-10-19 10:28:11', '2021-10-19 10:28:11'),
	(18, 3, 'loại 2', 'en', '2021-10-19 10:28:11', '2021-10-19 10:28:11');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
