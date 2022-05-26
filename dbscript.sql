-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 05, 2022 at 03:59 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--
CREATE DATABASE IF NOT EXISTS `db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_menus`
--

CREATE TABLE `admin_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menus`
--

INSERT INTO `admin_menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'nav-menu', '2022-03-30 15:37:03', '2022-03-30 15:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu_items`
--

CREATE TABLE `admin_menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(11) NOT NULL DEFAULT 0,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menu` int(10) UNSIGNED NOT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu_items`
--

INSERT INTO `admin_menu_items` (`id`, `label`, `link`, `parent`, `sort`, `class`, `menu`, `depth`, `created_at`, `updated_at`) VALUES
(5, 'Contact', 'contact', 5, 2, NULL, 1, 0, '2022-03-30 15:37:03', '2022-03-30 19:04:35'),
(6, 'About Us', 'about-us', 6, 3, NULL, 1, 0, '2022-03-30 15:37:03', '2022-03-30 19:04:35'),
(7, 'Bundles', 'bundles', 7, 1, NULL, 1, 0, '2022-03-30 19:03:56', '2022-03-30 19:04:35'),
(8, 'Courses', 'courses', 8, 0, NULL, 1, 0, '2022-03-30 19:04:00', '2022-03-30 19:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `blog_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bundles`
--

CREATE TABLE `bundles` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `course_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `featured` int(11) DEFAULT 0,
  `trending` int(11) DEFAULT 0,
  `popular` int(11) DEFAULT 0,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `free` tinyint(4) DEFAULT 0,
  `expire_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bundle_courses`
--

CREATE TABLE `bundle_courses` (
  `bundle_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bundle_student`
--

CREATE TABLE `bundle_student` (
  `bundle_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `rating` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_storage`
--

CREATE TABLE `cart_storage` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cart_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1-Generated 0-Not Generated',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chapter_students`
--

CREATE TABLE `chapter_students` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatter_categories`
--

CREATE TABLE `chatter_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatter_discussion`
--

CREATE TABLE `chatter_discussion` (
  `id` int(10) UNSIGNED NOT NULL,
  `chatter_category_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sticky` tinyint(1) NOT NULL DEFAULT 0,
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `answered` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '#232629',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_reply_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatter_post`
--

CREATE TABLE `chatter_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `chatter_discussion_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `markdown` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatter_user_discussion`
--

CREATE TABLE `chatter_user_discussion` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `discussion_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_participants`
--

CREATE TABLE `chat_participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `thread_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `last_read` timestamp NULL DEFAULT NULL,
  `starred` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat_threads`
--

CREATE TABLE `chat_threads` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Unique slug for social media sharing. MD5 hashed string',
  `max_participants` int(11) DEFAULT NULL COMMENT 'Max number of participants allowed',
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Profile picture for the conversation',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'theme_layout', '1', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(2, 'font_color', 'default', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(3, 'layout_type', 'wide-layout', '2022-03-30 15:37:03', '2022-03-30 18:45:42'),
(4, 'layout_1', '{\"search_section\":{\"title\":\"Search Section\",\"status\":1},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"reasons\":{\"title\":\"Reasons why choose Margie\'s Magic Verbs\",\"status\":1},\"testimonial\":{\"title\":\"Testimonial\",\"status\":1},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":1},\"sponsors\":{\"title\":\"Sponsors\",\"status\":1},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":1},\"teachers\":{\"title\":\"Teachers\",\"status\":1},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":1},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":1},\"contact_us\":{\"title\":\"Contact us / Get in Touch\",\"status\":1}}', '2022-03-30 15:37:03', '2022-03-30 18:45:42'),
(5, 'layout_2', '{\"sponsors\":{\"title\":\"Sponsors\",\"status\":1},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"search_section\":{\"title\":\"Search Section\",\"status\":1},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":1},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":1},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":1},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":1},\"testimonial\":{\"title\":\"Testimonial\",\"status\":1},\"teachers\":{\"title\":\"Teachers\",\"status\":1},\"contact_us\":{\"title\":\"Contact us \\/ Get in Touch\",\"status\":1}}', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(6, 'layout_3', '{\"counters\":{\"title\":\"Counters\",\"status\":1},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":1},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"reasons\":{\"title\":\"Reasons why choose Margie\'s Magic Verbs\",\"status\":1},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":1},\"teachers\":{\"title\":\"Teachers\",\"status\":1},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":1},\"testimonial\":{\"title\":\"Testimonial\",\"status\":1},\"sponsors\":{\"title\":\"Sponsors\",\"status\":1},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":1},\"contact_us\":{\"title\":\"Contact us \\/ Get in Touch\",\"status\":1}}', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(7, 'layout_4', '{\"counters\":{\"title\":\"Counters\",\"status\":1},\"popular_courses\":{\"title\":\"Popular Courses\",\"status\":1},\"reasons\":{\"title\":\"Reasons why choose Margie\'s Magic Verbs\",\"status\":1},\"featured_courses\":{\"title\":\"Featured Courses\",\"status\":1},\"course_by_category\":{\"title\":\"Course By Category\",\"status\":1},\"teachers\":{\"title\":\"Teachers\",\"status\":1},\"latest_news\":{\"title\":\"Latest News, Courses\",\"status\":1},\"search_section\":{\"title\":\"Search Section\",\"status\":1},\"faq\":{\"title\":\"Frequently Asked Questions\",\"status\":1},\"testimonial\":{\"title\":\"Testimonial\",\"status\":1},\"sponsors\":{\"title\":\"Sponsors\",\"status\":1},\"contact_form\":{\"title\":\"Contact Form\",\"status\":1},\"contact_us\":{\"title\":\"Contact us \\/ Get in Touch\",\"status\":1}}', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(8, 'counter', '2', '2022-03-30 15:37:03', '2022-03-30 18:45:42'),
(9, 'total_students', '1M+', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(10, 'total_courses', '1K+', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(11, 'total_teachers', '200+', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(12, 'logo_b_image', 'logo-black-text.png', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(13, 'logo_w_image', 'logo-white-text.png', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(14, 'logo_white_image', 'logo-white-image.png', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(15, 'logo_popup', 'popup-logo.png', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(16, 'favicon_image', 'popup-logo.png', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(17, 'contact_data', '[{\"name\":\"short_text\",\"value\":\"Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet ipsum dolor sit amet, consectetuer adipiscing elit.\",\"status\":1},{\"name\":\"primary_address\",\"value\":\" Last Vegas, 120 Graphic Street, US\",\"status\":0},{\"name\":\"secondary_address\",\"value\":\"Califorinia, 88 Design Street, US\",\"status\":0},{\"name\":\"primary_phone\",\"value\":\"(34) 608107295\",\"status\":1},{\"name\":\"secondary_phone\",\"value\":\"(20) 3434 9999\",\"status\":0},{\"name\":\"primary_email\",\"value\":\"margiemagicverb@gmail.com\",\"status\":1},{\"name\":\"secondary_email\",\"value\":\"margiemagicverb@gmail.com\",\"status\":0},{\"name\":\"location_on_map\",\"value\":\"<iframe width=\'560\' height=\'315\' src=\'https://www.youtube.com/embed/J0u4LUfyrH4\' title=\'YouTube video player\' frameborder=\'0\' allow=\'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\' allowfullscreen></iframe>\\n\\n<iframe width=\'560\' height=\'315\' src=\'https://www.youtube.com/embed/J0u4LUfyrH4\' title=\'YouTube video player\' frameborder=\'0\' allow=\'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\' allowfullscreen></iframe>\",\"status\":1}]', '2022-03-30 15:37:03', '2022-04-03 18:43:35'),
(18, 'footer_data', '{\"short_description\":{\"text\":\"We take our mission of increasing global access to quality education seriously. We connect learners to the best universities and institutions from around the world.\",\"status\":1},\"section1\":{\"type\":\"2\",\"status\":1},\"section2\":{\"type\":\"3\",\"status\":1},\"section3\":{\"type\":\"4\",\"status\":1},\"social_links\":{\"status\":1,\"links\":[{\"icon\":\"fab fa-youtube\",\"link\":\"https://www.youtube.com/margiemagicverb\"}]},\"newsletter_form\":{\"status\":1},\"bottom_footer\":{\"status\":1},\"copyright_text\":{\"text\":\"All right reserved  © 2022\",\"status\":1},\"bottom_footer_links\":{\"status\":1,\"links\":[{\"label\":\"Privacy Policy\",\"link\":\"http://margies-magic-verbs.com/privacy-policy\"},{\"label\":\"Terms and Conditions\",\"link\":\"http://margies-magic-verbs.com/terms-and-conditions\"}]}}', '2022-03-30 15:37:03', '2022-04-03 17:41:25'),
(19, 'app.locale', 'en', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(20, 'app.display_type', 'ltr', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(21, 'app.currency', 'USD', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(22, 'lesson_timer', '0', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(23, 'show_offers', '0', '2022-03-30 15:37:03', '2022-03-31 12:52:38'),
(24, 'access.captcha.registration', '0', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(25, 'sitemap.chunk', '500', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(26, 'one_signal', '0', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(27, 'nav_menu', '1', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(28, 'commission_rate', '0', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(29, 'app.name', 'Margie\'s Magic Verbs', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(30, 'app.url', 'http://margies-magic-verbs.com', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(31, 'google_analytics_id', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(32, 'no-captcha.sitekey', 'no-captcha-sitekey', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(33, 'no-captcha.secret', 'no-captcha-secret', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(34, 'onesignal_data', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(35, 'custom_css', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(36, 'custom_js', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(37, 'mail.from.name', 'Margie\'s Magic Verbs', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(38, 'mail.from.address', 'margiemagicverb@gmail.com', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(39, 'mail.driver', 'smtp', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(40, 'mail.host', 'smtp.gmail.com', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(41, 'mail.port', '465', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(42, 'mail.username', 'margiemagicverb@gmail.com', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(43, 'mail.password', 'margie12345', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(44, 'mail.encryption', 'ssl', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(45, 'services.stripe.key', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(46, 'services.stripe.secret', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(47, 'paypal.settings.mode', 'sandbox', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(48, 'paypal.client_id', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(49, 'paypal.secret', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(50, 'rave.env', 'staging', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(51, 'rave.publicKey', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(52, 'rave.secretKey', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(53, 'services.instamojo.mode', 'sandbox', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(54, 'services.instamojo.key', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(55, 'services.instamojo.secret', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(56, 'services.razorpay.key', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(57, 'services.razorpay.secret', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(58, 'services.cashfree.mode', 'sandbox', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(59, 'services.cashfree.app_id', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(60, 'services.cashfree.secret', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(61, 'services.payu.mode', 'sandbox', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(62, 'services.payu.key', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(63, 'services.payu.salt', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(64, 'payment_offline_instruction', NULL, '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(65, 'registration_fields', '[]', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(66, 'myTable_length', '10', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(67, 'access_registration', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(68, 'mailchimp_double_opt_in', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(69, 'access_users_change_email', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(70, 'access_users_confirm_email', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(71, 'access_captcha_registration', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(72, 'access_users_requires_approval', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(73, 'services.stripe.active', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(74, 'paypal.active', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(75, 'payment_offline_active', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(76, 'backup.status', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(77, 'retest', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(78, 'onesignal_status', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(79, 'access.users.registration_mail', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(80, 'access.users.order_mail', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(81, 'services.instamojo.active', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(82, 'services.razorpay.active', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(83, 'services.cashfree.active', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(84, 'services.payu.active', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(85, 'flutter.active', '0', '2022-03-30 18:45:42', '2022-03-30 18:45:42'),
(86, 'section1', '2', '2022-04-03 15:21:23', '2022-04-03 15:21:23'),
(87, 'section2', '3', '2022-04-03 15:21:23', '2022-04-03 15:21:23'),
(88, 'section3', '4', '2022-04-03 15:21:23', '2022-04-03 15:21:23'),
(89, 'icon', 'fab fa-facebook-f', '2022-04-03 15:21:23', '2022-04-03 17:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` bigint(20) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - Discount, 2 - Flat Amount',
  `amount` double(8,2) NOT NULL COMMENT 'Percentage or Amount',
  `min_price` double(8,2) NOT NULL DEFAULT 0.00 COMMENT 'Minimum price to allow coupons',
  `expires_at` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `per_user_limit` int(11) NOT NULL DEFAULT 1 COMMENT '0 - Unlimited',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - Disabled, 1 - Enabled, 2 - Expired',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `strike` decimal(15,2) DEFAULT NULL,
  `course_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `featured` int(11) DEFAULT 0,
  `trending` int(11) DEFAULT 0,
  `popular` int(11) DEFAULT 0,
  `meta_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `free` tinyint(4) DEFAULT 0,
  `expire_at` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_student`
--

CREATE TABLE `course_student` (
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `rating` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_timeline`
--

CREATE TABLE `course_timeline` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_user`
--

CREATE TABLE `course_user` (
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `earnings`
--

CREATE TABLE `earnings` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `course_price` decimal(8,2) NOT NULL,
  `amount` decimal(5,2) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disbaled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(10) UNSIGNED DEFAULT NULL,
  `free_lesson` tinyint(4) DEFAULT 1,
  `published` tinyint(4) DEFAULT 0,
  `live_lesson` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lesson_slot_bookings`
--

CREATE TABLE `lesson_slot_bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `live_lesson_slot_id` int(10) UNSIGNED DEFAULT NULL,
  `lesson_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `live_lesson_slots`
--

CREATE TABLE `live_lesson_slots` (
  `id` int(10) UNSIGNED NOT NULL,
  `lesson_id` int(10) UNSIGNED DEFAULT NULL,
  `meeting_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'agenda',
  `start_at` datetime NOT NULL,
  `duration` int(11) NOT NULL COMMENT 'minutes',
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'meeting password',
  `student_limit` int(11) DEFAULT NULL,
  `start_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `join_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

CREATE TABLE `locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr' COMMENT 'ltr - Left to right, rtl - Right to Left',
  `is_default` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locales`
--

INSERT INTO `locales` (`id`, `name`, `short_name`, `display_type`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'ltr', 1, '2022-03-30 15:37:00', '2022-03-30 15:37:00'),
(2, 'Spanish', 'es', 'ltr', 0, '2022-03-30 15:37:00', '2022-03-30 18:45:42'),
(3, 'French', 'fr', 'ltr', 0, '2022-03-30 15:37:00', '2022-03-30 18:45:42'),
(4, 'Arabic', 'ar', 'rtl', 0, '2022-03-30 15:37:00', '2022-03-30 18:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `group` varchar(191) COLLATE utf8mb4_bin NOT NULL,
  `key` text COLLATE utf8mb4_bin NOT NULL,
  `value` text COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, 'en', 'custom-menu', 'nav-menu.blog', 'Blog', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(2, 0, 'en', 'custom-menu', 'nav-menu.courses', 'Courses', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(3, 0, 'en', 'custom-menu', 'nav-menu.bundles', 'Bundles', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(4, 0, 'en', 'custom-menu', 'nav-menu.forums', 'Forums', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(5, 0, 'en', 'custom-menu', 'nav-menu.contact', 'Contact', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(6, 0, 'en', 'custom-menu', 'nav-menu.about-us', 'About Us', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(7, 1, 'en', 'alerts', 'backend.general.created', 'Created successfully.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(8, 1, 'en', 'alerts', 'backend.general.slug_exist', 'Record with same slug exist, please update the slug.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(9, 1, 'en', 'alerts', 'backend.general.error', 'Something went wrong. Try Again', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(10, 1, 'en', 'alerts', 'backend.general.updated', 'Updated successfully.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(11, 1, 'en', 'alerts', 'backend.general.deleted', 'Deleted successfully.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(12, 1, 'en', 'alerts', 'backend.general.restored', 'Restored successfully.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(13, 1, 'en', 'alerts', 'backend.general.cancelled', 'Update Cancelled.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(14, 1, 'en', 'alerts', 'backend.general.unverified', 'Unverified Update files.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(15, 1, 'en', 'alerts', 'backend.general.backup_warning', 'Please fill necessary details for backup', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(16, 1, 'en', 'alerts', 'backend.general.delete_warning', 'You can not delete course. Students are already enrolled. Unpublish the course instead', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(17, 1, 'en', 'alerts', 'backend.general.delete_warning_bundle', 'You can not delete Bundle. Students are already enrolled. Unpublish the Bundle instead', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(18, 1, 'en', 'alerts', 'backend.general.teacher_delete_warning', 'You can not delete teacher. Courses are already added. Change the status instead', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(19, 1, 'en', 'alerts', 'backend.roles.created', 'The role was successfully created.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(20, 1, 'en', 'alerts', 'backend.roles.updated', 'The role was successfully updated.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(21, 1, 'en', 'alerts', 'backend.roles.deleted', 'The role was successfully deleted.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(22, 1, 'en', 'alerts', 'backend.users.cant_resend_confirmation', 'The application is currently set to manually approve users.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(23, 1, 'en', 'alerts', 'backend.users.confirmation_email', 'A new confirmation e-mail has been sent to the address on file.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(24, 1, 'en', 'alerts', 'backend.users.confirmed', 'The user was successfully confirmed.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(25, 1, 'en', 'alerts', 'backend.users.unconfirmed', 'The user was successfully un-confirmed', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(26, 1, 'en', 'alerts', 'backend.users.created', 'The user was successfully created.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(27, 1, 'en', 'alerts', 'backend.users.updated', 'The user was successfully updated.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(28, 1, 'en', 'alerts', 'backend.users.deleted', 'The user was successfully deleted.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(29, 1, 'en', 'alerts', 'backend.users.updated_password', 'The user\'s password was successfully updated.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(30, 1, 'en', 'alerts', 'backend.users.session_cleared', 'The user\'s session was successfully cleared.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(31, 1, 'en', 'alerts', 'backend.users.social_deleted', 'Social Account Successfully Removed', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(32, 1, 'en', 'alerts', 'backend.users.deleted_permanently', 'The user was deleted permanently.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(33, 1, 'en', 'alerts', 'backend.users.restored', 'The user was successfully restored.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(34, 1, 'en', 'alerts', 'backend.stripe_plan.stripe_credentials', 'Stripe credentials not available', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(35, 1, 'en', 'alerts', 'frontend.contact.sent', 'Your information was successfully sent. We will respond back to the e-mail provided as soon as we can.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(36, 1, 'en', 'alerts', 'frontend.course.completed', 'Congratulations! You\'ve successfully completed course. Checkout your certificate in dashboard', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(37, 1, 'en', 'alerts', 'frontend.course.slot_booking', 'Live lesson slot booking successfully', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(38, 1, 'en', 'alerts', 'frontend.course.subscription_plan_expired', 'Your Subscription Plan Expired', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(39, 1, 'en', 'alerts', 'frontend.course.subscription_plan_cancelled', 'Your Subscription Plan Cancelled', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(40, 1, 'en', 'alerts', 'frontend.course.sub_course_limit_over', 'Your Subscription Plan Course Limit Over', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(41, 1, 'en', 'alerts', 'frontend.course.sub_bundle_limit_over', 'Your Subscription Plan Bundle Limit Over', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(42, 1, 'en', 'alerts', 'frontend.course.sub_course_success', 'Course Subscribe Successfully', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(43, 1, 'en', 'alerts', 'frontend.course.sub_bundle_success', 'Bundle Subscribe Successfully', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(44, 1, 'en', 'alerts', 'frontend.course.sub_course_not_access', 'Your Subscription Plan Not Any Course Access', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(45, 1, 'en', 'alerts', 'frontend.course.sub_bundle_not_access', 'Your Subscription Plan Not Any Bundle Access', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(46, 1, 'en', 'alerts', 'frontend.duplicate_course', 'is already course purchased.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(47, 1, 'en', 'alerts', 'frontend.duplicate_bundle', 'is already bundle purchased.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(48, 1, 'en', 'alerts', 'frontend.wishlist.exist', 'This course already in wishlist', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(49, 1, 'en', 'alerts', 'frontend.wishlist.added', 'Course added successfully in wishlist', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(50, 1, 'en', 'auth', 'general_error', 'You do not have access to do that.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(51, 1, 'en', 'auth', 'socialite.unacceptable', ':provider is not an acceptable login type.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(52, 1, 'en', 'auth', 'password_rules', 'Your password must be more than 8 characters long, should contain at least 1 uppercase, 1 lowercase and 1 number.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(53, 1, 'en', 'auth', 'password_used', 'You can not set a password that you have previously used.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(54, 1, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(55, 1, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(56, 1, 'en', 'auth', 'unknown', 'An unknown error occurred', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(57, 1, 'en', 'buttons', 'general.crud.edit', 'Edit', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(58, 1, 'en', 'buttons', 'general.crud.delete', 'Delete', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(59, 1, 'en', 'buttons', 'general.crud.view', 'View', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(60, 1, 'en', 'buttons', 'general.crud.create', 'Create', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(61, 1, 'en', 'buttons', 'general.crud.update', 'Update', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(62, 1, 'en', 'buttons', 'general.crud.generate', 'Generate', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(63, 1, 'en', 'buttons', 'general.cancel', 'Cancel', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(64, 1, 'en', 'buttons', 'general.continue', 'Continue', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(65, 1, 'en', 'buttons', 'general.save', 'Save', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(66, 1, 'en', 'buttons', 'general.view', 'View', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(67, 1, 'en', 'buttons', 'backend.access.users.unconfirm', 'Un-confirm', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(68, 1, 'en', 'buttons', 'backend.access.users.confirm', 'Confirm', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(69, 1, 'en', 'buttons', 'backend.access.users.unlink', 'Unlink', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(70, 1, 'en', 'buttons', 'backend.access.users.login_as', 'Login As :user', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(71, 1, 'en', 'buttons', 'backend.access.users.clear_session', 'Clear Session', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(72, 1, 'en', 'buttons', 'backend.access.users.change_password', 'Change Password', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(73, 1, 'en', 'buttons', 'backend.access.users.activate', 'Activate', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(74, 1, 'en', 'buttons', 'backend.access.users.deactivate', 'Deactivate', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(75, 1, 'en', 'buttons', 'backend.access.users.resend_email', 'Resend Confirmation E-mail', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(76, 1, 'en', 'buttons', 'backend.access.users.delete_permanently', 'Delete Permanently', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(77, 1, 'en', 'buttons', 'backend.access.users.restore_user', 'Restore User', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(78, 1, 'en', 'buttons', 'emails.auth.confirm_account', 'Confirm Account', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(79, 1, 'en', 'buttons', 'emails.auth.reset_password', 'Reset Password', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(80, 1, 'en', 'configmanager', 'title', 'Config Manager', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(81, 1, 'en', 'configmanager', 'info_choose', 'Choose a file to start editing', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(82, 1, 'en', 'configmanager', 'file', 'File', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(83, 1, 'en', 'configmanager', 'path', 'Path', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(84, 1, 'en', 'configmanager', 'header.key', 'Key', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(85, 1, 'en', 'configmanager', 'header.value', 'Value', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(86, 1, 'en', 'configmanager', 'header.actions', 'Actions', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(87, 1, 'en', 'configmanager', 'actions.edit', 'Edit', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(88, 1, 'en', 'configmanager', 'actions.confirm', 'Save new key', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(89, 1, 'en', 'configmanager', 'actions.save', 'Save!', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(90, 1, 'en', 'configmanager', 'actions.cancel', 'Cancel', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(91, 1, 'en', 'configmanager', 'sure', 'Are you sure?', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(92, 1, 'en', 'datatable', 'colvis', 'Column Visibility', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(93, 1, 'en', 'datatable', 'csv', 'CSV', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(94, 1, 'en', 'datatable', 'pdf', 'PDF', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(95, 1, 'en', 'exceptions', 'backend.access.roles.cant_delete_admin', 'You can not delete the Administrator role.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(96, 1, 'en', 'exceptions', 'backend.access.roles.needs_permission', 'You must select at least one permission for this role.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(97, 1, 'en', 'exceptions', 'backend.access.roles.create_error', 'There was a problem creating this role. Please try again.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(98, 1, 'en', 'exceptions', 'backend.access.roles.update_error', 'There was a problem updating this role. Please try again.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(99, 1, 'en', 'exceptions', 'backend.access.roles.already_exists', 'That role already exists. Please choose a different name.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(100, 1, 'en', 'exceptions', 'backend.access.roles.delete_error', 'There was a problem deleting this role. Please try again.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(101, 1, 'en', 'exceptions', 'backend.access.roles.has_users', 'You can not delete a role with associated users.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(102, 1, 'en', 'exceptions', 'backend.access.roles.not_found', 'That role does not exist.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(103, 1, 'en', 'exceptions', 'backend.access.users.already_confirmed', 'This user is already confirmed.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(104, 1, 'en', 'exceptions', 'backend.access.users.cant_delete_own_session', 'You can not delete your own session.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(105, 1, 'en', 'exceptions', 'backend.access.users.session_wrong_driver', 'Your session driver must be set to database to use this feature.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(106, 1, 'en', 'exceptions', 'backend.access.users.social_delete_error', 'There was a problem removing the social account from the user.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(107, 1, 'en', 'exceptions', 'backend.access.users.role_needed_create', 'You must choose at lease one role.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(108, 1, 'en', 'exceptions', 'backend.access.users.create_error', 'There was a problem creating this user. Please try again.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(109, 1, 'en', 'exceptions', 'backend.access.users.update_error', 'There was a problem updating this user. Please try again.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(110, 1, 'en', 'exceptions', 'backend.access.users.update_password_error', 'There was a problem changing this users password. Please try again.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(111, 1, 'en', 'exceptions', 'backend.access.users.cant_deactivate_self', 'You can not do that to yourself.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(112, 1, 'en', 'exceptions', 'backend.access.users.mark_error', 'There was a problem updating this user. Please try again.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(113, 1, 'en', 'exceptions', 'backend.access.users.cant_confirm', 'There was a problem confirming the user account.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(114, 1, 'en', 'exceptions', 'backend.access.users.not_confirmed', 'This user is not confirmed.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(115, 1, 'en', 'exceptions', 'backend.access.users.cant_unconfirm_admin', 'You can not un-confirm the super administrator.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(116, 1, 'en', 'exceptions', 'backend.access.users.cant_unconfirm_self', 'You can not un-confirm yourself.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(117, 1, 'en', 'exceptions', 'backend.access.users.delete_first', 'This user must be deleted first before it can be destroyed permanently.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(118, 1, 'en', 'exceptions', 'backend.access.users.delete_error', 'There was a problem deleting this user. Please try again.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(119, 1, 'en', 'exceptions', 'backend.access.users.cant_restore', 'This user is not deleted so it can not be restored.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(120, 1, 'en', 'exceptions', 'backend.access.users.restore_error', 'There was a problem restoring this user. Please try again.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(121, 1, 'en', 'exceptions', 'backend.access.users.email_error', 'That email address belongs to a different user.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(122, 1, 'en', 'exceptions', 'backend.access.users.not_found', 'That user does not exist.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(123, 1, 'en', 'exceptions', 'backend.access.users.cant_delete_admin', 'You can not delete the super administrator.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(124, 1, 'en', 'exceptions', 'backend.access.users.cant_delete_self', 'You can not delete yourself.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(125, 1, 'en', 'exceptions', 'backend.access.users.role_needed', 'You must choose at least one role.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(126, 1, 'en', 'exceptions', 'frontend.auth.confirmation.success', 'Your account has been successfully confirmed!', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(127, 1, 'en', 'exceptions', 'frontend.auth.confirmation.already_confirmed', 'Your account is already confirmed.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(128, 1, 'en', 'exceptions', 'frontend.auth.confirmation.resent', 'A new confirmation e-mail has been sent to the address on file.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(129, 1, 'en', 'exceptions', 'frontend.auth.confirmation.pending', 'Your account is currently pending approval.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(130, 1, 'en', 'exceptions', 'frontend.auth.confirmation.resend', 'Your account is not confirmed. Please click the confirmation link in your e-mail, or <a href=\":url\">click here</a> to resend the confirmation e-mail.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(131, 1, 'en', 'exceptions', 'frontend.auth.confirmation.confirm', 'Confirm your account!', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(132, 1, 'en', 'exceptions', 'frontend.auth.confirmation.mismatch', 'Your confirmation code does not match.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(133, 1, 'en', 'exceptions', 'frontend.auth.confirmation.created_pending', 'Your account was successfully created and is pending approval. An e-mail will be sent when your account is approved.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(134, 1, 'en', 'exceptions', 'frontend.auth.confirmation.created_confirm', 'Your account was successfully created. We have sent you an e-mail to confirm your account.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(135, 1, 'en', 'exceptions', 'frontend.auth.confirmation.not_found', 'That confirmation code does not exist.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(136, 1, 'en', 'exceptions', 'frontend.auth.deactivated', 'Your account has been deactivated.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(137, 1, 'en', 'exceptions', 'frontend.auth.password.reset_problem', 'There was a problem resetting your password. Please resend the password reset email.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(138, 1, 'en', 'exceptions', 'frontend.auth.password.change_mismatch', 'That is not your old password.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(139, 1, 'en', 'exceptions', 'frontend.auth.email_taken', 'That e-mail address is already taken.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(140, 1, 'en', 'exceptions', 'frontend.auth.registration_disabled', 'Registration is currently closed.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(141, 1, 'en', 'http', '404.description2', ' It looks like nothing was found at this location.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(142, 1, 'en', 'http', '404.title', 'Page Not Found', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(143, 1, 'en', 'http', '404.title2', '404', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(144, 1, 'en', 'http', '404.back', 'Back To HomePage', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(145, 1, 'en', 'http', '404.description', 'THIS IS SOMEWHAT EMBARRASSING, ISN’T IT?', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(146, 1, 'en', 'http', '503.title', 'Be right back.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(147, 1, 'en', 'http', '503.description', 'Be right back.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(148, 1, 'en', 'labels', 'backend.courses.title', 'Courses', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(149, 1, 'en', 'labels', 'backend.courses.fields.published', 'Published', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(150, 1, 'en', 'labels', 'backend.courses.fields.unpublished', 'Not Published', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(151, 1, 'en', 'labels', 'backend.courses.fields.featured', 'Featured', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(152, 1, 'en', 'labels', 'backend.courses.fields.free', 'Free', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(153, 1, 'en', 'labels', 'backend.courses.fields.trending', 'Trending', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(154, 1, 'en', 'labels', 'backend.courses.fields.popular', 'Popular', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(155, 1, 'en', 'labels', 'backend.courses.fields.teachers', 'Teachers', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(156, 1, 'en', 'labels', 'backend.courses.fields.category', 'Category', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(157, 1, 'en', 'labels', 'backend.courses.fields.title', 'Title', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(158, 1, 'en', 'labels', 'backend.courses.fields.slug', 'Slug', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(159, 1, 'en', 'labels', 'backend.courses.fields.description', 'Description', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(160, 1, 'en', 'labels', 'backend.courses.fields.price', 'Price', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(161, 1, 'en', 'labels', 'backend.courses.fields.strike', 'Strike Price', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(162, 1, 'en', 'labels', 'backend.courses.fields.course_image', 'Course Image', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(163, 1, 'en', 'labels', 'backend.courses.fields.start_date', 'Start Date', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(164, 1, 'en', 'labels', 'backend.courses.fields.meta_title', 'Meta Title', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(165, 1, 'en', 'labels', 'backend.courses.fields.meta_description', 'Meta Description', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(166, 1, 'en', 'labels', 'backend.courses.fields.meta_keywords', 'Meta Keywords', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(167, 1, 'en', 'labels', 'backend.courses.fields.sidebar', 'Add Sidebar', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(168, 1, 'en', 'labels', 'backend.courses.fields.lessons.add', 'Add Lessons', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(169, 1, 'en', 'labels', 'backend.courses.fields.lessons.view', 'View Lessons', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(170, 1, 'en', 'labels', 'backend.courses.fields.course', 'Course', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(171, 1, 'en', 'labels', 'backend.courses.fields.status', 'Status', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(172, 1, 'en', 'labels', 'backend.courses.fields.expire_at', 'Expire / Disable Course Date', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(173, 1, 'en', 'labels', 'backend.courses.add_teachers', 'Add Teachers', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(174, 1, 'en', 'labels', 'backend.courses.add_categories', 'Add Categories', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(175, 1, 'en', 'labels', 'backend.courses.slug_placeholder', 'Input slug or it will be generated automatically', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(176, 1, 'en', 'labels', 'backend.courses.select_category', 'Select Category', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(177, 1, 'en', 'labels', 'backend.courses.select_teachers', 'Select Teachers', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(178, 1, 'en', 'labels', 'backend.courses.test', 'Test', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(179, 1, 'en', 'labels', 'backend.courses.lesson', 'Lesson', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(180, 1, 'en', 'labels', 'backend.courses.create', 'Create Course', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(181, 1, 'en', 'labels', 'backend.courses.edit', 'Edit Course', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(182, 1, 'en', 'labels', 'backend.courses.view', 'View Courses', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(183, 1, 'en', 'labels', 'backend.courses.category', 'Category', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(184, 1, 'en', 'labels', 'backend.courses.save_timeline', 'Save timeline', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(185, 1, 'en', 'labels', 'backend.courses.course_timeline', 'Course timeline', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(186, 1, 'en', 'labels', 'backend.courses.timeline_description', 'Drag and change sequence of Lessons/Tests for course', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(187, 1, 'en', 'labels', 'backend.courses.listing_note', 'Only Published Lessons and Tests will be Displayed and Sorted.', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(188, 1, 'en', 'labels', 'backend.tests.title', 'Tests', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(189, 1, 'en', 'labels', 'backend.tests.fields.course', 'Course', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(190, 1, 'en', 'labels', 'backend.tests.fields.lesson', 'Lesson', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(191, 1, 'en', 'labels', 'backend.tests.fields.title', 'Title', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(192, 1, 'en', 'labels', 'backend.tests.fields.description', 'Description', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(193, 1, 'en', 'labels', 'backend.tests.fields.published', 'Published', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(194, 1, 'en', 'labels', 'backend.tests.fields.questions', 'Questions', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(195, 1, 'en', 'labels', 'backend.tests.create', 'Create Test', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(196, 1, 'en', 'labels', 'backend.tests.edit', 'Edit Test', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(197, 1, 'en', 'labels', 'backend.tests.view', 'View Tests', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(198, 1, 'en', 'labels', 'backend.orders.fields.payment_status.pending', 'Pending', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(199, 1, 'en', 'labels', 'backend.orders.fields.payment_status.completed', 'Completed', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(200, 1, 'en', 'labels', 'backend.orders.fields.payment_status.failed', 'Failed', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(201, 1, 'en', 'labels', 'backend.orders.fields.payment_status.title', 'Payment', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(202, 1, 'en', 'labels', 'backend.orders.fields.payment_type.stripe', 'Credit / Debit Card (Stripe Payment Gateway)', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(203, 1, 'en', 'labels', 'backend.orders.fields.payment_type.paypal', 'Paypal', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(204, 1, 'en', 'labels', 'backend.orders.fields.payment_type.offline', 'Offline', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(205, 1, 'en', 'labels', 'backend.orders.fields.payment_type.title', 'Payment Type', '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(206, 1, 'en', 'labels', 'backend.orders.fields.reference_no', 'Reference No.', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(207, 1, 'en', 'labels', 'backend.orders.fields.ordered_by', 'Ordered By', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(208, 1, 'en', 'labels', 'backend.orders.fields.items', 'Items', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(209, 1, 'en', 'labels', 'backend.orders.fields.amount', 'Amount', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(210, 1, 'en', 'labels', 'backend.orders.fields.user_email', 'User Email', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(211, 1, 'en', 'labels', 'backend.orders.fields.date', 'Order date', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(212, 1, 'en', 'labels', 'backend.orders.complete', 'Complete Manually', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(213, 1, 'en', 'labels', 'backend.orders.offline_requests', 'Offline Requests', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(214, 1, 'en', 'labels', 'backend.orders.view_invoice', 'View Invoice', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(215, 1, 'en', 'labels', 'backend.orders.download_invoice', 'Download Invoice', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(216, 1, 'en', 'labels', 'backend.orders.title', 'Orders', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(217, 1, 'en', 'labels', 'backend.pages.fields.published', 'Published', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(218, 1, 'en', 'labels', 'backend.pages.fields.drafted', 'Drafted', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(219, 1, 'en', 'labels', 'backend.pages.fields.title', 'Title', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(220, 1, 'en', 'labels', 'backend.pages.fields.slug', 'Slug', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(221, 1, 'en', 'labels', 'backend.pages.fields.featured_image', 'Featured image', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(222, 1, 'en', 'labels', 'backend.pages.fields.content', 'Content', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(223, 1, 'en', 'labels', 'backend.pages.fields.meta_title', 'Meta Title', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(224, 1, 'en', 'labels', 'backend.pages.fields.meta_description', 'Meta Description', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(225, 1, 'en', 'labels', 'backend.pages.fields.meta_keywords', 'Meta Keywords', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(226, 1, 'en', 'labels', 'backend.pages.fields.clear', 'Clear', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(227, 1, 'en', 'labels', 'backend.pages.fields.status', 'Status', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(228, 1, 'en', 'labels', 'backend.pages.fields.created', 'Created', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(229, 1, 'en', 'labels', 'backend.pages.fields.created_at', 'Created On', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(230, 1, 'en', 'labels', 'backend.pages.max_file_size', '(max file size 10MB)', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(231, 1, 'en', 'labels', 'backend.pages.title', 'Pages', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(232, 1, 'en', 'labels', 'backend.pages.create', 'Create Page', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(233, 1, 'en', 'labels', 'backend.pages.edit', 'Edit Page', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(234, 1, 'en', 'labels', 'backend.pages.view', 'View Pages', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(235, 1, 'en', 'labels', 'backend.access.users.user_actions', 'User Actions', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(236, 1, 'en', 'labels', 'backend.access.users.management', 'User Management', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(237, 1, 'en', 'labels', 'backend.access.users.change_password', 'Change Password', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(238, 1, 'en', 'labels', 'backend.access.users.change_password_for', 'Change Password for :user', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(239, 1, 'en', 'labels', 'backend.access.users.create', 'Create User', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(240, 1, 'en', 'labels', 'backend.access.users.table.abilities', 'Abilities', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(241, 1, 'en', 'labels', 'backend.access.users.table.total', 'user total|users total', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(242, 1, 'en', 'labels', 'backend.access.users.table.confirmed', 'Confirmed', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(243, 1, 'en', 'labels', 'backend.access.users.table.created', 'Created', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(244, 1, 'en', 'labels', 'backend.access.users.table.email', 'E-mail', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(245, 1, 'en', 'labels', 'backend.access.users.table.id', 'ID', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(246, 1, 'en', 'labels', 'backend.access.users.table.last_updated', 'Last Updated', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(247, 1, 'en', 'labels', 'backend.access.users.table.name', 'Name', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(248, 1, 'en', 'labels', 'backend.access.users.table.first_name', 'First Name', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(249, 1, 'en', 'labels', 'backend.access.users.table.last_name', 'Last Name', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(250, 1, 'en', 'labels', 'backend.access.users.table.no_deactivated', 'No Deactivated Users', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(251, 1, 'en', 'labels', 'backend.access.users.table.no_deleted', 'No Deleted Users', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(252, 1, 'en', 'labels', 'backend.access.users.table.other_permissions', 'Other Permissions', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(253, 1, 'en', 'labels', 'backend.access.users.table.permissions', 'Permissions', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(254, 1, 'en', 'labels', 'backend.access.users.table.roles', 'Roles', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(255, 1, 'en', 'labels', 'backend.access.users.table.social', 'Social', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(256, 1, 'en', 'labels', 'backend.access.users.table.status', 'Status', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(257, 1, 'en', 'labels', 'backend.access.users.all_permissions', 'All Permissions', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(258, 1, 'en', 'labels', 'backend.access.users.deactivated', 'Deactivated Users', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(259, 1, 'en', 'labels', 'backend.access.users.deleted', 'Deleted Users', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(260, 1, 'en', 'labels', 'backend.access.users.edit', 'Edit User', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(261, 1, 'en', 'labels', 'backend.access.users.active', 'Active Users', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(262, 1, 'en', 'labels', 'backend.access.users.view', 'View User', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(263, 1, 'en', 'labels', 'backend.access.users.tabs.titles.overview', 'Overview', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(264, 1, 'en', 'labels', 'backend.access.users.tabs.titles.history', 'History', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(265, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.avatar', 'Avatar', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(266, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.confirmed', 'Confirmed', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(267, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.created_at', 'Created At', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(268, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.deleted_at', 'Deleted At', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(269, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.email', 'E-mail', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(270, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.last_login_at', 'Last Login At', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(271, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.last_login_ip', 'Last Login IP', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(272, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.last_updated', 'Last Updated', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(273, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.name', 'Name', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(274, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.first_name', 'First Name', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(275, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.last_name', 'Last Name', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(276, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.status', 'Status', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(277, 1, 'en', 'labels', 'backend.access.users.tabs.content.overview.timezone', 'Timezone', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(278, 1, 'en', 'labels', 'backend.access.users.no_permissions', 'No Permissions', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(279, 1, 'en', 'labels', 'backend.access.users.no_roles', 'No Roles to set.', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(280, 1, 'en', 'labels', 'backend.access.users.permissions', 'Permissions', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(281, 1, 'en', 'labels', 'backend.access.users.select_role', 'Select Role', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(282, 1, 'en', 'labels', 'backend.access.roles.management', 'Role Management', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(283, 1, 'en', 'labels', 'backend.access.roles.create', 'Create Role', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(284, 1, 'en', 'labels', 'backend.access.roles.edit', 'Edit Role', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(285, 1, 'en', 'labels', 'backend.access.roles.table.total', 'role total|roles total', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(286, 1, 'en', 'labels', 'backend.access.roles.table.number_of_users', 'Number of Users', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(287, 1, 'en', 'labels', 'backend.access.roles.table.permissions', 'Permissions', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(288, 1, 'en', 'labels', 'backend.access.roles.table.role', 'Role', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(289, 1, 'en', 'labels', 'backend.access.roles.table.sort', 'Sort', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(290, 1, 'en', 'labels', 'backend.blogs.fields.title', 'Title', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(291, 1, 'en', 'labels', 'backend.blogs.fields.category', 'Category', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(292, 1, 'en', 'labels', 'backend.blogs.fields.slug', 'Slug', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(293, 1, 'en', 'labels', 'backend.blogs.fields.featured_image', 'Featured image', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(294, 1, 'en', 'labels', 'backend.blogs.fields.content', 'Content', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(295, 1, 'en', 'labels', 'backend.blogs.fields.tags_placeholder', 'Add tags here', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(296, 1, 'en', 'labels', 'backend.blogs.fields.meta_title', 'Meta Title', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(297, 1, 'en', 'labels', 'backend.blogs.fields.meta_description', 'Meta Description', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(298, 1, 'en', 'labels', 'backend.blogs.fields.meta_keywords', 'Meta Keywords', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(299, 1, 'en', 'labels', 'backend.blogs.fields.publish', 'Publish', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(300, 1, 'en', 'labels', 'backend.blogs.fields.clear', 'Clear', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(301, 1, 'en', 'labels', 'backend.blogs.fields.status', 'Status', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(302, 1, 'en', 'labels', 'backend.blogs.fields.views', 'Views', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(303, 1, 'en', 'labels', 'backend.blogs.fields.created', 'Created', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(304, 1, 'en', 'labels', 'backend.blogs.fields.comments', 'Comments', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(305, 1, 'en', 'labels', 'backend.blogs.fields.tags', 'Tags', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(306, 1, 'en', 'labels', 'backend.blogs.fields.created_at', 'Created On', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(307, 1, 'en', 'labels', 'backend.blogs.max_file_size', '(max file size 10MB)', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(308, 1, 'en', 'labels', 'backend.blogs.title', 'Blog', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(309, 1, 'en', 'labels', 'backend.blogs.create', 'Create Blog', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(310, 1, 'en', 'labels', 'backend.blogs.edit', 'Edit Blog', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(311, 1, 'en', 'labels', 'backend.blogs.view', 'View Blogs', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(312, 1, 'en', 'labels', 'backend.lessons.slug_placeholder', 'Input slug or it will be generated automatically', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(313, 1, 'en', 'labels', 'backend.lessons.fields.course', 'Course', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(314, 1, 'en', 'labels', 'backend.lessons.fields.title', 'Title', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(315, 1, 'en', 'labels', 'backend.lessons.fields.slug', 'Slug', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(316, 1, 'en', 'labels', 'backend.lessons.fields.lesson_image', 'Lesson Image', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(317, 1, 'en', 'labels', 'backend.lessons.fields.short_text', 'Short Text', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(318, 1, 'en', 'labels', 'backend.lessons.fields.full_text', 'Full Text', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(319, 1, 'en', 'labels', 'backend.lessons.fields.downloadable_files', 'Downloadable Files', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(320, 1, 'en', 'labels', 'backend.lessons.fields.free_lesson', 'Free Lesson', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(321, 1, 'en', 'labels', 'backend.lessons.fields.published', 'Published', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(322, 1, 'en', 'labels', 'backend.lessons.fields.position', 'Position', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(323, 1, 'en', 'labels', 'backend.lessons.fields.youtube_videos', 'YouTube Videos', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(324, 1, 'en', 'labels', 'backend.lessons.fields.add_pdf', 'Add PDF', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(325, 1, 'en', 'labels', 'backend.lessons.fields.add_video', 'Add Video', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(326, 1, 'en', 'labels', 'backend.lessons.fields.add_subtitle', 'Add Subtitle', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(327, 1, 'en', 'labels', 'backend.lessons.fields.media_video', 'Media Video', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(328, 1, 'en', 'labels', 'backend.lessons.fields.media_audio', 'Media Audio', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(329, 1, 'en', 'labels', 'backend.lessons.fields.media_pdf', 'Media PDF', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(330, 1, 'en', 'labels', 'backend.lessons.fields.add_audio', 'Add Audio', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(331, 1, 'en', 'labels', 'backend.lessons.max_file_size', '(max file size 5MB)', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(332, 1, 'en', 'labels', 'backend.lessons.short_description_placeholder', 'Input short description of lesson', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(333, 1, 'en', 'labels', 'backend.lessons.select_course', 'Select Course', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(334, 1, 'en', 'labels', 'backend.lessons.yt_note', '<b>Instructions to add Video link: </b><br> Go to youtube -> open video -> right click on video and <b>Copy Video URL</b> and paste here.<br> If you want to add multiple videos, then separate them with <b>,</b> (Comma) Sign.', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(335, 1, 'en', 'labels', 'backend.lessons.vimeo_note', '<b>Instructions to add Video link: </b><br> Go to vimeo -> open video -> right click on video and <b>Copy Video URL</b> and paste here.<br> If you want to add multiple videos, then separate them with <b>,</b> (Comma) Sign.', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(336, 1, 'en', 'labels', 'backend.lessons.title', 'Lessons', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(337, 1, 'en', 'labels', 'backend.lessons.enter_video_url', 'Enter video data', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(338, 1, 'en', 'labels', 'backend.lessons.enter_video_embed_code', 'Enter video embed code', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(339, 1, 'en', 'labels', 'backend.lessons.create', 'Create Lesson', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(340, 1, 'en', 'labels', 'backend.lessons.edit', 'Edit Lesson', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(341, 1, 'en', 'labels', 'backend.lessons.view', 'View Lessons', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(342, 1, 'en', 'labels', 'backend.lessons.video_guide', '<p class=\"mb-1\"><b>Youtube :</b> Go to Youtube -> Go to video you want to display -> click on share button below video. Copy that links and paste in above text box </p>\r\n<p class=\"mb-1\"><b>Vimeo :</b> Go to Vimeo -> Go to video you want to display -> click on share button and copy paste video url here </p>\r\n<p class=\"mb-1\"><b>Upload :</b> Upload <b>mp4</b> file in file input</p>\r\n<p class=\"mb-1\"><b>Embed :</b> Copy / Paste embed code in above text box</p>', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(343, 1, 'en', 'labels', 'backend.lessons.remove', 'Remove', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(344, 1, 'en', 'labels', 'backend.categories.fields.name', 'Name', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(345, 1, 'en', 'labels', 'backend.categories.fields.select_icon', 'Select Icon', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(346, 1, 'en', 'labels', 'backend.categories.fields.image', 'Image', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(347, 1, 'en', 'labels', 'backend.categories.fields.icon', 'Icon', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(348, 1, 'en', 'labels', 'backend.categories.fields.icon_type.title', 'Icon type', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(349, 1, 'en', 'labels', 'backend.categories.fields.icon_type.select_any', 'Select Any', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(350, 1, 'en', 'labels', 'backend.categories.fields.icon_type.image', 'Upload image', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(351, 1, 'en', 'labels', 'backend.categories.fields.icon_type.icon', 'Select Icon', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(352, 1, 'en', 'labels', 'backend.categories.fields.or', 'Or', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(353, 1, 'en', 'labels', 'backend.categories.fields.slug', 'Slug', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(354, 1, 'en', 'labels', 'backend.categories.fields.courses', 'Courses', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(355, 1, 'en', 'labels', 'backend.categories.fields.status', 'Status', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(356, 1, 'en', 'labels', 'backend.categories.fields.blog', 'Blog', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(357, 1, 'en', 'labels', 'backend.categories.title', 'Categories', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(358, 1, 'en', 'labels', 'backend.categories.create', 'Create Category', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(359, 1, 'en', 'labels', 'backend.categories.edit', 'Edit Category', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(360, 1, 'en', 'labels', 'backend.categories.view', 'View Categories', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(361, 1, 'en', 'labels', 'backend.categories.not_allowed', 'Not allowed! Category contains data.', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(362, 1, 'en', 'labels', 'backend.faqs.fields.question', 'Question', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(363, 1, 'en', 'labels', 'backend.faqs.fields.answer', 'Answer', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(364, 1, 'en', 'labels', 'backend.faqs.fields.category', 'Category', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(365, 1, 'en', 'labels', 'backend.faqs.fields.status', 'Status', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(366, 1, 'en', 'labels', 'backend.faqs.title', 'FAQs', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(367, 1, 'en', 'labels', 'backend.faqs.create', 'Create FAQ', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(368, 1, 'en', 'labels', 'backend.faqs.edit', 'Edit FAQ', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(369, 1, 'en', 'labels', 'backend.faqs.view', 'View FAQs', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(370, 1, 'en', 'labels', 'backend.invoices.fields.view', 'View', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(371, 1, 'en', 'labels', 'backend.invoices.fields.download', 'Download', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(372, 1, 'en', 'labels', 'backend.invoices.fields.order_date', 'Order Date', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(373, 1, 'en', 'labels', 'backend.invoices.fields.amount', 'Amount', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(374, 1, 'en', 'labels', 'backend.invoices.title', 'Invoices', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(375, 1, 'en', 'labels', 'backend.menu-manager.title', 'Menu Manager', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(376, 1, 'en', 'labels', 'backend.messages.compose', 'Compose', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(377, 1, 'en', 'labels', 'backend.messages.search_user', 'Search User', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(378, 1, 'en', 'labels', 'backend.messages.select_recipients', 'Select Recipients', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(379, 1, 'en', 'labels', 'backend.messages.start_conversation', 'Start a conversation', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(380, 1, 'en', 'labels', 'backend.messages.type_a_message', 'Type a message', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(381, 1, 'en', 'labels', 'backend.messages.title', 'Messages', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(382, 1, 'en', 'labels', 'backend.questions.fields.question', 'Question', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(383, 1, 'en', 'labels', 'backend.questions.fields.question_image', 'Question Image', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(384, 1, 'en', 'labels', 'backend.questions.fields.score', 'Score', '2022-03-30 15:37:04', '2022-03-30 15:37:04');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(385, 1, 'en', 'labels', 'backend.questions.fields.tests', 'Tests', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(386, 1, 'en', 'labels', 'backend.questions.fields.option_text', 'Option Text', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(387, 1, 'en', 'labels', 'backend.questions.fields.correct', 'Correct', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(388, 1, 'en', 'labels', 'backend.questions.fields.course', 'Course', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(389, 1, 'en', 'labels', 'backend.questions.fields.lesson', 'Lesson', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(390, 1, 'en', 'labels', 'backend.questions.fields.title', 'Title', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(391, 1, 'en', 'labels', 'backend.questions.fields.option_explanation', 'Option Explanation', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(392, 1, 'en', 'labels', 'backend.questions.title', 'Questions', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(393, 1, 'en', 'labels', 'backend.questions.create', 'Create Question', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(394, 1, 'en', 'labels', 'backend.questions.edit', 'Edit Question', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(395, 1, 'en', 'labels', 'backend.questions.view', 'View Questions', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(396, 1, 'en', 'labels', 'backend.questions.test', 'Test', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(397, 1, 'en', 'labels', 'backend.reasons.fields.title', 'Title', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(398, 1, 'en', 'labels', 'backend.reasons.fields.icon', 'Icon', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(399, 1, 'en', 'labels', 'backend.reasons.fields.content', 'Content', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(400, 1, 'en', 'labels', 'backend.reasons.fields.status', 'Status', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(401, 1, 'en', 'labels', 'backend.reasons.title', 'Reasons', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(402, 1, 'en', 'labels', 'backend.reasons.create', 'Create Reason', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(403, 1, 'en', 'labels', 'backend.reasons.edit', 'Edit Reason', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(404, 1, 'en', 'labels', 'backend.reasons.view', 'View Reasons', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(405, 1, 'en', 'labels', 'backend.reasons.note', 'Reasons will be displayed as a slider on homepage as below', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(406, 1, 'en', 'labels', 'backend.general_settings.title', 'General', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(407, 1, 'en', 'labels', 'backend.general_settings.contact.short_text', 'Short Text', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(408, 1, 'en', 'labels', 'backend.general_settings.contact.show', 'Show', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(409, 1, 'en', 'labels', 'backend.general_settings.contact.primary_address', 'Primary Address', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(410, 1, 'en', 'labels', 'backend.general_settings.contact.secondary_address', 'Secondary Address', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(411, 1, 'en', 'labels', 'backend.general_settings.contact.primary_phone', 'Primary Phone', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(412, 1, 'en', 'labels', 'backend.general_settings.contact.secondary_phone', 'Secondary Phone', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(413, 1, 'en', 'labels', 'backend.general_settings.contact.primary_email', 'Primary Email', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(414, 1, 'en', 'labels', 'backend.general_settings.contact.secondary_email', 'Secondary Email', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(415, 1, 'en', 'labels', 'backend.general_settings.contact.location_on_map', 'Location on Map', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(416, 1, 'en', 'labels', 'backend.general_settings.contact.map_note', '<h3>How to embed Location for Map?</h3>\r\n                                <p>Do following simple steps and you are good to go:</p>\r\n                                <ol class=\"map-guide\">\r\n                                    <li>Go to <a class=\"text-bold\" target=\"_blank\" href=\"//maps.google.com\">Google Map</a> </li>\r\n                                    <li>Search the place you want to add by Entering address / location in input box located on upper-left corner</li>\r\n                                    <li>Once you get the place you want. It shows details in left sidebar. Click on <i class=\"fa fa-share-alt text-primary\"></i> button</li>\r\n                                    <li>A popup will appear which will have two tabs <b>Send a link</b> and <b>Embed a Map</b></li>\r\n                                    <li>Click on <b>Embed a map</b> It will show you chosen Place on Map</li>\r\n                                    <li>Now click on the dropdown from the left. By default <b>Medium</b> is selected. Click on it and Select <b>Large</b></li>\r\n                                    <li>Now Click on <b class=\"text-primary\">COPY HTML</b> link from it and <b>Paste</b> that code here in <b>Location on Map</b>.</li>\r\n                                </ol>', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(417, 1, 'en', 'labels', 'backend.general_settings.contact.title', 'Contact', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(418, 1, 'en', 'labels', 'backend.general_settings.contact.primary_email_note', 'This email will be used to correspond \"Contact Us\" emails', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(419, 1, 'en', 'labels', 'backend.general_settings.footer.short_description', 'Short Description', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(420, 1, 'en', 'labels', 'backend.general_settings.footer.popular_categories', 'Popular categories', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(421, 1, 'en', 'labels', 'backend.general_settings.footer.featured_courses', 'Featured courses', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(422, 1, 'en', 'labels', 'backend.general_settings.footer.trending_courses', 'Trending courses', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(423, 1, 'en', 'labels', 'backend.general_settings.footer.popular_courses', 'Popular courses', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(424, 1, 'en', 'labels', 'backend.general_settings.footer.custom_links', 'Custom Links', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(425, 1, 'en', 'labels', 'backend.general_settings.footer.social_links', 'Social Links', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(426, 1, 'en', 'labels', 'backend.general_settings.footer.link_url', 'URL', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(427, 1, 'en', 'labels', 'backend.general_settings.footer.social_links_note', 'Add social link URL and select Icon for that media from iconpicker. Click on <b>ADD +</b> button. And your social link will be created. You can also delete them by clicking on <b><i class=\"fa fa-times\"></i></b> button', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(428, 1, 'en', 'labels', 'backend.general_settings.footer.newsletter_form', 'Newsletter Form', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(429, 1, 'en', 'labels', 'backend.general_settings.footer.bottom_footer', 'Bottom Footer', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(430, 1, 'en', 'labels', 'backend.general_settings.footer.bottom_footer_note', 'Note : it includes Copyright text and Footer links', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(431, 1, 'en', 'labels', 'backend.general_settings.footer.copyright_text', 'Copyright Text', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(432, 1, 'en', 'labels', 'backend.general_settings.footer.footer_links', 'Footer Links', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(433, 1, 'en', 'labels', 'backend.general_settings.footer.link_label', 'Label', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(434, 1, 'en', 'labels', 'backend.general_settings.footer.link', 'Link', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(435, 1, 'en', 'labels', 'backend.general_settings.footer.title', 'Footer', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(436, 1, 'en', 'labels', 'backend.general_settings.footer.section_1', 'Section 1', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(437, 1, 'en', 'labels', 'backend.general_settings.footer.section_2', 'Section 2', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(438, 1, 'en', 'labels', 'backend.general_settings.footer.section_3', 'Section 3', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(439, 1, 'en', 'labels', 'backend.general_settings.footer.recent_news', 'Recent News', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(440, 1, 'en', 'labels', 'backend.general_settings.logos.title', 'Logos', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(441, 1, 'en', 'labels', 'backend.general_settings.layout.title', 'Layout', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(442, 1, 'en', 'labels', 'backend.general_settings.email.title', 'Mail Configuration', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(443, 1, 'en', 'labels', 'backend.general_settings.email.mail_from_name', 'Mail From Name', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(444, 1, 'en', 'labels', 'backend.general_settings.email.mail_from_name_note', 'This will be display name for your sent email.', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(445, 1, 'en', 'labels', 'backend.general_settings.email.mail_from_address', 'Mail From Address', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(446, 1, 'en', 'labels', 'backend.general_settings.email.mail_from_address_note', 'This email will be used for \"Contact Form\" correspondence.', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(447, 1, 'en', 'labels', 'backend.general_settings.email.mail_driver', 'Mail Driver', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(448, 1, 'en', 'labels', 'backend.general_settings.email.mail_driver_note', 'You can select any driver you want for your Mail setup. <b>Ex. SMTP, Mailgun, Mandrill, SparkPost, Amazon SES etc.</b><br> Add <b>single driver only</b>.', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(449, 1, 'en', 'labels', 'backend.general_settings.email.mail_host', 'Mail HOST', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(450, 1, 'en', 'labels', 'backend.general_settings.email.mail_port', 'Mail PORT', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(451, 1, 'en', 'labels', 'backend.general_settings.email.mail_username', 'Mail Username', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(452, 1, 'en', 'labels', 'backend.general_settings.email.mail_username_note', 'Add your email id you want to configure for sending emails', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(453, 1, 'en', 'labels', 'backend.general_settings.email.mail_password', 'Mail Password', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(454, 1, 'en', 'labels', 'backend.general_settings.email.mail_password_note', 'Add your email password you want to configure for sending emails', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(455, 1, 'en', 'labels', 'backend.general_settings.email.mail_encryption', 'Mail Encryption', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(456, 1, 'en', 'labels', 'backend.general_settings.email.mail_encryption_note', 'Use <b>tls</b> if your site uses <b>HTTP</b> protocol and <b>ssl</b> if you site uses <b>HTTPS</b> protocol', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(457, 1, 'en', 'labels', 'backend.general_settings.email.note', '<b>Important Note</b> : IF you are using <b>GMAIL</b> for Mail configuration, make sure you have completed following process before updating:\r\n <ul>\r\n<li>Go to <a target=\"_blank\" href=\"https://myaccount.google.com/security\">My Account</a> from your Google Account you want to configure and Login</li>\r\n<li>Scroll down to <b>Less secure app access</b> and set it <b>ON</b></li>\r\n</ul>', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(458, 1, 'en', 'labels', 'backend.general_settings.payment_settings.title', 'Payment Configuration', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(459, 1, 'en', 'labels', 'backend.general_settings.payment_settings.select_currency', 'Select Currency', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(460, 1, 'en', 'labels', 'backend.general_settings.payment_settings.stripe', 'Stripe Payment Method', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(461, 1, 'en', 'labels', 'backend.general_settings.payment_settings.stripe_note', 'Enables payments in site with Debit / Credit Cards', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(462, 1, 'en', 'labels', 'backend.general_settings.payment_settings.paypal', 'Paypal Payment Method', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(463, 1, 'en', 'labels', 'backend.general_settings.payment_settings.paypal_note', 'Redirects to paypal for payment', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(464, 1, 'en', 'labels', 'backend.general_settings.payment_settings.offline_mode', 'Offline Payment Method', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(465, 1, 'en', 'labels', 'backend.general_settings.payment_settings.offline_mode_note', 'User gets assistance for offline payment via admin', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(466, 1, 'en', 'labels', 'backend.general_settings.payment_settings.offline_mode_instruction', 'Enter offline payment instructions', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(467, 1, 'en', 'labels', 'backend.general_settings.payment_settings.key', 'API Key', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(468, 1, 'en', 'labels', 'backend.general_settings.payment_settings.secret', 'API Secret', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(469, 1, 'en', 'labels', 'backend.general_settings.payment_settings.client_id', 'Client ID', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(470, 1, 'en', 'labels', 'backend.general_settings.payment_settings.client_secret', 'Secret', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(471, 1, 'en', 'labels', 'backend.general_settings.payment_settings.mode', 'Mode', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(472, 1, 'en', 'labels', 'backend.general_settings.payment_settings.sandbox', 'Sandbox', '2022-03-30 15:37:04', '2022-03-30 15:37:04'),
(473, 1, 'en', 'labels', 'backend.general_settings.payment_settings.live', 'Live', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(474, 1, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_stripe', 'How to get STRIPE API Credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(475, 1, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_paypal', 'How to get PayPal API Credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(476, 1, 'en', 'labels', 'backend.general_settings.payment_settings.mode_note', '<b>Sandbox</b>= Will be used for testing payments with PayPal Test Credentials. Account with USD only can make payments with PayPal for now. This options will redirect to test PayPal payment with Sandbox User Credentials. It will be used for dummy transactions only.<br>\r\n<b>Live</b> = Will be used with you Live PayPal credentials to make actual transaction with normal users with PayPal account.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(477, 1, 'en', 'labels', 'backend.general_settings.payment_settings.bluesnap', 'Bluesnap Payment Method', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(478, 1, 'en', 'labels', 'backend.general_settings.payment_settings.bluesnap_note', 'Bluesnap card form for payment', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(479, 1, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_bluesnap', 'How to get Bluesnap API Credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(480, 1, 'en', 'labels', 'backend.general_settings.payment_settings.instamojo', 'Instamojo Payment Method', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(481, 1, 'en', 'labels', 'backend.general_settings.payment_settings.instamojo_note', 'Redirects to instamojo for payment', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(482, 1, 'en', 'labels', 'backend.general_settings.payment_settings.instamojo_token', 'API Token', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(483, 1, 'en', 'labels', 'backend.general_settings.payment_settings.instamojo_mode_note', '<b>Sandbox</b>= Will be used for testing payments with Instamojo Test Credentials. This options will redirect to test Instamojo payment with Sandbox User Credentials. It will be used for dummy transactions only.<br><a href=\"//test.instamojo.com/\">How to get Instamojo Test API Credentials?</a><br>\r\n<b>Live</b> = Will be used with you Live Instamojo credentials to make actual transaction with normal users with Instamojo account.<br><a href=\"//www.instamojo.com\">How to get Instamojo Live API Credentials?</a>', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(484, 1, 'en', 'labels', 'backend.general_settings.payment_settings.razorpay', 'Razorpay Payment Method', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(485, 1, 'en', 'labels', 'backend.general_settings.payment_settings.razorpay_note', 'Redirects to RazorPay for payment', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(486, 1, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_razorpay', 'How to get RAZORPAY API Credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(487, 1, 'en', 'labels', 'backend.general_settings.payment_settings.cashfree', 'CashFree Payment Method', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(488, 1, 'en', 'labels', 'backend.general_settings.payment_settings.cashfree_note', 'Redirects to CashFree for payment', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(489, 1, 'en', 'labels', 'backend.general_settings.payment_settings.cashfree_app_id', 'App ID', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(490, 1, 'en', 'labels', 'backend.general_settings.payment_settings.cashfree_secret', 'Secret Key', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(491, 1, 'en', 'labels', 'backend.general_settings.payment_settings.cashfree_mode_note', '<b>Sandbox</b>= Will be used for testing payments with CasFree Test Credentials. Account with INR only can make payments with Cashfree for now. This options will redirect to test Cashfree payment with Sandbox User Credentials. It will be used for dummy transactions only.<br><a href=\"//test.cashfree.com\">How to get Cashfree Test API Credentials?</a><br>\r\n<b>Live</b> = Will be used with you Live Cashfree credentials to make actual transaction with normal users with Cashfree account.<br><strong>If you set this payment gateway then set your currency as INR</strong><br><a href=\"//www.cashfree.com\">How to get Cashfree Live API Credentials?</a>', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(492, 1, 'en', 'labels', 'backend.general_settings.payment_settings.payu', 'PayUMoney Payment Method', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(493, 1, 'en', 'labels', 'backend.general_settings.payment_settings.payu_note', 'Redirects to PayUMoney for payment', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(494, 1, 'en', 'labels', 'backend.general_settings.payment_settings.payu_salt', 'Salt', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(495, 1, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_payu', 'How to get PayUMoney API Credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(496, 1, 'en', 'labels', 'backend.general_settings.payment_settings.payu_mode_note', '<b>Sandbox</b>= Will be used for testing payments with PayUMoney Test Credentials. Account with INR only can make payments with Payment for now. This options will redirect to test PayUMoney payment with Sandbox User Credentials. It will be used for dummy transactions only.<br>\r\n<b>Live</b> = Will be used with you Live PayUMoney credentials to make actual transaction with normal users with PayUMoney account.<br><strong>If you set this payment gateway then set your currency as INR</strong>', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(497, 1, 'en', 'labels', 'backend.general_settings.payment_settings.flutter', 'Flutter Payment Method', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(498, 1, 'en', 'labels', 'backend.general_settings.payment_settings.how_to_flutter', 'How to get Flutter API Credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(499, 1, 'en', 'labels', 'backend.general_settings.payment_settings.flutter_note', 'Redirects to Flutter for payment', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(500, 1, 'en', 'labels', 'backend.general_settings.management', 'General Settings', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(501, 1, 'en', 'labels', 'backend.general_settings.app_name', 'App Name', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(502, 1, 'en', 'labels', 'backend.general_settings.app_url', 'App URL', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(503, 1, 'en', 'labels', 'backend.general_settings.custom_css', 'Custom CSS', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(504, 1, 'en', 'labels', 'backend.general_settings.custom_js', 'Custom JS', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(505, 1, 'en', 'labels', 'backend.general_settings.teacher_commission_rate', 'Teacher Commission Rate', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(506, 1, 'en', 'labels', 'backend.general_settings.lesson_note', 'Enable / Disable if user will be able to skip before timer is over.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(507, 1, 'en', 'labels', 'backend.general_settings.font_color', 'Font Color', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(508, 1, 'en', 'labels', 'backend.general_settings.static', 'Static', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(509, 1, 'en', 'labels', 'backend.general_settings.google_analytics_id', 'Google Analytics ID', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(510, 1, 'en', 'labels', 'backend.general_settings.google_analytics_id_note', 'How to get Google Analytics ID?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(511, 1, 'en', 'labels', 'backend.general_settings.database', 'Database / Real', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(512, 1, 'en', 'labels', 'backend.general_settings.counter', 'Counter', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(513, 1, 'en', 'labels', 'backend.general_settings.counter_note', '<b>Static</b> =  Manually add data for counter. Please enter exact text you want to display on frontend counter section,<br> <b>Database/Real</b> = It will take real data from database for all the fields (Students enrolled, Total Courses, Total Teachers)', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(514, 1, 'en', 'labels', 'backend.general_settings.total_students', 'Enter Total Students. Ex: 1K, 1Million, 1000 etc.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(515, 1, 'en', 'labels', 'backend.general_settings.total_courses', 'Enter Total Courses. Ex: 1K, 1000 etc.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(516, 1, 'en', 'labels', 'backend.general_settings.total_teachers', 'Enter Total Teachers. Ex: 1K, 1000 etc.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(517, 1, 'en', 'labels', 'backend.general_settings.layout_type', 'Layout Type', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(518, 1, 'en', 'labels', 'backend.general_settings.theme_layout', 'Theme Layout', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(519, 1, 'en', 'labels', 'backend.general_settings.layout_note', 'This will change frontend theme layout', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(520, 1, 'en', 'labels', 'backend.general_settings.show_offers_note', 'Enable / Disable if Coupon offers page link to be displayed in bottom footer', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(521, 1, 'en', 'labels', 'backend.general_settings.admin_registration_mail', 'Registration Mail', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(522, 1, 'en', 'labels', 'backend.general_settings.admin_registration_mail_note', 'Enable / Disable if admin will be able to received new registration user mail', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(523, 1, 'en', 'labels', 'backend.general_settings.admin_order_mail', 'Order Mail', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(524, 1, 'en', 'labels', 'backend.general_settings.admin_order_mail_note', 'Enable / Disable if admin will be able to received new order mail', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(525, 1, 'en', 'labels', 'backend.general_settings.newsletter.mail_provider', 'Mail Service Provider', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(526, 1, 'en', 'labels', 'backend.general_settings.newsletter.mailchimp', 'Mailchimp', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(527, 1, 'en', 'labels', 'backend.general_settings.newsletter.sendgrid', 'SendGrid', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(528, 1, 'en', 'labels', 'backend.general_settings.newsletter.mail_provider_note', '<b>Note </b>: You can select any Mail service provider to receive all the emails which are being used to <b>subscribe newsletter</b>.<br> Select and setup according to steps given. <b>It is compulsory</b>, if you want to use <b>newsletter subscription</b> form.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(529, 1, 'en', 'labels', 'backend.general_settings.newsletter.api_key', 'API Key', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(530, 1, 'en', 'labels', 'backend.general_settings.newsletter.api_key_note', 'Generate <b>API key</b> from your <a target=\"_blank\" href=\"https://mailchimp.com/\"><b> Mailchimp account</b></a> and paste that in above text box.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(531, 1, 'en', 'labels', 'backend.general_settings.newsletter.api_key_question', 'How to generate API key?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(532, 1, 'en', 'labels', 'backend.general_settings.newsletter.list_id', 'List ID', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(533, 1, 'en', 'labels', 'backend.general_settings.newsletter.list_id_note', 'Find and paste <b>List ID</b> in above box', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(534, 1, 'en', 'labels', 'backend.general_settings.newsletter.list_id_question', 'How to find List ID from Mailchimp?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(535, 1, 'en', 'labels', 'backend.general_settings.newsletter.double_opt_in', 'Double Opt-in', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(536, 1, 'en', 'labels', 'backend.general_settings.newsletter.double_opt_in_note', '<b>On</b> = User will be asked in mail to opt in for subscription. <b>Off</b> = User will be directly subscribed for newsletter ', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(537, 1, 'en', 'labels', 'backend.general_settings.newsletter.api_key_note_sendgrid', 'Generate <b>API key</b> from your <a target=\"_blank\" href=\"https://sendgrid.com/\"><b> SendGrid account</b></a> and paste that in above text box.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(538, 1, 'en', 'labels', 'backend.general_settings.newsletter.get_lists', 'Get Lists', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(539, 1, 'en', 'labels', 'backend.general_settings.newsletter.sendgrid_lists', 'SendGrid Email Lists', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(540, 1, 'en', 'labels', 'backend.general_settings.newsletter.select_list', 'Select List', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(541, 1, 'en', 'labels', 'backend.general_settings.newsletter.manage_lists', 'Manage SendGrid Lists', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(542, 1, 'en', 'labels', 'backend.general_settings.newsletter.create_new', 'Create and Select New', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(543, 1, 'en', 'labels', 'backend.general_settings.newsletter.title', 'Newsletter Configuration', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(544, 1, 'en', 'labels', 'backend.general_settings.newsletter.list_id_question_sendgrid', 'Create new Email list for SendGrid Here.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(545, 1, 'en', 'labels', 'backend.general_settings.mail_configuration_note', 'Have you configured :link Mail Settings</a>? It is compulsory to setup to send/receive emails', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(546, 1, 'en', 'labels', 'backend.general_settings.app_locale', 'App Locale', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(547, 1, 'en', 'labels', 'backend.general_settings.app_timezone', 'App Timezone', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(548, 1, 'en', 'labels', 'backend.general_settings.mail_driver', 'Mail Driver', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(549, 1, 'en', 'labels', 'backend.general_settings.mail_host', 'Mail Host', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(550, 1, 'en', 'labels', 'backend.general_settings.mail_port', 'Mail Port', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(551, 1, 'en', 'labels', 'backend.general_settings.mail_from_name', 'Mail From Name', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(552, 1, 'en', 'labels', 'backend.general_settings.mail_from_address', 'Mail From Address', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(553, 1, 'en', 'labels', 'backend.general_settings.mail_username', 'Mail Username', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(554, 1, 'en', 'labels', 'backend.general_settings.mail_password', 'Mail Password', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(555, 1, 'en', 'labels', 'backend.general_settings.enable_registration', 'Enable Registration', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(556, 1, 'en', 'labels', 'backend.general_settings.change_email', 'Change Email', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(557, 1, 'en', 'labels', 'backend.general_settings.password_history', 'Password History', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(558, 1, 'en', 'labels', 'backend.general_settings.password_expires_days', 'Password Expires Days', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(559, 1, 'en', 'labels', 'backend.general_settings.requires_approval', 'Requires Approval', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(560, 1, 'en', 'labels', 'backend.general_settings.confirm_email', 'Confirm Email', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(561, 1, 'en', 'labels', 'backend.general_settings.homepage', 'Select Homepage', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(562, 1, 'en', 'labels', 'backend.general_settings.captcha_status', 'Captcha Status', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(563, 1, 'en', 'labels', 'backend.general_settings.captcha_site_key', 'Captcha Key', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(564, 1, 'en', 'labels', 'backend.general_settings.captcha_site_secret', 'Captcha Secret', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(565, 1, 'en', 'labels', 'backend.general_settings.google_analytics', 'Google Analytics Code', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(566, 1, 'en', 'labels', 'backend.general_settings.sections_note', 'Once you click on update, you will see list of sections to on/off.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(567, 1, 'en', 'labels', 'backend.general_settings.general.title', 'General', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(568, 1, 'en', 'labels', 'backend.general_settings.captcha', 'Whether the registration - login - contact captcha is on or off', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(569, 1, 'en', 'labels', 'backend.general_settings.captcha_note', 'How to get Google reCaptcha credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(570, 1, 'en', 'labels', 'backend.general_settings.retest_note', 'Enable / Disable if user will be able to give retest for same exam', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(571, 1, 'en', 'labels', 'backend.general_settings.language_settings.title', 'Language Settings', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(572, 1, 'en', 'labels', 'backend.general_settings.language_settings.default_language', 'Default Language', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(573, 1, 'en', 'labels', 'backend.general_settings.language_settings.right_to_left', 'Right to Left', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(574, 1, 'en', 'labels', 'backend.general_settings.language_settings.left_to_right', 'Left to right', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(575, 1, 'en', 'labels', 'backend.general_settings.language_settings.display_type', 'Display Type', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(576, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.title', 'User Registration Settings', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(577, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.desc', 'Checked fields from the right sidebar will be displayed in registration form', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(578, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.first_name', 'First Name', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(579, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.last_name', 'Last Name', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(580, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.email', 'Email', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(581, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.password', 'Password', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(582, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.phone', 'Phone', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(583, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.dob', 'Date of Birth', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(584, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.gender', 'Gender', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(585, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.male', 'Male', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(586, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.female', 'Female', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(587, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.other', 'Other', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(588, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.address', 'Address', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(589, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.pincode', 'Pincode', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(590, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.country', 'Country', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(591, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.state', 'State', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(592, 1, 'en', 'labels', 'backend.general_settings.user_registration_settings.fields.city', 'City', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(593, 1, 'en', 'labels', 'backend.general_settings.troubleshoot', 'Troubleshoot', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(594, 1, 'en', 'labels', 'backend.general_settings.onesignal_note', 'Enable / Disble OneSignal configuration for Website.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(595, 1, 'en', 'labels', 'backend.general_settings.how_to_onesignal', 'How to create app in OneSignal?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(596, 1, 'en', 'labels', 'backend.general_settings.setup_onesignal', 'How to set up OneSignal?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(597, 1, 'en', 'labels', 'backend.general_settings.api_clients.title', 'API Clients', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(598, 1, 'en', 'labels', 'backend.general_settings.api_clients.generate', 'Generate', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(599, 1, 'en', 'labels', 'backend.general_settings.api_clients.note', '<span class=\"text-danger font-weight-bold\">Note :</span> This section will be helpful for API purpose. You can generate <b>Client ID</b> and <b>Client Secret</b> to use in your Android app or Postman to test the API.<br> You need to customise parameters and URL according to your requirement.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(600, 1, 'en', 'labels', 'backend.general_settings.api_clients.developer_manual', 'Developer Manual', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(601, 1, 'en', 'labels', 'backend.general_settings.api_clients.fields.name', 'Name', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(602, 1, 'en', 'labels', 'backend.general_settings.api_clients.fields.id', 'ID', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(603, 1, 'en', 'labels', 'backend.general_settings.api_clients.fields.secret', 'Secret', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(604, 1, 'en', 'labels', 'backend.general_settings.api_clients.fields.status', 'Status', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(605, 1, 'en', 'labels', 'backend.general_settings.api_clients.fields.action', 'Action', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(606, 1, 'en', 'labels', 'backend.general_settings.api_clients.revoked', 'Revoked', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(607, 1, 'en', 'labels', 'backend.general_settings.api_clients.revoke', 'Revoke', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(608, 1, 'en', 'labels', 'backend.general_settings.api_clients.live', 'Live', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(609, 1, 'en', 'labels', 'backend.general_settings.api_clients.enable', 'Enable', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(610, 1, 'en', 'labels', 'backend.general_settings.api_clients.api_client_name', 'API Client Name', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(611, 1, 'en', 'labels', 'backend.general_settings.api_clients.something_went_wrong', 'Something Went Wrong', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(612, 1, 'en', 'labels', 'backend.general_settings.api_clients.please_input_api_client_name', 'Please input API client name', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(613, 1, 'en', 'labels', 'backend.general_settings.list_update_note', 'Once you click on update, you will see list of sections to on/off.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(614, 1, 'en', 'labels', 'backend.general_settings.wide', 'Wide', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(615, 1, 'en', 'labels', 'backend.general_settings.box', 'Box', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(616, 1, 'en', 'labels', 'backend.general_settings.layout_type_note', 'This will change frontend theme layout type', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(617, 1, 'en', 'labels', 'backend.general_settings.layout_label', 'Layout', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(618, 1, 'en', 'labels', 'backend.logo.logo_b', 'Logo 1', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(619, 1, 'en', 'labels', 'backend.logo.logo_b_note', 'Note : Upload logo with <b>black text and transparent background in .png format</b> and <b>294x50</b>(WxH) pixels.<br> <b>Height</b> should be fixed, <b>width</b> according to your <b>aspect ratio</b>.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(620, 1, 'en', 'labels', 'backend.logo.logo_w', 'Logo 2', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(621, 1, 'en', 'labels', 'backend.logo.logo_w_note', 'Note : Upload logo with <b>white text and transparent background in .png format</b> and <b>294x50</b> (WxH) pixels.<br> <b>Height</b> should be fixed, <b>width</b> according to your <b>aspect ratio</b>.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(622, 1, 'en', 'labels', 'backend.logo.logo_white', 'Logo 3', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(623, 1, 'en', 'labels', 'backend.logo.logo_white_note', 'Note : Upload logo with <b>only in white text and transparent background in .png format</b> and <b>294x50</b>(WxH)  pixels.<br> <b>Height</b> should be fixed, <b>width</b> according to your <b>aspect ratio</b>.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(624, 1, 'en', 'labels', 'backend.logo.logo_popup', 'Logo for Popups', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(625, 1, 'en', 'labels', 'backend.logo.logo_popup_note', 'Note : Add square logo minimum resolution <b>72x72</b> pixels', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(626, 1, 'en', 'labels', 'backend.logo.favicon', 'Add Favicon', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(627, 1, 'en', 'labels', 'backend.logo.favicon_note', 'Note : Upload logo with resolution <b>32x32</b> pixels and extension <b>.png</b> or <b>.gif</b> or <b>.ico</b>', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(628, 1, 'en', 'labels', 'backend.logo.title', 'Change Logo', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(629, 1, 'en', 'labels', 'backend.social_settings.management', 'Social Settings', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(630, 1, 'en', 'labels', 'backend.social_settings.fb_note', 'Enable / disable facebook login for website', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(631, 1, 'en', 'labels', 'backend.social_settings.fb_api_note', 'How to get Facebook API Credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(632, 1, 'en', 'labels', 'backend.social_settings.google_api_note', 'How to get Google API Credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(633, 1, 'en', 'labels', 'backend.social_settings.twitter_api_note', 'How to get Twitter API Credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(634, 1, 'en', 'labels', 'backend.social_settings.google_note', 'Enable / disable Google login for website', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(635, 1, 'en', 'labels', 'backend.social_settings.twitter_note', 'Enable / disable Twitter login for website', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(636, 1, 'en', 'labels', 'backend.social_settings.linkedin_api_note', 'How to get LinkedIn API Credentials?', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(637, 1, 'en', 'labels', 'backend.social_settings.linkedin_note', 'Enable / disable LinkedIn login for website', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(638, 1, 'en', 'labels', 'backend.hero_slider.fields.name', 'Name', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(639, 1, 'en', 'labels', 'backend.hero_slider.fields.bg_image', 'BG Image', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(640, 1, 'en', 'labels', 'backend.hero_slider.fields.overlay.title', 'Overlay', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(641, 1, 'en', 'labels', 'backend.hero_slider.fields.overlay.note', 'If you turn it on. A black overlay will be displayed on your image. It will be helpful when BG image is not darker or does not have Overlay', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(642, 1, 'en', 'labels', 'backend.hero_slider.fields.hero_text', 'Hero Text', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(643, 1, 'en', 'labels', 'backend.hero_slider.fields.sub_text', 'Sub Text', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(644, 1, 'en', 'labels', 'backend.hero_slider.fields.widget.title', 'Widget', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(645, 1, 'en', 'labels', 'backend.hero_slider.fields.widget.input_date_time', 'Input date and time', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(646, 1, 'en', 'labels', 'backend.hero_slider.fields.widget.select_widget', 'Select Widget', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(647, 1, 'en', 'labels', 'backend.hero_slider.fields.widget.search_bar', 'Search Bar', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(648, 1, 'en', 'labels', 'backend.hero_slider.fields.widget.countdown_timer', 'Countdown Timer', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(649, 1, 'en', 'labels', 'backend.hero_slider.fields.buttons.title', 'Buttons', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(650, 1, 'en', 'labels', 'backend.hero_slider.fields.buttons.add', 'Add', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(651, 1, 'en', 'labels', 'backend.hero_slider.fields.buttons.placeholder', 'Add number of buttons you want to add', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(652, 1, 'en', 'labels', 'backend.hero_slider.fields.buttons.note', 'Note: Maximum 4 buttons can be added. Please add label and link for the button for redirecting action when button is clicked.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(653, 1, 'en', 'labels', 'backend.hero_slider.fields.buttons.name', 'Button', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(654, 1, 'en', 'labels', 'backend.hero_slider.fields.buttons.label', 'Label', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(655, 1, 'en', 'labels', 'backend.hero_slider.fields.buttons.link', 'Link', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(656, 1, 'en', 'labels', 'backend.hero_slider.fields.sequence', 'Sequence', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(657, 1, 'en', 'labels', 'backend.hero_slider.fields.status', 'Status', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(658, 1, 'en', 'labels', 'backend.hero_slider.note', 'Note: Please upload .jpg or .png in <b>1920x900</b> resolution for best result. Use darker or Overlayed images for better result.', '2022-03-30 15:37:05', '2022-03-30 15:37:05'),
(659, 1, 'en', 'labels', 'backend.hero_slider.on', 'On', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(660, 1, 'en', 'labels', 'backend.hero_slider.off', 'Off', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(661, 1, 'en', 'labels', 'backend.hero_slider.title', 'Hero Slider', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(662, 1, 'en', 'labels', 'backend.hero_slider.create', 'Create Slide', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(663, 1, 'en', 'labels', 'backend.hero_slider.edit', 'Edit Slide', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(664, 1, 'en', 'labels', 'backend.hero_slider.view', 'View Slides', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(665, 1, 'en', 'labels', 'backend.hero_slider.manage_sequence', 'Manage Sequence of Slides', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(666, 1, 'en', 'labels', 'backend.hero_slider.sequence_note', 'Drag and change sequence of a Slide', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(667, 1, 'en', 'labels', 'backend.hero_slider.save_sequence', 'Save Sequence', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(668, 1, 'en', 'labels', 'backend.tax.title', 'Tax', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(669, 1, 'en', 'labels', 'backend.tax.create', 'Create Tax', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(670, 1, 'en', 'labels', 'backend.tax.edit', 'Edit Tax', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(671, 1, 'en', 'labels', 'backend.tax.view', 'View Tax', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(672, 1, 'en', 'labels', 'backend.tax.on', 'On', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(673, 1, 'en', 'labels', 'backend.tax.off', 'Off', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(674, 1, 'en', 'labels', 'backend.tax.fields.name', 'Name', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(675, 1, 'en', 'labels', 'backend.tax.fields.rate', 'Rate', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(676, 1, 'en', 'labels', 'backend.tax.fields.status', 'Status', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(677, 1, 'en', 'labels', 'backend.coupons.title', 'Coupons', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(678, 1, 'en', 'labels', 'backend.coupons.create', 'Create Coupon', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(679, 1, 'en', 'labels', 'backend.coupons.edit', 'Edit Coupon', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(680, 1, 'en', 'labels', 'backend.coupons.view', 'View Coupons', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(681, 1, 'en', 'labels', 'backend.coupons.courses', 'Courses', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(682, 1, 'en', 'labels', 'backend.coupons.bundles', 'Bundles', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(683, 1, 'en', 'labels', 'backend.coupons.on', 'On', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(684, 1, 'en', 'labels', 'backend.coupons.off', 'Off', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(685, 1, 'en', 'labels', 'backend.coupons.flat_rate', 'Flat Rate', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(686, 1, 'en', 'labels', 'backend.coupons.discount_rate', 'Discount Rate', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(687, 1, 'en', 'labels', 'backend.coupons.type_note', '<b>Discount Rate (%) :</b> If you will select this, it will apply rate in % to total purchase. Ex. Price = $100 and Discount rate is 10% then 10% of 100$ will be deducted.<br><b>Flat Rate : </b>If you select this, particular amount will be deducted from total purchase. Ex. Price = 100$ and Flat rate is 25$ then 25$ will be deducted from 100$.', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(688, 1, 'en', 'labels', 'backend.coupons.amount_note', 'If <b>Discount Rate</b> selected, input rate of percentage. If <b>Flat Rate</b> selected, input particular amount to be deducted.', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(689, 1, 'en', 'labels', 'backend.coupons.per_user_limit_note', 'Specify how many times a single user can use this coupon. By default one time use.', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(690, 1, 'en', 'labels', 'backend.coupons.total_note', 'Number of coupons to be issued', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(691, 1, 'en', 'labels', 'backend.coupons.fields.name', 'Name', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(692, 1, 'en', 'labels', 'backend.coupons.fields.code', 'Code', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(693, 1, 'en', 'labels', 'backend.coupons.fields.type', 'Type', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(694, 1, 'en', 'labels', 'backend.coupons.fields.for', 'For', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(695, 1, 'en', 'labels', 'backend.coupons.fields.amount', 'Amount', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(696, 1, 'en', 'labels', 'backend.coupons.fields.expires_at', 'Expires At', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(697, 1, 'en', 'labels', 'backend.coupons.fields.per_user_limit', 'Per User Limit', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(698, 1, 'en', 'labels', 'backend.coupons.fields.total', 'Total', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(699, 1, 'en', 'labels', 'backend.coupons.fields.status', 'Status', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(700, 1, 'en', 'labels', 'backend.coupons.fields.min_price', 'Minimum Order Price', '2022-03-30 15:37:06', '2022-03-30 15:37:06');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(701, 1, 'en', 'labels', 'backend.coupons.fields.description', 'Description', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(702, 1, 'en', 'labels', 'backend.coupons.description', 'Description', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(703, 1, 'en', 'labels', 'backend.coupons.unlimited', 'Unlimited', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(704, 1, 'en', 'labels', 'backend.sponsors.title', 'Sponsors', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(705, 1, 'en', 'labels', 'backend.sponsors.fields.name', 'Name', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(706, 1, 'en', 'labels', 'backend.sponsors.fields.link', 'Link', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(707, 1, 'en', 'labels', 'backend.sponsors.fields.logo', 'Logo', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(708, 1, 'en', 'labels', 'backend.sponsors.fields.status', 'Status', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(709, 1, 'en', 'labels', 'backend.sponsors.create', 'Create Sponsors', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(710, 1, 'en', 'labels', 'backend.sponsors.edit', 'Edit Sponsors', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(711, 1, 'en', 'labels', 'backend.sponsors.view', 'View Sponsors', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(712, 1, 'en', 'labels', 'backend.teachers.fields.first_name', 'First Name', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(713, 1, 'en', 'labels', 'backend.teachers.fields.last_name', 'Last Name', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(714, 1, 'en', 'labels', 'backend.teachers.fields.email', 'Email Address', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(715, 1, 'en', 'labels', 'backend.teachers.fields.password', 'Password', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(716, 1, 'en', 'labels', 'backend.teachers.fields.image', 'Image', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(717, 1, 'en', 'labels', 'backend.teachers.fields.status', 'Status', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(718, 1, 'en', 'labels', 'backend.teachers.title', 'Teachers', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(719, 1, 'en', 'labels', 'backend.teachers.create', 'Create Teacher', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(720, 1, 'en', 'labels', 'backend.teachers.edit', 'Edit Teacher', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(721, 1, 'en', 'labels', 'backend.teachers.view', 'View Teachers', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(722, 1, 'en', 'labels', 'backend.testimonials.fields.name', 'Name', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(723, 1, 'en', 'labels', 'backend.testimonials.fields.occupation', 'Occupation', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(724, 1, 'en', 'labels', 'backend.testimonials.fields.content', 'Content', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(725, 1, 'en', 'labels', 'backend.testimonials.fields.status', 'Status', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(726, 1, 'en', 'labels', 'backend.testimonials.title', 'Testimonials', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(727, 1, 'en', 'labels', 'backend.testimonials.create', 'Create Testimonial', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(728, 1, 'en', 'labels', 'backend.testimonials.edit', 'Edit Testimonial', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(729, 1, 'en', 'labels', 'backend.testimonials.view', 'View Testimonials', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(730, 1, 'en', 'labels', 'backend.dashboard.title', 'Dashboard', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(731, 1, 'en', 'labels', 'backend.dashboard.students', 'Students', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(732, 1, 'en', 'labels', 'backend.dashboard.trending', 'Trending', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(733, 1, 'en', 'labels', 'backend.dashboard.teachers', 'Teachers', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(734, 1, 'en', 'labels', 'backend.dashboard.completed', 'Completed', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(735, 1, 'en', 'labels', 'backend.dashboard.no_data', 'No data available', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(736, 1, 'en', 'labels', 'backend.dashboard.buy_course_now', 'Buy course now', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(737, 1, 'en', 'labels', 'backend.dashboard.your_courses', 'Your Courses', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(738, 1, 'en', 'labels', 'backend.dashboard.students_enrolled', 'Students Enrolled To<br> Your Courses', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(739, 1, 'en', 'labels', 'backend.dashboard.recent_reviews', 'Recent Reviews', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(740, 1, 'en', 'labels', 'backend.dashboard.recent_orders', 'Recent Orders', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(741, 1, 'en', 'labels', 'backend.dashboard.recent_contacts', 'Recent Contacts', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(742, 1, 'en', 'labels', 'backend.dashboard.view_all', 'View All', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(743, 1, 'en', 'labels', 'backend.dashboard.course', 'Course', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(744, 1, 'en', 'labels', 'backend.dashboard.review', 'Review', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(745, 1, 'en', 'labels', 'backend.dashboard.time', 'Time', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(746, 1, 'en', 'labels', 'backend.dashboard.recent_messages', 'Recent Messages', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(747, 1, 'en', 'labels', 'backend.dashboard.message', 'Message', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(748, 1, 'en', 'labels', 'backend.dashboard.message_by', 'Message By', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(749, 1, 'en', 'labels', 'backend.dashboard.courses', 'Courses', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(750, 1, 'en', 'labels', 'backend.dashboard.ordered_by', 'Ordered By', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(751, 1, 'en', 'labels', 'backend.dashboard.view', 'View', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(752, 1, 'en', 'labels', 'backend.dashboard.amount', 'Amount', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(753, 1, 'en', 'labels', 'backend.dashboard.recent_contact_requests', 'Recent Contact Requests', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(754, 1, 'en', 'labels', 'backend.dashboard.name', 'Name', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(755, 1, 'en', 'labels', 'backend.dashboard.email', 'Email', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(756, 1, 'en', 'labels', 'backend.dashboard.my_course_bundles', 'My Course Bundles', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(757, 1, 'en', 'labels', 'backend.dashboard.my_courses', 'My Courses', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(758, 1, 'en', 'labels', 'backend.dashboard.your_courses_and_bundles', 'Your Courses and Bundles', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(759, 1, 'en', 'labels', 'backend.dashboard.course_and_bundles', 'Course and Bundles', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(760, 1, 'en', 'labels', 'backend.dashboard.pending_orders', 'Pending Orders', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(761, 1, 'en', 'labels', 'backend.dashboard.pending', 'Pending', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(762, 1, 'en', 'labels', 'backend.dashboard.success', 'Success', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(763, 1, 'en', 'labels', 'backend.dashboard.failed', 'Failed', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(764, 1, 'en', 'labels', 'backend.dashboard.my_subscribed_courses', 'My Subscribed Courses', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(765, 1, 'en', 'labels', 'backend.dashboard.my_subscribed_course_bundles', 'My Subscribed Course Bundles', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(766, 1, 'en', 'labels', 'backend.questions_options.title', 'Questions Option', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(767, 1, 'en', 'labels', 'backend.questions_options.create', 'Create Option', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(768, 1, 'en', 'labels', 'backend.questions_options.edit', 'Edit Option', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(769, 1, 'en', 'labels', 'backend.questions_options.view', 'View Question Options', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(770, 1, 'en', 'labels', 'backend.questions_options.fields.course', 'Course', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(771, 1, 'en', 'labels', 'backend.questions_options.fields.lesson', 'Lesson', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(772, 1, 'en', 'labels', 'backend.questions_options.fields.title', 'Title', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(773, 1, 'en', 'labels', 'backend.questions_options.fields.question', 'Question', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(774, 1, 'en', 'labels', 'backend.questions_options.fields.question_option', 'Question Option', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(775, 1, 'en', 'labels', 'backend.questions_options.fields.score', 'Score', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(776, 1, 'en', 'labels', 'backend.questions_options.fields.tests', 'Tests', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(777, 1, 'en', 'labels', 'backend.questions_options.fields.option_text', 'Option Text', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(778, 1, 'en', 'labels', 'backend.questions_options.fields.correct', 'Correct', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(779, 1, 'en', 'labels', 'backend.reviews.title', 'Reviews', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(780, 1, 'en', 'labels', 'backend.reviews.fields.course', 'Course', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(781, 1, 'en', 'labels', 'backend.reviews.fields.user', 'User', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(782, 1, 'en', 'labels', 'backend.reviews.fields.content', 'Content', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(783, 1, 'en', 'labels', 'backend.reviews.fields.time', 'Time', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(784, 1, 'en', 'labels', 'backend.contacts.title', 'Leads', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(785, 1, 'en', 'labels', 'backend.contacts.fields.name', 'Name', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(786, 1, 'en', 'labels', 'backend.contacts.fields.email', 'Email', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(787, 1, 'en', 'labels', 'backend.contacts.fields.phone', 'Phone', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(788, 1, 'en', 'labels', 'backend.contacts.fields.message', 'Message', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(789, 1, 'en', 'labels', 'backend.contacts.fields.time', 'Time', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(790, 1, 'en', 'labels', 'backend.translations.title', 'Translation Manager', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(791, 1, 'en', 'labels', 'backend.translations.warning', 'Warning, translations are not visible until they are exported back to the app/lang file, using\r\n                        <code>php artisan translation:export</code> command or publish button.', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(792, 1, 'en', 'labels', 'backend.translations.done_importing', 'Done importing, processed <strong class=\"counter\">N</strong> items! Reload this page to\r\n                            refresh the groups!', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(793, 1, 'en', 'labels', 'backend.translations.done_searching', 'Done searching for translations, found <strong class=\"counter\">N</strong> items!', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(794, 1, 'en', 'labels', 'backend.translations.done_publishing_for_group', 'Done publishing the translations for group', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(795, 1, 'en', 'labels', 'backend.translations.done_publishing_for_all_groups', 'Done publishing the translations for all group!', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(796, 1, 'en', 'labels', 'backend.translations.append_new_translations', 'Append new translations', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(797, 1, 'en', 'labels', 'backend.translations.replace_existing_translations', 'Replace existing translations', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(798, 1, 'en', 'labels', 'backend.translations.import_groups', 'Import Groups', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(799, 1, 'en', 'labels', 'backend.translations.import_groups_note', '<p>This will get all locale files from <code>lang</code> folder and insert into database.<br> <b>Append new translations :</b> It will append only new files and data <b>&amp;</b>\r\n                                            <b>Replace existing translations:</b>It will replace existing records according to files</p>', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(800, 1, 'en', 'labels', 'backend.translations.choose_a_group', 'Choose a group to display the group translations. If no groups are visible, make sure\r\n                                you have run the migrations and imported the translations.', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(801, 1, 'en', 'labels', 'backend.translations.translation_warning', 'Are you sure you want to publish the translations group :group ? This will overwrite existing language files', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(802, 1, 'en', 'labels', 'backend.translations.publishing', 'Publishing..', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(803, 1, 'en', 'labels', 'backend.translations.publish_translations', 'Publish Translations', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(804, 1, 'en', 'labels', 'backend.translations.total', 'Total', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(805, 1, 'en', 'labels', 'backend.translations.changed', 'Changed', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(806, 1, 'en', 'labels', 'backend.translations.key', 'Key', '2022-03-30 15:37:06', '2022-03-30 15:37:06'),
(807, 1, 'en', 'labels', 'backend.translations.supported_locales', 'Supported Locales', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(808, 1, 'en', 'labels', 'backend.translations.current_supported_locales', 'Current Supported Locales', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(809, 1, 'en', 'labels', 'backend.translations.enter_new_locale_key', 'Enter new locale key', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(810, 1, 'en', 'labels', 'backend.translations.add_new_locale', 'Add new locale', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(811, 1, 'en', 'labels', 'backend.translations.adding', 'Adding...', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(812, 1, 'en', 'labels', 'backend.translations.export_all_translations', 'Export all translations', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(813, 1, 'en', 'labels', 'backend.translations.publish_all', 'Publish all', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(814, 1, 'en', 'labels', 'backend.translations.publish_all_warning', 'Are you sure you want to publish all translations group? This will overwrite existing language files.', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(815, 1, 'en', 'labels', 'backend.update.title', 'Update Theme', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(816, 1, 'en', 'labels', 'backend.update.upload', 'Upload new version  <small>(update.zip)</small>', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(817, 1, 'en', 'labels', 'backend.update.current_version', 'Current Version', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(818, 1, 'en', 'labels', 'backend.update.note_before_upload_title', 'Read following notes before updating', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(819, 1, 'en', 'labels', 'backend.update.file_replaced', 'Following files will be updated / replaced', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(820, 1, 'en', 'labels', 'backend.update.warning', '<b>WARNING : We strongly recommend you to update theme by version number</b>.<br> <b>Example :</b> update_v1.zip, update_v2.zip. Please do not jump version number. If your version number is 1 and you want to update it, then update to version 2. Do no directly update to version 3.', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(821, 1, 'en', 'labels', 'backend.update.note_before_upload', '<p><b>Please take BACKUP before updating.</b> Updated zip file may come with new folders and file updates. <b>Your current files will be replaced with new one</b>. So, <b>if you have made any changes in current application files it will be LOST</b>.</p>\r\n                        <p>If you are directly uploading from below file input box, your files will be replaced. We strongly recommend you to do it manual replacement of files one by one or edit the changes by comparing your current edited file and new updated files.</p>\r\n                        <p>If you still have confusion. Please contact us, we will guide you to update your application</p>', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(822, 1, 'en', 'labels', 'backend.backup.title', 'Backup', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(823, 1, 'en', 'labels', 'backend.backup.email', 'Email Notification', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(824, 1, 'en', 'labels', 'backend.backup.app_token', 'App Token', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(825, 1, 'en', 'labels', 'backend.backup.app_secret', 'App Secret', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(826, 1, 'en', 'labels', 'backend.backup.api_key', 'API Key', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(827, 1, 'en', 'labels', 'backend.backup.app_key', 'App Key', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(828, 1, 'en', 'labels', 'backend.backup.api_secret', 'API Secret', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(829, 1, 'en', 'labels', 'backend.backup.enable_disable', 'Enable / Disable', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(830, 1, 'en', 'labels', 'backend.backup.backup_type', 'Backup Type', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(831, 1, 'en', 'labels', 'backend.backup.dropbox', 'Dropbox', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(832, 1, 'en', 'labels', 'backend.backup.backup_files', 'Backup Files', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(833, 1, 'en', 'labels', 'backend.backup.aws', 'AWS S3', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(834, 1, 'en', 'labels', 'backend.backup.db', 'Database', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(835, 1, 'en', 'labels', 'backend.backup.configuration', 'Configuration', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(836, 1, 'en', 'labels', 'backend.backup.generate_backup', 'Generate Backup', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(837, 1, 'en', 'labels', 'backend.backup.db_storage', 'Database and Storage files', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(838, 1, 'en', 'labels', 'backend.backup.db_app', 'Database and Application files', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(839, 1, 'en', 'labels', 'backend.backup.backup_schedule', 'Backup Schedule', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(840, 1, 'en', 'labels', 'backend.backup.daily', 'Daily', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(841, 1, 'en', 'labels', 'backend.backup.weekly', 'Weekly', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(842, 1, 'en', 'labels', 'backend.backup.monthly', 'Monthly', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(843, 1, 'en', 'labels', 'backend.backup.dropbox_note', 'Please checkout documentation for <b>How to obtain DropBox App Keys?</b>', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(844, 1, 'en', 'labels', 'backend.backup.region', 'Region', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(845, 1, 'en', 'labels', 'backend.backup.bucket_name', 'Bucket Name', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(846, 1, 'en', 'labels', 'backend.backup.backup_notice', 'Please refer documentation before beginning backup. It has every details step by step for creating backup with Dropbox.', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(847, 1, 'en', 'labels', 'backend.backup.backup_note', '<b>Note </b>: To run this backup properly you need to add following code to your <b>CRON TAB:</b><br><code>* * * * * cd /path-to-your-project && php artisan schedule:run >> /dev/null 2>&1</code>', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(848, 1, 'en', 'labels', 'backend.certificates.title', 'Certificates', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(849, 1, 'en', 'labels', 'backend.certificates.fields.course_name', 'Course Name', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(850, 1, 'en', 'labels', 'backend.certificates.fields.progress', 'Progress', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(851, 1, 'en', 'labels', 'backend.certificates.fields.action', 'Action', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(852, 1, 'en', 'labels', 'backend.certificates.view', 'View', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(853, 1, 'en', 'labels', 'backend.certificates.download', 'Download', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(854, 1, 'en', 'labels', 'backend.bundles.title', 'Bundles', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(855, 1, 'en', 'labels', 'backend.bundles.fields.published', 'Published', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(856, 1, 'en', 'labels', 'backend.bundles.fields.unpublished', 'Not Published', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(857, 1, 'en', 'labels', 'backend.bundles.fields.featured', 'Featured', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(858, 1, 'en', 'labels', 'backend.bundles.fields.trending', 'Trending', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(859, 1, 'en', 'labels', 'backend.bundles.fields.free', 'Free', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(860, 1, 'en', 'labels', 'backend.bundles.fields.popular', 'Popular', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(861, 1, 'en', 'labels', 'backend.bundles.fields.teachers', 'Teachers', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(862, 1, 'en', 'labels', 'backend.bundles.fields.category', 'Category', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(863, 1, 'en', 'labels', 'backend.bundles.fields.title', 'Title', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(864, 1, 'en', 'labels', 'backend.bundles.fields.slug', 'Slug', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(865, 1, 'en', 'labels', 'backend.bundles.fields.description', 'Description', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(866, 1, 'en', 'labels', 'backend.bundles.fields.price', 'Price', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(867, 1, 'en', 'labels', 'backend.bundles.fields.course_image', 'Course Image', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(868, 1, 'en', 'labels', 'backend.bundles.fields.start_date', 'Start Date', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(869, 1, 'en', 'labels', 'backend.bundles.fields.meta_title', 'Meta Title', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(870, 1, 'en', 'labels', 'backend.bundles.fields.meta_description', 'Meta Description', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(871, 1, 'en', 'labels', 'backend.bundles.fields.meta_keywords', 'Meta Keywords', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(872, 1, 'en', 'labels', 'backend.bundles.fields.sidebar', 'Add Sidebar', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(873, 1, 'en', 'labels', 'backend.bundles.fields.expire_at', 'Expire / Disable Bundle Date', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(874, 1, 'en', 'labels', 'backend.bundles.fields.lessons.add', 'Add Lessons', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(875, 1, 'en', 'labels', 'backend.bundles.fields.lessons.view', 'View Lessons', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(876, 1, 'en', 'labels', 'backend.bundles.fields.course', 'Course', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(877, 1, 'en', 'labels', 'backend.bundles.fields.courses', 'Courses', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(878, 1, 'en', 'labels', 'backend.bundles.fields.status', 'Status', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(879, 1, 'en', 'labels', 'backend.bundles.add_courses', 'Add Courses', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(880, 1, 'en', 'labels', 'backend.bundles.add_teachers', 'Add Teachers', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(881, 1, 'en', 'labels', 'backend.bundles.add_categories', 'Add Categories', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(882, 1, 'en', 'labels', 'backend.bundles.slug_placeholder', 'Input slug or it will be generated automatically', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(883, 1, 'en', 'labels', 'backend.bundles.select_category', 'Select Category', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(884, 1, 'en', 'labels', 'backend.bundles.select_courses', 'Select Courses', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(885, 1, 'en', 'labels', 'backend.bundles.select_teachers', 'Select Teachers', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(886, 1, 'en', 'labels', 'backend.bundles.test', 'Test', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(887, 1, 'en', 'labels', 'backend.bundles.lesson', 'Lesson', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(888, 1, 'en', 'labels', 'backend.bundles.create', 'Create Bundle', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(889, 1, 'en', 'labels', 'backend.bundles.edit', 'Edit Bundle', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(890, 1, 'en', 'labels', 'backend.bundles.view', 'View Bundles', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(891, 1, 'en', 'labels', 'backend.bundles.category', 'Category', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(892, 1, 'en', 'labels', 'backend.bundles.save_timeline', 'Save timeline', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(893, 1, 'en', 'labels', 'backend.bundles.course_timeline', 'Course timeline', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(894, 1, 'en', 'labels', 'backend.bundles.timeline_description', 'Drag and change sequence of Lessons/Tests for course', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(895, 1, 'en', 'labels', 'backend.bundles.listing_note', 'Only Published Lessons and Tests will be Displayed and Sorted.', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(896, 1, 'en', 'labels', 'backend.reports.title', 'Reports', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(897, 1, 'en', 'labels', 'backend.reports.sales_report', 'Sales Report', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(898, 1, 'en', 'labels', 'backend.reports.students_report', 'Students Report', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(899, 1, 'en', 'labels', 'backend.reports.bundles', 'Bundles', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(900, 1, 'en', 'labels', 'backend.reports.courses', 'Courses', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(901, 1, 'en', 'labels', 'backend.reports.total_earnings', 'Total Earnings', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(902, 1, 'en', 'labels', 'backend.reports.total_sales', 'Total Sales', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(903, 1, 'en', 'labels', 'backend.reports.date_range', 'Date Range', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(904, 1, 'en', 'labels', 'backend.reports.select_student', 'Select Student', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(905, 1, 'en', 'labels', 'backend.reports.select_bundle', 'Select Bundle', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(906, 1, 'en', 'labels', 'backend.reports.select_course', 'Select Course', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(907, 1, 'en', 'labels', 'backend.reports.filter', 'Filter', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(908, 1, 'en', 'labels', 'backend.reports.reset', 'Reset', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(909, 1, 'en', 'labels', 'backend.reports.apply_date', 'Apply Date', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(910, 1, 'en', 'labels', 'backend.reports.date_input_lang.today', 'Today', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(911, 1, 'en', 'labels', 'backend.reports.date_input_lang.yesterday', 'Yesterday', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(912, 1, 'en', 'labels', 'backend.reports.date_input_lang.last_7_days', 'Last 7 Days', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(913, 1, 'en', 'labels', 'backend.reports.date_input_lang.last_30_days', 'Last 30 Days', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(914, 1, 'en', 'labels', 'backend.reports.date_input_lang.this_month', 'This Month', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(915, 1, 'en', 'labels', 'backend.reports.date_input_lang.last_month', 'Last Month', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(916, 1, 'en', 'labels', 'backend.reports.date_input_lang.quarter_to_date', 'Quarter to date', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(917, 1, 'en', 'labels', 'backend.reports.date_input_lang.year_to_date', 'Year to date', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(918, 1, 'en', 'labels', 'backend.reports.fields.name', 'Name', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(919, 1, 'en', 'labels', 'backend.reports.fields.orders', 'Orders', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(920, 1, 'en', 'labels', 'backend.reports.fields.earnings', 'Earnings', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(921, 1, 'en', 'labels', 'backend.reports.fields.course', 'Course', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(922, 1, 'en', 'labels', 'backend.reports.fields.user', 'User', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(923, 1, 'en', 'labels', 'backend.reports.fields.content', 'Content', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(924, 1, 'en', 'labels', 'backend.reports.fields.time', 'Time', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(925, 1, 'en', 'labels', 'backend.reports.fields.students', 'Students', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(926, 1, 'en', 'labels', 'backend.reports.fields.bundle', 'Bundle', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(927, 1, 'en', 'labels', 'backend.reports.fields.completed', 'Completed Course', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(928, 1, 'en', 'labels', 'backend.reports.fields.amount', 'Amount', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(929, 1, 'en', 'labels', 'backend.reports.fields.student', 'Student', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(930, 1, 'en', 'labels', 'backend.reports.fields.date', 'Date', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(931, 1, 'en', 'labels', 'backend.reports.fields.transaction', 'Transaction ID', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(932, 1, 'en', 'labels', 'backend.sitemap.title', 'Sitemap', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(933, 1, 'en', 'labels', 'backend.sitemap.records_per_file', 'Records Per File', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(934, 1, 'en', 'labels', 'backend.sitemap.records_note', 'Number of records per file.', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(935, 1, 'en', 'labels', 'backend.sitemap.generated', 'Sitemap generated successfully.', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(936, 1, 'en', 'labels', 'backend.sitemap.generate', 'Generate', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(937, 1, 'en', 'labels', 'backend.sitemap.daily', 'Daily', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(938, 1, 'en', 'labels', 'backend.sitemap.weekly', 'Weekly', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(939, 1, 'en', 'labels', 'backend.sitemap.monthly', 'Monthly', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(940, 1, 'en', 'labels', 'backend.sitemap.sitemap_note', 'This sitemap tool will generate sitemap for published Course, Bundles and Blog.', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(941, 1, 'en', 'labels', 'backend.forum_category.title', 'Forum Categories', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(942, 1, 'en', 'labels', 'backend.forum_category.create', 'Create Forum Category', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(943, 1, 'en', 'labels', 'backend.forum_category.edit', 'Edit Forum Category', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(944, 1, 'en', 'labels', 'backend.forum_category.view', 'View Forum Category', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(945, 1, 'en', 'labels', 'backend.forum_category.on', 'On', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(946, 1, 'en', 'labels', 'backend.forum_category.off', 'Off', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(947, 1, 'en', 'labels', 'backend.forum_category.fields.parent_category', 'Parent Category', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(948, 1, 'en', 'labels', 'backend.forum_category.fields.category', 'Category', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(949, 1, 'en', 'labels', 'backend.forum_category.fields.order', 'Order', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(950, 1, 'en', 'labels', 'backend.forum_category.fields.color', 'Color', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(951, 1, 'en', 'labels', 'backend.forum_category.fields.status', 'Status', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(952, 1, 'en', 'labels', 'backend.payments.title', 'Payments', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(953, 1, 'en', 'labels', 'backend.payments.total_earnings', 'Total Earnings', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(954, 1, 'en', 'labels', 'backend.payments.total_withdrawals', 'Total Withdrawals', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(955, 1, 'en', 'labels', 'backend.payments.total_withdrawal_pending', 'Total Withdrawal Pending', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(956, 1, 'en', 'labels', 'backend.payments.total_balance', 'Total Balance', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(957, 1, 'en', 'labels', 'backend.payments.earnings', 'Earnings', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(958, 1, 'en', 'labels', 'backend.payments.withdrawals', 'Withdrawals', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(959, 1, 'en', 'labels', 'backend.payments.add_withdrawal_request', 'Add Withdrawal Request', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(960, 1, 'en', 'labels', 'backend.payments.approve', 'Approve', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(961, 1, 'en', 'labels', 'backend.payments.reject', 'Reject', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(962, 1, 'en', 'labels', 'backend.payments.payment_type.bank', 'Bank', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(963, 1, 'en', 'labels', 'backend.payments.payment_type.paypal', 'Paypal', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(964, 1, 'en', 'labels', 'backend.payments.payment_type.offline', 'Offline', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(965, 1, 'en', 'labels', 'backend.payments.status.pending', 'Pending', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(966, 1, 'en', 'labels', 'backend.payments.status.approved', 'Approved', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(967, 1, 'en', 'labels', 'backend.payments.status.rejected', 'Rejected', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(968, 1, 'en', 'labels', 'backend.payments.fields.amount', 'Amount', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(969, 1, 'en', 'labels', 'backend.payments.fields.payment_type', 'Payment Type', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(970, 1, 'en', 'labels', 'backend.payments.fields.status', 'Status', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(971, 1, 'en', 'labels', 'backend.payments.fields.remarks', 'Remarks', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(972, 1, 'en', 'labels', 'backend.payments.fields.date', 'Date', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(973, 1, 'en', 'labels', 'backend.payments.fields.teacher_name', 'Teacher Name', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(974, 1, 'en', 'labels', 'backend.live_lessons.title', 'Live Lesson', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(975, 1, 'en', 'labels', 'backend.live_lessons.create', 'Create Live Lesson', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(976, 1, 'en', 'labels', 'backend.live_lessons.edit', 'Edit Live Lesson', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(977, 1, 'en', 'labels', 'backend.live_lessons.view', 'View Lesson', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(978, 1, 'en', 'labels', 'backend.live_lessons.select_course', 'Select Course', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(979, 1, 'en', 'labels', 'backend.live_lessons.short_description_placeholder', 'Input short description of live lesson', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(980, 1, 'en', 'labels', 'backend.live_lessons.fields.course', 'Course', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(981, 1, 'en', 'labels', 'backend.live_lessons.fields.title', 'Title', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(982, 1, 'en', 'labels', 'backend.live_lessons.fields.short_text', 'Sort Description', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(983, 1, 'en', 'labels', 'backend.live_lesson_slots.title', 'Live Lesson Slots', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(984, 1, 'en', 'labels', 'backend.live_lesson_slots.select_lesson', 'Select Lesson', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(985, 1, 'en', 'labels', 'backend.live_lesson_slots.create', 'Create Live Lesson Slot', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(986, 1, 'en', 'labels', 'backend.live_lesson_slots.edit', 'Edit Live Lesson Slot', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(987, 1, 'en', 'labels', 'backend.live_lesson_slots.view', 'View Slot', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(988, 1, 'en', 'labels', 'backend.live_lesson_slots.slot', 'Slot', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(989, 1, 'en', 'labels', 'backend.live_lesson_slots.short_description_placeholder', 'Input short description of slot', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(990, 1, 'en', 'labels', 'backend.live_lesson_slots.start_url', 'Start URL', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(991, 1, 'en', 'labels', 'backend.live_lesson_slots.slot_booked_student_list', 'Slot Booked Student List', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(992, 1, 'en', 'labels', 'backend.live_lesson_slots.student_name', 'Student Name', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(993, 1, 'en', 'labels', 'backend.live_lesson_slots.student_email', 'Student Email', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(994, 1, 'en', 'labels', 'backend.live_lesson_slots.closed', 'Closed', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(995, 1, 'en', 'labels', 'backend.live_lesson_slots.type.select_type', 'Select Type', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(996, 1, 'en', 'labels', 'backend.live_lesson_slots.type.daily', 'Daily', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(997, 1, 'en', 'labels', 'backend.live_lesson_slots.type.weekly', 'Weekly', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(998, 1, 'en', 'labels', 'backend.live_lesson_slots.type.monthly', 'Monthly', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(999, 1, 'en', 'labels', 'backend.live_lesson_slots.fields.lesson', 'Lesson', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(1000, 1, 'en', 'labels', 'backend.live_lesson_slots.fields.topic', 'Topic', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(1001, 1, 'en', 'labels', 'backend.live_lesson_slots.fields.short_text', 'Sort Description', '2022-03-30 15:37:07', '2022-03-30 15:37:07'),
(1002, 1, 'en', 'labels', 'backend.live_lesson_slots.fields.date_of_slot', 'Date', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1003, 1, 'en', 'labels', 'backend.live_lesson_slots.fields.duration', 'Duration(in minutes)', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1004, 1, 'en', 'labels', 'backend.live_lesson_slots.fields.meeting_id', 'Meeting ID', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1005, 1, 'en', 'labels', 'backend.live_lesson_slots.fields.date', 'Date', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1006, 1, 'en', 'labels', 'backend.live_lesson_slots.fields.password', 'Password', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1007, 1, 'en', 'labels', 'backend.live_lesson_slots.fields.change_default_setting', 'Change Default Setting', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1008, 1, 'en', 'labels', 'backend.live_lesson_slots.fields.student_limit', 'Student Limit', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1009, 1, 'en', 'labels', 'backend.zoom_setting.management', 'Zoom Setting', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1010, 1, 'en', 'labels', 'backend.zoom_setting.audio_options.both', 'Both', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1011, 1, 'en', 'labels', 'backend.zoom_setting.audio_options.voip', 'VoIP', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1012, 1, 'en', 'labels', 'backend.zoom_setting.audio_options.telephony', 'Telephony', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1013, 1, 'en', 'labels', 'backend.zoom_setting.meeting_approval_options.automatically', 'Automatically', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1014, 1, 'en', 'labels', 'backend.zoom_setting.meeting_approval_options.manually', 'Manually', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1015, 1, 'en', 'labels', 'backend.zoom_setting.meeting_approval_options.no_registration_required', 'No Registration Required', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1016, 1, 'en', 'labels', 'backend.zoom_setting.auto_recording_options.none', 'None', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1017, 1, 'en', 'labels', 'backend.zoom_setting.auto_recording_options.local', 'Local', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1018, 1, 'en', 'labels', 'backend.zoom_setting.auto_recording_options.cloud', 'Cloud', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1019, 1, 'en', 'labels', 'backend.zoom_setting.fields.api_key', 'API Key', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1020, 1, 'en', 'labels', 'backend.zoom_setting.fields.api_secret', 'Secret Key', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1021, 1, 'en', 'labels', 'backend.zoom_setting.fields.join_before_host', 'Join Before Host', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1022, 1, 'en', 'labels', 'backend.zoom_setting.fields.host_video', 'Host Video', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1023, 1, 'en', 'labels', 'backend.zoom_setting.fields.participant_video', 'Participant Video', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1024, 1, 'en', 'labels', 'backend.zoom_setting.fields.participant_mic_mute', 'Participant Mic Mute', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1025, 1, 'en', 'labels', 'backend.zoom_setting.fields.waiting_room', 'Waiting Room', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1026, 1, 'en', 'labels', 'backend.zoom_setting.fields.audio_option', 'Audio Option', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1027, 1, 'en', 'labels', 'backend.zoom_setting.fields.meeting_join_approval', 'Meeting Join Approval', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1028, 1, 'en', 'labels', 'backend.zoom_setting.fields.auto_recording', 'Auto Recording', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1029, 1, 'en', 'labels', 'backend.zoom_setting.fields.timezone', 'Timezone', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1030, 1, 'en', 'labels', 'backend.stripe.plan.title', 'Stripe Plans', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1031, 1, 'en', 'labels', 'backend.stripe.plan.create', 'Create Stripe Plan', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1032, 1, 'en', 'labels', 'backend.stripe.plan.edit', 'Edit Stripe Plan', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1033, 1, 'en', 'labels', 'backend.stripe.plan.view', 'View Stripe Plan', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1034, 1, 'en', 'labels', 'backend.stripe.plan.select_product', 'Select Product', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1035, 1, 'en', 'labels', 'backend.stripe.plan.course', '{0} Unlimited Access|{99} Not Access|[1,*] :quantity', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1036, 1, 'en', 'labels', 'backend.stripe.plan.bundle', '{0} Unlimited Access|{99} Not Access|[1,*] :quantity', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1037, 1, 'en', 'labels', 'backend.stripe.plan.interval_type.', 'Select Interval', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1038, 1, 'en', 'labels', 'backend.stripe.plan.interval_type.day', 'Day', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1039, 1, 'en', 'labels', 'backend.stripe.plan.interval_type.week', 'Week', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1040, 1, 'en', 'labels', 'backend.stripe.plan.interval_type.month', 'Month', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1041, 1, 'en', 'labels', 'backend.stripe.plan.interval_type.year', 'Year', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1042, 1, 'en', 'labels', 'backend.stripe.plan.input_quantity_note', '0 Means Unlimited Access, 99  Means Not Access', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1043, 1, 'en', 'labels', 'backend.stripe.plan.stripe_currency_note', '<strong>Please use currency code in lower case. Find your currency code <a href=\"//stripe.com/docs/currencies#presentment-currencies\" target=\"_blank\">Here</a></strong>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1044, 1, 'en', 'labels', 'backend.stripe.plan.fields.product', 'Product', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1045, 1, 'en', 'labels', 'backend.stripe.plan.fields.name', 'Name', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1046, 1, 'en', 'labels', 'backend.stripe.plan.fields.description', 'Description', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1047, 1, 'en', 'labels', 'backend.stripe.plan.fields.amount', 'Amount', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1048, 1, 'en', 'labels', 'backend.stripe.plan.fields.currency', 'Currency', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1049, 1, 'en', 'labels', 'backend.stripe.plan.fields.interval', 'Interval', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1050, 1, 'en', 'labels', 'backend.stripe.plan.fields.course', 'Course Quantity', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1051, 1, 'en', 'labels', 'backend.stripe.plan.fields.bundle', 'Bundle Quantity', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1052, 1, 'en', 'labels', 'backend.subscription.title', 'Subscription', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1053, 1, 'en', 'labels', 'backend.subscription.invoice_list', 'Invoice List', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1054, 1, 'en', 'labels', 'backend.subscription.click_here', 'Click Here', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1055, 1, 'en', 'labels', 'backend.subscription.cancel_title', 'Cancel Subscription', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1056, 1, 'en', 'labels', 'backend.subscription.subscribe_plan', 'Subscribe Plan', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1057, 1, 'en', 'labels', 'backend.subscription.date', 'Date', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1058, 1, 'en', 'labels', 'backend.subscription.sub_total', 'Sub Total', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1059, 1, 'en', 'labels', 'backend.subscription.total', 'Total', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1060, 1, 'en', 'labels', 'backend.subscription.download', 'Download', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1061, 1, 'en', 'labels', 'backend.subscription.active_plan', 'Active Plan', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1062, 1, 'en', 'labels', 'backend.subscription.course', 'Course', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1063, 1, 'en', 'labels', 'backend.subscription.bundle', 'Bundle', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1064, 1, 'en', 'labels', 'backend.subscription.quantity', '{0} Unlimited|{99} Not Access|[1,*] :quantity', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1065, 1, 'en', 'labels', 'backend.wishlist.title', 'Wishlist', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1066, 1, 'en', 'labels', 'backend.wishlist.course', 'Course', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1067, 1, 'en', 'labels', 'general.id', 'ID', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1068, 1, 'en', 'labels', 'general.active', 'Active', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1069, 1, 'en', 'labels', 'general.inactive', 'Inactive', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1070, 1, 'en', 'labels', 'general.yes', 'Yes', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1071, 1, 'en', 'labels', 'general.no', 'No', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1072, 1, 'en', 'labels', 'general.none', 'None', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1073, 1, 'en', 'labels', 'general.back', 'Back', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1074, 1, 'en', 'labels', 'general.more', 'More', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1075, 1, 'en', 'labels', 'general.buttons.update', 'Update', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1076, 1, 'en', 'labels', 'general.buttons.cancel', 'Cancel', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1077, 1, 'en', 'labels', 'general.buttons.save', 'Save', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1078, 1, 'en', 'labels', 'general.toolbar_btn_groups', 'Toolbar with button groups', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1079, 1, 'en', 'labels', 'general.create_new', 'Create New', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1080, 1, 'en', 'labels', 'general.all', 'All', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1081, 1, 'en', 'labels', 'general.trash', 'Trash', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1082, 1, 'en', 'labels', 'general.delete', 'Delete', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1083, 1, 'en', 'labels', 'general.no_data_available', 'No data available', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1084, 1, 'en', 'labels', 'general.edit', 'Edit', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1085, 1, 'en', 'labels', 'general.copyright', 'Copyright', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1086, 1, 'en', 'labels', 'general.delete_selected', 'Delete Selected', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1087, 1, 'en', 'labels', 'general.custom', 'Custom', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1088, 1, 'en', 'labels', 'general.actions', 'Actions', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1089, 1, 'en', 'labels', 'general.hide', 'Hide', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1090, 1, 'en', 'labels', 'general.show', 'Show', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1091, 1, 'en', 'labels', 'general.toggle_navigation', 'Toggle Navigation', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1092, 1, 'en', 'labels', 'general.sr_no', 'Sr No.', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1093, 1, 'en', 'labels', 'general.read_more', 'Read More', '2022-03-30 15:37:08', '2022-03-30 15:37:08');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1094, 1, 'en', 'labels', 'frontend.auth.login_button', 'Login', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1095, 1, 'en', 'labels', 'frontend.auth.login_box_title', 'Login', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1096, 1, 'en', 'labels', 'frontend.auth.remember_me', 'Remember Me', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1097, 1, 'en', 'labels', 'frontend.auth.register_box_title', 'Register', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1098, 1, 'en', 'labels', 'frontend.auth.register_button', 'Register', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1099, 1, 'en', 'labels', 'frontend.auth.login_with', 'Login with :social_media', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1100, 1, 'en', 'labels', 'frontend.passwords.reset_password_box_title', 'Reset Password', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1101, 1, 'en', 'labels', 'frontend.passwords.send_password_reset_link_button', 'Send Password Reset Link', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1102, 1, 'en', 'labels', 'frontend.passwords.expired_password_box_title', 'Your password has expired.', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1103, 1, 'en', 'labels', 'frontend.passwords.update_password_button', 'Update Password', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1104, 1, 'en', 'labels', 'frontend.passwords.reset_password_button', 'Reset Password', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1105, 1, 'en', 'labels', 'frontend.passwords.forgot_password', 'Forgot Your Password?', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1106, 1, 'en', 'labels', 'frontend.blog.share_this_news', 'Share this news', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1107, 1, 'en', 'labels', 'frontend.blog.related_news', '<span>Related</span> News', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1108, 1, 'en', 'labels', 'frontend.blog.post_comments', 'Post <span>Comments.</span>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1109, 1, 'en', 'labels', 'frontend.blog.write_a_comment', 'Write a Comment', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1110, 1, 'en', 'labels', 'frontend.blog.add_comment', 'Add Comment', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1111, 1, 'en', 'labels', 'frontend.blog.by', 'By', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1112, 1, 'en', 'labels', 'frontend.blog.title', 'Blog', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1113, 1, 'en', 'labels', 'frontend.blog.search_blog', 'Search Blog', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1114, 1, 'en', 'labels', 'frontend.blog.blog_categories', 'Blog <span>Categories.</span>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1115, 1, 'en', 'labels', 'frontend.blog.popular_tags', 'Popular <span>Tags.</span>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1116, 1, 'en', 'labels', 'frontend.blog.featured_course', 'Featured <span>Course.</span>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1117, 1, 'en', 'labels', 'frontend.blog.login_to_post_comment', 'Login to Post a Comment', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1118, 1, 'en', 'labels', 'frontend.blog.no_comments_yet', 'No comments yet, Be the first to comment.', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1119, 1, 'en', 'labels', 'frontend.cart.payment_status', 'Payment Status', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1120, 1, 'en', 'labels', 'frontend.cart.payment_cards', 'Credit or Debit Card', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1121, 1, 'en', 'labels', 'frontend.cart.name_on_card_placeholder', 'Enter the name written on your card', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1122, 1, 'en', 'labels', 'frontend.cart.no_payment_method', 'No payment method available at this moment', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1123, 1, 'en', 'labels', 'frontend.cart.card_number_placeholder', 'Enter your card number', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1124, 1, 'en', 'labels', 'frontend.cart.cvv', 'CVV', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1125, 1, 'en', 'labels', 'frontend.cart.mm', 'MM', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1126, 1, 'en', 'labels', 'frontend.cart.yy', 'YY', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1127, 1, 'en', 'labels', 'frontend.cart.pay_now', 'Pay Now', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1128, 1, 'en', 'labels', 'frontend.cart.stripe_error_message', 'Please correct the errors and try again.', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1129, 1, 'en', 'labels', 'frontend.cart.paypal', 'PayPal', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1130, 1, 'en', 'labels', 'frontend.cart.pay_securely_paypal', 'Pay securely with PayPal', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1131, 1, 'en', 'labels', 'frontend.cart.offline_payment', 'Offline Payment', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1132, 1, 'en', 'labels', 'frontend.cart.offline_payment_note', 'In this payment method our executives will contact you and give you instructions regarding payment and course purchase.', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1133, 1, 'en', 'labels', 'frontend.cart.request_assistance', 'Request Assistance', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1134, 1, 'en', 'labels', 'frontend.cart.cart', 'Cart', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1135, 1, 'en', 'labels', 'frontend.cart.checkout', 'Checkout', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1136, 1, 'en', 'labels', 'frontend.cart.your_shopping_cart', 'Your Shopping Cart', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1137, 1, 'en', 'labels', 'frontend.cart.complete_your_purchases', 'Complete<span> Your Purchases.</span>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1138, 1, 'en', 'labels', 'frontend.cart.order_item', 'Order <span>Item.</span>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1139, 1, 'en', 'labels', 'frontend.cart.course_name', 'Course Name', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1140, 1, 'en', 'labels', 'frontend.cart.course_type', 'Course Type', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1141, 1, 'en', 'labels', 'frontend.cart.starts', 'Starts', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1142, 1, 'en', 'labels', 'frontend.cart.empty_cart', 'Your cart is empty', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1143, 1, 'en', 'labels', 'frontend.cart.order_payment', 'Order <span>Payment.</span>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1144, 1, 'en', 'labels', 'frontend.cart.name_on_card', 'Name on Card', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1145, 1, 'en', 'labels', 'frontend.cart.card_number', 'Card Number', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1146, 1, 'en', 'labels', 'frontend.cart.expiration_date', 'Expiration Date', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1147, 1, 'en', 'labels', 'frontend.cart.confirmation_note', 'By confirming this purchase, I agree to the <b>Term of Use, Refund Policy</b> and <b>Privacy Policy</b>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1148, 1, 'en', 'labels', 'frontend.cart.order_detail', 'Order <span>Detail.</span>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1149, 1, 'en', 'labels', 'frontend.cart.total', 'Total', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1150, 1, 'en', 'labels', 'frontend.cart.your_payment_status', 'Your <span>Payment Status.</span>', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1151, 1, 'en', 'labels', 'frontend.cart.success_message', 'Congratulations. Enjoy your course', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1152, 1, 'en', 'labels', 'frontend.cart.see_more_courses', 'See More Courses', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1153, 1, 'en', 'labels', 'frontend.cart.go_back_to_cart', 'Go back to Cart', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1154, 1, 'en', 'labels', 'frontend.cart.product_name', 'Product Name', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1155, 1, 'en', 'labels', 'frontend.cart.product_type', 'Product Type', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1156, 1, 'en', 'labels', 'frontend.cart.product_added', 'Product added to cart successfully', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1157, 1, 'en', 'labels', 'frontend.cart.try_again', 'Error! Please Try again.', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1158, 1, 'en', 'labels', 'frontend.cart.payment_done', 'Payment done successfully !', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1159, 1, 'en', 'labels', 'frontend.cart.payment_failed', 'Error! Payment Failed!', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1160, 1, 'en', 'labels', 'frontend.cart.offline_request', 'Request received successfully! check your registered email for further details.', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1161, 1, 'en', 'labels', 'frontend.cart.purchase_successful', 'Congratulations! You\'ve purchased this course.', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1162, 1, 'en', 'labels', 'frontend.cart.unknown_error', 'Unknown error occurred', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1163, 1, 'en', 'labels', 'frontend.cart.connection_timeout', 'Connection Timeout', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1164, 1, 'en', 'labels', 'frontend.cart.sub_total', 'Sub Total', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1165, 1, 'en', 'labels', 'frontend.cart.apply', 'Apply', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1166, 1, 'en', 'labels', 'frontend.cart.items', 'items', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1167, 1, 'en', 'labels', 'frontend.cart.item', 'item', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1168, 1, 'en', 'labels', 'frontend.cart.offers', 'Offers', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1169, 1, 'en', 'labels', 'frontend.cart.empty_input', 'Write coupon code before applying', '2022-03-30 15:37:08', '2022-03-30 15:37:08'),
(1170, 1, 'en', 'labels', 'frontend.cart.invalid_coupon', 'Invalid Coupon!', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1171, 1, 'en', 'labels', 'frontend.cart.amount', 'Amount', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1172, 1, 'en', 'labels', 'frontend.cart.total_payable', 'Total Payable', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1173, 1, 'en', 'labels', 'frontend.cart.price', 'Price', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1174, 1, 'en', 'labels', 'frontend.cart.instamojo', 'Instamojo', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1175, 1, 'en', 'labels', 'frontend.cart.pay_securely_instamojo', 'Pay securely with Instamojo', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1176, 1, 'en', 'labels', 'frontend.cart.razorpay', 'RazorPay', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1177, 1, 'en', 'labels', 'frontend.cart.pay_securely_razorpay', 'Pay securely with RazorPay', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1178, 1, 'en', 'labels', 'frontend.cart.cashfree', 'CashFree', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1179, 1, 'en', 'labels', 'frontend.cart.pay_securely_cashfree', 'Pay securely with CashFree', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1180, 1, 'en', 'labels', 'frontend.cart.user_email', 'Email', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1181, 1, 'en', 'labels', 'frontend.cart.user_phone', 'Phone', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1182, 1, 'en', 'labels', 'frontend.cart.user_name', 'Name', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1183, 1, 'en', 'labels', 'frontend.cart.payu', 'PayUMoney', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1184, 1, 'en', 'labels', 'frontend.cart.pay_securely_payu', 'Pay securely with PayUMoney', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1185, 1, 'en', 'labels', 'frontend.cart.flutter', 'Flutter', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1186, 1, 'en', 'labels', 'frontend.cart.pay_securely_flutter', 'Pay securely with Flutter', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1187, 1, 'en', 'labels', 'frontend.contact.title', 'Contact', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1188, 1, 'en', 'labels', 'frontend.contact.your_name', 'Your Name', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1189, 1, 'en', 'labels', 'frontend.contact.your_email', 'Your Email', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1190, 1, 'en', 'labels', 'frontend.contact.phone_number', 'Phone Number', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1191, 1, 'en', 'labels', 'frontend.contact.message', 'Message', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1192, 1, 'en', 'labels', 'frontend.contact.box_title', 'Contact Us', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1193, 1, 'en', 'labels', 'frontend.contact.button', 'Send Information', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1194, 1, 'en', 'labels', 'frontend.contact.send_us_a_message', 'Send Us A<span> Message.</span>', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1195, 1, 'en', 'labels', 'frontend.contact.keep_in_touch', 'Keep<span> In Touch.</span>', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1196, 1, 'en', 'labels', 'frontend.contact.send_email', 'Send Email', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1197, 1, 'en', 'labels', 'frontend.contact.send_message_now', 'Send Message Now', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1198, 1, 'en', 'labels', 'frontend.badges.trending', 'Trending', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1199, 1, 'en', 'labels', 'frontend.course.ratings', 'Ratings', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1200, 1, 'en', 'labels', 'frontend.course.stars', 'Stars', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1201, 1, 'en', 'labels', 'frontend.course.by', 'By', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1202, 1, 'en', 'labels', 'frontend.course.no_reviews_yet', 'No reviews yet.', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1203, 1, 'en', 'labels', 'frontend.course.add_to_cart', 'Add To Cart', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1204, 1, 'en', 'labels', 'frontend.course.buy_note', 'Only Students Can Buy Course', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1205, 1, 'en', 'labels', 'frontend.course.continue_course', 'Continue Course', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1206, 1, 'en', 'labels', 'frontend.course.enrolled', 'Enrolled', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1207, 1, 'en', 'labels', 'frontend.course.chapters', 'Chapters', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1208, 1, 'en', 'labels', 'frontend.course.category', 'Category', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1209, 1, 'en', 'labels', 'frontend.course.author', 'Author', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1210, 1, 'en', 'labels', 'frontend.course.courses', 'Courses', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1211, 1, 'en', 'labels', 'frontend.course.students', 'Students', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1212, 1, 'en', 'labels', 'frontend.course.give_test_again', 'Give Test Again', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1213, 1, 'en', 'labels', 'frontend.course.submit_results', 'Submit Results', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1214, 1, 'en', 'labels', 'frontend.course.chapter_videos', 'Chapter Videos', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1215, 1, 'en', 'labels', 'frontend.course.download_files', 'Download Files', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1216, 1, 'en', 'labels', 'frontend.course.mb', 'MB', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1217, 1, 'en', 'labels', 'frontend.course.prev', 'PREV', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1218, 1, 'en', 'labels', 'frontend.course.test', 'Test', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1219, 1, 'en', 'labels', 'frontend.course.completed', 'Completed', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1220, 1, 'en', 'labels', 'frontend.course.title', 'Course', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1221, 1, 'en', 'labels', 'frontend.course.course_details', '<span>Course Details.</span>', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1222, 1, 'en', 'labels', 'frontend.course.course_detail', 'Course Details', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1223, 1, 'en', 'labels', 'frontend.course.course_timeline', 'Course <b>Timeline:</b>', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1224, 1, 'en', 'labels', 'frontend.course.go', 'Go', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1225, 1, 'en', 'labels', 'frontend.course.course_reviews', 'Course <span>Reviews:</span>', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1226, 1, 'en', 'labels', 'frontend.course.average_rating', 'Average Rating', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1227, 1, 'en', 'labels', 'frontend.course.details', 'Details', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1228, 1, 'en', 'labels', 'frontend.course.add_reviews', 'Add <span>Reviews.</span>', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1229, 1, 'en', 'labels', 'frontend.course.your_rating', 'Your Rating', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1230, 1, 'en', 'labels', 'frontend.course.message', 'Message', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1231, 1, 'en', 'labels', 'frontend.course.add_review_now', 'Add Review Now', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1232, 1, 'en', 'labels', 'frontend.course.price', 'Price', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1233, 1, 'en', 'labels', 'frontend.course.added_to_cart', 'Added To Cart', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1234, 1, 'en', 'labels', 'frontend.course.buy_now', 'Buy Now', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1235, 1, 'en', 'labels', 'frontend.course.get_now', 'Get Now', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1236, 1, 'en', 'labels', 'frontend.course.recent_news', '<span>Recent  </span>News.', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1237, 1, 'en', 'labels', 'frontend.course.view_all_news', 'View All News', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1238, 1, 'en', 'labels', 'frontend.course.featured_course', '<span>Featured</span> Course.', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1239, 1, 'en', 'labels', 'frontend.course.sort_by', '<b>Sort</b> By', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1240, 1, 'en', 'labels', 'frontend.course.popular', 'Popular', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1241, 1, 'en', 'labels', 'frontend.course.none', 'None', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1242, 1, 'en', 'labels', 'frontend.course.trending', 'Trending', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1243, 1, 'en', 'labels', 'frontend.course.featured', 'Featured', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1244, 1, 'en', 'labels', 'frontend.course.course_name', 'Course Name', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1245, 1, 'en', 'labels', 'frontend.course.course_type', 'Course Type', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1246, 1, 'en', 'labels', 'frontend.course.starts', 'Starts', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1247, 1, 'en', 'labels', 'frontend.course.full_text', 'FULL TEXT', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1248, 1, 'en', 'labels', 'frontend.course.find_courses', 'FIND COURSES', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1249, 1, 'en', 'labels', 'frontend.course.your_test_score', 'Your Test Score', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1250, 1, 'en', 'labels', 'frontend.course.find_your_course', '<span>Find </span>Your Course.', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1251, 1, 'en', 'labels', 'frontend.course.next', 'NEXT', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1252, 1, 'en', 'labels', 'frontend.course.progress', 'Progress', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1253, 1, 'en', 'labels', 'frontend.course.finish_course', 'Finish Course', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1254, 1, 'en', 'labels', 'frontend.course.certified', 'You\'re Certified for this course', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1255, 1, 'en', 'labels', 'frontend.course.course', 'Course', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1256, 1, 'en', 'labels', 'frontend.course.bundles', 'Bundles', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1257, 1, 'en', 'labels', 'frontend.course.bundle_detail', 'Bundle Details', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1258, 1, 'en', 'labels', 'frontend.course.bundle_reviews', 'Bundle <span>Reviews:</span>', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1259, 1, 'en', 'labels', 'frontend.course.available_in_bundles', 'Also available in Bundles', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1260, 1, 'en', 'labels', 'frontend.course.complete_test', 'Please Complete Test', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1261, 1, 'en', 'labels', 'frontend.course.looking_for', 'Looking For?', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1262, 1, 'en', 'labels', 'frontend.course.not_attempted', 'Not Attempted', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1263, 1, 'en', 'labels', 'frontend.course.explanation', 'Explanation', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1264, 1, 'en', 'labels', 'frontend.course.find_your_bundle', '<span>Find</span> your Bundle', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1265, 1, 'en', 'labels', 'frontend.course.select_category', 'Select Category', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1266, 1, 'en', 'labels', 'frontend.course.live_lesson', 'Live Lessons', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1267, 1, 'en', 'labels', 'frontend.course.slot', 'Slot', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1268, 1, 'en', 'labels', 'frontend.course.available_slots', 'Available Slots', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1269, 1, 'en', 'labels', 'frontend.course.date', 'Date', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1270, 1, 'en', 'labels', 'frontend.course.live_lesson_join_url', 'Join URL', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1271, 1, 'en', 'labels', 'frontend.course.live_lesson_meeting_password', 'Password', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1272, 1, 'en', 'labels', 'frontend.course.live_lesson_meeting_date', 'Meeting Date', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1273, 1, 'en', 'labels', 'frontend.course.live_lesson_meeting_id', 'Meeting ID', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1274, 1, 'en', 'labels', 'frontend.course.live_lesson_meeting_duration', 'Durations', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1275, 1, 'en', 'labels', 'frontend.course.book_slot', 'Book a Slot', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1276, 1, 'en', 'labels', 'frontend.course.full_slot', 'Slot is full', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1277, 1, 'en', 'labels', 'frontend.course.subscribe', 'Subscribe', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1278, 1, 'en', 'labels', 'frontend.course.original_price', 'Original Price', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1279, 1, 'en', 'labels', 'frontend.home.title', 'Home', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1280, 1, 'en', 'labels', 'frontend.home.search_course_placeholder', 'Type what do you want to learn today?', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1281, 1, 'en', 'labels', 'frontend.home.popular_teachers', '<span>Popular</span> Teachers', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1282, 1, 'en', 'labels', 'frontend.home.learn_new_skills', 'Learn new skills', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1283, 1, 'en', 'labels', 'frontend.home.search_course', 'Search Course', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1284, 1, 'en', 'labels', 'frontend.home.search_courses', '<span>Search</span> Courses.', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1285, 1, 'en', 'labels', 'frontend.home.students_enrolled', 'Students Enrolled', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1286, 1, 'en', 'labels', 'frontend.home.online_available_courses', 'Online Available Courses', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1287, 1, 'en', 'labels', 'frontend.home.teachers', 'Teachers', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1288, 1, 'en', 'labels', 'frontend.home.our_professionals', 'Our Professionals', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1289, 1, 'en', 'labels', 'frontend.home.all_teachers', 'All Teachers', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1290, 1, 'en', 'labels', 'frontend.home.what_they_say_about_us', 'What they say about us', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1291, 1, 'en', 'labels', 'frontend.home.no_data_available', 'No data available', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1292, 1, 'en', 'labels', 'frontend.layouts.partials.advantages', 'Advantages', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1293, 1, 'en', 'labels', 'frontend.layouts.partials.email_address', 'Email Address', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1294, 1, 'en', 'labels', 'frontend.layouts.partials.email_registration', 'Email Us For Free Registration', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1295, 1, 'en', 'labels', 'frontend.layouts.partials.call_us_registration', 'Call Us For Free Registration', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1296, 1, 'en', 'labels', 'frontend.layouts.partials.students', 'Students', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1297, 1, 'en', 'labels', 'frontend.layouts.partials.faq', 'FAQ', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1298, 1, 'en', 'labels', 'frontend.layouts.partials.more_faqs', 'More Faqs', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1299, 1, 'en', 'labels', 'frontend.layouts.partials.search_placeholder', 'Type what do you want to learn today?', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1300, 1, 'en', 'labels', 'frontend.layouts.partials.search_our_courses', 'SEARCH OUR COURSES', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1301, 1, 'en', 'labels', 'frontend.layouts.partials.browse_featured_course', 'Browse Our<span> Featured Course.</span>', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1302, 1, 'en', 'labels', 'frontend.layouts.partials.course_detail', 'Course detail', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1303, 1, 'en', 'labels', 'frontend.layouts.partials.contact_us', 'Contact Us', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1304, 1, 'en', 'labels', 'frontend.layouts.partials.get_in_touch', 'Get In Touch', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1305, 1, 'en', 'labels', 'frontend.layouts.partials.primary', 'Primary', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1306, 1, 'en', 'labels', 'frontend.layouts.partials.second', 'Second', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1307, 1, 'en', 'labels', 'frontend.layouts.partials.courses_categories', 'Courses Categories', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1308, 1, 'en', 'labels', 'frontend.layouts.partials.browse_course_by_category', 'Browse Courses<span> By Category.</span>', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1309, 1, 'en', 'labels', 'frontend.layouts.partials.faq_full', 'Frequently<span> Asked Questions</span>', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1310, 1, 'en', 'labels', 'frontend.layouts.partials.social_network', 'Social Network', '2022-03-30 15:37:09', '2022-03-30 15:37:09'),
(1311, 1, 'en', 'labels', 'frontend.layouts.partials.subscribe_newsletter', 'Subscribe Newsletter', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1312, 1, 'en', 'labels', 'frontend.layouts.partials.subscribe_now', 'Subscribe Now', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1313, 1, 'en', 'labels', 'frontend.layouts.partials.latest_news_blog', 'Latest <span>News Blog.</span>', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1314, 1, 'en', 'labels', 'frontend.layouts.partials.trending_courses', 'Trending <span>Courses.</span>', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1315, 1, 'en', 'labels', 'frontend.layouts.partials.popular_courses', 'Popular <span>Courses.</span>', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1316, 1, 'en', 'labels', 'frontend.layouts.partials.view_all_news', 'View All News', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1317, 1, 'en', 'labels', 'frontend.layouts.partials.view_all_trending_courses', 'View All Trending Courses', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1318, 1, 'en', 'labels', 'frontend.layouts.partials.view_all_popular_courses', 'View All Popular Courses', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1319, 1, 'en', 'labels', 'frontend.layouts.partials.learn_new_skills', 'Learn new skills', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1320, 1, 'en', 'labels', 'frontend.layouts.partials.recent_news', '<span>Recent  </span>News.', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1321, 1, 'en', 'labels', 'frontend.layouts.partials.featured_course', '<span>Featured  </span>Course.', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1322, 1, 'en', 'labels', 'frontend.layouts.partials.days', 'Days', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1323, 1, 'en', 'labels', 'frontend.layouts.partials.hours', 'Hours', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1324, 1, 'en', 'labels', 'frontend.layouts.partials.minutes', 'Minutes', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1325, 1, 'en', 'labels', 'frontend.layouts.partials.seconds', 'Seconds', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1326, 1, 'en', 'labels', 'frontend.layouts.partials.search_courses', 'Search Courses', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1327, 1, 'en', 'labels', 'frontend.layouts.partials.sponsors', 'Sponsors.', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1328, 1, 'en', 'labels', 'frontend.layouts.partials.students_testimonial', 'Students <span>Testimonial.</span>', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1329, 1, 'en', 'labels', 'frontend.layouts.partials.why_choose', 'Reason Why Choose', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1330, 1, 'en', 'labels', 'frontend.layouts.partials.certificate_verification', 'Certificate Verification', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1331, 1, 'en', 'labels', 'frontend.layouts.partials.offers', 'Offers', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1332, 1, 'en', 'labels', 'frontend.modal.new_user_note', 'New User? Register Here', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1333, 1, 'en', 'labels', 'frontend.modal.registration_message', 'Registration Successful. Please LogIn', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1334, 1, 'en', 'labels', 'frontend.modal.my_account', 'My Account', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1335, 1, 'en', 'labels', 'frontend.modal.login_register', '<a href=\"#\" class=\"font-weight-bold go-login px-0\">LOGIN</a> to our website, or <a href=\"#\" class=\"font-weight-bold go-register px-0\" id=\"\">REGISTER</a>', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1336, 1, 'en', 'labels', 'frontend.modal.already_user_note', 'Already a user? Login Here', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1337, 1, 'en', 'labels', 'frontend.modal.login_now', 'LogIn Now', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1338, 1, 'en', 'labels', 'frontend.modal.register_now', 'Register Now', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1339, 1, 'en', 'labels', 'frontend.search_result.students', 'Students', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1340, 1, 'en', 'labels', 'frontend.search_result.blog', 'Blog', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1341, 1, 'en', 'labels', 'frontend.search_result.search_blog', 'Search Blog', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1342, 1, 'en', 'labels', 'frontend.search_result.sort_by', '<b>Sort</b> By', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1343, 1, 'en', 'labels', 'frontend.search_result.popular', 'Popular', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1344, 1, 'en', 'labels', 'frontend.search_result.none', 'None', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1345, 1, 'en', 'labels', 'frontend.search_result.trending', 'Trending', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1346, 1, 'en', 'labels', 'frontend.search_result.featured', 'Featured', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1347, 1, 'en', 'labels', 'frontend.search_result.course_name', 'Course Name', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1348, 1, 'en', 'labels', 'frontend.search_result.course_type', 'Course Type', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1349, 1, 'en', 'labels', 'frontend.search_result.starts', 'Starts', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1350, 1, 'en', 'labels', 'frontend.search_result.course_detail', 'Course Detail', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1351, 1, 'en', 'labels', 'frontend.teacher.send_now', 'Send Now', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1352, 1, 'en', 'labels', 'frontend.teacher.students', 'Students', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1353, 1, 'en', 'labels', 'frontend.teacher.title', 'Teachers', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1354, 1, 'en', 'labels', 'frontend.teacher.courses_by_teacher', 'Courses <span>By Teacher.</span>', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1355, 1, 'en', 'labels', 'frontend.teacher.course_detail', 'Course Detail', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1356, 1, 'en', 'labels', 'frontend.user.passwords.change', 'Change Password', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1357, 1, 'en', 'labels', 'frontend.user.profile.avatar', 'Avatar', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1358, 1, 'en', 'labels', 'frontend.user.profile.created_at', 'Created At', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1359, 1, 'en', 'labels', 'frontend.user.profile.edit_information', 'Edit Information', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1360, 1, 'en', 'labels', 'frontend.user.profile.email', 'E-mail', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1361, 1, 'en', 'labels', 'frontend.user.profile.last_updated', 'Last Updated', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1362, 1, 'en', 'labels', 'frontend.user.profile.name', 'Name', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1363, 1, 'en', 'labels', 'frontend.user.profile.first_name', 'First Name', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1364, 1, 'en', 'labels', 'frontend.user.profile.last_name', 'Last Name', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1365, 1, 'en', 'labels', 'frontend.user.profile.update_information', 'Update Information', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1366, 1, 'en', 'labels', 'frontend.faq.title', 'Frequently <span>Asked Questions</span>', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1367, 1, 'en', 'labels', 'frontend.faq.find', 'Find <span>Your Questions & Answers.</span>', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1368, 1, 'en', 'labels', 'frontend.faq.make_question', 'Make Question', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1369, 1, 'en', 'labels', 'frontend.faq.contact_us', 'Contact Us', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1370, 1, 'en', 'labels', 'frontend.certificate_verification.title', 'Certificate Verification', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1371, 1, 'en', 'labels', 'frontend.certificate_verification.name_on_certificate', 'Name on Certificate. Ex. John', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1372, 1, 'en', 'labels', 'frontend.certificate_verification.date_on_certificate', 'Date on Certificate. Ex. 2018-11-25', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1373, 1, 'en', 'labels', 'frontend.certificate_verification.verify_now', 'Verify Now', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1374, 1, 'en', 'labels', 'frontend.certificate_verification.not_found', 'No certificate found for given information.', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1375, 1, 'en', 'labels', 'frontend.footer.popular_courses', 'Popular courses', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1376, 1, 'en', 'labels', 'frontend.footer.popular_categories', 'Popular Categories', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1377, 1, 'en', 'labels', 'frontend.footer.featured_courses', 'Featured Courses', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1378, 1, 'en', 'labels', 'frontend.footer.trending_courses', 'Trending Courses', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1379, 1, 'en', 'labels', 'frontend.footer.useful_links', 'Useful Links', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1380, 1, 'en', 'labels', 'frontend.offers.title', 'Offers', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1381, 1, 'en', 'labels', 'frontend.offers.no_offers', 'No Offers', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1382, 1, 'en', 'labels', 'frontend.offers.unlimited', 'Unlimited', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1383, 1, 'en', 'labels', 'frontend.offers.validity', 'Validity', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1384, 1, 'en', 'labels', 'frontend.offers.minimum_order_amount', 'Minimum Order Amount', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1385, 1, 'en', 'labels', 'frontend.offers.usage', 'Usage', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1386, 1, 'en', 'labels', 'frontend.offers.per_user', 'Per User', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1387, 1, 'en', 'labels', 'lang.en', 'English', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1388, 1, 'en', 'labels', 'lang.sp', 'Spanish', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1389, 1, 'en', 'labels', 'lang.fr', 'French', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1390, 1, 'en', 'labels', 'lang.ar', 'Arabic', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1391, 1, 'en', 'labels', 'teacher.teacher_register', 'Register as Teacher? Click Here', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1392, 1, 'en', 'labels', 'teacher.teacher_register_box_title', 'Teacher Register', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1393, 1, 'en', 'labels', 'teacher.facebook_link', 'Facebook Link', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1394, 1, 'en', 'labels', 'teacher.twitter_link', 'Twitter Link', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1395, 1, 'en', 'labels', 'teacher.linkedin_link', 'Linkedin Link', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1396, 1, 'en', 'labels', 'teacher.payment_details', 'Payment Details', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1397, 1, 'en', 'labels', 'teacher.bank', 'Bank', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1398, 1, 'en', 'labels', 'teacher.paypal', 'Paypal', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1399, 1, 'en', 'labels', 'teacher.paypal_email', 'Paypal Email', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1400, 1, 'en', 'labels', 'teacher.bank_details.name', 'Bank Name', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1401, 1, 'en', 'labels', 'teacher.bank_details.bank_code', 'Bank Code', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1402, 1, 'en', 'labels', 'teacher.bank_details.account', 'Account Number', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1403, 1, 'en', 'labels', 'teacher.bank_details.holder_name', 'Account Name', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1404, 1, 'en', 'labels', 'teacher.bank_details.account_number', 'Account Number', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1405, 1, 'en', 'labels', 'teacher.bank_details.ifsc_code', 'IFSC Code', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1406, 1, 'en', 'labels', 'teacher.description', 'Description', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1407, 1, 'en', 'labels', 'subscription.title', 'Subscription Plan', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1408, 1, 'en', 'labels', 'subscription.quantity', '{0} Unlimited Access|[1,*] Total :quantity Quantity Access', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1409, 1, 'en', 'labels', 'subscription.course', '{0} Unlimited Courses Access|{99} Course Not Available|[1,1]:quantity Course|[2,*]:quantity Courses', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1410, 1, 'en', 'labels', 'subscription.bundle', '{0} Unlimited Bundles Access|{99} Bundle Not Available|[1,1]:quantity Bundle|[2,*]:quantity Bundles', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1411, 1, 'en', 'labels', 'subscription.button', 'Subscribe', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1412, 1, 'en', 'labels', 'subscription.plan', 'Plan', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1413, 1, 'en', 'labels', 'subscription.price', 'Price', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1414, 1, 'en', 'labels', 'subscription.trial_period', 'Trial Period :days Days', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1415, 1, 'en', 'labels', 'subscription.payment_status', 'Subscription Payment Status', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1416, 1, 'en', 'labels', 'subscription.already_subscribe', 'Already Subscribe', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1417, 1, 'en', 'labels', 'subscription.your_subscription_status', 'Your <span>Subscription Status.</span>', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1418, 1, 'en', 'labels', 'subscription.go_to_home', 'Home', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1419, 1, 'en', 'labels', 'subscription.go_to_plan', 'Go to Plans', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1420, 1, 'en', 'labels', 'subscription.done', 'Subscription done successfully !', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1421, 1, 'en', 'labels', 'subscription.update', 'Subscription update successfully !', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1422, 1, 'en', 'labels', 'subscription.failed', 'Error! Subscription Failed!', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1423, 1, 'en', 'labels', 'subscription.cancel', 'Subscription Canceled!', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1424, 1, 'en', 'labels', 'subscription.resume', 'Subscription Resume!', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1425, 1, 'en', 'labels', 'subscription.form.name', 'Name', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1426, 1, 'en', 'labels', 'subscription.form.email', 'Email', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1427, 1, 'en', 'labels', 'subscription.form.address', 'Address', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1428, 1, 'en', 'labels', 'subscription.form.city', 'City', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1429, 1, 'en', 'labels', 'subscription.form.state', 'State', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1430, 1, 'en', 'labels', 'subscription.form.zip', 'ZIP', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1431, 1, 'en', 'labels', 'subscription.form.card', 'Card', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1432, 1, 'en', 'labels', 'subscription.form.country_code', 'Country Code', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1433, 1, 'en', 'menus', 'backend.sidebar.general', 'General', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1434, 1, 'en', 'menus', 'backend.sidebar.dashboard', 'Dashboard', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1435, 1, 'en', 'menus', 'backend.sidebar.courses.management', 'Courses Management', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1436, 1, 'en', 'menus', 'backend.sidebar.courses.title', 'Courses', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1437, 1, 'en', 'menus', 'backend.sidebar.courses.manage', 'Manage Courses', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1438, 1, 'en', 'menus', 'backend.sidebar.site-management.title', 'Site Management', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1439, 1, 'en', 'menus', 'backend.sidebar.menu-manager.title', 'Menu Manager', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1440, 1, 'en', 'menus', 'backend.sidebar.system', 'System', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1441, 1, 'en', 'menus', 'backend.sidebar.settings.title', 'Settings', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1442, 1, 'en', 'menus', 'backend.sidebar.settings.general', 'General', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1443, 1, 'en', 'menus', 'backend.sidebar.settings.social-login', 'Social Login', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1444, 1, 'en', 'menus', 'backend.sidebar.settings.zoom_setting', 'Zoom Setting', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1445, 1, 'en', 'menus', 'backend.sidebar.debug-site.title', 'Debug Site', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1446, 1, 'en', 'menus', 'backend.sidebar.history', 'History', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1447, 1, 'en', 'menus', 'backend.sidebar.lessons.title', 'Lessons', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1448, 1, 'en', 'menus', 'backend.sidebar.questions.title', 'Questions', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1449, 1, 'en', 'menus', 'backend.sidebar.questions-options.title', 'Questions Options', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1450, 1, 'en', 'menus', 'backend.sidebar.tests.title', 'Tests', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1451, 1, 'en', 'menus', 'backend.sidebar.change-password.title', 'Change Password', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1452, 1, 'en', 'menus', 'backend.sidebar.account.title', 'Account', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1453, 1, 'en', 'menus', 'backend.sidebar.messages.title', 'Messages', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1454, 1, 'en', 'menus', 'backend.sidebar.orders.title', 'Orders', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1455, 1, 'en', 'menus', 'backend.sidebar.categories.title', 'Categories', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1456, 1, 'en', 'menus', 'backend.sidebar.teachers.title', 'Teachers', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1457, 1, 'en', 'menus', 'backend.sidebar.hero-slider.title', 'Hero Slider', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1458, 1, 'en', 'menus', 'backend.sidebar.sponsors.title', 'Sponsors', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1459, 1, 'en', 'menus', 'backend.sidebar.testimonials.title', 'Testimonials', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1460, 1, 'en', 'menus', 'backend.sidebar.blogs.title', 'Blog', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1461, 1, 'en', 'menus', 'backend.sidebar.faqs.title', 'FAQs', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1462, 1, 'en', 'menus', 'backend.sidebar.reasons.title', 'Reasons', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1463, 1, 'en', 'menus', 'backend.sidebar.contact.title', 'Contact', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1464, 1, 'en', 'menus', 'backend.sidebar.footer.title', 'Footer', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1465, 1, 'en', 'menus', 'backend.sidebar.newsletter-configuration.title', 'Newsletter Configuration', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1466, 1, 'en', 'menus', 'backend.sidebar.invoices.title', 'Invoices', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1467, 1, 'en', 'menus', 'backend.sidebar.certificates.title', 'Certificates', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1468, 1, 'en', 'menus', 'backend.sidebar.contacts.title', 'Leads', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1469, 1, 'en', 'menus', 'backend.sidebar.pages.title', 'Pages Manager', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1470, 1, 'en', 'menus', 'backend.sidebar.reviews.title', 'Reviews', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1471, 1, 'en', 'menus', 'backend.sidebar.translations.title', 'Translation Manager', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1472, 1, 'en', 'menus', 'backend.sidebar.update.title', 'Update', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1473, 1, 'en', 'menus', 'backend.sidebar.backup.title', 'Backup', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1474, 1, 'en', 'menus', 'backend.sidebar.bundles.title', 'Bundles', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1475, 1, 'en', 'menus', 'backend.sidebar.reports.title', 'Reports', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1476, 1, 'en', 'menus', 'backend.sidebar.reports.students', 'Students', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1477, 1, 'en', 'menus', 'backend.sidebar.reports.sales', 'Sales', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1478, 1, 'en', 'menus', 'backend.sidebar.coupons.title', 'Coupons', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1479, 1, 'en', 'menus', 'backend.sidebar.tax.title', 'Tax', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1480, 1, 'en', 'menus', 'backend.sidebar.sitemap.title', 'Sitemap', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1481, 1, 'en', 'menus', 'backend.sidebar.forums-category.title', 'Forums Categories', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1482, 1, 'en', 'menus', 'backend.sidebar.payments.title', 'Payments', '2022-03-30 15:37:10', '2022-03-30 15:37:10'),
(1483, 1, 'en', 'menus', 'backend.sidebar.payments_requests.title', 'Payment Requests', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1484, 1, 'en', 'menus', 'backend.sidebar.live_lessons.title', 'Live Lessons', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1485, 1, 'en', 'menus', 'backend.sidebar.live_lesson_slots.title', 'Live Lesson Slots', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1486, 1, 'en', 'menus', 'backend.sidebar.subscription.title', 'Subscription', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1487, 1, 'en', 'menus', 'backend.sidebar.wishlist.title', 'Wishlist', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1488, 1, 'en', 'menus', 'backend.access.title', 'Access', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1489, 1, 'en', 'menus', 'backend.access.roles.management', 'Role Management', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1490, 1, 'en', 'menus', 'backend.access.roles.create', 'Create Role', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1491, 1, 'en', 'menus', 'backend.access.roles.edit', 'Edit Role', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1492, 1, 'en', 'menus', 'backend.access.roles.all', 'All Roles', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1493, 1, 'en', 'menus', 'backend.access.roles.main', 'Roles', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1494, 1, 'en', 'menus', 'backend.access.users.deactivated', 'Deactivated Users', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1495, 1, 'en', 'menus', 'backend.access.users.deleted', 'Deleted Users', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1496, 1, 'en', 'menus', 'backend.access.users.view', 'View User', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1497, 1, 'en', 'menus', 'backend.access.users.edit', 'Edit User', '2022-03-30 15:37:11', '2022-03-30 15:37:11');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1498, 1, 'en', 'menus', 'backend.access.users.change-password', 'Change Password', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1499, 1, 'en', 'menus', 'backend.access.users.all', 'All Users', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1500, 1, 'en', 'menus', 'backend.access.users.create', 'Create User', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1501, 1, 'en', 'menus', 'backend.access.users.main', 'Users', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1502, 1, 'en', 'menus', 'backend.log-viewer.dashboard', 'Debug dashboard', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1503, 1, 'en', 'menus', 'backend.log-viewer.logs', 'Logs', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1504, 1, 'en', 'menus', 'backend.log-viewer.main', 'Log Viewer', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1505, 1, 'en', 'menus', 'backend.stripe.title', 'Stripe', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1506, 1, 'en', 'menus', 'backend.stripe.plan', 'Plans', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1507, 1, 'en', 'menus', 'language-picker.language', 'Language', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1508, 1, 'en', 'menus', 'language-picker.langs.ar', 'Arabic', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1509, 1, 'en', 'menus', 'language-picker.langs.zh', 'Chinese', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1510, 1, 'en', 'menus', 'language-picker.langs.zh-TW', 'Chinese Traditional', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1511, 1, 'en', 'menus', 'language-picker.langs.da', 'Danish', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1512, 1, 'en', 'menus', 'language-picker.langs.de', 'German', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1513, 1, 'en', 'menus', 'language-picker.langs.el', 'Greek', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1514, 1, 'en', 'menus', 'language-picker.langs.en', 'English', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1515, 1, 'en', 'menus', 'language-picker.langs.es', 'Spanish', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1516, 1, 'en', 'menus', 'language-picker.langs.fa', 'Persian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1517, 1, 'en', 'menus', 'language-picker.langs.fr', 'French', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1518, 1, 'en', 'menus', 'language-picker.langs.he', 'Hebrew', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1519, 1, 'en', 'menus', 'language-picker.langs.id', 'Indonesian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1520, 1, 'en', 'menus', 'language-picker.langs.it', 'Italian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1521, 1, 'en', 'menus', 'language-picker.langs.ja', 'Japanese', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1522, 1, 'en', 'menus', 'language-picker.langs.nl', 'Dutch', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1523, 1, 'en', 'menus', 'language-picker.langs.no', 'Norwegian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1524, 1, 'en', 'menus', 'language-picker.langs.pt_BR', 'Portuguese (Brazil)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1525, 1, 'en', 'menus', 'language-picker.langs.ru', 'Russian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1526, 1, 'en', 'menus', 'language-picker.langs.sv', 'Swedish', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1527, 1, 'en', 'menus', 'language-picker.langs.th', 'Thai', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1528, 1, 'en', 'menus', 'language-picker.langs.tr', 'Turkish', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1529, 1, 'en', 'menus', 'language-picker.langs.af', 'Afrikaans', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1530, 1, 'en', 'menus', 'language-picker.langs.ak', 'Akan', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1531, 1, 'en', 'menus', 'language-picker.langs.sq_AL', 'Albanian (Albania)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1532, 1, 'en', 'menus', 'language-picker.langs.sq', 'Albanian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1533, 1, 'en', 'menus', 'language-picker.langs.am_ET', 'Amharic (Ethiopia)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1534, 1, 'en', 'menus', 'language-picker.langs.am', 'Amharic', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1535, 1, 'en', 'menus', 'language-picker.langs.ar_DZ', 'Arabic (Algeria)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1536, 1, 'en', 'menus', 'language-picker.langs.ar_BH', 'Arabic (Bahrain)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1537, 1, 'en', 'menus', 'language-picker.langs.ar_EG', 'Arabic (Egypt)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1538, 1, 'en', 'menus', 'language-picker.langs.ar_IQ', 'Arabic (Iraq)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1539, 1, 'en', 'menus', 'language-picker.langs.ar_JO', 'Arabic (Jordan)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1540, 1, 'en', 'menus', 'language-picker.langs.ar_KW', 'Arabic (Kuwait)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1541, 1, 'en', 'menus', 'language-picker.langs.ar_LB', 'Arabic (Lebanon)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1542, 1, 'en', 'menus', 'language-picker.langs.ar_LY', 'Arabic (Libya)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1543, 1, 'en', 'menus', 'language-picker.langs.ar_MA', 'Arabic (Morocco)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1544, 1, 'en', 'menus', 'language-picker.langs.ar_OM', 'Arabic (Oman)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1545, 1, 'en', 'menus', 'language-picker.langs.ar_QA', 'Arabic (Qatar)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1546, 1, 'en', 'menus', 'language-picker.langs.ar_SA', 'Arabic (Saudi Arabia)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1547, 1, 'en', 'menus', 'language-picker.langs.ar_SD', 'Arabic (Sudan)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1548, 1, 'en', 'menus', 'language-picker.langs.ar_SY', 'Arabic (Syria)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1549, 1, 'en', 'menus', 'language-picker.langs.ar_TN', 'Arabic (Tunisia)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1550, 1, 'en', 'menus', 'language-picker.langs.ar_AE', 'Arabic (United Arab Emirates)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1551, 1, 'en', 'menus', 'language-picker.langs.ar_YE', 'Arabic (Yemen)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1552, 1, 'en', 'menus', 'language-picker.langs.hy_AM', 'Armenian (Armenia)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1553, 1, 'en', 'menus', 'language-picker.langs.hy', 'Armenian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1554, 1, 'en', 'menus', 'language-picker.langs.as_IN', 'Assamese (India)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1555, 1, 'en', 'menus', 'language-picker.langs.as', 'Assamese', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1556, 1, 'en', 'menus', 'language-picker.langs.asa_TZ', 'Asu (Tanzania)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1557, 1, 'en', 'menus', 'language-picker.langs.asa', 'Asu', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1558, 1, 'en', 'menus', 'language-picker.langs.az_Cyrl', 'Azerbaijani (Cyrillic)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1559, 1, 'en', 'menus', 'language-picker.langs.az_Cyrl_AZ', 'Azerbaijani (Cyrillic, Azerbaijan)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1560, 1, 'en', 'menus', 'language-picker.langs.az_Latn', 'Azerbaijani (Latin)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1561, 1, 'en', 'menus', 'language-picker.langs.az_Latn_AZ', 'Azerbaijani (Latin, Azerbaijan)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1562, 1, 'en', 'menus', 'language-picker.langs.az', 'Azerbaijani', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1563, 1, 'en', 'menus', 'language-picker.langs.bm_ML', 'Bambara (Mali)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1564, 1, 'en', 'menus', 'language-picker.langs.bm', 'Bambara', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1565, 1, 'en', 'menus', 'language-picker.langs.eu_ES', 'Basque (Spain)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1566, 1, 'en', 'menus', 'language-picker.langs.eu', 'Basque', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1567, 1, 'en', 'menus', 'language-picker.langs.be_BY', 'Belarusian (Belarus)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1568, 1, 'en', 'menus', 'language-picker.langs.be', 'Belarusian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1569, 1, 'en', 'menus', 'language-picker.langs.bem_ZM', 'Bemba (Zambia)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1570, 1, 'en', 'menus', 'language-picker.langs.bem', 'Bemba', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1571, 1, 'en', 'menus', 'language-picker.langs.bez_TZ', 'Bena (Tanzania)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1572, 1, 'en', 'menus', 'language-picker.langs.bez', 'Bena', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1573, 1, 'en', 'menus', 'language-picker.langs.bn_BD', 'Bengali (Bangladesh)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1574, 1, 'en', 'menus', 'language-picker.langs.bn_IN', 'Bengali (India)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1575, 1, 'en', 'menus', 'language-picker.langs.bn', 'Bengali', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1576, 1, 'en', 'menus', 'language-picker.langs.bs_BA', 'Bosnian (Bosnia and Herzegovina)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1577, 1, 'en', 'menus', 'language-picker.langs.bs', 'Bosnian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1578, 1, 'en', 'menus', 'language-picker.langs.bg_BG', 'Bulgarian (Bulgaria)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1579, 1, 'en', 'menus', 'language-picker.langs.bg', 'Bulgarian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1580, 1, 'en', 'menus', 'language-picker.langs.my_MM', 'Burmese (Myanmar [Burma])', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1581, 1, 'en', 'menus', 'language-picker.langs.my', 'Burmese', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1582, 1, 'en', 'menus', 'language-picker.langs.yue_Hant_HK', 'Cantonese (Traditional, Hong Kong SAR China)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1583, 1, 'en', 'menus', 'language-picker.langs.ca_ES', 'Catalan (Spain)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1584, 1, 'en', 'menus', 'language-picker.langs.ca', 'Catalan', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1585, 1, 'en', 'menus', 'language-picker.langs.tzm_Latn', 'Central Morocco Tamazight (Latin)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1586, 1, 'en', 'menus', 'language-picker.langs.tzm_Latn_MA', 'Central Morocco Tamazight (Latin, Morocco)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1587, 1, 'en', 'menus', 'language-picker.langs.tzm', 'Central Morocco Tamazight', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1588, 1, 'en', 'menus', 'language-picker.langs.chr_US', 'Cherokee (United States)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1589, 1, 'en', 'menus', 'language-picker.langs.chr', 'Cherokee', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1590, 1, 'en', 'menus', 'language-picker.langs.cgg_UG', 'Chiga (Uganda)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1591, 1, 'en', 'menus', 'language-picker.langs.cgg', 'Chiga', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1592, 1, 'en', 'menus', 'language-picker.langs.zh_Hans', 'Chinese (Simplified Han)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1593, 1, 'en', 'menus', 'language-picker.langs.zh_Hans_CN', 'Chinese (Simplified Han, China)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1594, 1, 'en', 'menus', 'language-picker.langs.zh_Hans_HK', 'Chinese (Simplified Han, Hong Kong SAR China)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1595, 1, 'en', 'menus', 'language-picker.langs.zh_Hans_MO', 'Chinese (Simplified Han, Macau SAR China)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1596, 1, 'en', 'menus', 'language-picker.langs.zh_Hans_SG', 'Chinese (Simplified Han, Singapore)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1597, 1, 'en', 'menus', 'language-picker.langs.zh_Hant', 'Chinese (Traditional Han)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1598, 1, 'en', 'menus', 'language-picker.langs.zh_Hant_HK', 'Chinese (Traditional Han, Hong Kong SAR China)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1599, 1, 'en', 'menus', 'language-picker.langs.zh_Hant_MO', 'Chinese (Traditional Han, Macau SAR China)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1600, 1, 'en', 'menus', 'language-picker.langs.zh_Hant_TW', 'Chinese (Traditional Han, Taiwan)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1601, 1, 'en', 'menus', 'language-picker.langs.kw_GB', 'Cornish (United Kingdom)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1602, 1, 'en', 'menus', 'language-picker.langs.kw', 'Cornish', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1603, 1, 'en', 'menus', 'language-picker.langs.hr_HR', 'Croatian (Croatia)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1604, 1, 'en', 'menus', 'language-picker.langs.hr', 'Croatian', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1605, 1, 'en', 'menus', 'language-picker.langs.cs_CZ', 'Czech (Czech Republic)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1606, 1, 'en', 'menus', 'language-picker.langs.cs', 'Czech', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1607, 1, 'en', 'menus', 'language-picker.langs.da_DK', 'Danish (Denmark)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1608, 1, 'en', 'menus', 'language-picker.langs.nl_BE', 'Dutch (Belgium)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1609, 1, 'en', 'menus', 'language-picker.langs.nl_NL', 'Dutch (Netherlands)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1610, 1, 'en', 'menus', 'language-picker.langs.ebu_KE', 'Embu (Kenya)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1611, 1, 'en', 'menus', 'language-picker.langs.ebu', 'Embu', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1612, 1, 'en', 'menus', 'language-picker.langs.en_AS', 'English (American Samoa)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1613, 1, 'en', 'menus', 'language-picker.langs.en_AU', 'English (Australia)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1614, 1, 'en', 'menus', 'language-picker.langs.en_BE', 'English (Belgium)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1615, 1, 'en', 'menus', 'language-picker.langs.en_BZ', 'English (Belize)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1616, 1, 'en', 'menus', 'language-picker.langs.en_BW', 'English (Botswana)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1617, 1, 'en', 'menus', 'language-picker.langs.en_CA', 'English (Canada)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1618, 1, 'en', 'menus', 'language-picker.langs.en_GU', 'English (Guam)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1619, 1, 'en', 'menus', 'language-picker.langs.en_HK', 'English (Hong Kong SAR China)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1620, 1, 'en', 'menus', 'language-picker.langs.en_IN', 'English (India)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1621, 1, 'en', 'menus', 'language-picker.langs.en_IE', 'English (Ireland)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1622, 1, 'en', 'menus', 'language-picker.langs.en_IL', 'English (Israel)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1623, 1, 'en', 'menus', 'language-picker.langs.en_JM', 'English (Jamaica)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1624, 1, 'en', 'menus', 'language-picker.langs.en_MT', 'English (Malta)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1625, 1, 'en', 'menus', 'language-picker.langs.en_MH', 'English (Marshall Islands)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1626, 1, 'en', 'menus', 'language-picker.langs.en_MU', 'English (Mauritius)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1627, 1, 'en', 'menus', 'language-picker.langs.en_NA', 'English (Namibia)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1628, 1, 'en', 'menus', 'language-picker.langs.en_NZ', 'English (New Zealand)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1629, 1, 'en', 'menus', 'language-picker.langs.en_MP', 'English (Northern Mariana Islands)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1630, 1, 'en', 'menus', 'language-picker.langs.en_PK', 'English (Pakistan)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1631, 1, 'en', 'menus', 'language-picker.langs.en_PH', 'English (Philippines)', '2022-03-30 15:37:11', '2022-03-30 15:37:11'),
(1632, 1, 'en', 'menus', 'language-picker.langs.en_SG', 'English (Singapore)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1633, 1, 'en', 'menus', 'language-picker.langs.en_ZA', 'English (South Africa)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1634, 1, 'en', 'menus', 'language-picker.langs.en_TT', 'English (Trinidad and Tobago)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1635, 1, 'en', 'menus', 'language-picker.langs.en_UM', 'English (U.S. Minor Outlying Islands)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1636, 1, 'en', 'menus', 'language-picker.langs.en_VI', 'English (U.S. Virgin Islands)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1637, 1, 'en', 'menus', 'language-picker.langs.en_GB', 'English (United Kingdom)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1638, 1, 'en', 'menus', 'language-picker.langs.en_US', 'English (United States)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1639, 1, 'en', 'menus', 'language-picker.langs.en_ZW', 'English (Zimbabwe)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1640, 1, 'en', 'menus', 'language-picker.langs.eo', 'Esperanto', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1641, 1, 'en', 'menus', 'language-picker.langs.et_EE', 'Estonian (Estonia)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1642, 1, 'en', 'menus', 'language-picker.langs.et', 'Estonian', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1643, 1, 'en', 'menus', 'language-picker.langs.ee_GH', 'Ewe (Ghana)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1644, 1, 'en', 'menus', 'language-picker.langs.ee_TG', 'Ewe (Togo)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1645, 1, 'en', 'menus', 'language-picker.langs.ee', 'Ewe', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1646, 1, 'en', 'menus', 'language-picker.langs.fo_FO', 'Faroese (Faroe Islands)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1647, 1, 'en', 'menus', 'language-picker.langs.fo', 'Faroese', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1648, 1, 'en', 'menus', 'language-picker.langs.fil_PH', 'Filipino (Philippines)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1649, 1, 'en', 'menus', 'language-picker.langs.fil', 'Filipino', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1650, 1, 'en', 'menus', 'language-picker.langs.fi_FI', 'Finnish (Finland)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1651, 1, 'en', 'menus', 'language-picker.langs.fi', 'Finnish', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1652, 1, 'en', 'menus', 'language-picker.langs.fr_BE', 'French (Belgium)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1653, 1, 'en', 'menus', 'language-picker.langs.fr_BJ', 'French (Benin)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1654, 1, 'en', 'menus', 'language-picker.langs.fr_BF', 'French (Burkina Faso)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1655, 1, 'en', 'menus', 'language-picker.langs.fr_BI', 'French (Burundi)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1656, 1, 'en', 'menus', 'language-picker.langs.fr_CM', 'French (Cameroon)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1657, 1, 'en', 'menus', 'language-picker.langs.fr_CA', 'French (Canada)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1658, 1, 'en', 'menus', 'language-picker.langs.fr_CF', 'French (Central African Republic)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1659, 1, 'en', 'menus', 'language-picker.langs.fr_TD', 'French (Chad)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1660, 1, 'en', 'menus', 'language-picker.langs.fr_KM', 'French (Comoros)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1661, 1, 'en', 'menus', 'language-picker.langs.fr_CG', 'French (Congo - Brazzaville)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1662, 1, 'en', 'menus', 'language-picker.langs.fr_CD', 'French (Congo - Kinshasa)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1663, 1, 'en', 'menus', 'language-picker.langs.fr_CI', 'French (Côte d’Ivoire)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1664, 1, 'en', 'menus', 'language-picker.langs.fr_DJ', 'French (Djibouti)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1665, 1, 'en', 'menus', 'language-picker.langs.fr_GQ', 'French (Equatorial Guinea)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1666, 1, 'en', 'menus', 'language-picker.langs.fr_FR', 'French (France)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1667, 1, 'en', 'menus', 'language-picker.langs.fr_GA', 'French (Gabon)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1668, 1, 'en', 'menus', 'language-picker.langs.fr_GP', 'French (Guadeloupe)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1669, 1, 'en', 'menus', 'language-picker.langs.fr_GN', 'French (Guinea)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1670, 1, 'en', 'menus', 'language-picker.langs.fr_LU', 'French (Luxembourg)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1671, 1, 'en', 'menus', 'language-picker.langs.fr_MG', 'French (Madagascar)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1672, 1, 'en', 'menus', 'language-picker.langs.fr_ML', 'French (Mali)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1673, 1, 'en', 'menus', 'language-picker.langs.fr_MQ', 'French (Martinique)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1674, 1, 'en', 'menus', 'language-picker.langs.fr_MC', 'French (Monaco)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1675, 1, 'en', 'menus', 'language-picker.langs.fr_NE', 'French (Niger)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1676, 1, 'en', 'menus', 'language-picker.langs.fr_RW', 'French (Rwanda)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1677, 1, 'en', 'menus', 'language-picker.langs.fr_RE', 'French (Réunion)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1678, 1, 'en', 'menus', 'language-picker.langs.fr_BL', 'French (Saint Barthélemy)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1679, 1, 'en', 'menus', 'language-picker.langs.fr_MF', 'French (Saint Martin)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1680, 1, 'en', 'menus', 'language-picker.langs.fr_SN', 'French (Senegal)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1681, 1, 'en', 'menus', 'language-picker.langs.fr_CH', 'French (Switzerland)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1682, 1, 'en', 'menus', 'language-picker.langs.fr_TG', 'French (Togo)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1683, 1, 'en', 'menus', 'language-picker.langs.ff_SN', 'Fulah (Senegal)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1684, 1, 'en', 'menus', 'language-picker.langs.ff', 'Fulah', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1685, 1, 'en', 'menus', 'language-picker.langs.gl_ES', 'Galician (Spain)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1686, 1, 'en', 'menus', 'language-picker.langs.gl', 'Galician', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1687, 1, 'en', 'menus', 'language-picker.langs.lg_UG', 'Ganda (Uganda)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1688, 1, 'en', 'menus', 'language-picker.langs.lg', 'Ganda', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1689, 1, 'en', 'menus', 'language-picker.langs.ka_GE', 'Georgian (Georgia)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1690, 1, 'en', 'menus', 'language-picker.langs.ka', 'Georgian', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1691, 1, 'en', 'menus', 'language-picker.langs.de_AT', 'German (Austria)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1692, 1, 'en', 'menus', 'language-picker.langs.de_BE', 'German (Belgium)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1693, 1, 'en', 'menus', 'language-picker.langs.de_DE', 'German (Germany)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1694, 1, 'en', 'menus', 'language-picker.langs.de_LI', 'German (Liechtenstein)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1695, 1, 'en', 'menus', 'language-picker.langs.de_LU', 'German (Luxembourg)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1696, 1, 'en', 'menus', 'language-picker.langs.de_CH', 'German (Switzerland)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1697, 1, 'en', 'menus', 'language-picker.langs.el_CY', 'Greek (Cyprus)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1698, 1, 'en', 'menus', 'language-picker.langs.el_GR', 'Greek (Greece)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1699, 1, 'en', 'menus', 'language-picker.langs.gu_IN', 'Gujarati (India)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1700, 1, 'en', 'menus', 'language-picker.langs.gu', 'Gujarati', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1701, 1, 'en', 'menus', 'language-picker.langs.guz_KE', 'Gusii (Kenya)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1702, 1, 'en', 'menus', 'language-picker.langs.guz', 'Gusii', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1703, 1, 'en', 'menus', 'language-picker.langs.ha_Latn', 'Hausa (Latin)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1704, 1, 'en', 'menus', 'language-picker.langs.ha_Latn_GH', 'Hausa (Latin, Ghana)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1705, 1, 'en', 'menus', 'language-picker.langs.ha_Latn_NE', 'Hausa (Latin, Niger)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1706, 1, 'en', 'menus', 'language-picker.langs.ha_Latn_NG', 'Hausa (Latin, Nigeria)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1707, 1, 'en', 'menus', 'language-picker.langs.ha', 'Hausa', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1708, 1, 'en', 'menus', 'language-picker.langs.haw_US', 'Hawaiian (United States)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1709, 1, 'en', 'menus', 'language-picker.langs.haw', 'Hawaiian', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1710, 1, 'en', 'menus', 'language-picker.langs.he_IL', 'Hebrew (Israel)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1711, 1, 'en', 'menus', 'language-picker.langs.hi_IN', 'Hindi (India)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1712, 1, 'en', 'menus', 'language-picker.langs.hi', 'Hindi', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1713, 1, 'en', 'menus', 'language-picker.langs.hu_HU', 'Hungarian (Hungary)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1714, 1, 'en', 'menus', 'language-picker.langs.hu', 'Hungarian', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1715, 1, 'en', 'menus', 'language-picker.langs.is_IS', 'Icelandic (Iceland)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1716, 1, 'en', 'menus', 'language-picker.langs.is', 'Icelandic', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1717, 1, 'en', 'menus', 'language-picker.langs.ig_NG', 'Igbo (Nigeria)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1718, 1, 'en', 'menus', 'language-picker.langs.ig', 'Igbo', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1719, 1, 'en', 'menus', 'language-picker.langs.id_ID', 'Indonesian (Indonesia)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1720, 1, 'en', 'menus', 'language-picker.langs.ga_IE', 'Irish (Ireland)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1721, 1, 'en', 'menus', 'language-picker.langs.ga', 'Irish', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1722, 1, 'en', 'menus', 'language-picker.langs.it_IT', 'Italian (Italy)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1723, 1, 'en', 'menus', 'language-picker.langs.it_CH', 'Italian (Switzerland)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1724, 1, 'en', 'menus', 'language-picker.langs.ja_JP', 'Japanese (Japan)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1725, 1, 'en', 'menus', 'language-picker.langs.kea_CV', 'Kabuverdianu (Cape Verde)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1726, 1, 'en', 'menus', 'language-picker.langs.kea', 'Kabuverdianu', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1727, 1, 'en', 'menus', 'language-picker.langs.kab_DZ', 'Kabyle (Algeria)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1728, 1, 'en', 'menus', 'language-picker.langs.kab', 'Kabyle', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1729, 1, 'en', 'menus', 'language-picker.langs.kl_GL', 'Kalaallisut (Greenland)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1730, 1, 'en', 'menus', 'language-picker.langs.kl', 'Kalaallisut', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1731, 1, 'en', 'menus', 'language-picker.langs.kln_KE', 'Kalenjin (Kenya)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1732, 1, 'en', 'menus', 'language-picker.langs.kln', 'Kalenjin', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1733, 1, 'en', 'menus', 'language-picker.langs.kam_KE', 'Kamba (Kenya)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1734, 1, 'en', 'menus', 'language-picker.langs.kam', 'Kamba', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1735, 1, 'en', 'menus', 'language-picker.langs.kn_IN', 'Kannada (India)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1736, 1, 'en', 'menus', 'language-picker.langs.kn', 'Kannada', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1737, 1, 'en', 'menus', 'language-picker.langs.kk_Cyrl', 'Kazakh (Cyrillic)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1738, 1, 'en', 'menus', 'language-picker.langs.kk_Cyrl_KZ', 'Kazakh (Cyrillic, Kazakhstan)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1739, 1, 'en', 'menus', 'language-picker.langs.kk', 'Kazakh', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1740, 1, 'en', 'menus', 'language-picker.langs.km_KH', 'Khmer (Cambodia)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1741, 1, 'en', 'menus', 'language-picker.langs.km', 'Khmer', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1742, 1, 'en', 'menus', 'language-picker.langs.ki_KE', 'Kikuyu (Kenya)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1743, 1, 'en', 'menus', 'language-picker.langs.ki', 'Kikuyu', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1744, 1, 'en', 'menus', 'language-picker.langs.rw_RW', 'Kinyarwanda (Rwanda)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1745, 1, 'en', 'menus', 'language-picker.langs.rw', 'Kinyarwanda', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1746, 1, 'en', 'menus', 'language-picker.langs.kok_IN', 'Konkani (India)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1747, 1, 'en', 'menus', 'language-picker.langs.kok', 'Konkani', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1748, 1, 'en', 'menus', 'language-picker.langs.ko_KR', 'Korean (South Korea)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1749, 1, 'en', 'menus', 'language-picker.langs.ko', 'Korean', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1750, 1, 'en', 'menus', 'language-picker.langs.khq_ML', 'Koyra Chiini (Mali)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1751, 1, 'en', 'menus', 'language-picker.langs.khq', 'Koyra Chiini', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1752, 1, 'en', 'menus', 'language-picker.langs.ses_ML', 'Koyraboro Senni (Mali)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1753, 1, 'en', 'menus', 'language-picker.langs.ses', 'Koyraboro Senni', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1754, 1, 'en', 'menus', 'language-picker.langs.lag_TZ', 'Langi (Tanzania)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1755, 1, 'en', 'menus', 'language-picker.langs.lag', 'Langi', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1756, 1, 'en', 'menus', 'language-picker.langs.lv_LV', 'Latvian (Latvia)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1757, 1, 'en', 'menus', 'language-picker.langs.lv', 'Latvian', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1758, 1, 'en', 'menus', 'language-picker.langs.lt_LT', 'Lithuanian (Lithuania)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1759, 1, 'en', 'menus', 'language-picker.langs.lt', 'Lithuanian', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1760, 1, 'en', 'menus', 'language-picker.langs.luo_KE', 'Luo (Kenya)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1761, 1, 'en', 'menus', 'language-picker.langs.luo', 'Luo', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1762, 1, 'en', 'menus', 'language-picker.langs.luy_KE', 'Luyia (Kenya)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1763, 1, 'en', 'menus', 'language-picker.langs.luy', 'Luyia', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1764, 1, 'en', 'menus', 'language-picker.langs.mk_MK', 'Macedonian (Macedonia)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1765, 1, 'en', 'menus', 'language-picker.langs.mk', 'Macedonian', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1766, 1, 'en', 'menus', 'language-picker.langs.jmc_TZ', 'Machame (Tanzania)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1767, 1, 'en', 'menus', 'language-picker.langs.jmc', 'Machame', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1768, 1, 'en', 'menus', 'language-picker.langs.kde_TZ', 'Makonde (Tanzania)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1769, 1, 'en', 'menus', 'language-picker.langs.kde', 'Makonde', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1770, 1, 'en', 'menus', 'language-picker.langs.mg_MG', 'Malagasy (Madagascar)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1771, 1, 'en', 'menus', 'language-picker.langs.mg', 'Malagasy', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1772, 1, 'en', 'menus', 'language-picker.langs.ms_BN', 'Malay (Brunei)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1773, 1, 'en', 'menus', 'language-picker.langs.ms_MY', 'Malay (Malaysia)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1774, 1, 'en', 'menus', 'language-picker.langs.ms', 'Malay', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1775, 1, 'en', 'menus', 'language-picker.langs.ml_IN', 'Malayalam (India)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1776, 1, 'en', 'menus', 'language-picker.langs.ml', 'Malayalam', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1777, 1, 'en', 'menus', 'language-picker.langs.mt_MT', 'Maltese (Malta)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1778, 1, 'en', 'menus', 'language-picker.langs.mt', 'Maltese', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1779, 1, 'en', 'menus', 'language-picker.langs.gv_GB', 'Manx (United Kingdom)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1780, 1, 'en', 'menus', 'language-picker.langs.gv', 'Manx', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1781, 1, 'en', 'menus', 'language-picker.langs.mr_IN', 'Marathi (India)', '2022-03-30 15:37:12', '2022-03-30 15:37:12'),
(1782, 1, 'en', 'menus', 'language-picker.langs.mr', 'Marathi', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1783, 1, 'en', 'menus', 'language-picker.langs.mas_KE', 'Masai (Kenya)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1784, 1, 'en', 'menus', 'language-picker.langs.mas_TZ', 'Masai (Tanzania)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1785, 1, 'en', 'menus', 'language-picker.langs.mas', 'Masai', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1786, 1, 'en', 'menus', 'language-picker.langs.mer_KE', 'Meru (Kenya)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1787, 1, 'en', 'menus', 'language-picker.langs.mer', 'Meru', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1788, 1, 'en', 'menus', 'language-picker.langs.mfe_MU', 'Morisyen (Mauritius)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1789, 1, 'en', 'menus', 'language-picker.langs.mfe', 'Morisyen', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1790, 1, 'en', 'menus', 'language-picker.langs.naq_NA', 'Nama (Namibia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1791, 1, 'en', 'menus', 'language-picker.langs.naq', 'Nama', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1792, 1, 'en', 'menus', 'language-picker.langs.ne_IN', 'Nepali (India)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1793, 1, 'en', 'menus', 'language-picker.langs.ne_NP', 'Nepali (Nepal)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1794, 1, 'en', 'menus', 'language-picker.langs.ne', 'Nepali', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1795, 1, 'en', 'menus', 'language-picker.langs.nd_ZW', 'North Ndebele (Zimbabwe)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1796, 1, 'en', 'menus', 'language-picker.langs.nd', 'North Ndebele', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1797, 1, 'en', 'menus', 'language-picker.langs.nb_NO', 'Norwegian Bokmål (Norway)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1798, 1, 'en', 'menus', 'language-picker.langs.nb', 'Norwegian Bokmål', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1799, 1, 'en', 'menus', 'language-picker.langs.nn_NO', 'Norwegian Nynorsk (Norway)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1800, 1, 'en', 'menus', 'language-picker.langs.nn', 'Norwegian Nynorsk', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1801, 1, 'en', 'menus', 'language-picker.langs.nyn_UG', 'Nyankole (Uganda)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1802, 1, 'en', 'menus', 'language-picker.langs.nyn', 'Nyankole', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1803, 1, 'en', 'menus', 'language-picker.langs.or_IN', 'Oriya (India)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1804, 1, 'en', 'menus', 'language-picker.langs.or', 'Oriya', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1805, 1, 'en', 'menus', 'language-picker.langs.om_ET', 'Oromo (Ethiopia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1806, 1, 'en', 'menus', 'language-picker.langs.om_KE', 'Oromo (Kenya)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1807, 1, 'en', 'menus', 'language-picker.langs.om', 'Oromo', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1808, 1, 'en', 'menus', 'language-picker.langs.ps_AF', 'Pashto (Afghanistan)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1809, 1, 'en', 'menus', 'language-picker.langs.ps', 'Pashto', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1810, 1, 'en', 'menus', 'language-picker.langs.fa_AF', 'Persian (Afghanistan)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1811, 1, 'en', 'menus', 'language-picker.langs.fa_IR', 'Persian (Iran)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1812, 1, 'en', 'menus', 'language-picker.langs.pl_PL', 'Polish (Poland)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1813, 1, 'en', 'menus', 'language-picker.langs.pl', 'Polish', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1814, 1, 'en', 'menus', 'language-picker.langs.pt_GW', 'Portuguese (Guinea-Bissau)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1815, 1, 'en', 'menus', 'language-picker.langs.pt_MZ', 'Portuguese (Mozambique)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1816, 1, 'en', 'menus', 'language-picker.langs.pt_PT', 'Portuguese (Portugal)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1817, 1, 'en', 'menus', 'language-picker.langs.pt', 'Portuguese', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1818, 1, 'en', 'menus', 'language-picker.langs.pa_Arab', 'Punjabi (Arabic)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1819, 1, 'en', 'menus', 'language-picker.langs.pa_Arab_PK', 'Punjabi (Arabic, Pakistan)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1820, 1, 'en', 'menus', 'language-picker.langs.pa_Guru', 'Punjabi (Gurmukhi)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1821, 1, 'en', 'menus', 'language-picker.langs.pa_Guru_IN', 'Punjabi (Gurmukhi, India)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1822, 1, 'en', 'menus', 'language-picker.langs.pa', 'Punjabi', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1823, 1, 'en', 'menus', 'language-picker.langs.ro_MD', 'Romanian (Moldova)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1824, 1, 'en', 'menus', 'language-picker.langs.ro_RO', 'Romanian (Romania)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1825, 1, 'en', 'menus', 'language-picker.langs.ro', 'Romanian', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1826, 1, 'en', 'menus', 'language-picker.langs.rm_CH', 'Romansh (Switzerland)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1827, 1, 'en', 'menus', 'language-picker.langs.rm', 'Romansh', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1828, 1, 'en', 'menus', 'language-picker.langs.rof_TZ', 'Rombo (Tanzania)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1829, 1, 'en', 'menus', 'language-picker.langs.rof', 'Rombo', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1830, 1, 'en', 'menus', 'language-picker.langs.ru_MD', 'Russian (Moldova)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1831, 1, 'en', 'menus', 'language-picker.langs.ru_RU', 'Russian (Russia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1832, 1, 'en', 'menus', 'language-picker.langs.ru_UA', 'Russian (Ukraine)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1833, 1, 'en', 'menus', 'language-picker.langs.rwk_TZ', 'Rwa (Tanzania)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1834, 1, 'en', 'menus', 'language-picker.langs.rwk', 'Rwa', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1835, 1, 'en', 'menus', 'language-picker.langs.saq_KE', 'Samburu (Kenya)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1836, 1, 'en', 'menus', 'language-picker.langs.saq', 'Samburu', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1837, 1, 'en', 'menus', 'language-picker.langs.sg_CF', 'Sango (Central African Republic)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1838, 1, 'en', 'menus', 'language-picker.langs.sg', 'Sango', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1839, 1, 'en', 'menus', 'language-picker.langs.seh_MZ', 'Sena (Mozambique)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1840, 1, 'en', 'menus', 'language-picker.langs.seh', 'Sena', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1841, 1, 'en', 'menus', 'language-picker.langs.sr_Cyrl', 'Serbian (Cyrillic)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1842, 1, 'en', 'menus', 'language-picker.langs.sr_Cyrl_BA', 'Serbian (Cyrillic, Bosnia and Herzegovina)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1843, 1, 'en', 'menus', 'language-picker.langs.sr_Cyrl_ME', 'Serbian (Cyrillic, Montenegro)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1844, 1, 'en', 'menus', 'language-picker.langs.sr_Cyrl_RS', 'Serbian (Cyrillic, Serbia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1845, 1, 'en', 'menus', 'language-picker.langs.sr_Latn', 'Serbian (Latin)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1846, 1, 'en', 'menus', 'language-picker.langs.sr_Latn_BA', 'Serbian (Latin, Bosnia and Herzegovina)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1847, 1, 'en', 'menus', 'language-picker.langs.sr_Latn_ME', 'Serbian (Latin, Montenegro)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1848, 1, 'en', 'menus', 'language-picker.langs.sr_Latn_RS', 'Serbian (Latin, Serbia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1849, 1, 'en', 'menus', 'language-picker.langs.sr', 'Serbian', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1850, 1, 'en', 'menus', 'language-picker.langs.sn_ZW', 'Shona (Zimbabwe)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1851, 1, 'en', 'menus', 'language-picker.langs.sn', 'Shona', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1852, 1, 'en', 'menus', 'language-picker.langs.ii_CN', 'Sichuan Yi (China)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1853, 1, 'en', 'menus', 'language-picker.langs.ii', 'Sichuan Yi', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1854, 1, 'en', 'menus', 'language-picker.langs.si_LK', 'Sinhala (Sri Lanka)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1855, 1, 'en', 'menus', 'language-picker.langs.si', 'Sinhala', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1856, 1, 'en', 'menus', 'language-picker.langs.sk_SK', 'Slovak (Slovakia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1857, 1, 'en', 'menus', 'language-picker.langs.sk', 'Slovak', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1858, 1, 'en', 'menus', 'language-picker.langs.sl_SI', 'Slovenian (Slovenia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1859, 1, 'en', 'menus', 'language-picker.langs.sl', 'Slovenian', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1860, 1, 'en', 'menus', 'language-picker.langs.xog_UG', 'Soga (Uganda)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1861, 1, 'en', 'menus', 'language-picker.langs.xog', 'Soga', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1862, 1, 'en', 'menus', 'language-picker.langs.so_DJ', 'Somali (Djibouti)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1863, 1, 'en', 'menus', 'language-picker.langs.so_ET', 'Somali (Ethiopia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1864, 1, 'en', 'menus', 'language-picker.langs.so_KE', 'Somali (Kenya)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1865, 1, 'en', 'menus', 'language-picker.langs.so_SO', 'Somali (Somalia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1866, 1, 'en', 'menus', 'language-picker.langs.so', 'Somali', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1867, 1, 'en', 'menus', 'language-picker.langs.es_AR', 'Spanish (Argentina)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1868, 1, 'en', 'menus', 'language-picker.langs.es_BO', 'Spanish (Bolivia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1869, 1, 'en', 'menus', 'language-picker.langs.es_CL', 'Spanish (Chile)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1870, 1, 'en', 'menus', 'language-picker.langs.es_CO', 'Spanish (Colombia)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1871, 1, 'en', 'menus', 'language-picker.langs.es_CR', 'Spanish (Costa Rica)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1872, 1, 'en', 'menus', 'language-picker.langs.es_DO', 'Spanish (Dominican Republic)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1873, 1, 'en', 'menus', 'language-picker.langs.es_EC', 'Spanish (Ecuador)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1874, 1, 'en', 'menus', 'language-picker.langs.es_SV', 'Spanish (El Salvador)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1875, 1, 'en', 'menus', 'language-picker.langs.es_GQ', 'Spanish (Equatorial Guinea)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1876, 1, 'en', 'menus', 'language-picker.langs.es_GT', 'Spanish (Guatemala)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1877, 1, 'en', 'menus', 'language-picker.langs.es_HN', 'Spanish (Honduras)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1878, 1, 'en', 'menus', 'language-picker.langs.es_419', 'Spanish (Latin America)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1879, 1, 'en', 'menus', 'language-picker.langs.es_MX', 'Spanish (Mexico)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1880, 1, 'en', 'menus', 'language-picker.langs.es_NI', 'Spanish (Nicaragua)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1881, 1, 'en', 'menus', 'language-picker.langs.es_PA', 'Spanish (Panama)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1882, 1, 'en', 'menus', 'language-picker.langs.es_PY', 'Spanish (Paraguay)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1883, 1, 'en', 'menus', 'language-picker.langs.es_PE', 'Spanish (Peru)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1884, 1, 'en', 'menus', 'language-picker.langs.es_PR', 'Spanish (Puerto Rico)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1885, 1, 'en', 'menus', 'language-picker.langs.es_ES', 'Spanish (Spain)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1886, 1, 'en', 'menus', 'language-picker.langs.es_US', 'Spanish (United States)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1887, 1, 'en', 'menus', 'language-picker.langs.es_UY', 'Spanish (Uruguay)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1888, 1, 'en', 'menus', 'language-picker.langs.es_VE', 'Spanish (Venezuela)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1889, 1, 'en', 'menus', 'language-picker.langs.sw_KE', 'Swahili (Kenya)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1890, 1, 'en', 'menus', 'language-picker.langs.sw_TZ', 'Swahili (Tanzania)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1891, 1, 'en', 'menus', 'language-picker.langs.sw', 'Swahili', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1892, 1, 'en', 'menus', 'language-picker.langs.sv_FI', 'Swedish (Finland)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1893, 1, 'en', 'menus', 'language-picker.langs.sv_SE', 'Swedish (Sweden)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1894, 1, 'en', 'menus', 'language-picker.langs.gsw_CH', 'Swiss German (Switzerland)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1895, 1, 'en', 'menus', 'language-picker.langs.gsw', 'Swiss German', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1896, 1, 'en', 'menus', 'language-picker.langs.shi_Latn', 'Tachelhit (Latin)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1897, 1, 'en', 'menus', 'language-picker.langs.shi_Latn_MA', 'Tachelhit (Latin, Morocco)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1898, 1, 'en', 'menus', 'language-picker.langs.shi_Tfng', 'Tachelhit (Tifinagh)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1899, 1, 'en', 'menus', 'language-picker.langs.shi_Tfng_MA', 'Tachelhit (Tifinagh, Morocco)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1900, 1, 'en', 'menus', 'language-picker.langs.shi', 'Tachelhit', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1901, 1, 'en', 'menus', 'language-picker.langs.dav_KE', 'Taita (Kenya)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1902, 1, 'en', 'menus', 'language-picker.langs.dav', 'Taita', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1903, 1, 'en', 'menus', 'language-picker.langs.ta_IN', 'Tamil (India)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1904, 1, 'en', 'menus', 'language-picker.langs.ta_LK', 'Tamil (Sri Lanka)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1905, 1, 'en', 'menus', 'language-picker.langs.ta', 'Tamil', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1906, 1, 'en', 'menus', 'language-picker.langs.te_IN', 'Telugu (India)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1907, 1, 'en', 'menus', 'language-picker.langs.te', 'Telugu', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1908, 1, 'en', 'menus', 'language-picker.langs.teo_KE', 'Teso (Kenya)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1909, 1, 'en', 'menus', 'language-picker.langs.teo_UG', 'Teso (Uganda)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1910, 1, 'en', 'menus', 'language-picker.langs.teo', 'Teso', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1911, 1, 'en', 'menus', 'language-picker.langs.th_TH', 'Thai (Thailand)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1912, 1, 'en', 'menus', 'language-picker.langs.bo_CN', 'Tibetan (China)', '2022-03-30 15:37:13', '2022-03-30 15:37:13');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1913, 1, 'en', 'menus', 'language-picker.langs.bo_IN', 'Tibetan (India)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1914, 1, 'en', 'menus', 'language-picker.langs.bo', 'Tibetan', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1915, 1, 'en', 'menus', 'language-picker.langs.ti_ER', 'Tigrinya (Eritrea)', '2022-03-30 15:37:13', '2022-03-30 15:37:13'),
(1916, 1, 'en', 'menus', 'language-picker.langs.ti_ET', 'Tigrinya (Ethiopia)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1917, 1, 'en', 'menus', 'language-picker.langs.ti', 'Tigrinya', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1918, 1, 'en', 'menus', 'language-picker.langs.to_TO', 'Tonga (Tonga)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1919, 1, 'en', 'menus', 'language-picker.langs.to', 'Tonga', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1920, 1, 'en', 'menus', 'language-picker.langs.tr_TR', 'Turkish (Turkey)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1921, 1, 'en', 'menus', 'language-picker.langs.uk_UA', 'Ukrainian (Ukraine)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1922, 1, 'en', 'menus', 'language-picker.langs.uk', 'Ukrainian', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1923, 1, 'en', 'menus', 'language-picker.langs.ur_IN', 'Urdu (India)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1924, 1, 'en', 'menus', 'language-picker.langs.ur_PK', 'Urdu (Pakistan)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1925, 1, 'en', 'menus', 'language-picker.langs.ur', 'Urdu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1926, 1, 'en', 'menus', 'language-picker.langs.uz_Arab', 'Uzbek (Arabic)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1927, 1, 'en', 'menus', 'language-picker.langs.uz_Arab_AF', 'Uzbek (Arabic, Afghanistan)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1928, 1, 'en', 'menus', 'language-picker.langs.uz_Cyrl', 'Uzbek (Cyrillic)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1929, 1, 'en', 'menus', 'language-picker.langs.uz_Cyrl_UZ', 'Uzbek (Cyrillic, Uzbekistan)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1930, 1, 'en', 'menus', 'language-picker.langs.uz_Latn', 'Uzbek (Latin)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1931, 1, 'en', 'menus', 'language-picker.langs.uz_Latn_UZ', 'Uzbek (Latin, Uzbekistan)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1932, 1, 'en', 'menus', 'language-picker.langs.uz', 'Uzbek', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1933, 1, 'en', 'menus', 'language-picker.langs.vi_VN', 'Vietnamese (Vietnam)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1934, 1, 'en', 'menus', 'language-picker.langs.vi', 'Vietnamese', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1935, 1, 'en', 'menus', 'language-picker.langs.vun_TZ', 'Vunjo (Tanzania)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1936, 1, 'en', 'menus', 'language-picker.langs.vun', 'Vunjo', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1937, 1, 'en', 'menus', 'language-picker.langs.cy_GB', 'Welsh (United Kingdom)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1938, 1, 'en', 'menus', 'language-picker.langs.cy', 'Welsh', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1939, 1, 'en', 'menus', 'language-picker.langs.yo_NG', 'Yoruba (Nigeria)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1940, 1, 'en', 'menus', 'language-picker.langs.yo', 'Yoruba', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1941, 1, 'en', 'menus', 'language-picker.langs.zu_ZA', 'Zulu (South Africa)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1942, 1, 'en', 'menus', 'language-picker.langs.zu', 'Zulu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1943, 1, 'en', 'navs', 'general.logout', 'Logout', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1944, 1, 'en', 'navs', 'general.home', 'Home', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1945, 1, 'en', 'navs', 'general.login', 'LogIn', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1946, 1, 'en', 'navs', 'general.messages', 'Messages', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1947, 1, 'en', 'navs', 'general.no_messages', 'No messages', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1948, 1, 'en', 'navs', 'general.account', 'Account', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1949, 1, 'en', 'navs', 'general.profile', 'Profile', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1950, 1, 'en', 'navs', 'frontend.contact', 'Contact', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1951, 1, 'en', 'navs', 'frontend.dashboard', 'Dashboard', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1952, 1, 'en', 'navs', 'frontend.login', 'Login', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1953, 1, 'en', 'navs', 'frontend.macros', 'Macros', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1954, 1, 'en', 'navs', 'frontend.register', 'Register', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1955, 1, 'en', 'navs', 'frontend.courses', 'Courses', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1956, 1, 'en', 'navs', 'frontend.forums', 'Forums', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1957, 1, 'en', 'navs', 'frontend.user.account', 'My Account', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1958, 1, 'en', 'navs', 'frontend.user.administration', 'Administration', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1959, 1, 'en', 'navs', 'frontend.user.change_password', 'Change Password', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1960, 1, 'en', 'navs', 'frontend.user.my_information', 'My Information', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1961, 1, 'en', 'navs', 'frontend.user.profile', 'Profile', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1962, 1, 'en', 'navs', 'frontend.user.edit_account', 'Edit Account', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1963, 1, 'en', 'pagination', 'previous', '&laquo; Previous', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1964, 1, 'en', 'pagination', 'next', 'Next &raquo;', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1965, 1, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1966, 1, 'en', 'passwords', 'reset', 'Your password has been reset!', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1967, 1, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1968, 1, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1969, 1, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1970, 1, 'en', 'roles', 'administrator', 'Administrator', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1971, 1, 'en', 'roles', 'user', 'User', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1972, 1, 'en', 'strings', 'frontend.user.email_changed_notice', 'You must confirm your new e-mail address before you can log in again.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1973, 1, 'en', 'strings', 'frontend.user.profile_updated', 'Profile successfully updated.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1974, 1, 'en', 'strings', 'frontend.user.password_updated', 'Password successfully updated.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1975, 1, 'en', 'strings', 'frontend.user.change_email_notice', 'If you change your e-mail you will be logged out until you confirm your new e-mail address.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1976, 1, 'en', 'strings', 'frontend.test', 'Test', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1977, 1, 'en', 'strings', 'frontend.tests.based_on.permission', 'Permission Based - ', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1978, 1, 'en', 'strings', 'frontend.tests.based_on.role', 'Role Based - ', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1979, 1, 'en', 'strings', 'frontend.tests.js_injected_from_controller', 'Javascript Injected from a Controller', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1980, 1, 'en', 'strings', 'frontend.tests.using_blade_extensions', 'Using Blade Extensions', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1981, 1, 'en', 'strings', 'frontend.tests.using_access_helper.array_permissions', 'Using Access Helper with Array of Permission Names or ID\'s where the user does have to possess all.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1982, 1, 'en', 'strings', 'frontend.tests.using_access_helper.array_permissions_not', 'Using Access Helper with Array of Permission Names or ID\'s where the user does not have to possess all.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1983, 1, 'en', 'strings', 'frontend.tests.using_access_helper.array_roles', 'Using Access Helper with Array of Role Names or ID\'s where the user does have to possess all.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1984, 1, 'en', 'strings', 'frontend.tests.using_access_helper.array_roles_not', 'Using Access Helper with Array of Role Names or ID\'s where the user does not have to possess all.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1985, 1, 'en', 'strings', 'frontend.tests.using_access_helper.permission_id', 'Using Access Helper with Permission ID', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1986, 1, 'en', 'strings', 'frontend.tests.using_access_helper.permission_name', 'Using Access Helper with Permission Name', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1987, 1, 'en', 'strings', 'frontend.tests.using_access_helper.role_id', 'Using Access Helper with Role ID', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1988, 1, 'en', 'strings', 'frontend.tests.using_access_helper.role_name', 'Using Access Helper with Role Name', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1989, 1, 'en', 'strings', 'frontend.tests.view_console_it_works', 'View console, you should see \'it works!\' which is coming from FrontendController@index', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1990, 1, 'en', 'strings', 'frontend.tests.you_can_see_because', 'You can see this because you have the role of \':role\'!', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1991, 1, 'en', 'strings', 'frontend.tests.you_can_see_because_permission', 'You can see this because you have the permission of \':permission\'!', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1992, 1, 'en', 'strings', 'frontend.general.joined', 'Joined', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1993, 1, 'en', 'strings', 'frontend.general.add_to_wishlist', 'Add To Wishlist', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1994, 1, 'en', 'strings', 'frontend.welcome_to', 'Welcome to :place', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1995, 1, 'en', 'strings', 'backend.menu_manager.page', 'Page', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1996, 1, 'en', 'strings', 'backend.menu_manager.link', 'Link', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1997, 1, 'en', 'strings', 'backend.menu_manager.title', 'Menu Manager', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1998, 1, 'en', 'strings', 'backend.menu_manager.edit_menus', 'Edit Menus', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(1999, 1, 'en', 'strings', 'backend.menu_manager.locations', 'Locations', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2000, 1, 'en', 'strings', 'backend.menu_manager.select_to_edit', 'Select the menu you want to edit', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2001, 1, 'en', 'strings', 'backend.menu_manager.create_new', 'Create new menu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2002, 1, 'en', 'strings', 'backend.menu_manager.or', 'Or', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2003, 1, 'en', 'strings', 'backend.menu_manager.choose', 'Choose', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2004, 1, 'en', 'strings', 'backend.menu_manager.welcome', 'Welcome', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2005, 1, 'en', 'strings', 'backend.menu_manager.url', 'URL', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2006, 1, 'en', 'strings', 'backend.menu_manager.label', 'Label', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2007, 1, 'en', 'strings', 'backend.menu_manager.add_to_menu', 'Add to Menu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2008, 1, 'en', 'strings', 'backend.menu_manager.screen_reader_text', 'Press return or enter to expand', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2009, 1, 'en', 'strings', 'backend.menu_manager.categories', 'Categories', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2010, 1, 'en', 'strings', 'backend.menu_manager.Category', 'Category', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2011, 1, 'en', 'strings', 'backend.menu_manager.pages', 'Pages', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2012, 1, 'en', 'strings', 'backend.menu_manager.posts', 'Posts', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2013, 1, 'en', 'strings', 'backend.menu_manager.post', 'Post', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2014, 1, 'en', 'strings', 'backend.menu_manager.custom_link', 'Custom Link', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2015, 1, 'en', 'strings', 'backend.menu_manager.menu_structure', 'Menu Structure', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2016, 1, 'en', 'strings', 'backend.menu_manager.name', 'Name', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2017, 1, 'en', 'strings', 'backend.menu_manager.create_menu', 'Create Menu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2018, 1, 'en', 'strings', 'backend.menu_manager.save_menu', 'Save Menu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2019, 1, 'en', 'strings', 'backend.menu_manager.delete_menu', 'Delete Menu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2020, 1, 'en', 'strings', 'backend.menu_manager.sub_menu', 'Sub-menu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2021, 1, 'en', 'strings', 'backend.menu_manager.menu_creation', 'Menu Creation', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2022, 1, 'en', 'strings', 'backend.menu_manager.drag_instruction_1', 'Place each item in the order you prefer. Click on the arrow to the right of the item to display more configuration options.', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2023, 1, 'en', 'strings', 'backend.menu_manager.drag_instruction_2', 'Please enter the name and select \"Create menu\" button', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2024, 1, 'en', 'strings', 'backend.menu_manager.class', 'Class CSS (optional)', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2025, 1, 'en', 'strings', 'backend.menu_manager.move', 'Move', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2026, 1, 'en', 'strings', 'backend.menu_manager.move_up', 'Move up', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2027, 1, 'en', 'strings', 'backend.menu_manager.move_down', 'Move down', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2028, 1, 'en', 'strings', 'backend.menu_manager.move_right', 'Move right', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2029, 1, 'en', 'strings', 'backend.menu_manager.move_left', 'Move left', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2030, 1, 'en', 'strings', 'backend.menu_manager.top', 'Top', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2031, 1, 'en', 'strings', 'backend.menu_manager.delete', 'Delete', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2032, 1, 'en', 'strings', 'backend.menu_manager.cancel', 'Cancel', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2033, 1, 'en', 'strings', 'backend.menu_manager.update_item', 'Update Item', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2034, 1, 'en', 'strings', 'backend.menu_manager.menu_settings', 'Menu Settings', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2035, 1, 'en', 'strings', 'backend.menu_manager.auto_add_pages', 'Auto Add Pages', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2036, 1, 'en', 'strings', 'backend.menu_manager.auto_add_pages_desc', 'Automatically add new top-level pages to this menu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2037, 1, 'en', 'strings', 'backend.menu_manager.display', 'Display', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2038, 1, 'en', 'strings', 'backend.menu_manager.top_menu', 'Top Menu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2039, 1, 'en', 'strings', 'backend.menu_manager.footer_menu', 'Footer Menu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2040, 1, 'en', 'strings', 'backend.menu_manager.currently', 'Currently set to', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2041, 1, 'en', 'strings', 'backend.menu_manager.theme_location', 'Theme Location', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2042, 1, 'en', 'strings', 'backend.menu_manager.save_changes', 'Save Changes', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2043, 1, 'en', 'strings', 'backend.menu_manager.assigned_menu', 'Assigned Menu', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2044, 1, 'en', 'strings', 'backend.menu_manager.edit', 'Edit', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2045, 1, 'en', 'strings', 'backend.menu_manager.select_all', 'Select All', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2046, 1, 'en', 'strings', 'backend.general.are_you_sure', 'Are you sure you want to do this?', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2047, 1, 'en', 'strings', 'backend.general.app_back_to_list', 'Back to list', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2048, 1, 'en', 'strings', 'backend.general.app_save', 'Save', '2022-03-30 15:37:14', '2022-03-30 15:37:14'),
(2049, 1, 'en', 'strings', 'backend.general.actions', 'Actions', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2050, 1, 'en', 'strings', 'backend.general.app_update', 'Update', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2051, 1, 'en', 'strings', 'backend.general.app_restore', 'Restore', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2052, 1, 'en', 'strings', 'backend.general.app_permadel', 'Permanently Delete', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2053, 1, 'en', 'strings', 'backend.general.all_rights_reserved', 'All Rights Reserved.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2054, 1, 'en', 'strings', 'backend.general.app_add', 'Add', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2055, 1, 'en', 'strings', 'backend.general.app_create', 'Create', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2056, 1, 'en', 'strings', 'backend.general.app_edit', 'Edit', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2057, 1, 'en', 'strings', 'backend.general.app_view', 'View', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2058, 1, 'en', 'strings', 'backend.general.app_list', 'List', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2059, 1, 'en', 'strings', 'backend.general.app_no_entries_in_table', 'No entries in table', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2060, 1, 'en', 'strings', 'backend.general.custom_controller_index', 'Custom controller index.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2061, 1, 'en', 'strings', 'backend.general.app_logout', 'Logout', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2062, 1, 'en', 'strings', 'backend.general.app_add_new', 'Add new', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2063, 1, 'en', 'strings', 'backend.general.app_are_you_sure', 'Are you sure?', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2064, 1, 'en', 'strings', 'backend.general.app_dashboard', 'Dashboard', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2065, 1, 'en', 'strings', 'backend.general.app_delete', 'Delete', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2066, 1, 'en', 'strings', 'backend.general.all', 'All', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2067, 1, 'en', 'strings', 'backend.general.trashed', 'Trashed', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2068, 1, 'en', 'strings', 'backend.general.boilerplate_link', 'JThemes Studio', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2069, 1, 'en', 'strings', 'backend.general.continue', 'Continue', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2070, 1, 'en', 'strings', 'backend.general.member_since', 'Member since', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2071, 1, 'en', 'strings', 'backend.general.minutes', ' minutes', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2072, 1, 'en', 'strings', 'backend.general.search_placeholder', 'Search...', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2073, 1, 'en', 'strings', 'backend.general.timeout', 'You were automatically logged out for security reasons since you had no activity in ', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2074, 1, 'en', 'strings', 'backend.general.see_all.messages', 'See all messages', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2075, 1, 'en', 'strings', 'backend.general.see_all.notifications', 'View all', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2076, 1, 'en', 'strings', 'backend.general.see_all.tasks', 'View all tasks', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2077, 1, 'en', 'strings', 'backend.general.status.online', 'Online', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2078, 1, 'en', 'strings', 'backend.general.status.offline', 'Offline', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2079, 1, 'en', 'strings', 'backend.general.you_have.messages', '{0} You don\'t have messages|{1} You have 1 message|[2,Inf] You have :number messages', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2080, 1, 'en', 'strings', 'backend.general.you_have.notifications', '{0} You don\'t have notifications|{1} You have 1 notification|[2,Inf] You have :number notifications', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2081, 1, 'en', 'strings', 'backend.general.you_have.tasks', '{0} You don\'t have tasks|{1} You have 1 task|[2,Inf] You have :number tasks', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2082, 1, 'en', 'strings', 'backend.access.users.if_confirmed_off', '(If confirmed is off)', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2083, 1, 'en', 'strings', 'backend.access.users.delete_user_confirm', 'Are you sure you want to delete this user permanently? Anywhere in the application that references this user\'s id will most likely error. Proceed at your own risk. This can not be un-done.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2084, 1, 'en', 'strings', 'backend.access.users.no_deactivated', 'There are no deactivated users.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2085, 1, 'en', 'strings', 'backend.access.users.no_deleted', 'There are no deleted users.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2086, 1, 'en', 'strings', 'backend.access.users.restore_user_confirm', 'Restore this user to its original state?', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2087, 1, 'en', 'strings', 'backend.dashboard.title', 'Dashboard', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2088, 1, 'en', 'strings', 'backend.dashboard.welcome', 'Welcome', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2089, 1, 'en', 'strings', 'backend.dashboard.my_courses', 'My Courses', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2090, 1, 'en', 'strings', 'backend.search.empty', 'Please enter a search term.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2091, 1, 'en', 'strings', 'backend.search.incomplete', 'You must write your own search logic for this system.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2092, 1, 'en', 'strings', 'backend.search.title', 'Search Results', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2093, 1, 'en', 'strings', 'backend.search.results', 'Search Results for :query', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2094, 1, 'en', 'strings', 'backend.welcome', 'Welcome to the Dashboard', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2095, 1, 'en', 'strings', 'emails.contact.subject', 'A new :app_name contact form submission!', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2096, 1, 'en', 'strings', 'emails.contact.email_body_title', 'You have a new contact form request: Below are the details:', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2097, 1, 'en', 'strings', 'emails.auth.account_confirmed', 'Your account has been confirmed.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2098, 1, 'en', 'strings', 'emails.auth.thank_you_for_using_app', 'Thank you for using our application!', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2099, 1, 'en', 'strings', 'emails.auth.click_to_confirm', 'Click here to confirm your account:', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2100, 1, 'en', 'strings', 'emails.auth.password_reset_subject', 'Reset Password', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2101, 1, 'en', 'strings', 'emails.auth.password_cause_of_email', 'You are receiving this email because we received a password reset request for your account.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2102, 1, 'en', 'strings', 'emails.auth.password_if_not_requested', 'If you did not request a password reset, no further action is required.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2103, 1, 'en', 'strings', 'emails.auth.error', 'Whoops!', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2104, 1, 'en', 'strings', 'emails.auth.greeting', 'Hello!', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2105, 1, 'en', 'strings', 'emails.auth.regards', 'Regards,', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2106, 1, 'en', 'strings', 'emails.auth.trouble_clicking_button', 'If you’re having trouble clicking the \":action_text\" button, copy and paste the URL below into your web browser:', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2107, 1, 'en', 'strings', 'emails.auth.reset_password', 'Click here to reset your password', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2108, 1, 'en', 'strings', 'emails.offline_order.subject', 'Regarding your recent order on :app_name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2109, 1, 'en', 'validation', 'required', 'The :attribute field is required.', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2110, 1, 'en', 'validation', 'attributes.frontend.old_password', 'Old Password', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2111, 1, 'en', 'validation', 'attributes.frontend.male', 'Male', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2112, 1, 'en', 'validation', 'attributes.frontend.female', 'Female', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2113, 1, 'en', 'validation', 'attributes.frontend.other', 'Other', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2114, 1, 'en', 'validation', 'attributes.frontend.password', 'Password', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2115, 1, 'en', 'validation', 'attributes.frontend.password_confirmation', 'Password Confirmation', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2116, 1, 'en', 'validation', 'attributes.frontend.avatar', 'Avatar Location', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2117, 1, 'en', 'validation', 'attributes.frontend.first_name', 'First Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2118, 1, 'en', 'validation', 'attributes.frontend.last_name', 'Last Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2119, 1, 'en', 'validation', 'attributes.frontend.email', 'E-mail Address', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2120, 1, 'en', 'validation', 'attributes.frontend.name', 'Full Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2121, 1, 'en', 'validation', 'attributes.frontend.phone', 'Phone', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2122, 1, 'en', 'validation', 'attributes.frontend.message', 'Message', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2123, 1, 'en', 'validation', 'attributes.frontend.new_password', 'New Password', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2124, 1, 'en', 'validation', 'attributes.frontend.new_password_confirmation', 'New Password Confirmation', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2125, 1, 'en', 'validation', 'attributes.frontend.timezone', 'Timezone', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2126, 1, 'en', 'validation', 'attributes.frontend.language', 'Language', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2127, 1, 'en', 'validation', 'attributes.frontend.gravatar', 'Gravatar', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2128, 1, 'en', 'validation', 'attributes.frontend.upload', 'Upload', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2129, 1, 'en', 'validation', 'attributes.frontend.captcha', 'Captcha required', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2130, 1, 'en', 'validation', 'attributes.frontend.personal_information', 'Personal Information', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2131, 1, 'en', 'validation', 'attributes.frontend.social_information', 'Social Information', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2132, 1, 'en', 'validation', 'attributes.frontend.payment_information', 'Payment Information', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2133, 1, 'en', 'validation', 'attributes.backend.access.roles.name', 'Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2134, 1, 'en', 'validation', 'attributes.backend.access.roles.associated_permissions', 'Associated Permissions', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2135, 1, 'en', 'validation', 'attributes.backend.access.roles.sort', 'Sort', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2136, 1, 'en', 'validation', 'attributes.backend.access.users.password', 'Password', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2137, 1, 'en', 'validation', 'attributes.backend.access.users.password_confirmation', 'Password Confirmation', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2138, 1, 'en', 'validation', 'attributes.backend.access.users.first_name', 'First Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2139, 1, 'en', 'validation', 'attributes.backend.access.users.last_name', 'Last Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2140, 1, 'en', 'validation', 'attributes.backend.access.users.email', 'E-mail Address', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2141, 1, 'en', 'validation', 'attributes.backend.access.users.active', 'Active', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2142, 1, 'en', 'validation', 'attributes.backend.access.users.confirmed', 'Confirmed', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2143, 1, 'en', 'validation', 'attributes.backend.access.users.send_confirmation_email', 'Send Confirmation E-mail', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2144, 1, 'en', 'validation', 'attributes.backend.access.users.associated_roles', 'Associated Roles', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2145, 1, 'en', 'validation', 'attributes.backend.access.users.name', 'Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2146, 1, 'en', 'validation', 'attributes.backend.access.users.other_permissions', 'Other Permissions', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2147, 1, 'en', 'validation', 'attributes.backend.access.users.timezone', 'Timezone', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2148, 1, 'en', 'validation', 'attributes.backend.access.users.language', 'Language', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2149, 1, 'en', 'validation', 'attributes.backend.access.permissions.associated_roles', 'Associated Roles', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2150, 1, 'en', 'validation', 'attributes.backend.access.permissions.dependencies', 'Dependencies', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2151, 1, 'en', 'validation', 'attributes.backend.access.permissions.display_name', 'Display Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2152, 1, 'en', 'validation', 'attributes.backend.access.permissions.group', 'Group', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2153, 1, 'en', 'validation', 'attributes.backend.access.permissions.group_sort', 'Group Sort', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2154, 1, 'en', 'validation', 'attributes.backend.access.permissions.groups.name', 'Group Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2155, 1, 'en', 'validation', 'attributes.backend.access.permissions.name', 'Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2156, 1, 'en', 'validation', 'attributes.backend.access.permissions.first_name', 'First Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2157, 1, 'en', 'validation', 'attributes.backend.access.permissions.last_name', 'Last Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2158, 1, 'en', 'validation', 'attributes.backend.access.permissions.system', 'System', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2159, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.facebook.label', 'Facebook Login Status', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2160, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.facebook.client_id', 'Client ID', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2161, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.facebook.client_secret', 'Client Secret', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2162, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.facebook.redirect', 'Redirect URL', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2163, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.google.label', 'Google Login Status', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2164, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.google.client_id', 'Client ID', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2165, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.google.client_secret', 'Client Secret', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2166, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.google.redirect', 'Redirect URL', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2167, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.twitter.label', 'Twitter Login Status', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2168, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.twitter.client_id', 'Client ID', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2169, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.twitter.client_secret', 'Client Secret', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2170, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.twitter.redirect', 'Redirect URL', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2171, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.linkedin.label', 'LinkedIn Login Status', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2172, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.linkedin.client_id', 'Client ID', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2173, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.linkedin.client_secret', 'Client Secret', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2174, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.linkedin.redirect', 'Redirect URL', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2175, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.github.label', 'Github Login Status', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2176, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.github.client_id', 'Client ID', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2177, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.github.client_secret', 'Client Secret', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2178, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.github.redirect', 'Redirect URL', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2179, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.bitbucket.label', 'Bitbucket Login Status', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2180, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.bitbucket.client_id', 'Client ID', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2181, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.bitbucket.client_secret', 'Client Secret', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2182, 1, 'en', 'validation', 'attributes.backend.settings.social_settings.bitbucket.redirect', 'Redirect URL', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2183, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.app_name', 'App Name', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2184, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.app_url', 'App URL', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2185, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.app_locale', 'App Locale', '2022-03-30 15:37:15', '2022-03-30 15:37:15'),
(2186, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.app_timezone', 'App Timezone', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2187, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_driver', 'Mail Driver', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2188, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_host', 'Mail Host', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2189, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_port', 'Mail Port', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2190, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_from_name', 'Mail From Name', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2191, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.lesson_timer', 'Lesson Timer', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2192, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_from_address', 'Mail From Address', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2193, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_username', 'Mail Username', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2194, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.mail_password', 'Mail Password', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2195, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.enable_registration', 'Enable Registration', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2196, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.change_email', 'Change Email', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2197, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.password_history', 'Password History', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2198, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.password_expires_days', 'Password Expires Days', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2199, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.requires_approval', 'Requires Approval', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2200, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.confirm_email', 'Confirm Email', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2201, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.homepage', 'Select Homepage', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2202, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.captcha_status', 'Captcha Status', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2203, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.captcha_site_key', 'Captcha Key', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2204, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.captcha_site_secret', 'Captcha Secret', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2205, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.google_analytics', 'Google Analytics Code', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2206, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.theme_layout', 'Theme Layout', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2207, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.font_color', 'Font Color', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2208, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.layout_type', 'Layout Type', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2209, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.retest_status', 'Re-Test', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2210, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.show_offers', 'Show Offers Page', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2211, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.one_signal_push_notification', 'OneSignal Setup', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2212, 1, 'en', 'validation', 'attributes.backend.settings.general_settings.onesignal_code', 'Paste OneSignal script code here', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2213, 1, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2214, 1, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2215, 1, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2216, 1, 'en', 'validation', 'after_or_equal', 'The :attribute must be a date after or equal to :date.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2217, 1, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2218, 1, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, dashes and underscores.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2219, 1, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2220, 1, 'en', 'validation', 'array', 'The :attribute must be an array.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2221, 1, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2222, 1, 'en', 'validation', 'before_or_equal', 'The :attribute must be a date before or equal to :date.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2223, 1, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2224, 1, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2225, 1, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2226, 1, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2227, 1, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2228, 1, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2229, 1, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2230, 1, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2231, 1, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2232, 1, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2233, 1, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2234, 1, 'en', 'validation', 'dimensions', 'The :attribute has invalid image dimensions.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2235, 1, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2236, 1, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2237, 1, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2238, 1, 'en', 'validation', 'file', 'The :attribute must be a file.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2239, 1, 'en', 'validation', 'filled', 'The :attribute field must have a value.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2240, 1, 'en', 'validation', 'gt.numeric', 'The :attribute must be greater than :value.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2241, 1, 'en', 'validation', 'gt.file', 'The :attribute must be greater than :value kilobytes.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2242, 1, 'en', 'validation', 'gt.string', 'The :attribute must be greater than :value characters.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2243, 1, 'en', 'validation', 'gt.array', 'The :attribute must have more than :value items.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2244, 1, 'en', 'validation', 'gte.numeric', 'The :attribute must be greater than or equal :value.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2245, 1, 'en', 'validation', 'gte.file', 'The :attribute must be greater than or equal :value kilobytes.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2246, 1, 'en', 'validation', 'gte.string', 'The :attribute must be greater than or equal :value characters.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2247, 1, 'en', 'validation', 'gte.array', 'The :attribute must have :value items or more.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2248, 1, 'en', 'validation', 'image', 'The :attribute must be an image.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2249, 1, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2250, 1, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2251, 1, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2252, 1, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2253, 1, 'en', 'validation', 'ipv4', 'The :attribute must be a valid IPv4 address.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2254, 1, 'en', 'validation', 'ipv6', 'The :attribute must be a valid IPv6 address.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2255, 1, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2256, 1, 'en', 'validation', 'lt.numeric', 'The :attribute must be less than :value.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2257, 1, 'en', 'validation', 'lt.file', 'The :attribute must be less than :value kilobytes.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2258, 1, 'en', 'validation', 'lt.string', 'The :attribute must be less than :value characters.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2259, 1, 'en', 'validation', 'lt.array', 'The :attribute must have less than :value items.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2260, 1, 'en', 'validation', 'lte.numeric', 'The :attribute must be less than or equal :value.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2261, 1, 'en', 'validation', 'lte.file', 'The :attribute must be less than or equal :value kilobytes.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2262, 1, 'en', 'validation', 'lte.string', 'The :attribute must be less than or equal :value characters.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2263, 1, 'en', 'validation', 'lte.array', 'The :attribute must not have more than :value items.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2264, 1, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2265, 1, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2266, 1, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2267, 1, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2268, 1, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2269, 1, 'en', 'validation', 'mimetypes', 'The :attribute must be a file of type: :values.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2270, 1, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2271, 1, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2272, 1, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2273, 1, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2274, 1, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2275, 1, 'en', 'validation', 'not_regex', 'The :attribute format is invalid.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2276, 1, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2277, 1, 'en', 'validation', 'present', 'The :attribute field must be present.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2278, 1, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2279, 1, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2280, 1, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2281, 1, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2022-03-30 15:37:16', '2022-03-30 15:37:16');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2282, 1, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values are present.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2283, 1, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2284, 1, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2285, 1, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2286, 1, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2287, 1, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2288, 1, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2289, 1, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2290, 1, 'en', 'validation', 'string', 'The :attribute must be a string.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2291, 1, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2292, 1, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2293, 1, 'en', 'validation', 'uploaded', 'The :attribute failed to upload.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2294, 1, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2295, 1, 'en', 'validation', 'uuid', 'The :attribute must be a valid UUID.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2296, 1, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2297, 1, 'ar', 'vendor/backup', 'exception_message', 'رسالة استثناء: :message', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2298, 1, 'ar', 'vendor/backup', 'exception_trace', 'تتبع الاستثناء: :trace', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2299, 1, 'ar', 'vendor/backup', 'exception_message_title', 'رسالة استثناء', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2300, 1, 'ar', 'vendor/backup', 'exception_trace_title', 'تتبع استثناء', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2301, 1, 'ar', 'vendor/backup', 'backup_failed_subject', 'فشل النسخ الاحتياطي من application_name:', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2302, 1, 'ar', 'vendor/backup', 'backup_failed_body', 'Important: حدث خطأ أثناء النسخ الاحتياطي :application_name', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2303, 1, 'ar', 'vendor/backup', 'backup_successful_subject', 'نسخة احتياطية جديدة ناجحة من :application_name', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2304, 1, 'ar', 'vendor/backup', 'backup_successful_subject_title', 'نسخة احتياطية جديدة ناجحة!', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2305, 1, 'ar', 'vendor/backup', 'backup_successful_body', 'خبر رائع ، تم إنشاء نسخة احتياطية جديدة من application_name: بنجاح على القرص المسمى disk_name:.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2306, 1, 'ar', 'vendor/backup', 'cleanup_failed_subject', 'فشل تنظيف النسخ الاحتياطية لـ :application_name.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2307, 1, 'ar', 'vendor/backup', 'cleanup_failed_body', 'حدث خطأ أثناء تنظيف النسخ الاحتياطية لـ :application_name', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2308, 1, 'ar', 'vendor/backup', 'cleanup_successful_subject', 'تنظيف: النسخ الاحتياطية :application_name ناجحة', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2309, 1, 'ar', 'vendor/backup', 'cleanup_successful_subject_title', 'تنظيف النسخ الاحتياطية الناجحة!', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2310, 1, 'ar', 'vendor/backup', 'cleanup_successful_body', 'تم تنظيف النسخ الاحتياطية لـ :application_name على القرص المسمى :disk_name.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2311, 1, 'ar', 'vendor/backup', 'healthy_backup_found_subject', 'النسخ الاحتياطية لـ :application_name على القرص :disk_name سليمة', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2312, 1, 'ar', 'vendor/backup', 'healthy_backup_found_subject_title', 'النسخ الاحتياطية لـ :application_name صحية', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2313, 1, 'ar', 'vendor/backup', 'healthy_backup_found_body', 'تعتبر النسخ الاحتياطية لـ :application_name صحية. عمل جيد!', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2314, 1, 'ar', 'vendor/backup', 'unhealthy_backup_found_subject', 'هام: النسخ الاحتياطية لـ :application_name غير صحية', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2315, 1, 'ar', 'vendor/backup', 'unhealthy_backup_found_subject_title', 'Important: النسخ الاحتياطية لـ :application_name غير صحية. : problem', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2316, 1, 'ar', 'vendor/backup', 'unhealthy_backup_found_body', 'النسخ الاحتياطية لـ :application_name على القرص :disk_name غير صحية.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2317, 1, 'ar', 'vendor/backup', 'unhealthy_backup_found_not_reachable', 'لا يمكن الوصول إلى وجهة النسخ الاحتياطي. :error', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2318, 1, 'ar', 'vendor/backup', 'unhealthy_backup_found_empty', 'لا توجد نسخ احتياطية لهذا التطبيق على الإطلاق.', '2022-03-30 15:37:16', '2022-03-30 15:37:16'),
(2319, 1, 'ar', 'vendor/backup', 'unhealthy_backup_found_old', 'أحدث نسخة احتياطية صنعت في :date تعتبر قديمة جدًا.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2320, 1, 'ar', 'vendor/backup', 'unhealthy_backup_found_unknown', 'آسف ، لا يمكن تحديد السبب الدقيق.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2321, 1, 'ar', 'vendor/backup', 'unhealthy_backup_found_full', 'النسخ الاحتياطية تستخدم الكثير من التخزين. الاستخدام الحالي هو :disk_usage وهو أعلى من الحد المسموح به وهو :disk_limit.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2322, 1, 'en', 'vendor/backup', 'exception_message', 'Exception message: :message', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2323, 1, 'en', 'vendor/backup', 'exception_trace', 'Exception trace: :trace', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2324, 1, 'en', 'vendor/backup', 'exception_message_title', 'Exception message', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2325, 1, 'en', 'vendor/backup', 'exception_trace_title', 'Exception trace', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2326, 1, 'en', 'vendor/backup', 'backup_failed_subject', 'Failed backup of :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2327, 1, 'en', 'vendor/backup', 'backup_failed_body', 'Important: An error occurred while backing up :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2328, 1, 'en', 'vendor/backup', 'backup_successful_subject', 'Successful new backup of :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2329, 1, 'en', 'vendor/backup', 'backup_successful_subject_title', 'Successful new backup!', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2330, 1, 'en', 'vendor/backup', 'backup_successful_body', 'Great news, a new backup of :application_name was successfully created on the disk named :disk_name.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2331, 1, 'en', 'vendor/backup', 'cleanup_failed_subject', 'Cleaning up the backups of :application_name failed.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2332, 1, 'en', 'vendor/backup', 'cleanup_failed_body', 'An error occurred while cleaning up the backups of :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2333, 1, 'en', 'vendor/backup', 'cleanup_successful_subject', 'Clean up of :application_name backups successful', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2334, 1, 'en', 'vendor/backup', 'cleanup_successful_subject_title', 'Clean up of backups successful!', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2335, 1, 'en', 'vendor/backup', 'cleanup_successful_body', 'The clean up of the :application_name backups on the disk named :disk_name was successful.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2336, 1, 'en', 'vendor/backup', 'healthy_backup_found_subject', 'The backups for :application_name on disk :disk_name are healthy', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2337, 1, 'en', 'vendor/backup', 'healthy_backup_found_subject_title', 'The backups for :application_name are healthy', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2338, 1, 'en', 'vendor/backup', 'healthy_backup_found_body', 'The backups for :application_name are considered healthy. Good job!', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2339, 1, 'en', 'vendor/backup', 'unhealthy_backup_found_subject', 'Important: The backups for :application_name are unhealthy', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2340, 1, 'en', 'vendor/backup', 'unhealthy_backup_found_subject_title', 'Important: The backups for :application_name are unhealthy. :problem', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2341, 1, 'en', 'vendor/backup', 'unhealthy_backup_found_body', 'The backups for :application_name on disk :disk_name are unhealthy.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2342, 1, 'en', 'vendor/backup', 'unhealthy_backup_found_not_reachable', 'The backup destination cannot be reached. :error', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2343, 1, 'en', 'vendor/backup', 'unhealthy_backup_found_empty', 'There are no backups of this application at all.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2344, 1, 'en', 'vendor/backup', 'unhealthy_backup_found_old', 'The latest backup made on :date is considered too old.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2345, 1, 'en', 'vendor/backup', 'unhealthy_backup_found_unknown', 'Sorry, an exact reason cannot be determined.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2346, 1, 'en', 'vendor/backup', 'unhealthy_backup_found_full', 'The backups are using too much storage. Current usage is :disk_usage which is higher than the allowed limit of :disk_limit.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2347, 1, 'es', 'vendor/backup', 'exception_message', 'Mensaje de la excepción: :message', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2348, 1, 'es', 'vendor/backup', 'exception_trace', 'Traza de la excepción: :trace', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2349, 1, 'es', 'vendor/backup', 'exception_message_title', 'Mensaje de la excepción', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2350, 1, 'es', 'vendor/backup', 'exception_trace_title', 'Traza de la excepción', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2351, 1, 'es', 'vendor/backup', 'backup_failed_subject', 'Copia de seguridad de :application_name fallida', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2352, 1, 'es', 'vendor/backup', 'backup_failed_body', 'Importante: Ocurrió un error al realizar la copia de seguridad de :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2353, 1, 'es', 'vendor/backup', 'backup_successful_subject', 'Se completó con éxito la copia de seguridad de :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2354, 1, 'es', 'vendor/backup', 'backup_successful_subject_title', '¡Nueva copia de seguridad creada con éxito!', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2355, 1, 'es', 'vendor/backup', 'backup_successful_body', 'Buenas noticias, una nueva copia de seguridad de :application_name fue creada con éxito en el disco llamado :disk_name.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2356, 1, 'es', 'vendor/backup', 'cleanup_failed_subject', 'La limpieza de copias de seguridad de :application_name falló.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2357, 1, 'es', 'vendor/backup', 'cleanup_failed_body', 'Ocurrió un error mientras se realizaba la limpieza de copias de seguridad de :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2358, 1, 'es', 'vendor/backup', 'cleanup_successful_subject', 'La limpieza de copias de seguridad de :application_name se completó con éxito', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2359, 1, 'es', 'vendor/backup', 'cleanup_successful_subject_title', '!Limpieza de copias de seguridad completada con éxito!', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2360, 1, 'es', 'vendor/backup', 'cleanup_successful_body', 'La limpieza de copias de seguridad de :application_name en el disco llamado :disk_name se completo con éxito.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2361, 1, 'es', 'vendor/backup', 'healthy_backup_found_subject', 'Las copias de seguridad de :application_name en el disco :disk_name están en buen estado', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2362, 1, 'es', 'vendor/backup', 'healthy_backup_found_subject_title', 'Las copias de seguridad de :application_name están en buen estado', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2363, 1, 'es', 'vendor/backup', 'healthy_backup_found_body', 'Las copias de seguridad de :application_name se consideran en buen estado. ¡Buen trabajo!', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2364, 1, 'es', 'vendor/backup', 'unhealthy_backup_found_subject', 'Importante: Las copias de seguridad de :application_name están en mal estado', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2365, 1, 'es', 'vendor/backup', 'unhealthy_backup_found_subject_title', 'Importante: Las copias de seguridad de :application_name están en mal estado. :problem', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2366, 1, 'es', 'vendor/backup', 'unhealthy_backup_found_body', 'Las copias de seguridad de :application_name en el disco :disk_name están en mal estado.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2367, 1, 'es', 'vendor/backup', 'unhealthy_backup_found_not_reachable', 'No se puede acceder al destino de la copia de seguridad. :error', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2368, 1, 'es', 'vendor/backup', 'unhealthy_backup_found_empty', 'No existe ninguna copia de seguridad de esta aplicación.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2369, 1, 'es', 'vendor/backup', 'unhealthy_backup_found_old', 'La última copia de seguriad hecha en :date es demasiado antigua.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2370, 1, 'es', 'vendor/backup', 'unhealthy_backup_found_unknown', 'Lo siento, no es posible determinar la razón exacta.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2371, 1, 'es', 'vendor/backup', 'unhealthy_backup_found_full', 'Las copias de seguridad  están ocupando demasiado espacio. El espacio utilizado actualmente es :disk_usage el cual es mayor que el límite permitido de :disk_limit.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2372, 1, 'fr', 'vendor/backup', 'exception_message', 'Message de l\'exception : :message', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2373, 1, 'fr', 'vendor/backup', 'exception_trace', 'Trace de l\'exception : :trace', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2374, 1, 'fr', 'vendor/backup', 'exception_message_title', 'Message de l\'exception', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2375, 1, 'fr', 'vendor/backup', 'exception_trace_title', 'Trace de l\'exception', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2376, 1, 'fr', 'vendor/backup', 'backup_failed_subject', 'Échec de la sauvegarde de :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2377, 1, 'fr', 'vendor/backup', 'backup_failed_body', 'Important : Une erreur est survenue lors de la sauvegarde de :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2378, 1, 'fr', 'vendor/backup', 'backup_successful_subject', 'Succès de la sauvegarde de :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2379, 1, 'fr', 'vendor/backup', 'backup_successful_subject_title', 'Sauvegarde créée avec succès !', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2380, 1, 'fr', 'vendor/backup', 'backup_successful_body', 'Bonne nouvelle, une nouvelle sauvegarde de :application_name a été créée avec succès sur le disque nommé :disk_name.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2381, 1, 'fr', 'vendor/backup', 'cleanup_failed_subject', 'Le nettoyage des sauvegardes de :application_name a echoué.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2382, 1, 'fr', 'vendor/backup', 'cleanup_failed_body', 'Une erreur est survenue lors du nettoyage des sauvegardes de :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2383, 1, 'fr', 'vendor/backup', 'cleanup_successful_subject', 'Succès du nettoyage des sauvegardes de :application_name', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2384, 1, 'fr', 'vendor/backup', 'cleanup_successful_subject_title', 'Sauvegardes nettoyées avec succès !', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2385, 1, 'fr', 'vendor/backup', 'cleanup_successful_body', 'Le nettoyage des sauvegardes de :application_name sur le disque nommé :disk_name a été effectué avec succès.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2386, 1, 'fr', 'vendor/backup', 'healthy_backup_found_subject', 'Les sauvegardes pour :application_name sur le disque :disk_name sont saines', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2387, 1, 'fr', 'vendor/backup', 'healthy_backup_found_subject_title', 'Les sauvegardes pour :application_name sont saines', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2388, 1, 'fr', 'vendor/backup', 'healthy_backup_found_body', 'Les sauvegardes pour :application_name sont considérées saines. Bon travail !', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2389, 1, 'fr', 'vendor/backup', 'unhealthy_backup_found_subject', 'Important : Les sauvegardes pour :application_name sont corrompues', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2390, 1, 'fr', 'vendor/backup', 'unhealthy_backup_found_subject_title', 'Important : Les sauvegardes pour :application_name sont corrompues. :problem', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2391, 1, 'fr', 'vendor/backup', 'unhealthy_backup_found_body', 'Les sauvegardes pour :application_name sur le disque :disk_name sont corrompues.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2392, 1, 'fr', 'vendor/backup', 'unhealthy_backup_found_not_reachable', 'La destination de la sauvegarde n\'est pas accessible. :error', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2393, 1, 'fr', 'vendor/backup', 'unhealthy_backup_found_empty', 'Il n\'y a aucune sauvegarde pour cette application.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2394, 1, 'fr', 'vendor/backup', 'unhealthy_backup_found_old', 'La dernière sauvegarde du :date est considérée trop vieille.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2395, 1, 'fr', 'vendor/backup', 'unhealthy_backup_found_unknown', 'Désolé, une raison exacte ne peut être déterminée.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2396, 1, 'fr', 'vendor/backup', 'unhealthy_backup_found_full', 'Les sauvegardes utilisent trop d\'espace disque. L\'utilisation actuelle est de :disk_usage alors que la limite autorisée est de :disk_limit.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2397, 1, 'ar', 'vendor/chatter', 'success.title', 'أحسنت!', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2398, 1, 'ar', 'vendor/chatter', 'success.reason.submitted_to_post', 'تم تقديم الرد بنجاح للمناقشة. discussion', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2399, 1, 'ar', 'vendor/chatter', 'success.reason.updated_post', 'Discussion تم تحديث المناقشة بنجاح.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2400, 1, 'ar', 'vendor/chatter', 'success.reason.destroy_post', 'تم حذف الرد والمناقشة بنجاح. discussion', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2401, 1, 'ar', 'vendor/chatter', 'success.reason.destroy_from_discussion', 'تم حذف الرد بنجاح من المناقشة. discussion', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2402, 1, 'ar', 'vendor/chatter', 'success.reason.created_discussion', 'تم إنشاء مناقشة جديدة بنجاح. discussion', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2403, 1, 'ar', 'vendor/chatter', 'info.title', 'انتباه!', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2404, 1, 'ar', 'vendor/chatter', 'warning.title', 'ووه أوه!', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2405, 1, 'ar', 'vendor/chatter', 'danger.title', 'يا سناب!', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2406, 1, 'ar', 'vendor/chatter', 'danger.reason.errors', 'يرجى تصحيح الأخطاء التالية:', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2407, 1, 'ar', 'vendor/chatter', 'danger.reason.prevent_spam', 'لمنع البريد العشوائي ، يرجى السماح على الأقل :minutes بين إرسال المحتوى.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2408, 1, 'ar', 'vendor/chatter', 'danger.reason.trouble', 'عذرًا ، يبدو أنه كانت هناك مشكلة في إرسال ردك.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2409, 1, 'ar', 'vendor/chatter', 'danger.reason.update_post', 'آه آه آه ... لا يمكن تحديث ردكم. تأكد من أنك لا تفعل أي شيء شادي.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2410, 1, 'ar', 'vendor/chatter', 'danger.reason.destroy_post', 'آه آه آه ... لا يمكن حذف الرد. تأكد من أنك لا تفعل أي شيء شادي.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2411, 1, 'ar', 'vendor/chatter', 'danger.reason.create_discussion', 'عفوًا :( يبدو أن هناك مشكلة في إنشاء مناقشتك. discussion. :(', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2412, 1, 'ar', 'vendor/chatter', 'danger.reason.title_required', 'يرجى كتابة العنوان', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2413, 1, 'ar', 'vendor/chatter', 'danger.reason.title_min', 'يجب أن يكون العنوان على الأقل: أحرف :min.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2414, 1, 'ar', 'vendor/chatter', 'danger.reason.title_max', 'يجب ألا يزيد العنوان عن: أحرف :max.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2415, 1, 'ar', 'vendor/chatter', 'danger.reason.content_required', 'يرجى كتابة بعض المحتوى', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2416, 1, 'ar', 'vendor/chatter', 'danger.reason.content_min', 'يجب أن يحتوي المحتوى على الأقل: أحرف :min', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2417, 1, 'ar', 'vendor/chatter', 'danger.reason.category_required', 'يرجى اختيار فئة', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2418, 1, 'ar', 'vendor/chatter', 'preheader', 'أردت فقط أن أخبرك أن شخصًا ما قد استجاب لنشر منتدى.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2419, 1, 'ar', 'vendor/chatter', 'greeting', 'مرحبا،,', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2420, 1, 'ar', 'vendor/chatter', 'body', 'أردت فقط أن أخبركم بأن شخصًا ما قد استجاب لنشر منتدى في discussion', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2421, 1, 'ar', 'vendor/chatter', 'view_discussion', 'عرض المناقشة. discussion', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2422, 1, 'ar', 'vendor/chatter', 'farewell', 'أتمنى لك يوما عظيما!.', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2423, 1, 'ar', 'vendor/chatter', 'unsuscribe.message', 'إذا لم تعد ترغب في أن يتم إعلامك عندما يستجيب شخص ما لهذا المنشور ، فتأكد من إلغاء تحديد إعداد الإشعارات في أسفل الصفحة :)', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2424, 1, 'ar', 'vendor/chatter', 'unsuscribe.action', 'لا أحب هذه رسائل البريد الإلكتروني؟', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2425, 1, 'ar', 'vendor/chatter', 'unsuscribe.link', 'إلغاء الاشتراك في هذه المناقشة. discussion', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2426, 1, 'ar', 'vendor/chatter', 'titles.discussion', 'نقاش', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2427, 1, 'ar', 'vendor/chatter', 'titles.discussions', 'مناقشات', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2428, 1, 'ar', 'vendor/chatter', 'headline', 'مرحبا بكم في الثرثرة', '2022-03-30 15:37:17', '2022-03-30 15:37:17'),
(2429, 1, 'ar', 'vendor/chatter', 'description', 'حزمة منتدى بسيطة لتطبيق Laravel الخاص بك.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2430, 1, 'ar', 'vendor/chatter', 'words.cancel', 'إلغاء', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2431, 1, 'ar', 'vendor/chatter', 'words.delete', 'حذف', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2432, 1, 'ar', 'vendor/chatter', 'words.edit', 'تصحيح', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2433, 1, 'ar', 'vendor/chatter', 'words.yes', 'نعم فعلا', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2434, 1, 'ar', 'vendor/chatter', 'words.no', 'لا', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2435, 1, 'ar', 'vendor/chatter', 'words.minutes', '1 دقيقة | :count دقيقة', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2436, 1, 'ar', 'vendor/chatter', 'discussion.new', 'مناقشة جديدة discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2437, 1, 'ar', 'vendor/chatter', 'discussion.all', 'كل مناقشة discussions', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2438, 1, 'ar', 'vendor/chatter', 'discussion.create', 'إنشاء مناقشة discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2439, 1, 'ar', 'vendor/chatter', 'discussion.posted_by', 'منشور من طرف', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2440, 1, 'ar', 'vendor/chatter', 'discussion.head_details', 'نشر في الفئة', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2441, 1, 'ar', 'vendor/chatter', 'response.confirm', 'هل أنت متأكد أنك تريد حذف هذا الرد؟', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2442, 1, 'ar', 'vendor/chatter', 'response.yes_confirm', 'نعم احذفها', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2443, 1, 'ar', 'vendor/chatter', 'response.no_confirm', 'لا شكرا', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2444, 1, 'ar', 'vendor/chatter', 'response.submit', 'إرسال الرد', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2445, 1, 'ar', 'vendor/chatter', 'response.update', 'تحديث الرد', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2446, 1, 'ar', 'vendor/chatter', 'editor.title', 'عنوان المناقشةdiscussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2447, 1, 'ar', 'vendor/chatter', 'editor.select', 'اختر تصنيف', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2448, 1, 'ar', 'vendor/chatter', 'editor.tinymce_placeholder', 'اكتب محادثتك هنا ... discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2449, 1, 'ar', 'vendor/chatter', 'editor.select_color_text', 'اختر لونًا لهذه المناقشة (اختياري) discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2450, 1, 'ar', 'vendor/chatter', 'email.notify', 'أعلمني عندما يرد شخص ما discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2451, 1, 'ar', 'vendor/chatter', 'auth', 'يرجى <a href=\"/:home/login\"> تسجيل الدخول </a>\r\n                أو <a href=\"/:home/register\"> التسجيل </a>\r\n                لترك الرد.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2452, 1, 'de', 'vendor/chatter', 'success.title', 'Well done!', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2453, 1, 'de', 'vendor/chatter', 'success.reason.submitted_to_post', 'Antwort erfolgreich zur discussion hinzugefügt.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2454, 1, 'de', 'vendor/chatter', 'success.reason.updated_post', 'Die discussion wurde erfolgreich geändert.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2455, 1, 'de', 'vendor/chatter', 'success.reason.destroy_post', 'Antwort und discussion wurden erfolgreich gelöscht.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2456, 1, 'de', 'vendor/chatter', 'success.reason.destroy_from_discussion', 'Antwort wurde erfolgreich von der discussion entfernt.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2457, 1, 'de', 'vendor/chatter', 'success.reason.created_discussion', 'Die discussion wurde erfolgreich erstellt.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2458, 1, 'de', 'vendor/chatter', 'info.title', 'Info', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2459, 1, 'de', 'vendor/chatter', 'warning.title', 'Warnung', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2460, 1, 'de', 'vendor/chatter', 'danger.title', 'Achtung', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2461, 1, 'de', 'vendor/chatter', 'danger.reason.errors', 'Bitte beheben Sie die folgenden Fehler:', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2462, 1, 'de', 'vendor/chatter', 'danger.reason.prevent_spam', 'Um Spam zu verhindern müssen Sie mindestens :minutes Minuten warten bevor Sie weitere Inhalte veröffentlichen können.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2463, 1, 'de', 'vendor/chatter', 'danger.reason.trouble', 'Beim Verarbeiten Ihrer Antwort ist ein fehler aufgetreten.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2464, 1, 'de', 'vendor/chatter', 'danger.reason.update_post', 'Die Antwort wurde nicht verändert. Modifizierst du etwa das Formular?', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2465, 1, 'de', 'vendor/chatter', 'danger.reason.destroy_post', 'Die Antwort wurde nicht gelöscht. Modifizierst du etwa das Formular?', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2466, 1, 'de', 'vendor/chatter', 'danger.reason.create_discussion', 'Bei der Erstellung Ihrer discussion scheint ein fehler aufgetreten zu sein.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2467, 1, 'de', 'vendor/chatter', 'danger.reason.title_required', 'Bitte gib einen Titel an. ', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2468, 1, 'de', 'vendor/chatter', 'danger.reason.title_min', 'Der Titel muss mindestens :min zeichen lang sein.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2469, 1, 'de', 'vendor/chatter', 'danger.reason.title_max', 'Der Titel darf maximal :max zeichen lang sein.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2470, 1, 'de', 'vendor/chatter', 'danger.reason.content_required', 'Bitte gib einen Inhalt an.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2471, 1, 'de', 'vendor/chatter', 'danger.reason.content_min', 'The content has to have at least :min characters', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2472, 1, 'de', 'vendor/chatter', 'danger.reason.category_required', 'Please choose a category', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2473, 1, 'de', 'vendor/chatter', 'preheader', 'Just wanted to let you know that someone has responded to a forum post.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2474, 1, 'de', 'vendor/chatter', 'greeting', 'Hi there,', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2475, 1, 'de', 'vendor/chatter', 'body', 'Just wanted to let you know that someone has responded to a forum post at', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2476, 1, 'de', 'vendor/chatter', 'view_discussion', 'View the discussion.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2477, 1, 'de', 'vendor/chatter', 'farewell', 'Have a great day!', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2478, 1, 'de', 'vendor/chatter', 'unsuscribe.message', 'If you no longer wish to be notified when someone responds to this form post be sure to uncheck the notification setting at the bottom of the page :)', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2479, 1, 'de', 'vendor/chatter', 'unsuscribe.action', 'Don\'t like these emails?', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2480, 1, 'de', 'vendor/chatter', 'unsuscribe.link', 'Unsubscribe to this discussion.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2481, 1, 'de', 'vendor/chatter', 'titles.discussion', 'Diskussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2482, 1, 'de', 'vendor/chatter', 'titles.discussions', 'Diskussionen', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2483, 1, 'de', 'vendor/chatter', 'headline', 'Wilkommen zu Chatter', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2484, 1, 'de', 'vendor/chatter', 'description', 'Ein einfaches Forum-Paket für Ihr Laravel-Projekt.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2485, 1, 'de', 'vendor/chatter', 'words.cancel', 'Cancel', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2486, 1, 'de', 'vendor/chatter', 'words.delete', 'Delete', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2487, 1, 'de', 'vendor/chatter', 'words.edit', 'Edit', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2488, 1, 'de', 'vendor/chatter', 'words.yes', 'Yes', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2489, 1, 'de', 'vendor/chatter', 'words.no', 'No', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2490, 1, 'de', 'vendor/chatter', 'words.minutes', '1 minute| :count minutes', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2491, 1, 'de', 'vendor/chatter', 'discussion.new', 'New Discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2492, 1, 'de', 'vendor/chatter', 'discussion.all', 'All Discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2493, 1, 'de', 'vendor/chatter', 'discussion.create', 'Create Discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2494, 1, 'de', 'vendor/chatter', 'discussion.posted_by', 'Posted by', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2495, 1, 'de', 'vendor/chatter', 'discussion.head_details', 'Posted in Category', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2496, 1, 'de', 'vendor/chatter', 'response.confirm', 'Are you sure you want to delete this response?', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2497, 1, 'de', 'vendor/chatter', 'response.yes_confirm', 'Yes Delete It', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2498, 1, 'de', 'vendor/chatter', 'response.no_confirm', 'No Thanks', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2499, 1, 'de', 'vendor/chatter', 'response.submit', 'Submit response', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2500, 1, 'de', 'vendor/chatter', 'response.update', 'Update Response', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2501, 1, 'de', 'vendor/chatter', 'editor.title', 'Title of Discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2502, 1, 'de', 'vendor/chatter', 'editor.select', 'Select a Category', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2503, 1, 'de', 'vendor/chatter', 'editor.tinymce_placeholder', 'Type Your Discussion Here...', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2504, 1, 'de', 'vendor/chatter', 'editor.select_color_text', 'Select a Color for this Discussion (optional)', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2505, 1, 'de', 'vendor/chatter', 'email.notify', 'Notify me when someone replies', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2506, 1, 'de', 'vendor/chatter', 'auth', 'Please <a href=\"/:home/login\">login</a>\r\n                or <a href=\"/:home/register\">register</a>\r\n                to leave a response.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2507, 1, 'en', 'vendor/chatter', 'success.title', 'Well done!', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2508, 1, 'en', 'vendor/chatter', 'success.reason.submitted_to_post', 'Response successfully submitted to discussion.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2509, 1, 'en', 'vendor/chatter', 'success.reason.updated_post', 'Successfully updated the discussion.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2510, 1, 'en', 'vendor/chatter', 'success.reason.destroy_post', 'Successfully deleted the response and discussion.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2511, 1, 'en', 'vendor/chatter', 'success.reason.destroy_from_discussion', 'Successfully deleted the response from the discussion.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2512, 1, 'en', 'vendor/chatter', 'success.reason.created_discussion', 'Successfully created a new discussion.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2513, 1, 'en', 'vendor/chatter', 'info.title', 'Heads Up!', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2514, 1, 'en', 'vendor/chatter', 'warning.title', 'Wuh Oh!', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2515, 1, 'en', 'vendor/chatter', 'danger.title', 'Oh Snap!', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2516, 1, 'en', 'vendor/chatter', 'danger.reason.errors', 'Please fix the following errors:', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2517, 1, 'en', 'vendor/chatter', 'danger.reason.prevent_spam', 'In order to prevent spam, please allow at least :minutes in between submitting content.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2518, 1, 'en', 'vendor/chatter', 'danger.reason.trouble', 'Sorry, there seems to have been a problem submitting your response.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2519, 1, 'en', 'vendor/chatter', 'danger.reason.update_post', 'Nah ah ah... Could not update your response. Make sure you\'re not doing anything shady.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2520, 1, 'en', 'vendor/chatter', 'danger.reason.destroy_post', 'Nah ah ah... Could not delete the response. Make sure you\'re not doing anything shady.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2521, 1, 'en', 'vendor/chatter', 'danger.reason.create_discussion', 'Whoops :( There seems to be a problem creating your discussion.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2522, 1, 'en', 'vendor/chatter', 'danger.reason.title_required', 'Please write a title', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2523, 1, 'en', 'vendor/chatter', 'danger.reason.title_min', 'The title has to have at least :min characters.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2524, 1, 'en', 'vendor/chatter', 'danger.reason.title_max', 'The title has to have no more than :max characters.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2525, 1, 'en', 'vendor/chatter', 'danger.reason.content_required', 'Please write some content', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2526, 1, 'en', 'vendor/chatter', 'danger.reason.content_min', 'The content has to have at least :min characters', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2527, 1, 'en', 'vendor/chatter', 'danger.reason.category_required', 'Please choose a category', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2528, 1, 'en', 'vendor/chatter', 'preheader', 'Just wanted to let you know that someone has responded to a forum post.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2529, 1, 'en', 'vendor/chatter', 'greeting', 'Hi there,', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2530, 1, 'en', 'vendor/chatter', 'body', 'Just wanted to let you know that someone has responded to a forum post at', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2531, 1, 'en', 'vendor/chatter', 'view_discussion', 'View the discussion.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2532, 1, 'en', 'vendor/chatter', 'farewell', 'Have a great day!', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2533, 1, 'en', 'vendor/chatter', 'unsuscribe.message', 'If you no longer wish to be notified when someone responds to this form post be sure to uncheck the notification setting at the bottom of the page :)', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2534, 1, 'en', 'vendor/chatter', 'unsuscribe.action', 'Don\'t like these emails?', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2535, 1, 'en', 'vendor/chatter', 'unsuscribe.link', 'Unsubscribe to this discussion.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2536, 1, 'en', 'vendor/chatter', 'titles.discussion', 'Discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2537, 1, 'en', 'vendor/chatter', 'titles.discussions', 'Discussions', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2538, 1, 'en', 'vendor/chatter', 'headline', 'Welcome to Chatter', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2539, 1, 'en', 'vendor/chatter', 'description', 'A simple forum package for your Laravel app.', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2540, 1, 'en', 'vendor/chatter', 'words.cancel', 'Cancel', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2541, 1, 'en', 'vendor/chatter', 'words.delete', 'Delete', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2542, 1, 'en', 'vendor/chatter', 'words.edit', 'Edit', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2543, 1, 'en', 'vendor/chatter', 'words.yes', 'Yes', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2544, 1, 'en', 'vendor/chatter', 'words.no', 'No', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2545, 1, 'en', 'vendor/chatter', 'words.minutes', '1 minute| :count minutes', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2546, 1, 'en', 'vendor/chatter', 'discussion.new', 'New Discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2547, 1, 'en', 'vendor/chatter', 'discussion.all', 'All Discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2548, 1, 'en', 'vendor/chatter', 'discussion.create', 'Create Discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2549, 1, 'en', 'vendor/chatter', 'discussion.posted_by', 'Posted by', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2550, 1, 'en', 'vendor/chatter', 'discussion.head_details', 'Posted in Category', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2551, 1, 'en', 'vendor/chatter', 'response.confirm', 'Are you sure you want to delete this response?', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2552, 1, 'en', 'vendor/chatter', 'response.yes_confirm', 'Yes Delete It', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2553, 1, 'en', 'vendor/chatter', 'response.no_confirm', 'No Thanks', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2554, 1, 'en', 'vendor/chatter', 'response.submit', 'Submit response', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2555, 1, 'en', 'vendor/chatter', 'response.update', 'Update Response', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2556, 1, 'en', 'vendor/chatter', 'editor.title', 'Title of Discussion', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2557, 1, 'en', 'vendor/chatter', 'editor.select', 'Select a Category', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2558, 1, 'en', 'vendor/chatter', 'editor.tinymce_placeholder', 'Type Your Discussion Here...', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2559, 1, 'en', 'vendor/chatter', 'editor.select_color_text', 'Select a Color for this Discussion (optional)', '2022-03-30 15:37:18', '2022-03-30 15:37:18'),
(2560, 1, 'en', 'vendor/chatter', 'email.notify', 'Notify me when someone replies', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2561, 1, 'en', 'vendor/chatter', 'auth', 'Please <a href=\"/:home/login\">login</a>\r\n                or <a href=\"/:home/register\">register</a>\r\n                to leave a response.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2562, 1, 'es', 'vendor/chatter', 'success.title', '¡Bien hecho!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2563, 1, 'es', 'vendor/chatter', 'success.reason.submitted_to_post', 'Respuesta enviada correctamente a la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2564, 1, 'es', 'vendor/chatter', 'success.reason.updated_post', 'Discussion actualizada correctamente.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2565, 1, 'es', 'vendor/chatter', 'success.reason.destroy_post', 'Se ha borrado correctamente la respuesta y la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2566, 1, 'es', 'vendor/chatter', 'success.reason.destroy_from_discussion', 'Se ha borrado correctamente la respuesta de la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2567, 1, 'es', 'vendor/chatter', 'success.reason.created_discussion', 'Se ha creado correctamente una nueva discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2568, 1, 'es', 'vendor/chatter', 'info.title', '¡Aviso!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2569, 1, 'es', 'vendor/chatter', 'warning.title', '¡Precaución!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2570, 1, 'es', 'vendor/chatter', 'danger.title', '¡Ha ocurrido un error!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2571, 1, 'es', 'vendor/chatter', 'danger.reason.errors', 'Por favor corrige los siguientes errores:', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2572, 1, 'es', 'vendor/chatter', 'danger.reason.prevent_spam', 'Con el fin de prevenir el SPAM, podrás volver a enviar el contenido nuevamente en :minutes', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2573, 1, 'es', 'vendor/chatter', 'danger.reason.trouble', 'Parece que ha ocurrido un problema al intentar enviar la respuesta, vuelve a intentarlo más tarde.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2574, 1, 'es', 'vendor/chatter', 'danger.reason.update_post', '¡Oh! No se ha podido actualizar la respuesta.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2575, 1, 'es', 'vendor/chatter', 'danger.reason.destroy_post', '¡Oh! No se ha podido borrar la respuesta.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2576, 1, 'es', 'vendor/chatter', 'danger.reason.create_discussion', '¡Ups! Parece que hay un problema al crear la discussion. :(', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2577, 1, 'es', 'vendor/chatter', 'danger.reason.title_required', 'Por favor escribe un título', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2578, 1, 'es', 'vendor/chatter', 'danger.reason.title_min', 'El título debe tener al menos :min caracteres.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2579, 1, 'es', 'vendor/chatter', 'danger.reason.title_max', 'El título no debe superar los :max caracteres.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2580, 1, 'es', 'vendor/chatter', 'danger.reason.content_required', 'Es necesario escribir algo en el contenido', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2581, 1, 'es', 'vendor/chatter', 'danger.reason.content_min', 'El contenido debe tener al menos :min caracteres', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2582, 1, 'es', 'vendor/chatter', 'danger.reason.category_required', 'Por favor selecciona una categoría', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2583, 1, 'es', 'vendor/chatter', 'preheader', 'Este texto es como un encabezado. Algunos clientes muestran este texto como una vista previa.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2584, 1, 'es', 'vendor/chatter', 'greeting', 'Hola,', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2585, 1, 'es', 'vendor/chatter', 'body', 'Te informamos que alguien ha respondido a una discussion publicada en', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2586, 1, 'es', 'vendor/chatter', 'view_discussion', 'Ver la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2587, 1, 'es', 'vendor/chatter', 'farewell', 'Que tengas un buen día.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2588, 1, 'es', 'vendor/chatter', 'unsuscribe.message', 'Si ya no deseas ser notificado cuando alguien más responda, asegurate de desmarcar la configuración de notificación al final de la página :)', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2589, 1, 'es', 'vendor/chatter', 'unsuscribe.action', '¿No le gustan estos correos electrónicos?', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2590, 1, 'es', 'vendor/chatter', 'unsuscribe.link', 'Anular la suscripción a la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2591, 1, 'es', 'vendor/chatter', 'titles.discussion', 'Discusión', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2592, 1, 'es', 'vendor/chatter', 'titles.discussions', 'Discusiones', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2593, 1, 'es', 'vendor/chatter', 'headline', 'Bienvenidos a Chatter', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2594, 1, 'es', 'vendor/chatter', 'description', 'Un foro con un simple librería para Laravel', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2595, 1, 'es', 'vendor/chatter', 'words.cancel', 'Cancelar', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2596, 1, 'es', 'vendor/chatter', 'words.delete', 'Borrar', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2597, 1, 'es', 'vendor/chatter', 'words.edit', 'Editar', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2598, 1, 'es', 'vendor/chatter', 'words.yes', 'Si', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2599, 1, 'es', 'vendor/chatter', 'words.no', 'No', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2600, 1, 'es', 'vendor/chatter', 'words.minutes', '1 minuto| :count minutos', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2601, 1, 'es', 'vendor/chatter', 'discussion.new', 'Nueva discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2602, 1, 'es', 'vendor/chatter', 'discussion.all', 'Todas las discussions', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2603, 1, 'es', 'vendor/chatter', 'discussion.create', 'Crear una discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2604, 1, 'es', 'vendor/chatter', 'discussion.posted_by', 'Publicado por', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2605, 1, 'es', 'vendor/chatter', 'discussion.head_details', 'Publicado en categoria', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2606, 1, 'es', 'vendor/chatter', 'response.confirm', '¿Estás seguro de que quieres borrar la respuesta?', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2607, 1, 'es', 'vendor/chatter', 'response.yes_confirm', 'Si, borrar', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2608, 1, 'es', 'vendor/chatter', 'response.no_confirm', 'No gracias', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2609, 1, 'es', 'vendor/chatter', 'response.submit', 'Enviar respuesta', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2610, 1, 'es', 'vendor/chatter', 'response.update', 'Actualizar respuesta', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2611, 1, 'es', 'vendor/chatter', 'editor.title', 'Titulo de la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2612, 1, 'es', 'vendor/chatter', 'editor.select', 'Selecciona una categoria', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2613, 1, 'es', 'vendor/chatter', 'editor.tinymce_placeholder', 'Agrega el contenido para la discussion aquí...', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2614, 1, 'es', 'vendor/chatter', 'editor.select_color_text', 'Selecciona un color para la discussion (opcional)', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2615, 1, 'es', 'vendor/chatter', 'email.notify', 'Notificarme cuando alguien conteste en la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2616, 1, 'es', 'vendor/chatter', 'auth', 'Por favor <a href=\"/:home/login\">Inicia sesión</a>\r\n                o <a href=\"/:home/register\">Regístrate</a>\r\n                para dejar una respuesta.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2617, 1, 'fr', 'vendor/chatter', 'success.title', '¡Bien hecho!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2618, 1, 'fr', 'vendor/chatter', 'success.reason.submitted_to_post', 'Respuesta enviada correctamente a la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19');
INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2619, 1, 'fr', 'vendor/chatter', 'success.reason.updated_post', 'Discussion actualizada correctamente.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2620, 1, 'fr', 'vendor/chatter', 'success.reason.destroy_post', 'Se ha borrado correctamente la respuesta y la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2621, 1, 'fr', 'vendor/chatter', 'success.reason.destroy_from_discussion', 'Se ha borrado correctamente la respuesta de la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2622, 1, 'fr', 'vendor/chatter', 'success.reason.created_discussion', 'Se ha creado correctamente una nueva discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2623, 1, 'fr', 'vendor/chatter', 'info.title', '¡Aviso!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2624, 1, 'fr', 'vendor/chatter', 'warning.title', '¡Precaución!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2625, 1, 'fr', 'vendor/chatter', 'danger.title', '¡Ha ocurrido un error!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2626, 1, 'fr', 'vendor/chatter', 'danger.reason.errors', 'Por favor corrige los siguientes errores:', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2627, 1, 'fr', 'vendor/chatter', 'danger.reason.prevent_spam', 'Con el fin de prevenir el SPAM, podrás volver a enviar el contenido nuevamente en :minutes', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2628, 1, 'fr', 'vendor/chatter', 'danger.reason.trouble', 'Parece que ha ocurrido un problema al intentar enviar la respuesta, vuelve a intentarlo más tarde.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2629, 1, 'fr', 'vendor/chatter', 'danger.reason.update_post', '¡Oh! No se ha podido actualizar la respuesta.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2630, 1, 'fr', 'vendor/chatter', 'danger.reason.destroy_post', '¡Oh! No se ha podido borrar la respuesta.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2631, 1, 'fr', 'vendor/chatter', 'danger.reason.create_discussion', '¡Ups! Parece que hay un problema al crear la discussion. :(', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2632, 1, 'fr', 'vendor/chatter', 'danger.reason.title_required', 'Por favor escribe un título', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2633, 1, 'fr', 'vendor/chatter', 'danger.reason.title_min', 'El título debe tener al menos :min caracteres.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2634, 1, 'fr', 'vendor/chatter', 'danger.reason.title_max', 'El título no debe superar los :max caracteres.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2635, 1, 'fr', 'vendor/chatter', 'danger.reason.content_required', 'Es necesario escribir algo en el contenido', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2636, 1, 'fr', 'vendor/chatter', 'danger.reason.content_min', 'El contenido debe tener al menos :min caracteres', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2637, 1, 'fr', 'vendor/chatter', 'danger.reason.category_required', 'Por favor selecciona una categoría', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2638, 1, 'fr', 'vendor/chatter', 'preheader', 'Este texto es como un encabezado. Algunos clientes muestran este texto como una vista previa.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2639, 1, 'fr', 'vendor/chatter', 'greeting', 'Hola,', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2640, 1, 'fr', 'vendor/chatter', 'body', 'Te informamos que alguien ha respondido a una discussion publicada en', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2641, 1, 'fr', 'vendor/chatter', 'view_discussion', 'Ver la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2642, 1, 'fr', 'vendor/chatter', 'farewell', 'Que tengas un buen día.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2643, 1, 'fr', 'vendor/chatter', 'unsuscribe.message', 'Si ya no deseas ser notificado cuando alguien más responda, asegurate de desmarcar la configuración de notificación al final de la página :)', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2644, 1, 'fr', 'vendor/chatter', 'unsuscribe.action', '¿No le gustan estos correos electrónicos?', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2645, 1, 'fr', 'vendor/chatter', 'unsuscribe.link', 'Anular la suscripción a la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2646, 1, 'fr', 'vendor/chatter', 'titles.discussion', 'Discusión', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2647, 1, 'fr', 'vendor/chatter', 'titles.discussions', 'Discusiones', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2648, 1, 'fr', 'vendor/chatter', 'headline', 'Bienvenidos a Chatter', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2649, 1, 'fr', 'vendor/chatter', 'description', 'Un foro con un simple librería para Laravel', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2650, 1, 'fr', 'vendor/chatter', 'words.cancel', 'Cancelar', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2651, 1, 'fr', 'vendor/chatter', 'words.delete', 'Borrar', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2652, 1, 'fr', 'vendor/chatter', 'words.edit', 'Editar', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2653, 1, 'fr', 'vendor/chatter', 'words.yes', 'Si', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2654, 1, 'fr', 'vendor/chatter', 'words.no', 'No', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2655, 1, 'fr', 'vendor/chatter', 'words.minutes', '1 minuto| :count minutos', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2656, 1, 'fr', 'vendor/chatter', 'discussion.new', 'Nueva discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2657, 1, 'fr', 'vendor/chatter', 'discussion.all', 'Todas las discussions', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2658, 1, 'fr', 'vendor/chatter', 'discussion.create', 'Crear una discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2659, 1, 'fr', 'vendor/chatter', 'discussion.posted_by', 'Publicado por', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2660, 1, 'fr', 'vendor/chatter', 'discussion.head_details', 'Publicado en categoria', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2661, 1, 'fr', 'vendor/chatter', 'response.confirm', '¿Estás seguro de que quieres borrar la respuesta?', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2662, 1, 'fr', 'vendor/chatter', 'response.yes_confirm', 'Si, borrar', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2663, 1, 'fr', 'vendor/chatter', 'response.no_confirm', 'No gracias', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2664, 1, 'fr', 'vendor/chatter', 'response.submit', 'Enviar respuesta', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2665, 1, 'fr', 'vendor/chatter', 'response.update', 'Actualizar respuesta', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2666, 1, 'fr', 'vendor/chatter', 'editor.title', 'Titulo de la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2667, 1, 'fr', 'vendor/chatter', 'editor.select', 'Selecciona una categoria', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2668, 1, 'fr', 'vendor/chatter', 'editor.tinymce_placeholder', 'Agrega el contenido para la discussion aquí...', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2669, 1, 'fr', 'vendor/chatter', 'editor.select_color_text', 'Selecciona un color para la discussion (opcional)', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2670, 1, 'fr', 'vendor/chatter', 'email.notify', 'Notificarme cuando alguien conteste en la discussion', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2671, 1, 'fr', 'vendor/chatter', 'auth', 'Por favor <a href=\"/:home/login\">Inicia sesión</a>\r\n                o <a href=\"/:home/register\">Regístrate</a>\r\n                para dejar una respuesta.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2672, 1, 'nl', 'vendor/chatter', 'success.title', 'Goed zo!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2673, 1, 'nl', 'vendor/chatter', 'success.reason.submitted_to_post', 'Reactie succesvol geplaatst in de discussie.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2674, 1, 'nl', 'vendor/chatter', 'success.reason.updated_post', 'De reactie is succesvol aangepast.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2675, 1, 'nl', 'vendor/chatter', 'success.reason.destroy_post', 'De discussie en reacties zijn succesvol verwijderd.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2676, 1, 'nl', 'vendor/chatter', 'success.reason.destroy_from_discussion', 'De reactie is succesvol verwijderd van de discussie.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2677, 1, 'nl', 'vendor/chatter', 'success.reason.created_discussion', 'De discussie is succesvol aangemaakt.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2678, 1, 'nl', 'vendor/chatter', 'info.title', 'Let op!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2679, 1, 'nl', 'vendor/chatter', 'warning.title', 'Oeps!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2680, 1, 'nl', 'vendor/chatter', 'danger.title', 'Oh nee!', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2681, 1, 'nl', 'vendor/chatter', 'danger.reason.errors', 'Los de volgende problemen alsjeblieft op:', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2682, 1, 'nl', 'vendor/chatter', 'danger.reason.prevent_spam', 'Om spam te voorkomen, wacht alsjeblieft :minutes tussen het plaatsen van nieuwe reacties.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2683, 1, 'nl', 'vendor/chatter', 'danger.reason.trouble', 'Helaas, er is een probleem opgetreden tijdens het plaatsen van je reactie.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2684, 1, 'nl', 'vendor/chatter', 'danger.reason.update_post', 'Helaas, je kan deze reactie niet wijzigen.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2685, 1, 'nl', 'vendor/chatter', 'danger.reason.destroy_post', 'Helaas, je kan deze reactie niet verwijderen.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2686, 1, 'nl', 'vendor/chatter', 'danger.reason.create_discussion', 'Helaas, er is een probleem opgetreden tijdens het plaatsen van je discussie :(', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2687, 1, 'nl', 'vendor/chatter', 'danger.reason.title_required', 'Voeg alsjeblieft een titel toe', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2688, 1, 'nl', 'vendor/chatter', 'danger.reason.title_min', 'De titel heeft ten minste :min karkaters nodig.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2689, 1, 'nl', 'vendor/chatter', 'danger.reason.title_max', 'De titel mag maar uit :max karakters bestaan.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2690, 1, 'nl', 'vendor/chatter', 'danger.reason.content_required', 'Voeg alsjeblieft een bericht toe', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2691, 1, 'nl', 'vendor/chatter', 'danger.reason.content_min', 'Je bericht heeft ten minste :mix karakters nodig', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2692, 1, 'nl', 'vendor/chatter', 'danger.reason.category_required', 'Kies alsjeblieft een categorie', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2693, 1, 'nl', 'vendor/chatter', 'preheader', 'We laten je even weten dat iemand gereageerd heeft op een forum discussie.', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2694, 1, 'nl', 'vendor/chatter', 'greeting', 'Hallo,', '2022-03-30 15:37:19', '2022-03-30 15:37:19'),
(2695, 1, 'nl', 'vendor/chatter', 'body', 'We laten je even weten dat iemand gereageerd heeft op een forum discussie op', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2696, 1, 'nl', 'vendor/chatter', 'view_discussion', 'Bekijk de discussie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2697, 1, 'nl', 'vendor/chatter', 'farewell', 'Nog een fijne dag gewenst!', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2698, 1, 'nl', 'vendor/chatter', 'unsuscribe.message', 'Als je geen notificaties meer wilt ontvangen voor deze discussie, wijzig dan je aanmelding onderaan deze pagina :)', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2699, 1, 'nl', 'vendor/chatter', 'unsuscribe.action', 'Genoeg van deze e-mails?', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2700, 1, 'nl', 'vendor/chatter', 'unsuscribe.link', 'Afmelden voor deze discussie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2701, 1, 'nl', 'vendor/chatter', 'titles.discussion', 'Discussie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2702, 1, 'nl', 'vendor/chatter', 'titles.discussions', 'Discussies', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2703, 1, 'nl', 'vendor/chatter', 'headline', 'Welkom bij Chatter', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2704, 1, 'nl', 'vendor/chatter', 'description', 'Een simpel forum package voor je Laravel app.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2705, 1, 'nl', 'vendor/chatter', 'words.cancel', 'Annuleer', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2706, 1, 'nl', 'vendor/chatter', 'words.delete', 'Verwijder', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2707, 1, 'nl', 'vendor/chatter', 'words.edit', 'Wijzig', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2708, 1, 'nl', 'vendor/chatter', 'words.yes', 'Ja', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2709, 1, 'nl', 'vendor/chatter', 'words.no', 'Nee', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2710, 1, 'nl', 'vendor/chatter', 'words.minutes', '1 minuut| :count minuten', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2711, 1, 'nl', 'vendor/chatter', 'discussion.new', 'Nieuwe discussie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2712, 1, 'nl', 'vendor/chatter', 'discussion.all', 'Toon alle discussies', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2713, 1, 'nl', 'vendor/chatter', 'discussion.create', 'Creëer een discussie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2714, 1, 'nl', 'vendor/chatter', 'discussion.posted_by', 'Geplaatst door', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2715, 1, 'nl', 'vendor/chatter', 'discussion.head_details', 'Geplaatst in', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2716, 1, 'nl', 'vendor/chatter', 'response.confirm', 'Weet je zeker dat je deze reactie wilt verwijderen?', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2717, 1, 'nl', 'vendor/chatter', 'response.yes_confirm', 'Ja, verwijder het', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2718, 1, 'nl', 'vendor/chatter', 'response.no_confirm', 'Nee, bedankt', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2719, 1, 'nl', 'vendor/chatter', 'response.submit', 'Plaats reactie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2720, 1, 'nl', 'vendor/chatter', 'response.update', 'Wijzig reactie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2721, 1, 'nl', 'vendor/chatter', 'editor.title', 'Titel van je discussie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2722, 1, 'nl', 'vendor/chatter', 'editor.select', 'Kies een categorie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2723, 1, 'nl', 'vendor/chatter', 'editor.tinymce_placeholder', 'Typ je bericht hier', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2724, 1, 'nl', 'vendor/chatter', 'editor.select_color_text', 'Kies een kleur voor deze discussie (optioneel)', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2725, 1, 'nl', 'vendor/chatter', 'email.notify', 'Stuur mij notificaties van antwoorden', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2726, 1, 'nl', 'vendor/chatter', 'auth', 'Je moet <a href=\"/:home/login\">inloggen</a>\r\n                of <a href=\"/:home/register\">registreren</a>\r\n                om een reactie te plaatsen.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2727, 1, 'ro', 'vendor/chatter', 'success.title', 'Well done!', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2728, 1, 'ro', 'vendor/chatter', 'success.reason.submitted_to_post', 'Răspunsul a fost trimis cu succes la discussion.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2729, 1, 'ro', 'vendor/chatter', 'success.reason.updated_post', 'Actualizarea lui discussion a fost făcută cu success.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2730, 1, 'ro', 'vendor/chatter', 'success.reason.destroy_post', 'S-a șters cu succes răspunsul și discussion.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2731, 1, 'ro', 'vendor/chatter', 'success.reason.destroy_from_discussion', 'A fost șters cu succes răspunsul de la discussion.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2732, 1, 'ro', 'vendor/chatter', 'success.reason.created_discussion', 'A fost creat cu succes un nou discussion.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2733, 1, 'ro', 'vendor/chatter', 'info.title', 'Atenție!', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2734, 1, 'ro', 'vendor/chatter', 'warning.title', 'Wuh Oh!', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2735, 1, 'ro', 'vendor/chatter', 'danger.title', 'Firar!', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2736, 1, 'ro', 'vendor/chatter', 'danger.reason.errors', 'Te rog corectează următoarele erori:', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2737, 1, 'ro', 'vendor/chatter', 'danger.reason.prevent_spam', 'Pentru a prevenii spam-ul, te rog permite :minutes între trimiterea de răspunsuri.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2738, 1, 'ro', 'vendor/chatter', 'danger.reason.trouble', 'Scuze, se pare că a apărut o problemă în trimiterea răspunsului tău.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2739, 1, 'ro', 'vendor/chatter', 'danger.reason.update_post', 'Nah ah ah... Nu am putut actualia răspunsul. Asigurați-vă că nu faceți nimic dubios.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2740, 1, 'ro', 'vendor/chatter', 'danger.reason.destroy_post', 'Nah ah ah... Nu am putut șterge răspunsul. Asigurați-vă că nu faceți nimic dubios.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2741, 1, 'ro', 'vendor/chatter', 'danger.reason.create_discussion', 'Hopa :( Se pare că este o problema în crearea discussion.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2742, 1, 'ro', 'vendor/chatter', 'danger.reason.title_required', 'Vă rugăm să scrieți un titlu', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2743, 1, 'ro', 'vendor/chatter', 'danger.reason.title_min', 'Titlul trebuie să aibă cel puțin :min caractere.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2744, 1, 'ro', 'vendor/chatter', 'danger.reason.title_max', 'Titlul trebuie să aibă cel mult :max caractere.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2745, 1, 'ro', 'vendor/chatter', 'danger.reason.content_required', 'Vă rugăm să scrieți ceva conținut', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2746, 1, 'ro', 'vendor/chatter', 'danger.reason.content_min', 'Conținutul trebuie să aibă cel puțin :min caractere', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2747, 1, 'ro', 'vendor/chatter', 'danger.reason.category_required', 'Vă rugăm alegeți o categorie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2748, 1, 'ro', 'vendor/chatter', 'preheader', 'Vreau doar să știi că cineva a răspuns unui postări de pe forum.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2749, 1, 'ro', 'vendor/chatter', 'greeting', 'Salutare,', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2750, 1, 'ro', 'vendor/chatter', 'body', 'Vreau doar să știi că cineva a răspuns unei postări de pe forum la', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2751, 1, 'ro', 'vendor/chatter', 'view_discussion', 'Vizualizați discussion.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2752, 1, 'ro', 'vendor/chatter', 'farewell', 'Să aveți o zi bună!', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2753, 1, 'ro', 'vendor/chatter', 'unsuscribe.message', 'Dacă nu mai doriți să fiți anunțat când cineva răspunde la această postare, asigurați-vă că debifați setarea pentru notificări din partea de jos a paginii :)', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2754, 1, 'ro', 'vendor/chatter', 'unsuscribe.action', 'Nu-ți plac aceste e-mailuri?', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2755, 1, 'ro', 'vendor/chatter', 'unsuscribe.link', 'Dezabonează-te de la discussion.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2756, 1, 'ro', 'vendor/chatter', 'titles.discussion', 'Discuție', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2757, 1, 'ro', 'vendor/chatter', 'titles.discussions', 'Discuții', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2758, 1, 'ro', 'vendor/chatter', 'headline', 'Bun venit la Chatter', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2759, 1, 'ro', 'vendor/chatter', 'description', 'Un packet simplu de forum pentru aplicația ta Laravel.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2760, 1, 'ro', 'vendor/chatter', 'words.cancel', 'Anulează', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2761, 1, 'ro', 'vendor/chatter', 'words.delete', 'Șterge', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2762, 1, 'ro', 'vendor/chatter', 'words.edit', 'Modifică', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2763, 1, 'ro', 'vendor/chatter', 'words.yes', 'Da', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2764, 1, 'ro', 'vendor/chatter', 'words.no', 'Nu', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2765, 1, 'ro', 'vendor/chatter', 'words.minutes', 'un minut| :count minute', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2766, 1, 'ro', 'vendor/chatter', 'discussion.new', 'Nou Discussion', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2767, 1, 'ro', 'vendor/chatter', 'discussion.all', 'Toate Discussion', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2768, 1, 'ro', 'vendor/chatter', 'discussion.create', 'Creează Discussion', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2769, 1, 'ro', 'vendor/chatter', 'discussion.posted_by', 'Publicat de', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2770, 1, 'ro', 'vendor/chatter', 'discussion.head_details', 'Publicat în categorie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2771, 1, 'ro', 'vendor/chatter', 'response.confirm', 'Ești sigur că vrei să ștergi acest răspuns?', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2772, 1, 'ro', 'vendor/chatter', 'response.yes_confirm', 'Da, șterge-l', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2773, 1, 'ro', 'vendor/chatter', 'response.no_confirm', 'Nu mulțumesc', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2774, 1, 'ro', 'vendor/chatter', 'response.submit', 'Trimite răspuns', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2775, 1, 'ro', 'vendor/chatter', 'response.update', 'Actualizează răspuns', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2776, 1, 'ro', 'vendor/chatter', 'editor.title', 'Titlul lui Discussion', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2777, 1, 'ro', 'vendor/chatter', 'editor.select', 'Selectează o categorie', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2778, 1, 'ro', 'vendor/chatter', 'editor.tinymce_placeholder', 'Scrie Discussion aici...', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2779, 1, 'ro', 'vendor/chatter', 'editor.select_color_text', 'Alege o culoare pentru Discussion (opțional)', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2780, 1, 'ro', 'vendor/chatter', 'email.notify', 'Anunță-mă când cineva răspunde', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2781, 1, 'ro', 'vendor/chatter', 'auth', 'Te rog <a href=\"/:home/login\">autentifică-te</a>\r\n                sau <a href=\"/:home/register\">înregistrează-te</a>\r\n                pentru a lăsa un răspuns.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2782, 1, 'ar', 'vendor/cookieConsent', 'message', 'سيتم تحسين تجربتك في هذا الموقع من خلال السماح بملفات تعريف الارتباط.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2783, 1, 'ar', 'vendor/cookieConsent', 'agree', 'السماح للكوكيز', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2784, 1, 'en', 'vendor/cookieConsent', 'message', 'Your experience on this site will be improved by allowing cookies.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2785, 1, 'en', 'vendor/cookieConsent', 'agree', 'Allow cookies', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2786, 1, 'es', 'vendor/cookieConsent', 'message', 'Su experiencia en este sitio será mejorada con el uso de cookies.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2787, 1, 'es', 'vendor/cookieConsent', 'agree', 'Aceptar', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2788, 1, 'fr', 'vendor/cookieConsent', 'message', 'Ce site nécessite l\'autorisation de cookies pour fonctionner correctement.', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2789, 1, 'fr', 'vendor/cookieConsent', 'agree', 'Accepter', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2790, 0, 'ar', 'vendor/log-viewer', 'all', 'الكل', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2791, 1, 'ar', 'vendor/log-viewer', 'date', 'تاريخ', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2792, 1, 'ar', 'vendor/log-viewer', 'emergency', 'حالة طوارئ', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2793, 1, 'ar', 'vendor/log-viewer', 'alert', 'محزر', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2794, 1, 'ar', 'vendor/log-viewer', 'critical', 'حرج', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2795, 1, 'ar', 'vendor/log-viewer', 'error', 'خطأ', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2796, 1, 'ar', 'vendor/log-viewer', 'warning', 'تحذير', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2797, 1, 'ar', 'vendor/log-viewer', 'notice', 'تنويه', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2798, 1, 'ar', 'vendor/log-viewer', 'info', 'معلومات', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2799, 1, 'ar', 'vendor/log-viewer', 'debug', 'التصحيح', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2800, 0, 'en', 'vendor/log-viewer', 'all', 'All', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2801, 1, 'en', 'vendor/log-viewer', 'date', 'Date', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2802, 1, 'en', 'vendor/log-viewer', 'emergency', 'Emergency', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2803, 1, 'en', 'vendor/log-viewer', 'alert', 'Alert', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2804, 1, 'en', 'vendor/log-viewer', 'critical', 'Critical', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2805, 1, 'en', 'vendor/log-viewer', 'error', 'Error', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2806, 1, 'en', 'vendor/log-viewer', 'warning', 'Warning', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2807, 1, 'en', 'vendor/log-viewer', 'notice', 'Notice', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2808, 1, 'en', 'vendor/log-viewer', 'info', 'Info', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2809, 1, 'en', 'vendor/log-viewer', 'debug', 'Debug', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2810, 0, 'es', 'vendor/log-viewer', 'all', 'Todos', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2811, 1, 'es', 'vendor/log-viewer', 'date', 'Fecha', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2812, 1, 'es', 'vendor/log-viewer', 'emergency', 'Emergencia', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2813, 1, 'es', 'vendor/log-viewer', 'alert', 'Alerta', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2814, 1, 'es', 'vendor/log-viewer', 'critical', 'Criticos', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2815, 1, 'es', 'vendor/log-viewer', 'error', 'Errores', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2816, 1, 'es', 'vendor/log-viewer', 'warning', 'Advertencia', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2817, 1, 'es', 'vendor/log-viewer', 'notice', 'Aviso', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2818, 1, 'es', 'vendor/log-viewer', 'info', 'Info', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2819, 1, 'es', 'vendor/log-viewer', 'debug', 'Debug', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2820, 1, 'fr', 'vendor/log-viewer', 'all', 'Tous', '2022-03-30 15:37:20', '2022-03-30 15:37:20'),
(2821, 1, 'fr', 'vendor/log-viewer', 'date', 'Date', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2822, 1, 'fr', 'vendor/log-viewer', 'emergency', 'Urgence', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2823, 1, 'fr', 'vendor/log-viewer', 'alert', 'Alerte', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2824, 1, 'fr', 'vendor/log-viewer', 'critical', 'Critique', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2825, 1, 'fr', 'vendor/log-viewer', 'error', 'Erreur', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2826, 1, 'fr', 'vendor/log-viewer', 'warning', 'Avertissement', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2827, 1, 'fr', 'vendor/log-viewer', 'notice', 'Notice', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2828, 1, 'fr', 'vendor/log-viewer', 'info', 'Info', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2829, 1, 'fr', 'vendor/log-viewer', 'debug', 'Debug', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2830, 1, 'ar', 'vendor/read-time', 'reads_left_to_right', '1', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2831, 1, 'ar', 'vendor/read-time', 'min', 'دقيقة', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2832, 1, 'ar', 'vendor/read-time', 'minute', 'اللحظة', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2833, 1, 'ar', 'vendor/read-time', 'sec', 'ثانية', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2834, 1, 'ar', 'vendor/read-time', 'second', 'ثانيا', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2835, 1, 'ar', 'vendor/read-time', 'read', 'اقرأ', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2836, 1, 'en', 'vendor/read-time', 'reads_left_to_right', '1', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2837, 1, 'en', 'vendor/read-time', 'min', 'min', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2838, 1, 'en', 'vendor/read-time', 'minute', 'minute', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2839, 1, 'en', 'vendor/read-time', 'sec', 'sec', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2840, 1, 'en', 'vendor/read-time', 'second', 'second', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2841, 1, 'en', 'vendor/read-time', 'read', 'read', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2842, 1, 'es', 'vendor/read-time', 'reads_left_to_right', '1', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2843, 1, 'es', 'vendor/read-time', 'min', 'min', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2844, 1, 'es', 'vendor/read-time', 'minute', 'minuto', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2845, 1, 'es', 'vendor/read-time', 'sec', 'seg', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2846, 1, 'es', 'vendor/read-time', 'second', 'segundo', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2847, 1, 'es', 'vendor/read-time', 'read', 'leer', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2848, 1, 'fr', 'vendor/read-time', 'reads_left_to_right', '1', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2849, 1, 'fr', 'vendor/read-time', 'min', 'min', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2850, 1, 'fr', 'vendor/read-time', 'minute', 'minute', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2851, 1, 'fr', 'vendor/read-time', 'sec', 'sec', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2852, 1, 'fr', 'vendor/read-time', 'second', 'seconde', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2853, 1, 'fr', 'vendor/read-time', 'read', 'lire', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2854, 1, 'en', 'vendor/self-diagnosis', 'app_key_is_set.message', 'The application key is not set. Call \"php artisan key:generate\" to create and set one.', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2855, 1, 'en', 'vendor/self-diagnosis', 'app_key_is_set.name', 'App key is set', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2856, 1, 'en', 'vendor/self-diagnosis', 'composer_with_dev_dependencies_is_up_to_date.message', 'Your composer dependencies are not up to date. Call \"composer install\" to update them. :more', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2857, 1, 'en', 'vendor/self-diagnosis', 'composer_with_dev_dependencies_is_up_to_date.name', 'Composer dependencies (including dev) are up to date', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2858, 1, 'en', 'vendor/self-diagnosis', 'composer_without_dev_dependencies_is_up_to_date.message', 'Your composer dependencies are not up to date. Call \"composer install\" to update them. :more', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2859, 1, 'en', 'vendor/self-diagnosis', 'composer_without_dev_dependencies_is_up_to_date.name', 'Composer dependencies (without dev) are up to date', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2860, 1, 'en', 'vendor/self-diagnosis', 'configuration_is_cached.message', 'Your configuration should be cached in production for better performance. Call \"php artisan config:cache\" to create the configuration cache.', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2861, 1, 'en', 'vendor/self-diagnosis', 'configuration_is_cached.name', 'Configuration is cached', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2862, 1, 'en', 'vendor/self-diagnosis', 'configuration_is_not_cached.message', 'Your configuration files should not be cached during development. Call \"php artisan config:clear\" to clear the configuration cache.', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2863, 1, 'en', 'vendor/self-diagnosis', 'configuration_is_not_cached.name', 'Configuration is not cached', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2864, 1, 'en', 'vendor/self-diagnosis', 'correct_php_version_is_installed.message', 'You do not have the required PHP version installed.\r\nRequired: :required\r\nUsed: :used', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2865, 1, 'en', 'vendor/self-diagnosis', 'correct_php_version_is_installed.name', 'The correct PHP version is installed', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2866, 1, 'en', 'vendor/self-diagnosis', 'database_can_be_accessed.message', 'The database can not be accessed: :error', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2867, 1, 'en', 'vendor/self-diagnosis', 'database_can_be_accessed.name', 'The database can be accessed', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2868, 1, 'en', 'vendor/self-diagnosis', 'debug_mode_is_not_enabled.message', 'You should not use debug mode in production. Set \"APP_DEBUG\" in the .env file to \"false\".', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2869, 1, 'en', 'vendor/self-diagnosis', 'debug_mode_is_not_enabled.name', 'Debug mode is not enabled', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2870, 1, 'en', 'vendor/self-diagnosis', 'directories_have_correct_permissions.message', 'The following directories are not writable:\r\n:directories', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2871, 1, 'en', 'vendor/self-diagnosis', 'directories_have_correct_permissions.name', 'All directories have the correct permissions', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2872, 1, 'en', 'vendor/self-diagnosis', 'env_file_exists.message', 'The .env file does not exist. Please copy your .env.example file as .env and adjust accordingly.', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2873, 1, 'en', 'vendor/self-diagnosis', 'env_file_exists.name', 'The environment file exists', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2874, 1, 'en', 'vendor/self-diagnosis', 'example_environment_variables_are_set.message', 'These environment variables are missing in your .env file, but are defined in your .env.example:\r\n:variables', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2875, 1, 'en', 'vendor/self-diagnosis', 'example_environment_variables_are_set.name', 'The example environment variables are set', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2876, 1, 'en', 'vendor/self-diagnosis', 'migrations_are_up_to_date.message.need_to_migrate', 'You need to update your database. Call \"php artisan migrate\" to run migrations.', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2877, 1, 'en', 'vendor/self-diagnosis', 'migrations_are_up_to_date.message.unable_to_check', 'Unable to check for migrations: :reason', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2878, 1, 'en', 'vendor/self-diagnosis', 'migrations_are_up_to_date.name', 'The migrations are up to date', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2879, 1, 'en', 'vendor/self-diagnosis', 'php_extensions_are_disabled.message', 'The following extensions are still enabled:\r\n:extensions', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2880, 1, 'en', 'vendor/self-diagnosis', 'php_extensions_are_disabled.name', 'Unwanted PHP extensions are disabled', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2881, 1, 'en', 'vendor/self-diagnosis', 'php_extensions_are_installed.message', 'The following extensions are missing:\r\n:extensions', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2882, 1, 'en', 'vendor/self-diagnosis', 'php_extensions_are_installed.name', 'The required PHP extensions are installed', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2883, 1, 'en', 'vendor/self-diagnosis', 'routes_are_cached.message', 'Your routes should be cached in production for better performance. Call \"php artisan route:cache\" to create the route cache.', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2884, 1, 'en', 'vendor/self-diagnosis', 'routes_are_cached.name', 'Routes are cached', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2885, 1, 'en', 'vendor/self-diagnosis', 'routes_are_not_cached.message', 'Your routes should not be cached during development. Call \"php artisan route:clear\" to clear the route cache.', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2886, 1, 'en', 'vendor/self-diagnosis', 'routes_are_not_cached.name', 'Routes are not cached', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2887, 1, 'en', 'vendor/self-diagnosis', 'storage_directory_is_linked.message', 'The storage directory is not linked. Use \"php artisan storage:link\" to create a symbolic link.', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2888, 1, 'en', 'vendor/self-diagnosis', 'storage_directory_is_linked.name', 'The storage directory is linked', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2889, 1, 'en', 'vendor/self-diagnosis', 'self_diagnosis.common_checks', 'Common Checks', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2890, 1, 'en', 'vendor/self-diagnosis', 'self_diagnosis.environment_specific_checks', 'Environment Specific Checks (:environment)', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2891, 1, 'en', 'vendor/self-diagnosis', 'self_diagnosis.failed_checks', 'The following checks failed:', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2892, 1, 'en', 'vendor/self-diagnosis', 'self_diagnosis.running_check', '<fg=yellow>Running check :current/:max:</fg=yellow> :name...  ', '2022-03-30 15:37:21', '2022-03-30 15:37:21'),
(2893, 1, 'en', 'vendor/self-diagnosis', 'self_diagnosis.success', 'Good job, looks like you are all set up!', '2022-03-30 15:37:21', '2022-03-30 15:37:21');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193005_create_translations_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(5, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(6, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(7, '2016_06_01_000004_create_oauth_clients_table', 1),
(8, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(9, '2016_07_29_171118_create_chatter_categories_table', 1),
(10, '2016_07_29_171118_create_chatter_discussion_table', 1),
(11, '2016_07_29_171118_create_chatter_post_table', 1),
(12, '2016_07_29_171128_create_foreign_keys', 1),
(13, '2016_08_02_183143_add_slug_field_for_discussions', 1),
(14, '2016_08_03_121747_add_color_row_to_chatter_discussions', 1),
(15, '2017_01_16_121747_add_markdown_and_lock_to_chatter_posts', 1),
(16, '2017_01_16_121747_create_chatter_user_discussion_pivot_table', 1),
(17, '2017_05_28_062751_create_categories_table', 1),
(18, '2017_07_19_082347_create_1500441827_courses_table', 1),
(19, '2017_07_19_082723_create_1500442043_lessons_table', 1),
(20, '2017_07_19_082929_create_1500442169_questions_table', 1),
(21, '2017_07_19_083047_create_1500442247_questions_options_table', 1),
(22, '2017_07_19_083236_create_1500442356_tests_table', 1),
(23, '2017_07_19_120808_create_596eece522a6e_course_user_table', 1),
(24, '2017_07_19_121657_create_596eeef709839_question_test_table', 1),
(25, '2017_08_07_165345_add_chatter_soft_deletes', 1),
(26, '2017_08_11_073824_create_menus_wp_table', 1),
(27, '2017_08_11_074006_create_menu_items_wp_table', 1),
(28, '2017_08_14_085956_create_course_students_table', 1),
(29, '2017_08_17_051131_create_tests_results_table', 1),
(30, '2017_08_17_051254_create_tests_results_answers_table', 1),
(31, '2017_08_18_060324_add_rating_to_course_student_table', 1),
(32, '2017_09_03_144628_create_permission_tables', 1),
(33, '2017_09_11_174816_create_social_accounts_table', 1),
(34, '2017_09_26_140332_create_cache_table', 1),
(35, '2017_09_26_140528_create_sessions_table', 1),
(36, '2017_09_26_140609_create_jobs_table', 1),
(37, '2017_10_10_221227_add_chatter_last_reply_at_discussion', 1),
(38, '2017_11_08_063801_create_threads_table', 1),
(39, '2017_11_08_063907_create_messages_table', 1),
(40, '2017_11_08_063923_create_participants_table', 1),
(41, '2017_11_08_063956_add_softdeletes_to_participants_table', 1),
(42, '2017_11_08_064015_add_softdeletes_to_threads_table', 1),
(43, '2017_11_08_064031_add_softdeletes_to_messages_table', 1),
(44, '2018_04_08_033256_create_password_histories_table', 1),
(45, '2018_06_27_072626_create_blog_module', 1),
(46, '2019_01_15_103052_create_media_table', 1),
(47, '2019_01_16_105633_create_video_progresses_table', 1),
(48, '2019_01_24_113831_create_invoices_table', 1),
(49, '2019_01_24_115120_create_cart_storage_table', 1),
(50, '2019_01_24_120730_create_orders_table', 1),
(51, '2019_01_24_120745_create_order_items_table', 1),
(52, '2019_01_29_052953_create_configs_table', 1),
(53, '2019_02_06_115555_create_course_timeline_table', 1),
(54, '2019_02_08_052619_create_sliders_table', 1),
(55, '2019_02_12_051827_create_sponsors_table', 1),
(56, '2019_02_12_101125_create_testimonials_table', 1),
(57, '2019_02_13_111625_create_faqs_table', 1),
(58, '2019_02_15_115610_create_reviews_table', 1),
(59, '2019_02_19_061120_create_reasons_table', 1),
(60, '2019_03_01_055054_create_chapter_students_table', 1),
(61, '2019_03_06_093703_create_contacts_table', 1),
(62, '2019_03_07_043443_create_pages_table', 1),
(63, '2019_04_25_095421_create_locales_table', 1),
(64, '2019_05_03_000001_create_customer_columns', 1),
(65, '2019_05_03_000002_create_subscriptions_table', 1),
(66, '2019_05_03_000003_create_subscription_items_table', 1),
(67, '2019_05_08_053815_create_certificates_table', 1),
(68, '2019_05_30_044853_create_bundles_table', 1),
(69, '2019_05_30_090702_create_bundle_courses_table', 1),
(70, '2019_05_31_055427_create_bundle_student_table', 1),
(71, '2019_05_31_120554_update_order_items_with_morph', 1),
(72, '2019_06_03_074229_add_foreign_key_to_courses', 1),
(73, '2019_06_03_074251_add_foreign_key_to_faqs', 1),
(74, '2019_06_03_074323_add_foreign_key_to_blogs', 1),
(75, '2019_06_07_073739_add_columns_in_users_table', 1),
(76, '2019_07_22_105142_add_free_column_in_courses', 1),
(77, '2019_07_22_105658_add_free_column_in_bundles', 1),
(78, '2019_07_30_055917_create_coupons_table', 1),
(79, '2019_07_30_061713_create_taxes_table', 1),
(80, '2019_07_30_063204_add_coupon_tax_id_in_orders_table', 1),
(81, '2019_08_19_054926_add_explanation_column_in_question_options', 1),
(82, '2019_09_10_061608_add_remarks_in_orders_table', 1),
(83, '2019_09_10_092512_create_teacher_profiles_table', 1),
(84, '2019_09_12_054932_create_earnings_table', 1),
(85, '2019_09_12_085707_create_withdraws_table', 1),
(86, '2019_09_18_210948_move_starred_column_from_threads_table_to_participants_table', 1),
(87, '2020_04_13_063958_add_description_column_in_teacher_profiles', 1),
(88, '2020_07_10_111516_create_failed_jobs_table', 1),
(89, '2020_08_08_092346_create_live_lesson_slots_table', 1),
(90, '2020_08_14_105647_add_live_lesson_column_lessons_table', 1),
(91, '2020_08_17_115140_create_lesson_slot_bookings_table', 1),
(92, '2020_09_25_073137_add_expire_at_column_in_courses_table', 1),
(93, '2020_09_28_121334_add_expire_at_column_in_bundles', 1),
(94, '2020_10_03_124424_fix_payment_type_cloumn_comments_orders_table', 1),
(95, '2020_10_13_055501_create_stripe_plans_table', 1),
(96, '2020_10_30_090754_add_order_type_column_in_orders_table', 1),
(97, '2020_10_30_111704_add_type_column_in_order_items_table', 1),
(98, '2020_11_03_104447_add_column_strike_price_courses_table', 1),
(99, '2020_12_07_102256_create_wish_lists_table', 1),
(100, '2021_07_23_105007_create_subscribe_courses_table', 1),
(101, '2021_07_23_105244_create_subscribe_bundles_table', 1),
(102, '2021_08_03_063332_add_expire_column_in_stripe_plans_table', 1),
(103, '2021_08_03_071019_create_user_courses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Auth\\User', 1),
(2, 'App\\Models\\Auth\\User', 2),
(3, 'App\\Models\\Auth\\User', 3),
(3, 'App\\Models\\Auth\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reference_no` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `payment_type` int(11) NOT NULL DEFAULT 0 COMMENT '1-stripe/card, 2 - Paypal, 3 - Offline, 4 - Instamojo, 5 - RazorPay, 6 - CashFree, 7 - PayUMoney ',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0 - in progress, 1 - Completed',
  `transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=WebPayment, 1=subscribe',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coupon_id` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=WebPayment, 1=subscribe',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sidebar` int(11) NOT NULL DEFAULT 0,
  `meta_title` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `user_id`, `title`, `slug`, `content`, `image`, `sidebar`, `meta_title`, `meta_keywords`, `meta_description`, `published`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'About Us', 'about-us', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et urna eu risus ultrices sagittis. In tortor turpis, lobortis a tincidunt non, congue a lorem. Quisque imperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.<br><br>\r\n\r\nMauris posuere sem at arcu commodo lobortis. Suspendisse sollicitudin dapibus congue. Etiam sit amet lacinia eros. In dictum lacinia tortor, nec mattis eros vulputate vel. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec posuere odio eget risus aliquam, quis ornare urna bibendum. Integer iaculis massa magna, et vehicula dui placerat a. Vestibulum ultricies mauris nunc, ut facilisis orci lobortis nec. Fusce cursus eget quam in elementum. Donec ipsum dui, semper ut commodo in, congue in urna.<br><br>\r\nimperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.', NULL, 1, NULL, NULL, NULL, 1, '2022-03-30 15:37:03', '2022-03-30 15:37:03', NULL),
(2, 1, 'Privacy Policy', 'privacy-policy', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et urna eu risus ultrices sagittis. In tortor turpis, lobortis a tincidunt non, congue a lorem. Quisque imperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.<br><br>\r\n\r\nMauris posuere sem at arcu commodo lobortis. Suspendisse sollicitudin dapibus congue. Etiam sit amet lacinia eros. In dictum lacinia tortor, nec mattis eros vulputate vel. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec posuere odio eget risus aliquam, quis ornare urna bibendum. Integer iaculis massa magna, et vehicula dui placerat a. Vestibulum ultricies mauris nunc, ut facilisis orci lobortis nec. Fusce cursus eget quam in elementum. Donec ipsum dui, semper ut commodo in, congue in urna.<br><br>\r\nimperdiet congue blandit. Cras quis tortor quis nunc porttitor pulvinar id id lacus. Curabitur dapibus augue orci. Praesent varius, dolor ut ultricies faucibus, ante nunc fringilla nulla, vitae egestas lorem erat eu libero. Praesent cursus tortor non gravida elementum. Praesent et arcu molestie, faucibus ligula sed, euismod urna. Praesent vitae orci metus. Nulla varius diam nec iaculis pulvinar. Sed mi enim, cursus nec urna a, interdum lobortis nisi.', NULL, 1, NULL, NULL, NULL, 1, '2022-03-30 15:37:03', '2022-03-30 15:37:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_histories`
--

CREATE TABLE `password_histories` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_histories`
--

INSERT INTO `password_histories` (`id`, `user_id`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, '$2y$10$49yn0s54IeyYF62OvNRHe.8k12cqQBH0N5P.Cp1SixDwuPCsPTdDi', '2022-03-30 15:37:00', '2022-03-30 15:37:00'),
(2, 2, '$2y$10$NMfOC33Rz1nCeq/ZRS6n6eS4/3vppB25VwqDagACmfT8QB6HWjzPm', '2022-03-30 15:37:00', '2022-03-30 15:37:00'),
(3, 3, '$2y$10$7WdNrrUJbzRSRFO4cEKQT.48c2SMWTBc9feMYWBK4iVCdfcj3pxTu', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(4, 4, '$2y$10$4S1Nt1wohAkkIuKseLGweezhr2xhPthGc8s8hth47t0WGihrNIszu', '2022-03-30 15:37:01', '2022-03-30 15:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user_management_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(2, 'user_management_create', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(3, 'user_management_edit', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(4, 'user_management_view', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(5, 'user_management_delete', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(6, 'permission_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(7, 'permission_create', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(8, 'permission_edit', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(9, 'permission_view', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(10, 'permission_delete', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(11, 'role_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(12, 'role_create', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(13, 'role_edit', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(14, 'role_view', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(15, 'role_delete', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(16, 'user_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(17, 'user_create', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(18, 'user_edit', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(19, 'user_view', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(20, 'user_delete', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(21, 'course_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(22, 'course_create', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(23, 'course_edit', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(24, 'course_view', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(25, 'course_delete', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(26, 'lesson_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(27, 'lesson_create', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(28, 'lesson_edit', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(29, 'lesson_view', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(30, 'lesson_delete', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(31, 'question_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(32, 'question_create', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(33, 'question_edit', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(34, 'question_view', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(35, 'question_delete', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(36, 'questions_option_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(37, 'questions_option_create', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(38, 'questions_option_edit', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(39, 'questions_option_view', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(40, 'questions_option_delete', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(41, 'test_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(42, 'test_create', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(43, 'test_edit', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(44, 'test_view', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(45, 'test_delete', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(46, 'order_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(47, 'view backend', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(48, 'category_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(49, 'category_create', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(50, 'category_edit', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(51, 'category_view', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(52, 'category_delete', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(53, 'blog_access', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(54, 'blog_create', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(55, 'blog_edit', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(56, 'blog_view', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(57, 'blog_delete', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(58, 'reason_access', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(59, 'reason_create', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(60, 'reason_edit', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(61, 'reason_view', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(62, 'reason_delete', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(63, 'page_access', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(64, 'page_create', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(65, 'page_edit', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(66, 'page_view', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(67, 'page_delete', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(68, 'bundle_access', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(69, 'bundle_create', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(70, 'bundle_edit', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(71, 'bundle_view', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(72, 'bundle_delete', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(73, 'live_lesson_access', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(74, 'live_lesson_create', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(75, 'live_lesson_edit', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(76, 'live_lesson_view', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(77, 'live_lesson_delete', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(78, 'live_lesson_slot_access', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(79, 'live_lesson_slot_create', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(80, 'live_lesson_slot_edit', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(81, 'live_lesson_slot_view', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(82, 'live_lesson_slot_delete', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(83, 'stripe_plan_access', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(84, 'stripe_plan_create', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(85, 'stripe_plan_edit', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(86, 'stripe_plan_view', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(87, 'stripe_plan_delete', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02'),
(88, 'stripe_plan_restore', 'web', '2022-03-30 15:37:02', '2022-03-30 15:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions_options`
--

CREATE TABLE `questions_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `option_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `explanation` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `correct` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_test`
--

CREATE TABLE `question_test` (
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `test_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reasons`
--

CREATE TABLE `reasons` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reasons`
--

INSERT INTO `reasons` (`id`, `title`, `content`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Best Education For All Students', 'Margie provides the high quality course content to address all student\'s needs', 'fas fa-book-open', 1, '2022-03-31 15:09:11', '2022-03-31 15:12:07'),
(3, 'The Power of Education', 'Margie\'s Magical Verbs ensures the best quality of education for all our students. We believe education is important for success for all of our students.', 'fas fa-crown', 1, '2022-04-03 14:22:36', '2022-04-03 14:22:36'),
(4, 'Low Entry Price', 'Lowest entry price for spanish learning content. Can\'t find a cheaper store anywhere.', 'fas fa-dollar-sign', 1, '2022-04-03 14:41:23', '2022-04-03 14:42:59'),
(5, 'Easy to Use!', 'This is by far the easiest to use website for learning spanish.', 'fas fa-book-reader', 1, '2022-04-03 14:42:34', '2022-04-03 14:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `reviewable_id` int(11) NOT NULL,
  `reviewable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(2, 'teacher', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(3, 'student', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01'),
(4, 'user', 'web', '2022-03-30 15:37:01', '2022-03-30 15:37:01');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(21, 2),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(47, 1),
(47, 2),
(47, 3),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(51, 1),
(51, 2),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(71, 2),
(72, 1),
(72, 2),
(73, 1),
(73, 2),
(74, 1),
(74, 2),
(75, 1),
(75, 2),
(76, 1),
(76, 2),
(77, 1),
(77, 2),
(78, 1),
(78, 2),
(79, 1),
(79, 2),
(80, 1),
(80, 2),
(81, 1),
(81, 2),
(82, 1),
(82, 2),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bg_image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `overlay` int(11) DEFAULT 0,
  `sequence` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1 - enabled, 0 - disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `name`, `content`, `bg_image`, `overlay`, `sequence`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Slide 1', '{\"hero_text\":\"Inventive Solution for Education\",\"sub_text\":\"Education and Training Organization\",\"buttons\":[{\"label\":\"Start Free Trial!\",\"link\":\"http://127.0.0.1:8000/courses\"}]}', 'slider-1.jpg', 0, 1, 1, '2022-03-30 15:37:03', '2022-03-31 13:36:27'),
(2, 'Slide 2', '{\"hero_text\":\"Browse The Best Courses\",\"sub_text\":\"Education and Training Organization\",\"widget\":{\"type\":1}}', 'slider-2.jpg', 0, 2, 1, '2022-03-30 15:37:03', '2022-03-30 15:37:03'),
(3, 'Slide 3', '{\"hero_text\":\"Mobile Application Experiences : Mobile App Design\",\"sub_text\":\"\",\"widget\":{\"type\":2,\"timer\":\"2019/02/15 11:01\"},\"buttons\":[{\"label\":\"About Us\",\"link\":\"http://laravel-lms.test/about-us\"},{\"label\":\"Contact Us\",\"link\":\"http://laravel-lms.test/contact-us\"}]}', 'slider-3.jpg', 0, 3, 1, '2022-03-30 15:37:03', '2022-03-30 15:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `provider` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stripe_plans`
--

CREATE TABLE `stripe_plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `product` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interval` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` int(11) DEFAULT NULL,
  `bundle` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_bundles`
--

CREATE TABLE `subscribe_bundles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` int(10) UNSIGNED NOT NULL,
  `bundle_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribe_courses`
--

CREATE TABLE `subscribe_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_items`
--

CREATE TABLE `subscription_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `tag_id` int(11) NOT NULL,
  `taggable_id` int(11) NOT NULL,
  `taggable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_profiles`
--

CREATE TABLE `teacher_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `facebook_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'paypal,bank',
  `payment_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_profiles`
--

INSERT INTO `teacher_profiles` (`id`, `user_id`, `facebook_link`, `twitter_link`, `linkedin_link`, `payment_method`, `payment_details`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'http://herman.net/autem-voluptate-iure-unde-modi-quos-nam.html', 'https://www.kohler.net/sint-aut-velit-libero-laborum-ab', 'http://hilpert.biz/magni-commodi-voluptatem-dolor-consequuntur-aut-dignissimos-non', 'paypal', '{\"bank_name\":\"\",\"ifsc_code\":\"\",\"account_number\":\"\",\"account_name\":\"\",\"paypal_email\":\"adminteacher@demo.com\"}', NULL, '2022-03-30 15:37:03', '2022-03-30 15:37:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 - disabled, 1 - enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `name`, `occupation`, `content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Test Username', 'Language Expert', 'This is a very good website for learning Spanish. 5/5 would recommend.', 1, '2022-03-31 18:06:44', '2022-03-31 18:06:44'),
(2, 'Student User', 'Student', 'This website has helped me accelerate my Spanish learning journey a lot! Thanks a lot Margie!', 1, '2022-04-03 14:38:02', '2022-04-03 14:38:02'),
(3, 'Akshan Teps', 'Student', 'Really good site, recommended for all skill levels. 10/10', 1, '2022-04-03 14:38:44', '2022-04-03 14:38:44'),
(4, 'Benjamin Hays', 'Student', 'Great website to learn Spanish for such a great price!', 1, '2022-04-03 14:40:15', '2022-04-03 14:40:15');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED DEFAULT NULL,
  `lesson_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) DEFAULT 0,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests_results`
--

CREATE TABLE `tests_results` (
  `id` int(10) UNSIGNED NOT NULL,
  `test_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `test_result` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests_results_answers`
--

CREATE TABLE `tests_results_answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `tests_result_id` int(10) UNSIGNED DEFAULT NULL,
  `question_id` int(10) UNSIGNED DEFAULT NULL,
  `option_id` int(10) UNSIGNED DEFAULT NULL,
  `correct` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'gravatar',
  `avatar_location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `confirmation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `timezone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `first_name`, `last_name`, `email`, `dob`, `phone`, `gender`, `address`, `city`, `pincode`, `state`, `country`, `avatar_type`, `avatar_location`, `password`, `password_changed_at`, `active`, `confirmation_code`, `confirmed`, `timezone`, `last_login_at`, `last_login_ip`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`) VALUES
(1, 'efe34d9d-6c92-43d3-9afe-f42024bae6cf', 'Admin', 'Margie', 'admin@mmv.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$lWzCieYAUQLp6Dx.BY.27.fifKLuboKudAdPA2ORJ4zUKdwvOYHuS', NULL, 1, 'f273dbbc2f5addfd64a697378ce43e68', 1, NULL, '2022-04-03 13:42:10', '127.0.0.1', NULL, '2022-03-30 15:37:00', '2022-04-03 13:42:10', NULL, NULL, NULL, NULL, NULL),
(2, 'a1231486-6803-4714-8682-956af0d01e04', 'Teacher', 'Margie', 'margie@mmv.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$lWzCieYAUQLp6Dx.BY.27.fifKLuboKudAdPA2ORJ4zUKdwvOYHuS', NULL, 1, 'cec08ef2ca44b79a98ed3d9473da4b1b', 1, NULL, NULL, NULL, NULL, '2022-03-30 15:37:00', '2022-03-30 15:37:00', NULL, NULL, NULL, NULL, NULL),
(3, 'cd8e6982-aafe-4c38-8a8a-8e18d539b203', 'Student', 'User', 'student@mmv.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$lWzCieYAUQLp6Dx.BY.27.fifKLuboKudAdPA2ORJ4zUKdwvOYHuS', NULL, 1, '31f3d6ca47d32f5347760f5037debbc4', 1, NULL, '2022-03-30 18:39:52', '127.0.0.1', NULL, '2022-03-30 15:37:01', '2022-03-30 18:39:52', NULL, NULL, NULL, NULL, NULL),
(4, '1fcb6ae7-fabb-4c12-a9d4-22fb5038afb5', 'Normal', 'User', 'user@mmv.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gravatar', NULL, '$2y$10$lWzCieYAUQLp6Dx.BY.27.fifKLuboKudAdPA2ORJ4zUKdwvOYHuS', NULL, 1, '4b21ec43232333a2b09fc32fc0f587c7', 1, NULL, NULL, NULL, NULL, '2022-03-30 15:37:01', '2022-03-30 15:37:01', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

CREATE TABLE `user_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `plan_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `course_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bundle_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `video_progresses`
--

CREATE TABLE `video_progresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `media_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `duration` double(8,2) NOT NULL,
  `progress` double(8,2) NOT NULL,
  `complete` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0.Pending 1.Complete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `course_id` int(10) UNSIGNED NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `payment_type` tinyint(4) DEFAULT NULL COMMENT '0=Bank, 1=Paypal,2=offline',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=pending,1=accepted,2=rejected',
  `remarks` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menus`
--
ALTER TABLE `admin_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_menu_items_menu_foreign` (`menu`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_category_id_foreign` (`category_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bundles`
--
ALTER TABLE `bundles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bundles_user_id_foreign` (`user_id`),
  ADD KEY `bundles_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `bundle_courses`
--
ALTER TABLE `bundle_courses`
  ADD KEY `bundle_courses_bundle_id_foreign` (`bundle_id`),
  ADD KEY `bundle_courses_course_id_foreign` (`course_id`);

--
-- Indexes for table `bundle_student`
--
ALTER TABLE `bundle_student`
  ADD KEY `bundle_student_bundle_id_foreign` (`bundle_id`),
  ADD KEY `bundle_student_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `cart_storage`
--
ALTER TABLE `cart_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_storage_id_index` (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `certificates_user_id_foreign` (`user_id`),
  ADD KEY `certificates_course_id_foreign` (`course_id`);

--
-- Indexes for table `chapter_students`
--
ALTER TABLE `chapter_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapter_students_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `chapter_students_user_id_foreign` (`user_id`),
  ADD KEY `chapter_students_course_id_foreign` (`course_id`);

--
-- Indexes for table `chatter_categories`
--
ALTER TABLE `chatter_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chatter_discussion_slug_unique` (`slug`),
  ADD KEY `chatter_discussion_chatter_category_id_foreign` (`chatter_category_id`),
  ADD KEY `chatter_discussion_user_id_foreign` (`user_id`);

--
-- Indexes for table `chatter_post`
--
ALTER TABLE `chatter_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatter_post_chatter_discussion_id_foreign` (`chatter_discussion_id`),
  ADD KEY `chatter_post_user_id_foreign` (`user_id`);

--
-- Indexes for table `chatter_user_discussion`
--
ALTER TABLE `chatter_user_discussion`
  ADD PRIMARY KEY (`user_id`,`discussion_id`),
  ADD KEY `chatter_user_discussion_user_id_index` (`user_id`),
  ADD KEY `chatter_user_discussion_discussion_id_index` (`discussion_id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_participants`
--
ALTER TABLE `chat_participants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_participants_thread_id_user_id_unique` (`thread_id`,`user_id`),
  ADD KEY `chat_participants_user_id_foreign` (`user_id`);

--
-- Indexes for table `chat_threads`
--
ALTER TABLE `chat_threads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_deleted_at_index` (`deleted_at`),
  ADD KEY `courses_category_id_foreign` (`category_id`);

--
-- Indexes for table `course_student`
--
ALTER TABLE `course_student`
  ADD KEY `course_student_course_id_foreign` (`course_id`),
  ADD KEY `course_student_user_id_foreign` (`user_id`);

--
-- Indexes for table `course_timeline`
--
ALTER TABLE `course_timeline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_timeline_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `course_user`
--
ALTER TABLE `course_user`
  ADD KEY `fk_p_54418_54417_user_cou_596eece522b73` (`course_id`),
  ADD KEY `fk_p_54417_54418_course_u_596eece522bee` (`user_id`);

--
-- Indexes for table `earnings`
--
ALTER TABLE `earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `earnings_course_id_foreign` (`course_id`),
  ADD KEY `earnings_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_category_id_foreign` (`category_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `54419_596eedbb6686e` (`course_id`),
  ADD KEY `lessons_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `lesson_slot_bookings`
--
ALTER TABLE `lesson_slot_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lesson_slot_bookings_live_lesson_slot_id_foreign` (`live_lesson_slot_id`),
  ADD KEY `lesson_slot_bookings_lesson_id_foreign` (`lesson_id`),
  ADD KEY `lesson_slot_bookings_user_id_foreign` (`user_id`);

--
-- Indexes for table `live_lesson_slots`
--
ALTER TABLE `live_lesson_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `live_lesson_slots_lesson_id_foreign` (`lesson_id`);

--
-- Indexes for table `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`),
  ADD KEY `pages_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_histories`
--
ALTER TABLE `password_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `password_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_user_id_foreign` (`user_id`),
  ADD KEY `questions_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `questions_options`
--
ALTER TABLE `questions_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `54421_596eee8745a1e` (`question_id`),
  ADD KEY `questions_options_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `question_test`
--
ALTER TABLE `question_test`
  ADD KEY `fk_p_54420_54422_test_que_596eeef70992f` (`question_id`),
  ADD KEY `fk_p_54422_54420_question_596eeef7099af` (`test_id`);

--
-- Indexes for table `reasons`
--
ALTER TABLE `reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_name_index` (`name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stripe_plans`
--
ALTER TABLE `stripe_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribe_bundles`
--
ALTER TABLE `subscribe_bundles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribe_bundles_bundle_id_foreign` (`bundle_id`);

--
-- Indexes for table `subscribe_courses`
--
ALTER TABLE `subscribe_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribe_courses_course_id_foreign` (`course_id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscriptions_user_id_stripe_status_index` (`user_id`,`stripe_status`);

--
-- Indexes for table `subscription_items`
--
ALTER TABLE `subscription_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscription_items_subscription_id_stripe_plan_unique` (`subscription_id`,`stripe_plan`),
  ADD KEY `subscription_items_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_profiles`
--
ALTER TABLE `teacher_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_profiles_user_id_foreign` (`user_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `54422_596eeef514d00` (`course_id`),
  ADD KEY `54422_596eeef53411a` (`lesson_id`),
  ADD KEY `tests_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `tests_results`
--
ALTER TABLE `tests_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tests_results_test_id_foreign` (`test_id`),
  ADD KEY `tests_results_user_id_foreign` (`user_id`);

--
-- Indexes for table `tests_results_answers`
--
ALTER TABLE `tests_results_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tests_results_answers_tests_result_id_foreign` (`tests_result_id`),
  ADD KEY `tests_results_answers_question_id_foreign` (`question_id`),
  ADD KEY `tests_results_answers_option_id_foreign` (`option_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_stripe_id_index` (`stripe_id`);

--
-- Indexes for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_courses_user_id_plan_id_course_id_bundle_id_index` (`user_id`,`plan_id`,`course_id`,`bundle_id`);

--
-- Indexes for table `video_progresses`
--
ALTER TABLE `video_progresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `video_progresses_media_id_foreign` (`media_id`),
  ADD KEY `video_progresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wish_lists_user_id_foreign` (`user_id`),
  ADD KEY `wish_lists_course_id_foreign` (`course_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menus`
--
ALTER TABLE `admin_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bundles`
--
ALTER TABLE `bundles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chapter_students`
--
ALTER TABLE `chapter_students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chatter_categories`
--
ALTER TABLE `chatter_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chatter_post`
--
ALTER TABLE `chatter_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_participants`
--
ALTER TABLE `chat_participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chat_threads`
--
ALTER TABLE `chat_threads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_timeline`
--
ALTER TABLE `course_timeline`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `earnings`
--
ALTER TABLE `earnings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lesson_slot_bookings`
--
ALTER TABLE `lesson_slot_bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `live_lesson_slots`
--
ALTER TABLE `live_lesson_slots`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locales`
--
ALTER TABLE `locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2894;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `password_histories`
--
ALTER TABLE `password_histories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions_options`
--
ALTER TABLE `questions_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reasons`
--
ALTER TABLE `reasons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stripe_plans`
--
ALTER TABLE `stripe_plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribe_bundles`
--
ALTER TABLE `subscribe_bundles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribe_courses`
--
ALTER TABLE `subscribe_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscription_items`
--
ALTER TABLE `subscription_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_profiles`
--
ALTER TABLE `teacher_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests_results`
--
ALTER TABLE `tests_results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests_results_answers`
--
ALTER TABLE `tests_results_answers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `video_progresses`
--
ALTER TABLE `video_progresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_menu_items`
--
ALTER TABLE `admin_menu_items`
  ADD CONSTRAINT `admin_menu_items_menu_foreign` FOREIGN KEY (`menu`) REFERENCES `admin_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bundles`
--
ALTER TABLE `bundles`
  ADD CONSTRAINT `bundles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bundle_courses`
--
ALTER TABLE `bundle_courses`
  ADD CONSTRAINT `bundle_courses_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bundle_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bundle_student`
--
ALTER TABLE `bundle_student`
  ADD CONSTRAINT `bundle_student_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bundle_student_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificates_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chapter_students`
--
ALTER TABLE `chapter_students`
  ADD CONSTRAINT `chapter_students_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chapter_students_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chatter_discussion`
--
ALTER TABLE `chatter_discussion`
  ADD CONSTRAINT `chatter_discussion_chatter_category_id_foreign` FOREIGN KEY (`chatter_category_id`) REFERENCES `chatter_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatter_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chatter_post`
--
ALTER TABLE `chatter_post`
  ADD CONSTRAINT `chatter_post_chatter_discussion_id_foreign` FOREIGN KEY (`chatter_discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chatter_post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chatter_user_discussion`
--
ALTER TABLE `chatter_user_discussion`
  ADD CONSTRAINT `chatter_user_discussion_discussion_id_foreign` FOREIGN KEY (`discussion_id`) REFERENCES `chatter_discussion` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chatter_user_discussion_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `chat_participants`
--
ALTER TABLE `chat_participants`
  ADD CONSTRAINT `chat_participants_thread_id_foreign` FOREIGN KEY (`thread_id`) REFERENCES `chat_messages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_student`
--
ALTER TABLE `course_student`
  ADD CONSTRAINT `course_student_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_student_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_user`
--
ALTER TABLE `course_user`
  ADD CONSTRAINT `fk_p_54417_54418_course_u_596eece522bee` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_p_54418_54417_user_cou_596eece522b73` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `earnings`
--
ALTER TABLE `earnings`
  ADD CONSTRAINT `earnings_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `earnings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `54419_596eedbb6686e` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lesson_slot_bookings`
--
ALTER TABLE `lesson_slot_bookings`
  ADD CONSTRAINT `lesson_slot_bookings_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_slot_bookings_live_lesson_slot_id_foreign` FOREIGN KEY (`live_lesson_slot_id`) REFERENCES `live_lesson_slots` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lesson_slot_bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `live_lesson_slots`
--
ALTER TABLE `live_lesson_slots`
  ADD CONSTRAINT `live_lesson_slots_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_histories`
--
ALTER TABLE `password_histories`
  ADD CONSTRAINT `password_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions_options`
--
ALTER TABLE `questions_options`
  ADD CONSTRAINT `54421_596eee8745a1e` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_test`
--
ALTER TABLE `question_test`
  ADD CONSTRAINT `fk_p_54420_54422_test_que_596eeef70992f` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_p_54422_54420_question_596eeef7099af` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subscribe_bundles`
--
ALTER TABLE `subscribe_bundles`
  ADD CONSTRAINT `subscribe_bundles_bundle_id_foreign` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscribe_courses`
--
ALTER TABLE `subscribe_courses`
  ADD CONSTRAINT `subscribe_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `teacher_profiles`
--
ALTER TABLE `teacher_profiles`
  ADD CONSTRAINT `teacher_profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `54422_596eeef514d00` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `54422_596eeef53411a` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tests_results`
--
ALTER TABLE `tests_results`
  ADD CONSTRAINT `tests_results_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tests_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tests_results_answers`
--
ALTER TABLE `tests_results_answers`
  ADD CONSTRAINT `tests_results_answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `questions_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tests_results_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tests_results_answers_tests_result_id_foreign` FOREIGN KEY (`tests_result_id`) REFERENCES `tests_results` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `video_progresses`
--
ALTER TABLE `video_progresses`
  ADD CONSTRAINT `video_progresses_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `video_progresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD CONSTRAINT `wish_lists_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wish_lists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `withdraws_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"db\",\"table\":\"locales\"},{\"db\":\"db\",\"table\":\"users\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-04-05 01:59:31', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

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
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
