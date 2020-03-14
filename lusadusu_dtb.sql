-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.12-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for lusadusu_dtb
CREATE DATABASE IF NOT EXISTS `lusadusu_dtb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `lusadusu_dtb`;

-- Dumping structure for table lusadusu_dtb.affiliates
CREATE TABLE IF NOT EXISTS `affiliates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `comments` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `affiliates_user_id_unique` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.affiliates: ~7 rows (approximately)
DELETE FROM `affiliates`;
/*!40000 ALTER TABLE `affiliates` DISABLE KEYS */;
INSERT INTO `affiliates` (`id`, `user_id`, `code`, `status`, `comments`, `created_at`, `updated_at`) VALUES
	(1, 3, '', 0, 'accepted', '2020-02-25 13:43:41', '2020-02-26 14:01:46'),
	(2, 6, '', 0, NULL, '2020-02-25 13:43:41', '2020-02-25 13:43:41'),
	(3, 5, '', 0, NULL, '2020-02-25 13:43:41', '2020-02-25 13:43:41'),
	(4, 8, '', 0, NULL, '2020-02-25 13:43:41', '2020-02-25 13:43:41'),
	(5, 1, 'AF00000001', 1, NULL, '2020-02-25 13:43:41', '2020-02-25 13:43:41'),
	(6, 2, '', 0, NULL, '2020-02-25 13:43:41', '2020-02-25 13:43:41'),
	(7, 4, '', 0, NULL, '2020-02-25 14:06:02', '2020-02-25 14:09:59');
/*!40000 ALTER TABLE `affiliates` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.affiliate_members
CREATE TABLE IF NOT EXISTS `affiliate_members` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `affiliate_id` bigint(20) unsigned NOT NULL,
  `member_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `affiliate_members_affiliate_id_member_id_unique` (`affiliate_id`,`member_id`),
  KEY `affiliate_members_member_id_foreign` (`member_id`),
  CONSTRAINT `affiliate_members_affiliate_id_foreign` FOREIGN KEY (`affiliate_id`) REFERENCES `affiliates` (`id`),
  CONSTRAINT `affiliate_members_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.affiliate_members: ~0 rows (approximately)
DELETE FROM `affiliate_members`;
/*!40000 ALTER TABLE `affiliate_members` DISABLE KEYS */;
INSERT INTO `affiliate_members` (`id`, `affiliate_id`, `member_id`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, '2020-02-26 13:58:55', '2020-02-26 13:58:55');
/*!40000 ALTER TABLE `affiliate_members` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `exam_id` bigint(20) unsigned NOT NULL,
  `quiz_id` bigint(20) unsigned NOT NULL,
  `assertion_id` bigint(20) unsigned NOT NULL,
  `correct_answer` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `answers_exam_id_quiz_id_unique` (`exam_id`,`quiz_id`),
  KEY `answers_quiz_id_foreign` (`quiz_id`),
  KEY `answers_assertion_id_foreign` (`assertion_id`),
  CONSTRAINT `answers_assertion_id_foreign` FOREIGN KEY (`assertion_id`) REFERENCES `assertions` (`id`),
  CONSTRAINT `answers_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`),
  CONSTRAINT `answers_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.answers: ~29 rows (approximately)
DELETE FROM `answers`;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`id`, `exam_id`, `quiz_id`, `assertion_id`, `correct_answer`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, 4, 0, '2020-03-06 21:00:22', '2020-03-06 21:00:22'),
	(2, 1, 10, 28, 0, '2020-03-06 21:00:30', '2020-03-06 21:00:30'),
	(3, 1, 8, 24, 0, '2020-03-06 21:00:37', '2020-03-06 21:00:37'),
	(4, 1, 1, 1, 0, '2020-03-06 21:00:42', '2020-03-06 21:00:42'),
	(5, 1, 7, 19, 0, '2020-03-06 21:00:45', '2020-03-06 21:00:45'),
	(6, 1, 4, 12, 0, '2020-03-06 21:00:48', '2020-03-06 21:00:48'),
	(7, 1, 9, 26, 1, '2020-03-06 21:00:56', '2020-03-06 21:00:56'),
	(8, 1, 3, 9, 0, '2020-03-06 21:01:07', '2020-03-06 21:01:07'),
	(9, 1, 6, 18, 0, '2020-03-06 21:01:12', '2020-03-06 21:01:12'),
	(10, 1, 5, 13, 0, '2020-03-06 21:01:37', '2020-03-06 21:01:37'),
	(51, 7, 5, 13, 0, '2020-03-12 13:41:37', '2020-03-12 13:41:37'),
	(52, 7, 11, 32, 0, '2020-03-12 13:41:41', '2020-03-12 13:41:41'),
	(53, 7, 12, 34, 1, '2020-03-12 13:41:48', '2020-03-12 13:41:48'),
	(54, 7, 4, 11, 0, '2020-03-12 13:42:33', '2020-03-12 13:42:33'),
	(55, 7, 9, 26, 1, '2020-03-12 13:42:59', '2020-03-12 13:42:59'),
	(56, 7, 15, 43, 0, '2020-03-12 13:43:01', '2020-03-12 13:43:01'),
	(57, 7, 20, 58, 0, '2020-03-12 13:43:04', '2020-03-12 13:43:04'),
	(58, 7, 19, 55, 0, '2020-03-12 13:43:07', '2020-03-12 13:43:07'),
	(59, 7, 13, 38, 0, '2020-03-12 13:43:08', '2020-03-12 13:43:08'),
	(60, 7, 18, 52, 0, '2020-03-12 13:43:10', '2020-03-12 13:43:10'),
	(61, 7, 6, 17, 0, '2020-03-12 13:43:12', '2020-03-12 13:43:12'),
	(62, 7, 7, 21, 0, '2020-03-12 13:43:35', '2020-03-12 13:43:35'),
	(63, 13, 24, 70, 1, '2020-03-12 18:01:01', '2020-03-12 18:01:01'),
	(64, 13, 29, 86, 1, '2020-03-12 18:01:18', '2020-03-12 18:01:18'),
	(65, 13, 28, 83, 1, '2020-03-12 18:01:29', '2020-03-12 18:01:29'),
	(66, 13, 23, 67, 1, '2020-03-12 18:01:43', '2020-03-12 18:01:43'),
	(67, 13, 27, 80, 1, '2020-03-12 18:02:02', '2020-03-12 18:02:02'),
	(68, 13, 25, 74, 1, '2020-03-12 18:02:07', '2020-03-12 18:02:07'),
	(69, 13, 26, 77, 1, '2020-03-12 18:02:09', '2020-03-12 18:02:09');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.assertions
CREATE TABLE IF NOT EXISTS `assertions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quiz_id` bigint(20) unsigned NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `assertions_quiz_id_answer_unique` (`quiz_id`,`answer`),
  CONSTRAINT `assertions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.assertions: ~90 rows (approximately)
DELETE FROM `assertions`;
/*!40000 ALTER TABLE `assertions` DISABLE KEYS */;
INSERT INTO `assertions` (`id`, `quiz_id`, `answer`, `correct_answer`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Itaque sunt est consequuntur et eius est repellat. Sit voluptatibus sint et aliquam fuga. Et alias explicabo doloremque pariatur. Doloremque et tempora nihil eum.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(2, 1, 'Eveniet est voluptatem et. Ut eos harum exercitationem est nobis odio maiores quae. Quae enim aut est id dolores nemo qui. Temporibus facilis ea totam ullam qui.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(3, 1, 'Quidem ipsa pariatur aliquid itaque. Repellendus exercitationem veniam nisi quo. Consequatur optio veniam velit culpa ipsum architecto.', 1, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(4, 2, 'Officiis fugit omnis iusto non facilis. Deleniti numquam saepe et sunt magni voluptas ipsam. Aut beatae distinctio impedit.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(5, 2, 'Eum animi asperiores doloremque quos dolorem laudantium est. Quos qui autem neque exercitationem. Commodi rerum enim repudiandae aperiam ab alias dolores repudiandae. Laboriosam numquam id a et.', 1, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(6, 2, 'Rerum molestias non dolores esse sequi libero. Ex nesciunt quibusdam aut sit molestiae fugiat perferendis. Voluptatibus delectus quidem consequatur repellendus aperiam.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(7, 3, 'Tempora enim eaque sit asperiores perspiciatis. Ut non facilis nesciunt. Quos exercitationem eaque est. Nam iste velit eos qui dolorem et.', 1, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(8, 3, 'Quis tempora at hic et autem qui. Et aut saepe ut. Sint architecto aspernatur alias dolorem velit quae.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(9, 3, 'Et accusantium et in deserunt est quas. Aliquid quo vel sequi quo repellendus laborum repellendus. Aperiam quis tempora eos necessitatibus dolorem deserunt.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(10, 4, 'Aspernatur placeat sit et aliquam aut. Vero dolores delectus pariatur quasi id minima. Assumenda est reprehenderit provident nisi. Cum odit qui et et et enim.', 1, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(11, 4, 'Dignissimos minus omnis enim et id modi similique. Ut aut aperiam id et ut et. Hic magni corrupti odio cumque.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(12, 4, 'Ex earum eligendi est placeat. Nisi impedit molestiae et autem. Mollitia sit id doloribus ipsum cupiditate. Ea quia eligendi ipsa.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(13, 5, 'Iste dolorem accusamus sint quasi aut voluptatem. At in doloribus qui nam ullam doloribus. Officiis eum earum nemo itaque deserunt ut.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(14, 5, 'Et necessitatibus consequatur id mollitia nobis fugiat hic fugit. Dignissimos sed et aut aut nihil voluptatem.', 1, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(15, 5, 'Iste voluptatibus pariatur optio doloremque sint tempora. Harum saepe non ut rerum. Modi aut eligendi minus a ut et.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(16, 6, 'Et inventore sequi et. Perspiciatis ipsum molestias et aspernatur repellendus in voluptas aliquid. Cupiditate aut dignissimos temporibus harum id praesentium debitis.', 1, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(17, 6, 'Voluptates voluptatem eos quis quas doloremque exercitationem. Qui fuga molestias voluptate magni qui velit. Ad natus corporis labore necessitatibus.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(18, 6, 'Magnam sint magni nostrum aperiam repellat numquam sit. Id id et totam perspiciatis. Perspiciatis est dolores sit id adipisci.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(19, 7, 'Omnis sed culpa sequi officiis nisi officiis non. Sequi ut aspernatur delectus voluptatem. Maxime aliquam iusto vel animi repellat.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(20, 7, 'Qui est natus eum qui est. Temporibus unde voluptate ut quaerat expedita doloribus eum quaerat. Ea ducimus ut earum laborum. Asperiores adipisci ut cum eveniet.', 1, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(21, 7, 'Non accusantium veritatis in assumenda dicta. Repellat totam corrupti maxime occaecati. Fugiat rem sunt dolore ipsum sequi laboriosam voluptatum. Ut aliquid dolor quis quam.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(22, 8, 'Libero omnis est et cupiditate. Sed rem molestiae asperiores mollitia ad. Sed omnis asperiores officia porro. Similique aut minus et ut.', 1, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(23, 8, 'Ut veniam voluptatibus expedita eos alias eaque. Dicta atque facilis consequatur voluptas quasi. Dolor doloremque quia omnis voluptas. Quasi molestiae rerum assumenda aliquid eaque. Eaque voluptatem quia qui tempora quia quis.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(24, 8, 'Omnis ipsa ea voluptas qui possimus. Et et pariatur delectus voluptas nesciunt voluptatum fugiat exercitationem. Repellendus qui sunt vel reprehenderit modi.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(25, 9, 'Quaerat inventore nesciunt deserunt necessitatibus et amet. Sequi corrupti voluptas assumenda debitis recusandae voluptas ab. Ex quaerat iure odit. Unde at amet enim at. Ab sit dolores porro accusantium consequuntur.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(26, 9, 'Magnam harum doloribus est quasi est quidem inventore ut. Vitae repellat similique ad laboriosam labore. Deleniti quas tempore quo et dolore similique minima.', 1, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(27, 9, 'Assumenda consectetur culpa fuga. Animi corporis blanditiis dolores ea. Dolores quaerat id harum ea voluptatem incidunt.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(28, 10, 'Iusto fuga libero illum facere. Voluptas quisquam cumque distinctio aliquam sit. Voluptas repudiandae et voluptate vitae ut.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(29, 10, 'Provident mollitia autem voluptates rerum. Neque quas laudantium voluptatem rem non totam laboriosam.', 1, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(30, 10, 'Pariatur est quod eaque recusandae. Aut aut est dolor molestiae officia. Hic autem molestiae vel veritatis optio harum illo.', 0, 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(31, 11, 'Ut laborum voluptate unde accusamus dignissimos voluptates eaque. Quaerat perspiciatis aspernatur in atque natus sit. Dolor ea reiciendis sapiente ex accusantium.', 1, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(32, 11, 'Ad deserunt quasi minima sint quas consequatur ea omnis. Cum aut ut qui assumenda aperiam sit non. Sed dolores aspernatur odit dolorum sed. Nihil dolor quis minima est enim autem tempora. Non consequatur explicabo eveniet.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(33, 11, 'Eaque officiis et eum fugiat facilis. Quam et porro quia soluta temporibus. Voluptas aut sed dolores optio.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(34, 12, 'Voluptas autem debitis sunt culpa eos et provident deleniti. Eum ut est perspiciatis sint voluptate qui. Omnis esse adipisci aut est. Aut aut sunt nihil ut aperiam est neque.', 1, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(35, 12, 'Deleniti sequi impedit distinctio aut atque temporibus. Enim odio labore enim maxime in. Aspernatur veniam dolores dicta.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(36, 12, 'Officia ex incidunt voluptatem. Sed non aliquam voluptate id quasi. Dolor maxime ratione totam quia. Ipsum tenetur ad aut alias.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(37, 13, 'Odio deserunt qui minima officiis iure dolor ullam. Nihil pariatur omnis beatae ratione ullam voluptatibus est.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(38, 13, 'Aut autem reprehenderit facilis sit commodi occaecati ea. Voluptatem ab officia voluptas vero adipisci. Eos quas asperiores minima sed voluptatum atque quaerat.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(39, 13, 'Repudiandae delectus possimus rerum deserunt dolor itaque. Maiores id labore tempore a qui et explicabo.', 1, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(40, 14, 'Et tempora qui in facilis distinctio. Alias est fuga fugiat dolorem qui suscipit. Omnis eos voluptatibus labore unde.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(41, 14, 'Hic nam magni nihil rerum dolores deleniti. Sit sapiente architecto ea excepturi eum earum tenetur. Dignissimos molestiae et voluptatem ut esse dolorum est et. Porro eveniet ipsum nobis optio.', 1, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(42, 14, 'Et maiores magni sint facere iste veritatis est. Quisquam deserunt corrupti eos perferendis error. Ullam officiis similique qui eius quia.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(43, 15, 'In amet quae doloribus nisi. At harum enim a eum aut autem suscipit. Molestias et vel molestias reiciendis blanditiis.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(44, 15, 'Aut eaque quia vel laudantium voluptatem vitae quaerat. Consequatur consequatur at iure autem. Expedita quia sit omnis dolore. Quas quam consequatur adipisci qui perspiciatis recusandae nisi provident.', 1, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(45, 15, 'Dolorem eum neque et explicabo dolores. Debitis inventore dolore omnis enim vero consequuntur. Nemo laudantium in et magni porro aliquam sunt.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(46, 16, 'Velit amet ut dicta incidunt magnam enim quia. Veritatis in ullam architecto molestiae. Et aliquam et quas quo. Eligendi nihil exercitationem dolore quia hic amet.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(47, 16, 'Illo reprehenderit est laborum occaecati. Veritatis sunt temporibus porro omnis sed dolor. Magni inventore voluptate eos animi. Neque ut velit et et omnis id.', 1, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(48, 16, 'Quo ut modi et quasi animi. Eum veniam natus animi sunt. Id eos quia sit est ullam inventore consequatur. Voluptatem dolores accusantium delectus sit reiciendis sapiente deleniti consequatur.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(49, 17, 'Modi voluptatibus magnam voluptatem eum inventore libero laudantium id. Ea aut cumque quis ea doloremque similique expedita. Occaecati porro quidem exercitationem minus beatae modi aut. Laudantium ea explicabo eos quia ut.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(50, 17, 'Nesciunt iusto similique natus similique et. Temporibus quam eius eos alias eos eaque cupiditate quaerat. Expedita omnis doloribus animi facilis.', 1, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(51, 17, 'Quia omnis aut eveniet facilis. Deserunt et architecto et voluptatem aut. Molestias expedita velit et expedita aut mollitia magnam. Qui deserunt aspernatur beatae.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(52, 18, 'Itaque expedita et praesentium ut harum deleniti ut. Voluptatem aperiam voluptas velit a quia dicta. Earum illo sunt quidem libero incidunt vel ratione. Cumque sed unde veniam vel exercitationem quia sed.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(53, 18, 'Sapiente placeat quod rerum similique provident esse. Iste non officiis officia nihil assumenda in. Inventore est ut numquam possimus. Veniam cumque veritatis fugit laudantium. Est dolores reiciendis odio nulla magni et quia.', 1, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(54, 18, 'Aut assumenda occaecati quisquam sed ut qui itaque. Minima non id iste sint voluptatem autem enim. Saepe corrupti sint est dignissimos eligendi. Ut dolor facere sunt fuga laudantium cupiditate eligendi.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(55, 19, 'Amet molestiae et temporibus totam aut non rerum exercitationem. Maiores odio laborum distinctio reiciendis qui neque. Minima rerum fugit commodi assumenda dignissimos exercitationem. Eius provident corporis eaque quae dicta et cumque sint.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(56, 19, 'Culpa maiores officia iure ut praesentium non saepe. Nihil error neque laborum quia quam. Deleniti ut vero occaecati occaecati. Eveniet delectus facilis quo iste nam quia numquam.', 1, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(57, 19, 'Minus aut ea explicabo voluptatem deleniti vero. Totam ea earum suscipit. Quia facere dolorem nisi reiciendis veritatis dolorem. Quia hic recusandae ut.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(58, 20, 'Natus consequatur nesciunt fugit recusandae natus enim fugiat. Quia et blanditiis rem consectetur architecto deleniti. Doloremque dignissimos officia ea consequatur. Aspernatur consectetur adipisci dolore consequatur.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(59, 20, 'Et est dolor qui nihil mollitia sit. Quia quisquam qui deleniti distinctio. Dolore vel eligendi sint saepe ex. Explicabo sit dolores quidem rerum omnis.', 1, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(60, 20, 'Ut odio impedit quaerat sunt saepe iusto sit voluptatem. Perspiciatis voluptatum itaque qui eius labore eius autem. In quae et dolorem consequatur veritatis harum. Delectus non sint officiis rem soluta quos consequuntur.', 0, 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(61, 21, 'Consectetur sit modi ad rem minima. Aut impedit nulla minus animi. Quae quasi voluptas maxime ea consequatur corporis nihil hic. Corporis nulla assumenda sint vel est eum.', 1, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(62, 21, 'Et pariatur sed ea aut et. Debitis et esse quis fugiat doloribus. Unde itaque quis iste recusandae repudiandae ipsa sed.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(63, 21, 'Sunt omnis dicta placeat illo. Vel sed ut dolores illo qui. Error enim molestiae distinctio quae aliquam repudiandae. Est inventore soluta eligendi voluptates dolore ad esse. Laborum est tempore sed porro.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(64, 22, 'Dolores quisquam error ullam vel in ut. Ipsa in quo sunt velit consequatur. Quia eum ut recusandae est. Ipsam qui dolorum illum non eos sequi. Perspiciatis non est enim ullam cumque.', 1, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(65, 22, 'Dolores dolores nemo sunt culpa qui reiciendis. Est vitae quaerat nam ut porro. Saepe alias repellat laudantium sed suscipit tenetur. Unde ex eum et in culpa omnis quisquam dolores. Sed sint possimus ipsa voluptatem provident ab sint.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(66, 22, 'Id autem et tempora voluptatibus et aut. Commodi molestias deserunt tempora nihil temporibus dolorem a. Illo magnam molestias qui qui voluptatibus quis reprehenderit quis.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(67, 23, 'Est consequuntur itaque sapiente. Repudiandae inventore sunt eveniet nesciunt aut earum repudiandae. Sed et consectetur perferendis exercitationem. Odit sed aspernatur minus.', 1, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(68, 23, 'Beatae unde omnis consequatur est excepturi eos. Similique qui sequi ea sunt. Accusantium eum voluptatem sit iure officiis. Illo quas commodi debitis libero perspiciatis ad ex.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(69, 23, 'Reprehenderit in labore magnam aut impedit. Sed asperiores temporibus cupiditate mollitia quia praesentium consequatur sed.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(70, 24, 'Tempora id nihil autem. Voluptatem debitis quibusdam et.', 1, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(71, 24, 'Ut necessitatibus autem eligendi nesciunt culpa. Omnis voluptatem magni non earum mollitia sed facilis. Fugit veniam hic ad ratione minus molestiae veniam.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(72, 24, 'Error nobis distinctio consequatur sint minus optio nihil enim. Officiis corrupti rerum mollitia quia consectetur. Voluptatum architecto qui exercitationem similique tempore et.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(73, 25, 'Sequi architecto quia recusandae rerum tempora iusto quasi. Optio eum dolorem libero. Dolorum est harum fugiat quis rerum aliquid. Sequi non placeat accusamus et saepe.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(74, 25, 'Dolore ipsam et sint delectus dolorum labore. Est omnis eum a nulla odit. Voluptatibus quos ut eligendi ut incidunt omnis molestiae et. Quaerat ea debitis quia libero facere et.', 1, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(75, 25, 'Aut earum sapiente laborum exercitationem velit expedita incidunt explicabo. Sint repellendus id qui nisi. Aut eius ut porro. Perspiciatis enim voluptatum sunt assumenda qui.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(76, 26, 'Ipsam est esse quas sint. Sit beatae in officia doloribus et ad occaecati. Et iure ut doloremque quisquam excepturi nostrum.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(77, 26, 'Accusamus ut pariatur earum necessitatibus aut. Error veniam autem blanditiis provident quis fuga autem aperiam. At numquam sint in aut voluptas asperiores.', 1, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(78, 26, 'Dignissimos explicabo fugiat est nemo dolore dignissimos. Dolorem veniam qui exercitationem numquam sit. Sit inventore officiis ea non earum libero aut. Veritatis nemo voluptatem asperiores dolores iure culpa.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(79, 27, 'Id repellat consequatur est odio facilis reprehenderit. Consequatur voluptatem tempora voluptates accusamus id rerum doloribus. Culpa modi labore atque qui doloremque magnam fuga voluptatem.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(80, 27, 'Ipsum error modi aspernatur distinctio magni vel. Ratione quia doloribus eum harum ullam. Assumenda velit quae quia cupiditate. Aliquid at quasi sint qui voluptatem molestias esse. Sed assumenda rerum fugiat velit repellendus.', 1, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(81, 27, 'Unde dolorem ea molestiae aut perspiciatis. Sed hic enim laborum id facere. Repellat qui doloremque ex totam aut voluptatem est. Adipisci qui velit dolores iste suscipit harum sit. Inventore deleniti voluptates quas voluptate maxime.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(82, 28, 'Repellat et in fugiat. Beatae accusantium quisquam cum blanditiis numquam omnis fugit. Assumenda a nemo quidem corporis.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(83, 28, 'Corrupti nostrum dolore itaque nam quos maiores rerum. Velit dignissimos id aliquam cupiditate eum quisquam mollitia. Quo tempore omnis aut minima qui beatae tempora blanditiis.', 1, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(84, 28, 'Blanditiis porro quia deleniti odio delectus commodi. Facilis qui in aliquam reiciendis est. Reiciendis eos qui rerum error. Nostrum nobis et quia.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(85, 29, 'Dolor voluptatibus a quas suscipit ab tempore voluptas. Voluptatem et iste nihil qui. Ipsa sed ratione illum nisi ut. Est dolorem rerum odit impedit. Eos dolores sint aut omnis autem et debitis.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(86, 29, 'Quia quas in sapiente et. Sed quis fugit ut temporibus illum provident dolor sunt. A maiores exercitationem eligendi. Occaecati ex nesciunt omnis minus.', 1, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(87, 29, 'Autem suscipit porro a assumenda blanditiis. Sapiente vel modi autem rerum et distinctio. Magnam sint amet tenetur accusantium non deserunt expedita.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(88, 30, 'Voluptates ea neque asperiores deserunt sequi enim fuga alias. Ad illum fugit odit ex.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(89, 30, 'Ad et nesciunt fugiat quam exercitationem laborum voluptas molestias. Et culpa ipsam perspiciatis accusantium. Aut nihil quidem omnis odit nobis alias. Non necessitatibus molestiae tempora nisi delectus odit.', 1, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(90, 30, 'Voluptatem repellendus occaecati aut ullam molestiae vel omnis. Repellendus voluptatem vitae maxime laborum. Atque dolorum voluptas magni et.', 0, 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27');
/*!40000 ALTER TABLE `assertions` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.balances
CREATE TABLE IF NOT EXISTS `balances` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `participation_commission` double(8,2) NOT NULL,
  `victory_commission` double(8,2) NOT NULL,
  `members` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `balances_user_id_foreign` (`user_id`),
  CONSTRAINT `balances_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.balances: ~1 rows (approximately)
DELETE FROM `balances`;
/*!40000 ALTER TABLE `balances` DISABLE KEYS */;
INSERT INTO `balances` (`id`, `user_id`, `participation_commission`, `victory_commission`, `members`, `created_at`, `updated_at`) VALUES
	(1, 1, 5000.00, 15000.00, 300, '2020-03-05 10:34:48', '2020-03-05 10:34:48');
/*!40000 ALTER TABLE `balances` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.categories: ~20 rows (approximately)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'South Giovannishire', 1, '2020-02-26 14:17:37', '2020-02-26 14:24:14'),
	(2, 'Port Javonte', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(3, 'Auerville', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(4, 'West Sylvesterbury', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(5, 'Marcusland', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(6, 'West Lomachester', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(7, 'New Royce', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(8, 'Murphyland', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(9, 'Maverickberg', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(10, 'Wiegandview', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(11, 'Kennyport', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(12, 'Mannville', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(13, 'North Rebachester', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(14, 'Mrazton', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(15, 'Schaeferburgh', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(16, 'Daughertyview', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(17, 'West Nick', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(18, 'Hettingerburgh', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(19, 'West Carlos', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37'),
	(20, 'North Chance', 1, '2020-02-26 14:17:37', '2020-02-26 14:17:37');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.cities: ~100 rows (approximately)
DELETE FROM `cities`;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Susanchester', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(2, 'Miamouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(3, 'Bashiriantown', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(4, 'North Fletcher', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(5, 'Vivianeport', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(6, 'East Wilton', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(7, 'Yundtchester', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(8, 'Weissnatburgh', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(9, 'Dorcasbury', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(10, 'Lake Zoemouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(11, 'Cruickshankmouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(12, 'North Linnieshire', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(13, 'South Rollintown', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(14, 'West Providenciville', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(15, 'Lillachester', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(16, 'Shayleeville', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(17, 'Virgilberg', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(18, 'North Camryn', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(19, 'Port Burdette', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(20, 'Eileenmouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(21, 'Port Adelbert', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(22, 'North Artview', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(23, 'Croninmouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(24, 'Predovicshire', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(25, 'West Abigaylefort', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(26, 'Loyceville', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(27, 'North Jackieshire', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(28, 'Nadertown', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(29, 'Trishaville', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(30, 'West Raegan', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(31, 'Port Daveland', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(32, 'Lake Celineburgh', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(33, 'South Corbinfort', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(34, 'Millsburgh', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(35, 'Patsytown', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(36, 'Hettingerbury', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(37, 'North Izaiah', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(38, 'East Reginald', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(39, 'Lake Myrl', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(40, 'New Misty', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(41, 'Erdmanport', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(42, 'Brielleport', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(43, 'Kylershire', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(44, 'Ondrickaview', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(45, 'Eulamouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(46, 'Jannieview', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(47, 'Abigaleborough', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(48, 'Floridaburgh', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(49, 'Donnellyfort', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(50, 'East Kendrick', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(51, 'Port Elisabethland', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(52, 'Lake Selinamouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(53, 'New Laishahaven', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(54, 'Abbottborough', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(55, 'North Jennings', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(56, 'Port Lewisborough', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(57, 'Glendahaven', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(58, 'Wizahaven', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(59, 'Pansyview', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(60, 'Weberchester', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(61, 'Wilfredchester', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(62, 'Rogahnburgh', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(63, 'Lake Mekhiberg', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(64, 'Enosmouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(65, 'Karellebury', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(66, 'North Isomfurt', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(67, 'Lake Rowlandtown', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(68, 'Port Mikestad', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(69, 'Oswaldomouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(70, 'Runolfssonborough', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(71, 'Boyermouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(72, 'Port Goldaside', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(73, 'Waterstown', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(74, 'North Gretchentown', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(75, 'South Mauricioview', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(76, 'Ornchester', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(77, 'Jarenland', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(78, 'Port Joanny', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(79, 'Whiteview', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(80, 'South Busterbury', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(81, 'North Lisandro', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(82, 'Port Clovishaven', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(83, 'Gibsonville', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(84, 'North Zelmaland', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(85, 'East Cordell', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(86, 'Lake Lura', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(87, 'North Urban', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(88, 'Dellland', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(89, 'West Caroline', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(90, 'Ignaciotown', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(91, 'Howardmouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(92, 'Lake Boristown', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(93, 'Savanahmouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(94, 'South Irmamouth', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(95, 'Lake Dallasville', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(96, 'Aydenshire', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(97, 'Port Wilbertbury', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(98, 'New Mackenzieshire', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(99, 'Mayertfurt', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24'),
	(100, 'Lake Odie', 1, '2020-02-26 09:05:24', '2020-02-26 09:05:24');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.commissions
CREATE TABLE IF NOT EXISTS `commissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_id` bigint(20) unsigned NOT NULL,
  `affiliate_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commission_type` tinyint(4) NOT NULL DEFAULT 1,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `commissions_payment_id_foreign` (`payment_id`),
  CONSTRAINT `commissions_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.commissions: ~0 rows (approximately)
DELETE FROM `commissions`;
/*!40000 ALTER TABLE `commissions` DISABLE KEYS */;
INSERT INTO `commissions` (`id`, `payment_id`, `affiliate_code`, `commission_type`, `amount`, `created_at`, `updated_at`) VALUES
	(1, 1, 'AF00000001', 1, 300.00, '2020-03-05 12:16:18', '2020-03-05 12:16:18');
/*!40000 ALTER TABLE `commissions` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.courses
CREATE TABLE IF NOT EXISTS `courses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `material_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `mode` tinyint(4) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_material_id_foreign` (`material_id`),
  CONSTRAINT `courses_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.courses: ~9 rows (approximately)
DELETE FROM `courses`;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`id`, `material_id`, `title`, `description`, `mode`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Ferminville', 'Gryphon, and the little passage: and THEN--she found herself in a helpless sort of lullaby to it in a deep, hollow tone: \'sit down, both of you, and.', 1, 1, '2020-02-27 10:07:53', '2020-02-27 10:07:53'),
	(2, 1, 'New Marilie', 'Who for such dainties would not allow without knowing how old it was, even before she got up, and there stood the Queen merely remarking as it was.', 1, 1, '2020-02-27 10:07:53', '2020-02-27 10:07:53'),
	(3, 1, 'Jacobsonshire', 'King. \'It began with the lobsters, out to be true): If she should meet the real Mary Ann, what ARE you talking to?\' said the King. \'When did you do.', 1, 1, '2020-02-27 10:07:53', '2020-02-27 10:07:53'),
	(4, 3, 'Going to Kongo', 'Gryphon, and the little passage: and THEN--she found herself in a helpless sort of lullaby to it in a deep, hollow tone: \'sit down, both of you, and.', 1, 1, '2020-02-28 12:12:22', '2020-02-28 12:12:22'),
	(5, 3, 'Kuhnhaven', 'THEIR eyes bright and eager with many a strange tale, perhaps even with the Lory, with a sigh. \'I only took the hookah into its face was quite.', 1, 1, '2020-02-28 14:35:34', '2020-02-28 14:35:34'),
	(6, 3, 'North Macyton', 'Next came an angry tone, \'Why, Mary Ann, what ARE you doing out here? Run home this moment, I tell you!\' said Alice. \'Why not?\' said the Duchess.', 1, 1, '2020-02-28 14:35:34', '2020-02-28 14:35:34'),
	(7, 3, 'Sheridanberg', 'However, on the trumpet, and then the Rabbit\'s little white kid gloves: she took up the other, saying, in a low, weak voice. \'Now, I give it up,\'.', 1, 1, '2020-02-28 14:35:34', '2020-02-28 14:35:34'),
	(8, 3, 'Floburgh', 'Alice went timidly up to the shore, and then said \'The fourth.\' \'Two days wrong!\' sighed the Hatter. Alice felt a violent blow underneath her chin.', 1, 1, '2020-02-28 14:35:34', '2020-02-28 14:35:34'),
	(9, 3, 'South Biankaborough', 'And yet I wish you wouldn\'t have come here.\' Alice didn\'t think that very few things indeed were really impossible. There seemed to think to.', 1, 1, '2020-02-28 14:35:34', '2020-02-28 14:35:34');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.discussions
CREATE TABLE IF NOT EXISTS `discussions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discussions_question_id_foreign` (`question_id`),
  KEY `discussions_user_id_foreign` (`user_id`),
  CONSTRAINT `discussions_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `discussions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.discussions: ~12 rows (approximately)
DELETE FROM `discussions`;
/*!40000 ALTER TABLE `discussions` DISABLE KEYS */;
INSERT INTO `discussions` (`id`, `question_id`, `user_id`, `message`, `file`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'CHAPTER IV. The Rabbit Sends in a louder tone. \'ARE you to offer it,\' said.', NULL, '2020-02-26 15:08:20', '2020-02-26 15:08:20'),
	(2, 1, 1, 'The Mouse looked at Two. Two began in a sorrowful.', NULL, '2020-02-26 15:08:20', '2020-02-26 15:08:20'),
	(3, 1, 1, 'And the.', NULL, '2020-02-26 15:08:20', '2020-02-26 15:08:20'),
	(4, 1, 1, 'Next came the guests, mostly Kings and.', NULL, '2020-02-26 15:08:20', '2020-02-26 15:08:20'),
	(5, 1, 1, 'Queen shrieked out. \'Behead that Dormouse! Turn that Dormouse out of.', NULL, '2020-02-26 15:08:20', '2020-02-26 15:08:20'),
	(6, 1, 1, 'At this the White.', NULL, '2020-02-26 15:08:20', '2020-02-26 15:08:20'),
	(7, 9, 2, 'Test discussion', NULL, '2020-03-02 15:24:36', '2020-03-02 15:24:36'),
	(8, 10, 5, 'I have a Restful API whos return a Java Object for me. When return that object it is still empty, because the async thread is still working. How can get that response and return then to my Presenter and it directs the correct response to the view?', NULL, '2020-03-04 13:06:31', '2020-03-04 13:06:31'),
	(9, 10, 1, 'Testing to create a new discussion by the end user', NULL, '2020-03-04 13:51:20', '2020-03-04 13:51:20'),
	(10, 10, 1, 'This is another one of the tests made by the user directly.\nI\'m so happy for that.', NULL, '2020-03-04 13:54:02', '2020-03-04 13:54:02'),
	(11, 2, 1, 'Creating a new ticket response.', NULL, '2020-03-04 15:39:14', '2020-03-04 15:39:14'),
	(12, 3, 1, 'Matondo', NULL, '2020-03-06 20:57:26', '2020-03-06 20:57:26');
/*!40000 ALTER TABLE `discussions` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.exams
CREATE TABLE IF NOT EXISTS `exams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `lesson_id` bigint(20) unsigned NOT NULL,
  `started` tinyint(1) NOT NULL DEFAULT 0,
  `started_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  `duration` datetime DEFAULT NULL,
  `normal_finish` tinyint(1) DEFAULT NULL,
  `passed` tinyint(1) DEFAULT NULL,
  `percentage_obtained` double(8,2) DEFAULT NULL,
  `percentage_required` double(8,2) NOT NULL,
  `can_visualize` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exams_course_id_user_id_unique` (`course_id`,`user_id`),
  KEY `exams_user_id_foreign` (`user_id`),
  KEY `exams_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `exams_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `exams_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`),
  CONSTRAINT `exams_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.exams: ~4 rows (approximately)
DELETE FROM `exams`;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` (`id`, `course_id`, `user_id`, `lesson_id`, `started`, `started_at`, `finished_at`, `duration`, `normal_finish`, `passed`, `percentage_obtained`, `percentage_required`, `can_visualize`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 16, 1, '2020-03-06 21:00:11', '2020-03-06 21:01:37', '2020-03-06 21:03:11', 1, 0, 10.00, 90.00, 0, '2020-02-29 07:16:15', '2020-03-06 21:01:37'),
	(7, 2, 1, 9, 1, '2020-03-12 13:41:03', '2020-03-12 13:44:01', '2020-03-12 13:44:03', 1, 0, 16.67, 90.00, 0, '2020-02-29 09:07:43', '2020-03-12 13:44:01'),
	(13, 9, 1, 29, 1, '2020-03-12 17:59:10', '2020-03-12 18:02:09', '2020-03-12 18:02:10', 1, 1, 100.00, 90.00, 0, '2020-03-12 17:45:35', '2020-03-12 18:02:09'),
	(14, 7, 1, 42, 0, NULL, NULL, NULL, NULL, NULL, NULL, 90.00, 0, '2020-03-12 21:00:12', '2020-03-12 21:00:12');
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.exam_parameters
CREATE TABLE IF NOT EXISTS `exam_parameters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `duration` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.exam_parameters: ~6 rows (approximately)
DELETE FROM `exam_parameters`;
/*!40000 ALTER TABLE `exam_parameters` DISABLE KEYS */;
INSERT INTO `exam_parameters` (`id`, `duration`, `status`, `created_at`, `updated_at`) VALUES
	(1, 3, 0, '2020-03-06 11:19:26', '2020-03-06 11:19:26'),
	(2, 5, 0, '2020-03-06 11:19:26', '2020-03-06 11:19:26'),
	(3, 3, 0, '2020-03-06 11:19:26', '2020-03-06 11:19:26'),
	(4, 3, 0, '2020-03-06 11:19:26', '2020-03-06 11:19:26'),
	(5, 4, 0, '2020-03-06 11:19:26', '2020-03-06 11:19:26'),
	(6, 3, 1, '2020-03-06 11:19:26', '2020-03-06 11:19:26');
/*!40000 ALTER TABLE `exam_parameters` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.genders
CREATE TABLE IF NOT EXISTS `genders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `genders_code_name_unique` (`code`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.genders: ~2 rows (approximately)
DELETE FROM `genders`;
/*!40000 ALTER TABLE `genders` DISABLE KEYS */;
INSERT INTO `genders` (`id`, `code`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'j', 'Repellat et est.', '2020-02-26 09:34:42', '2020-02-26 09:34:42'),
	(2, 'z', 'Ea.', '2020-02-26 09:34:42', '2020-02-26 09:34:42');
/*!40000 ALTER TABLE `genders` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.lessons
CREATE TABLE IF NOT EXISTS `lessons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lessons_link_unique` (`link`),
  KEY `lessons_course_id_foreign` (`course_id`),
  CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.lessons: ~46 rows (approximately)
DELETE FROM `lessons`;
/*!40000 ALTER TABLE `lessons` DISABLE KEYS */;
INSERT INTO `lessons` (`id`, `course_id`, `title`, `description`, `link`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Kub, Bauch and Ryan', 'Canary called out \'The race is over!\' and they lived at the great concert given by the hand, it hurried off, without waiting for turns, quarrelling all the rats and--oh dear!\' cried Alice, quite forgetting in the wood,\' continued the King. (The.', 'http://www.ward.org/labore-voluptatem-ratione-minima-atque.html', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(2, 1, 'Heidenreich PLC', 'However, she got used to know. Let me see: that would be offended again. \'Mine is a very humble tone, going down on their hands and feet, to make out what she was shrinking rapidly; so she helped herself to some tea and bread-and-butter, and then.', 'http://www.mueller.net/et-necessitatibus-eum-officia-quod-numquam-eligendi-qui', 1, '2020-02-27 10:32:00', '2020-02-27 10:33:03'),
	(3, 1, 'Walsh-Pfannerstill', 'I hate cats and dogs.\' It was so full of tears, but said nothing. \'Perhaps it doesn\'t matter a bit,\' said the Caterpillar angrily, rearing itself upright as it left no mark on the twelfth?\' Alice went on in the middle, nursing a baby; the cook and.', 'http://www.roob.com/', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(4, 1, 'Kessler-Hauck', 'Rabbit say to itself, \'Oh dear! Oh dear! I shall ever see you again, you dear old thing!\' said Alice, \'but I know is, something comes at me like a wild beast, screamed \'Off with her face like the three gardeners, but she did not like to show you! A.', 'http://williamson.net/soluta-non-debitis-aliquid-et-cupiditate-molestiae-quis', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(5, 1, 'Will, Jacobs and Franecki', 'At this moment the King, going up to them to sell,\' the Hatter were having tea at it: a Dormouse was sitting on a branch of a muchness"--did you ever saw. How she longed to get her head to keep herself from being run over; and the game was in.', 'http://www.ruecker.com/quis-animi-ad-vel-deleniti.html', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(6, 1, 'Kuvalis PLC', 'WILL become of me? They\'re dreadfully fond of pretending to be ashamed of yourself for asking such a very difficult game indeed. The players all played at once in a frightened tone. \'The Queen of Hearts were seated on their throne when they saw.', 'http://www.mosciski.com/', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(7, 1, 'Bednar and Sons', 'Who ever saw one that size? Why, it fills the whole thing, and she felt that this could not remember the simple and loving heart of her little sister\'s dream. The long grass rustled at her hands, and was going to happen next. First, she dreamed of.', 'https://www.bergstrom.com/nam-odio-nemo-omnis-molestiae-et-molestias', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(8, 1, 'Littel Ltd', 'Alice, who had been (Before she had nibbled some more tea,\' the March Hare. The Hatter was the Duchess\'s voice died away, even in the middle, wondering how she would feel with all their simple sorrows, and find a number of cucumber-frames there.', 'http://www.raynor.biz/sit-dolorem-pariatur-sint-blanditiis-impedit-molestiae.html', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(9, 1, 'Morar, Padberg and Purdy', 'King. (The jury all brightened up again.) \'Please your Majesty,\' said Alice angrily. \'It wasn\'t very civil of you to get very tired of this. I vote the young lady tells us a story.\' \'I\'m afraid I\'ve offended it again!\' For the Mouse was swimming.', 'http://videocdn.bodybuilding.com/video/mp4/62000/62792m.mp4', 1, '2020-02-27 10:32:00', '2020-03-01 21:35:18'),
	(10, 1, 'Hammes-Morar', 'Two began in a low voice. \'Not at all,\' said the King, \'unless it was all very well as she stood still where she was dozing off, and Alice was not otherwise than what it meant till now.\' \'If that\'s all you know about it, so she began thinking over.', 'https://www.simonis.com/aliquid-cum-perspiciatis-quasi-ipsum-fugiat-sapiente', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(11, 1, 'Boyle, Waters and Stroman', 'I shall fall right THROUGH the earth! How funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\'.', 'http://www.walsh.com/qui-nemo-dolor-nobis-sed-aut.html', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(12, 1, 'Towne Ltd', 'Mock Turtle, \'but if you\'ve seen them so shiny?\' Alice looked at it, busily painting them red. Alice thought to herself, rather sharply; \'I advise you to set about it; if I\'m Mabel, I\'ll stay down here! It\'ll be no sort of meaning in it,\' but none.', 'http://oconnell.com/', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(13, 1, 'Kiehn-Macejkovic', 'CAN all that green stuff be?\' said Alice. \'I\'ve read that in some book, but I think I can go back by railway,\' she said to herself \'It\'s the thing Mock Turtle replied; \'and then the other, and making quite a crowd of little pebbles came rattling in.', 'http://walker.net/', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(14, 1, 'Schultz-Steuber', 'Do cats eat bats, I wonder?\' Alice guessed who it was, and, as there was hardly room to open her mouth; but she added, to herself, and shouted out, \'You\'d better not talk!\' said Five. \'I heard the King sharply. \'Do you take me for asking! No, it\'ll.', 'http://www.parisian.org/possimus-consequuntur-amet-doloribus', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(15, 1, 'Murazik-Wyman', 'Alice. \'And be quick about it,\' added the Queen. \'Well, I shan\'t grow any more--As it is, I can\'t take more.\' \'You mean you can\'t be Mabel, for I know is, it would be worth the trouble of getting up and bawled out, "He\'s murdering the time! Off.', 'http://www.yundt.biz/amet-consectetur-aliquid-iste-rerum-ducimus-voluptatum-quod', 1, '2020-02-27 10:32:00', '2020-02-27 10:32:00'),
	(16, 2, 'Bundu dia Kongo', 'Bundu dia Kongo i Muinda mu nza yayo, Luazu kia Tata Nzambi', 'https://youtu.be/?=249fux', 1, '2020-02-27 10:35:40', '2020-02-27 10:35:40'),
	(17, 9, 'Bauch, Grady and Prosacco', 'Gryphon. \'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish they WOULD put their heads down! I am to see the Mock Turtle sighed deeply, and began, in rather a handsome pig, I.', 'http://balistreri.com/suscipit-ea-natus-accusamus-ex-ducimus-molestiae-amet', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(18, 9, 'Brekke, Wyman and Douglas', 'I can\'t put it in asking riddles that have no answers.\' \'If you didn\'t like cats.\' \'Not like cats!\' cried the Gryphon. \'Turn a somersault in the other. \'I beg your pardon!\' she exclaimed in a loud, indignant voice, but she had read several nice.', 'http://www.mcdermott.biz/qui-qui-qui-ratione', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(19, 9, 'Beier-Cassin', 'But she did not venture to ask the question?\' said the Duchess; \'and the moral of that is--"Birds of a well?\' The Dormouse slowly opened his eyes very wide on hearing this; but all he SAID was, \'Why is a very interesting dance to watch,\' said.', 'https://www.mraz.com/corrupti-sint-ut-aliquid-perspiciatis-voluptatem', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(20, 9, 'Boehm Ltd', 'I never knew whether it was all about, and called out, \'First witness!\' The first question of course had to do this, so that her neck would bend about easily in any direction, like a writing-desk?\' \'Come, we shall get on better.\' \'I\'d rather finish.', 'http://www.breitenberg.com/fugit-fuga-dolores-consequuntur-officiis.html', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(21, 9, 'Gorczany, Mann and Russel', 'King replied. Here the Queen said severely \'Who is it I can\'t see you?\' She was moving them about as she could, for her to speak with. Alice waited till she was small enough to drive one crazy!\' The Footman seemed to be Number One,\' said Alice.', 'http://www.kilback.com/voluptatem-voluptatum-harum-quasi-laboriosam-optio-repellendus', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(22, 9, 'Jones LLC', 'Alice. \'I\'ve read that in about half no time! Take your choice!\' The Duchess took no notice of her or of anything to put the hookah into its nest. Alice crouched down among the people near the door of which was sitting between them, fast asleep.', 'https://ankunding.biz/iure-quisquam-necessitatibus-aliquam-natus-est-quam-corporis.html', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(23, 9, 'Schmeler-Veum', 'Alice, surprised at this, she came in sight of the day; and this time she went on in these words: \'Yes, we went to school in the house, quite forgetting in the wood,\' continued the Pigeon, but in a hurried nervous manner, smiling at everything that.', 'http://www.sporer.info/accusamus-omnis-magnam-aut-corporis', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(24, 9, 'Schmitt-Schumm', 'Caterpillar took the opportunity of taking it away. She did not like the three gardeners instantly jumped up, and began smoking again. This time there were TWO little shrieks, and more puzzled, but she gained courage as she could, \'If you knew Time.', 'http://bosco.com/pariatur-labore-dolor-aliquam-autem', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(25, 9, 'Fay PLC', 'Gryphon only answered \'Come on!\' cried the Mock Turtle. \'And how many miles I\'ve fallen by this time, and was in a hot tureen! Who for such dainties would not join the dance?"\' \'Thank you, sir, for your walk!" "Coming in a helpless sort of.', 'http://www.farrell.biz/eos-provident-odio-tempore-aspernatur-quia-natus-repellendus', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(26, 9, 'Murazik, Stehr and Turcotte', 'Soup of the Lobster Quadrille?\' the Gryphon said, in a great hurry, muttering to himself in an offended tone, \'so I should think very likely it can be,\' said the March Hare said--\' \'I didn\'t!\' the March Hare. \'It was the matter with it. There was a.', 'https://auer.com/est-sed-possimus-nesciunt-quod.html', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(27, 9, 'Mueller-Mills', 'Gryphon, \'you first form into a chrysalis--you will some day, you know--and then after that savage Queen: so she went on muttering over the edge with each hand. \'And now which is which?\' she said this, she looked up, but it did not dare to laugh.', 'http://www.nader.com/rerum-aut-modi-ipsum-est.html', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(28, 9, 'Herman Group', 'Queen was close behind it when she had never seen such a long time together.\' \'Which is just the case with my wife; And the Eaglet bent down its head down, and was delighted to find that her neck would bend about easily in any direction, like a.', 'http://oconnell.net/quas-libero-reprehenderit-mollitia-doloribus-aut', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(29, 9, 'Boyle-Gislason', 'Alice quite hungry to look at them--\'I wish they\'d get the trial done,\' she thought, \'it\'s sure to happen,\' she said to the Mock Turtle; \'but it sounds uncommon nonsense.\' Alice said with a T!\' said the Duchess; \'and that\'s why. Pig!\' She said this.', 'https://kshlerin.com/est-modi-voluptas-eius-odit-autem-non-provident.html', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(30, 9, 'Langosh Ltd', 'Mock Turtle in the after-time, be herself a grown woman; and how she would manage it. \'They were obliged to write this down on their slates, \'SHE doesn\'t believe there\'s an atom of meaning in it,\' but none of my life.\' \'You are old, Father.', 'http://kuphal.com/quam-autem-modi-est-et-consectetur', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(31, 9, 'Bergnaum and Sons', 'CHAPTER VI. Pig and Pepper For a minute or two, and the other side will make you grow shorter.\' \'One side of WHAT? The other guests had taken advantage of the door and found that, as nearly as she tucked her arm affectionately into Alice\'s, and.', 'http://schneider.info/dolores-quidem-suscipit-ea-voluptatem-dolore-accusantium-aut', 1, '2020-03-12 17:44:38', '2020-03-12 17:44:38'),
	(32, 7, '22724 Kendall Forges Suite 536\nJadeview, LA 96689', 'No, no! You\'re a serpent; and there\'s no meaning in it,\' said the Rabbit began. Alice gave a look askance-- Said he thanked the whiting kindly, but he would not join the dance. Would not, could not, would not, could not, would not join the dance.', 'http://www.ullrich.com/molestias-sequi-repellat-aspernatur-eos-voluptas-modi', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(33, 7, '50729 Zboncak Lights\nEast Keyon, OH 57512-3992', 'I\'m quite tired and out of the hall: in fact she was losing her temper. \'Are you content now?\' said the Mock Turtle replied in a very difficult question. However, at last she stretched her arms folded, frowning like a candle. I wonder what I was.', 'http://www.prohaska.info/fugit-sint-eius-et-voluptates-debitis', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(34, 7, '61980 Eliane Court Apt. 602\nJohnsport, MS 88457', 'Alice began to cry again, for really I\'m quite tired of being upset, and their slates and pencils had been wandering, when a sharp hiss made her look up in a shrill, loud voice, and the cool fountains. CHAPTER VIII. The Queen\'s Croquet-Ground A.', 'http://borer.com/', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(35, 7, '101 Bill Throughway Suite 046\nSouth Autumn, RI 20493-1456', 'Writhing, of course, to begin with; and being so many different sizes in a whisper.) \'That would be offended again. \'Mine is a long way. So she swallowed one of the court, she said to herself, as usual. \'Come, there\'s half my plan done now! How.', 'http://www.hudson.com/', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(36, 7, '306 Rutherford Extensions Suite 662\nEast Junior, GA 63134-7288', 'Alice to herself, \'after such a thing as a last resource, she put one arm out of THIS!\' (Sounds of more broken glass.) \'Now tell me, please, which way you go,\' said the King. \'I can\'t go no lower,\' said the Cat: \'we\'re all mad here. I\'m mad. You\'re.', 'http://braun.org/iste-ut-ullam-qui-tempore.html', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(37, 7, '25967 Maurice Extension Suite 638\nMitchellburgh, AZ 06950', 'There was no longer to be found: all she could see, when she looked down at them, and was delighted to find my way into a tidy little room with a cart-horse, and expecting every moment to be a LITTLE larger, sir, if you could draw treacle out of.', 'http://www.pouros.com/amet-dolorem-sit-qui-aut-accusantium-amet-ducimus', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(38, 7, '3507 Jillian Turnpike\nLake Flavie, WV 55152-3781', 'King, rubbing his hands; \'so now let the jury--\' \'If any one of them were animals, and some \'unimportant.\' Alice could bear: she got up this morning, but I THINK I can do without lobsters, you know. But do cats eat bats? Do cats eat bats? Do cats.', 'http://www.batz.org/voluptates-nam-officia-est-rerum-dolore-quaerat-a.html', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(39, 7, '2695 Schmidt Fords\nRolfsonberg, TX 20739', 'March Hare. Alice sighed wearily. \'I think I should like it put more simply--"Never imagine yourself not to make out which were the two creatures got so much already, that it was growing, and very soon came upon a heap of sticks and dry leaves, and.', 'http://www.davis.com/nihil-omnis-vel-et', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(40, 7, '6916 Batz Meadow Apt. 123\nMcLaughlinburgh, UT 93048', 'King, who had followed him into the way I want to see the Mock Turtle went on. \'Would you like the wind, and the Queen was silent. The King and the Dormouse said--\' the Hatter added as an unusually large saucepan flew close by her. There was a.', 'https://hudson.biz/voluptas-vero-placeat-eos-laudantium-eos-dolores.html', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(41, 7, '82357 Russell Rest\nKovacekmouth, GA 47791-5786', 'Alice, \'Have you guessed the riddle yet?\' the Hatter asked triumphantly. Alice did not much surprised at her as she leant against a buttercup to rest her chin upon Alice\'s shoulder, and it said in a low voice, \'Why the fact is, you ARE a.', 'http://www.weissnat.com/error-magni-minima-rerum-sit-nihil', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(42, 7, '2790 Kiana Trail\nLake Lurlineton, AL 67243-5773', 'Mary Ann, what ARE you doing out here? Run home this moment, I tell you, you coward!\' and at last the Gryphon only answered \'Come on!\' and ran the faster, while more and more faintly came, carried on the ground near the door, and knocked. \'There\'s.', 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(43, 7, '80648 Littel Vista Suite 203\nSouth Pierce, VA 09479-9241', 'Alice, in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the door. \'Call the next moment she appeared; but she got up in a low, hurried tone. He looked at Alice. \'It goes on, you know,\' said Alice in a melancholy air, and.', 'http://www.kutch.com/consequuntur-blanditiis-natus-officiis-fugit-et-quia', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(44, 7, '16090 D\'Amore Square Suite 514\nWest Normaburgh, VA 72242', 'Alice, who was a body to cut it off from: that he had to fall upon Alice, as the soldiers shouted in reply. \'Please come back and finish your story!\' Alice called after it; and the Gryphon whispered in reply, \'for fear they should forget them.', 'https://www.deckow.biz/quia-vel-illo-a-saepe-rem-magnam', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(45, 7, '8516 Lowe Glens Apt. 320\nElizamouth, MI 61806', 'NOT a serpent!\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to grow here,\' said the Gryphon. \'Well, I can\'t remember,\' said the March Hare and his buttons, and turns out his toes.\' [later editions continued as follows The Panther took.', 'https://www.cummerata.org/eligendi-vel-magni-non-atque-porro-hic-eum', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13'),
	(46, 7, '110 Monahan Crossing Suite 229\nEast Krystina, VT 59329-7642', 'Queen. \'It proves nothing of the month is it?\' The Gryphon lifted up both its paws in surprise. \'What! Never heard of such a noise inside, no one listening, this time, as it could go, and making faces at him as he came, \'Oh! the Duchess, digging.', 'http://www.hermann.biz/', 1, '2020-03-12 20:56:13', '2020-03-12 20:56:13');
/*!40000 ALTER TABLE `lessons` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.materials
CREATE TABLE IF NOT EXISTS `materials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `materials_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.materials: ~12 rows (approximately)
DELETE FROM `materials`;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'Political materials', 'Temporibus.', 1, '2020-02-27 09:17:12', '2020-02-28 14:27:26'),
	(2, 'April', 'Est beatae neque quod et ut ea. Explicabo nesciunt assumenda nihil in.', 1, '2020-02-27 09:17:12', '2020-02-27 09:17:12'),
	(3, 'Historical materials', 'Et voluptatibus odio ad libero rerum facilis omnis.', 1, '2020-02-27 09:17:12', '2020-02-28 14:27:58'),
	(4, 'August', 'Voluptatem at nemo animi aspernatur iure fugiat.', 1, '2020-02-27 09:17:12', '2020-02-27 09:17:12'),
	(5, 'Scientific materials', 'Vero sit aperiam sed itaque at labore commodi impedit.', 1, '2020-02-27 09:17:12', '2020-03-12 16:01:39'),
	(6, 'September', 'Ut et rerum ut excepturi.', 1, '2020-02-27 09:17:12', '2020-02-27 09:17:12'),
	(7, 'December', 'Quos.', 1, '2020-02-27 09:17:12', '2020-02-27 09:17:12'),
	(8, 'June', 'Esse omnis ex vel. Magnam et quis quaerat error perferendis maxime provident.', 1, '2020-02-27 09:17:12', '2020-02-27 09:17:12'),
	(9, 'October', 'Dolor natus dolorem sunt quam dolores nemo.', 1, '2020-02-27 09:17:12', '2020-02-27 09:17:12'),
	(10, 'March', 'Et quia possimus facilis deleniti et. Consequatur provident non consequatur et.', 1, '2020-02-27 09:17:12', '2020-02-27 09:17:12'),
	(11, 'February', 'At ducimus culpa dolor quia inventore.', 1, '2020-02-27 09:17:12', '2020-02-27 09:17:12'),
	(12, 'July', 'Qui dolorum.', 1, '2020-02-27 09:17:12', '2020-02-27 09:17:12');
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.migrations: ~36 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(9, '2014_10_12_000000_create_users_table', 1),
	(10, '2014_10_12_100000_create_password_resets_table', 1),
	(11, '2019_08_19_000000_create_failed_jobs_table', 1),
	(12, '2020_02_25_131211_create_affiliates_table', 1),
	(13, '2020_02_25_143112_create_affiliate_parameters_table', 2),
	(15, '2020_02_25_152514_add_relationship_affiliates', 3),
	(16, '2020_02_26_074749_create_affiliate_members_table', 3),
	(20, '2020_02_26_081019_create_genders_table', 4),
	(25, '2020_02_26_082804_add_gender_to_user_and_relationship', 5),
	(26, '2020_02_26_083753_create_profiles_table', 5),
	(27, '2020_02_26_084524_create_cities_table', 5),
	(28, '2020_02_26_084729_add_city_to_profile_relationship', 5),
	(29, '2020_02_26_093552_adds_api_token_to_users_table', 6),
	(30, '2020_02_26_141158_create_categories_table', 7),
	(31, '2020_02_26_142544_create_questions_table', 8),
	(32, '2020_02_26_145309_create_discussions_table', 9),
	(33, '2020_02_27_085938_create_materials_table', 10),
	(34, '2020_02_27_095714_create_courses_table', 11),
	(35, '2020_02_27_101834_create_lessons_table', 12),
	(36, '2020_02_27_110835_create_modes_table', 13),
	(37, '2020_02_27_114536_add_amount_to_pay_on_modes_table', 14),
	(38, '2020_02_27_114958_add_max_retries_on_modes_table', 15),
	(39, '2020_02_27_120312_create_quizzes_table', 16),
	(40, '2020_02_27_130428_create_assertions_table', 17),
	(41, '2020_02_27_134716_create_answers_table', 18),
	(42, '2020_02_27_142804_create_exams_table', 19),
	(43, '2020_02_27_143811_add_relationship_to_answers_table', 20),
	(45, '2020_02_28_194033_add_lesson_to_exam_table', 21),
	(46, '2020_02_29_091842_create_payment_methods_table', 22),
	(47, '2020_02_29_091901_create_payments_table', 22),
	(48, '2020_02_29_204536_add_public_column_to_questions_table', 23),
	(49, '2020_03_04_165144_add_lecture_mode_column_to_payments_table', 24),
	(50, '2020_03_05_095258_create_commissions_table', 25),
	(51, '2020_03_05_101048_create_balances_table', 25),
	(52, '2020_03_05_101739_add_code_column_to_affiliates_table', 26),
	(53, '2020_03_05_110357_add_members_column_to_balances_table', 27),
	(54, '2020_03_05_134021_add_affiliate_code_column_to_users_table', 28),
	(55, '2020_03_06_110210_create_exam_parameters_table', 29);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.modes
CREATE TABLE IF NOT EXISTS `modes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `winning_average` double(8,2) NOT NULL,
  `amount_to_pay` double(8,2) NOT NULL DEFAULT 0.00,
  `max_retries` tinyint(4) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modes_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.modes: ~2 rows (approximately)
DELETE FROM `modes`;
/*!40000 ALTER TABLE `modes` DISABLE KEYS */;
INSERT INTO `modes` (`id`, `name`, `winning_average`, `amount_to_pay`, `max_retries`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'beginner', 90.00, 20.00, 1, 1, '2020-02-27 11:40:33', '2020-02-29 13:39:23'),
	(2, 'expert', 98.00, 50.00, 0, 1, '2020-02-27 11:40:52', '2020-02-29 13:39:51');
/*!40000 ALTER TABLE `modes` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.payments
CREATE TABLE IF NOT EXISTS `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `payment_method_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `course_id` bigint(20) unsigned NOT NULL,
  `amount` double(8,2) NOT NULL,
  `transaction_code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_mode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payments_transaction_code_unique` (`transaction_code`),
  KEY `payments_payment_method_id_foreign` (`payment_method_id`),
  KEY `payments_user_id_foreign` (`user_id`),
  KEY `payments_course_id_foreign` (`course_id`),
  CONSTRAINT `payments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `payments_payment_method_id_foreign` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.payments: ~12 rows (approximately)
DELETE FROM `payments`;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`id`, `payment_method_id`, `user_id`, `course_id`, `amount`, `transaction_code`, `lecture_mode`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, 1000.00, 'P1-00000001', 'beginner', 1, '2020-02-29 13:20:02', '2020-02-29 13:23:00'),
	(19, 1, 1, 2, 100.00, 'P1-00000002', 'beginner', 0, '2020-03-07 11:33:05', '2020-03-07 11:33:05'),
	(23, 1, 1, 2, 500.00, 'P1-00000003', 'beginner', 0, '2020-03-07 11:57:15', '2020-03-07 11:57:15'),
	(24, 1, 1, 2, 20.00, 'P1-00000004', 'beginner', 0, '2020-03-07 12:08:22', '2020-03-07 12:08:22'),
	(25, 1, 1, 2, 20.00, 'P1-00000005', 'beginner', 0, '2020-03-07 12:09:03', '2020-03-07 12:09:03'),
	(26, 1, 1, 2, 20.00, 'P1-00000006', 'beginner', 0, '2020-03-07 12:10:59', '2020-03-07 12:10:59'),
	(27, 1, 1, 2, 20.00, 'P1-00000007', 'beginner', 1, '2020-03-07 12:18:20', '2020-03-07 12:19:22'),
	(28, 1, 1, 3, 20.00, 'P1-00000008', 'beginner', 0, '2020-03-08 07:31:46', '2020-03-08 07:31:46'),
	(29, 1, 1, 8, 50.00, 'P1-00000009', 'beginner', 1, '2020-03-10 13:45:59', '2020-03-10 13:46:01'),
	(30, 1, 1, 9, 20.00, 'P1-00000010', 'beginner', 0, '2020-03-12 16:26:40', '2020-03-12 16:26:40'),
	(31, 1, 1, 9, 20.00, 'P1-00000011', 'beginner', 1, '2020-03-12 16:30:10', '2020-03-12 16:30:10'),
	(32, 1, 1, 7, 20.00, 'P1-00000012', 'beginner', 1, '2020-03-12 20:48:35', '2020-03-12 21:41:32');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.payment_methods
CREATE TABLE IF NOT EXISTS `payment_methods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `prefix` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_methods_prefix_unique` (`prefix`),
  UNIQUE KEY `payment_methods_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.payment_methods: ~2 rows (approximately)
DELETE FROM `payment_methods`;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` (`id`, `prefix`, `name`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'om', 'orange money', 1, '2020-02-29 12:01:38', '2020-02-29 12:01:38'),
	(2, 'vdc', 'mpesa', 0, '2020-02-29 12:01:49', '2020-02-29 12:24:44');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.profiles
CREATE TABLE IF NOT EXISTS `profiles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `city_id` bigint(20) unsigned NOT NULL,
  `profession` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profiles_phone_number_unique` (`phone_number`),
  KEY `profiles_user_id_foreign` (`user_id`),
  KEY `profiles_city_id_foreign` (`city_id`),
  CONSTRAINT `profiles_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  CONSTRAINT `profiles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.profiles: ~0 rows (approximately)
DELETE FROM `profiles`;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` (`id`, `user_id`, `city_id`, `profession`, `phone_number`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'software developer', '0822178836', '2020-02-26 15:59:08', '2020-02-26 15:59:08');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `is_public` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_category_id_foreign` (`category_id`),
  KEY `questions_user_id_foreign` (`user_id`),
  CONSTRAINT `questions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `questions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.questions: ~9 rows (approximately)
DELETE FROM `questions`;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`id`, `category_id`, `user_id`, `subject`, `description`, `notify`, `is_public`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 'Alice said to herself, \'in my going out altogether, like a candle. I wonder what Latitude was, or.', 'Sint ex voluptatem qui exercitationem aperiam dolores voluptas eum error voluptatem ut tempora veniam asperiores quis sed temporibus aut debitis et vel soluta est id totam aut sed eius enim aut eos iure id ea eos quis laborum et nemo aspernatur magni perspiciatis assumenda est eius quaerat error accusamus et et esse magni praesentium et esse aut quod expedita accusamus nulla et et et cupiditate facere sequi ea tempore nam atque voluptatem ut autem eius distinctio ducimus voluptas dolores dolorum omnis veritatis maiores totam autem et eveniet quia eveniet sit ut dolorum sunt sapiente veritatis quia officia consequatur ipsam architecto libero dolores consequatur repellendus non dignissimos ipsam veniam blanditiis fugit facere eveniet consectetur nihil et dolorem beatae cum ut nostrum qui facilis tenetur ut consequuntur id ea enim voluptatem mollitia voluptatem enim maiores recusandae incidunt aut temporibus vel provident beatae rerum ut distinctio velit voluptatibus labore temporibus illum nulla quasi dicta aut velit nostrum commodi pariatur velit et sed debitis impedit nisi labore qui tenetur rerum nihil explicabo dolorum harum perspiciatis facilis provident quis exercitationem nihil voluptas ea nam omnis sed quae ea veritatis excepturi est expedita aut enim voluptatem porro nihil at consectetur ipsa ad facere.', 0, 0, 1, '2020-02-26 14:37:18', '2020-02-26 14:40:11'),
	(2, 1, 1, 'Mock Turtle. \'And how did you begin?\' The Hatter opened his eyes. He looked anxiously over his.', 'Cum repellat ut aut recusandae voluptatem nobis omnis ducimus nisi ipsam temporibus porro possimus sunt provident aspernatur magnam ea minus omnis voluptate rerum at voluptates aut necessitatibus ipsa fugiat sit quidem reprehenderit totam ea quasi enim est illo voluptatem dolorem corrupti nisi asperiores rerum eaque assumenda pariatur iusto ut sequi quasi voluptate recusandae voluptatum et voluptatem sint qui rem repellendus sequi omnis iste non est commodi dolorem quis et consequatur non sunt cumque consectetur ut ea distinctio optio enim est et velit placeat et harum et commodi quos modi dolore totam molestiae sunt iste totam maxime dolorem voluptatibus eos nemo et dignissimos qui maiores et harum enim labore quasi nulla tempore aliquam facilis dolorem facilis molestiae amet sed sit vel molestias aliquid voluptatem in magnam sint et similique assumenda fuga quos dolorem non molestias quas quae ipsam nulla et tempore sed molestias reprehenderit esse tempore facere dolorem accusantium recusandae iusto ut suscipit commodi amet.', 0, 0, 1, '2020-02-26 14:37:18', '2020-03-04 15:39:27'),
	(3, 1, 1, 'I could show you our cat Dinah: I think it was,\' said the Lory, as soon as look at all the time.', 'Inventore ut assumenda perferendis aut autem dolores et esse eveniet nisi voluptatem nihil distinctio dolor assumenda doloribus ad rem occaecati deserunt ullam ea saepe quae deleniti placeat doloribus vel est aspernatur et aut dignissimos culpa eos quo qui laudantium repellendus accusantium iste dolorem quas nisi id aliquam hic veritatis cumque culpa sit omnis non quis delectus accusantium eius distinctio ut consequatur est tenetur sit suscipit id aut molestiae id ut doloremque repellendus ipsam illo corrupti quidem molestiae voluptate dignissimos dolor id iure aut officiis expedita quia culpa ut qui fuga eum et est qui alias sunt asperiores ex aliquam odit non qui quas maiores eos aspernatur aut sint quisquam ea fugiat.', 0, 0, 1, '2020-02-26 14:37:18', '2020-03-06 20:57:40'),
	(4, 1, 1, 'It\'s high time to wash the things between whiles.\' \'Then you may nurse it a violent shake at the.', 'Ad quia enim sit id corrupti ab expedita laudantium sapiente nobis velit voluptates cum error reprehenderit aut aut provident et autem id dolorem quam quidem natus maiores eius natus et facere molestiae et consectetur voluptatibus quibusdam quia consequatur impedit odit sunt et qui quaerat recusandae iste et dolor sed facere quo dignissimos qui eveniet est dolorem pariatur aut velit dicta odio aspernatur vero quo quia et quis aut tenetur corrupti non eum cumque provident aspernatur natus est quia eligendi doloribus distinctio ut nisi sit sed qui corporis maiores sint rerum quae tenetur vel reiciendis ab voluptatibus quasi distinctio sapiente quo quia eos est perspiciatis voluptas fugiat et quidem quia consequatur veniam delectus dolorem sint quo quia id quia dolorum voluptatum quaerat sit consequatur optio nam dolorem dolorem delectus est veritatis sint tenetur sint minima dicta nulla asperiores voluptatem illo sapiente qui consequuntur sed tenetur recusandae ut aut ullam beatae maiores inventore quidem ipsa molestiae ut consequuntur ipsum sapiente placeat et qui aut commodi accusantium animi est quis quisquam ducimus officiis voluptatibus quia ut numquam eligendi doloremque cumque ut rerum omnis.', 0, 0, 0, '2020-02-26 14:37:18', '2020-02-26 14:37:18'),
	(5, 1, 1, 'March Hare,) \'--it was at the time he was in the sky. Twinkle, twinkle--"\' Here the Queen was in a.', 'Quo omnis sed ut voluptatem sit est non aperiam dignissimos et optio corrupti omnis sed nihil repudiandae optio tenetur asperiores unde dignissimos error molestias quia magni nisi voluptatem doloribus exercitationem inventore est eum quo esse tenetur eius accusantium aut ullam fuga veritatis facilis quia non sint nesciunt unde sapiente sed explicabo qui dicta quia facere repellat rerum est consectetur ex dignissimos et tempore voluptatem deleniti blanditiis explicabo voluptas quo hic mollitia quod aut qui quas harum voluptate consectetur eius quia incidunt consequatur quam porro nam omnis voluptate vero quo deleniti quasi commodi doloribus dolorem voluptatem alias ipsam maiores minus quia et asperiores maiores cumque praesentium est ea aliquid temporibus accusantium natus dignissimos aspernatur qui atque.', 0, 0, 0, '2020-02-26 14:37:18', '2020-02-26 14:37:18'),
	(6, 1, 1, 'Alice, looking down with one of the lefthand bit of stick, and held it out into the court, she.', 'Ut doloremque consequatur exercitationem quis id et totam officiis vel doloremque magni mollitia ipsam unde quibusdam non nihil voluptatibus et cupiditate corporis tempora qui provident iure esse et voluptates autem ea sed sequi assumenda et autem omnis reiciendis architecto consequatur delectus ipsum quia adipisci voluptatem vel autem eum voluptate quis ipsa mollitia voluptatem magnam aut eaque in qui eligendi libero nam facilis accusamus voluptas eum aspernatur perspiciatis ducimus nam molestiae amet facere natus assumenda sint iusto ad alias explicabo sint sed consectetur et non nemo optio voluptatem adipisci quo id assumenda ut corporis minus accusantium voluptatem corporis vitae adipisci similique quia pariatur sequi quisquam ea et repudiandae voluptas quia voluptas eum dolor est impedit ut facere voluptas quis ratione a ad ipsa illo similique similique est dignissimos exercitationem voluptas esse quibusdam sit libero autem neque ut ut vero molestiae dolores architecto reiciendis velit magnam velit excepturi sit ducimus ipsa aliquid velit expedita possimus deserunt deserunt saepe hic earum occaecati et non optio.', 0, 0, 0, '2020-02-26 14:37:18', '2020-02-26 14:37:18'),
	(8, 7, 1, 'Pin copied text snippets to stop them expiring after 1 hour', 'I just wanted to let you know that Kongo is a great place to work and also to live.\nThere you\'ll find great people and opportunities.', 1, 0, 0, '2020-03-02 14:49:46', '2020-03-02 14:49:46'),
	(9, 3, 1, 'Text you copy will automatically show here', 'I just wanted to let you know that Kongo is a great place to work and also to live.\nThere you\'ll find great people and opportunities.', 1, 0, 0, '2020-03-02 14:58:28', '2020-03-02 14:58:28'),
	(10, 7, 1, 'We store, retrieve, delete and update our data in the database taken from the application or from the software that we have made.', 'The data stored in the Firebase Realtime Database is JSON structured i.e. the entire database will be a JSON tree with multiple nodes. So, unlike SQL database, we don\'t have tables or records in the JSON tree. Whenever you are adding some data to the JSON tree, then it becomes a node in the existing JSON structure with some key associated with it.', 1, 0, 1, '2020-03-04 10:36:33', '2020-03-04 14:21:37');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.quizzes
CREATE TABLE IF NOT EXISTS `quizzes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lesson_id` bigint(20) unsigned NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('interactive','normal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quizzes_lesson_id_foreign` (`lesson_id`),
  CONSTRAINT `quizzes_lesson_id_foreign` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.quizzes: ~30 rows (approximately)
DELETE FROM `quizzes`;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` (`id`, `lesson_id`, `question`, `type`, `status`, `created_at`, `updated_at`) VALUES
	(1, 16, 'Voluptatem deleniti commodi et quam totam praesentium ut ad. Qui earum ut et quia enim earum. Illo odio optio possimus et reiciendis doloremque. Occaecati doloribus consequuntur tempore.', 'interactive', 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(2, 16, 'Ea nihil necessitatibus nihil nemo numquam perspiciatis. Enim et a et et quidem.', 'interactive', 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(3, 16, 'Officia aliquid dolores consequuntur asperiores rem dicta reprehenderit. Quod ipsam provident amet harum eum. Voluptatum qui numquam quo. Cum necessitatibus ipsam error voluptas voluptas veniam nulla ratione. Repellendus adipisci suscipit suscipit et.', 'normal', 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(4, 16, 'Non cum et sunt. Quidem ea libero qui fugiat distinctio est. Ea iste quod ut quaerat. Vitae dolore commodi maiores corrupti quo beatae cumque.', 'normal', 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(5, 16, 'Aut suscipit commodi labore itaque non velit. Libero fuga et enim doloribus adipisci.', 'interactive', 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(6, 16, 'Magni ut est consequatur. Impedit non assumenda quia similique impedit. Earum qui dolores odit voluptatum minus minus.', 'interactive', 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(7, 16, 'Maxime id ut quae qui. Voluptatibus nostrum cumque unde atque delectus ex consequatur. Iusto ea quia non in. Ad qui dignissimos aut qui et facilis earum.', 'normal', 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(8, 16, 'Qui molestiae reiciendis numquam reiciendis. Vel qui autem ratione animi veniam molestiae cum. Modi velit accusamus aliquid dolore. Tenetur illo distinctio ad sit consequatur.', 'normal', 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(9, 16, 'Perferendis molestias quo aut adipisci. Sit aliquam laborum corporis natus. Dolor rerum eum ut autem qui dignissimos nihil. Doloremque et ratione corrupti et.', 'interactive', 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(10, 16, 'Voluptatibus minus et et fugit voluptas quibusdam est. Fugit vitae odit laudantium quia praesentium neque enim. Libero ut corporis recusandae quibusdam dicta. Et ratione qui et unde quidem placeat quaerat.', 'interactive', 1, '2020-03-06 07:50:23', '2020-03-06 07:50:23'),
	(11, 9, 'Inventore incidunt repudiandae nisi est nihil. Non est rem itaque quod. Atque aliquam aliquid quis recusandae illo. Soluta mollitia nemo qui neque qui aut.', 'interactive', 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(12, 9, 'Ut ea velit laboriosam atque vitae ea reprehenderit. Voluptates dolores possimus perspiciatis laudantium. Quidem doloremque fuga iusto voluptate.', 'interactive', 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(13, 9, 'Earum ab libero officia nihil impedit aut ea. Repellendus ut consequuntur distinctio. Aut quibusdam dolorem quia vel. Hic nobis et porro et harum.', 'interactive', 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(14, 9, 'Rerum est exercitationem ut eveniet sint deserunt ex. At architecto blanditiis quo natus. Consequatur animi et mollitia nihil deleniti. Eligendi velit ipsam aliquid et nobis.', 'interactive', 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(15, 9, 'Deleniti aut repellendus quidem pariatur et commodi. Vel ducimus saepe iure repudiandae quam est facilis dolores. Rerum veniam vitae et cumque ea. Nihil consectetur vero earum iusto neque sit facilis.', 'interactive', 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(16, 9, 'Ea sit doloremque occaecati doloribus. Placeat consectetur consequatur vel quidem. Corporis aliquid et est autem rerum aut illo totam.', 'interactive', 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(17, 9, 'Cumque et eos adipisci sed quis voluptatem necessitatibus. Rerum omnis aut expedita quis quam cum quam numquam. Architecto impedit nobis doloribus.', 'normal', 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(18, 9, 'Aut et perspiciatis itaque repellat. Impedit facere ut quae at perferendis tenetur nisi dolore. Sed sint aut blanditiis.', 'interactive', 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(19, 9, 'Facilis labore voluptatem iure ut rem aut odio. Nesciunt tempora esse doloribus temporibus veniam.', 'interactive', 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(20, 9, 'Enim consequuntur distinctio vel et. Aut facilis voluptates dolorem totam. Autem earum assumenda consectetur architecto. Nesciunt enim necessitatibus labore at.', 'normal', 1, '2020-03-07 12:45:23', '2020-03-07 12:45:23'),
	(21, 29, 'Magni unde accusantium inventore nostrum eligendi. Sit sunt laboriosam dolorem ut. Doloribus dolor perferendis eligendi. Cum sit dolorem veritatis omnis et earum quibusdam. Maxime corporis aspernatur rerum dignissimos aliquid.', 'interactive', 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(22, 29, 'Consequatur et quia quos accusantium possimus quod quia. Facere inventore illum unde distinctio nostrum omnis aut. A hic eveniet occaecati vel molestias fugiat temporibus. Quis consequatur sequi nemo officia ipsa enim culpa.', 'interactive', 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(23, 29, 'Fuga facilis et neque quia. Doloribus minus quis et deserunt nisi. Velit molestiae sunt laudantium.', 'interactive', 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(24, 29, 'Eos ea atque quod. Est deleniti dolorum ab ratione vitae optio dolorem. Minus velit dolores possimus nihil.', 'normal', 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(25, 29, 'Alias nostrum qui blanditiis laborum ut. Facere aut earum alias ratione. Et est asperiores placeat similique repellat dicta rerum officiis. Qui laudantium odio aut omnis aut maxime et suscipit.', 'interactive', 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(26, 29, 'Voluptatem nihil neque id nobis alias. Nihil alias occaecati ipsa error magni est ipsam.', 'normal', 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(27, 29, 'Ipsum est et reiciendis ea voluptas nisi. Adipisci recusandae rerum laborum expedita beatae maiores. Repudiandae quidem ut autem numquam. Et nulla enim tempora.', 'normal', 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(28, 29, 'Quo facere quas accusantium quia est nesciunt aperiam provident. Corporis et maxime voluptatem consequatur. Rerum dolorem sed sapiente nesciunt voluptatem. Harum quia dolores et ea.', 'interactive', 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(29, 29, 'Doloremque consequatur aliquid nisi aut. Dolor facilis in quo mollitia aperiam sint quo velit. Et nulla voluptatem est et et. Sapiente autem exercitationem asperiores et veritatis repellat.', 'normal', 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27'),
	(30, 29, 'Corporis ut omnis tempora quae vero. Sunt ut ex odio est nobis ipsum quae. Nostrum fugit ea harum cupiditate atque quia minus. Esse est atque odit culpa neque voluptatum.', 'normal', 1, '2020-03-12 17:46:27', '2020-03-12 17:46:27');
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;

-- Dumping structure for table lusadusu_dtb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gender_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `affiliate_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`),
  KEY `users_gender_id_foreign` (`gender_id`),
  CONSTRAINT `users_gender_id_foreign` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table lusadusu_dtb.users: ~12 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `gender_id`, `name`, `date_of_birth`, `email`, `email_verified_at`, `password`, `remember_token`, `affiliate_code`, `created_at`, `updated_at`, `api_token`) VALUES
	(1, 1, 'Mr. Kiala Ntona', NULL, 'admin@test.com', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, NULL, '2020-02-26 09:34:46', '2020-02-26 13:54:10', NULL),
	(2, 1, 'Mr. Alexys Metz MD', NULL, 'vonrueden.sebastian@yahoo.com', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, 'AF00000001', '2020-02-26 09:34:46', '2020-02-26 09:34:46', NULL),
	(3, 1, 'Amelia Mohr', NULL, 'ericka.ruecker@gleason.com', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, 'AF00000001', '2020-02-26 09:34:46', '2020-02-26 09:34:46', NULL),
	(4, 1, 'Talon Huels', NULL, 'abbott.perry@hotmail.com', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, 'AF00000001', '2020-02-26 09:34:46', '2020-02-26 09:34:46', NULL),
	(5, 1, 'Paula Klocko', NULL, 'hilpert.brandon@gmail.com', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, 'AF00000001', '2020-02-26 09:34:46', '2020-02-26 09:34:46', NULL),
	(6, 1, 'Allen Erdman I', NULL, 'aditya.mosciski@hoeger.com', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, 'AF00000001', '2020-02-26 09:34:46', '2020-02-26 09:34:46', NULL),
	(7, 1, 'Ewald Herman II', NULL, 'ford.hackett@klein.org', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, 'AF00000001', '2020-02-26 09:34:46', '2020-02-26 09:34:46', NULL),
	(8, 1, 'Armand Heidenreich', NULL, 'ashton86@gmail.com', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, 'AF00000001', '2020-02-26 09:34:46', '2020-02-26 09:34:46', NULL),
	(9, 1, 'Dr. Rosario Paucek', NULL, 'aryanna.fay@gmail.com', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, 'AF00000001', '2020-02-26 09:34:46', '2020-02-26 09:34:46', NULL),
	(10, 1, 'Yvette Schaden', NULL, 'isobel60@hotmail.com', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, 'AF00000001', '2020-02-26 09:34:46', '2020-02-26 09:34:46', NULL),
	(11, 1, 'Mr. Nathanial Botsford II', NULL, 'lloyd.effertz@yahoo.com', NULL, '$2y$10$ZdRBEglXTdt7ePLtV4O2MusnKzYCAm0Hv/hQowdsrW639I0P.ijEu', NULL, 'AF00000001', '2020-02-26 09:34:46', '2020-02-26 09:34:46', NULL),
	(12, 1, 'Mr. Kiala Ntona II', NULL, 'nekiala@gmail.com', NULL, '$2y$10$Tprp6qxdFtF8OK.rEExQoeXC3ilVMqs9dI0AN0hXHvtz/dFwBYm1W', NULL, 'AF00000001', '2020-02-26 10:09:34', '2020-02-26 10:09:34', 'VaCan5I7siEPNJaBLhDHheIOOVA4p5XHsKx3LjlLnNOzODNmwk9osSTuxjeB');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
