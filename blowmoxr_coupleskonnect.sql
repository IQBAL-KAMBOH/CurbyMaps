-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 08, 2024 at 07:35 PM
-- Server version: 10.6.18-MariaDB-cll-lve
-- PHP Version: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blowmoxr_coupleskonnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_interests`
--

CREATE TABLE `all_interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `interest` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `all_interests`
--

INSERT INTO `all_interests` (`id`, `interest`, `created_at`, `updated_at`) VALUES
(2, 'Travel ✈️', NULL, NULL),
(3, 'Movies 🎥', NULL, NULL),
(5, 'Guitar 🎸', NULL, NULL),
(10, 'Music 🎵', NULL, '2024-05-01 23:35:40'),
(11, 'Pets 🐱', NULL, NULL),
(12, 'Testing', NULL, '2024-05-01 23:35:51'),
(18, 'meet up', NULL, NULL),
(19, 'Test', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `senderId` bigint(20) UNSIGNED NOT NULL,
  `receiverId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `senderId`, `receiverId`, `created_at`, `updated_at`) VALUES
(1, 70, 71, '2024-05-28 20:41:23', '2024-05-28 20:41:23'),
(2, 71, 70, '2024-05-28 23:24:37', '2024-05-28 23:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `conditions`
--

CREATE TABLE `conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `termsCondition` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conditions`
--

INSERT INTO `conditions` (`id`, `termsCondition`, `created_at`, `updated_at`) VALUES
(1, 'Terms of service can be just as important for mobile apps as they are for websites. Mobile app terms detail the rules and requirements that the user.1.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n2.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n3.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n4.\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n5.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n6)\n.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2024-03-14 22:54:32', '2024-05-16 23:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `couple_categories`
--

CREATE TABLE `couple_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `categorieName` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `couple_categories`
--

INSERT INTO `couple_categories` (`id`, `categorieName`, `created_at`, `updated_at`) VALUES
(2, 'drive', NULL, NULL),
(3, 'coffee', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `device_tokons`
--

CREATE TABLE `device_tokons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_tokons`
--

INSERT INTO `device_tokons` (`id`, `userId`, `token`, `created_at`, `updated_at`) VALUES
(2, 34, 'fFCcOPBXQ66DkLI1qhb4bf:APA91bFdUb336TjRDNMtXFkx9jk6LrsULtJdqg29TJAGleFvc_lx2WiFimmiEokulRKuYNQYh-XGqLJ8xY_VCGgFS8hlM-x0758S0_qDD8fkic4gWUNNLXm7uJ0SO8IJDAcQ92eMhlee', '2024-03-26 00:45:52', '2024-03-26 00:45:52'),
(3, 34, 'fCSfjuVRQUiWbbQxjLMLdX:APA91bF0qpnoVsXE0qjdD6zQ18ioS8Tt0PS902xospVHpS6KECCy_TodHeDmiLZG95H-FvY3-WK0py130u0Bhn1H121A8cjDsm-6ooCp1QU6fMGB_j-2qF0et8hPpMnnMUUyqfaGFQd3', '2024-03-26 00:56:47', '2024-03-26 00:56:47'),
(6, 39, 'fCSfjuVRQUiWbbQxjLMLdX:APA91bF0qpnoVsXE0qjdD6zQ18ioS8Tt0PS902xospVHpS6KECCy_TodHeDmiLZG95H-FvY3-WK0py130u0Bhn1H121A8cjDsm-6ooCp1QU6fMGB_j-2qF0et8hPpMnnMUUyqfaGFQd3', '2024-03-26 01:25:44', '2024-03-26 01:25:44'),
(7, 34, 'fyuidfVASoyO1C4kqHbFiq:APA91bFI8VIoeCzkjmcbTxWWVxLfF4mMMnh4YAJs3i4OCkVq62EpTLAkKR6hEWMcWXFbehecUt7UmPs7ZbXDZqeusvbgIRshrZqJ8IEcXcIUMVhjJpbvqhpuRN7vqL0QpzclWnhdu8dy', '2024-03-26 01:26:26', '2024-03-26 01:26:26'),
(8, 34, 'fANcTu02QB2vpD28MRRJBQ:APA91bHU0WSYCFTApE9VPyQswEC0joFtcROfewaQ3GvnGr3AA0rTXsp12y8OFNA1H3kQ0815QY8ImC6MJHHE8LG4lfXb2H2CnvFBThe77D2by-y1YBzP-TOA8WULT8AcVn3K574Nq2Yh', '2024-03-26 01:46:42', '2024-03-26 01:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `friendId` bigint(20) UNSIGNED NOT NULL,
  `chatId` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`id`, `userId`, `friendId`, `chatId`, `status`, `created_at`, `updated_at`) VALUES
(2, 71, 70, 2, 1, '2024-05-28 23:24:24', '2024-05-28 23:24:37');

-- --------------------------------------------------------

--
-- Table structure for table `f_a_q_s`
--

CREATE TABLE `f_a_q_s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faqQuestion` varchar(255) DEFAULT NULL,
  `faqAnswer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `f_a_q_s`
--

INSERT INTO `f_a_q_s` (`id`, `faqQuestion`, `faqAnswer`, `created_at`, `updated_at`) VALUES
(1, 'question 1', 'answer 1', '2024-03-12 00:27:06', '2024-05-21 01:55:10'),
(3, 'question 2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here,', '2024-03-14 22:09:03', '2024-05-21 01:56:15'),
(4, 'question 1', 'answer 1', '2024-05-14 23:14:24', '2024-05-14 23:14:24'),
(5, 'question 1', 'answer 1', '2024-05-14 23:14:29', '2024-05-14 23:14:29'),
(6, 'test', 'test', '2024-05-21 01:38:15', '2024-05-21 01:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `interests`
--

CREATE TABLE `interests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `interestId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `interests`
--

INSERT INTO `interests` (`id`, `userId`, `interestId`, `created_at`, `updated_at`) VALUES
(22, 29, 5, '2024-02-15 02:53:42', '2024-02-15 02:53:42'),
(25, 29, 11, '2024-02-15 02:53:42', '2024-02-15 02:53:42'),
(27, 29, 5, '2024-02-16 02:32:07', '2024-02-16 02:32:07'),
(30, 29, 3, '2024-02-16 02:32:07', '2024-02-16 02:32:07'),
(64, 35, 11, '2024-02-16 23:38:26', '2024-02-16 23:38:26'),
(67, 35, 10, '2024-02-16 23:38:26', '2024-02-16 23:38:26'),
(400, 32, 5, '2024-02-20 02:02:03', '2024-02-20 02:02:03'),
(410, 36, 5, '2024-02-20 02:09:22', '2024-02-20 02:09:22'),
(421, 37, 5, '2024-02-20 02:25:32', '2024-02-20 02:25:32'),
(437, 38, 10, '2024-02-20 02:48:37', '2024-02-20 02:48:37'),
(438, 38, 11, '2024-02-20 02:48:37', '2024-02-20 02:48:37'),
(583, 42, 2, '2024-03-23 00:13:06', '2024-03-23 00:13:06'),
(682, 52, 2, '2024-03-28 02:38:29', '2024-03-28 02:38:29'),
(683, 52, 3, '2024-03-28 02:38:29', '2024-03-28 02:38:29'),
(685, 52, 5, '2024-03-28 02:38:29', '2024-03-28 02:38:29'),
(701, 58, 5, '2024-03-28 05:07:51', '2024-03-28 05:07:51'),
(713, 59, 2, '2024-03-28 07:25:10', '2024-03-28 07:25:10'),
(715, 59, 5, '2024-03-28 07:25:10', '2024-03-28 07:25:10'),
(716, 59, 11, '2024-03-28 07:25:10', '2024-03-28 07:25:10'),
(718, 60, 5, '2024-03-29 00:08:03', '2024-03-29 00:08:03'),
(720, 60, 11, '2024-03-29 00:08:03', '2024-03-29 00:08:03'),
(721, 60, 10, '2024-03-29 00:08:03', '2024-03-29 00:08:03'),
(733, 65, 3, '2024-04-03 21:57:28', '2024-04-03 21:57:28'),
(735, 65, 10, '2024-04-03 21:57:28', '2024-04-03 21:57:28'),
(737, 34, 11, '2024-05-22 02:08:17', '2024-05-22 02:08:17'),
(738, 34, 10, '2024-05-22 02:08:17', '2024-05-22 02:08:17'),
(739, 34, 12, '2024-05-22 02:08:17', '2024-05-22 02:08:17'),
(740, 34, 5, '2024-05-22 02:08:17', '2024-05-22 02:08:17'),
(741, 67, 10, '2024-05-22 02:13:21', '2024-05-22 02:13:21'),
(742, 67, 11, '2024-05-22 02:13:21', '2024-05-22 02:13:21'),
(743, 67, 3, '2024-05-22 02:13:21', '2024-05-22 02:13:21'),
(744, 67, 5, '2024-05-22 02:13:21', '2024-05-22 02:13:21'),
(745, 67, 12, '2024-05-22 02:13:21', '2024-05-22 02:13:21'),
(746, 39, 2, '2024-05-22 18:06:55', '2024-05-22 18:06:55'),
(747, 39, 10, '2024-05-22 18:06:55', '2024-05-22 18:06:55'),
(753, 69, 2, '2024-05-24 02:18:50', '2024-05-24 02:18:50'),
(754, 69, 3, '2024-05-24 02:18:50', '2024-05-24 02:18:50'),
(755, 69, 5, '2024-05-24 02:18:50', '2024-05-24 02:18:50'),
(756, 69, 10, '2024-05-24 02:18:50', '2024-05-24 02:18:50'),
(757, 69, 11, '2024-05-24 02:18:50', '2024-05-24 02:18:50'),
(788, 71, 2, '2024-05-27 17:13:21', '2024-05-27 17:13:21'),
(789, 71, 3, '2024-05-27 17:13:21', '2024-05-27 17:13:21'),
(790, 71, 10, '2024-05-27 17:13:21', '2024-05-27 17:13:21'),
(791, 71, 11, '2024-05-27 17:13:21', '2024-05-27 17:13:21'),
(792, 71, 5, '2024-05-27 17:13:21', '2024-05-27 17:13:21'),
(813, 70, 18, '2024-05-29 17:21:41', '2024-05-29 17:21:41'),
(814, 70, 2, '2024-05-29 17:21:41', '2024-05-29 17:21:41'),
(815, 70, 5, '2024-05-29 17:21:41', '2024-05-29 17:21:41'),
(816, 70, 10, '2024-05-29 17:21:41', '2024-05-29 17:21:41'),
(817, 70, 3, '2024-05-29 17:21:41', '2024-05-29 17:21:41');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chatId` bigint(20) UNSIGNED NOT NULL,
  `senderId` bigint(20) UNSIGNED NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `messageType` varchar(255) DEFAULT NULL,
  `senderImage` varchar(255) DEFAULT NULL,
  `fileUrl` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `chatId`, `senderId`, `message`, `messageType`, `senderImage`, `fileUrl`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 70, NULL, NULL, NULL, NULL, NULL, '2024-05-28 20:41:23', '2024-05-28 20:41:23'),
(2, 2, 71, NULL, NULL, NULL, NULL, NULL, '2024-05-28 23:24:37', '2024-05-28 23:24:37'),
(3, 1, 70, 'hello', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-28 23:41:42', '2024-05-28 23:41:42'),
(4, 1, 70, 'how are you', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-28 23:41:49', '2024-05-28 23:41:49'),
(5, 1, 70, NULL, 'image', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', 'https://coupleskonnect.blownclouds.com/UploadImages/image-171693972421.jpg', NULL, '2024-05-28 23:42:04', '2024-05-28 23:42:04'),
(6, 1, 70, 'hey', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-29 00:01:37', '2024-05-29 00:01:37'),
(7, 1, 70, 'hi', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-29 00:42:35', '2024-05-29 00:42:35'),
(8, 1, 70, '123', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-29 00:42:53', '2024-05-29 00:42:53'),
(9, 1, 70, 'hey', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-29 00:48:58', '2024-05-29 00:48:58'),
(10, 1, 70, 'hey again', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-29 00:49:30', '2024-05-29 00:49:30'),
(11, 1, 70, 'hi', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-29 00:50:12', '2024-05-29 00:50:12'),
(12, 1, 70, 'hi again!', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-29 00:53:32', '2024-05-29 00:53:32'),
(13, 1, 70, 'hii', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-29 17:33:20', '2024-05-29 17:33:20'),
(14, 1, 70, 'Hey you got this for you and your dad and you 💕 me 💝 I don\'t know 😭 I don\'t have a car seat or anything else I can do for you and you can get the kids and you and you want to come over for dinner 🍽️', 'text', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716829294384.jpg', NULL, NULL, '2024-05-29 18:05:42', '2024-05-29 18:05:42'),
(15, 2, 70, 'hey 👋', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-29 18:10:29', '2024-05-29 18:10:29'),
(16, 2, 70, 'yo', 'text', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716829294384.jpg', NULL, NULL, '2024-05-29 19:29:13', '2024-05-29 19:29:13'),
(17, 1, 70, 'hi mate', 'text', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716829294384.jpg', NULL, NULL, '2024-05-30 21:41:18', '2024-05-30 21:41:18'),
(18, 1, 70, 'hey', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-05-30 21:41:54', '2024-05-30 21:41:54'),
(19, 1, 70, 'yo', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-06-03 22:45:40', '2024-06-03 22:45:40'),
(20, 1, 70, NULL, 'image', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', 'https://coupleskonnect.blownclouds.com/UploadImages/image-1717455157944.jpg', NULL, '2024-06-03 22:52:37', '2024-06-03 22:52:37'),
(21, 1, 70, '123', 'text', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716829294384.jpg', NULL, NULL, '2024-06-03 22:58:11', '2024-06-03 22:58:11'),
(22, 1, 70, 't', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-06-03 22:59:08', '2024-06-03 22:59:08'),
(23, 1, 70, 'g', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-06-03 23:07:23', '2024-06-03 23:07:23'),
(24, 1, 70, 'wassup 👋', 'text', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716829294384.jpg', NULL, NULL, '2024-06-03 23:07:39', '2024-06-03 23:07:39'),
(25, 1, 70, 'anybody there?', 'text', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', NULL, NULL, '2024-06-03 23:08:35', '2024-06-03 23:08:35'),
(26, 1, 70, NULL, 'image', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716829294384.jpg', 'https://coupleskonnect.blownclouds.com/UploadImages/image-1717456210220.jpg', NULL, '2024-06-03 23:10:10', '2024-06-03 23:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2023_10_19_192320_create_user_roles_table', 1),
(13, '2024_01_22_230410_create_couple_categories_table', 1),
(14, '2024_10_12_000000_create_users_table', 1),
(15, '2025_01_24_173935_create_partner_details_table', 1),
(18, '2024_01_29_195115_create_all_interests_table', 3),
(19, '2025_01_29_173655_create_interests_table', 4),
(20, '2025_02_01_165841_create_friend_requests_table', 5),
(21, '2025_02_01_165933_create_user_notifications_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `partner_details`
--

CREATE TABLE `partner_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupleId` bigint(20) UNSIGNED NOT NULL,
  `coupleName` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `profileImage` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `partner_details`
--

INSERT INTO `partner_details` (`id`, `coupleId`, `coupleName`, `age`, `gender`, `height`, `dob`, `profileImage`, `created_at`, `updated_at`) VALUES
(16, 1, 'bella', '23', 'Female', '5.4', '02/03/2024', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1707947610216.png', '2024-02-15 02:53:30', '2024-02-15 02:53:30'),
(19, 32, 'Rema', '23', 'male', '5.7', '05/14/2001', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708108251345.png', '2024-02-16 23:30:51', '2024-02-20 02:02:03'),
(20, 33, 'Lara croft', '22', 'female', '5.9', '02/12/2024', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708108535223.png', '2024-02-16 23:35:35', '2024-02-16 23:35:35'),
(21, 34, 'Rema Clark', '28', 'male', '9', '03/22/2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711504609823.jpg', '2024-02-16 23:37:22', '2024-03-27 05:56:49'),
(22, 35, 'Lara croft', '22', 'female', '5.9', '02/12/2024', 'https://coupleskonnect.blownclouds.com/partnerImage/image-170810869626.png', '2024-02-16 23:38:16', '2024-02-16 23:38:16'),
(23, 36, 'Rema', '23', 'male', '5.7', '05/14/2001', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708376669454.png', '2024-02-20 02:04:29', '2024-02-20 02:09:04'),
(24, 37, 'Rema', '23', 'male', '5.7', '05/14/2001', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708377069904.png', '2024-02-20 02:11:09', '2024-02-20 02:21:25'),
(25, 38, 'vcb', '34', 'female', '34', '02/11/2024', 'https://coupleskonnect.blownclouds.com/partnerImage/image-170837759256.png', '2024-02-20 02:19:52', '2024-02-20 02:19:52'),
(26, 39, 'Laura Patrick', '23', 'female', '6', '02/07/2024', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711507863824.jpg', '2024-02-20 02:56:51', '2024-03-27 06:51:03'),
(27, 40, 'Lara', '23', 'female', '5.7', '24-02-2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708624441575.png', '2024-02-22 22:54:01', '2024-02-22 22:54:01'),
(28, 41, 'Rebecca', '23', 'female', '5.7', '24-02-2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-170862508093.png', '2024-02-22 23:04:40', '2024-02-22 23:04:40'),
(29, 42, 'Anushka', '23', 'female', '5.7', '03/23/1995', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708625132829.png', '2024-02-22 23:05:32', '2024-03-23 00:13:06'),
(30, 43, 'Doli', '23', 'female', '5.7', '24-02-2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708626910262.png', '2024-02-22 23:35:10', '2024-02-22 23:35:10'),
(31, 44, 'Sarah', '22', 'female', '5.7', '24-02-2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708626975136.png', '2024-02-22 23:36:15', '2024-02-22 23:36:15'),
(32, 45, 'Sarah', '22', 'female', '5.7', '24-02-2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708627022382.png', '2024-02-22 23:37:02', '2024-02-22 23:37:02'),
(33, 46, 'Sarah', '22', 'female', '5.7', '24-02-2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708627072513.png', '2024-02-22 23:37:52', '2024-02-22 23:37:52'),
(34, 47, 'Sarah', '22', 'female', '5.7', '24-02-2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708627120405.png', '2024-02-22 23:38:40', '2024-02-22 23:38:40'),
(35, 48, 'Clara Nick', '28', 'female', '5.8', '02/06/1988', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1708899802986.jpg', '2024-02-26 03:23:22', '2024-02-26 03:23:22'),
(36, 49, 'BuBu', '20', 'non binary', '5.6', '03/08/1954', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1709846269598.jpg', '2024-03-08 02:17:49', '2024-03-08 02:17:49'),
(37, 50, 'Nikki', '25', 'female', '5.2', '03/28/2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711570025269.png', '2024-03-28 00:07:05', '2024-03-28 00:07:05'),
(38, 51, 'nikki', '25', 'female', '5', '03/28/2009', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711570728223.png', '2024-03-28 00:18:48', '2024-03-28 00:18:48'),
(39, 52, 'Nikki', '25', 'female', '5', '03/28/2009', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711571241667.png', '2024-03-28 00:27:21', '2024-03-28 00:27:21'),
(40, 53, 'Sarah', '22', 'female', '5.7', '24-02-2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711571872544.png', '2024-03-28 00:37:52', '2024-03-28 00:37:52'),
(41, 54, 'Sarah', '22', 'female', '5.7', '24-02-2000', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711577575439.png', '2024-03-28 02:12:55', '2024-03-28 02:12:55'),
(42, 55, 'Gena', '25', 'female', '5.4', '03/28/2005', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711581117176.jpg', '2024-03-28 03:11:57', '2024-03-28 03:11:57'),
(43, 56, 'Jordy', '21', 'male', '5', '03/28/2006', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711582360191.png', '2024-03-28 03:32:40', '2024-03-28 03:32:40'),
(45, 58, 'Zebronixe', '16', 'female', '5', '03/28/2008', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711588064602.jpg', '2024-03-28 05:07:44', '2024-03-28 05:07:44'),
(46, 59, 'becks', '29', 'female', '5.8', '03/28/1996', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711595176385.jpg', '2024-03-28 07:06:16', '2024-03-28 07:06:16'),
(47, 60, 'maria', '22', 'female', '152', '08/29/2001', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1711656472373.jpg', '2024-03-29 00:07:52', '2024-03-29 00:07:52'),
(52, 65, 'Rena', '39', 'female', '5.5', '01/16/1985', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1712167014393.jpg', '2024-04-03 21:56:54', '2024-04-03 21:56:54'),
(53, 66, 'Billy', '24', 'female', '5.5', '10/19/2011', 'https://coupleskonnect.blownclouds.com/partnerImage/image-171631852310.png', '2024-05-21 23:08:43', '2024-05-21 23:08:43'),
(54, 67, 'billie', '32', 'female', '4', '05/22/2012', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716329594817.png', '2024-05-22 02:13:14', '2024-05-22 02:13:14'),
(56, 69, 'fima', '25', 'female', '5.3', '05/04/2024', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716502716627.jpg', '2024-05-24 02:18:36', '2024-05-24 02:18:36'),
(57, 29, 'fima', '25', 'female', '5.3', '05/04/2024', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716502716627.jpg', '2024-05-24 02:18:36', '2024-05-24 02:18:36'),
(58, 70, 'hibo', '18', 'female', '5.1', '05/29/2002', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716829294384.jpg', '2024-05-27 17:01:34', '2024-05-29 01:31:29'),
(59, 71, 'Amara', '19', 'female', '5.3', '05/27/2005', 'https://coupleskonnect.blownclouds.com/partnerImage/image-1716829990629.jpg', '2024-05-27 17:13:10', '2024-05-27 17:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(3, 'App\\Models\\User', 3, 'User', '207d7593237ca0888561599bfbc4ada0bf4cade6f0aa0da0629382bfd747a769', '[\"*\"]', NULL, NULL, '2024-02-10 03:50:26', '2024-02-10 03:50:26'),
(4, 'App\\Models\\User', 4, 'User', 'b52f1637e535e2d7055dbe356305d2c30a46b18720baba52a59951bc6d8440c8', '[\"*\"]', NULL, NULL, '2024-02-10 05:03:59', '2024-02-10 05:03:59'),
(5, 'App\\Models\\User', 5, 'User', 'a99d2a29373a861914b99c526dd85fb10e4e605615d717c8fcd292deb3e3c548', '[\"*\"]', '2024-02-10 05:15:46', NULL, '2024-02-10 05:07:24', '2024-02-10 05:15:46'),
(7, 'App\\Models\\User', 6, 'User', '4215079152654cdffb11d209f89ef3e2bcc9f9b515ea19089a15ee26bf3b14d1', '[\"*\"]', NULL, NULL, '2024-02-10 05:46:42', '2024-02-10 05:46:42'),
(9, 'App\\Models\\User', 7, 'User', '7208726ad05108e79cc6d6cecb04b4c963fc5f0d7355888a3503f272fa968c0a', '[\"*\"]', NULL, NULL, '2024-02-10 05:48:42', '2024-02-10 05:48:42'),
(10, 'App\\Models\\User', 7, 'Admin', '53230dd0c56651a5374676f586ac24d14f9bd4a7f3b9a349cf55175149f4cbe5', '[\"*\"]', NULL, '2024-04-10 04:48:54', '2024-02-10 05:48:54', '2024-02-10 05:48:54'),
(11, 'App\\Models\\User', 7, 'Admin', '86c3da34b284e240a2d5ece0111a692e80219d01fb7958c890b61eca1f933f84', '[\"*\"]', NULL, '2024-04-10 04:49:06', '2024-02-10 05:49:06', '2024-02-10 05:49:06'),
(12, 'App\\Models\\User', 7, 'Admin', '32f3799ff286fcacf0872804e1a20ca7eb98f4a88d2fca11b307dfbf4cc9bd59', '[\"*\"]', NULL, '2024-04-10 04:53:40', '2024-02-10 05:53:40', '2024-02-10 05:53:40'),
(13, 'App\\Models\\User', 7, 'Admin', 'af2cafd930fa70bbc2573ade90c638ccb31de6169dc1e0b35e707a572cd60245', '[\"*\"]', NULL, '2024-04-10 04:57:44', '2024-02-10 05:57:44', '2024-02-10 05:57:44'),
(14, 'App\\Models\\User', 7, 'Admin', '7b9d413ef28705bf847b2413ecdf52b7481675f6d3e92a1631fadae367b86712', '[\"*\"]', NULL, '2024-04-12 20:25:18', '2024-02-12 21:25:18', '2024-02-12 21:25:18'),
(15, 'App\\Models\\User', 7, 'Admin', '0f45cc5b694fe33b8a82a944039f8fcf11f300cfb45f121560386f96de97ff39', '[\"*\"]', '2024-02-12 21:31:25', '2024-04-12 20:25:25', '2024-02-12 21:25:25', '2024-02-12 21:31:25'),
(16, 'App\\Models\\User', 7, 'Admin', '13de74f08268cfe6dc99ec47dc90fe9494179d409b491e23274cd5e36a1bd345', '[\"*\"]', '2024-02-12 21:33:37', '2024-04-12 20:32:50', '2024-02-12 21:32:50', '2024-02-12 21:33:37'),
(17, 'App\\Models\\User', 7, 'Admin', '23bc7ccc1f4ea01f50405adfa55a6071e1921d5e85ddd5698224301aa34f6b4f', '[\"*\"]', NULL, '2024-04-12 20:38:57', '2024-02-12 21:38:57', '2024-02-12 21:38:57'),
(18, 'App\\Models\\User', 7, 'Admin', '1e4e33b719659438e1b9f6a73c9aa0a73f821e1336f75bf596f0f5e63dfe3ee1', '[\"*\"]', NULL, '2024-04-12 20:39:40', '2024-02-12 21:39:40', '2024-02-12 21:39:40'),
(19, 'App\\Models\\User', 7, 'Admin', '8345a2c302ae82c23b107beecd7c55d6b13daaee80879b0ed9e64a4ce4594ef2', '[\"*\"]', NULL, '2024-04-12 20:50:26', '2024-02-12 21:50:26', '2024-02-12 21:50:26'),
(20, 'App\\Models\\User', 8, 'User', '7625a18e52cb7fcd19dd9635697864e140eca687468f49262f7d656ebc3b61a7', '[\"*\"]', NULL, NULL, '2024-02-12 21:59:14', '2024-02-12 21:59:14'),
(21, 'App\\Models\\User', 9, 'User', 'bdbca5959ed0a59bee5d4b5c84aa722d6c34f9b3d73a2ed730a37f1308a635ab', '[\"*\"]', NULL, NULL, '2024-02-12 22:11:10', '2024-02-12 22:11:10'),
(22, 'App\\Models\\User', 7, 'Admin', 'ea94b8b6af6a21171657508aa992b850cf6d60053857dad0fd77577ef2794e5a', '[\"*\"]', '2024-02-13 01:51:17', '2024-04-12 21:49:05', '2024-02-12 22:49:05', '2024-02-13 01:51:17'),
(23, 'App\\Models\\User', 7, 'Admin', 'f578e699e5103ecd145456a537fef66a1e5df8519999ce20237e74c8527756ff', '[\"*\"]', NULL, '2024-04-13 20:31:04', '2024-02-13 21:31:04', '2024-02-13 21:31:04'),
(24, 'App\\Models\\User', 13, 'Couple Konnects', 'd2839e881ca53bd95dc950c4215fab1ed2ae7cbf614b937e6b0ee73bac3badb4', '[\"*\"]', NULL, NULL, '2024-02-14 01:00:01', '2024-02-14 01:00:01'),
(25, 'App\\Models\\User', 14, 'Couple Konnects', '91d467add3448754cf0560fe94032c6194512e40eab14cce4700685cbc9bf348', '[\"*\"]', NULL, NULL, '2024-02-14 01:28:24', '2024-02-14 01:28:24'),
(26, 'App\\Models\\User', 16, 'Couple Konnects', '50417d6839ac713fec4a12def2e2756b5a8b856e9cc48f03df746d66b35adc96', '[\"*\"]', NULL, NULL, '2024-02-14 01:58:25', '2024-02-14 01:58:25'),
(27, 'App\\Models\\User', 17, 'Couple Konnects', '6791123096ecc0e3b9bf3729d3b8ae90dc7d0569630ae272349b0b3e01a0d020', '[\"*\"]', NULL, NULL, '2024-02-14 02:04:07', '2024-02-14 02:04:07'),
(28, 'App\\Models\\User', 18, 'Couple Konnects', '09209b69f472f6ec8955a5e7753e569d85ae7e8198b4aa116a8387de9bc548a8', '[\"*\"]', NULL, NULL, '2024-02-14 02:06:00', '2024-02-14 02:06:00'),
(29, 'App\\Models\\User', 19, 'Couple Konnects', '16bd046ae30c9998c83e625bd0baab944104d2d1037ed9f95e92a69118c43013', '[\"*\"]', NULL, NULL, '2024-02-14 02:11:13', '2024-02-14 02:11:13'),
(30, 'App\\Models\\User', 20, 'Couple Konnects', '55728a3ab0e0fd775532246227251d75cba3ab7840b7b082ebadc9f25908a96c', '[\"*\"]', NULL, NULL, '2024-02-14 02:12:42', '2024-02-14 02:12:42'),
(31, 'App\\Models\\User', 21, 'Couple Konnects', '3af277ebb0d953d1c7c8ceb7e894d630148394372200727f660fa7b7ca8825be', '[\"*\"]', '2024-02-14 05:33:01', NULL, '2024-02-14 02:14:33', '2024-02-14 05:33:01'),
(32, 'App\\Models\\User', 22, 'Couple Konnects', 'd3301a46776fbd699b19bfc5c0fd292134d19c2039e979b2d7e8417fa3db60dc', '[\"*\"]', NULL, NULL, '2024-02-14 02:15:50', '2024-02-14 02:15:50'),
(33, 'App\\Models\\User', 23, 'Couple Konnects', 'edcdcae6dde64fb3b058d4f6ef8f2d634e76854eda18df3606f9690b93d5f3df', '[\"*\"]', NULL, NULL, '2024-02-14 02:30:22', '2024-02-14 02:30:22'),
(34, 'App\\Models\\User', 24, 'Couple Konnects', '0ce9b1ae2c047ca0fcb479ef2005f70552ccc8452058e2f9e90be09f63c28f90', '[\"*\"]', NULL, NULL, '2024-02-14 02:32:09', '2024-02-14 02:32:09'),
(35, 'App\\Models\\User', 25, 'Couple Konnects', '5dddeb13dbfaf499bb6457b30b5f51e514657d377247385ad8ae187d4d25d240', '[\"*\"]', '2024-02-15 01:04:16', NULL, '2024-02-14 03:06:10', '2024-02-15 01:04:16'),
(36, 'App\\Models\\User', 26, 'Couple Konnects', '1cc266ae072ceec0716f5776155011c9c7a4e9eeb779d7bdf3d0a5b27738e830', '[\"*\"]', NULL, NULL, '2024-02-14 03:33:14', '2024-02-14 03:33:14'),
(37, 'App\\Models\\User', 27, 'Couple Konnects', '6292845d01f7928a8e326e04f4b3fb7867b2137075ddeedae56f8780eb18bbd3', '[\"*\"]', '2024-02-15 00:28:54', NULL, '2024-02-14 22:46:32', '2024-02-15 00:28:54'),
(39, 'App\\Models\\User', 29, 'Couple Konnects', '5546dae6581089973cc87d961d6cc84e8396cb8967db06915f7fbf4e216aa003', '[\"*\"]', '2024-02-16 06:17:12', NULL, '2024-02-15 02:53:30', '2024-02-16 06:17:12'),
(40, 'App\\Models\\User', 7, 'Couple Konnects', 'ced1db11339a1d08af0bd5d5202672575b0c0006ca838aae14138723f373d222', '[\"*\"]', '2024-02-16 04:05:11', NULL, '2024-02-16 04:04:40', '2024-02-16 04:05:11'),
(41, 'App\\Models\\User', 29, 'Couple Konnects', '7aa1231c99c96c8de2ffa1cefa7198416d3a726b121dc77ecae865699211caaa', '[\"*\"]', '2024-02-16 04:05:54', NULL, '2024-02-16 04:05:37', '2024-02-16 04:05:54'),
(42, 'App\\Models\\User', 7, 'Couple Konnects', 'e75964b8ca4f2c811eb07e6d19ce3bc2d300040cbee6934fa3bbdcc1fadeeb7e', '[\"*\"]', '2024-02-16 04:15:52', NULL, '2024-02-16 04:15:07', '2024-02-16 04:15:52'),
(104, 'App\\Models\\User', 32, 'Couple Konnects', 'd1b45e9aa11bb7532ae9168308af7f1ef9c1bc6125e8cab037a29adbe35f9289', '[\"*\"]', '2024-02-20 02:02:03', NULL, '2024-02-20 02:01:22', '2024-02-20 02:02:03'),
(109, 'App\\Models\\User', 37, 'Couple Konnects', '2db2cbf46af3fc98639be6cd383d63dd574a1e74710bfa00e8cfb1dee1f7c173', '[\"*\"]', NULL, NULL, '2024-02-20 02:11:09', '2024-02-20 02:11:09'),
(111, 'App\\Models\\User', 37, 'Couple Konnects', 'fb6dd5c203f7af709c4fd3dcebf93dc4b2273f0c2349cc37fe3e923931fbfca7', '[\"*\"]', '2024-02-20 02:25:32', NULL, '2024-02-20 02:21:01', '2024-02-20 02:25:32'),
(112, 'App\\Models\\User', 37, 'Couple Konnects', '0124e32834f1ee612dc67f22bf487177de0c9471bd588bae8e2acd02bcb3e89f', '[\"*\"]', NULL, NULL, '2024-02-20 02:46:40', '2024-02-20 02:46:40'),
(155, 'App\\Models\\User', 40, 'Couple Konnects', 'ec2cb5f5d1fc2b69d3ac056c4da70e35f40e01c428c7d830795c5c8e4ec56363', '[\"*\"]', NULL, NULL, '2024-02-22 22:54:01', '2024-02-22 22:54:01'),
(158, 'App\\Models\\User', 43, 'Couple Konnects', '91ea9a4849ff20dbe72ff742e0baf327ec4e783aab696c58a8411e252016c8f4', '[\"*\"]', NULL, NULL, '2024-02-22 23:35:10', '2024-02-22 23:35:10'),
(160, 'App\\Models\\User', 45, 'Couple Konnects', '3f1e2ea976ee44938fc55a1c9185ce4200fbc4b35b1fc2540ef2fe9fddff01be', '[\"*\"]', NULL, NULL, '2024-02-22 23:37:02', '2024-02-22 23:37:02'),
(161, 'App\\Models\\User', 46, 'Couple Konnects', '750789478fbd4d6eb2e4847aa0593294cb3302223ad75721cd1d601dd99a7867', '[\"*\"]', NULL, NULL, '2024-02-22 23:37:52', '2024-02-22 23:37:52'),
(165, 'App\\Models\\User', 43, 'Couple Konnects', '8cc1ab7e9d167fc20f8575d7c7e2a76cc2719ea7f7b73623ba130b3002012098', '[\"*\"]', '2024-02-23 04:04:25', NULL, '2024-02-23 04:04:08', '2024-02-23 04:04:25'),
(168, 'App\\Models\\User', 48, 'Couple Konnects', '902a5cf42ff2e62b62ad0e0c91120a80b969351326d250960a5ec855b995792c', '[\"*\"]', NULL, NULL, '2024-02-26 03:23:22', '2024-02-26 03:23:22'),
(169, 'App\\Models\\User', 43, 'Couple Konnects', '9b633bb0a67b105a823d94fc08d4f47908f2c15b91aff565f89e45f3341b2d0c', '[\"*\"]', '2024-02-27 03:01:53', NULL, '2024-02-27 03:01:33', '2024-02-27 03:01:53'),
(174, 'App\\Models\\User', 43, 'Couple Konnects', '31272ec9280116b7bda52cecd0080a7157f7cf890e1ca2b21f6d3c6bb9422ded', '[\"*\"]', NULL, NULL, '2024-03-04 22:33:19', '2024-03-04 22:33:19'),
(176, 'App\\Models\\User', 40, 'Couple Konnects', 'ce61bc8b23ecd676b561d91290d0a11a283f753971a98115f6579520419184c1', '[\"*\"]', '2024-03-07 02:17:00', NULL, '2024-03-06 05:36:34', '2024-03-07 02:17:00'),
(177, 'App\\Models\\User', 40, 'Couple Konnects', 'e39cf27b2974689b7fa4fbe2f5449f8fdd3955e892cc5cf25925718c601c541d', '[\"*\"]', '2024-03-07 02:18:09', NULL, '2024-03-07 02:17:12', '2024-03-07 02:18:09'),
(186, 'App\\Models\\User', 49, 'Couple Konnects', 'f26d36191c54efc2a4e43f38faae70f1b0f4430a3848e55b42aee376bf16376a', '[\"*\"]', NULL, NULL, '2024-03-08 02:17:49', '2024-03-08 02:17:49'),
(193, 'App\\Models\\User', 31, 'Couple Konnects', 'b97696376db371229c164c5b250569f6a337bbfe0622fa57a51557a6e06419c0', '[\"*\"]', '2024-03-09 04:56:18', NULL, '2024-03-09 04:56:07', '2024-03-09 04:56:18'),
(205, 'App\\Models\\User', 31, 'Couple Konnects', '8530317033aa74fd0ab288fd5862fc4728cc4204eb1c7a5e6ee1296e4938043c', '[\"*\"]', NULL, NULL, '2024-03-18 06:59:00', '2024-03-18 06:59:00'),
(206, 'App\\Models\\User', 31, 'Couple Konnects', 'fbb128717ebdbd3acf125eb7790f457394a1c8373326641e87333ea520bbb756', '[\"*\"]', NULL, NULL, '2024-03-18 07:07:55', '2024-03-18 07:07:55'),
(207, 'App\\Models\\User', 31, 'Couple Konnects', '3db3ef46a06f3f5a113ed60e6fa158c349030fbbbc2702e8604b0417774958ca', '[\"*\"]', '2024-03-18 13:39:34', NULL, '2024-03-18 07:09:43', '2024-03-18 13:39:34'),
(219, 'App\\Models\\User', 31, 'Couple Konnects', '7e57d01fdce2f534ebe8fa3489df6691c1b27230294966979f1905831e26e93e', '[\"*\"]', '2024-03-18 23:57:21', NULL, '2024-03-18 22:29:42', '2024-03-18 23:57:21'),
(283, 'App\\Models\\User', 42, 'Couple Konnects', 'd05d8bd257801fcf3e9a273399197b5ea60fbd9f11ebcddf0e35b83480e67f05', '[\"*\"]', NULL, NULL, '2024-03-25 22:07:39', '2024-03-25 22:07:39'),
(292, 'App\\Models\\User', 42, 'Couple Konnects', 'f674c534571e4a48a589eccc63d03159129d1232971504236af2e06aa3e800b2', '[\"*\"]', NULL, NULL, '2024-03-25 23:47:16', '2024-03-25 23:47:16'),
(353, 'App\\Models\\User', 50, 'Couple Konnects', '229dc566c401770c8c21e28fef62300da101a5d7e0d03fa7b83c2ed39f99b699', '[\"*\"]', NULL, NULL, '2024-03-28 00:07:05', '2024-03-28 00:07:05'),
(355, 'App\\Models\\User', 51, 'Couple Konnects', '10277a82841c2622ec8e0826f25f856584b900c711fd94d85127f96b67793c10', '[\"*\"]', NULL, NULL, '2024-03-28 00:18:48', '2024-03-28 00:18:48'),
(374, 'App\\Models\\User', 54, 'Couple Konnects', '4e7cd6f5f39f1dc4271d84714e58fb48cfe50c8cfbe0ea625d7190b9a5db66f8', '[\"*\"]', NULL, NULL, '2024-03-28 02:12:55', '2024-03-28 02:12:55'),
(378, 'App\\Models\\User', 56, 'Couple Konnects', '48a5c987648576c1a350997e03fdbda4320145e5300fc709ab0ee2013efb4f86', '[\"*\"]', NULL, NULL, '2024-03-28 03:32:40', '2024-03-28 03:32:40'),
(399, 'App\\Models\\User', 60, 'Couple Konnects', '46ff564783d62cba59014146d08542f416d77282b732fe4b381c1541e351a405', '[\"*\"]', '2024-03-29 00:08:03', NULL, '2024-03-29 00:07:52', '2024-03-29 00:08:03'),
(400, 'App\\Models\\User', 60, 'Couple Konnects', 'cf391fe780e4a26e59cdf2fc22690ac8e8685a0864ecfd2b88d6062544af279c', '[\"*\"]', '2024-04-10 17:46:40', NULL, '2024-03-29 00:08:14', '2024-04-10 17:46:40'),
(407, 'App\\Models\\User', 62, 'Couple Konnects', 'ca282f744c569b7370f27ff64efe4c30a59da9e77b10c333c2b8e777afe2ff9b', '[\"*\"]', NULL, NULL, '2024-04-02 23:05:55', '2024-04-02 23:05:55'),
(408, 'App\\Models\\User', 63, 'Couple Konnects', 'ad0d1f0997354d0b13d311dd2d310a9ade2c3eac41846ecbbd4087ec4cb9c809', '[\"*\"]', NULL, NULL, '2024-04-02 23:07:03', '2024-04-02 23:07:03'),
(412, 'App\\Models\\User', 65, 'Couple Konnects', '06e238bf4a4072636135a57ab484439cef3040c534e07f6f8cb087fd691bd68f', '[\"*\"]', '2024-04-03 21:57:28', NULL, '2024-04-03 21:56:54', '2024-04-03 21:57:28'),
(413, 'App\\Models\\User', 65, 'Couple Konnects', 'e304aad8b7882b7cf490a16f4ab0cfde45a27d7917b4c9a08cd5179ef9d259b3', '[\"*\"]', '2024-04-25 13:02:54', NULL, '2024-04-03 21:57:39', '2024-04-25 13:02:54'),
(459, 'App\\Models\\User', 1, 'Couple Konnects', 'dca360005e1e96cc08a2841a492b4c483a70b7b8cb7730a4b4006de3fb695426', '[\"*\"]', NULL, NULL, '2024-05-14 23:04:39', '2024-05-14 23:04:39'),
(460, 'App\\Models\\User', 53, 'Couple Konnects', '25ae433bf22fb6ef3440b1c584b6480740d23082c872d8980c86bf1386344427', '[\"*\"]', '2024-05-24 01:57:00', NULL, '2024-05-14 23:14:02', '2024-05-24 01:57:00'),
(461, 'App\\Models\\User', 1, 'Couple Konnects', '2124f3e21be912f494a820afe7651e4dc9627151119646a70791185ce649bc1e', '[\"*\"]', NULL, NULL, '2024-05-16 21:05:00', '2024-05-16 21:05:00'),
(462, 'App\\Models\\User', 1, 'Couple Konnects', '2688b7fed65faa43e4e38c05686687b80cd806b715608d1e58dd173a34d240ba', '[\"*\"]', '2024-05-16 22:41:28', NULL, '2024-05-16 21:05:04', '2024-05-16 22:41:28'),
(463, 'App\\Models\\User', 1, 'Couple Konnects', '243a4fc3727c62b8a325f9091292e5136e49a6f4001c092686987c9265c58805', '[\"*\"]', '2024-05-17 04:20:45', NULL, '2024-05-16 22:42:04', '2024-05-17 04:20:45'),
(464, 'App\\Models\\User', 1, 'Couple Konnects', 'fa51214fdd6b2aa8d80ca9f52aeb3998a8440eb96a00d0bd09f8a79cc935a86a', '[\"*\"]', NULL, NULL, '2024-05-17 21:54:41', '2024-05-17 21:54:41'),
(465, 'App\\Models\\User', 1, 'Couple Konnects', '31810124929cb440882068318d75c7e9f38c00a92f368659763674960ac24864', '[\"*\"]', '2024-05-18 03:20:22', NULL, '2024-05-17 21:54:44', '2024-05-18 03:20:22'),
(466, 'App\\Models\\User', 1, 'Couple Konnects', '3acba79f98b8a2ab8abb7dbff3c65c6c8ea4928fda25420a9b0ee7d117abef33', '[\"*\"]', '2024-05-18 03:35:09', NULL, '2024-05-18 03:29:24', '2024-05-18 03:35:09'),
(467, 'App\\Models\\User', 1, 'Couple Konnects', '3f7d5fec26eaeddb8508891c42ff635b068083908099419f65fd918d60221635', '[\"*\"]', NULL, NULL, '2024-05-20 21:02:41', '2024-05-20 21:02:41'),
(468, 'App\\Models\\User', 1, 'Couple Konnects', '9b5844951ae5896756d728ad19e04f19175bf106f171a48fa18ce78c39b97625', '[\"*\"]', '2024-05-21 04:20:40', NULL, '2024-05-20 21:02:41', '2024-05-21 04:20:40'),
(469, 'App\\Models\\User', 1, 'Couple Konnects', '306e57711140444163777bdd1e5a2266e48a3c90c8235243fa92b63732c48471', '[\"*\"]', '2024-05-21 03:37:33', NULL, '2024-05-21 03:37:04', '2024-05-21 03:37:33'),
(470, 'App\\Models\\User', 1, 'Couple Konnects', 'af255159dd7e58fe056012694bea1c51b264e1878bdc2b1255d84f99ccea1c7e', '[\"*\"]', NULL, NULL, '2024-05-21 04:21:31', '2024-05-21 04:21:31'),
(471, 'App\\Models\\User', 1, 'Couple Konnects', '6aed19c2956b90761b517777113c8c6986caa88571a389a3d47eebfa00b23091', '[\"*\"]', '2024-05-21 04:24:18', NULL, '2024-05-21 04:21:35', '2024-05-21 04:24:18'),
(472, 'App\\Models\\User', 1, 'Couple Konnects', '64bd5be7ae60719f0663cbeeaec674d99e12e7bca981ade0883f41f13671c812', '[\"*\"]', '2024-05-21 05:07:23', NULL, '2024-05-21 04:24:52', '2024-05-21 05:07:23'),
(473, 'App\\Models\\User', 1, 'Couple Konnects', '0005cfe0e89f954faa882f86132a5621a8b4df885a791fbdfbbf5b6cfaa47dbc', '[\"*\"]', NULL, NULL, '2024-05-21 20:45:58', '2024-05-21 20:45:58'),
(474, 'App\\Models\\User', 1, 'Couple Konnects', '13187b0d02ade0a1b171adda8b99d99517b1a6c58e73e0dd8ad83e7c5eddd506', '[\"*\"]', '2024-05-22 04:52:03', NULL, '2024-05-21 20:46:03', '2024-05-22 04:52:03'),
(475, 'App\\Models\\User', 1, 'Couple Konnects', '093eee891801e8e6795f3155a9d5a706e7e86913ac9b8c092c08298915d13b4a', '[\"*\"]', '2024-05-21 21:09:58', NULL, '2024-05-21 21:02:30', '2024-05-21 21:09:58'),
(478, 'App\\Models\\User', 66, 'Couple Konnects', '1cb9650ad5bd2166724c443343969631d699e788ffda729de547eb9e65030fb1', '[\"*\"]', NULL, NULL, '2024-05-21 23:08:43', '2024-05-21 23:08:43'),
(484, 'App\\Models\\User', 34, 'Couple Konnects', 'c6623d79d23ee0036b2606882539f0c90a8023e018c3cd4ed8abaf65608b670a', '[\"*\"]', '2024-05-22 02:50:53', NULL, '2024-05-22 02:49:44', '2024-05-22 02:50:53'),
(485, 'App\\Models\\User', 39, 'Couple Konnects', 'cffab258148db65a2663c553059f5941062bcb2e87b3dcace13f3310b818ae02', '[\"*\"]', '2024-05-24 21:38:40', NULL, '2024-05-22 18:05:01', '2024-05-24 21:38:40'),
(486, 'App\\Models\\User', 1, 'Couple Konnects', '773fafa570d7333082e1e2bbb2b27812adbb71f1a855124e7172b2da0c97e665', '[\"*\"]', '2024-05-22 22:37:34', NULL, '2024-05-22 21:28:58', '2024-05-22 22:37:34'),
(487, 'App\\Models\\User', 1, 'Couple Konnects', 'ae5bec3da49f26a9dd2b5779d721b5488228104b26ca658073c1c4c9148ae999', '[\"*\"]', '2024-05-22 22:52:42', NULL, '2024-05-22 22:47:30', '2024-05-22 22:52:42'),
(488, 'App\\Models\\User', 1, 'Couple Konnects', 'f5db2746257b554ed8203d95f98f148ad8f86799389a3f11ea30cf3bf5998366', '[\"*\"]', '2024-05-22 23:39:06', NULL, '2024-05-22 23:32:52', '2024-05-22 23:39:06'),
(492, 'App\\Models\\User', 1, 'Couple Konnects', '9231193d5de5d5d25f6f45e62977183adb15fd565a3f0224093169c39147aaf8', '[\"*\"]', '2024-05-24 02:58:20', NULL, '2024-05-23 21:30:47', '2024-05-24 02:58:20'),
(494, 'App\\Models\\User', 1, 'Couple Konnects', 'b8264d2686ce543601a295ab3cece157b11716a418d24460d1626f8eca6058af', '[\"*\"]', '2024-05-24 00:51:29', NULL, '2024-05-24 00:48:31', '2024-05-24 00:51:29'),
(495, 'App\\Models\\User', 1, 'Couple Konnects', '5d9a4707bfbb2389080f0ec5f873c1538847783a5ec39485060ce42875a86839', '[\"*\"]', '2024-05-24 01:22:29', NULL, '2024-05-24 01:16:02', '2024-05-24 01:22:29'),
(501, 'App\\Models\\User', 34, 'Couple Konnects', 'c8e9321ff38fda0c7e637ab6b21f51ecdd05e31de316dc16c90c3b9871714f45', '[\"*\"]', '2024-05-24 02:50:12', NULL, '2024-05-24 02:49:03', '2024-05-24 02:50:12'),
(504, 'App\\Models\\User', 1, 'Couple Konnects', 'e3ffebc041af1287c19e654569b8a7baaf0a3202a9e08fda841612c291a7672e', '[\"*\"]', NULL, NULL, '2024-05-24 03:18:19', '2024-05-24 03:18:19'),
(505, 'App\\Models\\User', 1, 'Couple Konnects', '40a6f7f9ae51b8d22c8446d99161b9766d6b04b25cfa21ce2a3def93f23a01b5', '[\"*\"]', '2024-05-24 04:30:59', NULL, '2024-05-24 03:18:20', '2024-05-24 04:30:59'),
(511, 'App\\Models\\User', 1, 'Couple Konnects', 'cd93b08879c919c5a2905066da5ab5e4fdd0647306a14b4f62fb272acd18c55a', '[\"*\"]', '2024-05-24 20:11:09', NULL, '2024-05-24 21:02:50', '2024-05-24 20:11:09'),
(523, 'App\\Models\\User', 68, 'Couple Konnects', '50608bed961cebea468ca57678e44969df55a7daff0f5b0f99245c7fe80ed9ba', '[\"*\"]', '2024-05-24 18:32:12', NULL, '2024-05-24 18:29:47', '2024-05-24 18:32:12'),
(524, 'App\\Models\\User', 68, 'Couple Konnects', 'd6ac06395325efd4e8eceda35f68514ee0ef8513ff400fc22e8db548c5ce8bf8', '[\"*\"]', '2024-05-24 18:31:23', NULL, '2024-05-24 18:31:20', '2024-05-24 18:31:23'),
(525, 'App\\Models\\User', 1, 'Couple Konnects', '5a062e117143bfb524d64c64626b70e88615473bbf33740e17480d405de91736', '[\"*\"]', '2024-05-24 19:42:18', NULL, '2024-05-24 19:00:36', '2024-05-24 19:42:18'),
(542, 'App\\Models\\User', 1, 'Couple Konnects', '5dbd65fa9124f6efee9381684850748ab17d860f662906d988d7665a71140610', '[\"*\"]', NULL, NULL, '2024-05-28 19:09:35', '2024-05-28 19:09:35'),
(547, 'App\\Models\\User', 71, 'Couple Konnects', 'e62bb7c3314e35bd51112c7cd3a5ebf60c5a577b57e8cb802d2f4ccba7c3b71a', '[\"*\"]', '2024-05-28 23:24:44', NULL, '2024-05-28 20:35:24', '2024-05-28 23:24:44'),
(550, 'App\\Models\\User', 71, 'Couple Konnects', '2452291ad832a820bc2a8138341a2a0843ede0ab024df98016766e0823ab8c59', '[\"*\"]', '2024-05-28 23:18:05', NULL, '2024-05-28 23:17:59', '2024-05-28 23:18:05'),
(554, 'App\\Models\\User', 71, 'Couple Konnects', '4e96ee39056c62b38be4337375144b700f6a3ab613b2efaf97bb92c063700b68', '[\"*\"]', '2024-05-28 23:21:55', NULL, '2024-05-28 23:21:22', '2024-05-28 23:21:55'),
(558, 'App\\Models\\User', 71, 'Couple Konnects', 'a7ef6abf1f9fb53f207b25a6fcc9c983093499df88bc2ca13eb29cffa22826cc', '[\"*\"]', '2024-05-28 23:30:48', NULL, '2024-05-28 23:22:51', '2024-05-28 23:30:48'),
(559, 'App\\Models\\User', 71, 'Couple Konnects', '46a7c9a9a57f5a1105d846c8b01cb6bcb9a99e4e2eec1def3a597379ad8a48d0', '[\"*\"]', '2024-05-29 00:01:44', NULL, '2024-05-29 00:00:10', '2024-05-29 00:01:44'),
(561, 'App\\Models\\User', 1, 'Couple Konnects', '9e8db33d0a38716b0445e9480f3270859b4b947e9ef681d8b743bee9c8c7ca97', '[\"*\"]', '2024-05-29 22:02:56', NULL, '2024-05-29 17:28:24', '2024-05-29 22:02:56'),
(563, 'App\\Models\\User', 1, 'Couple Konnects', '6767a0075df0aa4565b4abea427d450e7fab03a981e29f866b8f2651fb60ef3f', '[\"*\"]', NULL, NULL, '2024-05-30 17:48:18', '2024-05-30 17:48:18'),
(564, 'App\\Models\\User', 1, 'Couple Konnects', '31e3c41158bbc8c28e3d909ce97977c013de5ab2031ee29027e7fe7a74878b6c', '[\"*\"]', '2024-05-31 00:36:29', NULL, '2024-05-30 17:48:23', '2024-05-31 00:36:29'),
(566, 'App\\Models\\User', 1, 'Couple Konnects', 'b40bc0df2bb9d9a671c73be12f0630e0f1920b089a167dd1c6879c1e66d690aa', '[\"*\"]', '2024-05-31 23:18:13', NULL, '2024-05-31 17:39:28', '2024-05-31 23:18:13'),
(567, 'App\\Models\\User', 1, 'Couple Konnects', '2289a3141813ec4be01e27c72e8afa7364739bc7c9c9bd8b452fadca2d1fa898', '[\"*\"]', NULL, NULL, '2024-06-03 17:20:07', '2024-06-03 17:20:07'),
(568, 'App\\Models\\User', 1, 'Couple Konnects', 'e0b24d36cd15921292d7febcd19ea1551eeef71ae7b3ec9251b7c5dd332d053a', '[\"*\"]', NULL, NULL, '2024-06-03 21:26:13', '2024-06-03 21:26:13'),
(569, 'App\\Models\\User', 1, 'Couple Konnects', 'bed9fd9ade50ef47847eecfeee793b9baef2460b23c515989b8098e03bea03df', '[\"*\"]', '2024-06-03 21:26:33', NULL, '2024-06-03 21:26:17', '2024-06-03 21:26:33'),
(570, 'App\\Models\\User', 1, 'Couple Konnects', 'f685560caa42abbf205d9916ca478e7313ad39f2afcdb9d696990f9fe5f00934', '[\"*\"]', NULL, NULL, '2024-06-03 21:41:21', '2024-06-03 21:41:21'),
(571, 'App\\Models\\User', 1, 'Couple Konnects', 'a516c19a12a5d19b4df322fa169d6d9816e7c761fc14f3e2add4f021b6fade8c', '[\"*\"]', '2024-06-03 22:04:35', NULL, '2024-06-03 21:41:22', '2024-06-03 22:04:35'),
(572, 'App\\Models\\User', 1, 'Couple Konnects', '8ca5c1110dc942d39cea4ba85ce690c5e7b9faa9e0a4730d7d20375a66e5c359', '[\"*\"]', NULL, NULL, '2024-06-03 23:33:53', '2024-06-03 23:33:53'),
(573, 'App\\Models\\User', 1, 'Couple Konnects', 'b9f6c29eb8f1f9d74d4c47625bfdcef177939a6cd72b0e44f23c75ff00688722', '[\"*\"]', '2024-06-03 23:50:10', NULL, '2024-06-03 23:48:36', '2024-06-03 23:50:10'),
(574, 'App\\Models\\User', 1, 'Couple Konnects', 'e962dacc18c08f5e48d48c8324b36359266b9a5faacbca46552b4ccc90f599ac', '[\"*\"]', '2024-06-04 00:48:26', NULL, '2024-06-03 23:49:12', '2024-06-04 00:48:26'),
(575, 'App\\Models\\User', 1, 'Couple Konnects', '98523a6873b5207b6c686a41eafd6c2fcfce25b60cc30c3f718226ce59a25d58', '[\"*\"]', NULL, NULL, '2024-06-04 00:33:54', '2024-06-04 00:33:54'),
(576, 'App\\Models\\User', 1, 'Couple Konnects', 'bfcad05e454dda39a9b9ac7b42a1c2604db152f9f140597c03f5e6a2acc1babd', '[\"*\"]', '2024-06-04 00:42:56', NULL, '2024-06-04 00:41:00', '2024-06-04 00:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policies`
--

CREATE TABLE `privacy_policies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `addPolicy` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privacy_policies`
--

INSERT INTO `privacy_policies` (`id`, `addPolicy`, `created_at`, `updated_at`) VALUES
(2, '1)\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.\n2)\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.\n3)\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.\n4)\nIn publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.', '2024-05-16 22:43:21', '2024-06-04 00:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `profile_views`
--

CREATE TABLE `profile_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `viewBy` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profile_views`
--

INSERT INTO `profile_views` (`id`, `viewBy`, `userId`, `created_at`, `updated_at`) VALUES
(1, 34, 39, '2024-03-26 22:50:41', '2024-03-26 22:50:41'),
(2, 39, 39, '2024-03-26 22:53:11', '2024-03-26 22:53:11'),
(3, 34, 48, '2024-03-27 03:08:58', '2024-03-27 03:08:58'),
(4, 34, 48, '2024-03-27 03:14:25', '2024-03-27 03:14:25'),
(5, 34, 39, '2024-03-27 03:49:58', '2024-03-27 03:49:58'),
(6, 39, 34, '2024-03-27 05:36:05', '2024-03-27 05:36:05'),
(7, 39, 34, '2024-03-27 05:36:22', '2024-03-27 05:36:22'),
(8, 39, 34, '2024-03-27 05:36:24', '2024-03-27 05:36:24'),
(9, 39, 34, '2024-03-27 05:36:36', '2024-03-27 05:36:36'),
(10, 39, 34, '2024-03-27 05:37:01', '2024-03-27 05:37:01'),
(11, 39, 34, '2024-03-27 05:37:59', '2024-03-27 05:37:59'),
(12, 39, 34, '2024-03-27 05:38:23', '2024-03-27 05:38:23'),
(13, 39, 34, '2024-03-27 05:42:32', '2024-03-27 05:42:32'),
(14, 34, 39, '2024-03-27 06:51:38', '2024-03-27 06:51:38'),
(15, 34, 39, '2024-03-27 06:52:38', '2024-03-27 06:52:38'),
(16, 39, 34, '2024-03-27 06:52:51', '2024-03-27 06:52:51'),
(17, 39, 49, '2024-03-27 06:53:42', '2024-03-27 06:53:42'),
(18, 39, 34, '2024-03-27 06:53:46', '2024-03-27 06:53:46'),
(19, 39, 33, '2024-03-27 06:54:26', '2024-03-27 06:54:26'),
(20, 39, 34, '2024-03-27 06:54:44', '2024-03-27 06:54:44'),
(21, 34, 39, '2024-03-27 07:09:38', '2024-03-27 07:09:38'),
(22, 34, 39, '2024-03-27 07:15:49', '2024-03-27 07:15:49'),
(23, 39, 34, '2024-03-27 07:27:48', '2024-03-27 07:27:48'),
(24, 34, 39, '2024-03-27 07:36:22', '2024-03-27 07:36:22'),
(25, 34, 39, '2024-03-27 22:38:43', '2024-03-27 22:38:43'),
(26, 39, 34, '2024-03-27 22:39:12', '2024-03-27 22:39:12'),
(27, 39, 34, '2024-03-27 22:55:20', '2024-03-27 22:55:20'),
(28, 52, 39, '2024-03-28 02:38:50', '2024-03-28 02:38:50'),
(29, 39, 59, '2024-03-28 07:15:55', '2024-03-28 07:15:55'),
(30, 39, 59, '2024-03-28 07:17:05', '2024-03-28 07:17:05'),
(31, 59, 39, '2024-03-28 07:17:43', '2024-03-28 07:17:43'),
(32, 59, 42, '2024-03-28 07:27:14', '2024-03-28 07:27:14'),
(33, 39, 59, '2024-03-28 07:27:46', '2024-03-28 07:27:46'),
(34, 39, 29, '2024-03-28 07:29:03', '2024-03-28 07:29:03'),
(35, 59, 39, '2024-03-28 07:30:03', '2024-03-28 07:30:03'),
(36, 59, 39, '2024-03-28 07:31:07', '2024-03-28 07:31:07'),
(37, 59, 39, '2024-03-28 07:31:25', '2024-03-28 07:31:25'),
(38, 59, 39, '2024-03-28 07:31:27', '2024-03-28 07:31:27'),
(39, 59, 39, '2024-03-28 07:32:36', '2024-03-28 07:32:36'),
(40, 59, 39, '2024-03-28 07:32:45', '2024-03-28 07:32:45'),
(41, 59, 39, '2024-03-28 07:33:02', '2024-03-28 07:33:02'),
(42, 59, 39, '2024-03-28 07:33:54', '2024-03-28 07:33:54'),
(43, 59, 39, '2024-03-28 07:36:08', '2024-03-28 07:36:08'),
(44, 59, 59, '2024-03-28 07:36:33', '2024-03-28 07:36:33'),
(45, 34, 59, '2024-03-28 07:37:36', '2024-03-28 07:37:36'),
(46, 34, 34, '2024-03-28 07:38:57', '2024-03-28 07:38:57'),
(47, 34, 39, '2024-03-28 07:39:28', '2024-03-28 07:39:28'),
(48, 59, 34, '2024-03-28 07:43:11', '2024-03-28 07:43:11'),
(49, 59, 34, '2024-03-28 07:43:28', '2024-03-28 07:43:28'),
(50, 39, 34, '2024-03-28 07:52:58', '2024-03-28 07:52:58'),
(51, 39, 58, '2024-03-28 07:58:00', '2024-03-28 07:58:00'),
(52, 60, 2, '2024-03-29 00:08:59', '2024-03-29 00:08:59'),
(53, 60, 34, '2024-03-29 00:28:01', '2024-03-29 00:28:01'),
(54, 60, 2, '2024-03-29 00:28:02', '2024-03-29 00:28:02'),
(55, 60, 58, '2024-03-29 00:28:06', '2024-03-29 00:28:06'),
(56, 60, 42, '2024-03-29 00:28:09', '2024-03-29 00:28:09'),
(57, 60, 42, '2024-03-29 00:28:17', '2024-03-29 00:28:17'),
(58, 60, 39, '2024-03-29 00:28:27', '2024-03-29 00:28:27'),
(59, 60, 8, '2024-03-29 00:28:40', '2024-03-29 00:28:40'),
(60, 60, 33, '2024-03-29 00:28:46', '2024-03-29 00:28:46'),
(61, 60, 39, '2024-03-29 00:28:59', '2024-03-29 00:28:59'),
(62, 60, 42, '2024-03-29 00:35:35', '2024-03-29 00:35:35'),
(63, 60, 40, '2024-03-29 00:52:48', '2024-03-29 00:52:48'),
(64, 60, 42, '2024-03-29 00:52:59', '2024-03-29 00:52:59'),
(78, 34, 39, '2024-03-29 03:10:55', '2024-03-29 03:10:55'),
(79, 34, 59, '2024-03-29 03:11:26', '2024-03-29 03:11:26'),
(80, 34, 60, '2024-03-30 11:16:16', '2024-03-30 11:16:16'),
(81, 60, 42, '2024-04-01 20:38:44', '2024-04-01 20:38:44'),
(84, 65, 2, '2024-04-03 21:58:02', '2024-04-03 21:58:02'),
(85, 65, 3, '2024-04-03 21:58:22', '2024-04-03 21:58:22'),
(86, 65, 60, '2024-04-03 21:58:30', '2024-04-03 21:58:30'),
(87, 65, 3, '2024-04-03 21:58:50', '2024-04-03 21:58:50'),
(88, 65, 39, '2024-04-03 21:58:58', '2024-04-03 21:58:58'),
(89, 65, 33, '2024-04-03 21:59:40', '2024-04-03 21:59:40'),
(90, 65, 34, '2024-04-03 21:59:45', '2024-04-03 21:59:45'),
(91, 65, 38, '2024-04-03 21:59:47', '2024-04-03 21:59:47'),
(92, 65, 38, '2024-04-03 21:59:50', '2024-04-03 21:59:50'),
(93, 65, 4, '2024-04-03 22:01:11', '2024-04-03 22:01:11'),
(94, 65, 29, '2024-04-03 22:05:02', '2024-04-03 22:05:02'),
(96, 65, 32, '2024-04-03 22:05:28', '2024-04-03 22:05:28'),
(97, 65, 33, '2024-04-03 22:05:41', '2024-04-03 22:05:41'),
(101, 34, 41, '2024-04-10 12:11:49', '2024-04-10 12:11:49'),
(102, 34, 40, '2024-04-10 12:11:58', '2024-04-10 12:11:58'),
(103, 34, 42, '2024-04-10 12:12:09', '2024-04-10 12:12:09'),
(104, 65, 2, '2024-04-12 22:36:34', '2024-04-12 22:36:34'),
(105, 65, 6, '2024-04-12 22:37:06', '2024-04-12 22:37:06'),
(106, 65, 56, '2024-04-14 01:19:47', '2024-04-14 01:19:47'),
(107, 65, 51, '2024-04-14 01:19:57', '2024-04-14 01:19:57'),
(108, 65, 33, '2024-04-14 01:20:11', '2024-04-14 01:20:11'),
(109, 65, 39, '2024-04-14 01:20:18', '2024-04-14 01:20:18'),
(110, 65, 55, '2024-04-14 01:20:30', '2024-04-14 01:20:30'),
(112, 34, 42, '2024-04-23 00:58:24', '2024-04-23 00:58:24'),
(113, 39, 42, '2024-05-21 22:24:17', '2024-05-21 22:24:17'),
(114, 39, 59, '2024-05-22 18:05:41', '2024-05-22 18:05:41'),
(136, 39, 69, '2024-05-24 02:26:43', '2024-05-24 02:26:43'),
(138, 39, 69, '2024-05-24 02:29:14', '2024-05-24 02:29:14'),
(140, 69, 69, '2024-05-24 02:35:29', '2024-05-24 02:35:29'),
(142, 69, 69, '2024-05-24 02:49:35', '2024-05-24 02:49:35'),
(144, 69, 65, '2024-05-24 03:08:51', '2024-05-24 03:08:51'),
(146, 69, 69, '2024-05-24 21:23:46', '2024-05-24 21:23:46'),
(147, 69, 69, '2024-05-24 21:23:53', '2024-05-24 21:23:53'),
(148, 69, 69, '2024-05-24 21:24:08', '2024-05-24 21:24:08'),
(149, 39, 69, '2024-05-24 21:36:10', '2024-05-24 21:36:10'),
(150, 39, 69, '2024-05-24 21:37:02', '2024-05-24 21:37:02'),
(151, 39, 69, '2024-05-24 21:37:55', '2024-05-24 21:37:55'),
(163, 70, 69, '2024-05-27 17:02:54', '2024-05-27 17:02:54'),
(164, 70, 69, '2024-05-27 17:03:02', '2024-05-27 17:03:02'),
(165, 71, 70, '2024-05-27 17:13:45', '2024-05-27 17:13:45'),
(166, 71, 70, '2024-05-27 17:13:59', '2024-05-27 17:13:59'),
(167, 70, 71, '2024-05-27 17:16:17', '2024-05-27 17:16:17'),
(168, 71, 58, '2024-05-27 17:23:58', '2024-05-27 17:23:58'),
(169, 71, 65, '2024-05-27 17:30:35', '2024-05-27 17:30:35'),
(170, 71, 70, '2024-05-27 17:54:17', '2024-05-27 17:54:17'),
(171, 71, 70, '2024-05-27 17:54:29', '2024-05-27 17:54:29'),
(172, 71, 70, '2024-05-27 17:55:01', '2024-05-27 17:55:01'),
(173, 71, 70, '2024-05-27 22:12:36', '2024-05-27 22:12:36'),
(174, 70, 71, '2024-05-27 22:15:00', '2024-05-27 22:15:00'),
(175, 70, 66, '2024-05-27 22:23:39', '2024-05-27 22:23:39'),
(176, 70, 71, '2024-05-27 22:23:57', '2024-05-27 22:23:57'),
(177, 70, 67, '2024-05-27 22:24:24', '2024-05-27 22:24:24'),
(178, 70, 1, '2024-05-27 23:39:43', '2024-05-27 23:39:43'),
(179, 70, 1, '2024-05-27 23:39:56', '2024-05-27 23:39:56'),
(180, 70, 51, '2024-05-27 23:40:01', '2024-05-27 23:40:01'),
(181, 70, 1, '2024-05-27 23:40:04', '2024-05-27 23:40:04'),
(182, 70, 56, '2024-05-27 23:40:07', '2024-05-27 23:40:07'),
(183, 70, 66, '2024-05-27 23:40:09', '2024-05-27 23:40:09'),
(184, 70, 1, '2024-05-27 23:40:13', '2024-05-27 23:40:13'),
(185, 70, 71, '2024-05-28 15:08:41', '2024-05-28 15:08:41'),
(186, 70, 71, '2024-05-28 20:37:06', '2024-05-28 20:37:06'),
(187, 70, 71, '2024-05-28 20:40:55', '2024-05-28 20:40:55'),
(188, 71, 70, '2024-05-28 20:43:36', '2024-05-28 20:43:36'),
(189, 70, 65, '2024-05-28 20:46:02', '2024-05-28 20:46:02'),
(190, 71, 70, '2024-05-28 23:24:26', '2024-05-28 23:24:26'),
(191, 70, 70, '2024-05-28 23:25:45', '2024-05-28 23:25:45'),
(192, 70, 70, '2024-05-28 23:26:27', '2024-05-28 23:26:27'),
(193, 70, 71, '2024-05-28 23:33:37', '2024-05-28 23:33:37'),
(194, 70, 71, '2024-05-28 23:33:43', '2024-05-28 23:33:43'),
(195, 70, 71, '2024-05-28 23:33:46', '2024-05-28 23:33:46'),
(196, 70, 71, '2024-05-28 23:33:48', '2024-05-28 23:33:48'),
(197, 70, 71, '2024-05-28 23:34:05', '2024-05-28 23:34:05'),
(198, 70, 71, '2024-05-29 00:03:10', '2024-05-29 00:03:10'),
(199, 70, 71, '2024-05-29 00:03:43', '2024-05-29 00:03:43'),
(200, 70, 65, '2024-05-29 00:10:00', '2024-05-29 00:10:00'),
(201, 70, 58, '2024-05-29 16:52:39', '2024-05-29 16:52:39'),
(202, 70, 71, '2024-05-29 16:52:57', '2024-05-29 16:52:57'),
(203, 70, 71, '2024-05-29 17:10:35', '2024-05-29 17:10:35'),
(204, 70, 1, '2024-05-29 17:10:48', '2024-05-29 17:10:48'),
(205, 70, 67, '2024-05-29 17:11:32', '2024-05-29 17:11:32'),
(206, 70, 1, '2024-05-29 17:12:47', '2024-05-29 17:12:47'),
(207, 70, 59, '2024-05-29 17:12:55', '2024-05-29 17:12:55'),
(208, 70, 65, '2024-05-29 17:13:01', '2024-05-29 17:13:01'),
(209, 70, 65, '2024-05-29 17:13:14', '2024-05-29 17:13:14'),
(210, 70, 51, '2024-05-29 17:14:20', '2024-05-29 17:14:20'),
(211, 70, 55, '2024-05-29 17:14:32', '2024-05-29 17:14:32'),
(212, 70, 59, '2024-05-29 17:17:49', '2024-05-29 17:17:49'),
(213, 70, 67, '2024-05-29 17:31:48', '2024-05-29 17:31:48'),
(214, 70, 71, '2024-05-29 17:31:59', '2024-05-29 17:31:59'),
(215, 70, 34, '2024-05-29 17:32:11', '2024-05-29 17:32:11'),
(216, 70, 58, '2024-05-29 18:09:06', '2024-05-29 18:09:06'),
(217, 70, 65, '2024-05-29 18:09:24', '2024-05-29 18:09:24'),
(218, 70, 56, '2024-05-29 18:09:30', '2024-05-29 18:09:30'),
(219, 70, 71, '2024-05-29 18:10:22', '2024-05-29 18:10:22'),
(220, 70, 65, '2024-05-29 18:11:47', '2024-05-29 18:11:47'),
(221, 70, 51, '2024-05-29 18:12:13', '2024-05-29 18:12:13'),
(222, 70, 51, '2024-05-29 18:15:19', '2024-05-29 18:15:19'),
(223, 70, 56, '2024-05-29 18:15:24', '2024-05-29 18:15:24'),
(224, 70, 56, '2024-05-29 18:16:33', '2024-05-29 18:16:33'),
(225, 70, 56, '2024-05-29 18:16:48', '2024-05-29 18:16:48'),
(226, 70, 56, '2024-05-29 18:26:31', '2024-05-29 18:26:31'),
(227, 70, 56, '2024-05-29 18:27:03', '2024-05-29 18:27:03'),
(228, 70, 56, '2024-05-29 18:27:56', '2024-05-29 18:27:56'),
(229, 70, 56, '2024-05-29 18:28:18', '2024-05-29 18:28:18'),
(230, 70, 51, '2024-05-29 18:31:15', '2024-05-29 18:31:15'),
(231, 70, 56, '2024-05-29 18:31:55', '2024-05-29 18:31:55'),
(232, 70, 56, '2024-05-29 18:32:27', '2024-05-29 18:32:27'),
(233, 70, 56, '2024-05-29 18:38:11', '2024-05-29 18:38:11'),
(234, 70, 65, '2024-05-29 18:38:17', '2024-05-29 18:38:17'),
(235, 70, 51, '2024-05-29 18:38:37', '2024-05-29 18:38:37'),
(236, 70, 56, '2024-05-29 18:38:42', '2024-05-29 18:38:42'),
(237, 70, 56, '2024-05-29 18:42:06', '2024-05-29 18:42:06'),
(238, 70, 56, '2024-05-29 18:42:08', '2024-05-29 18:42:08'),
(239, 70, 56, '2024-05-29 18:50:13', '2024-05-29 18:50:13'),
(240, 70, 65, '2024-05-29 18:50:18', '2024-05-29 18:50:18'),
(241, 70, 51, '2024-05-29 18:50:34', '2024-05-29 18:50:34'),
(242, 70, 51, '2024-05-29 20:39:49', '2024-05-29 20:39:49'),
(243, 70, 51, '2024-05-29 20:49:19', '2024-05-29 20:49:19'),
(244, 70, 51, '2024-05-29 20:52:53', '2024-05-29 20:52:53'),
(245, 70, 51, '2024-05-29 20:53:10', '2024-05-29 20:53:10'),
(246, 70, 51, '2024-05-29 21:11:07', '2024-05-29 21:11:07'),
(247, 70, 56, '2024-05-29 21:11:16', '2024-05-29 21:11:16'),
(248, 70, 66, '2024-05-29 21:11:26', '2024-05-29 21:11:26'),
(249, 70, 56, '2024-05-29 21:13:46', '2024-05-29 21:13:46'),
(250, 70, 66, '2024-05-29 21:14:04', '2024-05-29 21:14:04'),
(251, 70, 56, '2024-05-29 21:14:14', '2024-05-29 21:14:14'),
(252, 70, 56, '2024-05-29 21:27:51', '2024-05-29 21:27:51'),
(253, 70, 56, '2024-05-29 21:32:47', '2024-05-29 21:32:47'),
(254, 70, 56, '2024-05-29 21:34:04', '2024-05-29 21:34:04'),
(255, 70, 71, '2024-05-29 21:38:13', '2024-05-29 21:38:13'),
(256, 70, 65, '2024-05-30 17:07:24', '2024-05-30 17:07:24'),
(257, 70, 66, '2024-05-30 17:07:34', '2024-05-30 17:07:34'),
(258, 70, 59, '2024-05-30 17:07:49', '2024-05-30 17:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `planId` varchar(255) NOT NULL,
  `productId` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `Name`, `price`, `details`, `planId`, `productId`, `deleted_at`, `created_at`, `updated_at`) VALUES
(14, 'basic plan 2', '82.0', 'Create for testing', 'price_1PIflqF8YcoTkw3Jufnwgg8C', 'prod_Q8xhHQt5RcDaXb', NULL, '2024-05-21 03:37:34', '2024-05-21 03:37:34'),
(15, 'normal plan', '50.3', 'Create for testing', 'price_1PIflqF8YcoTkw3Jufnwgg8C', 'prod_Q8xhHQt5RcDaXb', NULL, '2024-05-21 03:37:34', '2024-05-21 03:37:34');

-- --------------------------------------------------------

--
-- Table structure for table `upload_images`
--

CREATE TABLE `upload_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `Image` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `upload_images`
--

INSERT INTO `upload_images` (`id`, `userId`, `Image`, `created_at`, `updated_at`) VALUES
(1, 39, 'https://coupleskonnect.blownclouds.com/UploadImages/image-170846425827.png', NULL, NULL),
(2, 39, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1708464340346.png', NULL, NULL),
(13, 39, 'https://coupleskonnect.blownclouds.com/UploadImages/image-170847133572.jpg', NULL, NULL),
(14, 39, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1708471433404.png', NULL, NULL),
(15, 39, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1708471619720.png', NULL, NULL),
(16, 39, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1708477728294.png', NULL, NULL),
(17, 34, 'https://coupleskonnect.blownclouds.com/UploadImages/image-17085466739.png', NULL, NULL),
(18, 34, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1708546712124.png', NULL, NULL),
(19, 34, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1708619406154.png', NULL, NULL),
(20, 34, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1708649729230.png', NULL, NULL),
(21, 34, 'https://coupleskonnect.blownclouds.com/UploadImages/image-170865002091.png', NULL, NULL),
(22, 34, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1708650035534.png', NULL, NULL),
(23, 34, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1708650050719.png', NULL, NULL),
(24, 34, 'https://coupleskonnect.blownclouds.com/UploadImages/image-170878168398.jpg', NULL, NULL),
(25, 34, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1709145057800.jpg', NULL, NULL),
(26, 42, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1711073014425.jpg', NULL, NULL),
(27, 42, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1711073044641.jpg', NULL, NULL),
(28, 42, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1711073060106.jpg', NULL, NULL),
(29, 42, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1711073121790.jpg', NULL, NULL),
(30, 39, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1711165785899.jpg', NULL, NULL),
(31, 39, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1711165935710.jpg', NULL, NULL),
(32, 39, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1711166489893.jpg', NULL, NULL),
(33, 34, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1711504680385.jpg', NULL, NULL),
(36, 70, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1716848451203.jpg', NULL, NULL),
(37, 70, 'https://coupleskonnect.blownclouds.com/UploadImages/image-171684846755.jpg', NULL, NULL),
(38, 70, 'https://coupleskonnect.blownclouds.com/UploadImages/image-171684848877.jpg', NULL, NULL),
(39, 70, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1716848504740.jpg', NULL, NULL),
(40, 70, 'https://coupleskonnect.blownclouds.com/UploadImages/image-1716848520392.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userRole` bigint(20) UNSIGNED NOT NULL,
  `coupleCategories` bigint(20) UNSIGNED DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `PhoneNo` varchar(255) DEFAULT NULL,
  `coupleName` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `bio` longtext DEFAULT NULL,
  `profileImage` longtext DEFAULT NULL,
  `Latitude` double NOT NULL DEFAULT -1.3051348269673495,
  `Longitude` double NOT NULL DEFAULT 36.83927596678857,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userRole`, `coupleCategories`, `userName`, `title`, `emailAddress`, `password`, `PhoneNo`, `coupleName`, `age`, `gender`, `height`, `dob`, `bio`, `profileImage`, `Latitude`, `Longitude`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'admin', NULL, 'admin@gmail.com', '$2y$10$p1Z9R1zGC5NrvSrOj9aFO.gDo4NA006WAQ/oQnNqlVwbftUpeDU.C', NULL, '0', NULL, NULL, NULL, NULL, NULL, 'https://coupleskonnect.blownclouds.com/userProfile/image-1707771077472.jpg', -1.3051348269673495, 36.83927596678857, 1, NULL, '2024-02-10 01:48:15', '2024-05-24 01:46:05'),
(34, 2, 3, 'roy', 'testing titelas12', 'popop22cxvo@gmail.com', '$2y$10$eeK62sWnUZndzCTmkNPPPeCSX1Mf6fFzHy83X4VV5p624mKfAHbnC', '+19988765432', 'Johanas sss', '25', 'female', '5.3', '01/03/1997', 'Happy birthday to you tomorrow 🎊 to the office 😁😁 the to do with the new 🆕🆕🆕 to be exact I think 🤔🧐 to be done by the people 8 and the atmosphere was peaceful 💐🌹 to be done ✅💯 and then I get to see 🙈', 'https://coupleskonnect.blownclouds.com/user_profile/image-1709579885497.png', 24.90477, 67.1132867, 0, NULL, '2024-02-16 23:37:22', '2024-05-24 19:42:11'),
(51, 2, 2, 'Leo', 'leo', 'mnmnm2@hotmail.com', '$2y$10$.CnOs2xffWzr1FpL/6Eh3Os/hUEWy8wDvx35wTi3yBJI/mnjwNGN2', '+1123297897824', 'Leo Leo', '22', 'male', '5', '03/28/2011', 'very nice and I love you 😘😘 and I\'ll be there in the office and I can do it out ☺️😄😄😄☺️☺️', 'https://coupleskonnect.blownclouds.com/user_profile/image-1711570728592.png', -1.3051348269673495, 36.83927596678857, 1, NULL, '2024-03-28 00:18:48', '2024-05-24 19:20:49'),
(55, 2, 3, 'Sergio', 'Gia', 'mnmnmn5@hotmail.com', '$2y$10$oI9tAwODWXeh0T2ORW0i6.fgRyikfFaUNxGHWR43qrqwIeI6STw.W', '+11234567899', 'Gia Carter', '25', 'female', '5.3', '03/28/1987', 'HH is the rule of streets are you doing 😞😔💡😨 to get the idea of what to 😜 to be a good friend to help with Pindi the time I have.', 'https://coupleskonnect.blownclouds.com/user_profile/image-1711581117594.jpg', -1.3051348269673495, 36.83927596678857, 0, NULL, '2024-03-28 03:11:57', '2024-05-24 19:42:12'),
(56, 2, 2, 'Leo', 'leo', 'mnmnmn6@hotmail.com', '$2y$10$czd9eMcpu08lqmHXNUDUqeDeu69gtCpOT.Y8h.poLYEWbHntZ45y6', '+1123456789', 'jimmy', '23', 'male', '5.2', '03/28/2000', 'for the day you can get it out of the office and I\'ll', 'https://coupleskonnect.blownclouds.com/user_profile/image-1711582360294.png', -1.3051348269673495, 36.83927596678857, 1, NULL, '2024-03-28 03:32:40', '2024-03-28 03:32:40'),
(58, 2, 3, 'Happy', 'cat', 'mnmnmn9@hotmail.com', '$2y$10$wMzbstcf9Op0OJ3KXksHh.lnUEMzICmvhSfFHosCG18QW8y8RTdRC', '+1123456778', 'Catsi', '12', 'male', '5', '03/28/2002', 'happy Birthday 🎉 to get you will have to do with Easter eggs these are the center of this country has the most inhumane thing 😜 the 🏡🏠 how much is the iphone main office 😁', 'https://coupleskonnect.blownclouds.com/user_profile/image-1711588064772.jpg', 24.9074713, 67.1156728, 0, NULL, '2024-03-28 05:07:44', '2024-05-24 19:42:25'),
(59, 2, 3, 'good', 'neo', 'mnmnmn11@hotmail.com', '$2y$10$kaZks2XtvU6IcrmVqCHSaeNVtgFfTELqiZTSbkN6FDYuOxFl5rI9K', '+1235689743', 'Rodriguez', '31', 'male', '6.2', '03/28/1988', 'you can get it done before then if you want to talk 🦜 you have any questions ⁉️😊 you want 💖 you want me to talk to you 🥺 a good 💯', 'https://coupleskonnect.blownclouds.com/user_profile/image-1711595176974.jpg', 24.9492912, 67.0497247, 0, NULL, '2024-03-28 07:06:16', '2024-05-24 19:42:26'),
(60, 2, 3, 'elliot', 'elliot', 'elliot.mason@appcraftersstudio.com', '$2y$10$HDMBsNyix/zruLFFJgmFPe.OS2Gw9pIjn3oiINDjU5Trfl8tiR76u', '+17087972087', 'elliot', '25', 'male', '168', '10/03/1998', 'just ur everyday coffee enjoyer.', 'https://coupleskonnect.blownclouds.com/user_profile/image-1711656472949.jpg', 24.9206065, 67.0957323, 0, NULL, '2024-03-29 00:07:52', '2024-05-24 19:42:28'),
(65, 2, 3, 'tom', 'Thomas', 'tj3684@gmail.com', '$2y$10$jiV9vN9hmjo5g/mMtckvq.RC/.u/8GdAd21l0uwht41oaXEn/qUnu', '+12222222222', 'Tom', '40', 'male', '6', '03/06/1984', 'happily  married looking for new friends In serious relationship  to meet for new friends  to hang out with and talk or go out with on double dates with .', 'https://coupleskonnect.blownclouds.com/user_profile/image-1712167014656.jpg', 40.6775485, -74.2627037, 1, NULL, '2024-04-03 21:56:54', '2024-04-14 01:21:14'),
(66, 2, 2, 'Dunlop', 'bill', 'abc1122@yopmail.com', '$2y$10$0gMqpcI5meyUpR/LHkxrTu1u/u0mmUNGS5lKFzrErCBt1MED/Y2xm', '+165655656522', 'Billy Bowden', '27', 'male', '5.9', '05/16/2024', 'do you have a lot of work to do with the kids and I don\'t have a lot of them in their so we can get a lot 😉and I 😞😞😞😞😞', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716318523652.jpg', -1.3051348269673495, 36.83927596678857, 1, NULL, '2024-05-21 23:08:43', '2024-05-21 23:08:43'),
(67, 2, 2, 'Dunlop', 'nil', 'abc112233@yopmail.com', '$2y$10$fO21NRQXpANlSvMYNQuM5OKvmm2QoJp2.lG/jPgnbyb9ErhItss5G', '+13432524242226', 'Nile Red', '24', 'male', '5', '05/22/2011', 'can you send me the address for the address and the address is open and we can get it tomorrow morning and I can get', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716329594123.jpg', 24.90477, 67.1132867, 1, NULL, '2024-05-22 02:13:14', '2024-05-24 03:16:35'),
(70, 2, 2, 'John Sons', 'Nick', 'vldbhai@yopmail.com', '$2y$10$kfuSVpUTFZfhk3YVKs1mwuqShhDdr1/wkONgLziCtjcOVHIHjg4bu', '+1111111111111111', 'John Sons', '80', 'male', '6.1', '05/29/1944', 'Hi, I am new here please connect me.', 'https://coupleskonnect.blownclouds.com/user_profile/image-1716829294591.jpg', 24.9492821, 67.0497515, 1, NULL, '2024-05-27 17:01:34', '2024-07-02 19:03:45'),
(71, 2, 3, 'akpan', 'figma', 'vldbhai1@yopmail.com', '$2y$10$76KMZaOMFycd7CfrCrGaYOTAqoZsvHpWWT1TMO8cgECaOx.eEODfO', '+1556565656', 'akpan', '22', 'male', '6.3', '05/27/2002', 'Hey, 👋', 'https://coupleskonnect.blownclouds.com/user_profile/image-171682999071.jpg', 24.9075159, 67.1157453, 1, NULL, '2024-05-27 17:13:10', '2024-05-28 23:24:19');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `senderId` bigint(20) UNSIGNED NOT NULL,
  `receiverId` bigint(20) UNSIGNED NOT NULL,
  `chatId` int(11) DEFAULT NULL,
  `friendRequestId` int(11) DEFAULT NULL,
  `body` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL COMMENT 'chat, friend_request',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `senderId`, `receiverId`, `chatId`, `friendRequestId`, `body`, `type`, `created_at`, `updated_at`) VALUES
(1, 39, 34, NULL, 3, 'arooz31 sents you a friend request.', 'send_request', '2024-03-26 01:26:30', '2024-03-26 01:26:30'),
(2, 39, 34, NULL, 4, 'arooz31 sents you a friend request.', 'send_request', '2024-03-26 01:27:36', '2024-03-26 01:27:36'),
(3, 39, 34, NULL, 5, 'arooz31 sents you a friend request.', 'send_request', '2024-03-26 01:43:21', '2024-03-26 01:43:21'),
(4, 39, 34, NULL, 6, 'arooz31 sents you a friend request.', 'send_request', '2024-03-26 01:44:20', '2024-03-26 01:44:20'),
(5, 34, 39, NULL, 6, 'roy accepted your friend request.', 'request_accepted', '2024-03-26 22:50:33', '2024-03-26 22:50:33'),
(6, 34, 39, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-26 22:50:40', '2024-03-26 22:50:40'),
(7, 34, 39, 1, NULL, 'hello', 'chat', '2024-03-26 22:50:49', '2024-03-26 22:50:49'),
(8, 39, 39, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-26 22:53:10', '2024-03-26 22:53:10'),
(9, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 22:54:03', '2024-03-26 22:54:03'),
(10, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 22:54:28', '2024-03-26 22:54:28'),
(11, 39, 34, 1, NULL, 'ola amigo', 'chat', '2024-03-26 22:56:07', '2024-03-26 22:56:07'),
(12, 39, 34, 1, NULL, 'Sents you a file.', 'chat', '2024-03-26 22:56:26', '2024-03-26 22:56:26'),
(13, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 22:57:40', '2024-03-26 22:57:40'),
(14, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 22:58:02', '2024-03-26 22:58:02'),
(23, 39, 34, 1, NULL, 'hellooooooooooooooooooooooooooooooo', 'chat', '2024-03-26 23:08:55', '2024-03-26 23:08:55'),
(24, 39, 34, 1, NULL, 'hai', 'chat', '2024-03-26 23:14:02', '2024-03-26 23:14:02'),
(25, 39, 34, 1, NULL, 'hhh', 'chat', '2024-03-26 23:14:14', '2024-03-26 23:14:14'),
(26, 39, 34, 1, NULL, 'hello', 'chat', '2024-03-26 23:15:30', '2024-03-26 23:15:30'),
(27, 39, 34, 1, NULL, 'Sents you a file.', 'chat', '2024-03-26 23:15:47', '2024-03-26 23:15:47'),
(28, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 23:40:03', '2024-03-26 23:40:03'),
(29, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 23:40:18', '2024-03-26 23:40:18'),
(30, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 23:42:17', '2024-03-26 23:42:17'),
(31, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 23:42:54', '2024-03-26 23:42:54'),
(32, 39, 34, 1, NULL, 'ho', 'chat', '2024-03-26 23:43:51', '2024-03-26 23:43:51'),
(33, 39, 34, 1, NULL, 'hello', 'chat', '2024-03-26 23:45:09', '2024-03-26 23:45:09'),
(34, 39, 34, 1, NULL, 'hello', 'chat', '2024-03-26 23:47:11', '2024-03-26 23:47:11'),
(35, 39, 34, 1, NULL, 'happy', 'chat', '2024-03-26 23:47:34', '2024-03-26 23:47:34'),
(36, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 23:49:14', '2024-03-26 23:49:14'),
(37, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 23:53:12', '2024-03-26 23:53:12'),
(38, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 23:54:21', '2024-03-26 23:54:21'),
(39, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 23:56:47', '2024-03-26 23:56:47'),
(40, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-26 23:58:44', '2024-03-26 23:58:44'),
(41, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:08:00', '2024-03-27 00:08:00'),
(42, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:12:54', '2024-03-27 00:12:54'),
(43, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:19:13', '2024-03-27 00:19:13'),
(44, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:19:45', '2024-03-27 00:19:45'),
(45, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:20:16', '2024-03-27 00:20:16'),
(46, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:23:39', '2024-03-27 00:23:39'),
(47, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:28:39', '2024-03-27 00:28:39'),
(48, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:29:11', '2024-03-27 00:29:11'),
(49, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:29:36', '2024-03-27 00:29:36'),
(50, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:31:02', '2024-03-27 00:31:02'),
(51, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:32:23', '2024-03-27 00:32:23'),
(52, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:33:49', '2024-03-27 00:33:49'),
(53, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:35:41', '2024-03-27 00:35:41'),
(54, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:37:07', '2024-03-27 00:37:07'),
(55, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 00:42:50', '2024-03-27 00:42:50'),
(56, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:10:36', '2024-03-27 01:10:36'),
(57, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:13:54', '2024-03-27 01:13:54'),
(58, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:15:55', '2024-03-27 01:15:55'),
(59, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:17:00', '2024-03-27 01:17:00'),
(60, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:19:51', '2024-03-27 01:19:51'),
(61, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:22:25', '2024-03-27 01:22:25'),
(62, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:23:18', '2024-03-27 01:23:18'),
(63, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:23:58', '2024-03-27 01:23:58'),
(64, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:25:01', '2024-03-27 01:25:01'),
(65, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:27:27', '2024-03-27 01:27:27'),
(66, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:29:12', '2024-03-27 01:29:12'),
(67, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:30:36', '2024-03-27 01:30:36'),
(68, 39, 34, 1, NULL, 'h', 'chat', '2024-03-27 01:33:00', '2024-03-27 01:33:00'),
(69, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:47:07', '2024-03-27 01:47:07'),
(70, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:48:37', '2024-03-27 01:48:37'),
(71, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:49:49', '2024-03-27 01:49:49'),
(72, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:54:13', '2024-03-27 01:54:13'),
(73, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 01:55:55', '2024-03-27 01:55:55'),
(74, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 02:04:55', '2024-03-27 02:04:55'),
(75, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 02:07:37', '2024-03-27 02:07:37'),
(76, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 02:25:18', '2024-03-27 02:25:18'),
(77, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 02:26:01', '2024-03-27 02:26:01'),
(78, 34, 39, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 02:26:49', '2024-03-27 02:26:49'),
(79, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 02:29:52', '2024-03-27 02:29:52'),
(80, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 02:36:42', '2024-03-27 02:36:42'),
(81, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 02:36:52', '2024-03-27 02:36:52'),
(82, 34, 39, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 02:40:02', '2024-03-27 02:40:02'),
(83, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 02:41:01', '2024-03-27 02:41:01'),
(84, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 02:42:49', '2024-03-27 02:42:49'),
(85, 34, 39, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 02:43:40', '2024-03-27 02:43:40'),
(86, 34, 48, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-27 03:08:58', '2024-03-27 03:08:58'),
(87, 34, 39, NULL, 7, 'roy sents you a friend request.', 'send_request', '2024-03-27 03:10:10', '2024-03-27 03:10:10'),
(88, 34, 48, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-27 03:14:25', '2024-03-27 03:14:25'),
(89, 34, 39, 1, NULL, 'ola', 'chat', '2024-03-27 03:21:43', '2024-03-27 03:21:43'),
(90, 34, 39, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-27 03:49:57', '2024-03-27 03:49:57'),
(91, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 03:51:48', '2024-03-27 03:51:48'),
(92, 39, 34, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 03:52:07', '2024-03-27 03:52:07'),
(93, 39, 34, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 03:52:59', '2024-03-27 03:52:59'),
(94, 34, 39, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 03:54:07', '2024-03-27 03:54:07'),
(95, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 03:54:22', '2024-03-27 03:54:22'),
(96, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 03:54:43', '2024-03-27 03:54:43'),
(97, 34, 39, 1, NULL, 'hello', 'chat', '2024-03-27 03:55:05', '2024-03-27 03:55:05'),
(98, 34, 39, 1, NULL, 'get', 'chat', '2024-03-27 03:55:16', '2024-03-27 03:55:16'),
(99, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 03:59:35', '2024-03-27 03:59:35'),
(100, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 03:59:47', '2024-03-27 03:59:47'),
(101, 34, 39, 1, NULL, 'ok', 'chat', '2024-03-27 04:01:15', '2024-03-27 04:01:15'),
(102, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 04:02:43', '2024-03-27 04:02:43'),
(103, 34, 39, 1, NULL, 'oh', 'chat', '2024-03-27 04:02:50', '2024-03-27 04:02:50'),
(104, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 04:03:28', '2024-03-27 04:03:28'),
(105, 34, 39, 1, NULL, 'for', 'chat', '2024-03-27 04:03:36', '2024-03-27 04:03:36'),
(106, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 04:14:20', '2024-03-27 04:14:20'),
(107, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 04:15:42', '2024-03-27 04:15:42'),
(108, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 04:17:01', '2024-03-27 04:17:01'),
(109, 39, 34, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 04:17:21', '2024-03-27 04:17:21'),
(110, 39, 34, 1, NULL, 'ho', 'chat', '2024-03-27 04:18:47', '2024-03-27 04:18:47'),
(111, 39, 34, 1, NULL, 'op', 'chat', '2024-03-27 04:19:01', '2024-03-27 04:19:01'),
(112, 39, 34, 1, NULL, 'pop', 'chat', '2024-03-27 04:19:26', '2024-03-27 04:19:26'),
(113, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 04:25:28', '2024-03-27 04:25:28'),
(114, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 04:25:46', '2024-03-27 04:25:46'),
(115, 39, 34, 1, NULL, 'hello', 'chat', '2024-03-27 04:44:14', '2024-03-27 04:44:14'),
(116, 39, 34, 1, NULL, 'good', 'chat', '2024-03-27 04:48:56', '2024-03-27 04:48:56'),
(117, 39, 34, 1, NULL, 'let me know 🙂', 'chat', '2024-03-27 04:49:06', '2024-03-27 04:49:06'),
(118, 39, 34, 1, NULL, 'the only one 🕜', 'chat', '2024-03-27 04:49:32', '2024-03-27 04:49:32'),
(119, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 05:01:19', '2024-03-27 05:01:19'),
(120, 39, 34, 1, NULL, 'good', 'chat', '2024-03-27 05:02:27', '2024-03-27 05:02:27'),
(121, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 05:36:03', '2024-03-27 05:36:03'),
(122, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 05:36:20', '2024-03-27 05:36:20'),
(123, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 05:36:22', '2024-03-27 05:36:22'),
(124, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 05:36:34', '2024-03-27 05:36:34'),
(125, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 05:37:00', '2024-03-27 05:37:00'),
(126, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 05:37:58', '2024-03-27 05:37:58'),
(127, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 05:38:22', '2024-03-27 05:38:22'),
(128, 39, 34, 1, NULL, 'know if you need help 😜', 'chat', '2024-03-27 05:38:45', '2024-03-27 05:38:45'),
(129, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 05:41:26', '2024-03-27 05:41:26'),
(130, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 05:42:31', '2024-03-27 05:42:31'),
(131, 34, 39, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-27 06:51:37', '2024-03-27 06:51:37'),
(132, 34, 39, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-27 06:52:38', '2024-03-27 06:52:38'),
(133, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 06:52:50', '2024-03-27 06:52:50'),
(134, 39, 49, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 06:53:42', '2024-03-27 06:53:42'),
(135, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 06:53:45', '2024-03-27 06:53:45'),
(136, 39, 33, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 06:54:26', '2024-03-27 06:54:26'),
(137, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 06:54:43', '2024-03-27 06:54:43'),
(138, 39, 34, 1, NULL, 'happy', 'chat', '2024-03-27 06:55:49', '2024-03-27 06:55:49'),
(139, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 06:57:43', '2024-03-27 06:57:43'),
(140, 34, 39, 1, NULL, 'hello', 'chat', '2024-03-27 06:57:49', '2024-03-27 06:57:49'),
(141, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 06:58:01', '2024-03-27 06:58:01'),
(142, 34, 39, 1, NULL, 'how are you 😊', 'chat', '2024-03-27 06:58:09', '2024-03-27 06:58:09'),
(143, 34, 39, 1, NULL, 'fine 😌', 'chat', '2024-03-27 06:58:20', '2024-03-27 06:58:20'),
(144, 39, 34, 1, NULL, 'yes 💯', 'chat', '2024-03-27 06:58:43', '2024-03-27 06:58:43'),
(145, 39, 34, 1, NULL, 'how\'s everyone', 'chat', '2024-03-27 06:58:59', '2024-03-27 06:58:59'),
(146, 34, 39, 1, NULL, 'everyone is doing well 🤠', 'chat', '2024-03-27 06:59:21', '2024-03-27 06:59:21'),
(147, 34, 39, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 07:00:04', '2024-03-27 07:00:04'),
(148, 39, 34, 1, NULL, 'nice', 'chat', '2024-03-27 07:00:41', '2024-03-27 07:00:41'),
(149, 39, 34, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 07:02:34', '2024-03-27 07:02:34'),
(150, 34, 39, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-27 07:09:37', '2024-03-27 07:09:37'),
(151, 34, 39, 1, NULL, 'okay', 'chat', '2024-03-27 07:12:03', '2024-03-27 07:12:03'),
(152, 39, 34, 1, NULL, 'okay', 'chat', '2024-03-27 07:12:17', '2024-03-27 07:12:17'),
(153, 34, 39, 1, NULL, '❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️❤️', 'chat', '2024-03-27 07:13:56', '2024-03-27 07:13:56'),
(154, 39, 34, 1, NULL, '😁😁😁😁😁😁😁😁😁😁😁😁😁🤠', 'chat', '2024-03-27 07:14:22', '2024-03-27 07:14:22'),
(155, 34, 39, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-27 07:15:48', '2024-03-27 07:15:48'),
(156, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 07:21:03', '2024-03-27 07:21:03'),
(157, 39, 34, 1, NULL, 'bro', 'chat', '2024-03-27 07:21:23', '2024-03-27 07:21:23'),
(158, 39, 34, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 07:22:19', '2024-03-27 07:22:19'),
(159, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 07:27:47', '2024-03-27 07:27:47'),
(160, 39, 34, 1, NULL, 'for you', 'chat', '2024-03-27 07:30:52', '2024-03-27 07:30:52'),
(161, 34, 39, 1, NULL, 'hey there?', 'chat', '2024-03-27 07:35:46', '2024-03-27 07:35:46'),
(162, 34, 39, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-27 07:36:21', '2024-03-27 07:36:21'),
(163, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 22:17:15', '2024-03-27 22:17:15'),
(164, 39, 34, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 22:25:34', '2024-03-27 22:25:34'),
(165, 34, 39, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 22:26:25', '2024-03-27 22:26:25'),
(166, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 22:27:43', '2024-03-27 22:27:43'),
(167, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-27 22:28:17', '2024-03-27 22:28:17'),
(168, 39, 34, 1, NULL, 'hello', 'chat', '2024-03-27 22:29:29', '2024-03-27 22:29:29'),
(169, 39, 34, 1, NULL, 'hi', 'chat', '2024-03-27 22:30:34', '2024-03-27 22:30:34'),
(170, 34, 39, 1, NULL, 'hello', 'chat', '2024-03-27 22:31:04', '2024-03-27 22:31:04'),
(171, 34, 39, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 22:32:02', '2024-03-27 22:32:02'),
(172, 34, 39, 1, NULL, 'Sents you a file.', 'chat', '2024-03-27 22:34:45', '2024-03-27 22:34:45'),
(173, 39, 34, 1, NULL, 'hello', 'chat', '2024-03-27 22:35:09', '2024-03-27 22:35:09'),
(174, 34, 39, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-27 22:38:43', '2024-03-27 22:38:43'),
(175, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 22:39:10', '2024-03-27 22:39:10'),
(176, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-27 22:55:18', '2024-03-27 22:55:18'),
(177, 39, 34, 1, NULL, 'for', 'chat', '2024-03-27 22:57:42', '2024-03-27 22:57:42'),
(178, 52, 39, NULL, NULL, 'Leo views your profile.', 'view_profile', '2024-03-28 02:38:49', '2024-03-28 02:38:49'),
(179, 34, 39, 1, NULL, 'Sents you a file.', 'chat', '2024-03-28 05:49:45', '2024-03-28 05:49:45'),
(180, 39, 59, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-28 07:15:54', '2024-03-28 07:15:54'),
(181, 39, 59, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-28 07:17:04', '2024-03-28 07:17:04'),
(182, 59, 39, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:17:43', '2024-03-28 07:17:43'),
(183, 59, 42, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:27:14', '2024-03-28 07:27:14'),
(184, 39, 59, NULL, 8, 'arooz31 sents you a friend request.', 'send_request', '2024-03-28 07:27:37', '2024-03-28 07:27:37'),
(185, 39, 59, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-28 07:27:45', '2024-03-28 07:27:45'),
(186, 59, 39, NULL, 8, 'good accepted your friend request.', 'request_accepted', '2024-03-28 07:28:10', '2024-03-28 07:28:10'),
(187, 39, 29, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-28 07:29:03', '2024-03-28 07:29:03'),
(188, 59, 39, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:30:02', '2024-03-28 07:30:02'),
(189, 39, 34, NULL, 7, 'arooz31 accepted your friend request.', 'request_accepted', '2024-03-28 07:30:41', '2024-03-28 07:30:41'),
(190, 59, 39, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:31:06', '2024-03-28 07:31:06'),
(191, 59, 39, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:31:24', '2024-03-28 07:31:24'),
(192, 59, 39, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:31:26', '2024-03-28 07:31:26'),
(193, 59, 39, NULL, 9, 'good sents you a friend request.', 'send_request', '2024-03-28 07:32:13', '2024-03-28 07:32:13'),
(194, 39, 59, NULL, 9, 'arooz31 accepted your friend request.', 'request_accepted', '2024-03-28 07:32:22', '2024-03-28 07:32:22'),
(195, 59, 39, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:32:36', '2024-03-28 07:32:36'),
(196, 59, 39, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:32:44', '2024-03-28 07:32:44'),
(197, 59, 39, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:33:01', '2024-03-28 07:33:01'),
(198, 59, 39, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:33:53', '2024-03-28 07:33:53'),
(199, 59, 39, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:36:08', '2024-03-28 07:36:08'),
(200, 59, 59, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:36:32', '2024-03-28 07:36:32'),
(201, 34, 59, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-28 07:37:36', '2024-03-28 07:37:36'),
(202, 34, 59, NULL, 10, 'roy sents you a friend request.', 'send_request', '2024-03-28 07:38:39', '2024-03-28 07:38:39'),
(203, 59, 34, NULL, 10, 'good accepted your friend request.', 'request_accepted', '2024-03-28 07:38:47', '2024-03-28 07:38:47'),
(204, 34, 34, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-28 07:38:56', '2024-03-28 07:38:56'),
(205, 34, 39, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-28 07:39:28', '2024-03-28 07:39:28'),
(206, 59, 34, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:43:09', '2024-03-28 07:43:09'),
(207, 59, 34, NULL, 11, 'good sents you a friend request.', 'send_request', '2024-03-28 07:43:12', '2024-03-28 07:43:12'),
(208, 59, 34, NULL, NULL, 'good views your profile.', 'view_profile', '2024-03-28 07:43:26', '2024-03-28 07:43:26'),
(209, 34, 59, NULL, 11, 'roy accepted your friend request.', 'request_accepted', '2024-03-28 07:43:51', '2024-03-28 07:43:51'),
(210, 39, 34, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-28 07:52:57', '2024-03-28 07:52:57'),
(211, 39, 58, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-03-28 07:58:00', '2024-03-28 07:58:00'),
(212, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-28 08:00:44', '2024-03-28 08:00:44'),
(213, 39, 34, 1, NULL, 'hey', 'chat', '2024-03-28 08:00:50', '2024-03-28 08:00:50'),
(214, 39, 34, 1, NULL, 'hey', 'chat', '2024-03-28 08:03:08', '2024-03-28 08:03:08'),
(215, 34, 39, 1, NULL, 'hi', 'chat', '2024-03-28 08:03:15', '2024-03-28 08:03:15'),
(216, 34, 39, 1, NULL, 'Sents you a file.', 'chat', '2024-03-28 08:03:35', '2024-03-28 08:03:35'),
(217, 60, 34, NULL, 12, 'elliot sents you a friend request.', 'send_request', '2024-03-29 00:08:51', '2024-03-29 00:08:51'),
(218, 60, 34, NULL, 13, 'elliot sents you a friend request.', 'send_request', '2024-03-29 00:08:52', '2024-03-29 00:08:52'),
(219, 60, 34, NULL, 14, 'elliot sents you a friend request.', 'send_request', '2024-03-29 00:08:52', '2024-03-29 00:08:52'),
(220, 60, 58, NULL, 15, 'elliot sents you a friend request.', 'send_request', '2024-03-29 00:08:56', '2024-03-29 00:08:56'),
(221, 60, 2, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:08:59', '2024-03-29 00:08:59'),
(222, 60, 34, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:27:59', '2024-03-29 00:27:59'),
(223, 60, 2, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:28:02', '2024-03-29 00:28:02'),
(224, 60, 58, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:28:06', '2024-03-29 00:28:06'),
(225, 60, 42, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:28:09', '2024-03-29 00:28:09'),
(226, 60, 42, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:28:17', '2024-03-29 00:28:17'),
(227, 60, 39, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:28:26', '2024-03-29 00:28:26'),
(228, 60, 8, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:28:40', '2024-03-29 00:28:40'),
(229, 60, 33, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:28:46', '2024-03-29 00:28:46'),
(230, 60, 33, NULL, 16, 'elliot sents you a friend request.', 'send_request', '2024-03-29 00:28:47', '2024-03-29 00:28:47'),
(231, 60, 39, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:28:59', '2024-03-29 00:28:59'),
(232, 60, 39, NULL, 17, 'elliot sents you a friend request.', 'send_request', '2024-03-29 00:28:59', '2024-03-29 00:28:59'),
(233, 60, 42, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:35:35', '2024-03-29 00:35:35'),
(234, 60, 40, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:52:48', '2024-03-29 00:52:48'),
(235, 60, 42, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-03-29 00:52:59', '2024-03-29 00:52:59'),
(259, 34, 39, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-29 03:10:54', '2024-03-29 03:10:54'),
(260, 34, 59, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-29 03:11:26', '2024-03-29 03:11:26'),
(265, 34, 60, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-03-30 11:16:16', '2024-03-30 11:16:16'),
(266, 60, 42, NULL, NULL, 'elliot views your profile.', 'view_profile', '2024-04-01 20:38:44', '2024-04-01 20:38:44'),
(269, 65, 2, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 21:58:02', '2024-04-03 21:58:02'),
(270, 65, 3, NULL, 29, 'tom sents you a friend request.', 'send_request', '2024-04-03 21:58:19', '2024-04-03 21:58:19'),
(271, 65, 3, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 21:58:22', '2024-04-03 21:58:22'),
(272, 65, 60, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 21:58:30', '2024-04-03 21:58:30'),
(273, 65, 3, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 21:58:50', '2024-04-03 21:58:50'),
(274, 65, 39, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 21:58:58', '2024-04-03 21:58:58'),
(275, 65, 33, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 21:59:40', '2024-04-03 21:59:40'),
(276, 65, 34, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 21:59:43', '2024-04-03 21:59:43'),
(277, 65, 38, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 21:59:47', '2024-04-03 21:59:47'),
(278, 65, 38, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 21:59:50', '2024-04-03 21:59:50'),
(279, 65, 4, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 22:01:11', '2024-04-03 22:01:11'),
(280, 65, 29, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 22:05:02', '2024-04-03 22:05:02'),
(282, 65, 32, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 22:05:28', '2024-04-03 22:05:28'),
(283, 65, 33, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-03 22:05:41', '2024-04-03 22:05:41'),
(287, 34, 41, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-04-10 12:11:49', '2024-04-10 12:11:49'),
(288, 34, 40, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-04-10 12:11:58', '2024-04-10 12:11:58'),
(289, 34, 42, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-04-10 12:12:09', '2024-04-10 12:12:09'),
(290, 34, 39, 1, NULL, 'hi', 'chat', '2024-04-10 12:12:42', '2024-04-10 12:12:42'),
(291, 65, 2, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-12 22:36:34', '2024-04-12 22:36:34'),
(292, 65, 6, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-12 22:37:06', '2024-04-12 22:37:06'),
(293, 65, 56, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-14 01:19:47', '2024-04-14 01:19:47'),
(294, 65, 51, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-14 01:19:57', '2024-04-14 01:19:57'),
(295, 65, 33, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-14 01:20:11', '2024-04-14 01:20:11'),
(296, 65, 39, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-14 01:20:17', '2024-04-14 01:20:17'),
(297, 65, 55, NULL, NULL, 'tom views your profile.', 'view_profile', '2024-04-14 01:20:30', '2024-04-14 01:20:30'),
(299, 34, 42, NULL, NULL, 'roy views your profile.', 'view_profile', '2024-04-23 00:58:24', '2024-04-23 00:58:24'),
(300, 39, 42, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-05-21 22:24:17', '2024-05-21 22:24:17'),
(301, 39, 59, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-05-22 18:05:41', '2024-05-22 18:05:41'),
(332, 39, 69, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-05-24 02:26:42', '2024-05-24 02:26:42'),
(334, 39, 69, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-05-24 02:29:13', '2024-05-24 02:29:13'),
(338, 69, 69, NULL, NULL, 'john views your profile.', 'view_profile', '2024-05-24 02:35:28', '2024-05-24 02:35:28'),
(340, 69, 69, NULL, NULL, 'john views your profile.', 'view_profile', '2024-05-24 02:49:34', '2024-05-24 02:49:34'),
(342, 69, 65, NULL, NULL, 'john views your profile.', 'view_profile', '2024-05-24 03:08:51', '2024-05-24 03:08:51'),
(344, 69, 69, NULL, NULL, 'john views your profile.', 'view_profile', '2024-05-24 21:23:46', '2024-05-24 21:23:46'),
(345, 69, 69, NULL, NULL, 'john views your profile.', 'view_profile', '2024-05-24 21:23:53', '2024-05-24 21:23:53'),
(346, 69, 69, NULL, NULL, 'john views your profile.', 'view_profile', '2024-05-24 21:24:08', '2024-05-24 21:24:08'),
(351, 39, 69, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-05-24 21:36:10', '2024-05-24 21:36:10'),
(352, 39, 69, NULL, 40, 'arooz31 sents you a friend request.', 'send_request', '2024-05-24 21:36:10', '2024-05-24 21:36:10'),
(353, 69, 39, NULL, 40, 'john accepted your friend request.', 'request_accepted', '2024-05-24 21:36:33', '2024-05-24 21:36:33'),
(354, 39, 69, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-05-24 21:37:02', '2024-05-24 21:37:02'),
(355, 39, 69, NULL, NULL, 'arooz31 views your profile.', 'view_profile', '2024-05-24 21:37:54', '2024-05-24 21:37:54'),
(373, 70, 69, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 17:02:54', '2024-05-27 17:02:54'),
(374, 70, 69, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 17:03:02', '2024-05-27 17:03:02'),
(375, 71, 70, NULL, NULL, 'akpan views your profile.', 'view_profile', '2024-05-27 17:13:45', '2024-05-27 17:13:45'),
(376, 71, 70, NULL, 43, 'akpan sents you a friend request.', 'send_request', '2024-05-27 17:13:55', '2024-05-27 17:13:55'),
(377, 71, 70, NULL, NULL, 'akpan views your profile.', 'view_profile', '2024-05-27 17:13:59', '2024-05-27 17:13:59'),
(378, 70, 71, NULL, 43, 'John Sons accepted your friend request.', 'request_accepted', '2024-05-27 17:14:47', '2024-05-27 17:14:47'),
(379, 70, 71, 10, NULL, 'hi baby', 'chat', '2024-05-27 17:15:42', '2024-05-27 17:15:42'),
(380, 70, 71, 10, NULL, 'hey', 'chat', '2024-05-27 17:15:47', '2024-05-27 17:15:47'),
(381, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 17:16:17', '2024-05-27 17:16:17'),
(382, 70, 71, NULL, 44, 'John Sons sents you a friend request.', 'send_request', '2024-05-27 17:17:03', '2024-05-27 17:17:03'),
(383, 71, 70, NULL, 44, 'akpan accepted your friend request.', 'request_accepted', '2024-05-27 17:17:40', '2024-05-27 17:17:40'),
(384, 71, 70, 10, NULL, 'hi', 'chat', '2024-05-27 17:21:01', '2024-05-27 17:21:01'),
(385, 71, 70, 10, NULL, 'how are you baby', 'chat', '2024-05-27 17:21:09', '2024-05-27 17:21:09'),
(386, 71, 70, 10, NULL, 'hey nice to meet you', 'chat', '2024-05-27 17:21:22', '2024-05-27 17:21:22'),
(387, 71, 70, 10, NULL, '👋', 'chat', '2024-05-27 17:22:03', '2024-05-27 17:22:03'),
(388, 71, 58, NULL, NULL, 'akpan views your profile.', 'view_profile', '2024-05-27 17:23:58', '2024-05-27 17:23:58'),
(389, 71, 65, NULL, NULL, 'akpan views your profile.', 'view_profile', '2024-05-27 17:30:35', '2024-05-27 17:30:35'),
(390, 71, 70, NULL, NULL, 'akpan views your profile.', 'view_profile', '2024-05-27 17:54:17', '2024-05-27 17:54:17'),
(391, 71, 70, NULL, NULL, 'akpan views your profile.', 'view_profile', '2024-05-27 17:54:29', '2024-05-27 17:54:29'),
(392, 71, 70, NULL, NULL, 'akpan views your profile.', 'view_profile', '2024-05-27 17:55:01', '2024-05-27 17:55:01'),
(393, 71, 70, NULL, NULL, 'akpan views your profile.', 'view_profile', '2024-05-27 22:12:36', '2024-05-27 22:12:36'),
(394, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 22:15:00', '2024-05-27 22:15:00'),
(395, 71, 70, 10, NULL, 'hmm', 'chat', '2024-05-27 22:15:51', '2024-05-27 22:15:51'),
(396, 70, 58, NULL, 45, 'John Sons sents you a friend request.', 'send_request', '2024-05-27 22:23:04', '2024-05-27 22:23:04'),
(397, 70, 34, NULL, 46, 'John Sons sents you a friend request.', 'send_request', '2024-05-27 22:23:07', '2024-05-27 22:23:07'),
(398, 70, 67, NULL, 47, 'John Sons sents you a friend request.', 'send_request', '2024-05-27 22:23:10', '2024-05-27 22:23:10'),
(399, 70, 60, NULL, 48, 'John Sons sents you a friend request.', 'send_request', '2024-05-27 22:23:13', '2024-05-27 22:23:13'),
(400, 70, 59, NULL, 49, 'John Sons sents you a friend request.', 'send_request', '2024-05-27 22:23:14', '2024-05-27 22:23:14'),
(401, 70, 1, NULL, 50, 'John Sons sents you a friend request.', 'send_request', '2024-05-27 22:23:17', '2024-05-27 22:23:17'),
(402, 70, 51, NULL, 51, 'John Sons sents you a friend request.', 'send_request', '2024-05-27 22:23:20', '2024-05-27 22:23:20'),
(403, 70, 55, NULL, 52, 'John Sons sents you a friend request.', 'send_request', '2024-05-27 22:23:22', '2024-05-27 22:23:22'),
(404, 70, 56, NULL, 53, 'John Sons sents you a friend request.', 'send_request', '2024-05-27 22:23:24', '2024-05-27 22:23:24'),
(405, 70, 66, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 22:23:39', '2024-05-27 22:23:39'),
(406, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 22:23:57', '2024-05-27 22:23:57'),
(407, 70, 67, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 22:24:24', '2024-05-27 22:24:24'),
(408, 70, 1, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 23:39:43', '2024-05-27 23:39:43'),
(409, 70, 1, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 23:39:56', '2024-05-27 23:39:56'),
(410, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 23:40:01', '2024-05-27 23:40:01'),
(411, 70, 1, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 23:40:04', '2024-05-27 23:40:04'),
(412, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 23:40:07', '2024-05-27 23:40:07'),
(413, 70, 66, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 23:40:09', '2024-05-27 23:40:09'),
(414, 70, 1, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-27 23:40:13', '2024-05-27 23:40:13'),
(415, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 15:08:41', '2024-05-28 15:08:41'),
(416, 70, 71, 10, NULL, 'yes', 'chat', '2024-05-28 15:09:24', '2024-05-28 15:09:24'),
(417, 70, 71, 10, NULL, 'hi', 'chat', '2024-05-28 15:10:41', '2024-05-28 15:10:41'),
(418, 70, 71, 10, NULL, 'hi', 'chat', '2024-05-28 20:21:46', '2024-05-28 20:21:46'),
(419, 71, 70, NULL, 1, 'akpan sents you a friend request.', 'send_request', '2024-05-28 20:35:47', '2024-05-28 20:35:47'),
(420, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 20:37:05', '2024-05-28 20:37:05'),
(421, 70, 71, NULL, 2, 'John Sons sents you a friend request.', 'send_request', '2024-05-28 20:37:09', '2024-05-28 20:37:09'),
(422, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 20:40:55', '2024-05-28 20:40:55'),
(423, 70, 71, NULL, 1, 'John Sons sents you a friend request.', 'send_request', '2024-05-28 20:41:03', '2024-05-28 20:41:03'),
(424, 71, 70, NULL, 1, 'akpan accepted your friend request.', 'request_accepted', '2024-05-28 20:41:23', '2024-05-28 20:41:23'),
(425, 71, 70, NULL, NULL, 'akpan views your profile.', 'view_profile', '2024-05-28 20:43:35', '2024-05-28 20:43:35'),
(426, 70, 65, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 20:46:02', '2024-05-28 20:46:02'),
(427, 71, 70, NULL, NULL, 'akpan views your profile.', 'view_profile', '2024-05-28 23:24:23', '2024-05-28 23:24:23'),
(428, 71, 70, NULL, 2, 'akpan sents you a friend request.', 'send_request', '2024-05-28 23:24:24', '2024-05-28 23:24:24'),
(429, 70, 71, NULL, 2, 'John Sons accepted your friend request.', 'request_accepted', '2024-05-28 23:24:37', '2024-05-28 23:24:37'),
(430, 70, 70, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 23:25:42', '2024-05-28 23:25:42'),
(431, 70, 70, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 23:26:24', '2024-05-28 23:26:24'),
(432, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 23:33:36', '2024-05-28 23:33:36'),
(433, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 23:33:42', '2024-05-28 23:33:42'),
(434, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 23:33:45', '2024-05-28 23:33:45'),
(435, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 23:33:47', '2024-05-28 23:33:47'),
(436, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-28 23:34:04', '2024-05-28 23:34:04'),
(437, 70, 71, 1, NULL, 'hello', 'chat', '2024-05-28 23:41:42', '2024-05-28 23:41:42'),
(438, 70, 71, 1, NULL, 'how are you', 'chat', '2024-05-28 23:41:49', '2024-05-28 23:41:49'),
(439, 70, 71, 1, NULL, 'Sents you a file.', 'chat', '2024-05-28 23:42:04', '2024-05-28 23:42:04'),
(440, 70, 71, 1, NULL, 'hey', 'chat', '2024-05-29 00:01:37', '2024-05-29 00:01:37'),
(441, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 00:03:08', '2024-05-29 00:03:08'),
(442, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 00:03:42', '2024-05-29 00:03:42'),
(443, 70, 65, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 00:10:00', '2024-05-29 00:10:00'),
(444, 70, 71, 1, NULL, 'hi', 'chat', '2024-05-29 00:42:35', '2024-05-29 00:42:35'),
(445, 70, 71, 1, NULL, '123', 'chat', '2024-05-29 00:42:53', '2024-05-29 00:42:53'),
(446, 70, 71, 1, NULL, 'hey', 'chat', '2024-05-29 00:48:58', '2024-05-29 00:48:58'),
(447, 70, 71, 1, NULL, 'hey again', 'chat', '2024-05-29 00:49:30', '2024-05-29 00:49:30'),
(448, 70, 71, 1, NULL, 'hi', 'chat', '2024-05-29 00:50:12', '2024-05-29 00:50:12'),
(449, 70, 71, 1, NULL, 'hi again!', 'chat', '2024-05-29 00:53:32', '2024-05-29 00:53:32'),
(450, 70, 58, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 16:52:39', '2024-05-29 16:52:39'),
(451, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 16:52:55', '2024-05-29 16:52:55'),
(452, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:10:34', '2024-05-29 17:10:34'),
(453, 70, 1, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:10:48', '2024-05-29 17:10:48'),
(454, 70, 67, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:11:32', '2024-05-29 17:11:32'),
(455, 70, 1, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:12:47', '2024-05-29 17:12:47'),
(456, 70, 59, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:12:55', '2024-05-29 17:12:55'),
(457, 70, 65, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:13:01', '2024-05-29 17:13:01'),
(458, 70, 65, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:13:14', '2024-05-29 17:13:14'),
(459, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:14:20', '2024-05-29 17:14:20'),
(460, 70, 55, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:14:32', '2024-05-29 17:14:32'),
(461, 70, 59, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:17:49', '2024-05-29 17:17:49'),
(462, 70, 67, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:31:48', '2024-05-29 17:31:48'),
(463, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:31:58', '2024-05-29 17:31:58'),
(464, 70, 34, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 17:32:10', '2024-05-29 17:32:10'),
(465, 70, 71, 1, NULL, 'hii', 'chat', '2024-05-29 17:33:20', '2024-05-29 17:33:20'),
(466, 70, 71, 1, NULL, 'Hey you got this for you and your dad and you 💕 me 💝 I don\'t know 😭 I don\'t have a car seat or anything else I can do for you and you can get the kids and you and you want to come over for dinner 🍽️', 'chat', '2024-05-29 18:05:42', '2024-05-29 18:05:42'),
(467, 70, 58, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:09:06', '2024-05-29 18:09:06'),
(468, 70, 65, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:09:24', '2024-05-29 18:09:24'),
(469, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:09:30', '2024-05-29 18:09:30'),
(470, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:10:21', '2024-05-29 18:10:21'),
(471, 70, 71, 2, NULL, 'hey 👋', 'chat', '2024-05-29 18:10:29', '2024-05-29 18:10:29'),
(472, 70, 65, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:11:47', '2024-05-29 18:11:47'),
(473, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:12:13', '2024-05-29 18:12:13'),
(474, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:15:19', '2024-05-29 18:15:19'),
(475, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:15:24', '2024-05-29 18:15:24'),
(476, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:16:33', '2024-05-29 18:16:33'),
(477, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:16:48', '2024-05-29 18:16:48'),
(478, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:26:31', '2024-05-29 18:26:31'),
(479, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:27:03', '2024-05-29 18:27:03'),
(480, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:27:56', '2024-05-29 18:27:56'),
(481, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:28:18', '2024-05-29 18:28:18'),
(482, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:31:15', '2024-05-29 18:31:15'),
(483, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:31:55', '2024-05-29 18:31:55'),
(484, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:32:27', '2024-05-29 18:32:27'),
(485, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:38:11', '2024-05-29 18:38:11'),
(486, 70, 65, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:38:17', '2024-05-29 18:38:17'),
(487, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:38:37', '2024-05-29 18:38:37'),
(488, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:38:42', '2024-05-29 18:38:42'),
(489, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:42:06', '2024-05-29 18:42:06'),
(490, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:42:08', '2024-05-29 18:42:08'),
(491, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:50:13', '2024-05-29 18:50:13'),
(492, 70, 65, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:50:18', '2024-05-29 18:50:18'),
(493, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 18:50:34', '2024-05-29 18:50:34'),
(494, 70, 71, 2, NULL, 'yo', 'chat', '2024-05-29 19:29:13', '2024-05-29 19:29:13'),
(495, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 20:39:49', '2024-05-29 20:39:49'),
(496, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 20:49:19', '2024-05-29 20:49:19'),
(497, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 20:52:53', '2024-05-29 20:52:53'),
(498, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 20:53:10', '2024-05-29 20:53:10'),
(499, 70, 51, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 21:11:07', '2024-05-29 21:11:07'),
(500, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 21:11:16', '2024-05-29 21:11:16'),
(501, 70, 66, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 21:11:26', '2024-05-29 21:11:26'),
(502, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 21:13:46', '2024-05-29 21:13:46'),
(503, 70, 66, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 21:14:04', '2024-05-29 21:14:04'),
(504, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 21:14:14', '2024-05-29 21:14:14'),
(505, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 21:27:51', '2024-05-29 21:27:51'),
(506, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 21:32:47', '2024-05-29 21:32:47'),
(507, 70, 56, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 21:34:04', '2024-05-29 21:34:04'),
(508, 70, 71, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-29 21:38:11', '2024-05-29 21:38:11'),
(509, 70, 65, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-30 17:07:24', '2024-05-30 17:07:24'),
(510, 70, 66, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-30 17:07:34', '2024-05-30 17:07:34'),
(511, 70, 59, NULL, NULL, 'John Sons views your profile.', 'view_profile', '2024-05-30 17:07:49', '2024-05-30 17:07:49'),
(512, 70, 71, 1, NULL, 'hi mate', 'chat', '2024-05-30 21:41:18', '2024-05-30 21:41:18'),
(513, 70, 71, 1, NULL, 'hey', 'chat', '2024-05-30 21:41:54', '2024-05-30 21:41:54'),
(514, 70, 71, 1, NULL, 'yo', 'chat', '2024-06-03 22:45:40', '2024-06-03 22:45:40'),
(515, 70, 71, 1, NULL, 'Sents you a file.', 'chat', '2024-06-03 22:52:37', '2024-06-03 22:52:37'),
(516, 70, 71, 1, NULL, '123', 'chat', '2024-06-03 22:58:11', '2024-06-03 22:58:11'),
(517, 70, 71, 1, NULL, 't', 'chat', '2024-06-03 22:59:08', '2024-06-03 22:59:08'),
(518, 70, 71, 1, NULL, 'g', 'chat', '2024-06-03 23:07:23', '2024-06-03 23:07:23'),
(519, 70, 71, 1, NULL, 'wassup 👋', 'chat', '2024-06-03 23:07:39', '2024-06-03 23:07:39'),
(520, 70, 71, 1, NULL, 'anybody there?', 'chat', '2024-06-03 23:08:35', '2024-06-03 23:08:35'),
(521, 70, 71, 1, NULL, 'Sents you a file.', 'chat', '2024-06-03 23:10:10', '2024-06-03 23:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `user_phone_verifications`
--

CREATE TABLE `user_phone_verifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `otp` varchar(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_phone_verifications`
--

INSERT INTO `user_phone_verifications` (`id`, `phone_number`, `otp`, `created_at`, `updated_at`) VALUES
(3, '1234567', '7818', '2024-02-16 21:57:26', '2024-02-16 21:57:26'),
(4, '1234567', '1757', '2024-02-16 21:59:38', '2024-02-16 21:59:38'),
(5, '1234567', '4823', '2024-02-16 21:59:43', '2024-02-16 21:59:43'),
(6, '+1236589085269', '9350', '2024-02-16 22:08:07', '2024-02-16 22:08:07'),
(7, '+11236558964', '9089', '2024-02-16 22:19:34', '2024-02-16 22:19:34'),
(8, '+11236558964', '2756', '2024-02-16 22:24:32', '2024-02-16 22:24:32'),
(9, '+11236558964', '1625', '2024-02-16 22:36:34', '2024-02-16 22:36:34'),
(10, '+11236558964', '7409', '2024-02-16 22:53:01', '2024-02-16 22:53:01'),
(11, '+11236558964', '6316', '2024-02-16 23:04:40', '2024-02-16 23:04:40'),
(12, '+11236558964', '7049', '2024-02-16 23:05:15', '2024-02-16 23:05:15'),
(13, '+11236558964', '1127', '2024-02-16 23:05:26', '2024-02-16 23:05:26'),
(14, '+19988765432', '1396', '2024-02-16 23:08:44', '2024-02-16 23:08:44'),
(15, '+19988765432', '9206', '2024-02-16 23:09:03', '2024-02-16 23:09:03'),
(16, '+19988765432', '7646', '2024-02-16 23:09:21', '2024-02-16 23:09:21'),
(17, '+19988765432', '5161', '2024-02-16 23:09:45', '2024-02-16 23:09:45'),
(18, '+19988765432', '7767', '2024-02-16 23:20:06', '2024-02-16 23:20:06'),
(19, '+1123456', '7265', '2024-02-20 02:03:29', '2024-02-20 02:03:29'),
(20, '+1123467889', '1899', '2024-02-20 02:10:15', '2024-02-20 02:10:15'),
(21, '+12323', '1188', '2024-02-20 02:17:41', '2024-02-20 02:17:41'),
(22, '+1123123', '9623', '2024-02-20 02:18:56', '2024-02-20 02:18:56'),
(23, '+1232323', '1516', '2024-02-20 02:52:13', '2024-02-20 02:52:13'),
(24, '+13698075624', '8108', '2024-02-26 03:19:03', '2024-02-26 03:19:03'),
(25, '+13698075624', '2490', '2024-02-26 03:19:15', '2024-02-26 03:19:15'),
(26, '9082427059', '8304', '2024-03-08 01:16:54', '2024-03-08 01:16:54'),
(27, '+19082427059', '7345', '2024-03-08 02:11:10', '2024-03-08 02:11:10'),
(28, '+19082427059', '8655', '2024-03-08 02:11:19', '2024-03-08 02:11:19'),
(29, '+19082427059', '3369', '2024-03-08 02:14:57', '2024-03-08 02:14:57'),
(30, '9082427059', '1209', '2024-03-08 02:21:51', '2024-03-08 02:21:51'),
(31, '9082427059', '3229', '2024-03-08 02:21:54', '2024-03-08 02:21:54'),
(32, '9082427059', '2328', '2024-03-08 02:24:35', '2024-03-08 02:24:35'),
(33, '9082427059', '5516', '2024-03-08 02:27:58', '2024-03-08 02:27:58'),
(34, '9082427059', '8545', '2024-03-08 02:28:38', '2024-03-08 02:28:38'),
(35, '+1123297897823', '2222', '2024-03-27 23:49:43', '2024-03-27 23:49:43'),
(36, '+1123297897824', '2222', '2024-03-28 00:17:36', '2024-03-28 00:17:36'),
(37, '+1123297897825', '2222', '2024-03-28 00:25:56', '2024-03-28 00:25:56'),
(38, '+1123297897826', '2222', '2024-03-28 01:09:29', '2024-03-28 01:09:29'),
(39, '+11234567899', '2222', '2024-03-28 03:02:11', '2024-03-28 03:02:11'),
(40, '+1123456789', '2222', '2024-03-28 03:18:53', '2024-03-28 03:18:53'),
(41, '+1123456779', '2222', '2024-03-28 03:55:09', '2024-03-28 03:55:09'),
(42, '+1123456788', '2222', '2024-03-28 03:57:09', '2024-03-28 03:57:09'),
(43, '+10313107976888', '2222', '2024-03-28 04:52:03', '2024-03-28 04:52:03'),
(44, '+1031310797686', '2222', '2024-03-28 04:52:36', '2024-03-28 04:52:36'),
(45, '+1031310797682', '2222', '2024-03-28 04:54:14', '2024-03-28 04:54:14'),
(46, '+1031310797689', '2222', '2024-03-28 05:03:04', '2024-03-28 05:03:04'),
(47, '+1123456778', '2222', '2024-03-28 05:05:14', '2024-03-28 05:05:14'),
(48, '+11234567895', '2222', '2024-03-28 05:27:22', '2024-03-28 05:27:22'),
(49, '+11234567856', '2222', '2024-03-28 05:30:16', '2024-03-28 05:30:16'),
(50, '+12345678989', '2222', '2024-03-28 05:35:16', '2024-03-28 05:35:16'),
(51, '+11234567896', '2222', '2024-03-28 06:52:16', '2024-03-28 06:52:16'),
(52, '+123568965', '2222', '2024-03-28 06:52:24', '2024-03-28 06:52:24'),
(53, '+1235689743', '2222', '2024-03-28 06:56:09', '2024-03-28 06:56:09'),
(54, '+1236580743', '2222', '2024-03-28 22:07:14', '2024-03-28 22:07:14'),
(55, '+12569', '2222', '2024-03-28 22:09:20', '2024-03-28 22:09:20'),
(56, '+1555555', '2222', '2024-03-28 22:13:20', '2024-03-28 22:13:20'),
(57, '+1233636623', '2222', '2024-03-28 22:15:24', '2024-03-28 22:15:24'),
(58, '+1254586233', '2222', '2024-03-28 22:16:43', '2024-03-28 22:16:43'),
(59, '+12345678969', '2222', '2024-03-28 22:47:06', '2024-03-28 22:47:06'),
(60, '+17087972086', '2222', '2024-03-29 00:01:00', '2024-03-29 00:01:00'),
(61, '+17087972087', '2222', '2024-03-29 00:04:30', '2024-03-29 00:04:30'),
(62, '+1123456789055', '2222', '2024-03-29 00:57:58', '2024-03-29 00:57:58'),
(63, '+12345678910', '2222', '2024-03-29 00:58:45', '2024-03-29 00:58:45'),
(64, '+12345678999', '2222', '2024-03-29 01:04:43', '2024-03-29 01:04:43'),
(65, '+1123456789999', '2222', '2024-03-30 00:00:38', '2024-03-30 00:00:38'),
(66, '+1949494949494', '2222', '2024-03-30 01:36:25', '2024-03-30 01:36:25'),
(67, '+12458796566', '2222', '2024-04-02 23:56:34', '2024-04-02 23:56:34'),
(68, '+12222222222', '2222', '2024-04-03 21:45:37', '2024-04-03 21:45:37'),
(69, '+11111111111111', '2222', '2024-04-05 02:06:39', '2024-04-05 02:06:39'),
(70, '+165655656522', '2222', '2024-05-21 23:06:44', '2024-05-21 23:06:44'),
(71, '+13432524242226', '2222', '2024-05-22 02:09:47', '2024-05-22 02:09:47'),
(72, '+13468812645545', '2222', '2024-05-23 20:42:00', '2024-05-23 20:42:00'),
(73, '+12454597979', '2222', '2024-05-23 20:43:55', '2024-05-23 20:43:55'),
(74, '+12222222222222', '2222', '2024-05-23 20:49:48', '2024-05-23 20:49:48'),
(75, '+12345678888', '2222', '2024-05-24 01:41:49', '2024-05-24 01:41:49'),
(76, '+111111111111111', '2222', '2024-05-24 02:15:37', '2024-05-24 02:15:37'),
(77, '+11125415555544', '2222', '2024-05-24 02:57:18', '2024-05-24 02:57:18'),
(78, '+12365589555', '2222', '2024-05-24 04:29:09', '2024-05-24 04:29:09'),
(79, '+1111111111111111', '2222', '2024-05-27 16:47:01', '2024-05-27 16:47:01'),
(80, '+12346454545', '2222', '2024-05-27 17:08:28', '2024-05-27 17:08:28'),
(81, '+1556565656', '2222', '2024-05-27 17:09:05', '2024-05-27 17:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userRole` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `userRole`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-01-24 21:23:06', NULL),
(2, 'user', '2024-01-24 21:23:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) UNSIGNED NOT NULL,
  `subscriptionId` bigint(20) UNSIGNED NOT NULL,
  `receiptData` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`receiptData`)),
  `expiryDate` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `userId`, `subscriptionId`, `receiptData`, `expiryDate`, `status`, `created_at`, `updated_at`) VALUES
(5, 34, 14, '{\"id\":\"sub_1PJ1WFF8YcoTkw3J9LceLCFk\",\"object\":\"subscription\",\"application\":null,\"application_fee_percent\":null,\"automatic_tax\":{\"enabled\":false,\"liability\":null},\"billing_cycle_anchor\":1716331855,\"billing_cycle_anchor_config\":null,\"billing_thresholds\":null,\"cancel_at\":null,\"cancel_at_period_end\":false,\"canceled_at\":null,\"cancellation_details\":{\"comment\":null,\"feedback\":null,\"reason\":null},\"collection_method\":\"charge_automatically\",\"created\":1716331855,\"currency\":\"usd\",\"current_period_end\":1719010255,\"current_period_start\":1716331855,\"customer\":\"cus_Q9KAkvHdBgLndI\",\"days_until_due\":null,\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":null,\"discount\":null,\"discounts\":[],\"ended_at\":null,\"invoice_settings\":{\"account_tax_ids\":null,\"issuer\":{\"type\":\"self\"}},\"items\":{\"object\":\"list\",\"data\":[{\"id\":\"si_Q9KAWz1PHr8YCi\",\"object\":\"subscription_item\",\"billing_thresholds\":null,\"created\":1716331855,\"discounts\":[],\"metadata\":[],\"plan\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":5000,\"amount_decimal\":\"5000\",\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":[],\"meter\":null,\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"custom_unit_amount\":null,\"livemode\":false,\"lookup_key\":null,\"metadata\":[],\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"month\",\"interval_count\":1,\"meter\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":5000,\"unit_amount_decimal\":\"5000\"},\"quantity\":1,\"subscription\":\"sub_1PJ1WFF8YcoTkw3J9LceLCFk\",\"tax_rates\":[]}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/subscription_items?subscription=sub_1PJ1WFF8YcoTkw3J9LceLCFk\"},\"latest_invoice\":\"in_1PJ1WFF8YcoTkw3JzVL1jAqh\",\"livemode\":false,\"metadata\":[],\"next_pending_invoice_item_invoice\":null,\"on_behalf_of\":null,\"pause_collection\":null,\"payment_settings\":{\"payment_method_options\":null,\"payment_method_types\":null,\"save_default_payment_method\":\"off\"},\"pending_invoice_item_interval\":null,\"pending_setup_intent\":null,\"pending_update\":null,\"plan\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":5000,\"amount_decimal\":\"5000\",\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":[],\"meter\":null,\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"quantity\":1,\"schedule\":null,\"start_date\":1716331855,\"status\":\"active\",\"test_clock\":null,\"transfer_data\":null,\"trial_end\":null,\"trial_settings\":{\"end_behavior\":{\"missing_payment_method\":\"create_invoice\"}},\"trial_start\":null}', '2024-06-20 22:50:57', 1, '2024-05-22 02:50:57', '2024-05-22 02:50:57'),
(6, 69, 14, '{\"id\":\"sub_1PK1yNF8YcoTkw3JCE5SxF81\",\"object\":\"subscription\",\"application\":null,\"application_fee_percent\":null,\"automatic_tax\":{\"enabled\":false,\"liability\":null},\"billing_cycle_anchor\":1716571927,\"billing_cycle_anchor_config\":null,\"billing_thresholds\":null,\"cancel_at\":null,\"cancel_at_period_end\":false,\"canceled_at\":null,\"cancellation_details\":{\"comment\":null,\"feedback\":null,\"reason\":null},\"collection_method\":\"charge_automatically\",\"created\":1716571927,\"currency\":\"usd\",\"current_period_end\":1719250327,\"current_period_start\":1716571927,\"customer\":\"cus_QAMh4STrGRrrQh\",\"days_until_due\":null,\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":null,\"discount\":null,\"discounts\":[],\"ended_at\":null,\"invoice_settings\":{\"account_tax_ids\":null,\"issuer\":{\"type\":\"self\"}},\"items\":{\"object\":\"list\",\"data\":[{\"id\":\"si_QAMhf256L27wwz\",\"object\":\"subscription_item\",\"billing_thresholds\":null,\"created\":1716571928,\"discounts\":[],\"metadata\":[],\"plan\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":5000,\"amount_decimal\":\"5000\",\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":[],\"meter\":null,\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"custom_unit_amount\":null,\"livemode\":false,\"lookup_key\":null,\"metadata\":[],\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"month\",\"interval_count\":1,\"meter\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":5000,\"unit_amount_decimal\":\"5000\"},\"quantity\":1,\"subscription\":\"sub_1PK1yNF8YcoTkw3JCE5SxF81\",\"tax_rates\":[]}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/subscription_items?subscription=sub_1PK1yNF8YcoTkw3JCE5SxF81\"},\"latest_invoice\":\"in_1PK1yNF8YcoTkw3JyD6Uf05m\",\"livemode\":false,\"metadata\":[],\"next_pending_invoice_item_invoice\":null,\"on_behalf_of\":null,\"pause_collection\":null,\"payment_settings\":{\"payment_method_options\":null,\"payment_method_types\":null,\"save_default_payment_method\":\"off\"},\"pending_invoice_item_interval\":null,\"pending_setup_intent\":null,\"pending_update\":null,\"plan\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":5000,\"amount_decimal\":\"5000\",\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":[],\"meter\":null,\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"quantity\":1,\"schedule\":null,\"start_date\":1716571927,\"status\":\"active\",\"test_clock\":null,\"transfer_data\":null,\"trial_end\":null,\"trial_settings\":{\"end_behavior\":{\"missing_payment_method\":\"create_invoice\"}},\"trial_start\":null}', '2024-06-23 17:32:09', 1, '2024-05-24 21:32:09', '2024-05-24 21:32:09'),
(8, 70, 14, '{\"id\":\"sub_1PL78rF8YcoTkw3JMfdokRwn\",\"object\":\"subscription\",\"application\":null,\"application_fee_percent\":null,\"automatic_tax\":{\"enabled\":false,\"liability\":null},\"billing_cycle_anchor\":1716830125,\"billing_cycle_anchor_config\":null,\"billing_thresholds\":null,\"cancel_at\":null,\"cancel_at_period_end\":false,\"canceled_at\":null,\"cancellation_details\":{\"comment\":null,\"feedback\":null,\"reason\":null},\"collection_method\":\"charge_automatically\",\"created\":1716830125,\"currency\":\"usd\",\"current_period_end\":1719508525,\"current_period_start\":1716830125,\"customer\":\"cus_QBU7HlYI1ysvy4\",\"days_until_due\":null,\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":null,\"discount\":null,\"discounts\":[],\"ended_at\":null,\"invoice_settings\":{\"account_tax_ids\":null,\"issuer\":{\"type\":\"self\"}},\"items\":{\"object\":\"list\",\"data\":[{\"id\":\"si_QBU7h1m5noIgGl\",\"object\":\"subscription_item\",\"billing_thresholds\":null,\"created\":1716830126,\"discounts\":[],\"metadata\":[],\"plan\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":5000,\"amount_decimal\":\"5000\",\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":[],\"meter\":null,\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"custom_unit_amount\":null,\"livemode\":false,\"lookup_key\":null,\"metadata\":[],\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"month\",\"interval_count\":1,\"meter\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":5000,\"unit_amount_decimal\":\"5000\"},\"quantity\":1,\"subscription\":\"sub_1PL78rF8YcoTkw3JMfdokRwn\",\"tax_rates\":[]}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/subscription_items?subscription=sub_1PL78rF8YcoTkw3JMfdokRwn\"},\"latest_invoice\":\"in_1PL78rF8YcoTkw3JBSZORSiD\",\"livemode\":false,\"metadata\":[],\"next_pending_invoice_item_invoice\":null,\"on_behalf_of\":null,\"pause_collection\":null,\"payment_settings\":{\"payment_method_options\":null,\"payment_method_types\":null,\"save_default_payment_method\":\"off\"},\"pending_invoice_item_interval\":null,\"pending_setup_intent\":null,\"pending_update\":null,\"plan\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":5000,\"amount_decimal\":\"5000\",\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":[],\"meter\":null,\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"quantity\":1,\"schedule\":null,\"start_date\":1716830125,\"status\":\"active\",\"test_clock\":null,\"transfer_data\":null,\"trial_end\":null,\"trial_settings\":{\"end_behavior\":{\"missing_payment_method\":\"create_invoice\"}},\"trial_start\":null}', '2024-06-26 13:15:27', 1, '2024-05-27 17:15:27', '2024-05-27 17:15:27'),
(9, 71, 15, '{\"id\":\"sub_1PL7DjF8YcoTkw3JUHnK8yB9\",\"object\":\"subscription\",\"application\":null,\"application_fee_percent\":null,\"automatic_tax\":{\"enabled\":false,\"liability\":null},\"billing_cycle_anchor\":1716830427,\"billing_cycle_anchor_config\":null,\"billing_thresholds\":null,\"cancel_at\":null,\"cancel_at_period_end\":false,\"canceled_at\":null,\"cancellation_details\":{\"comment\":null,\"feedback\":null,\"reason\":null},\"collection_method\":\"charge_automatically\",\"created\":1716830427,\"currency\":\"usd\",\"current_period_end\":1719508827,\"current_period_start\":1716830427,\"customer\":\"cus_QBUCikZw2KcfDK\",\"days_until_due\":null,\"default_payment_method\":null,\"default_source\":null,\"default_tax_rates\":[],\"description\":null,\"discount\":null,\"discounts\":[],\"ended_at\":null,\"invoice_settings\":{\"account_tax_ids\":null,\"issuer\":{\"type\":\"self\"}},\"items\":{\"object\":\"list\",\"data\":[{\"id\":\"si_QBUCVVly7LKCPK\",\"object\":\"subscription_item\",\"billing_thresholds\":null,\"created\":1716830428,\"discounts\":[],\"metadata\":[],\"plan\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":5000,\"amount_decimal\":\"5000\",\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":[],\"meter\":null,\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"price\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"price\",\"active\":true,\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"custom_unit_amount\":null,\"livemode\":false,\"lookup_key\":null,\"metadata\":[],\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"recurring\":{\"aggregate_usage\":null,\"interval\":\"month\",\"interval_count\":1,\"meter\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"tax_behavior\":\"unspecified\",\"tiers_mode\":null,\"transform_quantity\":null,\"type\":\"recurring\",\"unit_amount\":5000,\"unit_amount_decimal\":\"5000\"},\"quantity\":1,\"subscription\":\"sub_1PL7DjF8YcoTkw3JUHnK8yB9\",\"tax_rates\":[]}],\"has_more\":false,\"total_count\":1,\"url\":\"\\/v1\\/subscription_items?subscription=sub_1PL7DjF8YcoTkw3JUHnK8yB9\"},\"latest_invoice\":\"in_1PL7DjF8YcoTkw3JfCk2uEU5\",\"livemode\":false,\"metadata\":[],\"next_pending_invoice_item_invoice\":null,\"on_behalf_of\":null,\"pause_collection\":null,\"payment_settings\":{\"payment_method_options\":null,\"payment_method_types\":null,\"save_default_payment_method\":\"off\"},\"pending_invoice_item_interval\":null,\"pending_setup_intent\":null,\"pending_update\":null,\"plan\":{\"id\":\"price_1PIflqF8YcoTkw3Jufnwgg8C\",\"object\":\"plan\",\"active\":true,\"aggregate_usage\":null,\"amount\":5000,\"amount_decimal\":\"5000\",\"billing_scheme\":\"per_unit\",\"created\":1716248254,\"currency\":\"usd\",\"interval\":\"month\",\"interval_count\":1,\"livemode\":false,\"metadata\":[],\"meter\":null,\"nickname\":null,\"product\":\"prod_Q8xhHQt5RcDaXb\",\"tiers_mode\":null,\"transform_usage\":null,\"trial_period_days\":null,\"usage_type\":\"licensed\"},\"quantity\":1,\"schedule\":null,\"start_date\":1716830427,\"status\":\"active\",\"test_clock\":null,\"transfer_data\":null,\"trial_end\":null,\"trial_settings\":{\"end_behavior\":{\"missing_payment_method\":\"create_invoice\"}},\"trial_start\":null}', '2024-06-26 13:20:29', 1, '2024-05-27 17:20:29', '2024-05-27 17:20:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_interests`
--
ALTER TABLE `all_interests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `all_interests_interest_unique` (`interest`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chats_senderid_foreign` (`senderId`),
  ADD KEY `chats_receiverid_foreign` (`receiverId`);

--
-- Indexes for table `conditions`
--
ALTER TABLE `conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `couple_categories`
--
ALTER TABLE `couple_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_tokons`
--
ALTER TABLE `device_tokons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_tokons_userid_foreign` (`userId`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friend_requests_userid_foreign` (`userId`),
  ADD KEY `friend_requests_friendid_foreign` (`friendId`),
  ADD KEY `friend_requests_chatId_foreign` (`chatId`);

--
-- Indexes for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `interests`
--
ALTER TABLE `interests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interests_userid_foreign` (`userId`),
  ADD KEY `interests_interestid_foreign` (`interestId`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_chatid_foreign` (`chatId`),
  ADD KEY `messages_senderid_foreign` (`senderId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `partner_details`
--
ALTER TABLE `partner_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_details_coupleid_foreign` (`coupleId`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_views`
--
ALTER TABLE `profile_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_views_viewby_foreign` (`viewBy`),
  ADD KEY `profile_views_userid_foreign` (`userId`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upload_images`
--
ALTER TABLE `upload_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_images_userid_foreign` (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_emailaddress_unique` (`emailAddress`),
  ADD KEY `users_userrole_foreign` (`userRole`),
  ADD KEY `users_couplecategories_foreign` (`coupleCategories`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notifications_senderid_foreign` (`senderId`),
  ADD KEY `user_notifications_receiverid_foreign` (`receiverId`);

--
-- Indexes for table `user_phone_verifications`
--
ALTER TABLE `user_phone_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_roles_userrole_unique` (`userRole`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_subscriptions_userid_foreign` (`userId`),
  ADD KEY `user_subscriptions_subscriptionid_foreign` (`subscriptionId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_interests`
--
ALTER TABLE `all_interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `conditions`
--
ALTER TABLE `conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `couple_categories`
--
ALTER TABLE `couple_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `device_tokons`
--
ALTER TABLE `device_tokons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `f_a_q_s`
--
ALTER TABLE `f_a_q_s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `interests`
--
ALTER TABLE `interests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=818;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `partner_details`
--
ALTER TABLE `partner_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=577;

--
-- AUTO_INCREMENT for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `profile_views`
--
ALTER TABLE `profile_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `upload_images`
--
ALTER TABLE `upload_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=522;

--
-- AUTO_INCREMENT for table `user_phone_verifications`
--
ALTER TABLE `user_phone_verifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_receiverid_foreign` FOREIGN KEY (`receiverId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `chats_senderid_foreign` FOREIGN KEY (`senderId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `device_tokons`
--
ALTER TABLE `device_tokons`
  ADD CONSTRAINT `device_tokons_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD CONSTRAINT `friend_requests_chatId_foreign` FOREIGN KEY (`chatId`) REFERENCES `chats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_requests_friendid_foreign` FOREIGN KEY (`friendId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_requests_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `interests`
--
ALTER TABLE `interests`
  ADD CONSTRAINT `interests_interestid_foreign` FOREIGN KEY (`interestId`) REFERENCES `all_interests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `interests_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_chatid_foreign` FOREIGN KEY (`chatId`) REFERENCES `chats` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_senderid_foreign` FOREIGN KEY (`senderId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `partner_details`
--
ALTER TABLE `partner_details`
  ADD CONSTRAINT `partner_details_coupleid_foreign` FOREIGN KEY (`coupleId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `profile_views`
--
ALTER TABLE `profile_views`
  ADD CONSTRAINT `profile_views_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `profile_views_viewby_foreign` FOREIGN KEY (`viewBy`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `upload_images`
--
ALTER TABLE `upload_images`
  ADD CONSTRAINT `upload_images_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_couplecategories_foreign` FOREIGN KEY (`coupleCategories`) REFERENCES `couple_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_userrole_foreign` FOREIGN KEY (`userRole`) REFERENCES `user_roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD CONSTRAINT `user_notifications_receiverid_foreign` FOREIGN KEY (`receiverId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_notifications_senderid_foreign` FOREIGN KEY (`senderId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD CONSTRAINT `user_subscriptions_subscriptionid_foreign` FOREIGN KEY (`subscriptionId`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_subscriptions_userid_foreign` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
