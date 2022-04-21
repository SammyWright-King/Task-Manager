-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 21, 2022 at 03:45 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Finance', '2022-04-18 11:03:44', '2022-04-18 11:03:44'),
(2, 'Operation', '2022-04-18 11:03:44', '2022-04-18 11:03:44'),
(3, 'Human Resource', '2022-04-18 11:03:44', '2022-04-18 11:03:44'),
(4, 'Standard', '2022-04-20 22:37:19', '2022-04-20 22:37:19');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `task_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 54, 111, 'You need to do this Task as Quickly as possible', '2022-04-19 19:28:14', '2022-04-19 19:28:14'),
(2, 54, 4, 'Wonderful, I\'l get to it as soon as possible', '2022-04-19 19:53:49', '2022-04-19 19:53:49'),
(3, 1, 2, 'Congratulations there', '2022-04-20 23:27:47', '2022-04-20 23:27:47'),
(4, 54, 112, 'Nice task you have created there', '2022-04-21 00:01:52', '2022-04-21 00:01:52'),
(5, 54, 112, 'nice image you\'ve got there', '2022-04-21 00:15:01', '2022-04-21 00:15:01'),
(6, 1, 107, 'Waoh! very thoughtful of you', '2022-04-21 00:34:57', '2022-04-21 00:34:57');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(316, '2014_10_12_000000_create_users_table', 1),
(317, '2014_10_12_100000_create_password_resets_table', 1),
(318, '2019_08_19_000000_create_failed_jobs_table', 1),
(319, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(320, '2022_04_12_232246_create_category_table', 1),
(321, '2022_04_12_232916_create_tasks_table', 1),
(322, '2022_04_12_233631_create_comments_table', 1),
(328, '2022_04_18_113625_edit_tables', 2),
(329, '2022_04_18_113648_edit_category_table', 2),
(330, '2022_04_21_000407_edit_table_users', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_url` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `category_id`, `title`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 54, 1, 'Prof Manuer', 'Ut deserunt magni error.', 'img/Mx5DvKPjNgs9Dda4OVSwcs02ezahz1JNFLCoJFEE.png', '2022-04-16 12:45:03', '2022-04-19 19:31:54'),
(2, 1, 4, 'Many Operations', 'Nulla laudantium consequuntur fuga expedita perspiciatis.', 'img/l0UJHGsaxkb11GGbLZ59lkvQRse7CJ1oxQdh3c7M.jpg', '2022-04-16 12:45:03', '2022-04-20 23:27:35'),
(3, 2, 0, 'Mr.', 'Molestias similique ad consequuntur molestiae adipisci vitae et alias.', 'https://via.placeholder.com/640x480.png/00ccbb?text=ea', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(4, 2, 0, 'Prof.', 'Amet in deserunt ratione nihil iste est.', 'https://via.placeholder.com/640x480.png/00eebb?text=animi', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(5, 3, 0, 'Ms.', 'Sint minus quisquam tempore autem quia aut.', 'https://via.placeholder.com/640x480.png/007711?text=sequi', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(6, 3, 0, 'Dr.', 'Consequatur quae sapiente earum inventore ad porro eveniet odio.', 'https://via.placeholder.com/640x480.png/008877?text=reiciendis', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(7, 4, 0, 'Mr.', 'Ut accusamus rerum facilis fugit.', 'https://via.placeholder.com/640x480.png/00ddee?text=perspiciatis', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(8, 4, 0, 'Prof.', 'Et blanditiis qui est accusamus ratione.', 'https://via.placeholder.com/640x480.png/0000ff?text=et', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(9, 5, 0, 'Dr.', 'Quia quis aut fuga mollitia unde et incidunt.', 'https://via.placeholder.com/640x480.png/0044ee?text=repellendus', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(10, 5, 0, 'Dr.', 'Qui eos doloremque et animi aut accusamus.', 'https://via.placeholder.com/640x480.png/001122?text=quidem', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(11, 6, 0, 'Ms.', 'Id dolor ipsum dignissimos qui.', 'https://via.placeholder.com/640x480.png/00ee22?text=nihil', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(12, 6, 0, 'Mr.', 'Numquam quae aliquid aut sint amet ut et.', 'https://via.placeholder.com/640x480.png/00ff44?text=ut', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(13, 7, 0, 'Mrs.', 'Qui autem eaque qui nihil adipisci.', 'https://via.placeholder.com/640x480.png/00bb00?text=minima', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(14, 7, 0, 'Ms.', 'Dolores praesentium neque culpa.', 'https://via.placeholder.com/640x480.png/001188?text=culpa', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(15, 8, 0, 'Prof.', 'Animi alias qui illo veritatis.', 'https://via.placeholder.com/640x480.png/004433?text=consectetur', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(16, 8, 0, 'Prof.', 'Consequatur occaecati quo impedit id dolorem assumenda voluptas.', 'https://via.placeholder.com/640x480.png/00ff00?text=et', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(17, 9, 0, 'Mrs.', 'Voluptatem quia modi reprehenderit facere ut nemo.', 'https://via.placeholder.com/640x480.png/007700?text=tempore', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(18, 9, 0, 'Miss', 'Aliquam et minus ex optio pariatur et.', 'https://via.placeholder.com/640x480.png/008822?text=ad', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(19, 10, 0, 'Mr.', 'Ut iste quo rerum earum laudantium.', 'https://via.placeholder.com/640x480.png/004477?text=eum', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(20, 10, 0, 'Dr.', 'Eum est dignissimos iusto aut.', 'https://via.placeholder.com/640x480.png/0088aa?text=ea', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(21, 11, 0, 'Mr.', 'Cum et eos architecto assumenda distinctio.', 'https://via.placeholder.com/640x480.png/00ffcc?text=quia', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(22, 11, 0, 'Miss', 'Nihil cumque fugiat a alias odio dolores.', 'https://via.placeholder.com/640x480.png/0044ff?text=quibusdam', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(23, 12, 0, 'Mrs.', 'Laboriosam aut hic voluptatem.', 'https://via.placeholder.com/640x480.png/005511?text=sit', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(24, 12, 0, 'Mrs.', 'Dignissimos deserunt est veniam.', 'https://via.placeholder.com/640x480.png/0066cc?text=doloribus', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(25, 13, 0, 'Prof.', 'Vel ut recusandae sunt aliquam.', 'https://via.placeholder.com/640x480.png/00ee33?text=quam', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(26, 13, 0, 'Ms.', 'Itaque est dolorem corporis a doloremque placeat.', 'https://via.placeholder.com/640x480.png/00cccc?text=quia', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(27, 14, 0, 'Mrs.', 'Excepturi molestias nemo nobis officiis facilis.', 'https://via.placeholder.com/640x480.png/004499?text=nostrum', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(28, 14, 0, 'Prof.', 'Rerum ex ut iste.', 'https://via.placeholder.com/640x480.png/0077ff?text=iste', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(29, 15, 0, 'Mr.', 'Sint illo sequi unde magni itaque.', 'https://via.placeholder.com/640x480.png/0066ee?text=hic', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(30, 15, 0, 'Mr.', 'Nisi maxime architecto quis quae accusantium accusamus.', 'https://via.placeholder.com/640x480.png/0022ff?text=sint', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(31, 16, 0, 'Dr.', 'Doloribus illum commodi id velit.', 'https://via.placeholder.com/640x480.png/004488?text=deleniti', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(32, 16, 0, 'Dr.', 'Nisi aliquid iure accusamus commodi quod.', 'https://via.placeholder.com/640x480.png/00aa66?text=ullam', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(33, 17, 0, 'Mr.', 'Et sint et omnis eveniet.', 'https://via.placeholder.com/640x480.png/00ff55?text=ab', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(34, 17, 0, 'Mr.', 'Vel impedit voluptate id voluptates.', 'https://via.placeholder.com/640x480.png/002288?text=error', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(35, 18, 0, 'Prof.', 'Omnis totam alias ut harum aut.', 'https://via.placeholder.com/640x480.png/0088ee?text=ipsam', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(36, 18, 0, 'Dr.', 'Et expedita quos fugiat.', 'https://via.placeholder.com/640x480.png/009977?text=est', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(37, 19, 0, 'Ms.', 'Expedita ratione dolorum est explicabo dolores sint nobis inventore.', 'https://via.placeholder.com/640x480.png/002233?text=ex', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(38, 19, 0, 'Mr.', 'Enim ut quasi ad et quas et.', 'https://via.placeholder.com/640x480.png/0022bb?text=commodi', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(39, 20, 0, 'Miss', 'Perspiciatis ipsa delectus quaerat exercitationem.', 'https://via.placeholder.com/640x480.png/00ddbb?text=enim', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(40, 20, 0, 'Dr.', 'Voluptates dolor quis aut ipsam.', 'https://via.placeholder.com/640x480.png/005555?text=praesentium', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(41, 21, 0, 'Dr.', 'Velit ab rerum possimus rerum quibusdam laborum.', 'https://via.placeholder.com/640x480.png/007711?text=consequatur', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(42, 21, 0, 'Mrs.', 'Ut laudantium dolore maxime non.', 'https://via.placeholder.com/640x480.png/002255?text=ut', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(43, 22, 0, 'Ms.', 'Repellat architecto sapiente ab.', 'https://via.placeholder.com/640x480.png/0077cc?text=eum', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(44, 22, 0, 'Prof.', 'Vitae atque non sed quia.', 'https://via.placeholder.com/640x480.png/0088dd?text=in', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(45, 23, 0, 'Dr.', 'Esse nam id quis quibusdam aperiam blanditiis qui iure.', 'https://via.placeholder.com/640x480.png/00ddbb?text=fugit', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(46, 23, 0, 'Ms.', 'Dolor aliquam quasi repudiandae tempora sequi esse explicabo.', 'https://via.placeholder.com/640x480.png/006699?text=aut', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(47, 24, 0, 'Dr.', 'Molestiae ex architecto aperiam ratione consequatur ea ut id.', 'https://via.placeholder.com/640x480.png/00dd22?text=quaerat', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(48, 24, 0, 'Prof.', 'Incidunt qui ut vel ea.', 'https://via.placeholder.com/640x480.png/0044bb?text=quia', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(49, 25, 0, 'Miss', 'Dignissimos rem accusamus qui tenetur.', 'https://via.placeholder.com/640x480.png/00ff44?text=rerum', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(50, 25, 0, 'Mr.', 'Ullam atque molestiae omnis nostrum.', 'https://via.placeholder.com/640x480.png/006644?text=animi', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(51, 26, 0, 'Prof.', 'Commodi possimus architecto sunt molestiae modi nostrum in.', 'https://via.placeholder.com/640x480.png/0000dd?text=aut', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(52, 26, 0, 'Prof.', 'Fuga iste quaerat est eos et fugiat.', 'https://via.placeholder.com/640x480.png/00ee66?text=vero', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(53, 27, 0, 'Mrs.', 'Nihil iure velit quisquam praesentium tempore unde enim.', 'https://via.placeholder.com/640x480.png/003377?text=distinctio', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(54, 27, 0, 'Miss', 'Debitis non officia eveniet tempora voluptatum.', 'https://via.placeholder.com/640x480.png/006600?text=enim', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(55, 28, 0, 'Mrs.', 'Quia eveniet sit adipisci impedit.', 'https://via.placeholder.com/640x480.png/000066?text=earum', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(56, 28, 0, 'Dr.', 'Doloribus incidunt voluptates eos qui.', 'https://via.placeholder.com/640x480.png/00ffcc?text=sunt', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(57, 29, 0, 'Mr.', 'Omnis saepe id tempora aut et.', 'https://via.placeholder.com/640x480.png/008855?text=voluptatibus', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(58, 29, 0, 'Mr.', 'Deleniti consequuntur unde ut et tempora asperiores.', 'https://via.placeholder.com/640x480.png/00cc77?text=autem', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(59, 30, 0, 'Mrs.', 'Eligendi qui earum provident sunt.', 'https://via.placeholder.com/640x480.png/007733?text=ratione', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(60, 30, 0, 'Prof.', 'Rerum eos enim fugit sunt id sit voluptates.', 'https://via.placeholder.com/640x480.png/0033dd?text=quidem', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(61, 31, 0, 'Miss', 'Tenetur voluptas impedit est est aliquam ut nam.', 'https://via.placeholder.com/640x480.png/00ffbb?text=ab', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(62, 31, 0, 'Prof.', 'Est laborum perspiciatis sit iusto officiis cupiditate et.', 'https://via.placeholder.com/640x480.png/000000?text=voluptates', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(63, 32, 0, 'Prof.', 'Enim saepe et non minima alias qui vitae.', 'https://via.placeholder.com/640x480.png/0077aa?text=quas', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(64, 32, 0, 'Miss', 'Quo accusamus cupiditate officia neque quas quia illo.', 'https://via.placeholder.com/640x480.png/008877?text=deleniti', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(65, 33, 0, 'Dr.', 'Iure eum ut minus numquam.', 'https://via.placeholder.com/640x480.png/0055ee?text=dolor', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(66, 33, 0, 'Mr.', 'Adipisci aliquam magni consequatur sit.', 'https://via.placeholder.com/640x480.png/00dd66?text=et', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(67, 34, 0, 'Mrs.', 'Aliquam ducimus non unde ipsum unde eum.', 'https://via.placeholder.com/640x480.png/00dd77?text=voluptatem', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(68, 34, 0, 'Mr.', 'Est error ut nemo quaerat in qui ratione asperiores.', 'https://via.placeholder.com/640x480.png/0088bb?text=et', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(69, 35, 0, 'Mr.', 'Ut mollitia vel unde ea.', 'https://via.placeholder.com/640x480.png/00ff55?text=omnis', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(70, 35, 0, 'Miss', 'Ut sunt minima molestiae accusantium.', 'https://via.placeholder.com/640x480.png/004433?text=quo', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(71, 36, 0, 'Mr.', 'Aut consectetur omnis tempore.', 'https://via.placeholder.com/640x480.png/0099ff?text=tempora', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(72, 36, 0, 'Mr.', 'Eum veniam odio rem.', 'https://via.placeholder.com/640x480.png/002277?text=iste', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(73, 37, 0, 'Dr.', 'Blanditiis repudiandae harum sit dolorem.', 'https://via.placeholder.com/640x480.png/00bb77?text=eos', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(74, 37, 0, 'Mr.', 'Soluta nesciunt sed laboriosam.', 'https://via.placeholder.com/640x480.png/004466?text=est', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(75, 38, 0, 'Ms.', 'Sunt recusandae qui totam et.', 'https://via.placeholder.com/640x480.png/004455?text=iusto', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(76, 38, 0, 'Ms.', 'Repellendus non a id doloribus rerum quae.', 'https://via.placeholder.com/640x480.png/00aa99?text=laborum', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(77, 39, 0, 'Dr.', 'Ea doloribus quod magni et optio.', 'https://via.placeholder.com/640x480.png/005566?text=quia', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(78, 39, 0, 'Ms.', 'Vitae velit reprehenderit eligendi.', 'https://via.placeholder.com/640x480.png/00ee44?text=laboriosam', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(79, 40, 0, 'Mrs.', 'Ut culpa minus quia accusantium.', 'https://via.placeholder.com/640x480.png/0044aa?text=animi', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(80, 40, 0, 'Dr.', 'Exercitationem omnis fuga eos corrupti aliquam a dolore.', 'https://via.placeholder.com/640x480.png/009933?text=veniam', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(81, 41, 0, 'Dr.', 'Accusantium quaerat ut labore aut fugit libero qui.', 'https://via.placeholder.com/640x480.png/00ee11?text=quo', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(82, 41, 0, 'Dr.', 'Reprehenderit doloribus id quaerat tempore dicta esse ut.', 'https://via.placeholder.com/640x480.png/0077aa?text=totam', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(83, 42, 0, 'Prof.', 'Quae fugit delectus ab et qui eaque blanditiis.', 'https://via.placeholder.com/640x480.png/00dd22?text=praesentium', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(84, 42, 0, 'Dr.', 'Distinctio fugit nostrum perferendis.', 'https://via.placeholder.com/640x480.png/0088aa?text=vitae', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(85, 43, 0, 'Dr.', 'Officia omnis quis nobis et voluptate aut est.', 'https://via.placeholder.com/640x480.png/0077dd?text=reprehenderit', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(86, 43, 0, 'Prof.', 'Ullam vitae tempore aliquid voluptate deleniti ut.', 'https://via.placeholder.com/640x480.png/0011cc?text=magni', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(87, 44, 0, 'Dr.', 'Molestiae debitis sed est minima.', 'https://via.placeholder.com/640x480.png/0000bb?text=eaque', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(88, 44, 0, 'Mr.', 'Minus ea provident ducimus perferendis mollitia.', 'https://via.placeholder.com/640x480.png/0044ee?text=aut', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(89, 45, 0, 'Miss', 'Enim voluptas architecto eum sunt esse voluptates.', 'https://via.placeholder.com/640x480.png/009966?text=qui', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(90, 45, 0, 'Ms.', 'Neque est et labore voluptatibus laboriosam unde enim.', 'https://via.placeholder.com/640x480.png/0022ff?text=similique', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(91, 46, 0, 'Prof.', 'Aliquam magni dolor et repellat alias.', 'https://via.placeholder.com/640x480.png/0033dd?text=nulla', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(92, 46, 0, 'Mr.', 'Odio id quia numquam nesciunt.', 'https://via.placeholder.com/640x480.png/0099bb?text=ea', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(93, 47, 0, 'Dr.', 'Ipsam nemo quaerat vel quia voluptate sit.', 'https://via.placeholder.com/640x480.png/00ee33?text=dolores', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(94, 47, 0, 'Miss', 'Possimus ab sunt enim occaecati magni molestiae aperiam quae.', 'https://via.placeholder.com/640x480.png/00aa77?text=veritatis', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(95, 48, 0, 'Mrs.', 'Ut a qui quaerat in.', 'https://via.placeholder.com/640x480.png/00aa99?text=impedit', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(96, 48, 0, 'Prof.', 'Eum et ex aut at quia et.', 'https://via.placeholder.com/640x480.png/0077ee?text=et', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(97, 49, 0, 'Prof.', 'Et quam aut deserunt.', 'https://via.placeholder.com/640x480.png/003377?text=quibusdam', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(98, 49, 0, 'Prof.', 'Occaecati nobis doloribus molestiae.', 'https://via.placeholder.com/640x480.png/009933?text=fugit', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(99, 50, 0, 'Dr.', 'Consequatur dolorem id voluptatem unde molestias soluta.', 'https://via.placeholder.com/640x480.png/0066cc?text=fugit', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(100, 50, 0, 'Mr.', 'Ipsam consequatur voluptatem repudiandae autem voluptatum.', 'https://via.placeholder.com/640x480.png/0088cc?text=debitis', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(101, 52, 0, 'Prof.', 'Corporis et qui nemo dolorem qui quia qui.', 'https://via.placeholder.com/640x480.png/005544?text=odio', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(107, 1, 3, 'Meet Course Instructor today', 'description on it', 'img/L3H3QQ0cmUT4htfVwGjqKme0VU2H0QV9P3fYb6Zs.png', '2022-04-18 17:19:16', '2022-04-21 00:34:27'),
(108, 1, 1, 'title', 'deis', 'img//2ME8ngTARy0CEQZq6zhYDeWTfW9f7qIJrjIKsvYn.png', '2022-04-18 17:23:35', '2022-04-18 17:23:55'),
(109, 1, 1, 'title', 'description', 'files/1650307911.png', '2022-04-18 17:51:51', '2022-04-18 17:51:51'),
(110, 1, 1, 'man', 'tentative', 'img/XhpvhE0bne4xpdrdHrJtWVLgstHnUWKUvfOz5LgC.png', '2022-04-18 19:03:46', '2022-04-18 19:03:46'),
(111, 54, 1, 'Meet course deadline', 'Meet the deadline for coursework on web development', 'img/zsxb0VXffjXkNBXiMPbRfw50OVwiR3Ag4n6Ica3K.jpg', '2022-04-19 14:26:48', '2022-04-19 16:50:17'),
(112, 54, 4, 'Go to the market today', 'go to the market to get food stuff today', 'img/8M8KMRIiJRJE7fDn40LRaJmoiugsczi8hYPYfFQk.jpg', '2022-04-20 23:46:07', '2022-04-21 00:15:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `is_admin`, `email_verified_at`, `password`, `gender`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ressie', 'Brekke', 'ressie.baumbach@example.org', 1, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '1347 Crist Mews Suite 247\nHoppefurt, CT 87052', 'l6fATDQZmJNdZMK8gsiTLvr1KkG9tARhgtcG8GVyJog37kB3FTcUK0a7ttMJ', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(2, 'Phoebe', 'Maggio', 'miles.abernathy@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '39223 Bergnaum Lakes\nTreutelton, NJ 87087', 'S38xQdtGb9', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(3, 'Lyric', 'Marquardt', 'brandon86@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '3701 Reta Dam\nBalistrerimouth, NM 06512', 'A3uqvJC6KF', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(4, 'Syble', 'Armstrong', 'schneider.aidan@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '66552 Elouise Plaza\nGerholdbury, RI 20701-0439', 'tzbYUCz1sA', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(5, 'Marquis', 'Littel', 'hellen89@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '8113 Annabel Turnpike\nNorth Makenna, LA 70296-3172', 'PKv5uD9c5E', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(6, 'Ari', 'Wisoky', 'river.bergstrom@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '769 Max Path\nGorczanyton, SC 91682', 'q3p9oCeoIF', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(7, 'Emilia', 'Emard', 'ivory.dubuque@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '8701 Effertz Pike Apt. 701\nTatyanahaven, MT 12056-4660', 'S3zHt442AR', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(8, 'Desmond', 'Funk', 'hayes.ella@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '21007 Kulas Field\nKiehnborough, IL 67110-5587', 'ZA3bka10YK', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(9, 'Jenifer', 'Herman', 'bode.david@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '39022 Hill Gateway Apt. 009\nSusiemouth, CA 71605', 'MoNarV1kGR', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(10, 'Dallin', 'Marvin', 'kyost@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '825 O\'Connell Squares Apt. 581\nEast Jerald, AK 26209', 'zEU9OrQZAP', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(11, 'Nora', 'Schaefer', 'zcronin@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '833 Yost Ranch\nLake Kaceyburgh, FL 84683-1254', 'ax0Yad9uqH', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(12, 'Ellsworth', 'Hartmann', 'gillian00@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '929 Norma Cliffs\nSouth Craigburgh, OR 75769', 'rF7EIKRK8j', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(13, 'Autumn', 'Kihn', 'wunsch.marley@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '19547 Will View\nJanyland, PA 55961-8169', 'FHhoi5Ldgu', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(14, 'Danielle', 'Barton', 'barrows.emie@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '1127 Stracke Street Apt. 443\nLake Fletaview, AL 55978', 'TUgyenE5R3', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(15, 'Otilia', 'Bahringer', 'lula20@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '1727 Karl Path\nEast Alishachester, NJ 91957', 'F4OQs5Y1aT', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(16, 'Blanche', 'Hamill', 'aniya13@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '79681 Tito Brook Suite 617\nWunschfort, PA 86272', 'PDiNfw6JBw', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(17, 'Zola', 'Brown', 'prosacco.shayna@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '37320 Delta Pine Apt. 852\nDaughertyport, NE 05727', 'RgaX2vVXSo', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(18, 'Leann', 'Fay', 'czieme@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '87290 Fay Point\nThompsonstad, VA 25294', 'XIhgS8rYYt', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(19, 'Lilian', 'Fadel', 'ugrant@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '793 Noel Station\nWiegandton, CA 07961-8275', 'GIxYKlGshG', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(20, 'Laurie', 'Koch', 'lavina93@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '264 Walsh Village\nRippinberg, LA 36159-9876', 'V52AD1nD6K', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(21, 'Julio', 'Daugherty', 'keagan78@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '93765 Kurtis Viaduct\nTheresiaview, MT 73207', 'yoKBO12d91', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(22, 'Mario', 'Kuphal', 'harris.margret@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '47268 Clyde Burg\nRowlandside, KS 66400-0316', 'AfUf2Iu7Mb', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(23, 'Schuyler', 'Hyatt', 'dbeatty@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '8260 Robel Cape\nWest Skyla, FL 88765-6404', '1pnHpH1m01', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(24, 'Darby', 'Willms', 'zyost@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '56483 Jada Walks\nEast Foster, IL 63006-8479', 'JotW8TaseZ', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(25, 'Stacey', 'McDermott', 'natalie.gorczany@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '35733 Kilback Mills\nPort Rebekah, NC 78404-0265', 'pZOxWPO3wZ', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(26, 'Arjun', 'Boyer', 'langosh.rhea@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '54473 Weber Drives\nEast Demarcusshire, KY 00356-3008', 'oakU6Te0fS', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(27, 'Connie', 'Haag', 'barton.dimitri@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '1353 Hector Island\nPort Bellbury, KS 77123', '5qnVtrfF9v', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(28, 'Leanne', 'Harber', 'nhodkiewicz@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '829 Neal Stravenue Suite 748\nDarronland, OH 74053', 'c7JnhVz4Sa', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(29, 'Laurence', 'Keeling', 'rcrona@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '858 Asha Turnpike\nLuzmouth, NY 09300', 'jHzDgPosxr', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(30, 'Kelly', 'Will', 'kulas.annabelle@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '1490 Justice Vista Apt. 946\nProsaccotown, UT 87389', '2YVMw6lWa7', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(31, 'Lupe', 'Paucek', 'vida.king@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '71707 Camila Road\nLake Mabellemouth, MS 94393-6963', 'Pamvz7fSMT', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(32, 'Delaney', 'Dibbert', 'aufderhar.jayne@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '66527 Gleason Freeway Apt. 599\nNew Amara, KS 71419', 'vcOOHRwsrd', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(33, 'Jayde', 'Marks', 'vpowlowski@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '80102 Norma Forest\nHarmonburgh, KY 39502', 'WQBDpZ0H2W', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(34, 'Angelina', 'Stracke', 'rhett80@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '35043 Fahey Centers\nSouth Jaedentown, VA 16082-9008', 'lQWpvVUKE8', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(35, 'Naomi', 'Hegmann', 'streich.clarabelle@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '750 Waters Haven\nLukasburgh, IN 92923', 'jgVtUWme3e', '2022-04-16 12:45:03', '2022-04-16 12:45:03'),
(36, 'Isaiah', 'Spencer', 'edward.kuvalis@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '23159 Kihn Ports\nHegmannmouth, NY 94746-7713', '2MxuNSktDF', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(37, 'Janae', 'Shields', 'jazmyn30@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '33093 Corkery Forest\nWest Reggie, AR 63197-8895', 'MOi9ffp7TI', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(38, 'Glennie', 'Mayer', 'isac.dickinson@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '3373 Medhurst Landing Apt. 645\nLowestad, WA 84164', 'Wdm1kjEDrB', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(39, 'Frida', 'Simonis', 'gideon49@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '591 Ernestina Circle\nFabiolahaven, WY 40160', '0sjeIRD09f', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(40, 'Bernardo', 'Dare', 'jamey09@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '6087 Senger Tunnel\nElnaland, AL 74063', 'BUdXkI6oW9', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(41, 'Kraig', 'Oberbrunner', 'jzemlak@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '548 Parker Turnpike Suite 606\nPort Stuart, AZ 67107', 'JfWO0v90AS', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(42, 'Dax', 'Hoppe', 'river69@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '240 McLaughlin Plain Suite 479\nErnestineland, NY 22399-3717', 'V7Jue52Rg0', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(43, 'Roxane', 'Waelchi', 'oberbrunner.shemar@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '88401 Hyman Ford\nPort Jo, SC 56385', 'CfVrwnr5ZR', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(44, 'Bridie', 'Lueilwitz', 'herzog.jannie@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '9841 Vandervort Groves\nCollierburgh, PA 74042', '4mHY0hWCMM', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(45, 'Koby', 'Jerde', 'ricky.fahey@example.org', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '33893 Block Square\nLoratown, WI 86450-7857', 'Q9yt0x39Pp', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(46, 'Jody', 'Eichmann', 'nnolan@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '89211 Serena Pike Apt. 315\nVernonside, WY 32643', '7xhaGiNE9V', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(47, 'Roderick', 'Huel', 'cynthia18@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '483 Madaline Bypass Apt. 664\nBrendonmouth, NJ 92184', '0opzRiGidu', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(48, 'Randi', 'Hane', 'jimmie.smitham@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '21814 Johnson Viaduct\nNorth Selina, NE 03530-0663', '5HJ65slOKT', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(49, 'Petra', 'Kuphal', 'nathan13@example.com', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '97608 Ollie Shores\nGreysonport, ME 21506-8452', 'fnDjk8BrJO', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(50, 'Jamil', 'Hoeger', 'larkin.elwin@example.net', 0, '2022-04-16 12:45:03', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '271 Stamm Lane Apt. 416\nUriahville, VA 87123-1721', 'KIEz5ewUTW', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(51, 'Kiley', 'Block', 'virginie22@example.net', 0, '2022-04-16 12:45:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '4997 Reid Neck Apt. 906\nLake Dixie, HI 88870-1245', 'UDOugpFXvq', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(52, 'Fae', 'Abernathy', 'lcartwright@example.com', 0, '2022-04-16 12:45:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'male', '4500 Waelchi Wells\nSchmittview, DE 44141', 'Pj2DUEdzoN', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(53, 'Ivy', 'Kertzmann', 'mohammad47@example.org', 0, '2022-04-16 12:45:04', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'female', '81351 Reilly Rapids\nMozellestad, MN 16207', 'QA0jsQ8zlqWhmFMbWMtYmRF8suH8I61WtlHisbZH4B2NO02w0bXl2Aehtxu4', '2022-04-16 12:45:04', '2022-04-16 12:45:04'),
(54, 'Olu', 'Muyiwa', 'olumuuyiwaakinyemi@gmail.com', 0, NULL, '$2y$10$VHb1WuRDyEzf5TJ0IrCZ2.z8TdbzqXhSCKyIX0TX8SHibcEAjsH6O', NULL, 'olumuuyiwaakinyemi@gmail.com', 'b3LxPnuyYv4vCqMt741ZkFNc9fnd5QATQFSGkrXKSG3yQK4XpReulsruoM2t', '2022-04-16 12:46:01', '2022-04-16 12:46:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_index` (`user_id`),
  ADD KEY `comments_task_id_index` (`task_id`);

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
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_index` (`user_id`),
  ADD KEY `tasks_category_id_index` (`category_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
