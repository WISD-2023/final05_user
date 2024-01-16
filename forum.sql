-- Adminer 4.8.1 MySQL 5.7.11 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `administrator`;
CREATE TABLE `administrator` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `administrator_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `administrator` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1,	'管理員1',	'fuuzuki200337@gmail.com',	'$2y$10$dDtrHRc39V/JOiURjQvtpeY1msfw12oAxiL.5/ez4ufZDrOPr9L.y',	'2023-12-27 07:15:08',	'2023-12-27 07:15:08');

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` bigint(20) unsigned NOT NULL,
  `members_id` bigint(20) unsigned NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `article` (`id`, `forum_id`, `members_id`, `Name`, `Content`, `created_at`, `updated_at`) VALUES
(3,	1,	1,	'有馬記念',	'有馬記念（ありまきねん）は、日本中央競馬会（JRA）が中山競馬場で実施する中央競馬の重賞競走（GI）である。\r\n\r\n寄贈賞は日本馬主協会連合会会長賞、中山馬主協会賞。',	'2023-12-28 19:23:55',	'2023-12-28 19:23:55'),
(5,	2,	1,	'1111',	'111',	'2024-01-09 19:00:01',	'2024-01-09 19:00:01');

DROP TABLE IF EXISTS `blacklisted`;
CREATE TABLE `blacklisted` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `members_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `blacklisted` (`id`, `members_id`, `created_at`, `updated_at`) VALUES
(13,	4,	'2024-01-09 19:15:46',	'2024-01-09 19:15:46');

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `members_id` bigint(20) unsigned NOT NULL,
  `article_id` bigint(20) unsigned NOT NULL,
  `Content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `comments` (`id`, `members_id`, `article_id`, `Content`, `created_at`, `updated_at`) VALUES
(1,	1,	2,	'1400次16歲',	'2023-12-28 05:16:43',	'2023-12-28 05:16:43'),
(4,	1,	6,	'測試',	'2023-12-28 23:42:27',	'2023-12-28 23:42:27'),
(5,	1,	3,	'1122',	'2024-01-09 17:51:29',	'2024-01-09 17:51:29'),
(6,	1,	2,	'11',	'2024-01-09 18:57:14',	'2024-01-09 18:57:14');

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `forum_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_forum` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `forum` (`id`, `forum_name`, `number_of_forum`, `created_at`, `updated_at`) VALUES
(1,	'ACG',	0,	'2023-12-27 07:20:25',	'2023-12-27 07:20:25'),
(2,	'賭博',	0,	'2023-12-28 21:40:01',	'2023-12-28 21:40:01'),
(3,	'國際',	0,	'2023-12-28 23:47:03',	'2023-12-28 23:47:03'),
(4,	'政治',	0,	'2024-01-09 19:09:10',	'2024-01-09 19:09:10');

DROP TABLE IF EXISTS `members`;
CREATE TABLE `members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `is_blocked` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `members_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `members` (`id`, `name`, `email`, `email_verified_at`, `password`, `sex`, `birthday`, `is_blocked`, `remember_token`, `created_at`, `updated_at`) VALUES
(1,	'Fuuzuki',	'yaesakura716207@gmail.com',	NULL,	'$2y$10$ZO4I5C7vOIBmViHRp2P98.w5GJFiWjV2JHNtwz57B729aHrPeihGi',	'男',	'2003-03-07',	0,	'8kglsUgtCRs7y5NmuA46j79fv4g8AqiwaOP2TxC3VsSkTusHkZDB0666Ca0c',	'2023-12-27 07:03:23',	'2023-12-27 07:03:23'),
(2,	'Taiga',	'yaesakura0417@gmail.com',	NULL,	'$2y$10$JCuBJoplxQ8R47xkZagXvuKbvkNBXtU9bn92WJenoYcNcmUAieNYq',	'男',	'2003-03-07',	0,	NULL,	'2023-12-27 07:04:15',	'2024-01-09 19:10:42'),
(3,	'77777',	'kasper1116.kh@gmail.com',	NULL,	'$2y$10$kf8wj9vljsusB1sSv5rgZ.fMzxj7XUpZMHP0ARDqav5xQ7YprJuKu',	'人妖',	'2023-12-05',	0,	NULL,	'2023-12-28 22:05:27',	'2023-12-28 22:05:27'),
(4,	'Hoshigawa',	'kasper@gmail.com',	NULL,	'$2y$10$2x2HNpP2Cu/QttokBppoo.1sSTYO8JS5wm7fqp0PcwIAKGdyvu2ue',	'男',	'2024-01-08',	1,	NULL,	'2024-01-09 19:03:04',	'2024-01-09 19:15:46');

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6,	'2023_12_14_154002_acreate_article_table',	3),
(10,	'2023_12_24_035604_create_votelist_table',	6),
(11,	'2023_12_24_043242_create_votelist_table',	7),
(17,	'2023_12_25_133641_administrator',	12),
(18,	'2023_12_25_133728_blacklisted',	12),
(21,	'2014_10_12_000000_create_users_table',	13),
(22,	'2014_10_12_100000_create_password_reset_tokens_table',	13),
(23,	'2019_08_19_000000_create_failed_jobs_table',	13),
(24,	'2019_12_14_000001_create_personal_access_tokens_table',	13),
(25,	'2023_12_10_084225_ccreate_forum_table',	13),
(26,	'2023_12_14_193300_create_article_table',	13),
(27,	'2023_12_14_204523_create_comments_table',	13),
(28,	'2023_12_24_091720_create__voting__record_table',	13),
(29,	'2023_12_24_093020_create_vote_table',	13),
(30,	'2023_12_24_124929_create_report_table',	13),
(31,	'2023_12_27_145106_create_report_table',	14),
(32,	'2023_12_27_150842_create_administrator_table',	15),
(34,	'2023_12_27_160906_create_report_table',	16),
(35,	'2023_12_27_162150_create_report_table',	17);

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Com_id` bigint(20) unsigned NOT NULL,
  `Acc_id` bigint(20) unsigned NOT NULL,
  `Reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_handle` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `report` (`id`, `Com_id`, `Acc_id`, `Reason`, `is_handle`, `created_at`, `updated_at`) VALUES
(1,	1,	2,	'不爽',	1,	'2023-12-27 08:23:57',	'2023-12-27 17:33:12'),
(3,	1,	2,	'我不爽他',	1,	'2023-12-27 08:54:30',	'2023-12-27 17:36:51'),
(4,	1,	2,	'123',	1,	'2023-12-28 21:35:51',	'2023-12-28 21:40:16'),
(5,	1,	2,	'4213',	1,	'2023-12-28 23:43:00',	'2023-12-28 23:47:28'),
(6,	2,	4,	'1231',	1,	'2024-01-09 19:14:51',	'2024-01-09 19:15:46');

DROP TABLE IF EXISTS `vote`;
CREATE TABLE `vote` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Total_vote` int(11) NOT NULL,
  `Result` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `vote` (`id`, `Title`, `Content`, `Total_vote`, `Result`, `created_at`, `updated_at`) VALUES
(1,	'測試',	'測試',	2,	'已通過',	'2023-12-27 08:46:44',	'2024-01-09 19:03:43'),
(2,	'測試1',	'113132',	2,	'已通過',	'2023-12-28 21:36:59',	'2023-12-28 22:15:13'),
(3,	'123',	'1',	1,	'已通過',	'2023-12-28 23:02:06',	'2023-12-28 23:46:43'),
(4,	'要求新增討論區',	'要求新增討論區',	1,	'已通過',	'2023-12-28 23:44:09',	'2024-01-09 19:06:19'),
(5,	'要求...',	'要求',	2,	'尚未通過',	'2024-01-09 17:52:30',	'2024-01-09 19:03:24'),
(6,	'hhhh',	'yrtey',	7,	'尚未通過',	'2024-01-09 19:00:57',	'2024-01-09 19:03:35');

DROP TABLE IF EXISTS `voting_record`;
CREATE TABLE `voting_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `members_id` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL,
  `Selection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `voting_record` (`id`, `members_id`, `vote_id`, `Selection`, `created_at`, `updated_at`) VALUES
(1,	1,	1,	'同意',	'2023-12-27 08:46:56',	'2023-12-27 08:46:56'),
(2,	1,	2,	'同意',	'2023-12-28 21:37:05',	'2023-12-28 21:37:05'),
(3,	1,	1,	'同意',	'2023-12-28 21:39:35',	'2023-12-28 21:39:35'),
(4,	3,	2,	'同意',	'2023-12-28 22:12:45',	'2023-12-28 22:12:45'),
(5,	1,	2,	'同意',	'2023-12-28 22:15:13',	'2023-12-28 22:15:13'),
(6,	1,	3,	'同意',	'2023-12-28 23:02:12',	'2023-12-28 23:02:12'),
(7,	1,	4,	'同意',	'2023-12-28 23:44:21',	'2023-12-28 23:44:21'),
(8,	1,	3,	'同意',	'2023-12-28 23:46:43',	'2023-12-28 23:46:43'),
(9,	1,	5,	'同意',	'2024-01-09 17:52:37',	'2024-01-09 17:52:37'),
(10,	1,	6,	'同意',	'2024-01-09 19:01:03',	'2024-01-09 19:01:03'),
(11,	4,	6,	'同意',	'2024-01-09 19:03:14',	'2024-01-09 19:03:14'),
(12,	4,	6,	'同意',	'2024-01-09 19:03:17',	'2024-01-09 19:03:17'),
(13,	4,	6,	'同意',	'2024-01-09 19:03:19',	'2024-01-09 19:03:19'),
(14,	4,	6,	'同意',	'2024-01-09 19:03:22',	'2024-01-09 19:03:22'),
(15,	4,	5,	'同意',	'2024-01-09 19:03:24',	'2024-01-09 19:03:24'),
(16,	4,	6,	'同意',	'2024-01-09 19:03:31',	'2024-01-09 19:03:31'),
(17,	4,	6,	'同意',	'2024-01-09 19:03:35',	'2024-01-09 19:03:35'),
(18,	4,	1,	'同意',	'2024-01-09 19:03:43',	'2024-01-09 19:03:43'),
(19,	1,	4,	'同意',	'2024-01-09 19:06:19',	'2024-01-09 19:06:19');

-- 2024-01-16 12:49:48
