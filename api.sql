-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2023 at 03:05 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `api`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `employee_id`, `in_time`, `out_time`, `created_at`, `updated_at`) VALUES
(1, 1, '09:00:00', '18:00:00', '2023-12-17 01:56:02', '2023-11-15 01:56:02'),
(2, 2, '09:00:00', '18:00:00', '2023-12-17 01:56:08', '2023-11-16 01:56:08'),
(3, 3, '09:00:00', '18:00:00', '2023-12-17 01:56:10', '2023-11-16 01:56:08'),
(4, 4, '09:00:00', '18:00:00', '2023-12-17 01:56:14', '2023-11-16 01:56:08'),
(5, 5, '09:00:00', '18:00:00', '2023-12-17 01:56:17', '2023-11-16 01:56:08'),
(7, 5, '09:00:00', '18:00:00', '2023-12-17 04:49:53', '2023-11-16 01:56:08'),
(8, 5, '09:00:00', '18:00:00', '2023-12-17 04:49:55', '2023-11-16 01:56:08'),
(9, 5, '09:00:00', '18:00:00', '2023-12-17 04:49:56', '2023-11-16 01:56:08'),
(10, 5, '09:00:00', '18:00:00', '2023-12-17 04:49:57', '2023-11-16 01:56:08');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Laravel', '2023-12-17 01:46:37', '2023-12-17 01:46:37'),
(2, 'Mern Stack', '2023-12-17 01:46:51', '2023-12-17 01:46:51'),
(3, 'Worldpress', '2023-12-17 01:46:59', '2023-12-17 01:46:59'),
(4, 'HR', '2023-12-17 01:47:03', '2023-12-17 01:47:03'),
(5, 'Accountant', '2023-12-17 01:47:09', '2023-12-17 01:47:09'),
(6, 'Marketing & Sales', '2023-12-17 01:47:24', '2023-12-17 01:47:24'),
(7, 'Digital Marketing', '2023-12-17 01:47:41', '2023-12-17 01:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `position_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `position_id`, `name`, `email`, `phone_number`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dharmesh Chudasama', 'dharmeh@gmail.com', '7676767676', 'Vadodara ajwaroad', '2023-12-17 01:53:45', '2023-12-17 01:53:45'),
(2, 3, 'Karan Patil', 'karan@gmail.com', '443434353', 'Vadodara ajwaroad', '2023-12-17 01:54:11', '2023-12-17 01:54:11'),
(3, 2, 'Suraj Vaghela', 'suraj@gmail.com', '443434353', 'Vadodara ajwaroad', '2023-12-17 01:54:36', '2023-12-17 01:54:36'),
(4, 5, 'Gaurav Chuhan', 'gaurav@gmail.com', '34567876543', 'Vadodara ajwaroad', '2023-12-17 01:54:57', '2023-12-17 01:54:57'),
(5, 6, 'Shewet garud', 'shewet@gmail.com', '34567876543', 'Vadodara ajwaroad', '2023-12-17 01:55:22', '2023-12-17 01:55:22');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2023_12_16_180918_create_departments_table', 2),
(11, '2023_12_17_025828_create_positions_table', 3),
(12, '2023_12_17_045701_create_employees_table', 4),
(13, '2023_12_17_060256_create_salaries_table', 5),
(14, '2023_12_17_063558_create_attendances_table', 6),
(15, '2023_12_17_070839_create_salary_calculations_table', 7),
(16, '2023_12_17_095851_create_salary_calculations_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('ee149ab2e3eabaa922604effd09bd23d8c4ae53e73c68855553c723f2027a6d9c735ad0bc127f239', 14, 5, 'Laravel10PassportAuth', '[]', 0, '2023-12-16 12:29:32', '2023-12-16 12:29:33', '2024-12-16 17:59:32'),
('f07442150be295faa0db647763b678371fc72df4cadf038a634969570edf858461e973c739734f4d', 1, 5, 'MyApp', '[]', 0, '2023-12-16 13:06:25', '2023-12-16 13:06:25', '2024-12-16 18:36:25'),
('f6f713d0256c3f69b6a2c8ae929a682697432558f2c22c6886cf88abb182ab2c3c2df1ae08ea94e0', 1, 5, 'MyApp', '[]', 0, '2023-12-16 12:35:22', '2023-12-16 12:35:22', '2024-12-16 18:05:22');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'BNGzLwU1yaXTV4MuRO2a30yVoxP4aBnsEHd4uvEJ', NULL, 'http://localhost', 1, 0, 0, '2023-12-16 08:25:22', '2023-12-16 08:25:22'),
(2, NULL, 'Laravel Password Grant Client', 'X3FuZMbPwzy3IUYYc54wZeDk5SBpHacWUDhHz4nz', 'users', 'http://localhost', 0, 1, 0, '2023-12-16 08:25:23', '2023-12-16 08:25:23'),
(3, NULL, 'Laravel Personal Access Client', '$2y$10$SBxqZNRQ4ZxpFGXP/ZvXfOaeygJnpL79dMxap1Nd7tULMasTr9Dqe', NULL, 'http://localhost', 1, 0, 0, '2023-12-16 11:25:13', '2023-12-16 11:25:13'),
(4, NULL, 'Laravel Password Grant Client', '$2y$10$ppQDxsdibt5A92jzKIgQdeAxn8q.0f98NDH51k3zimm5wl2JQePwy', 'users', 'http://localhost', 0, 1, 0, '2023-12-16 11:25:14', '2023-12-16 11:25:14'),
(5, NULL, 'Laravel Personal Access Client', 'TEDXLQDKouZSWShlksxlJFf9QQkOAPrlOpkY1E1G', NULL, 'http://localhost', 1, 0, 0, '2023-12-16 11:58:46', '2023-12-16 11:58:46'),
(6, NULL, 'Laravel Password Grant Client', 'Aud4eKJSk6nIhxXJmLVWXxQczJ6z2CNSAGvzg7EK', 'users', 'http://localhost', 0, 1, 0, '2023-12-16 11:58:46', '2023-12-16 11:58:46');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-12-16 08:25:22', '2023-12-16 08:25:22'),
(2, 3, '2023-12-16 11:25:13', '2023-12-16 11:25:13'),
(3, 5, '2023-12-16 11:58:46', '2023-12-16 11:58:46');

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
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', '713777d6da4e303abb0526e911e2ff3ff70347d0ce60e453d195b55cff5e9761', '[\"*\"]', NULL, NULL, '2023-12-16 11:18:45', '2023-12-16 11:18:45'),
(2, 'App\\Models\\User', 3, 'MyApp', '9e7b1b922737c01f9405b6e321759a98128f556057258efa528187aa94542a68', '[\"*\"]', NULL, NULL, '2023-12-16 11:25:50', '2023-12-16 11:25:50'),
(3, 'App\\Models\\User', 5, 'MyApp', '7b3d76fdff7ce5db656fbc76e4e02693aee214cb2c24ef2164748559b6aa4e0c', '[\"*\"]', NULL, NULL, '2023-12-16 11:26:22', '2023-12-16 11:26:22'),
(4, 'App\\Models\\User', 6, 'MyApp', 'd70df33c6b54a501ccd6f228179f95d9550474d2156f0d506b0c022e0a86aac4', '[\"*\"]', NULL, NULL, '2023-12-16 11:31:55', '2023-12-16 11:31:55'),
(5, 'App\\Models\\User', 7, 'MyApp', 'b14f412c6d19056e193fb4fe328c18e0f43099f7e513f278e78b2656f83099ad', '[\"*\"]', NULL, NULL, '2023-12-16 11:33:52', '2023-12-16 11:33:52'),
(6, 'App\\Models\\User', 8, 'MyApp', '53ed50101089304111d296fdce0ad776f7684020bf5745513bd1c5fdbe12ec52', '[\"*\"]', NULL, NULL, '2023-12-16 11:34:19', '2023-12-16 11:34:19'),
(7, 'App\\Models\\User', 1, 'MyApp', '817c3adabfe70ad782d07267713e3ca7a676e8114308cc5038a161ce2c2d53f4', '[\"*\"]', NULL, NULL, '2023-12-16 11:42:51', '2023-12-16 11:42:51'),
(8, 'App\\Models\\User', 1, 'MyApp', '5a13d1ddf32e8988622a4ab8dafbf6abb5d7420924691b45348079b66aa7158b', '[\"*\"]', NULL, NULL, '2023-12-16 11:44:30', '2023-12-16 11:44:30'),
(9, 'App\\Models\\User', 1, 'MyApp', '71f92ca36d85d3cd3365eeec4b55f9ef40efecf7132fb026cc3d44e47ad691d7', '[\"*\"]', NULL, NULL, '2023-12-16 11:51:04', '2023-12-16 11:51:04'),
(10, 'App\\Models\\User', 1, 'Laravelia', 'f0d4c17d02538dbe50b4466dea605f66c4b383054dcb67e01f277c66bcdb56b7', '[\"*\"]', NULL, NULL, '2023-12-16 11:51:40', '2023-12-16 11:51:40'),
(11, 'App\\Models\\User', 10, 'Laravel10PassportAuth', 'e5eb8cb49a82d40366205aec3339ae1533a9163df1b0b33aa6040b8d60e4b250', '[\"*\"]', NULL, NULL, '2023-12-16 11:58:16', '2023-12-16 11:58:16'),
(12, 'App\\Models\\User', 11, 'Laravel10PassportAuth', '4111fc4060d72457a35b605c40ea834f105f06e2b89720a8ae8be57372a092f5', '[\"*\"]', NULL, NULL, '2023-12-16 11:58:56', '2023-12-16 11:58:56'),
(13, 'App\\Models\\User', 12, 'Laravel10PassportAuth', '2c21a082a69d8b7b1a0ab014118c66e8d13880378c92045217f2a27f791b6e2c', '[\"*\"]', NULL, NULL, '2023-12-16 12:15:27', '2023-12-16 12:15:27'),
(14, 'App\\Models\\User', 13, 'Laravel10PassportAuth', 'e8a242dd25af23276653f1e67e6ba28018669318e91ad6fd99efb83f3a5ed521', '[\"*\"]', NULL, NULL, '2023-12-16 12:27:10', '2023-12-16 12:27:10');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `department_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Jr. Laravel Devloper', '2023-12-17 01:48:16', '2023-12-17 01:48:16'),
(2, 1, 'Sr. Laravel Devloper', '2023-12-17 01:48:21', '2023-12-17 01:48:21'),
(3, 1, 'Team Leader Laravel Devloper', '2023-12-17 01:48:35', '2023-12-17 01:48:35'),
(4, 2, 'Team Leader Mern Stack', '2023-12-17 01:48:47', '2023-12-17 01:48:47'),
(5, 2, 'Jr. Mern Stack', '2023-12-17 01:48:54', '2023-12-17 01:48:54'),
(6, 2, 'Sr. Mern Stack', '2023-12-17 01:48:57', '2023-12-17 01:48:57'),
(7, 3, 'Sr. Worldpress', '2023-12-17 01:49:18', '2023-12-17 01:49:18'),
(8, 3, 'Jr. Worldpress', '2023-12-17 01:49:25', '2023-12-17 01:49:25'),
(9, 3, 'Team Leader Worldpress', '2023-12-17 01:49:33', '2023-12-17 01:49:33'),
(11, 4, 'Sr. HR', '2023-12-17 01:50:39', '2023-12-17 01:50:39'),
(12, 4, 'Jr. HR', '2023-12-17 01:50:44', '2023-12-17 01:50:44');

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `basic_salary` int(11) DEFAULT NULL,
  `hra` int(11) DEFAULT NULL,
  `da` int(11) DEFAULT NULL,
  `other_allowances` int(11) DEFAULT NULL,
  `gross_salary` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`id`, `employee_id`, `basic_salary`, `hra`, `da`, `other_allowances`, `gross_salary`, `created_at`, `updated_at`) VALUES
(1, 1, 10000, 2000, 1000, 1000, 14000, '2023-12-17 03:22:38', '2023-12-17 03:22:38'),
(3, 2, 15000, 2000, 1000, 1000, 19000, '2023-12-17 03:23:53', '2023-12-17 03:23:53'),
(4, 3, 18000, 2000, 1000, 1000, 22000, '2023-12-17 03:24:08', '2023-12-17 03:24:08'),
(5, 4, 8000, 2000, 1000, 1000, 12000, '2023-12-17 03:24:25', '2023-12-17 03:24:25'),
(6, 5, 22000, 2000, 1000, 1000, 26000, '2023-12-17 03:24:49', '2023-12-17 03:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `salary_calculations`
--

CREATE TABLE `salary_calculations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `calculation_date` date DEFAULT NULL,
  `calculated_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `month_salary` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `salary_calculations`
--

INSERT INTO `salary_calculations` (`id`, `employee_id`, `calculation_date`, `calculated_month`, `month_salary`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-12-17', '2023-11', NULL, 'pending', '2023-12-17 07:42:57', '2023-12-17 07:42:57'),
(2, 2, '2023-12-17', '2023-11', NULL, 'pending', '2023-12-17 07:42:57', '2023-12-17 07:42:57'),
(3, 3, '2023-12-17', '2023-11', NULL, 'pending', '2023-12-17 07:42:57', '2023-12-17 07:42:57'),
(4, 4, '2023-12-17', '2023-11', NULL, 'pending', '2023-12-17 07:42:57', '2023-12-17 07:42:57'),
(5, 5, '2023-12-17', '2023-11', NULL, 'pending', '2023-12-17 07:42:57', '2023-12-17 07:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Dharmesh', 'dc@gmail.com', NULL, '$2y$12$l0u2Kj9SldRe0JjWjLfoxe6yBCcLKYQJoCQNcXwP2tJ/2bDhEOknK', NULL, '2023-12-16 11:18:45', '2023-12-16 11:18:45'),
(3, 'Dharmesh', 'dc2@gmail.com', NULL, '$2y$12$VhOxAviPoBSPa7QBsIWH9.8tWlAk1PGr0dyrM8hK.xtPltVC.TJw2', NULL, '2023-12-16 11:25:50', '2023-12-16 11:25:50'),
(5, 'Dharmesh', 'dc3@gmail.com', NULL, '$2y$12$VBxiRW6IFUxwULWymcF2wutblfkUMSOddFYPntQZwwO3921aBu9Au', NULL, '2023-12-16 11:26:22', '2023-12-16 11:26:22'),
(6, 'Dharmesh', 'dc4@gmail.com', NULL, '$2y$12$BKpmlsQgtsykkgTFg/va5eB2T5u7rkTAK.AzsHGdvFirb/HdLavLW', NULL, '2023-12-16 11:31:55', '2023-12-16 11:31:55'),
(7, 'Dharmesh', 'dc5@gmail.com', NULL, '$2y$12$H1Ux7MH28OcOM/eR1YuNH.hwg8j0qw1YRlXqdR33tWPrOLZYbwIM.', NULL, '2023-12-16 11:33:52', '2023-12-16 11:33:52'),
(8, 'Dharmesh', 'dc6@gmail.com', NULL, '$2y$12$ACTxEdRha308zSLSvWxRteMkpl/X7z2QdrmnfmYzmBLRPQtXF3Xni', NULL, '2023-12-16 11:34:19', '2023-12-16 11:34:19'),
(9, 'Dharmesh', 'dc7@gmail.com', NULL, '$2y$12$YhmNehTGoewwJKhZ5emo3OqujfxpPfaSyzcajxROZWSoTHFjph76O', NULL, '2023-12-16 11:48:55', '2023-12-16 11:48:55'),
(10, 'Dharmesh', 'dc8@gmail.com', NULL, '$2y$12$/W9IMK2IO9m77E5NjQeQP.es/Z5m8xk9X41KO1bW4b6Y6nrVvkH1u', NULL, '2023-12-16 11:58:16', '2023-12-16 11:58:16'),
(11, 'Dharmesh', 'dc9@gmail.com', NULL, '$2y$12$1A6mkExGMNk7rYm5Qnukt.l1nS3VoHRrWAbv7wx0vOzmoKkxr.fWu', NULL, '2023-12-16 11:58:56', '2023-12-16 11:58:56'),
(12, 'Dharmesh', 'dc20@gmail.com', NULL, '$2y$12$2MW84L0LtddGg0LCxFkEF.CqbDWUuIXIbVRHsHtnHr66J.bnYu.tS', NULL, '2023-12-16 12:15:27', '2023-12-16 12:15:27'),
(13, 'Dharmesh', 'dc21@gmail.com', NULL, '$2y$12$RWnAyxO3y5Q1KYBTMcpBoOoIJ41TQnO.CcSLWjkfVMWGTjMOgMiAq', NULL, '2023-12-16 12:27:10', '2023-12-16 12:27:10'),
(14, 'Dharmesh', 'dc25@gmail.com', NULL, '$2y$12$dVXuTFwmSrOAKBmmsVtwu.ksbNCOE0d0sr3zE.Iev81yEAOdjHUnC', NULL, '2023-12-16 12:29:29', '2023-12-16 12:29:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

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
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `positions_name_unique` (`name`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_calculations`
--
ALTER TABLE `salary_calculations`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `salary_calculations`
--
ALTER TABLE `salary_calculations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
