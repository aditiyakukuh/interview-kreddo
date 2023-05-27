-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 27, 2023 at 07:11 AM
-- Server version: 8.0.32
-- PHP Version: 8.1.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kreddo-int`
--

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
(5, '2023_05_26_070030_create_tasks_table', 1);

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
(3, 'App\\Models\\User', 2, 'auth_token', '462aa67cbc4782d533a5294359417ed1a849277a5b694aa631b9e2d1e2d8b170', '[\"*\"]', NULL, NULL, '2023-05-27 04:20:13', '2023-05-27 04:20:13'),
(5, 'App\\Models\\User', 1, 'auth_token', '0533458933cac47e2e16dcd25654b286a06034b24393b1ccfe785c7f8a876d03', '[\"*\"]', '2023-05-27 05:46:16', NULL, '2023-05-27 05:46:08', '2023-05-27 05:46:16'),
(6, 'App\\Models\\User', 2, 'auth_token', 'b58dd623d909dc4734b3184991d1c4603a9b21aa2334426aac505537b635d0ca', '[\"*\"]', '2023-05-27 07:04:14', NULL, '2023-05-27 06:15:58', '2023-05-27 07:04:14'),
(7, 'App\\Models\\User', 3, 'auth_token', 'fa61334ebb194eef460732d50e1ea00d2bdcd3360017b8e868d433a607050272', '[\"*\"]', NULL, NULL, '2023-05-27 06:42:31', '2023-05-27 06:42:31'),
(8, 'App\\Models\\User', 1, 'auth_token', '7217d0d28bf1befc6f8f863bd49dc9cc6e47da891c7b042f52d37a78003003cd', '[\"*\"]', '2023-05-27 06:54:13', NULL, '2023-05-27 06:52:47', '2023-05-27 06:54:13'),
(9, 'App\\Models\\User', 1, 'auth_token', '4209425f89d3950f8110f34c17ac77f18f06f9b4cba0e8c0d36eb978c8f39984', '[\"*\"]', NULL, NULL, '2023-05-27 07:00:55', '2023-05-27 07:00:55'),
(10, 'App\\Models\\User', 1, 'auth_token', 'ca909f08623bfece38f66f51b0e6596b6ed3e9dfed085431be844d080462c04e', '[\"*\"]', NULL, NULL, '2023-05-27 07:01:17', '2023-05-27 07:01:17'),
(12, 'App\\Models\\User', 1, 'auth_token', 'aa4d6f728fd5f2adf8c96d4678951c1bb2c18b26ee34af10a2d2285620f36c2d', '[\"*\"]', '2023-05-27 07:05:38', NULL, '2023-05-27 07:03:33', '2023-05-27 07:05:38'),
(13, 'App\\Models\\User', 2, 'auth_token', 'b2aaa1d9221ea43318eea546cd58d9b23fde57bdf65bdd6ed7bb641e872aaed3', '[\"*\"]', '2023-05-27 07:06:43', NULL, '2023-05-27 07:04:36', '2023-05-27 07:06:43');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` enum('low','medium','high') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','in-progress','completed') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `expired_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `priority`, `status`, `user_id`, `expired_at`, `created_at`, `updated_at`) VALUES
(1, 'job1', 'Ratione et itaque et sapiente iusto aperiam dolor. Ut id temporibus dolor atque ratione a voluptatem.', 'medium', 'pending', 1, '2023-05-27 11:16:54', '2023-05-26 11:16:54', '2023-05-26 11:16:54'),
(3, 'job3', 'Est ut possimus voluptatem qui modi magnam doloribus modi. Tempora quis perspiciatis asperiores. Nostrum et itaque voluptates rem pariatur dolores itaque.', 'medium', 'in-progress', 1, '2023-05-29 11:16:54', '2023-05-26 11:16:54', '2023-05-26 11:16:54'),
(4, 'job4', 'Corporis ut qui cupiditate eaque autem aut minus. Non fugiat ad sint et qui et. Omnis nemo ab quas enim et non commodi.', 'low', 'completed', 1, '2023-05-30 11:16:54', '2023-05-26 11:16:54', '2023-05-26 11:16:54'),
(5, 'job5', 'Quia soluta autem sit modi sint qui. Non sint voluptatibus eos. Aut odit ratione sunt accusantium.', 'high', 'completed', 1, '2023-05-31 11:16:54', '2023-05-26 11:16:54', '2023-05-26 11:16:54'),
(6, 'job6', 'Architecto eligendi et consequuntur. Eum ipsam nihil tempora eius.', 'medium', 'pending', 1, '2023-06-01 11:16:54', '2023-05-26 11:16:54', '2023-05-26 11:16:54'),
(7, 'job7', 'Delectus quas vero sint dolorum corrupti dicta ullam autem. Impedit ut quos quos consequatur est. Fugiat et ipsam et quis recusandae dolorem.', 'medium', 'pending', 1, '2023-06-02 11:16:54', '2023-05-26 11:16:54', '2023-05-26 11:16:54'),
(8, 'job8', 'Ut eum magnam tempore ipsam quod sit aut. Voluptates vel quaerat nesciunt cumque. Et consectetur occaecati sed autem voluptatem.', 'medium', 'pending', 1, '2023-06-03 11:16:54', '2023-05-26 11:16:54', '2023-05-26 11:16:54'),
(9, 'job9', 'Accusamus ut asperiores ipsa aut culpa quaerat voluptatem animi. Iusto qui non suscipit natus quam repellat. Est ut perferendis quos voluptas autem aperiam sunt.', 'low', 'pending', 1, '2023-06-04 11:16:54', '2023-05-26 11:16:54', '2023-05-26 11:16:54'),
(10, 'job10', 'Adipisci ipsa inventore dicta recusandae rerum vel. Iusto aliquid ut ducimus reprehenderit. Doloribus cum et rem nemo occaecati error quia.', 'medium', 'in-progress', 1, '2023-06-05 11:16:54', '2023-05-26 11:16:54', '2023-05-26 11:16:54'),
(11, 'job 15', 'lorem insum blablablabla', 'low', 'pending', 1, '2023-05-21 00:00:00', '2023-05-26 11:44:33', '2023-05-26 11:44:33');

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
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2023-05-26 11:16:54', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'fH0MN8Y9eW', '2023-05-26 11:16:54', '2023-05-26 11:16:54'),
(2, 'new', 'new@example.com', NULL, '$2y$10$9hNkmZPye0R/9ZtVciCnN.qeydveTS/3eIoRlEuWOhL8ZiBv5GHJW', NULL, '2023-05-27 04:20:13', '2023-05-27 04:20:13'),
(3, 'new', 'new2@example.com', NULL, '$2y$10$MKrhiyJZo9UZba4yVH60B.c/vEDyTCVF6VgbLXuQoTxt3hz7elXuO', NULL, '2023-05-27 06:42:31', '2023-05-27 06:42:31'),
(4, 'new', 'new5@example.com', NULL, '$2y$10$6Mn/znDLCkuTr80eb1iKhecLdYoy/usvC5sjT9FCduWEcKQ4hLamy', NULL, '2023-05-27 07:01:33', '2023-05-27 07:01:33');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
