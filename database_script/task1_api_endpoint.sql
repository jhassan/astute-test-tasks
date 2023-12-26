-- Adminer 4.8.1 MySQL 10.4.27-MariaDB dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1,	'2014_10_12_000000_create_users_table',	1),
(2,	'2014_10_12_100000_create_password_reset_tokens_table',	1),
(3,	'2019_08_19_000000_create_failed_jobs_table',	1),
(4,	'2019_12_14_000001_create_personal_access_tokens_table',	1),
(5,	'2023_12_24_100942_create_products_table',	1),
(6,	'2016_06_01_000001_create_oauth_auth_codes_table',	2),
(7,	'2016_06_01_000002_create_oauth_access_tokens_table',	2),
(8,	'2016_06_01_000003_create_oauth_refresh_tokens_table',	2),
(9,	'2016_06_01_000004_create_oauth_clients_table',	2),
(10,	'2016_06_01_000005_create_oauth_personal_access_clients_table',	2),
(11,	'2023_12_25_120140_create_permission_tables',	3),
(12,	'2023_12_26_072606_add_role_id_to_users_table',	4);

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(5,	'App\\Models\\User',	13),
(10,	'App\\Models\\User',	14);

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('1f2d7d4412244228b252a44015c01eaa685b011cb5ad4ffbadc6156818fc208e804c404531bf804b',	13,	5,	'authToken',	'[]',	0,	'2023-12-26 11:49:45',	'2023-12-26 11:49:45',	'2024-12-26 16:49:45'),
('4993196856047f33aa5d3c8b92bf9f1d9e68194007d091dee346b770a4093378e2ed3fbf589cae96',	1,	5,	'authToken',	'[]',	0,	'2023-12-24 08:53:03',	'2023-12-24 08:53:03',	'2024-12-24 13:53:03'),
('69d9533445d48bfc4a88b42a7d243a6ff396026527a84aa460f9683683ecd3d78e02bd070553e843',	1,	5,	'authToken',	'[]',	0,	'2023-12-24 08:53:43',	'2023-12-24 08:53:43',	'2024-12-24 13:53:43'),
('6b6abe7ce62a255276819a8b24639e6ffe44ea81f1496414836571eb290aae87ffacc38e1fda3a5b',	1,	5,	'authToken',	'[]',	0,	'2023-12-24 08:55:10',	'2023-12-24 08:55:10',	'2024-12-24 13:55:10'),
('d7848c3da379e3fe4325666b80950cbe2d747c362c6de57a4f2952cbea0b4785ee60b9f39f61349e',	1,	5,	'authToken',	'[]',	0,	'2023-12-24 08:54:29',	'2023-12-24 08:54:29',	'2024-12-24 13:54:29'),
('fb0a53b1ed897ca01f7e780c4dbfbf25435d69c50e34ad6cfa1230040cd09c99a4dbbc348f9ae3cf',	5,	5,	'authToken',	'[]',	0,	'2023-12-25 08:08:23',	'2023-12-25 08:08:23',	'2024-12-25 13:08:23');

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1,	NULL,	'Laravel Personal Access Client',	't7uUYzKxDPpMjWQEWFIhMgj6asddDlAuJeex7fMS',	NULL,	'http://localhost',	1,	0,	0,	'2023-12-24 08:16:23',	'2023-12-24 08:16:23'),
(2,	NULL,	'Laravel Password Grant Client',	'E3CGQLCuNpYWazGq1E3NkBQvV3DdIhtA7fM7XGdG',	'users',	'http://localhost',	0,	1,	0,	'2023-12-24 08:16:23',	'2023-12-24 08:16:23'),
(3,	NULL,	'Laravel Personal Access Client',	'mbK71R9uHwYevWZVhMctaODfMuZRnKZfGl1tpQzk',	NULL,	'http://localhost',	1,	0,	0,	'2023-12-24 08:32:43',	'2023-12-24 08:32:43'),
(4,	NULL,	'Laravel Password Grant Client',	'lGZATnA2GNbVx2sIibe9eaxAyAgI76QFgmTeOK29',	'users',	'http://localhost',	0,	1,	0,	'2023-12-24 08:32:43',	'2023-12-24 08:32:43'),
(5,	NULL,	'Laravel Personal Access Client',	'i0V0TaEBHTZ85MEXEChEfZ88cpejfQLHA8Naeyct',	NULL,	'http://localhost',	1,	0,	0,	'2023-12-24 08:32:56',	'2023-12-24 08:32:56'),
(6,	NULL,	'Laravel Password Grant Client',	'urXWXQLU75OOmnv8PAO2IY4uGOJUSVX0bqr5x4JP',	'users',	'http://localhost',	0,	1,	0,	'2023-12-24 08:32:56',	'2023-12-24 08:32:56');

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1,	1,	'2023-12-24 08:16:23',	'2023-12-24 08:16:23'),
(2,	3,	'2023-12-24 08:32:43',	'2023-12-24 08:32:43'),
(3,	5,	'2023-12-24 08:32:56',	'2023-12-24 08:32:56');

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1,	'role-list',	'web',	'2023-12-25 07:22:22',	'2023-12-25 07:22:22'),
(2,	'role-create',	'web',	'2023-12-25 07:22:22',	'2023-12-25 07:22:22'),
(3,	'role-edit',	'web',	'2023-12-25 07:22:22',	'2023-12-25 07:22:22'),
(4,	'role-delete',	'web',	'2023-12-25 07:22:22',	'2023-12-25 07:22:22'),
(5,	'product-list',	'web',	'2023-12-25 07:22:22',	'2023-12-25 07:22:22'),
(6,	'product-create',	'web',	'2023-12-25 07:22:22',	'2023-12-25 07:22:22'),
(7,	'product-edit',	'web',	'2023-12-25 07:22:22',	'2023-12-25 07:22:22'),
(8,	'product-delete',	'web',	'2023-12-25 07:22:22',	'2023-12-25 07:22:22'),
(9,	'user-list',	'web',	'2023-12-26 07:09:10',	'2023-12-26 07:09:10'),
(10,	'user-create',	'web',	'2023-12-26 07:09:10',	'2023-12-26 07:09:10'),
(11,	'user-edit',	'web',	'2023-12-26 07:09:10',	'2023-12-26 07:09:10'),
(12,	'user-delete',	'web',	'2023-12-26 07:09:10',	'2023-12-26 07:09:10');

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(9,3) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `products` (`id`, `name`, `description`, `price`, `stock_quantity`, `created_at`, `updated_at`) VALUES
(1,	'Ad autem et eos est cupiditate.',	'Perspiciatis et consequatur aut alias. Eos excepturi praesentium neque omnis molestiae. Ut enim repellendus expedita perspiciatis qui. Et eum a vitae ea.',	2789.000,	118,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(3,	'Qui et perferendis aut dicta excepturi consequatur eligendi.',	'Iure qui molestiae ipsum nobis veniam. Maiores ab qui illum ipsum sit veritatis ab amet. Ut assumenda et minus qui. Qui nihil provident dolore temporibus quia illum reiciendis. Qui et dolores eos in.',	1912.000,	396,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(4,	'Aspernatur sunt optio sit animi ratione ut.',	'Nihil quas dignissimos quasi aliquam et. Quisquam incidunt quis quia nobis repellat voluptas id at.',	1817.000,	459,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(5,	'Ratione asperiores est exercitationem quas.',	'Odio nesciunt libero voluptates quae. Dignissimos culpa fuga quisquam animi quia tempore amet. Quasi voluptas non et reiciendis. Optio a excepturi ducimus blanditiis.',	5038.000,	846,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(6,	'Laboriosam voluptatem ullam pariatur magni nisi.',	'Recusandae magni vel illum voluptatem. Sed voluptas cupiditate voluptate. Magnam enim ut distinctio doloribus.',	1067.000,	872,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(7,	'Harum sed nihil aut amet.',	'Provident modi neque tenetur distinctio velit. Labore eius omnis omnis facilis maiores quibusdam. Nihil incidunt rerum iste. Temporibus cumque totam ipsam magni officiis incidunt soluta.',	5559.000,	755,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(8,	'Nemo rerum mollitia placeat et est aut.',	'Recusandae quos saepe fuga quae repellat laudantium velit. Qui vel quaerat vel quibusdam voluptatem aut. Odit tenetur et repellendus.',	2438.000,	972,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(9,	'Quaerat magnam ut fuga aut quia laudantium dolore.',	'Esse provident inventore quaerat temporibus repellat sunt qui. Nesciunt qui ipsam consequuntur quae fugit minima voluptatem accusantium. Doloremque sequi modi deleniti dolores. Qui ut voluptatum velit nostrum.',	3703.000,	976,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(10,	'Reprehenderit a et aut omnis voluptas aut et.',	'Reiciendis eveniet aut tempore fuga omnis ullam. Voluptatibus exercitationem rerum dicta delectus. Rerum quia quis dicta quibusdam nulla nesciunt placeat. Rerum ut perspiciatis dolorem quia.',	4739.000,	882,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(11,	'Mollitia nihil et nostrum et dicta.',	'Alias dolores ut velit quam non ipsum. Eaque aut est quo accusantium cupiditate corrupti voluptatum. Nulla provident et deserunt aut ad in. Aliquid est quod et cupiditate.',	1752.000,	329,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(12,	'Aut cum nesciunt dolores dolorum.',	'Rerum iste quaerat quae at ipsam. Tenetur ipsum minus porro quis sint et laborum. Ea aliquam optio quas. Aspernatur inventore et deleniti dolor officia voluptates eos.',	5196.000,	644,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(13,	'Sunt dolorum eveniet et omnis sit ut.',	'Voluptatum dolore consectetur perspiciatis voluptatem. Laboriosam minus omnis sit.',	1764.000,	659,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(14,	'Omnis sunt mollitia placeat vitae reprehenderit sapiente laborum.',	'Sint ut nihil vitae architecto. Nesciunt qui quos voluptatibus sed. Aut sed quis magni quibusdam dolores.',	3769.000,	167,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(15,	'Rerum consectetur quos accusamus consequatur modi consequatur odit.',	'Hic sed ut et exercitationem. Sed nulla quod expedita sunt. Enim ut numquam quidem occaecati a ut.',	5410.000,	626,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(16,	'Facere iure dolores aut aut modi consectetur.',	'Sint aut libero dolores id eaque nemo voluptas. Fugit est et dolorum minima ipsum fugiat. Repellendus enim itaque odit culpa mollitia magnam est. Molestias perspiciatis voluptas ex natus dolorum.',	2613.000,	576,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(17,	'Impedit eos sequi cum.',	'Dolorum amet sunt qui autem rerum in illum. Incidunt sapiente voluptatem omnis molestiae nisi voluptatum. Non nobis consequatur doloribus consectetur deserunt perspiciatis magni.',	3045.000,	978,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(18,	'Voluptatem quo nihil quis rerum occaecati.',	'Molestiae dolores non ipsam excepturi. Architecto numquam quae est et nobis nulla quidem. Magnam veniam enim corrupti quasi quia et. Reiciendis aut voluptas non doloribus beatae voluptas corporis.',	2669.000,	651,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(19,	'Accusamus et veritatis amet est esse odio.',	'Non ut dolorem sed vero qui. Id totam molestias eligendi quaerat placeat voluptate dolorum. Excepturi voluptas ut itaque iste est omnis. Odio corporis quam beatae adipisci numquam nam. Dolore id fugiat voluptatibus repellat autem.',	4097.000,	312,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(20,	'Voluptatem praesentium deleniti vel incidunt adipisci veritatis.',	'Molestias voluptatem voluptatem aliquid ex. Quidem ea dolorum dolores error consequatur pariatur ut. Aspernatur ex sit recusandae.',	5199.000,	138,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(21,	'Est hic necessitatibus est autem animi sapiente.',	'Nobis aliquid dolore debitis. Deleniti qui ut dolor corrupti corporis placeat voluptatum. Voluptatum ea rerum assumenda dicta et aut.',	4359.000,	753,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(22,	'Non facilis quia harum aliquid tempore ea perspiciatis consequatur.',	'Suscipit quia illo corrupti est. Consequuntur aut in ab inventore. Quasi atque rerum quis.',	2258.000,	996,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(23,	'Placeat rerum adipisci assumenda enim.',	'Sint occaecati nisi voluptas. Est ut repellat nam id vel dolorem dolorum quia. Eveniet autem quod nostrum voluptatibus quas veniam. Temporibus quo placeat maiores.',	3677.000,	931,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(24,	'Ipsa et ducimus sit rerum facilis et incidunt debitis.',	'Fuga aut dolor fuga et rerum aut sunt. Tenetur sunt et nesciunt est consectetur repellat itaque. Dolore omnis cupiditate aliquam consequuntur illo.',	5085.000,	891,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(25,	'Consequatur eveniet delectus voluptas libero.',	'Recusandae id ut totam id sed. Molestiae eligendi ut mollitia voluptatem nemo eaque.',	4588.000,	249,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(26,	'Impedit impedit ut iusto non non.',	'Non cupiditate minima blanditiis quis suscipit. Aut recusandae sequi id hic animi sit dignissimos. Ut tempora quas dolor minus quisquam officiis quaerat.',	2457.000,	234,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(27,	'Deleniti at libero a adipisci accusantium odit sapiente.',	'Tenetur quo recusandae beatae quia minima quam sed aut. Nam architecto fugiat necessitatibus temporibus laborum nihil.',	1697.000,	976,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(28,	'In enim et rerum iste impedit quia nulla ut.',	'Est quaerat iusto perspiciatis aut quas. Placeat sed non eos et. Cupiditate cum facere aut.',	1247.000,	536,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(29,	'Blanditiis laborum inventore et in eos et reprehenderit ex.',	'Soluta doloremque mollitia tenetur iusto. Odit iste adipisci illo. Nulla est velit voluptatem consequatur voluptatem id aliquam. Tenetur consectetur sit saepe enim et voluptate. Est dolor architecto ut sint aut distinctio.',	1745.000,	219,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(30,	'Aut esse consequatur sed perferendis voluptatibus.',	'Sit enim qui deleniti aut dicta. Possimus earum magnam error possimus possimus. Cupiditate ut et aliquid aut nisi officiis et.',	3257.000,	198,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(31,	'Voluptas occaecati magni optio tempora ea.',	'Aut voluptas consequatur voluptate est debitis. Magnam ea totam eos pariatur labore quos. Illum voluptates harum incidunt numquam nesciunt dolores adipisci.',	3305.000,	163,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(32,	'Repudiandae rem velit quo sed et nihil.',	'Eos est ipsa vel sit ab ratione. Et repudiandae molestiae maiores dolores consequuntur. Quaerat blanditiis enim eaque animi occaecati. Enim aut explicabo consequatur sequi quia.',	2875.000,	540,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(33,	'Fugit aut ut aut et ratione sit qui pariatur.',	'Qui reprehenderit voluptates quis ut ullam. Atque facere accusamus repellendus laudantium quia. Ipsa qui nostrum earum tenetur minus sapiente. Necessitatibus rerum provident nostrum occaecati.',	4631.000,	924,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(34,	'Sunt voluptatem asperiores et velit perspiciatis voluptatem.',	'Sit aliquam expedita quibusdam quae dolore. Enim cum in est placeat in dolorum. Eius alias et et maxime inventore esse.',	2289.000,	110,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(35,	'Et non corrupti culpa consequuntur eligendi eveniet rerum.',	'Illum veniam magnam architecto vel pariatur et quia. Assumenda nobis et provident commodi. Perspiciatis ut rem quas ullam quam dolor.',	4575.000,	407,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(36,	'Sequi omnis quas vero necessitatibus numquam consectetur.',	'Quia quod quo nam quia sapiente sit totam culpa. Similique ut veritatis pariatur eius consequuntur. Quaerat quibusdam placeat eos voluptas quam ea. Quod dolor consequuntur sit ab odit.',	2971.000,	482,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(37,	'Suscipit eligendi ea quibusdam sed.',	'Eos magni accusamus aut aut quis doloremque. Nulla et et non nisi. Non et ex aut omnis expedita saepe nihil. Aperiam in fugit dolore culpa voluptates rerum nobis. Repellendus id hic omnis molestias dignissimos.',	5428.000,	622,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(38,	'Accusantium eveniet ipsum atque iste impedit aliquid.',	'Enim maxime quia in sit nulla impedit optio. Quia corrupti deserunt ipsa ab.',	1980.000,	498,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(39,	'Ut aut natus voluptatum et temporibus quisquam.',	'Aspernatur atque velit vero nam error debitis commodi. Voluptates quasi assumenda doloremque sed. Optio at et beatae saepe rerum ipsa dolorem.',	1790.000,	610,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(40,	'Rerum mollitia a qui animi magnam nostrum rerum distinctio.',	'Vero voluptatem accusamus quia. Necessitatibus provident inventore quo praesentium vel. Ut architecto debitis at ducimus qui. Earum quia dignissimos sapiente a. Neque nemo sunt id modi ipsum soluta atque.',	2199.000,	950,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(41,	'Dicta sapiente mollitia tempore doloremque tempore.',	'Ut nobis omnis dolorem reprehenderit non consequatur labore. Rerum autem sint aut qui inventore quaerat. Voluptatum est sit ad vel nihil eum et. Sunt corporis quia accusamus ullam sunt.',	5941.000,	342,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(42,	'Et dolor facere quibusdam dolore vel dicta ut.',	'Eaque non mollitia officia ut dolor. Eum velit quos eligendi ut reprehenderit itaque. Voluptates repellat fuga sed dicta quos sunt cupiditate. Iure minus praesentium rem.',	5098.000,	240,	'2023-12-24 06:24:46',	'2023-12-24 06:24:46'),
(43,	'Voluptates iure qui quod et dolor.',	'Aut beatae aspernatur eum enim. Quae labore exercitationem accusantium. Aspernatur repudiandae et nam dolorem repellat ratione necessitatibus. Labore laboriosam ad commodi sit deserunt non eos. Voluptate ipsum nisi consectetur aut sed et voluptatum expedita.',	1025.000,	215,	'2023-12-24 06:24:47',	'2023-12-24 06:24:47'),
(44,	'Est autem dignissimos a rerum sapiente qui nemo.',	'Omnis voluptatem rerum et officia facere sint impedit libero. Dolorum error molestiae architecto nam. Sint hic et quo labore laboriosam ut.',	3775.000,	389,	'2023-12-24 06:24:47',	'2023-12-24 06:24:47'),
(45,	'Corrupti et voluptas perspiciatis.',	'Repellat ex dolores ut cum. Commodi qui nihil voluptas dicta qui quo. Debitis quasi blanditiis expedita non dolorem sed assumenda. Eius possimus blanditiis repellendus officia aliquid aliquid consequatur.',	5740.000,	680,	'2023-12-24 06:24:47',	'2023-12-24 06:24:47'),
(46,	'Est eaque rem et aut.',	'Distinctio possimus voluptatibus ea velit accusantium officia. Quo ipsa rerum est error rem qui ea. Maiores voluptatem est dolorem aut soluta enim et. Cum praesentium qui eos illo quidem quo.',	5884.000,	415,	'2023-12-24 06:24:47',	'2023-12-24 06:24:47'),
(47,	'Quis quasi recusandae placeat beatae.',	'Consequatur est quia nihil ut aut. Inventore facilis facilis unde facilis assumenda. Cupiditate dolorem voluptas libero hic.',	2551.000,	401,	'2023-12-24 06:24:47',	'2023-12-24 06:24:47'),
(48,	'Quis neque ipsam ad quaerat reprehenderit tenetur voluptatibus.',	'Mollitia reiciendis facere est et. Est minus iure adipisci quia. Fuga quas ducimus quis doloremque ut iusto ex. Ut minus vero sunt quam.',	2665.000,	608,	'2023-12-24 06:24:47',	'2023-12-24 06:24:47'),
(49,	'Tempora in labore necessitatibus.',	'Facere officia velit et doloribus et. Et autem quod fuga temporibus autem sit. Sed dignissimos provident delectus labore debitis. Aut omnis illo architecto temporibus et soluta esse recusandae.',	1090.000,	697,	'2023-12-24 06:24:47',	'2023-12-24 06:24:47'),
(50,	'Delectus omnis a corrupti eos.',	'Eveniet aut exercitationem ullam qui consequuntur. Voluptatum aut deserunt quas a. Sapiente sit voluptatem quaerat et voluptas quis quia.',	3665.000,	580,	'2023-12-24 06:24:47',	'2023-12-24 06:24:47'),
(51,	'test2',	'test2',	34.000,	88,	'2023-12-26 12:00:47',	'2023-12-26 12:03:30');

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(5,	'Admin',	'web',	'2023-12-25 12:04:45',	'2023-12-25 12:04:45'),
(10,	'Staff',	'web',	'2023-12-25 12:29:51',	'2023-12-25 12:29:51');

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1,	5),
(2,	5),
(3,	5),
(4,	5),
(5,	5),
(5,	10),
(6,	5),
(6,	10),
(7,	5),
(7,	10),
(8,	5),
(8,	10),
(9,	5),
(9,	10),
(10,	5),
(11,	5),
(12,	5);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(13,	'Super Admin',	'superadmin@gmail.com',	NULL,	'$2y$12$CtIOBaNH2ziJJazPARZRKe7fot08ybIfT78KinNsMdX5wgW8VofPi',	NULL,	'2023-12-26 11:43:46',	'2023-12-26 11:43:46'),
(14,	'Staff User',	'staffuser@gmail.com',	NULL,	'$2y$12$wNVfHsXX7E/fuBXotffNm.CA6Hib6PuqVBP6abd3BtWfKIgzvz4nW',	NULL,	'2023-12-26 11:44:14',	'2023-12-26 11:44:14');

-- 2023-12-26 17:09:16
