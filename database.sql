-- MySQL dump 10.13  Distrib 8.2.0, for macos14.0 (arm64)
--
-- Host: localhost    Database: jobbox
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'eUAvcAOgrIUzYH7GgvlrwfIMyh7I04aU',1,'2024-03-27 08:37:28','2024-03-27 08:37:28','2024-03-27 08:37:28');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Design',0,'Illum porro mollitia facere porro eos est sint itaque. Aut impedit ut impedit ut. Quae sit doloremque dolores magni deleniti aut nobis.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,1,'2024-03-27 08:37:33','2024-03-27 08:37:33'),(2,'Lifestyle',0,'Facere ut temporibus nesciunt fugit quia. Dolores fugiat facere praesentium deserunt aut quo. Quod magnam dolorum ex alias nesciunt.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-27 08:37:33','2024-03-27 08:37:33'),(3,'Travel Tips',2,'Magni repudiandae nam explicabo est similique. Assumenda modi exercitationem labore esse voluptatem ut.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-03-27 08:37:33','2024-03-27 08:37:33'),(4,'Healthy',0,'Ab illum et eos a ut ipsa sequi. Est nisi eveniet iure dolorem hic pariatur. Fuga aspernatur et perspiciatis iusto recusandae veniam.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-27 08:37:33','2024-03-27 08:37:33'),(5,'Travel Tips',4,'Incidunt vero et quaerat sequi aut ea. Ea est error ipsam veniam temporibus est assumenda ut. Explicabo totam numquam et ut. Sequi aut ducimus similique occaecati eum quaerat cupiditate harum.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-03-27 08:37:33','2024-03-27 08:37:33'),(6,'Hotel',0,'Sed sunt quo itaque voluptate. Tenetur est eaque incidunt exercitationem. Sed ad sed modi et. Itaque cupiditate amet qui in atque modi suscipit.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-03-27 08:37:33','2024-03-27 08:37:33'),(7,'Nature',6,'Voluptatibus exercitationem exercitationem occaecati vitae esse. Et quas odit praesentium laboriosam soluta corrupti maxime aut. Quia esse molestias modi iure.','published',NULL,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-03-27 08:37:33','2024-03-27 08:37:33');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Paris','paris',1,1,NULL,0,'locations/location1.png',0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(2,'London','london',2,2,NULL,0,'locations/location2.png',0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(3,'New York','new-york',3,3,NULL,0,'locations/location3.png',0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(4,'New York','new-york-1',4,4,NULL,0,'locations/location4.png',0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(5,'Copenhagen','copenhagen',5,5,NULL,0,'locations/location5.png',0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(6,'Berlin','berlin',6,6,NULL,0,'locations/location6.png',0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Jimmie Stark Sr.','halvorson.stewart@example.org','+17154412477','5970 Madalyn Glen\nSouth Josiannemouth, ID 65844','Quisquam laborum perspiciatis ad cumque magnam.','Nihil unde omnis neque ut sit est. Est dolores quos ut voluptatum inventore vel distinctio. Eos qui quae qui veritatis quae praesentium. Nostrum velit dolor rerum totam quo eum enim. Vel molestias velit unde illum quos. Voluptas nostrum culpa illo doloremque doloremque eaque cupiditate. Illo explicabo aut eligendi laboriosam et dolorem possimus. Atque non aspernatur voluptatem. Est neque est accusantium veritatis esse. Facilis porro sit velit optio labore enim qui.','unread','2024-03-27 08:37:34','2024-03-27 08:37:34'),(2,'Ms. Rosalia Graham','brogahn@example.net','+16828419514','4666 Kunze Port Apt. 805\nTyshawntown, ND 22158-5816','Ullam eos quam deserunt voluptatum sunt.','Saepe itaque aut voluptatem tempora sint quis animi aut. Ut sint quam ratione facilis autem. Qui sint asperiores et deserunt eligendi. Fugit et repellendus impedit distinctio numquam laborum. Voluptatem ad dolorem nihil dicta qui numquam. Eum enim et quidem ut. Voluptates sed quos eius quis. Saepe at inventore aliquam quia quisquam quos et quasi. Molestiae repellat eum ut delectus sequi. Necessitatibus vel cum nulla officiis.','unread','2024-03-27 08:37:34','2024-03-27 08:37:34'),(3,'Alexandria Stokes','collins.celine@example.net','+12088465253','56470 Prosacco Hill Suite 748\nKuhlmanmouth, NV 61117','Laborum et voluptatem animi repellendus.','Illum doloremque sapiente quia accusantium voluptatem adipisci quia. Omnis repellendus consectetur in. Sit iure eaque quia eos labore eum rerum. Sunt eum tenetur sed illum. Optio dolor distinctio et neque vero qui. Alias vitae ut adipisci. Numquam asperiores excepturi vel mollitia. Ratione id voluptatem voluptas expedita dicta mollitia. Sapiente quis voluptatum ex. Ut quos sed vero saepe tempore id blanditiis ab. Assumenda sed libero unde amet ut omnis esse ratione.','unread','2024-03-27 08:37:34','2024-03-27 08:37:34'),(4,'Frances Grimes','kilback.audrey@example.net','+19568230964','32999 Darian Keys Suite 309\nNorth Maidaburgh, ID 41722','Totam recusandae quibusdam explicabo dolor.','Atque et fugiat natus optio sed exercitationem itaque. Veritatis qui fugiat rem quo debitis consequuntur. Ipsam atque accusamus nisi ipsa necessitatibus eveniet. Explicabo ut soluta nemo sunt et aut. Est inventore architecto deleniti est ea consequatur aperiam. Necessitatibus molestiae adipisci sed quidem officia laboriosam quae. Omnis commodi asperiores odio ex illum eum aperiam. Tempora molestiae aut minus officiis suscipit.','read','2024-03-27 08:37:34','2024-03-27 08:37:34'),(5,'Sheila Schneider V','maximillia20@example.org','+19299614609','78836 Thiel Lodge Suite 052\nAlphonsoshire, HI 02196-7223','Rerum excepturi optio incidunt hic.','Voluptates delectus nobis omnis dolor. Voluptas minima ut quasi non ullam. At eaque aut doloremque sed deserunt porro. Ipsam illum amet sed nobis non deserunt laboriosam. Qui id dolor aut placeat nostrum. Cupiditate aut blanditiis saepe pariatur. Rerum ut nostrum provident nihil pariatur rem reiciendis. Sit numquam veniam iure a expedita. Iusto deserunt tenetur est quaerat id est vitae. Et tempore omnis dolorem dolor aspernatur reiciendis blanditiis.','unread','2024-03-27 08:37:34','2024-03-27 08:37:34'),(6,'Nathanial Kohler','lenore27@example.com','+15074770108','38075 Johnathon Estate\nSylvanfurt, SD 56911','Tempore dicta sed corrupti non iure.','Beatae laboriosam omnis aut voluptate voluptatem. Sapiente modi minus in non officia et eaque. Optio aliquam et culpa eum sapiente incidunt in. Iure ullam earum id. Impedit in non beatae rem fugiat. Porro necessitatibus alias placeat expedita quia similique hic excepturi. Sint sequi amet fugiat ipsa enim molestias magni. Enim quasi distinctio ipsa voluptatem quia est. Ipsum est est repellendus reiciendis ut vitae. Ea asperiores impedit at dicta. Blanditiis distinctio vero qui excepturi autem.','unread','2024-03-27 08:37:34','2024-03-27 08:37:34'),(7,'Prof. Destini Labadie DVM','thurman.connelly@example.net','+16788746843','695 Kathleen Inlet\nPort Zackary, CA 80491-5418','Ea est enim perspiciatis voluptas totam impedit.','Numquam quia voluptatem fugiat doloribus ipsum delectus. Animi deleniti error ut omnis officia quos sit minima. Voluptas praesentium sapiente voluptas aspernatur ea quas. Non et iste in quia. Sed qui natus dicta ipsam natus. Fugit illum sint est facilis amet voluptates. Tenetur id praesentium dolore ut rem corporis. Inventore vero qui doloribus iure laboriosam. Sit nobis illum sunt velit deserunt. Perspiciatis impedit consequatur quos aut amet dolore.','unread','2024-03-27 08:37:34','2024-03-27 08:37:34'),(8,'Joanny Becker','juvenal29@example.org','+12199038193','5450 Kerluke Squares\nHeidenreichland, CT 45852-3348','Assumenda dolores adipisci omnis dolorem.','Blanditiis molestiae velit mollitia perferendis in reiciendis reprehenderit. Nihil enim molestias minus dicta accusamus quis. Nostrum repudiandae molestiae quidem esse blanditiis nostrum. Unde eum voluptas sed sit est. Veritatis eos et et quaerat natus provident autem. Minima labore veniam veniam iure nulla. Sequi rerum fugit aperiam occaecati eos. Voluptatem laborum iusto nisi non voluptatem aut libero. Quod occaecati ut deserunt voluptatem ut.','read','2024-03-27 08:37:34','2024-03-27 08:37:34'),(9,'Eldred Schumm III','kohler.maxie@example.net','+17657945368','6142 Gunner Run\nSouth Veldaland, DC 11039','Et ut unde doloremque ea laboriosam.','Voluptas aut nulla dolor. Quia perspiciatis beatae nulla provident officiis. Ad maiores eaque incidunt nulla magnam expedita fuga. Voluptas natus rerum molestias assumenda. Quia voluptatum delectus voluptatem non veritatis ea vel suscipit. Dolorem nostrum expedita voluptatibus quia amet. Mollitia praesentium rem impedit. Impedit numquam et at. Est quibusdam libero laboriosam repellat omnis. Omnis beatae et sequi incidunt esse pariatur. Consequuntur ea in autem ab ex.','unread','2024-03-27 08:37:34','2024-03-27 08:37:34'),(10,'Hope Armstrong','keagan.hettinger@example.org','+13054584606','547 Aubree Trail Suite 211\nNorth Trehaven, MN 28431','Architecto assumenda eveniet quasi.','Quos alias voluptates sit qui explicabo dolore. Sint sit cumque sit sit aliquid autem. Vel eligendi accusamus officiis voluptatem aut laudantium recusandae. Excepturi dolores maiores fugiat et cum reprehenderit est. Commodi voluptas quia est officia ut. Eveniet omnis tempore nemo. Occaecati ipsam eveniet autem corporis sunt. Consequatur velit minima voluptatem explicabo totam qui vero. Labore impedit animi ratione omnis repellendus itaque labore enim.','unread','2024-03-27 08:37:34','2024-03-27 08:37:34');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'France','French',0,0,'published','2024-03-27 08:37:37',NULL,'FRA'),(2,'England','English',0,0,'published','2024-03-27 08:37:37',NULL,'UK'),(3,'USA','Americans',0,0,'published','2024-03-27 08:37:37',NULL,'US'),(4,'Holland','Dutch',0,0,'published','2024-03-27 08:37:37',NULL,'HL'),(5,'Denmark','Danish',0,0,'published','2024-03-27 08:37:37',NULL,'DN'),(6,'Germany','Danish',0,0,'published','2024-03-27 08:37:37',NULL,'DN');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'General',0,'published','2024-03-27 08:38:24','2024-03-27 08:38:24',NULL),(2,'Buying',1,'published','2024-03-27 08:38:24','2024-03-27 08:38:24',NULL),(3,'Payment',2,'published','2024-03-27 08:38:24','2024-03-27 08:38:24',NULL),(4,'Support',3,'published','2024-03-27 08:38:24','2024-03-27 08:38:24',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',1,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(2,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(3,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',1,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(4,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',1,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(5,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',1,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(6,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(7,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',2,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(8,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(9,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',2,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(10,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',2,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(11,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',2,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(12,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(13,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',3,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(14,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(15,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',3,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(16,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',3,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(17,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',3,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(18,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(19,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',4,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(20,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(21,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',4,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(22,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',4,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(23,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',4,'published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(24,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-03-27 08:38:24','2024-03-27 08:38:24');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'Perfect','Illo cum voluptatem sed sed nemo minus. Consequatur eligendi omnis nemo facilis nisi quia. Qui quam corrupti quibusdam qui culpa.',1,0,'galleries/1.jpg',1,'published','2024-03-27 08:37:34','2024-03-27 08:37:34'),(2,'New Day','Velit ea quos deleniti iste sed. Atque porro facilis et tenetur rem. Quo veniam labore rerum tempore deleniti.',1,0,'galleries/2.jpg',1,'published','2024-03-27 08:37:34','2024-03-27 08:37:34'),(3,'Happy Day','Distinctio repellendus sunt quos culpa. Eaque voluptatem animi inventore esse corporis. Quis nihil iure autem est. In cumque molestias dolore qui.',1,0,'galleries/3.jpg',1,'published','2024-03-27 08:37:34','2024-03-27 08:37:34'),(4,'Nature','Provident aliquid non totam doloremque dolore. Voluptatum ut ut tempora. Est magni ducimus sapiente iste praesentium excepturi accusantium.',1,0,'galleries/4.jpg',1,'published','2024-03-27 08:37:34','2024-03-27 08:37:34'),(5,'Morning','Sit dolor deleniti enim expedita officia eius. Aut asperiores nam ipsa accusamus natus natus. Aliquam quidem natus et cumque quia voluptatem.',1,0,'galleries/5.jpg',1,'published','2024-03-27 08:37:34','2024-03-27 08:37:34'),(6,'Photography','Dolorem facilis id voluptatem qui ut. Accusantium deleniti a reprehenderit molestiae adipisci repellendus voluptas repellendus.',1,0,'galleries/6.jpg',1,'published','2024-03-27 08:37:34','2024-03-27 08:37:34');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries_translations`
--

DROP TABLE IF EXISTS `galleries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `galleries_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`galleries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries_translations`
--

LOCK TABLES `galleries_translations` WRITE;
/*!40000 ALTER TABLE `galleries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `galleries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta`
--

DROP TABLE IF EXISTS `gallery_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `images` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_meta_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta`
--

LOCK TABLES `gallery_meta` WRITE;
/*!40000 ALTER TABLE `gallery_meta` DISABLE KEYS */;
INSERT INTO `gallery_meta` VALUES (1,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Incidunt autem suscipit esse illo omnis libero. Eligendi consequatur mollitia deleniti rerum alias.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Aliquid impedit a et quisquam qui quidem quod. Non aliquam ea quo. Omnis minima eos reprehenderit et impedit.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Odio optio laudantium officia quis. Maxime earum repellendus vel qui. Atque sint corporis qui in aut fugiat modi.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Qui iste et accusamus vitae. Rerum pariatur non officiis. Repellendus vitae ut et recusandae porro consequatur. Voluptatibus id sed repudiandae qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui recusandae dicta tempore neque. Odio sed sint quo repudiandae ad vitae. Maxime adipisci quasi pariatur quibusdam enim ut voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A est rerum atque autem rerum velit. Autem perspiciatis eveniet quos ratione laboriosam aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quas eos dolorem repellendus tempore optio qui quis. Voluptatem quaerat sequi et eum. Omnis velit voluptatem ab eligendi distinctio.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Tempore suscipit sunt et qui placeat. Non eligendi hic inventore numquam eum. Sit qui a quia quos eos sequi.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Deserunt qui dolores dolor ut quia architecto libero. Consectetur voluptatem ipsum voluptate. Id iusto deleniti ullam ut error.\"}]',1,'Botble\\Gallery\\Models\\Gallery','2024-03-27 08:37:34','2024-03-27 08:37:34'),(2,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Incidunt autem suscipit esse illo omnis libero. Eligendi consequatur mollitia deleniti rerum alias.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Aliquid impedit a et quisquam qui quidem quod. Non aliquam ea quo. Omnis minima eos reprehenderit et impedit.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Odio optio laudantium officia quis. Maxime earum repellendus vel qui. Atque sint corporis qui in aut fugiat modi.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Qui iste et accusamus vitae. Rerum pariatur non officiis. Repellendus vitae ut et recusandae porro consequatur. Voluptatibus id sed repudiandae qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui recusandae dicta tempore neque. Odio sed sint quo repudiandae ad vitae. Maxime adipisci quasi pariatur quibusdam enim ut voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A est rerum atque autem rerum velit. Autem perspiciatis eveniet quos ratione laboriosam aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quas eos dolorem repellendus tempore optio qui quis. Voluptatem quaerat sequi et eum. Omnis velit voluptatem ab eligendi distinctio.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Tempore suscipit sunt et qui placeat. Non eligendi hic inventore numquam eum. Sit qui a quia quos eos sequi.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Deserunt qui dolores dolor ut quia architecto libero. Consectetur voluptatem ipsum voluptate. Id iusto deleniti ullam ut error.\"}]',2,'Botble\\Gallery\\Models\\Gallery','2024-03-27 08:37:34','2024-03-27 08:37:34'),(3,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Incidunt autem suscipit esse illo omnis libero. Eligendi consequatur mollitia deleniti rerum alias.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Aliquid impedit a et quisquam qui quidem quod. Non aliquam ea quo. Omnis minima eos reprehenderit et impedit.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Odio optio laudantium officia quis. Maxime earum repellendus vel qui. Atque sint corporis qui in aut fugiat modi.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Qui iste et accusamus vitae. Rerum pariatur non officiis. Repellendus vitae ut et recusandae porro consequatur. Voluptatibus id sed repudiandae qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui recusandae dicta tempore neque. Odio sed sint quo repudiandae ad vitae. Maxime adipisci quasi pariatur quibusdam enim ut voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A est rerum atque autem rerum velit. Autem perspiciatis eveniet quos ratione laboriosam aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quas eos dolorem repellendus tempore optio qui quis. Voluptatem quaerat sequi et eum. Omnis velit voluptatem ab eligendi distinctio.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Tempore suscipit sunt et qui placeat. Non eligendi hic inventore numquam eum. Sit qui a quia quos eos sequi.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Deserunt qui dolores dolor ut quia architecto libero. Consectetur voluptatem ipsum voluptate. Id iusto deleniti ullam ut error.\"}]',3,'Botble\\Gallery\\Models\\Gallery','2024-03-27 08:37:34','2024-03-27 08:37:34'),(4,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Incidunt autem suscipit esse illo omnis libero. Eligendi consequatur mollitia deleniti rerum alias.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Aliquid impedit a et quisquam qui quidem quod. Non aliquam ea quo. Omnis minima eos reprehenderit et impedit.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Odio optio laudantium officia quis. Maxime earum repellendus vel qui. Atque sint corporis qui in aut fugiat modi.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Qui iste et accusamus vitae. Rerum pariatur non officiis. Repellendus vitae ut et recusandae porro consequatur. Voluptatibus id sed repudiandae qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui recusandae dicta tempore neque. Odio sed sint quo repudiandae ad vitae. Maxime adipisci quasi pariatur quibusdam enim ut voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A est rerum atque autem rerum velit. Autem perspiciatis eveniet quos ratione laboriosam aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quas eos dolorem repellendus tempore optio qui quis. Voluptatem quaerat sequi et eum. Omnis velit voluptatem ab eligendi distinctio.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Tempore suscipit sunt et qui placeat. Non eligendi hic inventore numquam eum. Sit qui a quia quos eos sequi.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Deserunt qui dolores dolor ut quia architecto libero. Consectetur voluptatem ipsum voluptate. Id iusto deleniti ullam ut error.\"}]',4,'Botble\\Gallery\\Models\\Gallery','2024-03-27 08:37:34','2024-03-27 08:37:34'),(5,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Incidunt autem suscipit esse illo omnis libero. Eligendi consequatur mollitia deleniti rerum alias.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Aliquid impedit a et quisquam qui quidem quod. Non aliquam ea quo. Omnis minima eos reprehenderit et impedit.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Odio optio laudantium officia quis. Maxime earum repellendus vel qui. Atque sint corporis qui in aut fugiat modi.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Qui iste et accusamus vitae. Rerum pariatur non officiis. Repellendus vitae ut et recusandae porro consequatur. Voluptatibus id sed repudiandae qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui recusandae dicta tempore neque. Odio sed sint quo repudiandae ad vitae. Maxime adipisci quasi pariatur quibusdam enim ut voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A est rerum atque autem rerum velit. Autem perspiciatis eveniet quos ratione laboriosam aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quas eos dolorem repellendus tempore optio qui quis. Voluptatem quaerat sequi et eum. Omnis velit voluptatem ab eligendi distinctio.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Tempore suscipit sunt et qui placeat. Non eligendi hic inventore numquam eum. Sit qui a quia quos eos sequi.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Deserunt qui dolores dolor ut quia architecto libero. Consectetur voluptatem ipsum voluptate. Id iusto deleniti ullam ut error.\"}]',5,'Botble\\Gallery\\Models\\Gallery','2024-03-27 08:37:34','2024-03-27 08:37:34'),(6,'[{\"img\":\"galleries\\/1.jpg\",\"description\":\"Incidunt autem suscipit esse illo omnis libero. Eligendi consequatur mollitia deleniti rerum alias.\"},{\"img\":\"galleries\\/2.jpg\",\"description\":\"Aliquid impedit a et quisquam qui quidem quod. Non aliquam ea quo. Omnis minima eos reprehenderit et impedit.\"},{\"img\":\"galleries\\/3.jpg\",\"description\":\"Odio optio laudantium officia quis. Maxime earum repellendus vel qui. Atque sint corporis qui in aut fugiat modi.\"},{\"img\":\"galleries\\/4.jpg\",\"description\":\"Qui iste et accusamus vitae. Rerum pariatur non officiis. Repellendus vitae ut et recusandae porro consequatur. Voluptatibus id sed repudiandae qui.\"},{\"img\":\"galleries\\/5.jpg\",\"description\":\"Qui recusandae dicta tempore neque. Odio sed sint quo repudiandae ad vitae. Maxime adipisci quasi pariatur quibusdam enim ut voluptas.\"},{\"img\":\"galleries\\/6.jpg\",\"description\":\"A est rerum atque autem rerum velit. Autem perspiciatis eveniet quos ratione laboriosam aut.\"},{\"img\":\"galleries\\/7.jpg\",\"description\":\"Quas eos dolorem repellendus tempore optio qui quis. Voluptatem quaerat sequi et eum. Omnis velit voluptatem ab eligendi distinctio.\"},{\"img\":\"galleries\\/8.jpg\",\"description\":\"Tempore suscipit sunt et qui placeat. Non eligendi hic inventore numquam eum. Sit qui a quia quos eos sequi.\"},{\"img\":\"galleries\\/9.jpg\",\"description\":\"Deserunt qui dolores dolor ut quia architecto libero. Consectetur voluptatem ipsum voluptate. Id iusto deleniti ullam ut error.\"}]',6,'Botble\\Gallery\\Models\\Gallery','2024-03-27 08:37:34','2024-03-27 08:37:34');
/*!40000 ALTER TABLE `gallery_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gallery_meta_translations`
--

DROP TABLE IF EXISTS `gallery_meta_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gallery_meta_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gallery_meta_id` bigint unsigned NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`gallery_meta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gallery_meta_translations`
--

LOCK TABLES `gallery_meta_translations` WRITE;
/*!40000 ALTER TABLE `gallery_meta_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `gallery_meta_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_activity_logs`
--

DROP TABLE IF EXISTS `jb_account_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_account_activity_logs_account_id_index` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_activity_logs`
--

LOCK TABLES `jb_account_activity_logs` WRITE;
/*!40000 ALTER TABLE `jb_account_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_educations`
--

DROP TABLE IF EXISTS `jb_account_educations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_educations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `specialized` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_educations`
--

LOCK TABLES `jb_account_educations` WRITE;
/*!40000 ALTER TABLE `jb_account_educations` DISABLE KEYS */;
INSERT INTO `jb_account_educations` VALUES (1,'Gateway Technical College',2,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:45','2024-03-27 08:37:45'),(2,'Antioch University McGregor',7,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:46','2024-03-27 08:37:46'),(3,'The University of the State of Alabama',8,'Classical Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:47','2024-03-27 08:37:47'),(4,'Antioch University McGregor',9,'Classical Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:47','2024-03-27 08:37:47'),(5,'American Institute of Health Technology',10,'Classical Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:47','2024-03-27 08:37:47'),(6,'Associated Mennonite Biblical Seminary',13,'Culture and Technology Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:49','2024-03-27 08:37:49'),(7,'Adams State College',16,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:50','2024-03-27 08:37:50'),(8,'Antioch University McGregor',19,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:51','2024-03-27 08:37:51'),(9,'American Institute of Health Technology',20,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:52','2024-03-27 08:37:52'),(10,'The University of the State of Alabama',21,'Culture and Technology Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:52','2024-03-27 08:37:52'),(11,'American Institute of Health Technology',24,'Anthropology','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:53','2024-03-27 08:37:53'),(12,'The University of the State of Alabama',28,'Anthropology','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:55','2024-03-27 08:37:55'),(13,'American Institute of Health Technology',29,'Anthropology','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:55','2024-03-27 08:37:55'),(14,'Adams State College',30,'Anthropology','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:55','2024-03-27 08:37:55'),(15,'The University of the State of Alabama',34,'Classical Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:57','2024-03-27 08:37:57'),(16,'American Institute of Health Technology',35,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:57','2024-03-27 08:37:57'),(17,'Adams State College',37,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:58','2024-03-27 08:37:58'),(18,'Adams State College',39,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:58','2024-03-27 08:37:58'),(19,'Associated Mennonite Biblical Seminary',42,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:59','2024-03-27 08:37:59'),(20,'Antioch University McGregor',43,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:00','2024-03-27 08:38:00'),(21,'The University of the State of Alabama',46,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:01','2024-03-27 08:38:01'),(22,'The University of the State of Alabama',48,'Classical Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:01','2024-03-27 08:38:01'),(23,'Gateway Technical College',50,'Culture and Technology Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:02','2024-03-27 08:38:02'),(24,'Associated Mennonite Biblical Seminary',51,'Culture and Technology Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:02','2024-03-27 08:38:02'),(25,'Gateway Technical College',52,'Classical Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:03','2024-03-27 08:38:03'),(26,'The University of the State of Alabama',53,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:03','2024-03-27 08:38:03'),(27,'Antioch University McGregor',55,'Anthropology','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:04','2024-03-27 08:38:04'),(28,'Adams State College',56,'Culture and Technology Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:04','2024-03-27 08:38:04'),(29,'Antioch University McGregor',57,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:05','2024-03-27 08:38:05'),(30,'Antioch University McGregor',59,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:05','2024-03-27 08:38:05'),(31,'The University of the State of Alabama',60,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:06','2024-03-27 08:38:06'),(32,'American Institute of Health Technology',62,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:06','2024-03-27 08:38:06'),(33,'Associated Mennonite Biblical Seminary',64,'Classical Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:07','2024-03-27 08:38:07'),(34,'American Institute of Health Technology',65,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:08','2024-03-27 08:38:08'),(35,'Gateway Technical College',66,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:08','2024-03-27 08:38:08'),(36,'Antioch University McGregor',68,'Culture and Technology Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:09','2024-03-27 08:38:09'),(37,'Antioch University McGregor',69,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:09','2024-03-27 08:38:09'),(38,'Associated Mennonite Biblical Seminary',71,'Classical Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:10','2024-03-27 08:38:10'),(39,'American Institute of Health Technology',72,'Classical Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:10','2024-03-27 08:38:10'),(40,'Associated Mennonite Biblical Seminary',73,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:11','2024-03-27 08:38:11'),(41,'Antioch University McGregor',75,'Culture and Technology Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:12','2024-03-27 08:38:12'),(42,'Gateway Technical College',77,'Culture and Technology Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:13','2024-03-27 08:38:13'),(43,'Adams State College',79,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:14','2024-03-27 08:38:14'),(44,'Antioch University McGregor',80,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:14','2024-03-27 08:38:14'),(45,'Antioch University McGregor',82,'Economics','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:15','2024-03-27 08:38:15'),(46,'American Institute of Health Technology',85,'Anthropology','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:17','2024-03-27 08:38:17'),(47,'Adams State College',87,'Anthropology','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:17','2024-03-27 08:38:17'),(48,'Associated Mennonite Biblical Seminary',88,'Culture and Technology Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:18','2024-03-27 08:38:18'),(49,'American Institute of Health Technology',90,'Culture and Technology Studies','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:19','2024-03-27 08:38:19'),(50,'American Institute of Health Technology',92,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:20','2024-03-27 08:38:20'),(51,'Gateway Technical College',93,'Anthropology','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:20','2024-03-27 08:38:20'),(52,'American Institute of Health Technology',95,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:21','2024-03-27 08:38:21'),(53,'Gateway Technical College',96,'Art History','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:21','2024-03-27 08:38:21'),(54,'Associated Mennonite Biblical Seminary',99,'Anthropology','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:23','2024-03-27 08:38:23');
/*!40000 ALTER TABLE `jb_account_educations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_experiences`
--

DROP TABLE IF EXISTS `jb_account_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `company` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `started_at` date NOT NULL,
  `ended_at` date DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_experiences`
--

LOCK TABLES `jb_account_experiences` WRITE;
/*!40000 ALTER TABLE `jb_account_experiences` DISABLE KEYS */;
INSERT INTO `jb_account_experiences` VALUES (1,'GameDay Catering',2,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:45','2024-03-27 08:37:45'),(2,'Spa Paragon',7,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:46','2024-03-27 08:37:46'),(3,'Party Plex',8,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:47','2024-03-27 08:37:47'),(4,'Party Plex',9,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:47','2024-03-27 08:37:47'),(5,'Party Plex',10,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:47','2024-03-27 08:37:47'),(6,'Darwin Travel',13,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:49','2024-03-27 08:37:49'),(7,'Party Plex',16,'Web Designer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:50','2024-03-27 08:37:50'),(8,'Spa Paragon',19,'Web Designer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:51','2024-03-27 08:37:51'),(9,'Spa Paragon',20,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:52','2024-03-27 08:37:52'),(10,'Darwin Travel',21,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:52','2024-03-27 08:37:52'),(11,'Darwin Travel',24,'Web Designer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:53','2024-03-27 08:37:53'),(12,'Spa Paragon',28,'Marketing Coordinator','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:55','2024-03-27 08:37:55'),(13,'Spa Paragon',29,'Web Designer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:55','2024-03-27 08:37:55'),(14,'Darwin Travel',30,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:55','2024-03-27 08:37:55'),(15,'Spa Paragon',34,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:57','2024-03-27 08:37:57'),(16,'Spa Paragon',35,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:57','2024-03-27 08:37:57'),(17,'GameDay Catering',37,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:58','2024-03-27 08:37:58'),(18,'GameDay Catering',39,'Marketing Coordinator','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:58','2024-03-27 08:37:58'),(19,'Party Plex',42,'Web Designer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:37:59','2024-03-27 08:37:59'),(20,'Darwin Travel',43,'Web Designer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:00','2024-03-27 08:38:00'),(21,'Darwin Travel',46,'Web Designer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:01','2024-03-27 08:38:01'),(22,'Party Plex',48,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:01','2024-03-27 08:38:01'),(23,'Party Plex',50,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:02','2024-03-27 08:38:02'),(24,'Party Plex',51,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:02','2024-03-27 08:38:02'),(25,'Darwin Travel',52,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:03','2024-03-27 08:38:03'),(26,'Darwin Travel',53,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:03','2024-03-27 08:38:03'),(27,'Spa Paragon',55,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:04','2024-03-27 08:38:04'),(28,'Darwin Travel',56,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:04','2024-03-27 08:38:04'),(29,'GameDay Catering',57,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:05','2024-03-27 08:38:05'),(30,'Darwin Travel',59,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:05','2024-03-27 08:38:05'),(31,'GameDay Catering',60,'Web Designer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:06','2024-03-27 08:38:06'),(32,'Exploration Kids',62,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:06','2024-03-27 08:38:06'),(33,'Party Plex',64,'Web Designer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:07','2024-03-27 08:38:07'),(34,'Darwin Travel',65,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:08','2024-03-27 08:38:08'),(35,'GameDay Catering',66,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:08','2024-03-27 08:38:08'),(36,'Darwin Travel',68,'Marketing Coordinator','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:09','2024-03-27 08:38:09'),(37,'GameDay Catering',69,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:09','2024-03-27 08:38:09'),(38,'Darwin Travel',71,'Web Designer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:10','2024-03-27 08:38:10'),(39,'Party Plex',72,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:10','2024-03-27 08:38:10'),(40,'Darwin Travel',73,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:11','2024-03-27 08:38:11'),(41,'GameDay Catering',75,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:12','2024-03-27 08:38:12'),(42,'GameDay Catering',77,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:13','2024-03-27 08:38:13'),(43,'GameDay Catering',79,'President of Sales','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:14','2024-03-27 08:38:14'),(44,'Spa Paragon',80,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:14','2024-03-27 08:38:14'),(45,'Spa Paragon',82,'Marketing Coordinator','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:15','2024-03-27 08:38:15'),(46,'Exploration Kids',85,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:17','2024-03-27 08:38:17'),(47,'Darwin Travel',87,'Dog Trainer','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:17','2024-03-27 08:38:17'),(48,'GameDay Catering',88,'Marketing Coordinator','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:18','2024-03-27 08:38:18'),(49,'Darwin Travel',90,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:19','2024-03-27 08:38:19'),(50,'Exploration Kids',92,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:20','2024-03-27 08:38:20'),(51,'Spa Paragon',93,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:20','2024-03-27 08:38:20'),(52,'Darwin Travel',95,'Project Manager','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:21','2024-03-27 08:38:21'),(53,'GameDay Catering',96,'Marketing Coordinator','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:21','2024-03-27 08:38:21'),(54,'Party Plex',99,'Marketing Coordinator','2024-03-27','2024-03-27','There are many variations of passages of available, but the majority alteration in some form.\n                As a highly skilled and successful product development and design specialist with more than 4 Years of\n                My experience','2024-03-27 08:38:23','2024-03-27 08:38:23');
/*!40000 ALTER TABLE `jb_account_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_favorite_skills`
--

DROP TABLE IF EXISTS `jb_account_favorite_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_favorite_skills` (
  `skill_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`skill_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_favorite_skills`
--

LOCK TABLES `jb_account_favorite_skills` WRITE;
/*!40000 ALTER TABLE `jb_account_favorite_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_favorite_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_favorite_tags`
--

DROP TABLE IF EXISTS `jb_account_favorite_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_favorite_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`tag_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_favorite_tags`
--

LOCK TABLES `jb_account_favorite_tags` WRITE;
/*!40000 ALTER TABLE `jb_account_favorite_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_favorite_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_packages`
--

DROP TABLE IF EXISTS `jb_account_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_packages`
--

LOCK TABLES `jb_account_packages` WRITE;
/*!40000 ALTER TABLE `jb_account_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_account_password_resets`
--

DROP TABLE IF EXISTS `jb_account_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_account_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `jb_account_password_resets_email_index` (`email`),
  KEY `jb_account_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_account_password_resets`
--

LOCK TABLES `jb_account_password_resets` WRITE;
/*!40000 ALTER TABLE `jb_account_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_account_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_accounts`
--

DROP TABLE IF EXISTS `jb_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'job-seeker',
  `credits` int unsigned DEFAULT NULL,
  `resume` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` mediumtext COLLATE utf8mb4_unicode_ci,
  `is_public_profile` tinyint unsigned NOT NULL DEFAULT '0',
  `hide_cv` tinyint(1) NOT NULL DEFAULT '0',
  `views` bigint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `available_for_hiring` tinyint(1) NOT NULL DEFAULT '1',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `cover_letter` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_accounts_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_accounts`
--

LOCK TABLES `jb_accounts` WRITE;
/*!40000 ALTER TABLE `jb_accounts` DISABLE KEYS */;
INSERT INTO `jb_accounts` VALUES (1,'Victoria','Prohaska','Software Developer',NULL,'employer@archielite.com','$2y$12$.3vBrJNsMEyBSQzb7F7jVOZ4hcoMe8zBkOI.dpnYx1kIvpGvbaj8m',185,'2008-02-21','+12287655896','2024-03-27 15:37:44',NULL,'employer',NULL,NULL,'5430 April Forges\nHaleyhaven, VT 65525-7557','That your eye was as steady as ever; Yet you turned a corner, \'Oh my ears and the Dormouse shook its head impatiently, and walked a little girl she\'ll think me at home! Why, I wouldn\'t say anything.',1,0,2188,1,NULL,'2024-03-27 08:37:44','2024-03-27 08:37:44',1,1,NULL,NULL,NULL),(2,'Martin','Ritchie','Creative Designer',NULL,'job_seeker@archielite.com','$2y$12$m8kBAYXwEZ.uJs89E0Ach.gSWVAPpIiT7L4i319WDgXMAdH3oOIGS',184,'2012-02-17','+15715297641','2024-03-27 15:37:45',NULL,'job-seeker',NULL,'resume/01.pdf','878 Feest Islands\nEast Adrainhaven, MI 19301-6919','Hatter asked triumphantly. Alice did not answer, so Alice soon began talking again. \'Dinah\'ll miss me very much at this, she noticed that one of its voice. \'Back to land again, and looking at the.',1,0,4388,1,NULL,'2024-03-27 08:37:45','2024-03-27 08:37:45',0,1,NULL,NULL,NULL),(3,'Sarah','Harding','Creative Designer',NULL,'sarah_harding@archielite.com','$2y$12$l0HZSU94Zww.jgR6kAx5TuNi92eL4guNKpo.jkDlbXliBouF85Xlm',184,'2015-08-24','+12704985120','2024-03-27 15:37:45',NULL,'employer',NULL,NULL,'52633 Ayana Street\nLake Shanelle, HI 17529','Mock Turtle said: \'no wise fish would go anywhere without a great many more than three.\' \'Your hair wants cutting,\' said the Footman, \'and that for two reasons. First, because I\'m on the spot.\' This.',1,0,2773,0,NULL,'2024-03-27 08:37:45','2024-03-27 08:37:45',1,1,NULL,NULL,NULL),(4,'Steven','Jobs','Creative Designer',NULL,'steven_jobs@archielite.com','$2y$12$tqjay4ef.LzdwdjwJMWLvO6bhXghGmUs2Dwo57CsfyWX4u/NLXxyS',185,'2014-02-14','+19523332950','2024-03-27 15:37:45',NULL,'employer',NULL,NULL,'90978 Jamal Pines Apt. 747\nSouth Stephaniebury, DC 98494','Cheshire Cat,\' said Alice: \'I don\'t see,\' said the White Rabbit with pink eyes ran close by her. There was a bright idea came into Alice\'s shoulder as he could think of any one; so, when the White.',1,0,3541,1,NULL,'2024-03-27 08:37:45','2024-03-27 08:37:45',0,1,NULL,NULL,NULL),(5,'William','Kent','Creative Designer',NULL,'william_kent@archielite.com','$2y$12$RGCUa2KSWXcr9vgaBHUgY.3/tRRKJ77ENB3aUYzQSWXBreRrfQV76',186,'2001-06-08','+14046502211','2024-03-27 15:37:46',NULL,'employer',NULL,NULL,'267 Langosh Shores\nKuvalisview, WV 83236-7027','Tillie; and they lived at the Queen, the royal children, and everybody else. \'Leave off that!\' screamed the Pigeon. \'I\'m NOT a serpent, I tell you!\' said Alice. \'Why, you don\'t even know what.',1,0,3669,1,NULL,'2024-03-27 08:37:46','2024-03-27 08:37:46',0,1,NULL,NULL,NULL),(6,'Louvenia','Collins','CHORUS. \'Wow! wow!.',NULL,'enid27@yahoo.com','$2y$12$pQY9CaNOPcC5slA7U0.pte/Ixl7RG2kIz.gOk.jiHPQEo664TzSze',184,'1984-01-09','+12522927571','2024-03-27 15:37:46',NULL,'employer',NULL,NULL,'917 Wunsch Trail Suite 446\nVandervortchester, TX 51842-1399','Alice thought), and it was just in time to begin at HIS time of life. The King\'s argument was, that her neck kept getting entangled among the leaves, which she found she could not help bursting out.',1,0,723,0,NULL,'2024-03-27 08:37:46','2024-03-27 08:37:46',0,1,NULL,NULL,NULL),(7,'Cassie','Beer','White Rabbit read.',NULL,'erna.mann@ryan.com','$2y$12$C1gJY3JP9AvcbOxh6.MnWe2UZg.hsxUs.XsKmpQG7BBj3CrCT3vaG',186,'2020-12-18','+15707367922','2024-03-27 15:37:46',NULL,'job-seeker',NULL,'resume/01.pdf','8350 Domenic Parkway Apt. 407\nSouth Joesph, WI 66688-2930','Alice. \'Only a thimble,\' said Alice in a great deal to ME,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he said to herself; \'his eyes are so VERY remarkable in that; nor did Alice.',1,0,715,1,NULL,'2024-03-27 08:37:46','2024-03-27 08:37:46',0,1,NULL,NULL,NULL),(8,'Lenny','Kuhlman','Alice replied very.',NULL,'anais47@yahoo.com','$2y$12$otRDWByhj6Zh0nftv1V.7OTtxGOYq36prj7npuQc/wHNr6/coWfzG',184,'1993-11-21','+13018684684','2024-03-27 15:37:47',NULL,'job-seeker',NULL,'resume/01.pdf','794 Marlen Fort Apt. 268\nLenoraton, ME 84246-0917','However, on the slate. \'Herald, read the accusation!\' said the King said, turning to the Dormouse, and repeated her question. \'Why did you manage on the floor, as it can talk: at any rate he might.',1,0,2222,1,NULL,'2024-03-27 08:37:47','2024-03-27 08:37:47',0,1,NULL,NULL,NULL),(9,'Brock','McKenzie','Footman, \'and that.',NULL,'jayne.trantow@reichert.org','$2y$12$Fccy1qPFLN7gKOlcp4/XmuSZa/N6.Fcnp2YAXMzb8Gl23syJYqODi',186,'1978-02-28','+15029345257','2024-03-27 15:37:47',NULL,'job-seeker',NULL,'resume/01.pdf','92598 Cruickshank Drives\nIvahberg, NY 68777','Hatter. \'It isn\'t mine,\' said the Caterpillar took the hookah out of its mouth, and addressed her in an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' said Alice, seriously, \'I\'ll have.',1,0,339,1,NULL,'2024-03-27 08:37:47','2024-03-27 08:37:47',0,1,NULL,NULL,NULL),(10,'Jaquan','Kuhlman','I could not even.',NULL,'christian98@hotmail.com','$2y$12$TmilS1RX9ClfKr8CjstZjOdxKoYbf9m/OGdiql1y8EbA3QBaUbUha',186,'1978-08-08','+15599136493','2024-03-27 15:37:47',NULL,'job-seeker',NULL,'resume/01.pdf','7030 Cole Road\nPort Buster, SD 27044','I must have been a RED rose-tree, and we put a white one in by mistake; and if the Mock Turtle. \'And how did you begin?\' The Hatter was out of that is--\"Oh, \'tis love, that makes people.',1,0,3005,0,NULL,'2024-03-27 08:37:47','2024-03-27 08:37:47',1,1,NULL,NULL,NULL),(11,'Kareem','Kutch','Caterpillar; and.',NULL,'orn.teresa@gmail.com','$2y$12$t26eKqy7groEAzhgPzykUeryLUYpWagfyhCsi5tri/Vrk0VJ0QySS',184,'2013-01-28','+19362205862','2024-03-27 15:37:48',NULL,'employer',NULL,NULL,'4150 Alyson Stravenue Suite 729\nSouth Helena, NV 58129','Alice said; \'there\'s a large cauldron which seemed to be Involved in this way! Stop this moment, I tell you, you coward!\' and at last the Gryphon went on. \'Or would you like to drop the jar for fear.',1,0,2797,0,NULL,'2024-03-27 08:37:48','2024-03-27 08:37:48',1,1,NULL,NULL,NULL),(12,'Larry','Douglas','There was a large.',NULL,'theller@mckenzie.org','$2y$12$PkhcUviQz8S8VUat/ye.8O/Cd4bWyEQf3BDLsPSiM7rHl1bJ9YeBu',185,'2014-01-08','+17869901151','2024-03-27 15:37:48',NULL,'employer',NULL,NULL,'6503 Schneider Ferry Suite 527\nChasitybury, AR 31032','Alice looked all round her head. \'If I eat or drink anything; so I\'ll just see what I eat\" is the capital of Paris, and Paris is the reason they\'re called lessons,\' the Gryphon replied very.',1,0,955,0,NULL,'2024-03-27 08:37:48','2024-03-27 08:37:48',0,1,NULL,NULL,NULL),(13,'Jett','Kuvalis','Alice doubtfully.',NULL,'sarai47@hotmail.com','$2y$12$x/lpX2D4t5RK19HmjytPbOu8lwKuFo/fcGY6msQ9c71n9v0htzB4m',185,'2002-03-07','+16237808893','2024-03-27 15:37:49',NULL,'job-seeker',NULL,'resume/01.pdf','8998 Ankunding Ranch\nLake Julianatown, VA 67494','She said the Mock Turtle replied; \'and then the Rabbit\'s voice; and the others all joined in chorus, \'Yes, please do!\' but the Mouse with an important air, \'are you all ready? This is the same thing.',1,0,610,0,NULL,'2024-03-27 08:37:49','2024-03-27 08:37:49',1,1,NULL,NULL,NULL),(14,'Shania','Kuhlman','Queen, and Alice.',NULL,'ludie.buckridge@larson.com','$2y$12$pBWl3NWcEDbO0BRKp5hTPeNmRL6XVCTGIVR7CdojBVelECIwtIhRK',185,'2004-12-11','+17864105490','2024-03-27 15:37:49',NULL,'employer',NULL,NULL,'22004 Lueilwitz Alley\nHalvorsonbury, GA 99230-0033','I grow at a king,\' said Alice. \'Well, I can\'t see you?\' She was a little faster?\" said a timid voice at her for a little bottle on it, (\'which certainly was not a mile high,\' said Alice. \'Why, SHE,\'.',1,0,3009,1,NULL,'2024-03-27 08:37:49','2024-03-27 08:37:49',0,1,NULL,NULL,NULL),(15,'Cassie','Metz','How she longed to.',NULL,'verona.kozey@collins.com','$2y$12$sqAVdiZAsPS4Hadoc3cd7uCtbV8ffwnPMpcNnZKQUiEVPV6rQOx7K',186,'2023-06-21','+14083741300','2024-03-27 15:37:50',NULL,'employer',NULL,NULL,'71802 Miguel Shore Apt. 297\nMcDermottburgh, MA 81147','Hatter. \'It isn\'t a bird,\' Alice remarked. \'Right, as usual,\' said the King very decidedly, and he called the Queen, who had meanwhile been examining the roses. \'Off with his nose, and broke to.',1,0,3136,1,NULL,'2024-03-27 08:37:50','2024-03-27 08:37:50',0,1,NULL,NULL,NULL),(16,'Layla','Weissnat','I find a number of.',NULL,'justine.klein@goyette.com','$2y$12$qfu9mT.vZmnrBHS/SHfmg.Nztt6PZPgXoh1Kx086uvZvmD5/vhqdu',184,'1980-12-13','+19255586644','2024-03-27 15:37:50',NULL,'job-seeker',NULL,'resume/01.pdf','5494 Roberts Extensions\nSouth Layne, CT 40147','Alice, flinging the baby joined):-- \'Wow! wow! wow!\' \'Here! you may nurse it a little glass table. \'Now, I\'ll manage better this time,\' she said to a shriek, \'and just as if he wasn\'t one?\' Alice.',1,0,327,1,NULL,'2024-03-27 08:37:50','2024-03-27 08:37:50',1,1,NULL,NULL,NULL),(17,'Newell','Predovic','Alice again, for.',NULL,'brendon30@turner.com','$2y$12$fu9UTc.5c/Y7DGnHDopFau.XBfJSaK.IwMt9xocpl3Q9htTIwQY4W',186,'1982-03-16','+13522740063','2024-03-27 15:37:50',NULL,'employer',NULL,NULL,'3614 Pouros Alley Suite 831\nRatkeland, WV 09885-9719','King, \'or I\'ll have you executed, whether you\'re a little bird as soon as she tucked her arm affectionately into Alice\'s, and they repeated their arguments to her, And mentioned me to him: She gave.',1,0,4629,0,NULL,'2024-03-27 08:37:50','2024-03-27 08:37:50',1,1,NULL,NULL,NULL),(18,'Amir','Wuckert','King, \'and don\'t.',NULL,'osinski.garnet@emard.com','$2y$12$qGW/ixy1QHSpblZspWu6F..RS8abkiyT8ZJMZB.vOo1gnq..5rOee',184,'1985-03-23','+19896663629','2024-03-27 15:37:51',NULL,'employer',NULL,NULL,'1083 Deron Unions\nKristyburgh, LA 66004','RABBIT\' engraved upon it. She stretched herself up closer to Alice\'s great surprise, the Duchess\'s cook. She carried the pepper-box in her life, and had come back again, and said, very gravely, \'I.',1,0,1269,1,NULL,'2024-03-27 08:37:51','2024-03-27 08:37:51',0,1,NULL,NULL,NULL),(19,'Kristofer','Hermann','March--just before.',NULL,'linwood43@gmail.com','$2y$12$BNrMLMe4NqLV6dIeCJphxed2lGL7qOE5P2iy1/AJ7egwB7jP3RbZG',184,'1994-07-23','+14699391591','2024-03-27 15:37:51',NULL,'job-seeker',NULL,'resume/01.pdf','78426 Greenfelder Prairie Apt. 957\nEveretteview, HI 43461-9687','I\'d gone to see it quite plainly through the neighbouring pool--she could hear the rattle of the earth. Let me see: I\'ll give them a new idea to Alice, they all moved off, and Alice was thoroughly.',1,0,1716,1,NULL,'2024-03-27 08:37:51','2024-03-27 08:37:51',0,1,NULL,NULL,NULL),(20,'Asa','Breitenberg','I to do so. \'Shall.',NULL,'howell.kim@friesen.info','$2y$12$Mzgi6EIysL2m/7IKc6KzoOyj.VARLkYBJ6Xyp1TL/RkcqxqmUMUw.',186,'1972-07-18','+19342890815','2024-03-27 15:37:52',NULL,'job-seeker',NULL,'resume/01.pdf','311 Rath Forks\nNorth Lancechester, MN 01512-0019','Majesty!\' the soldiers had to stoop to save her neck from being run over; and the three gardeners, oblong and flat, with their hands and feet, to make SOME change in my life!\' Just as she could not.',1,0,4602,1,NULL,'2024-03-27 08:37:52','2024-03-27 08:37:52',1,1,NULL,NULL,NULL),(21,'Maxine','Lang','Coils.\' \'What was.',NULL,'toby35@crona.net','$2y$12$dV8J4Iu5gftWVcKWaOAw9eWsEaID0vUWDtdsSbp0QI1u8flqsKJ2.',184,'1992-12-27','+13253948000','2024-03-27 15:37:52',NULL,'job-seeker',NULL,'resume/01.pdf','9658 Terry Ville\nLake Waino, VA 29174-2349','And she kept tossing the baby at her feet, they seemed to be full of tears, until there was room for her. \'I wish the creatures wouldn\'t be so kind,\' Alice replied, so eagerly that the Queen never.',1,0,3930,1,NULL,'2024-03-27 08:37:52','2024-03-27 08:37:52',0,1,NULL,NULL,NULL),(22,'Samson','Runolfsson','Dormouse. \'Don\'t.',NULL,'purdy.rickie@hotmail.com','$2y$12$2f0L8GBXuLDRxuiaA2l3cOFZc53XbSaQwp5bltgLbER61FJmL4KWy',185,'2001-07-15','+13416929579','2024-03-27 15:37:52',NULL,'employer',NULL,NULL,'86250 Lubowitz Skyway Apt. 297\nZaneburgh, ND 55064-2488','March Hare and the two creatures got so much surprised, that for two Pennyworth only of beautiful Soup? Pennyworth only of beautiful Soup? Beau--ootiful Soo--oop! Beau--ootiful Soo--oop!.',1,0,4330,1,NULL,'2024-03-27 08:37:52','2024-03-27 08:37:52',0,1,NULL,NULL,NULL),(23,'Norene','Hagenes','Dinah, and saying.',NULL,'kling.eileen@gmail.com','$2y$12$ibDvT6doiI68k68aV2qEj.651Dl1/e2LtDf7grbiXWb5xF7skWwaC',185,'1997-10-27','+18067478735','2024-03-27 15:37:53',NULL,'employer',NULL,NULL,'62416 Medhurst Roads\nNew Garrison, CO 97016','Alice as she could not even get her head pressing against the door, she found herself falling down a large crowd collected round it: there were any tears. No, there were a Duck and a scroll of.',1,0,2139,1,NULL,'2024-03-27 08:37:53','2024-03-27 08:37:53',1,1,NULL,NULL,NULL),(24,'Aditya','Collier','March Hare said in.',NULL,'genevieve03@yahoo.com','$2y$12$MFYVhGG2gQLBGF4czqt7m.wCKFENIYBqq4BVJW8/IUb6k4m9z3E0a',185,'2009-05-24','+18629479020','2024-03-27 15:37:53',NULL,'job-seeker',NULL,'resume/01.pdf','4404 Clotilde Cove\nNew Larry, MD 10621','I am so VERY tired of swimming about here, O Mouse!\' (Alice thought this a good many voices all talking together: she made out that it was her turn or not. \'Oh, PLEASE mind what you\'re doing!\' cried.',1,0,1698,1,NULL,'2024-03-27 08:37:53','2024-03-27 08:37:53',1,1,NULL,NULL,NULL),(25,'Damian','VonRueden','Dormouse followed.',NULL,'wiza.jadon@hotmail.com','$2y$12$Rag9dontE765NbvszkJ08ODz9FNqlADspZQpRu8gWHVxl3bQzJ8ga',184,'1995-11-01','+19527622649','2024-03-27 15:37:53',NULL,'employer',NULL,NULL,'3221 Schinner Place Suite 526\nJavierchester, MD 32296','Dormouse was sitting on the stairs. Alice knew it was the only difficulty was, that you couldn\'t cut off a bit hurt, and she set off at once crowded round her once more, while the rest of the.',1,0,558,1,NULL,'2024-03-27 08:37:53','2024-03-27 08:37:53',1,1,NULL,NULL,NULL),(26,'Omari','Lebsack','Yet you finished.',NULL,'hammes.kim@hotmail.com','$2y$12$vTKoQW4WrbBnLRateECcDeiLBUzRXYc459HcwIgG4YD3vq1f6zL4G',186,'2006-11-11','+15615499280','2024-03-27 15:37:54',NULL,'employer',NULL,NULL,'624 Bernhard Street Apt. 689\nLake Coleman, ME 85113-8338','Caterpillar. Alice said nothing; she had hurt the poor little thing sat down a good way off, panting, with its legs hanging down, but generally, just as well. The twelve jurors were all locked; and.',1,0,2409,0,NULL,'2024-03-27 08:37:54','2024-03-27 08:37:54',1,1,NULL,NULL,NULL),(27,'Winston','Kuhn','Alice, so please.',NULL,'selena08@hotmail.com','$2y$12$YtCVcxWJDmSzzXh5xR0iv.i6uIkIhKTCPkFIt883Kz7dU8Kxotvbe',186,'1990-07-15','+13086308023','2024-03-27 15:37:54',NULL,'employer',NULL,NULL,'33233 Bobbie Valley Suite 646\nWest Valerie, NJ 30763-7954','There was a long sleep you\'ve had!\' \'Oh, I\'ve had such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret.',1,0,4050,0,NULL,'2024-03-27 08:37:54','2024-03-27 08:37:54',1,1,NULL,NULL,NULL),(28,'Sim','Steuber','Mouse\'s tail; \'but.',NULL,'xzieme@gmail.com','$2y$12$ZnoyOsOBXFRgvA/VYj6Oku9C8pra/y1HKDp6GpTPjcQGLV2A6RPAy',185,'1975-05-10','+16019661045','2024-03-27 15:37:55',NULL,'job-seeker',NULL,'resume/01.pdf','538 Sandy Island\nZionshire, OK 57393-7636','Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon interrupted in a melancholy tone: \'it doesn\'t seem to see how he can thoroughly enjoy The pepper when he sneezes; For.',1,0,3632,1,NULL,'2024-03-27 08:37:55','2024-03-27 08:37:55',1,1,NULL,NULL,NULL),(29,'Edythe','Cole','I\'m sure she\'s the.',NULL,'anissa20@gmail.com','$2y$12$v/iC/sFwpkUMUrLfPLosaei43.wT4y.pyR/EE/.Fc7fC22jwvngPS',185,'1988-10-11','+13414934221','2024-03-27 15:37:55',NULL,'job-seeker',NULL,'resume/01.pdf','8057 Heaney Mountain\nLake Myahside, WV 12337-6378','Hatter. \'I told you butter wouldn\'t suit the works!\' he added in an offended tone, \'so I should be like then?\' And she thought it would make with the edge with each hand. \'And now which is which?\'.',1,0,3184,0,NULL,'2024-03-27 08:37:55','2024-03-27 08:37:55',0,1,NULL,NULL,NULL),(30,'Dewayne','Swift','I\'ll eat it,\' said.',NULL,'skihn@gmail.com','$2y$12$4JJlNY73oi59SiyyS4XIhuNMTdLsdeJvvs6Lr6144McZWMwM8Rz56',184,'1979-08-31','+12184044767','2024-03-27 15:37:55',NULL,'job-seeker',NULL,'resume/01.pdf','4860 Antoinette Canyon\nWillville, WY 84761','Alice heard the Rabbit noticed Alice, as she stood still where she was, and waited. When the pie was all dark overhead; before her was another long passage, and the moon, and memory, and.',1,0,4066,1,NULL,'2024-03-27 08:37:55','2024-03-27 08:37:55',1,1,NULL,NULL,NULL),(31,'Renee','Nader','YOU manage?\' Alice.',NULL,'walter.earline@dickens.biz','$2y$12$qcqqrVdZgH0EsaoOqGBatuTG40RaaJjSXMIuiYJIrMhenkwT2Ud5e',185,'2001-03-14','+19525951140','2024-03-27 15:37:56',NULL,'employer',NULL,NULL,'657 Kuphal Mews\nNorth Scotland, MI 90854','His voice has a timid voice at her for a few yards off. The Cat seemed to follow, except a tiny golden key, and unlocking the door and found quite a long sleep you\'ve had!\' \'Oh, I\'ve had such a.',1,0,598,1,NULL,'2024-03-27 08:37:56','2024-03-27 08:37:56',0,1,NULL,NULL,NULL),(32,'Franco','Bernhard','Pat, what\'s that.',NULL,'vkihn@yahoo.com','$2y$12$WG6sylsY.OA5qUhZ/79ilOf6E.daiWy36uV0/RSgj9DioBymWQgLi',184,'2022-03-14','+19283048868','2024-03-27 15:37:56',NULL,'employer',NULL,NULL,'69051 Elizabeth Via\nLeonorahaven, CT 51083','Alice\'s first thought was that she had not long to doubt, for the next witness!\' said the last concert!\' on which the words \'DRINK ME\' beautifully printed on it but tea. \'I don\'t think--\' \'Then you.',1,0,3918,1,NULL,'2024-03-27 08:37:56','2024-03-27 08:37:56',1,1,NULL,NULL,NULL),(33,'Lucy','Macejkovic','Queen had ordered.',NULL,'heathcote.myrtie@yahoo.com','$2y$12$uYNJBctsnx8ZJ0ZqU65U4.Pxhp7rz7nYyfyek3h756l/Jmuc5Et6i',186,'1995-02-24','+17546328739','2024-03-27 15:37:56',NULL,'employer',NULL,NULL,'623 Streich Cliffs Suite 043\nPort Cullen, AK 05690','Gryphon. \'Then, you know,\' said the King. On this the whole thing very absurd, but they all crowded round it, panting, and asking, \'But who has won?\' This question the Dodo said, \'EVERYBODY has won.',1,0,3736,1,NULL,'2024-03-27 08:37:56','2024-03-27 08:37:56',1,1,NULL,NULL,NULL),(34,'Jamar','Rau','Gryphon. \'How the.',NULL,'zella.bechtelar@mcdermott.com','$2y$12$GMMF8eQ8/pj4cq4ynsIRlO.hReUm0auYvb1bNELcYuKlYzhrUJLbC',185,'1992-04-15','+19405612175','2024-03-27 15:37:57',NULL,'job-seeker',NULL,'resume/01.pdf','652 Elnora Route\nEast Malliefort, DE 49091-7094','Mock Turtle repeated thoughtfully. \'I should like to go down the chimney, has he?\' said Alice sharply, for she thought, \'till its ears have come, or at any rate, there\'s no room at all a pity. I.',1,0,1916,1,NULL,'2024-03-27 08:37:57','2024-03-27 08:37:57',1,1,NULL,NULL,NULL),(35,'Dora','Swift','Duchess. \'I make.',NULL,'dortha.wolff@wisozk.com','$2y$12$7g8Og1CnHrT9OTSwLKBBZuuhfiNwd4.qtT.uZuP19p71aSI0DeEwy',186,'1997-02-11','+19715535459','2024-03-27 15:37:57',NULL,'job-seeker',NULL,'resume/01.pdf','734 Weimann Meadow Apt. 517\nToystad, AZ 63692','WHAT things?\' said the youth, \'one would hardly suppose That your eye was as much as she said this, she came suddenly upon an open place, with a little snappishly. \'You\'re enough to look about her.',1,0,3909,0,NULL,'2024-03-27 08:37:57','2024-03-27 08:37:57',0,1,NULL,NULL,NULL),(36,'Hermann','O\'Kon','Mock Turtle yawned.',NULL,'luna84@weissnat.com','$2y$12$UoMdkCzP80h5gXy4hDzFR.xV7u3vkp8K26kJ4BqhPJrQG7ng4R3tW',185,'1997-01-15','+13029209967','2024-03-27 15:37:57',NULL,'employer',NULL,NULL,'9064 Rafaela Branch\nLubowitzside, NJ 22775','Hatter went on, half to Alice. \'What sort of way, \'Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, as they used to it as you are; secondly, because they\'re making such a fall as.',1,0,3170,0,NULL,'2024-03-27 08:37:57','2024-03-27 08:37:57',1,1,NULL,NULL,NULL),(37,'Easter','Crona','Cat, as soon as it.',NULL,'amelie.parisian@gmail.com','$2y$12$HWH4XYB6GTE8gMVNbJRs6OEMhfA1PsMwFbsYlv6Hlyg8DI9H73kxm',186,'1981-10-07','+16269325933','2024-03-27 15:37:58',NULL,'job-seeker',NULL,'resume/01.pdf','39199 Calista Wells Suite 638\nEulaview, VT 50141-0093','Alice sadly. \'Hand it over here,\' said the March Hare. \'He denies it,\' said the March Hare interrupted in a minute or two, they began running about in the wood,\' continued the King. \'When did you.',1,0,4426,0,NULL,'2024-03-27 08:37:58','2024-03-27 08:37:58',0,1,NULL,NULL,NULL),(38,'Douglas','Batz','King put on your.',NULL,'awitting@gmail.com','$2y$12$cUe1reXaZOTVqE41p36QXuvo3I.jb/vwmofB5N8/G6CNTQeFsxpa2',185,'2000-05-06','+15206004433','2024-03-27 15:37:58',NULL,'employer',NULL,NULL,'156 Collins Creek\nRodriguezport, KS 65111','A Caucus-Race and a sad tale!\' said the Queen. \'I haven\'t opened it yet,\' said the King. \'Then it doesn\'t understand English,\' thought Alice; but she thought it had been, it suddenly appeared again.',1,0,401,0,NULL,'2024-03-27 08:37:58','2024-03-27 08:37:58',0,1,NULL,NULL,NULL),(39,'Halie','Jast','Mouse, do you know.',NULL,'pchamplin@beatty.com','$2y$12$EQ85KmtEufAm7jYxvhLZseICY7G7kd9WnWRGQbvF0LStJmFPTY9Ha',186,'1999-08-15','+15614410522','2024-03-27 15:37:58',NULL,'job-seeker',NULL,'resume/01.pdf','19410 Kuhlman Isle Suite 098\nWest Ofelia, NH 33970-1762','Caterpillar. Alice folded her hands, and began:-- \'You are all pardoned.\' \'Come, THAT\'S a good deal worse off than before, as the jury asked. \'That I can\'t put it in her pocket, and pulled out a.',1,0,2827,0,NULL,'2024-03-27 08:37:58','2024-03-27 08:37:58',1,1,NULL,NULL,NULL),(40,'Ora','Adams','Alice, \'it would.',NULL,'padberg.ludie@yahoo.com','$2y$12$5jsBgfExk7j6jgH7yw./IummPWhDic3HZQNV6wrtcFlprTUNTQUfe',186,'1980-11-25','+17187919642','2024-03-27 15:37:59',NULL,'employer',NULL,NULL,'820 Vivian Freeway Suite 950\nElianhaven, SD 96825','King, \'and don\'t be nervous, or I\'ll have you executed, whether you\'re a little sharp bark just over her head through the neighbouring pool--she could hear him sighing as if he doesn\'t begin.\' But.',1,0,484,1,NULL,'2024-03-27 08:37:59','2024-03-27 08:37:59',0,1,NULL,NULL,NULL),(41,'Reba','Reinger','By the time at the.',NULL,'ward55@swift.net','$2y$12$0BJn/jPH5Rlcgq0LLzUaUujbP7YYFEGxo9x3bMc6vsef3O.0hN2hW',185,'1988-09-04','+13617173599','2024-03-27 15:37:59',NULL,'employer',NULL,NULL,'27293 Ricardo Locks\nNorth Rowanshire, FL 38667-2938','Pray, what is the driest thing I ask! It\'s always six o\'clock now.\' A bright idea came into Alice\'s shoulder as she could, for her to wink with one elbow against the door, she ran out of sight.',1,0,2195,1,NULL,'2024-03-27 08:37:59','2024-03-27 08:37:59',0,1,NULL,NULL,NULL),(42,'Candelario','Feest','The Hatter was out.',NULL,'beer.melyna@hotmail.com','$2y$12$CHTAbkZv.psSn5HRmvFnH.NKT1PpBYq9xa9btiKdKDNabAkuSuMwS',185,'1983-10-18','+13038181731','2024-03-27 15:37:59',NULL,'job-seeker',NULL,'resume/01.pdf','1610 Hortense Row Apt. 647\nNew Samaratown, RI 04070-2810','Mystery,\' the Mock Turtle. \'She can\'t explain MYSELF, I\'m afraid, sir\' said Alice, surprised at this, she looked up, but it makes me grow larger, I can listen all day about it!\' Last came a rumbling.',1,0,1654,0,NULL,'2024-03-27 08:37:59','2024-03-27 08:37:59',1,1,NULL,NULL,NULL),(43,'Domingo','Jakubowski','Serpent!\' \'But I\'m.',NULL,'quinn.jones@hotmail.com','$2y$12$OSfi/vh/xfthpfa6wguDuucD5rV4nnW1.607WOUOXRGN6pQdYrlbe',186,'1970-06-07','+16153560017','2024-03-27 15:38:00',NULL,'job-seeker',NULL,'resume/01.pdf','27373 Funk Prairie\nJuniorhaven, IA 65921','CHAPTER IX. The Mock Turtle went on. \'I do,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course was, how to get through was more hopeless than ever: she sat down in an.',1,0,4700,1,NULL,'2024-03-27 08:38:00','2024-03-27 08:38:00',1,1,NULL,NULL,NULL),(44,'Amira','Davis','The great question.',NULL,'sanford.kira@yahoo.com','$2y$12$b030eBP1X3P/tFVDkrm9QuvsvdR7VRpqDZO5RwtGqOzyyyj/F7weS',185,'1999-12-09','+14138552972','2024-03-27 15:38:00',NULL,'employer',NULL,NULL,'1636 Weissnat Lane\nNorth Bryana, TN 87859-7924','The question is, what?\' The great question is, what?\' The great question is, what did the Dormouse turned out, and, by the prisoner to--to somebody.\' \'It must be getting somewhere near the entrance.',1,0,4500,0,NULL,'2024-03-27 08:38:00','2024-03-27 08:38:00',1,1,NULL,NULL,NULL),(45,'Marcus','Aufderhar','Eaglet. \'I don\'t.',NULL,'rudolph67@yahoo.com','$2y$12$Hh98UMjUuoYoxir6e0Vngu6X0i.v9V5rrSsShuEwGUaV4WOHhaHaC',185,'2012-11-13','+18594349184','2024-03-27 15:38:00',NULL,'employer',NULL,NULL,'16296 Gaston Fork\nEast Glenna, CT 54686','The moment Alice appeared, she was now the right way to explain it is you hate--C and D,\' she added in a sort of present!\' thought Alice. The King turned pale, and shut his note-book hastily.',1,0,2783,1,NULL,'2024-03-27 08:38:00','2024-03-27 08:38:00',1,1,NULL,NULL,NULL),(46,'Doyle','Torp','The moment Alice.',NULL,'wisoky.alayna@gmail.com','$2y$12$rbTsoVXBVwmrEPjnM5FGA.Mi2rC45M7.91jJBocAM.ErpDyzv7r7q',185,'2010-11-06','+16575519447','2024-03-27 15:38:01',NULL,'job-seeker',NULL,'resume/01.pdf','4375 Mueller Trafficway Apt. 841\nCorwinfort, KY 75931-2300','Footman remarked, \'till tomorrow--\' At this moment the door and went by without noticing her. Then followed the Knave \'Turn them over!\' The Knave of Hearts, she made some tarts, All on a little.',1,0,4386,0,NULL,'2024-03-27 08:38:01','2024-03-27 08:38:01',1,1,NULL,NULL,NULL),(47,'Lawson','Reichel','The Mouse did not.',NULL,'sheaney@ondricka.info','$2y$12$cuevNM7ZgUNcqptByF1RH.ZcZAo4EkvS7OcjhMfLi/XkX9wRvVZsS',185,'2004-03-16','+13139268970','2024-03-27 15:38:01',NULL,'employer',NULL,NULL,'5908 Raul Fields\nMarjorietown, NV 08454','Gryphon, \'she wants for to know when the tide rises and sharks are around, His voice has a timid voice at her feet, for it to half-past one as long as there was a table, with a soldier on each side.',1,0,919,1,NULL,'2024-03-27 08:38:01','2024-03-27 08:38:01',1,1,NULL,NULL,NULL),(48,'Kody','Bradtke','So she tucked her.',NULL,'slesch@schamberger.com','$2y$12$6yM1h4ICf6xjr07Ul3TEsOQQHsUoXLH83g/PmISfY16qLRdcwVykS',186,'2012-10-02','+19193494853','2024-03-27 15:38:01',NULL,'job-seeker',NULL,'resume/01.pdf','83421 Jeromy Underpass\nLake Ismaelmouth, ND 46526','White Rabbit, who said in a large piece out of it, and they lived at the proposal. \'Then the eleventh day must have been changed several times since then.\' \'What do you want to go! Let me see: that.',1,0,1809,1,NULL,'2024-03-27 08:38:01','2024-03-27 08:38:01',0,1,NULL,NULL,NULL),(49,'Dana','Bergnaum','There was a table.',NULL,'katelin58@yahoo.com','$2y$12$7cDCml6IQPOa6d4ITNPlpuJTfIerkoFcnnZyP8Fg4yVWArypOBl2u',186,'2016-11-12','+15413027295','2024-03-27 15:38:02',NULL,'employer',NULL,NULL,'9925 Nicolas Isle Suite 303\nKonopelskiland, AK 88490-8932','Queen of Hearts, and I had not a bit hurt, and she went in search of her little sister\'s dream. The long grass rustled at her rather inquisitively, and seemed not to be a person of authority among.',1,0,4146,0,NULL,'2024-03-27 08:38:02','2024-03-27 08:38:02',1,1,NULL,NULL,NULL),(50,'Ava','Dare','Mock Turtle; \'but.',NULL,'bosco.irving@hotmail.com','$2y$12$lvQSecH6cL3A5xGTtCR2MeNj7.8AcUX9Ym3bH7Si2BiYPZ6EYxl2C',185,'1980-08-31','+14178842791','2024-03-27 15:38:02',NULL,'job-seeker',NULL,'resume/01.pdf','89724 Zboncak Rapid\nKristofermouth, TX 18089-5129','Alice began to tremble. Alice looked all round her once more, while the rest waited in silence. At last the Mouse, who seemed ready to play with, and oh! ever so many different sizes in a tone of.',1,0,4320,0,NULL,'2024-03-27 08:38:02','2024-03-27 08:38:02',0,1,NULL,NULL,NULL),(51,'Gideon','Turner','Alice, and, after.',NULL,'russel.rodger@sauer.com','$2y$12$1n2X/UXVt.MX0bQgqag2UuoMCGkvmMk28BQ6xkFJz4kSrCdlXF3UO',185,'1986-08-31','+14585705423','2024-03-27 15:38:02',NULL,'job-seeker',NULL,'resume/01.pdf','3284 Lesch Underpass\nSouth Nicolette, KY 88108','Only I don\'t like them raw.\' \'Well, be off, then!\' said the Mock Turtle. Alice was very likely to eat her up in a low curtain she had never forgotten that, if you cut your finger VERY deeply with a.',1,0,2710,0,NULL,'2024-03-27 08:38:02','2024-03-27 08:38:02',1,1,NULL,NULL,NULL),(52,'Sonya','Will','Alice replied very.',NULL,'ledner.jessyca@berge.com','$2y$12$rzGAd9E56d0j/fPZYeZC5.Z6GDrfBBfpaMKqrZ50YiV/KNiBcvJoC',185,'1992-09-25','+19285051187','2024-03-27 15:38:03',NULL,'job-seeker',NULL,'resume/01.pdf','232 Crona Union\nJorgebury, SD 35530-2004','Queen. First came ten soldiers carrying clubs; these were all turning into little cakes as they lay on the top of his teacup instead of the window, and some of the deepest contempt. \'I\'ve seen a.',1,0,3357,0,NULL,'2024-03-27 08:38:03','2024-03-27 08:38:03',0,1,NULL,NULL,NULL),(53,'Bret','Mueller','I think?\' he said.',NULL,'mhamill@hotmail.com','$2y$12$F9ey/uKP.iTCBfldGpciOuvv9ZWxGEb8ENmFdtdj6.ZE4QbjBOIdq',186,'2002-05-14','+12023154356','2024-03-27 15:38:03',NULL,'job-seeker',NULL,'resume/01.pdf','905 Isaiah Canyon Apt. 342\nWest Laynefurt, IA 54744-7606','Alice called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came back again. \'Keep your temper,\' said the Hatter: \'I\'m on the bank--the birds with.',1,0,4738,1,NULL,'2024-03-27 08:38:03','2024-03-27 08:38:03',1,1,NULL,NULL,NULL),(54,'Godfrey','Aufderhar','Alice caught the.',NULL,'donnelly.isadore@mclaughlin.net','$2y$12$h4o20dx4Sc4SoTDD2Zopje5vuiw0yDyE4rjjW2ro6NVXE/CpzdX1W',185,'2005-03-31','+15315584888','2024-03-27 15:38:04',NULL,'employer',NULL,NULL,'78339 Jaunita Mission\nPaucekville, MD 24159','Alice, \'it\'s very interesting. I never heard of such a tiny golden key, and when she was in confusion, getting the Dormouse fell asleep instantly, and Alice looked at the bottom of a feather flock.',1,0,1718,0,NULL,'2024-03-27 08:38:04','2024-03-27 08:38:04',1,1,NULL,NULL,NULL),(55,'Lavada','Hamill','Mock Turtle. \'Hold.',NULL,'elmer32@leannon.com','$2y$12$m6htxpVWcZ2wuYQFPC5pA.QPXpTl6gVbJcSBTe45.pvbr3WcCs9ou',184,'1990-12-19','+13209681656','2024-03-27 15:38:04',NULL,'job-seeker',NULL,'resume/01.pdf','836 Armstrong Squares\nLake Ressie, WY 59025-6633','But said I didn\'t!\' interrupted Alice. \'You must be,\' said the March Hare moved into the way wherever she wanted to send the hedgehog to, and, as she could not think of any that do,\' Alice said.',1,0,3270,1,NULL,'2024-03-27 08:38:04','2024-03-27 08:38:04',1,1,NULL,NULL,NULL),(56,'Dallin','Quigley','I am very tired of.',NULL,'ystroman@hotmail.com','$2y$12$oMiTg4I4pDivX.yGjPS5TunQZzmvZ1s3M4Leq1Loo/7sTGAtfiz/e',184,'1995-03-20','+18284369597','2024-03-27 15:38:04',NULL,'job-seeker',NULL,'resume/01.pdf','8381 Jillian Bypass\nZoraview, AK 22859-0664','Alice, and looking anxiously about her. \'Oh, do let me hear the very middle of the court. \'What do you want to go! Let me see: I\'ll give them a railway station.) However, she soon made out what it.',1,0,3478,0,NULL,'2024-03-27 08:38:04','2024-03-27 08:38:04',1,1,NULL,NULL,NULL),(57,'Evert','Zemlak','White Rabbit was.',NULL,'bsteuber@gmail.com','$2y$12$mI7HX7xqd9MIU2VSrLdM/.eNfk/o7tt1.kurzXHx9ldI43Ktta9XS',186,'2010-06-14','+19519437718','2024-03-27 15:38:05',NULL,'job-seeker',NULL,'resume/01.pdf','53231 Nitzsche Drive\nCartwrightland, CA 87815-3951','Morcar, the earls of Mercia and Northumbria--\"\' \'Ugh!\' said the Gryphon. \'Turn a somersault in the back. At last the Mouse, who was passing at the beginning,\' the King had said that day. \'That.',1,0,4900,1,NULL,'2024-03-27 08:38:05','2024-03-27 08:38:05',0,1,NULL,NULL,NULL),(58,'Minerva','Nolan','The Queen turned.',NULL,'eauer@stracke.com','$2y$12$jv.E3yX1NOgzbGgHapgw4u3/GYqSAPsiTisSaZGz5NPSRcJJsu/9K',185,'1987-07-01','+17726441410','2024-03-27 15:38:05',NULL,'employer',NULL,NULL,'2362 Waelchi Stravenue\nWest Myronside, IL 39936-2492','Shakespeare, in the newspapers, at the bottom of a large crowd collected round it: there were no tears. \'If you\'re going to begin with,\' the Mock Turtle, \'but if they do, why then they\'re a kind of.',1,0,1532,0,NULL,'2024-03-27 08:38:05','2024-03-27 08:38:05',0,1,NULL,NULL,NULL),(59,'Fanny','Reinger','She generally gave.',NULL,'micah16@yahoo.com','$2y$12$Kah58N69r2oIr3Cy4w.EFe31e3CG7agvdvorw7YtEytMgg8fl1STS',184,'2000-10-27','+12254299478','2024-03-27 15:38:05',NULL,'job-seeker',NULL,'resume/01.pdf','46702 Eloy Course\nSouth Reedville, TN 09638-0851','White Rabbit, who said in a low voice, \'Why the fact is, you know. But do cats eat bats? Do cats eat bats, I wonder?\' And here poor Alice began telling them her adventures from the sky! Ugh.',1,0,648,0,NULL,'2024-03-27 08:38:05','2024-03-27 08:38:05',0,1,NULL,NULL,NULL),(60,'Kameron','Ritchie','Then followed the.',NULL,'vmills@yahoo.com','$2y$12$k9SJppU//x9/6LAa3sDHP.pH9i1kE7v2cWEzZl94OCFYWmd6lAo9C',186,'1992-01-29','+15208453127','2024-03-27 15:38:06',NULL,'job-seeker',NULL,'resume/01.pdf','61538 Zackery Ridges Suite 595\nSouth Queenie, ND 13991','I was a little shriek, and went on eagerly. \'That\'s enough about lessons,\' the Gryphon went on. \'I do,\' Alice hastily replied; \'at least--at least I know is, something comes at me like that!\' But.',1,0,891,1,NULL,'2024-03-27 08:38:06','2024-03-27 08:38:06',1,1,NULL,NULL,NULL),(61,'Jamie','Effertz','And then, turning.',NULL,'chance.baumbach@rice.com','$2y$12$r1IeywyiXyXfGX0nNM.oiu82zQTzBpvAswL0EzvqQubCbpNla0oU.',186,'2007-10-18','+19063629436','2024-03-27 15:38:06',NULL,'employer',NULL,NULL,'40520 Braden Corners Suite 750\nAdrianaview, VT 58309','She took down a very good advice, (though she very good-naturedly began hunting about for them, and was surprised to see you again, you dear old thing!\' said the Queen, and Alice, were in custody.',1,0,3990,0,NULL,'2024-03-27 08:38:06','2024-03-27 08:38:06',0,1,NULL,NULL,NULL),(62,'Dana','Gutkowski','Alice began in a.',NULL,'madaline.lockman@hotmail.com','$2y$12$4LeYcoXxbatPgs7tcy1pW.xY9GzGgw0BJHnBkl3PrThrRqAP55MXu',184,'2014-03-30','+15208287180','2024-03-27 15:38:06',NULL,'job-seeker',NULL,'resume/01.pdf','7712 Germaine Plains Suite 729\nDoylestad, FL 75995-3930','Let me see: four times five is twelve, and four times five is twelve, and four times five is twelve, and four times five is twelve, and four times seven is--oh dear! I shall be punished for it was.',1,0,1771,1,NULL,'2024-03-27 08:38:06','2024-03-27 08:38:06',1,1,NULL,NULL,NULL),(63,'Damien','Parker','Mary Ann, what ARE.',NULL,'janet.lebsack@cartwright.com','$2y$12$DVpgqIjxLlZ5Z7a.JVIur.h9z7Ic0xLxF6qWwMITk1q1O4rpGpm8G',185,'2020-05-05','+16058067950','2024-03-27 15:38:07',NULL,'employer',NULL,NULL,'4795 Schowalter Courts\nZiemebury, ID 06770','March Hare. Alice sighed wearily. \'I think you could keep it to annoy, Because he knows it teases.\' CHORUS. (In which the cook was busily stirring the soup, and seemed to be executed for having.',1,0,4065,0,NULL,'2024-03-27 08:38:07','2024-03-27 08:38:07',1,1,NULL,NULL,NULL),(64,'Fern','Thompson','I to get through.',NULL,'uaufderhar@dare.org','$2y$12$leDDI2K0I8wsdlnmgy7aIued56bSYjVXRBGK8ku/KzlJPSpHBd0xy',186,'1983-06-30','+16508616341','2024-03-27 15:38:07',NULL,'job-seeker',NULL,'resume/01.pdf','1472 Yessenia Lodge Apt. 946\nSouth Gretchen, AL 50398','Shakespeare, in the morning, just time to be seen: she found her way out. \'I shall sit here,\' he said, turning to Alice: he had a bone in his turn; and both the hedgehogs were out of sight; and an.',1,0,4642,1,NULL,'2024-03-27 08:38:07','2024-03-27 08:38:07',1,1,NULL,NULL,NULL),(65,'Sabina','Johnston','Then followed the.',NULL,'alowe@hotmail.com','$2y$12$upi6USc1Ts4CdI1Zfcz9Iu0IHsJwzPe1jrBl21sqL12JepHoGDvDG',184,'2012-07-25','+16806999529','2024-03-27 15:38:08',NULL,'job-seeker',NULL,'resume/01.pdf','7380 Ernestina Bridge Apt. 928\nNew Ezekielfort, RI 81069','Who Stole the Tarts? The King looked anxiously at the March Hare went \'Sh! sh!\' and the jury asked. \'That I can\'t understand it myself to begin lessons: you\'d only have to ask them what the flame of.',1,0,780,1,NULL,'2024-03-27 08:38:08','2024-03-27 08:38:08',1,1,NULL,NULL,NULL),(66,'Geovanni','Adams','Everything is so.',NULL,'hyatt.deron@yahoo.com','$2y$12$fj9SmCq.hyPT0f4sfLSQMunobzy3opialnCOnLZXTZ.wiP0KMny36',185,'2017-01-08','+16233125145','2024-03-27 15:38:08',NULL,'job-seeker',NULL,'resume/01.pdf','38721 Linnea Motorway\nLake Destinhaven, NV 36448','King, \'that only makes the world you fly, Like a tea-tray in the air. This time there could be no sort of present!\' thought Alice. The King looked anxiously over his shoulder as she could, \'If you.',1,0,3149,0,NULL,'2024-03-27 08:38:08','2024-03-27 08:38:08',0,1,NULL,NULL,NULL),(67,'Hollie','Ondricka','Majesty,\' said the.',NULL,'fmorissette@gmail.com','$2y$12$FGr6Yb.IScYokC/2GguObOL4QsZrvYurI2dUy1MKGJ.RcU8fba9Pu',185,'2014-11-01','+15718951913','2024-03-27 15:38:08',NULL,'employer',NULL,NULL,'77859 Chaya Manor\nMajormouth, AR 58716-0525','King. Here one of the day; and this time the Mouse had changed his mind, and was just in time to begin with; and being ordered about in all their simple joys, remembering her own ears for having.',1,0,1625,1,NULL,'2024-03-27 08:38:08','2024-03-27 08:38:08',1,1,NULL,NULL,NULL),(68,'Marianne','Schuster','Alice went timidly.',NULL,'darby.walsh@gmail.com','$2y$12$X5oixm2gVs48W2HZEH/rVOW3tSrh7nb5Dx2an3VJkmFDGkjZmgcIK',185,'1991-06-15','+12529151270','2024-03-27 15:38:09',NULL,'job-seeker',NULL,'resume/01.pdf','307 Arielle Lane Suite 892\nWest Clotilde, VT 16381','Very soon the Rabbit angrily. \'Here! Come and help me out of sight, he said to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I can\'t put it to speak good English); \'now I\'m.',1,0,1847,0,NULL,'2024-03-27 08:38:09','2024-03-27 08:38:09',1,1,NULL,NULL,NULL),(69,'Emil','Daniel','As for pulling me.',NULL,'rebekah.hoeger@yahoo.com','$2y$12$OhFwavDa5OlvNTsF8Ggcl.6Elez/fRz2wobQXlyY0DFxPrlJ7U2a.',185,'1984-09-13','+15207085886','2024-03-27 15:38:09',NULL,'job-seeker',NULL,'resume/01.pdf','786 Gladys Village Apt. 689\nTrystanville, NV 71104-1277','For anything tougher than suet; Yet you finished the goose, with the day and night! You see the earth takes twenty-four hours to turn round on its axis--\' \'Talking of axes,\' said the King said, with.',1,0,3213,1,NULL,'2024-03-27 08:38:09','2024-03-27 08:38:09',1,1,NULL,NULL,NULL),(70,'Earnest','Nikolaus','Hatter continued.',NULL,'lbailey@volkman.com','$2y$12$/iV39Qcz6aVmTZoBsF2jTOxIjeIFID05rpMU30ONg2ZHSixogICKq',185,'1997-08-02','+19796462563','2024-03-27 15:38:10',NULL,'employer',NULL,NULL,'299 Enoch Lakes Apt. 480\nEast Bridgettehaven, KS 52619','She was walking by the whole party swam to the jury, in a few minutes she heard it before,\' said the Duchess; \'and that\'s a fact.\' Alice did not at all for any lesson-books!\' And so she bore it as.',1,0,4101,1,NULL,'2024-03-27 08:38:10','2024-03-27 08:38:10',1,1,NULL,NULL,NULL),(71,'Delphine','Kessler','Knave, \'I didn\'t.',NULL,'aeffertz@koch.com','$2y$12$Yi0/kDo9PC85eV93kyfbd.Fduosapgq2nbo8ipxp30MBr0QFo8xGK',184,'1994-03-22','+15055083660','2024-03-27 15:38:10',NULL,'job-seeker',NULL,'resume/01.pdf','57642 Cristina Lights\nConorside, MT 31951','This was quite pleased to find it out, we should all have our heads cut off, you know. So you see, because some of the ground.\' So she stood still where she was, and waited. When the pie was all.',1,0,4583,1,NULL,'2024-03-27 08:38:10','2024-03-27 08:38:10',0,1,NULL,NULL,NULL),(72,'Teresa','Muller','Alice replied very.',NULL,'rice.adele@yahoo.com','$2y$12$oEvY6dDqx1.kcdaJx2a7Xuj7rdvG0eAauUX5sZmzxpsdVrDoM0GHa',185,'2021-06-30','+13514885370','2024-03-27 15:38:10',NULL,'job-seeker',NULL,'resume/01.pdf','19722 Elian Falls Suite 047\nPort Marianoborough, MT 17902-8838','I only wish they WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she would feel very uneasy: to be a grin, and she hastily dried her eyes to see if.',1,0,3825,1,NULL,'2024-03-27 08:38:10','2024-03-27 08:38:10',1,1,NULL,NULL,NULL),(73,'Estel','Balistreri','March Hare. Alice.',NULL,'nigel47@murray.org','$2y$12$u04qMQ2WUgIMrdYMeeVSBevKapGFJV8ELRcY7Nr1ja27W1UV1MA2.',184,'1982-08-29','+16503997760','2024-03-27 15:38:11',NULL,'job-seeker',NULL,'resume/01.pdf','33208 Hal Isle\nHermanshire, MD 01738','Dodo in an offended tone, \'so I can\'t be Mabel, for I know I do!\' said Alice loudly. \'The idea of the conversation. Alice felt a violent shake at the thought that she remained the same as they used.',1,0,3555,1,NULL,'2024-03-27 08:38:11','2024-03-27 08:38:11',0,1,NULL,NULL,NULL),(74,'Joelle','Dare','The Rabbit started.',NULL,'bennie46@gmail.com','$2y$12$UPfcPwRrfYb5i.pmEm1feu5mX56uhXD2prblh/QIjDiOlG9hIOWtW',186,'2007-11-10','+12833699505','2024-03-27 15:38:11',NULL,'employer',NULL,NULL,'67568 Ramiro Springs Apt. 651\nCorwinville, MS 58714','Alice ventured to say. \'What is it?\' The Gryphon sat up and leave the court; but on second thoughts she decided to remain where she was beginning to see the Mock Turtle, \'Drive on, old fellow! Don\'t.',1,0,2562,1,NULL,'2024-03-27 08:38:11','2024-03-27 08:38:11',0,1,NULL,NULL,NULL),(75,'Marty','Bins','I can\'t see you?\'.',NULL,'kemmerich@hotmail.com','$2y$12$D89nlmIh1g45TVhlG4E2beNI36NINVWvzvZpCi1b/PZqmlVcmYXEO',186,'1995-09-10','+16406106483','2024-03-27 15:38:12',NULL,'job-seeker',NULL,'resume/01.pdf','1632 Pfeffer Tunnel Apt. 513\nWest Katelin, OH 42722-9575','You see the earth takes twenty-four hours to turn into a tidy little room with a deep sigh, \'I was a child,\' said the Pigeon; \'but I haven\'t had a vague sort of way to change the subject of.',1,0,174,0,NULL,'2024-03-27 08:38:12','2024-03-27 08:38:12',1,1,NULL,NULL,NULL),(76,'Alvera','Fahey','There was nothing.',NULL,'gorn@hotmail.com','$2y$12$zaQ04AF4hJzFMTc53GOtru1d3qXDSaRV7VOfOvLYwJrPfuCp5pFuO',186,'1975-03-31','+12568760301','2024-03-27 15:38:12',NULL,'employer',NULL,NULL,'50357 Ayden Harbors Suite 060\nNew America, NY 72673','I\'ve often seen them at last, with a cart-horse, and expecting every moment to be a letter, written by the officers of the Rabbit\'s little white kid gloves, and she jumped up on to himself in an.',1,0,1893,0,NULL,'2024-03-27 08:38:12','2024-03-27 08:38:12',1,1,NULL,NULL,NULL),(77,'Jennie','Monahan','Alice angrily. \'It.',NULL,'rhett.lueilwitz@harris.info','$2y$12$RgAPjp/TG0VuPxAhoJCu8eXgAuBAMLGB7e2Esk4j3q8NUKzt9d3Lm',186,'2000-05-16','+13606986578','2024-03-27 15:38:13',NULL,'job-seeker',NULL,'resume/01.pdf','156 Howell Fields\nLake Addison, FL 22869','I am in the middle. Alice kept her waiting!\' Alice felt so desperate that she did not venture to ask any more questions about it, you know.\' \'I don\'t see any wine,\' she remarked. \'There isn\'t any,\'.',1,0,4619,1,NULL,'2024-03-27 08:38:13','2024-03-27 08:38:13',0,1,NULL,NULL,NULL),(78,'Aimee','Kling','BEST butter, you.',NULL,'cdaugherty@yahoo.com','$2y$12$bH6IVbaOOFZSiPnSu8hIYe8TXK6gyDwPPmulKpNVj5/vB224oqw0e',184,'2019-07-16','+12485331897','2024-03-27 15:38:13',NULL,'employer',NULL,NULL,'30924 Wintheiser Junctions Apt. 295\nZechariahton, NC 33226','Alice quite jumped; but she did not quite sure whether it was as much as she could, \'If you knew Time as well as she could, for the hedgehogs; and in a coaxing tone, and added \'It isn\'t directed at.',1,0,3397,1,NULL,'2024-03-27 08:38:13','2024-03-27 08:38:13',1,1,NULL,NULL,NULL),(79,'Herta','Dibbert','And with that she.',NULL,'bogisich.blair@hotmail.com','$2y$12$E1UdNulxqktqtAq4yUVe2OSk6qbm.ujzjy3Wrev.BjWO5Et3kSZ7a',186,'1974-07-14','+17726934910','2024-03-27 15:38:14',NULL,'job-seeker',NULL,'resume/01.pdf','406 DuBuque Expressway\nKossberg, WI 74259-1616','William\'s conduct at first was in confusion, getting the Dormouse go on crying in this affair, He trusts to you to get hold of it; then Alice, thinking it was a sound of a tree a few minutes it.',1,0,2086,0,NULL,'2024-03-27 08:38:14','2024-03-27 08:38:14',1,1,NULL,NULL,NULL),(80,'Eryn','Batz','Alice, \'we learned.',NULL,'rdibbert@upton.com','$2y$12$z8NKdI0kNvEpjRUkXsyyauQnYg3zQ0fDbAnJw7G90gOBy.1TpRlia',186,'1984-01-25','+14243509463','2024-03-27 15:38:14',NULL,'job-seeker',NULL,'resume/01.pdf','78018 Kovacek Views Apt. 661\nKuhnfurt, NM 18618','Alice; \'I might as well as pigs, and was surprised to find her way through the glass, and she was about a thousand times as large as the Rabbit, and had to kneel down on one knee. \'I\'m a poor man.',1,0,160,0,NULL,'2024-03-27 08:38:14','2024-03-27 08:38:14',0,1,NULL,NULL,NULL),(81,'Madisyn','Collins','Alice did not like.',NULL,'mbeer@mckenzie.com','$2y$12$e6A833prun6X//EMY13nxOZQsgvw.B3ulZEeKIDlWk4G61co4iQ..',186,'2002-07-20','+12482155348','2024-03-27 15:38:15',NULL,'employer',NULL,NULL,'5482 Padberg Village Suite 132\nSouth Lonzo, IL 82741','King eagerly, and he went on just as usual. \'Come, there\'s no name signed at the mushroom (she had kept a piece of bread-and-butter in the last words out loud, and the arm that was lying under the.',1,0,3979,1,NULL,'2024-03-27 08:38:15','2024-03-27 08:38:15',1,1,NULL,NULL,NULL),(82,'Tierra','Cremin','THESE?\' said the.',NULL,'rudy41@lemke.com','$2y$12$BKys1r6d2FfLYUW9ZpyaT.0L3/cCQOESmazVBIPGoS4H3vMHbUgAu',185,'1998-05-01','+19169814321','2024-03-27 15:38:15',NULL,'job-seeker',NULL,'resume/01.pdf','91173 Lowell Glens Suite 332\nPort Kaleyberg, ME 84992','But if I\'m not particular as to prevent its undoing itself,) she carried it out into the sea, some children digging in the pool of tears which she had read about them in books, and she hurried out.',1,0,2600,0,NULL,'2024-03-27 08:38:15','2024-03-27 08:38:15',1,1,NULL,NULL,NULL),(83,'Enos','Wintheiser','Alice called out.',NULL,'patience52@hotmail.com','$2y$12$oFsKnVzZXhap.1lRF7f2/ucZ5v83SK3uVx2j4X24mSyOp5BsQjc3S',185,'2011-07-28','+14843952308','2024-03-27 15:38:16',NULL,'employer',NULL,NULL,'92743 Buckridge Courts Suite 501\nTwilachester, RI 57676-5221','The three soldiers wandered about for some time without hearing anything more: at last she spread out her hand, and a sad tale!\' said the Queen, and Alice was more than that, if you only walk long.',1,0,197,0,NULL,'2024-03-27 08:38:16','2024-03-27 08:38:16',1,1,NULL,NULL,NULL),(84,'Chyna','Rippin','Alice thought over.',NULL,'monahan.malinda@langworth.biz','$2y$12$2btZGUtSVAPKiSrd2/GVzORuK4GiZY9/Ok5WhgI3CXJIxCTx4H9tW',184,'2010-06-07','+19716571335','2024-03-27 15:38:16',NULL,'employer',NULL,NULL,'441 Huel Ramp Apt. 813\nNorth Emeraldtown, ME 50259','ONE respectable person!\' Soon her eye fell upon a time she had hoped) a fan and two or three of the Gryphon, and the three were all turning into little cakes as they came nearer, Alice could hear.',1,0,810,0,NULL,'2024-03-27 08:38:16','2024-03-27 08:38:16',0,1,NULL,NULL,NULL),(85,'Pedro','Conn','Duchess; \'and most.',NULL,'qbechtelar@yahoo.com','$2y$12$iMZp.dRoCJ31lXHODx4vdeG9L0xJzkUoKTf/O/hE0FYoDnU/.1DQW',184,'2021-07-05','+15749251882','2024-03-27 15:38:17',NULL,'job-seeker',NULL,'resume/01.pdf','546 Christy Viaduct Apt. 191\nAmanimouth, NC 50944-1720','I see\"!\' \'You might just as she could. The next thing was waving its right paw round, \'lives a Hatter: and in despair she put them into a chrysalis--you will some day, you know--and then after that.',1,0,3267,0,NULL,'2024-03-27 08:38:17','2024-03-27 08:38:17',1,1,NULL,NULL,NULL),(86,'Cristian','Nolan','Gryphon is, look.',NULL,'chadrick83@yahoo.com','$2y$12$.jnIGvP0o3eyIxWnBV6PeuOjYaEBcR2yKiFNp3r6/6vjfooXEb5Hq',184,'2023-01-29','+19202142760','2024-03-27 15:38:17',NULL,'employer',NULL,NULL,'315 Raphael Fort\nAlffort, TN 13916','Alice opened the door and found that, as nearly as she could, for the first question, you know.\' \'And what an ignorant little girl she\'ll think me at home! Why, I do so like that curious song about.',1,0,4603,0,NULL,'2024-03-27 08:38:17','2024-03-27 08:38:17',1,1,NULL,NULL,NULL),(87,'Margarita','Welch','The Mouse did not.',NULL,'rippin.eriberto@gmail.com','$2y$12$zQyz1.B/1vOTvpZYLJqL4e4XCgl9r21m5CMIGT6Wz61O/23XCrhF2',186,'2016-07-13','+15412835783','2024-03-27 15:38:17',NULL,'job-seeker',NULL,'resume/01.pdf','894 Kallie Islands Suite 245\nChrishaven, WI 13063','MINE.\' The Queen turned angrily away from him, and said \'That\'s very important,\' the King said to herself; \'I should have croqueted the Queen\'s shrill cries to the beginning of the table, half.',1,0,1561,1,NULL,'2024-03-27 08:38:17','2024-03-27 08:38:17',1,1,NULL,NULL,NULL),(88,'Alexandria','Green','And when I was a.',NULL,'tyler.macejkovic@zemlak.org','$2y$12$yKTCWOsLLPDsPb5duLJPfeg5heMaSfBJaI/fzoiq3d81O.Hr5AXiK',184,'1975-08-29','+13175602127','2024-03-27 15:38:18',NULL,'job-seeker',NULL,'resume/01.pdf','6623 Kessler Landing\nCummerataburgh, NM 37934-2680','And oh, I wish you wouldn\'t mind,\' said Alice: \'--where\'s the Duchess?\' \'Hush! Hush!\' said the Duchess, \'chop off her unfortunate guests to execution--once more the shriek of the jurymen. \'No.',1,0,4949,1,NULL,'2024-03-27 08:38:18','2024-03-27 08:38:18',1,1,NULL,NULL,NULL),(89,'Kenneth','Towne','Mock Turtle yawned.',NULL,'mitchell.faye@kris.com','$2y$12$NvdQEpYTWb14RqeFGWkJUOetUSlXSHPL0mXnydv1wEEB0l6wa7gb.',184,'1980-05-24','+12175820652','2024-03-27 15:38:18',NULL,'employer',NULL,NULL,'4440 Devante Overpass\nEast Miller, MI 14024-9648','Duchess and the moment she appeared on the whole thing, and longed to change the subject. \'Ten hours the first position in dancing.\' Alice said; but was dreadfully puzzled by the hedge!\' then.',1,0,4219,1,NULL,'2024-03-27 08:38:18','2024-03-27 08:38:18',1,1,NULL,NULL,NULL),(90,'Ruben','Ankunding','Mock Turtle. Alice.',NULL,'jayden.fisher@ledner.net','$2y$12$ebcbdvidIY3paY6IKsGlaOpa0dFYjWCEJiw2VsSF56iYUanGPtBJe',186,'2004-05-21','+12724060134','2024-03-27 15:38:19',NULL,'job-seeker',NULL,'resume/01.pdf','7275 Hauck Dam\nNorth Corene, DC 88615-6951','Turtle.\' These words were followed by a row of lodging houses, and behind it when she turned away. \'Come back!\' the Caterpillar angrily, rearing itself upright as it went, as if it thought that she.',1,0,1547,1,NULL,'2024-03-27 08:38:19','2024-03-27 08:38:19',0,1,NULL,NULL,NULL),(91,'Kelton','Kihn','I suppose?\' \'Yes,\'.',NULL,'donny75@jones.com','$2y$12$wcrRQYlweoH3/gaaBNhmjeGtYJPSpQdhCvOG/494Qgq3MecbW.mQa',184,'1998-09-11','+13057665971','2024-03-27 15:38:19',NULL,'employer',NULL,NULL,'242 Lockman Overpass\nBettieburgh, TN 08524','Alice laughed so much at first, but, after watching it a minute or two to think that very few things indeed were really impossible. There seemed to rise like a wild beast, screamed \'Off with her.',1,0,3292,1,NULL,'2024-03-27 08:38:19','2024-03-27 08:38:19',0,1,NULL,NULL,NULL),(92,'Merl','Raynor','So she began: \'O.',NULL,'ardith85@gmail.com','$2y$12$b.U3IKHC2E4jgW6t9Wzu1eHQHXkJ..0Gd0M3SRRm9Zw0MJtaI5QV.',184,'2017-09-05','+15679691742','2024-03-27 15:38:20',NULL,'job-seeker',NULL,'resume/01.pdf','54123 Ziemann Union\nEast Brisaborough, WA 54882','And yet you incessantly stand on their backs was the White Rabbit, jumping up in great fear lest she should meet the real Mary Ann, what ARE you doing out here? Run home this moment, I tell you!\'.',1,0,501,0,NULL,'2024-03-27 08:38:20','2024-03-27 08:38:20',0,1,NULL,NULL,NULL),(93,'Matteo','Rempel','Queen. \'It proves.',NULL,'vbergstrom@gmail.com','$2y$12$H7UPbgDj2xsST8a/keOVIOAJMM1xnF6RFzejLSyKXP5NT6oF1ttse',185,'1972-08-20','+14587427186','2024-03-27 15:38:20',NULL,'job-seeker',NULL,'resume/01.pdf','89953 Giovanna Ports\nEast Jerrold, NJ 56852','Gryphon, and, taking Alice by the carrier,\' she thought; \'and how funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR.',1,0,3064,0,NULL,'2024-03-27 08:38:20','2024-03-27 08:38:20',1,1,NULL,NULL,NULL),(94,'Brown','Ruecker','I\'ll give them a.',NULL,'baumbach.jess@yahoo.com','$2y$12$AtBrO6DD1eSgXjRKylpw2eRtBKv7Zey5LgJgQv1ZAV/Zzz2Quz5t6',184,'1994-02-19','+16283046454','2024-03-27 15:38:20',NULL,'employer',NULL,NULL,'48251 Ashley Trace Apt. 439\nJacobsbury, AL 42897','MARMALADE\', but to get hold of it; so, after hunting all about for them, and was going off into a conversation. Alice felt a very short time the Mouse replied rather crossly: \'of course you don\'t!\'.',1,0,3746,0,NULL,'2024-03-27 08:38:20','2024-03-27 08:38:20',0,1,NULL,NULL,NULL),(95,'Elna','Glover','Mouse was swimming.',NULL,'bradtke.leanna@langworth.com','$2y$12$8B6jmirbw4DdlvW2MQxHOe.c7Ye4GRgtE9nIXMYECnw.N1/uCkCYi',184,'1997-01-07','+17793275197','2024-03-27 15:38:21',NULL,'job-seeker',NULL,'resume/01.pdf','24652 Shaylee Trail Apt. 883\nDaijaburgh, IA 66110','Bill! the master says you\'re to go after that savage Queen: so she took courage, and went on growing, and she was about a thousand times as large as the Rabbit, and had just begun \'Well, of all her.',1,0,112,1,NULL,'2024-03-27 08:38:21','2024-03-27 08:38:21',1,1,NULL,NULL,NULL),(96,'Maximo','Pfannerstill','That he met in the.',NULL,'wbosco@gmail.com','$2y$12$acFu0nPjDv0dPkNuC.gFT.ZVFDWF88YIaBbFUrVBOkyltB0NN6PiS',186,'2020-01-02','+16574625123','2024-03-27 15:38:21',NULL,'job-seeker',NULL,'resume/01.pdf','9464 Abbott Lane Suite 499\nNew Kianshire, PA 20238-2307','Bill,\' thought Alice,) \'Well, I never understood what it was: she was getting so far off). \'Oh, my poor little Lizard, Bill, was in the grass, merely remarking that a moment\'s delay would cost them.',1,0,2418,0,NULL,'2024-03-27 08:38:21','2024-03-27 08:38:21',1,1,NULL,NULL,NULL),(97,'Carolyne','Borer','Lory hastily. \'I.',NULL,'sincere98@legros.com','$2y$12$LqLfGVXFeQ./nO1N1Oe4XOwbINTCw9lLRGzv40P3dlCT9CbxyzXDS',185,'1970-02-11','+16287674158','2024-03-27 15:38:22',NULL,'employer',NULL,NULL,'44611 Audra Stravenue\nNorth Joshua, MA 07332-4638','Seven said nothing, but looked at Alice, and she heard the Rabbit say, \'A barrowful of WHAT?\' thought Alice \'without pictures or conversations?\' So she swallowed one of the gloves, and she jumped up.',1,0,4910,1,NULL,'2024-03-27 08:38:22','2024-03-27 08:38:22',1,1,NULL,NULL,NULL),(98,'Marcia','Bogisich','The Gryphon sat up.',NULL,'murray.kaleb@hettinger.com','$2y$12$yL0cTxAXsv.aoV0ay5XzW.deb9kqIiGf2xEvb0XMpADtOLiq4dERC',184,'1972-03-13','+16785984832','2024-03-27 15:38:22',NULL,'employer',NULL,NULL,'66783 Claud Points\nNorth June, KY 65432-0168','There was nothing so VERY much out of a good deal: this fireplace is narrow, to be no chance of her sister, as well as pigs, and was beating her violently with its head, it WOULD twist itself round.',1,0,2671,0,NULL,'2024-03-27 08:38:22','2024-03-27 08:38:22',0,1,NULL,NULL,NULL),(99,'Jessy','Tremblay','Owl had the door.',NULL,'gerhold.magdalena@fay.com','$2y$12$fYPNTq6C9TUis/zzmt4thOC9FI9XuYWtdLh0ZR0cdFUgEf7taWDZG',185,'1970-11-25','+18103621526','2024-03-27 15:38:22',NULL,'job-seeker',NULL,'resume/01.pdf','85707 Upton Valley Apt. 307\nEast Francesca, KS 91179','Mock Turtle sighed deeply, and began, in rather a handsome pig, I think.\' And she began nursing her child again, singing a sort of chance of getting up and to hear the Rabbit just under the window.',1,0,4848,1,NULL,'2024-03-27 08:38:22','2024-03-27 08:38:22',1,1,NULL,NULL,NULL),(100,'Idell','Lubowitz','I\'m here! Digging.',NULL,'stefanie.prosacco@buckridge.com','$2y$12$50gO1cjOweIy430xD.ZOvOfzNgkBvipOtFkJiQlv9kksg35UOSXka',184,'1983-06-18','+17693198704','2024-03-27 15:38:23',NULL,'employer',NULL,NULL,'95113 Nolan Crest\nSouth Darrion, IN 99229','I had not as yet had any dispute with the game,\' the Queen never left off when they arrived, with a great crowd assembled about them--all sorts of things, and she, oh! she knows such a thing. After.',1,0,827,0,NULL,'2024-03-27 08:38:23','2024-03-27 08:38:23',0,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jb_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_analytics`
--

DROP TABLE IF EXISTS `jb_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_analytics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `job_id` bigint unsigned NOT NULL,
  `country` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_full` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_analytics`
--

LOCK TABLES `jb_analytics` WRITE;
/*!40000 ALTER TABLE `jb_analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_applications`
--

DROP TABLE IF EXISTS `jb_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_applications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `job_id` bigint unsigned NOT NULL,
  `resume` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_letter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `is_external_apply` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_applications`
--

LOCK TABLES `jb_applications` WRITE;
/*!40000 ALTER TABLE `jb_applications` DISABLE KEYS */;
INSERT INTO `jb_applications` VALUES (1,'Herta','Dibbert','+17726934910','bogisich.blair@hotmail.com','Alice noticed, had powdered hair that WOULD always get into the teapot. \'At any rate I\'ll never go THERE again!\' said Alice loudly. \'The idea of having the sentence first!\' \'Hold your tongue!\' said.',47,'resume/01.pdf','resume/01.pdf',79,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(2,'Kristofer','Hermann','+14699391591','linwood43@gmail.com','I\'m I, and--oh dear, how puzzling it all seemed quite dull and stupid for life to go near the looking-glass. There was no more to be talking in a sorrowful tone; \'at least there\'s no use going back.',4,'resume/01.pdf','resume/01.pdf',19,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(3,'Aditya','Collier','+18629479020','genevieve03@yahoo.com','Hatter. Alice felt a little ledge of rock, and, as they were mine before. If I or she should meet the real Mary Ann, and be turned out of the Mock Turtle in a very short time the Queen never left.',30,'resume/01.pdf','resume/01.pdf',24,0,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(4,'Ava','Dare','+14178842791','bosco.irving@hotmail.com','Gryphon. \'The reason is,\' said the Queen. An invitation for the pool rippling to the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little timidly, \'why you are very dull!\' \'You.',22,'resume/01.pdf','resume/01.pdf',50,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(5,'Sonya','Will','+19285051187','ledner.jessyca@berge.com','It was the BEST butter,\' the March Hare, who had followed him into the garden, and I had to stop and untwist it. After a while, finding that nothing more happened, she decided on going into the.',17,'resume/01.pdf','resume/01.pdf',52,0,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(6,'Kameron','Ritchie','+15208453127','vmills@yahoo.com','The Hatter shook his head mournfully. \'Not I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' \'What did they live on?\' said Alice, \'we learned French and music.\' \'And.',36,'resume/01.pdf','resume/01.pdf',60,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(7,'Asa','Breitenberg','+19342890815','howell.kim@friesen.info','She waited for some time with great curiosity, and this was of very little use without my shoulders. Oh, how I wish you would have called him Tortoise because he was speaking, so that they couldn\'t.',35,'resume/01.pdf','resume/01.pdf',20,0,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(8,'Doyle','Torp','+16575519447','wisoky.alayna@gmail.com','Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can guess that,\' she added in an agony of.',3,'resume/01.pdf','resume/01.pdf',46,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(9,'Marianne','Schuster','+12529151270','darby.walsh@gmail.com','I\'d hardly finished the first day,\' said the Caterpillar; and it was certainly English. \'I don\'t quite understand you,\' she said, \'than waste it in time,\' said the Mock Turtle, \'they--you\'ve seen.',14,'resume/01.pdf','resume/01.pdf',68,0,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(10,'Jaquan','Kuhlman','+15599136493','christian98@hotmail.com','Dormouse crossed the court, without even looking round. \'I\'ll fetch the executioner went off like an honest man.\' There was certainly English. \'I don\'t think they play at all anxious to have.',29,'resume/01.pdf','resume/01.pdf',10,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(11,'Martin','Ritchie','+15715297641','job_seeker@archielite.com','Dormouse!\' And they pinched it on both sides at once. The Dormouse had closed its eyes again, to see that queer little toss of her going, though she knew she had gone through that day. \'No, no!\'.',44,'resume/01.pdf','resume/01.pdf',2,0,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(12,'Dana','Gutkowski','+15208287180','madaline.lockman@hotmail.com','Alice could see it pop down a very curious thing, and she felt certain it must make me grow larger, I can find out the Fish-Footman was gone, and, by the time he had to fall a long breath, and said.',37,'resume/01.pdf','resume/01.pdf',62,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(13,'Eryn','Batz','+14243509463','rdibbert@upton.com','I get SOMEWHERE,\' Alice added as an explanation; \'I\'ve none of them hit her in an offended tone, \'so I can\'t show it you myself,\' the Mock Turtle. \'Hold your tongue, Ma!\' said the Gryphon. \'Do you.',51,'resume/01.pdf','resume/01.pdf',80,0,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(14,'Tierra','Cremin','+19169814321','rudy41@lemke.com','Paris, and Paris is the capital of Paris, and Paris is the same as the rest of the court,\" and I had to kneel down on their slates, when the Rabbit say to this: so she felt certain it must be.',2,'resume/01.pdf','resume/01.pdf',82,0,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(15,'Jennie','Monahan','+13606986578','rhett.lueilwitz@harris.info','I\'m I, and--oh dear, how puzzling it all is! I\'ll try if I like being that person, I\'ll come up: if not, I\'ll stay down here till I\'m somebody else\"--but, oh dear!\' cried Alice in a pleased tone.',45,'resume/01.pdf','resume/01.pdf',77,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(16,'Easter','Crona','+16269325933','amelie.parisian@gmail.com','MINE,\' said the King, rubbing his hands; \'so now let the Dormouse say?\' one of the wood for fear of their wits!\' So she tucked her arm affectionately into Alice\'s, and they walked off together.',23,'resume/01.pdf','resume/01.pdf',37,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(17,'Jamar','Rau','+19405612175','zella.bechtelar@mcdermott.com','I\'ve finished.\' So they went up to Alice, and looking anxiously about her. \'Oh, do let me hear the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, quite forgetting that she was.',21,'resume/01.pdf','resume/01.pdf',34,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(18,'Jessy','Tremblay','+18103621526','gerhold.magdalena@fay.com','At last the Mouse, turning to Alice for some time with one elbow against the roof off.\' After a while, finding that nothing more happened, she decided on going into the garden at once; but, alas for.',24,'resume/01.pdf','resume/01.pdf',99,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(19,'Bret','Mueller','+12023154356','mhamill@hotmail.com','See how eagerly the lobsters to the other, looking uneasily at the jury-box, or they would die. \'The trial cannot proceed,\' said the Queen, who were lying round the thistle again; then the Mock.',50,'resume/01.pdf','resume/01.pdf',53,0,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24'),(20,'Jett','Kuvalis','+16237808893','sarai47@hotmail.com','All this time she saw in my own tears! That WILL be a letter, after all: it\'s a set of verses.\' \'Are they in the lap of her skirt, upsetting all the arches are gone from this morning,\' said Alice.',18,'resume/01.pdf','resume/01.pdf',13,1,'checked','2024-03-27 08:38:24','2024-03-27 08:38:24');
/*!40000 ALTER TABLE `jb_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_career_levels`
--

DROP TABLE IF EXISTS `jb_career_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_career_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_career_levels`
--

LOCK TABLES `jb_career_levels` WRITE;
/*!40000 ALTER TABLE `jb_career_levels` DISABLE KEYS */;
INSERT INTO `jb_career_levels` VALUES (1,'Department Head',0,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(2,'Entry Level',0,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(3,'Experienced Professional',0,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(4,'GM / CEO / Country Head / President',0,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(5,'Intern/Student',0,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37');
/*!40000 ALTER TABLE `jb_career_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_career_levels_translations`
--

DROP TABLE IF EXISTS `jb_career_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_career_levels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_career_levels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_career_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_career_levels_translations`
--

LOCK TABLES `jb_career_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_career_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_career_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_categories`
--

DROP TABLE IF EXISTS `jb_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_categories`
--

LOCK TABLES `jb_categories` WRITE;
/*!40000 ALTER TABLE `jb_categories` DISABLE KEYS */;
INSERT INTO `jb_categories` VALUES (1,'Content Writer',NULL,0,0,1,'published','2024-03-27 08:37:39','2024-03-27 08:37:39',0),(2,'Market Research',NULL,1,0,1,'published','2024-03-27 08:37:39','2024-03-27 08:37:39',0),(3,'Marketing &amp; Sale',NULL,2,0,1,'published','2024-03-27 08:37:39','2024-03-27 08:37:39',0),(4,'Customer Help',NULL,3,0,1,'published','2024-03-27 08:37:39','2024-03-27 08:37:39',0),(5,'Finance',NULL,4,0,1,'published','2024-03-27 08:37:39','2024-03-27 08:37:39',0),(6,'Software',NULL,5,0,1,'published','2024-03-27 08:37:39','2024-03-27 08:37:39',0),(7,'Human Resource',NULL,6,0,1,'published','2024-03-27 08:37:39','2024-03-27 08:37:39',0),(8,'Management',NULL,7,0,1,'published','2024-03-27 08:37:40','2024-03-27 08:37:40',0),(9,'Retail &amp; Products',NULL,8,0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40',0),(10,'Security Analyst',NULL,9,0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40',0);
/*!40000 ALTER TABLE `jb_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_categories_translations`
--

DROP TABLE IF EXISTS `jb_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_categories_translations`
--

LOCK TABLES `jb_categories_translations` WRITE;
/*!40000 ALTER TABLE `jb_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_companies`
--

DROP TABLE IF EXISTS `jb_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_companies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `postal_code` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_founded` int unsigned DEFAULT NULL,
  `ceo` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number_of_offices` int unsigned DEFAULT NULL,
  `number_of_employees` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `annual_revenue` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `views` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tax_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_companies`
--

LOCK TABLES `jb_companies` WRITE;
/*!40000 ALTER TABLE `jb_companies` DISABLE KEYS */;
INSERT INTO `jb_companies` VALUES (1,'LinkedIn',NULL,'Quis voluptas quaerat necessitatibus rerum. Quisquam et ipsam autem velit et. Consequatur rerum quia eos quod.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.linkedin.com/','companies/1.png','42.718679','-75.820883','4083 Schmitt Pines Suite 706\nChloehaven, WI 18546',3,3,3,NULL,'+17576779379',1989,'John Doe',3,'10','1M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(2,'Adobe Illustrator',NULL,'Distinctio non nostrum qui. Magnam repudiandae rerum placeat debitis. Ab aut ipsam porro dolorem molestias architecto odio. Quos dolorem sequi quas quia est commodi.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.adobe.com/','companies/2.png','42.963984','-74.778512','88439 Neil Shoals Suite 998\nPort Mozelle, UT 18775',4,4,4,NULL,'+18052900677',2018,'Jeff Werner',1,'5','5M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(3,'Bing Search',NULL,'Voluptatem sit fugit esse et. Ut fugiat eaque dolores explicabo incidunt perspiciatis odit. Inventore voluptas recusandae voluptatem at repellat pariatur.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.bing.com/','companies/3.png','42.804952','-76.714921','72823 Lukas Squares Apt. 574\nMetzfurt, CT 11929-3806',5,5,5,NULL,'+12319789230',1974,'Nakamura',3,'7','4M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(4,'Dailymotion',NULL,'Minima repellendus rerum est repudiandae et molestias saepe. Non nihil qui sint non repellat. Molestiae distinctio est voluptates natus rerum ea beatae. Sed velit eos rerum saepe sapiente totam.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.dailymotion.com/','companies/4.png','43.882068','-76.082537','80439 Streich Greens\nLake Clotildebury, AK 39764',5,5,5,NULL,'+12833499430',2003,'John Doe',5,'9','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(5,'Linkedin',NULL,'Pariatur odio nihil ut ut voluptas quam. Laborum natus consequatur est.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.linkedin.com/','companies/5.png','43.573681','-75.514204','79699 Lane Plains\nTheresiastad, RI 73085-9750',2,2,2,NULL,'+15393426481',1999,'John Doe',2,'2','4M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(6,'Quora JSC',NULL,'Sit debitis non et vel. Quas rem enim illum aliquid in porro voluptas. Est deleniti fugit quis neque asperiores rerum enim.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.quora.com/','companies/6.png','43.032065','-75.026182','146 Giovanni Drive\nKozeymouth, NH 10980',2,2,2,NULL,'+14426521528',1974,'John Doe',9,'3','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(7,'Nintendo',NULL,'Et repellendus eveniet rem veniam maxime doloremque. Suscipit et omnis dignissimos rem. Eaque ut minima quidem et sed et assumenda. Consequuntur consequuntur et sunt.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.nintendo.com/','companies/7.png','42.697688','-75.295835','968 Kuhn Forge\nSouth Brucefurt, MO 86770',4,4,4,NULL,'+19104176826',2006,'Steve Jobs',1,'3','2M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(8,'Periscope',NULL,'Repellendus facilis dicta quia consequatur fuga. Sit ex error voluptatem voluptate eveniet consequatur officiis. Eos at maiores temporibus est ipsa fugit nisi. Et ratione eius suscipit reprehenderit.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/8.png','43.891706','-76.711788','8577 Reba Neck Apt. 687\nFreedatown, NJ 46998',2,2,2,NULL,'+18588584070',2006,'John Doe',5,'4','4M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(9,'NewSum',NULL,'Facere odio saepe laudantium rem animi dolorem voluptas. Voluptatem et ullam voluptas eaque quia. Minus temporibus fuga ullam voluptas accusamus. Cupiditate magnam ullam itaque qui voluptatibus.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://newsum.us/','companies/4.png','43.400464','-74.880817','29348 Ali Junction Suite 269\nHandhaven, KS 04776-2060',1,1,1,NULL,'+19142892750',2011,'John Doe',3,'2','6M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(10,'PowerHome',NULL,'Harum dolor quo est ratione doloribus recusandae. Adipisci consequatur ut iure qui sed. Perspiciatis dolorum iure cupiditate nam. Et enim ut ut porro non et aliquam.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/5.png','42.882768','-75.7555','52483 Angela Mews Apt. 121\nScarlettmouth, MD 05489',1,1,1,NULL,'+13613316901',1996,'John Doe',7,'4','5M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(11,'Whop.com',NULL,'Aut suscipit sint quae omnis laboriosam ullam iure autem. Incidunt facere molestiae pariatur assumenda. Rerum pariatur laborum voluptas amet odio assumenda labore.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://whop.com/','companies/6.png','43.437435','-76.599087','3424 Rutherford Station\nEast Jeanie, PA 54555-4711',5,5,5,NULL,'+13519993330',1975,'John Doe',5,'7','10M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(12,'Greenwood',NULL,'Mollitia nobis quidem molestiae aspernatur et incidunt molestiae. Sed minima iusto consequatur sit aut. Sed earum hic tempora et ab quis. Minima cumque qui dolorem voluptatibus dolores.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.greenwoodjs.io/','companies/7.png','43.005103','-75.480224','928 Goodwin Park\nAnnettaton, FL 04060-0604',1,1,1,NULL,'+13415079844',1984,'John Doe',2,'8','4M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(13,'Kentucky',NULL,'Voluptatem voluptas et nihil modi amet et iure. Nam eligendi id tempore. Vel molestiae accusantium beatae qui optio consequatur ab. Tenetur necessitatibus sit quos voluptatem placeat.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.kentucky.gov/','companies/8.png','43.135535','-74.823826','96089 Carter Gardens\nChamplinbury, IA 49510-3789',1,1,1,NULL,'+17209297413',2009,'John Doe',4,'4','8M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(14,'Equity',NULL,'Eum ipsa numquam voluptatem nisi vitae. Voluptatem illum aut ut tenetur repudiandae autem nulla. Omnis provident natus doloremque quasi qui officiis. Facilis consequatur voluptatem veniam.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.equity.org.uk/','companies/6.png','42.936168','-75.927649','642 Braulio Crescent Suite 032\nPort Christophertown, NY 19691-4212',3,3,3,NULL,'+14053816805',1995,'John Doe',1,'7','3M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(15,'Honda',NULL,'Dolor quo ipsa laudantium accusantium sunt quia. Voluptatem voluptatem natus voluptatem voluptatem dolor sint. Amet non veniam sunt quasi voluptatum sunt.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.honda.com/','companies/9.png','43.539923','-76.499894','49809 Halvorson Ferry Apt. 439\nNadiastad, UT 03287',2,2,2,NULL,'+12724492015',1989,'John Doe',6,'6','5M',NULL,NULL,NULL,NULL,NULL,1,'published',0,'2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(16,'Toyota',NULL,'Aliquid placeat perspiciatis non quos. Eum sed ut inventore quisquam. Tenetur dolorum molestias at.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.toyota.com/','companies/5.png','43.091795','-75.731317','424 Hammes Tunnel Apt. 048\nSouth Letha, MD 97794-5149',6,6,6,NULL,'+18286179778',1982,'John Doe',10,'5','4M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(17,'Lexus',NULL,'Quisquam id ut dolor consequatur qui quia et. Accusamus praesentium velit possimus qui vero alias. Fugit quis quae voluptatem veritatis excepturi nemo quia.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://www.pscp.tv/','companies/3.png','43.626427','-76.482789','57633 Arely Well Suite 738\nRusselfurt, IA 77815-2677',6,6,6,NULL,'+17254481557',1985,'John Doe',10,'5','3M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(18,'Ondo',NULL,'Expedita aspernatur sit sed est. Architecto ut distinctio illum mollitia. Quo expedita dicta eligendi quo qui facilis eligendi. Possimus est et eveniet adipisci.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://ondo.mn/','companies/6.png','43.818372','-76.164432','41381 Beaulah Station\nJulioville, OH 92958',5,5,5,NULL,'+13102370590',1983,'John Doe',8,'1','8M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(19,'Square',NULL,'Asperiores repudiandae ab quod neque sit et. Consequatur ea et qui sequi. Sed omnis unde repellat quis quidem. Suscipit qui sed non nesciunt asperiores mollitia qui.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://squareup.com/','companies/2.png','42.707444','-75.739672','6027 Price Common Apt. 062\nBraunchester, RI 17086',2,2,2,NULL,'+14345176143',1991,'John Doe',8,'1','10M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(20,'Visa',NULL,'Blanditiis odio atque nulla autem itaque et ipsam. Est quo voluptatem dolorem eos voluptas ut reiciendis. Repellendus ipsam inventore dignissimos unde.','<p class=\"text-muted\"> Objectively pursue diverse catalysts for change for interoperable meta-services. Distinctively re-engineer\n                revolutionary meta-services and premium architectures. Intrinsically incubate intuitive opportunities and\n                real-time potentialities. Appropriately communicate one-to-one technology.</p>\n\n            <p class=\"text-muted\">Intrinsically incubate intuitive opportunities and real-time potentialities Appropriately communicate\n                one-to-one technology.</p>\n\n            <p class=\"text-muted\"> Exercitation photo booth stumptown tote bag Banksy, elit small batch freegan sed. Craft beer elit\n                seitan exercitation, photo booth et 8-bit kale chips proident chillwave deep v laborum. Aliquip veniam delectus, Marfa\n                eiusmod Pinterest in do umami readymade swag.</p>','https://visa.com/','companies/8.png','42.666396','-76.638258','2736 Powlowski Crossroad\nLake Hubertfort, NV 66083-5570',1,1,1,NULL,'+17348594348',2016,'John Doe',10,'7','6M',NULL,NULL,NULL,NULL,NULL,0,'published',0,'2024-03-27 08:37:41','2024-03-27 08:37:41',NULL);
/*!40000 ALTER TABLE `jb_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_companies_accounts`
--

DROP TABLE IF EXISTS `jb_companies_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_companies_accounts` (
  `company_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_companies_accounts`
--

LOCK TABLES `jb_companies_accounts` WRITE;
/*!40000 ALTER TABLE `jb_companies_accounts` DISABLE KEYS */;
INSERT INTO `jb_companies_accounts` VALUES (1,1),(1,4),(2,1),(2,4),(3,1),(3,4),(4,1),(4,4),(5,1),(5,4),(6,1),(6,4),(7,1),(7,4),(8,1),(8,4),(9,1),(9,4),(10,1),(10,4),(11,1),(11,4),(12,1),(12,4),(13,1),(13,4),(14,1),(14,4),(15,1),(15,4),(16,1),(16,4),(17,1),(17,4),(18,1),(18,4),(19,1),(19,4),(20,1),(20,4);
/*!40000 ALTER TABLE `jb_companies_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_coupons`
--

DROP TABLE IF EXISTS `jb_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_coupons`
--

LOCK TABLES `jb_coupons` WRITE;
/*!40000 ALTER TABLE `jb_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_currencies`
--

DROP TABLE IF EXISTS `jb_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_currencies`
--

LOCK TABLES `jb_currencies` WRITE;
/*!40000 ALTER TABLE `jb_currencies` DISABLE KEYS */;
INSERT INTO `jb_currencies` VALUES (1,'USD','$',1,0,0,1,1,'2024-03-27 08:37:43','2024-03-27 08:37:43'),(2,'EUR','€',0,2,1,0,0.91,'2024-03-27 08:37:43','2024-03-27 08:37:43'),(3,'VND','₫',0,0,2,0,23717.5,'2024-03-27 08:37:43','2024-03-27 08:37:43');
/*!40000 ALTER TABLE `jb_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_options`
--

DROP TABLE IF EXISTS `jb_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_options`
--

LOCK TABLES `jb_custom_field_options` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_options_translations`
--

DROP TABLE IF EXISTS `jb_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_field_options_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_options_translations`
--

LOCK TABLES `jb_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_values`
--

DROP TABLE IF EXISTS `jb_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `custom_field_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_values`
--

LOCK TABLES `jb_custom_field_values` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_field_values_translations`
--

DROP TABLE IF EXISTS `jb_custom_field_values_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_field_values_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_field_values_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_field_values_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_field_values_translations`
--

LOCK TABLES `jb_custom_field_values_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_field_values_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_field_values_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_fields`
--

DROP TABLE IF EXISTS `jb_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorable_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_fields`
--

LOCK TABLES `jb_custom_fields` WRITE;
/*!40000 ALTER TABLE `jb_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_custom_fields_translations`
--

DROP TABLE IF EXISTS `jb_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_custom_fields_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_custom_fields_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_custom_fields_translations`
--

LOCK TABLES `jb_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `jb_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_levels`
--

DROP TABLE IF EXISTS `jb_degree_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_levels`
--

LOCK TABLES `jb_degree_levels` WRITE;
/*!40000 ALTER TABLE `jb_degree_levels` DISABLE KEYS */;
INSERT INTO `jb_degree_levels` VALUES (1,'Non-Matriculation',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(2,'Matriculation/O-Level',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(3,'Intermediate/A-Level',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(4,'Bachelors',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(5,'Masters',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(6,'MPhil/MS',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(7,'PHD/Doctorate',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(8,'Certification',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(9,'Diploma',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(10,'Short Course',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38');
/*!40000 ALTER TABLE `jb_degree_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_levels_translations`
--

DROP TABLE IF EXISTS `jb_degree_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_levels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_degree_levels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_degree_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_levels_translations`
--

LOCK TABLES `jb_degree_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_degree_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_degree_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_types`
--

DROP TABLE IF EXISTS `jb_degree_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree_level_id` bigint unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_types`
--

LOCK TABLES `jb_degree_types` WRITE;
/*!40000 ALTER TABLE `jb_degree_types` DISABLE KEYS */;
INSERT INTO `jb_degree_types` VALUES (1,'Matric in Arts',2,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(2,'Matric in Science',2,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(3,'O-Levels',2,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(4,'A-Levels',3,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(5,'Faculty of Arts',3,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(6,'Faculty of Science (Pre-medical)',3,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(7,'Faculty of Science (Pre-Engineering)',3,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(8,'Intermediate in Computer Science',3,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(9,'Intermediate in Commerce',3,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(10,'Intermediate in General Science',3,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(11,'Bachelors in Arts',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(12,'Bachelors in Architecture',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(13,'Bachelors in Business Administration',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(14,'Bachelors in Commerce',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(15,'Bachelors of Dental Surgery',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(16,'Bachelors of Education',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(17,'Bachelors in Engineering',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(18,'Bachelors in Pharmacy',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(19,'Bachelors in Science',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(20,'Bachelors of Science in Nursing (Registered Nursing)',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(21,'Bachelors in Law',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(22,'Bachelors in Technology',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(23,'BCS/BS',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(24,'Doctor of Veterinary Medicine',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(25,'MBBS',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(26,'Post Registered Nursing B.S.',4,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(27,'Masters in Arts',5,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(28,'Masters in Business Administration',5,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(29,'Masters in Commerce',5,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(30,'Masters of Education',5,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(31,'Masters in Law',5,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(32,'Masters in Science',5,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(33,'Executive Masters in Business Administration',5,0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38');
/*!40000 ALTER TABLE `jb_degree_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_degree_types_translations`
--

DROP TABLE IF EXISTS `jb_degree_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_degree_types_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_degree_types_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_degree_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_degree_types_translations`
--

LOCK TABLES `jb_degree_types_translations` WRITE;
/*!40000 ALTER TABLE `jb_degree_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_degree_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_functional_areas`
--

DROP TABLE IF EXISTS `jb_functional_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_functional_areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_functional_areas`
--

LOCK TABLES `jb_functional_areas` WRITE;
/*!40000 ALTER TABLE `jb_functional_areas` DISABLE KEYS */;
INSERT INTO `jb_functional_areas` VALUES (1,'Accountant',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(2,'Accounts, Finance &amp; Financial Services',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(3,'Admin',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(4,'Admin Operation',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(5,'Administration',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(6,'Administration Clerical',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(7,'Advertising',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(8,'Advertising',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(9,'Advertisement',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(10,'Architects &amp; Construction',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(11,'Architecture',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(12,'Bank Operation',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(13,'Business Development',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(14,'Business Management',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(15,'Business Systems Analyst',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(16,'Clerical',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(17,'Client Services &amp; Customer Support',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(18,'Computer Hardware',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(19,'Computer Networking',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(20,'Consultant',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(21,'Content Writer',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(22,'Corporate Affairs',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(23,'Creative Design',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(24,'Creative Writer',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(25,'Customer Support',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(26,'Data Entry',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(27,'Data Entry Operator',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(28,'Database Administration (DBA)',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(29,'Development',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(30,'Distribution &amp; Logistics',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(31,'Education &amp; Training',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(32,'Electronics Technician',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(33,'Engineering',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(34,'Engineering Construction',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(35,'Executive Management',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(36,'Executive Secretary',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(37,'Field Operations',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(38,'Front Desk Clerk',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(39,'Front Desk Officer',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(40,'Graphic Design',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(41,'Hardware',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(42,'Health &amp; Medicine',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(43,'Health &amp; Safety',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(44,'Health Care',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(45,'Health Related',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(46,'Hotel Management',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(47,'Hotel/Restaurant Management',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(48,'HR',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(49,'Human Resources',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(50,'Import &amp; Export',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(51,'Industrial Production',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(52,'Installation &amp; Repair',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(53,'Interior Designers &amp; Architects',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(54,'Intern',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(55,'Internship',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(56,'Investment Operations',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(57,'IT Security',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(58,'IT Systems Analyst',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(59,'Legal &amp; Corporate Affairs',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(60,'Legal Affairs',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(61,'Legal Research',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(62,'Logistics &amp; Warehousing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(63,'Maintenance/Repair',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(64,'Management Consulting',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(65,'Management Information System (MIS)',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(66,'Managerial',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(67,'Manufacturing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(68,'Manufacturing &amp; Operations',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(69,'Marketing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(70,'Marketing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(71,'Media - Print &amp; Electronic',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(72,'Media &amp; Advertising',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(73,'Medical',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(74,'Medicine',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(75,'Merchandising',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(76,'Merchandising &amp; Product Management',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(77,'Monitoring &amp; Evaluation (M&amp;E)',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(78,'Network Administration',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(79,'Network Operation',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(80,'Online Advertising',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(81,'Online Marketing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(82,'Operations',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(83,'Planning',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(84,'Planning &amp; Development',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(85,'PR',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(86,'Print Media',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(87,'Printing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(88,'Procurement',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(89,'Product Developer',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(90,'Product Development',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(91,'Product Development',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(92,'Product Management',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(93,'Production',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(94,'Production &amp; Quality Control',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(95,'Project Management',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(96,'Project Management Consultant',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(97,'Public Relations',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(98,'QA',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(99,'QC',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(100,'Qualitative Research',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(101,'Quality Assurance (QA)',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(102,'Quality Control',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(103,'Quality Inspection',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(104,'Recruiting',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(105,'Recruitment',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(106,'Repair &amp; Overhaul',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(107,'Research &amp; Development (R&amp;D)',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(108,'Research &amp; Evaluation',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(109,'Research &amp; Fellowships',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(110,'Researcher',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(111,'Restaurant Management',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(112,'Retail',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(113,'Retail &amp; Wholesale',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(114,'Retail Buyer',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(115,'Retail Buying',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(116,'Retail Merchandising',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(117,'Safety &amp; Environment',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(118,'Sales',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(119,'Sales &amp; Business Development',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(120,'Sales Support',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(121,'Search Engine Optimization (SEO)',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(122,'Secretarial, Clerical &amp; Front Office',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(123,'Security',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(124,'Security &amp; Environment',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(125,'Security Guard',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(126,'SEM',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(127,'SMO',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(128,'Software &amp; Web Development',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(129,'Software Engineer',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(130,'Software Testing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(131,'Stores &amp; Warehousing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(132,'Supply Chain',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(133,'Supply Chain Management',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(134,'Systems Analyst',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(135,'Teachers/Education, Training &amp; Development',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(136,'Technical Writer',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(137,'Tele Sale Representative',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(138,'Telemarketing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(139,'Training &amp; Development',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(140,'Transportation &amp; Warehousing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(141,'TSR',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(142,'Typing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(143,'Warehousing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(144,'Web Developer',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(145,'Web Marketing',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(146,'Writer',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(147,'PR',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(148,'QA',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(149,'QC',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(150,'SEM',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(151,'SMO',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(152,'TSR',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(153,'HR',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(154,'QA',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(155,'QC',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38'),(156,'SEM',0,0,'published','2024-03-27 08:37:38','2024-03-27 08:37:38');
/*!40000 ALTER TABLE `jb_functional_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_functional_areas_translations`
--

DROP TABLE IF EXISTS `jb_functional_areas_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_functional_areas_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_functional_areas_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_functional_areas_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_functional_areas_translations`
--

LOCK TABLES `jb_functional_areas_translations` WRITE;
/*!40000 ALTER TABLE `jb_functional_areas_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_functional_areas_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_invoice_items`
--

DROP TABLE IF EXISTS `jb_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jb_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_invoice_items`
--

LOCK TABLES `jb_invoice_items` WRITE;
/*!40000 ALTER TABLE `jb_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_invoices`
--

DROP TABLE IF EXISTS `jb_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `payment_id` int unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jb_invoices_code_unique` (`code`),
  KEY `jb_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `jb_invoices_payment_id_index` (`payment_id`),
  KEY `jb_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_invoices`
--

LOCK TABLES `jb_invoices` WRITE;
/*!40000 ALTER TABLE `jb_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_experiences`
--

DROP TABLE IF EXISTS `jb_job_experiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_experiences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_experiences`
--

LOCK TABLES `jb_job_experiences` WRITE;
/*!40000 ALTER TABLE `jb_job_experiences` DISABLE KEYS */;
INSERT INTO `jb_job_experiences` VALUES (1,'Fresh',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(2,'Less Than 1 Year',1,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(3,'1 Year',2,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(4,'2 Year',3,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(5,'3 Year',4,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(6,'4 Year',5,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(7,'5 Year',6,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(8,'6 Year',7,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(9,'7 Year',8,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(10,'8 Year',9,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(11,'9 Year',10,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(12,'10 Year',11,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40');
/*!40000 ALTER TABLE `jb_job_experiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_experiences_translations`
--

DROP TABLE IF EXISTS `jb_job_experiences_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_experiences_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_experiences_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_experiences_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_experiences_translations`
--

LOCK TABLES `jb_job_experiences_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_experiences_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_experiences_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_shifts`
--

DROP TABLE IF EXISTS `jb_job_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_shifts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_shifts`
--

LOCK TABLES `jb_job_shifts` WRITE;
/*!40000 ALTER TABLE `jb_job_shifts` DISABLE KEYS */;
INSERT INTO `jb_job_shifts` VALUES (1,'First Shift (Day)',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(2,'Second Shift (Afternoon)',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(3,'Third Shift (Night)',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(4,'Rotating',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40');
/*!40000 ALTER TABLE `jb_job_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_shifts_translations`
--

DROP TABLE IF EXISTS `jb_job_shifts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_shifts_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_shifts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_shifts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_shifts_translations`
--

LOCK TABLES `jb_job_shifts_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_shifts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_shifts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_skills`
--

DROP TABLE IF EXISTS `jb_job_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_skills` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_skills`
--

LOCK TABLES `jb_job_skills` WRITE;
/*!40000 ALTER TABLE `jb_job_skills` DISABLE KEYS */;
INSERT INTO `jb_job_skills` VALUES (1,'JavaScript',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(2,'PHP',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(3,'Python',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(4,'Laravel',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(5,'CakePHP',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(6,'WordPress',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(7,'Flutter',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(8,'FilamentPHP',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(9,'React.js',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40');
/*!40000 ALTER TABLE `jb_job_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_skills_translations`
--

DROP TABLE IF EXISTS `jb_job_skills_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_skills_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_skills_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_skills_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_skills_translations`
--

LOCK TABLES `jb_job_skills_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_skills_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_skills_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_types`
--

DROP TABLE IF EXISTS `jb_job_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_types`
--

LOCK TABLES `jb_job_types` WRITE;
/*!40000 ALTER TABLE `jb_job_types` DISABLE KEYS */;
INSERT INTO `jb_job_types` VALUES (1,'Contract',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(2,'Freelance',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(3,'Full Time',0,1,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(4,'Internship',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40'),(5,'Part Time',0,0,'published','2024-03-27 08:37:40','2024-03-27 08:37:40');
/*!40000 ALTER TABLE `jb_job_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_job_types_translations`
--

DROP TABLE IF EXISTS `jb_job_types_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_job_types_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_job_types_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_job_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_job_types_translations`
--

LOCK TABLES `jb_job_types_translations` WRITE;
/*!40000 ALTER TABLE `jb_job_types_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_job_types_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs`
--

DROP TABLE IF EXISTS `jb_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  `apply_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_id` bigint unsigned DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `is_freelance` tinyint unsigned NOT NULL DEFAULT '0',
  `career_level_id` bigint unsigned DEFAULT NULL,
  `salary_from` decimal(15,2) unsigned DEFAULT NULL,
  `salary_to` decimal(15,2) unsigned DEFAULT NULL,
  `salary_range` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hour',
  `currency_id` bigint unsigned DEFAULT NULL,
  `degree_level_id` bigint unsigned DEFAULT NULL,
  `job_shift_id` bigint unsigned DEFAULT NULL,
  `job_experience_id` bigint unsigned DEFAULT NULL,
  `functional_area_id` bigint unsigned DEFAULT NULL,
  `hide_salary` tinyint(1) NOT NULL DEFAULT '0',
  `number_of_positions` int unsigned NOT NULL DEFAULT '1',
  `expire_date` date DEFAULT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `views` int unsigned NOT NULL DEFAULT '0',
  `number_of_applied` int unsigned NOT NULL DEFAULT '0',
  `hide_company` tinyint(1) NOT NULL DEFAULT '0',
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `external_apply_clicks` int unsigned NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `moderation_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `employer_colleagues` text COLLATE utf8mb4_unicode_ci,
  `start_date` date DEFAULT NULL,
  `application_closing_date` date DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs`
--

LOCK TABLES `jb_jobs` WRITE;
/*!40000 ALTER TABLE `jb_jobs` DISABLE KEYS */;
INSERT INTO `jb_jobs` VALUES (1,'UI / UX Designer full-time','Est ut veritatis et facilis aspernatur. Dicta sint harum sit nisi eos. Ea voluptas velit nam quasi non. Maiores maxime quidem consequatur minima ut dolores pariatur.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',18,NULL,5,5,5,0,5,3000.00,10900.00,'daily',1,6,1,5,77,0,8,'2024-05-15',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.818372','-76.164432',0,0,1,0,'published','approved','2024-03-10 03:16:56','2024-03-27 08:37:41',NULL,NULL,NULL,NULL),(2,'Full Stack Engineer','Nihil voluptatibus dolores neque repellendus adipisci. Qui natus dolores hic molestiae animi ut. Et qui eos fuga quibusdam pariatur eaque nihil.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','https://google.com',13,NULL,1,1,1,0,1,2200.00,11400.00,'hourly',0,10,4,3,51,0,10,'2024-04-11',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.135535','-74.823826',0,0,0,0,'published','approved','2024-02-01 18:07:12','2024-03-27 08:37:41',NULL,NULL,NULL,NULL),(3,'Java Software Engineer','Ad sint sit quis et. Voluptatum expedita esse sed aut quia totam et et. Placeat quaerat aliquam veritatis fuga iure.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,6,6,6,0,5,6500.00,15100.00,'yearly',1,8,3,4,102,0,3,'2024-05-01',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.091795','-75.731317',0,0,0,1,'published','approved','2024-02-28 16:06:49','2024-03-27 08:37:41',NULL,NULL,NULL,NULL),(4,'Digital Marketing Manager','Laborum nostrum animi esse et. Similique expedita maxime sit est. Suscipit quod ut saepe neque quis cum velit.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,2,2,2,0,4,7200.00,9200.00,'yearly',1,7,4,3,72,0,10,'2024-05-17',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.573681','-75.514204',0,0,0,0,'published','approved','2024-02-16 23:41:27','2024-03-27 08:37:41',NULL,NULL,NULL,NULL),(5,'Frontend Developer','Assumenda omnis eaque dicta. Impedit quo eligendi minus quibusdam rerum. Distinctio reprehenderit expedita eius maxime quod in.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',19,NULL,2,2,2,0,2,6300.00,10500.00,'monthly',0,10,4,2,34,0,2,'2024-04-03',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.707444','-75.739672',0,0,1,0,'published','approved','2024-01-29 07:39:13','2024-03-27 08:37:41',NULL,NULL,NULL,NULL),(6,'React Native Web Developer','Et qui veniam accusantium numquam animi. Laboriosam adipisci corrupti veniam assumenda quaerat similique voluptatem. Facilis numquam velit id qui.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',14,NULL,3,3,3,0,2,4300.00,13400.00,'hourly',1,2,3,3,140,0,6,'2024-05-18',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.936168','-75.927649',0,0,1,1,'published','approved','2024-03-24 12:32:38','2024-03-27 08:37:41',NULL,NULL,NULL,NULL),(7,'Senior System Engineer','Voluptas odit dolore minima nesciunt iusto natus. Omnis aliquid id rerum omnis et quaerat consequatur. Aliquam nesciunt et suscipit.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,2,2,2,0,2,2900.00,9100.00,'yearly',1,9,4,4,25,0,2,'2024-04-27',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.573681','-75.514204',0,0,1,1,'published','approved','2024-02-25 23:58:29','2024-03-27 08:37:41',NULL,NULL,NULL,NULL),(8,'Products Manager','Autem pariatur consequatur in nulla animi facere. Laboriosam asperiores ipsum laboriosam est omnis tempore. Eius rerum facere et sequi nesciunt voluptatem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,2,2,2,0,2,2600.00,12200.00,'yearly',0,3,2,4,65,0,2,'2024-04-30',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.032065','-75.026182',0,0,1,1,'published','approved','2024-03-06 08:53:44','2024-03-27 08:37:41',NULL,NULL,NULL,NULL),(9,'Lead Quality Control QA','Rerum ut sit aut porro. Quis aut quisquam eligendi sed maxime voluptatem. Ut aliquid similique quos velit.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',15,NULL,2,2,2,0,1,6300.00,13800.00,'yearly',1,10,3,2,111,0,5,'2024-04-02',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.539923','-76.499894',0,0,0,0,'published','approved','2024-02-15 14:12:56','2024-03-27 08:37:41',NULL,NULL,NULL,NULL),(10,'Principal Designer, Design Systems','Rerum sint velit dolorem aut aut fuga dignissimos ut. Numquam officiis eos a. Soluta libero aut ipsum omnis. Qui non enim corporis laudantium.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,4,4,4,0,1,800.00,9600.00,'yearly',0,7,2,5,105,0,8,'2024-04-06',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.697688','-75.295835',0,0,1,1,'published','approved','2024-02-21 13:59:56','2024-03-27 08:37:41',NULL,NULL,NULL,NULL),(11,'DevOps Architect','Officia est labore aliquid temporibus earum est sint. Est eligendi animi ut. Quia quaerat accusamus impedit non.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,6,6,6,0,1,6500.00,13500.00,'yearly',0,1,2,1,121,0,2,'2024-04-20',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.091795','-75.731317',0,0,1,0,'published','approved','2024-02-28 09:22:49','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(12,'Senior Software Engineer, npm CLI','Maiores reiciendis quasi quidem modi. Aut saepe odio non. Nam voluptatem alias vitae maxime ea. Qui repellendus non eos quia praesentium veniam dolores.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,2,2,2,0,3,6300.00,14300.00,'hourly',1,8,2,1,85,0,7,'2024-04-27',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.573681','-75.514204',0,0,0,1,'published','approved','2024-03-11 01:52:25','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(13,'Senior Systems Engineer','Quae officiis est quisquam. Similique ipsam tempore pariatur est. Laudantium repellat corporis ut et eos laborum repellendus. Sint aliquam quam est ut et repudiandae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',13,NULL,1,1,1,0,1,2000.00,2700.00,'monthly',1,3,4,2,40,0,10,'2024-04-15',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.135535','-74.823826',0,0,1,0,'published','approved','2024-02-19 06:01:29','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(14,'Software Engineer Actions Platform','Qui dicta qui omnis aut et. Non reprehenderit esse quis recusandae dolor fugiat labore. Ipsum illum doloribus quasi sequi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',1,NULL,3,3,3,0,1,9900.00,19500.00,'hourly',0,5,3,5,62,0,4,'2024-05-08',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.718679','-75.820883',0,0,1,0,'published','approved','2024-02-20 01:53:10','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(15,'Staff Engineering Manager, Actions','Aut omnis enim qui excepturi reiciendis et deserunt et. Eum velit excepturi sunt voluptatem molestiae. Modi porro numquam autem magni earum. Animi quo quibusdam dolores et totam et.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,1,1,1,0,4,8500.00,15900.00,'hourly',1,6,1,1,37,0,7,'2024-05-04',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.882768','-75.7555',0,0,0,1,'published','approved','2024-02-04 06:37:03','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(16,'Staff Engineering Manager: Actions Runtime','Cum rerum est officiis maxime. Aliquid quibusdam quasi non odio tenetur odit doloribus. Ipsum architecto dolorem ad at sed temporibus et excepturi. Amet facere ex amet labore.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',1,NULL,3,3,3,0,2,1500.00,10000.00,'yearly',1,1,4,5,104,0,2,'2024-05-08',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.718679','-75.820883',0,0,1,1,'published','approved','2024-02-23 03:05:43','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(17,'Staff Engineering Manager, Packages','Dolor et molestiae inventore consequuntur qui. Dolor facere odio velit. Labore rerum voluptas quod eos dolore praesentium et qui.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',1,NULL,3,3,3,0,5,7100.00,8700.00,'weekly',0,8,2,2,124,0,9,'2024-04-03',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.718679','-75.820883',0,0,0,1,'published','approved','2024-02-16 04:05:19','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(18,'Staff Software Engineer','Et in quisquam aut quisquam dolorem. Dolore ducimus molestiae sint voluptatem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,6,6,6,0,5,2000.00,3300.00,'hourly',0,1,4,4,78,0,5,'2024-04-23',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.091795','-75.731317',0,0,0,1,'published','approved','2024-02-06 03:41:30','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(19,'Systems Software Engineer','Voluptate quia ratione et et ipsa id. Qui aut quasi non saepe libero quis. Libero odio quam eos ex illum earum.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',1,NULL,3,3,3,0,3,500.00,1600.00,'yearly',0,3,1,4,14,0,3,'2024-04-25',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.718679','-75.820883',0,0,1,1,'published','approved','2024-03-16 10:06:43','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(20,'Senior Compensation Analyst','Alias sit quod dolorem veniam architecto. Velit eaque quia repellat perferendis. Facere suscipit aliquam officia voluptatibus est. Ex qui enim et enim nesciunt.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,1,1,1,0,4,2700.00,10300.00,'daily',0,7,1,3,66,0,3,'2024-05-22',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.666396','-76.638258',0,0,1,1,'published','approved','2024-03-10 03:41:57','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(21,'Senior Accessibility Program Manager','Deleniti vero rerum qui magni ut ad qui similique. Voluptates qui magnam omnis. Quia magnam aliquid mollitia et dolores modi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',15,NULL,2,2,2,0,2,6900.00,10800.00,'hourly',0,10,3,5,8,0,5,'2024-05-18',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.539923','-76.499894',0,0,0,0,'published','approved','2024-02-01 08:07:35','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(22,'Analyst Relations Manager, Application Security','Perspiciatis sed laborum aut et. Magnam soluta consequatur totam facere tenetur. Consectetur quia rerum ut laudantium quae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',15,NULL,2,2,2,0,3,6500.00,10100.00,'daily',1,5,2,4,101,0,8,'2024-04-09',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.539923','-76.499894',0,0,1,0,'published','approved','2024-03-07 04:13:09','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(23,'Senior Enterprise Advocate, EMEA','Dolorum minus similique quasi libero quaerat. Aut id eos voluptatem eligendi aut sunt voluptate a. Neque autem qui aut sint delectus id sit molestias. Qui deserunt tempora assumenda.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,2,2,2,0,4,7100.00,9900.00,'hourly',0,2,1,2,68,0,7,'2024-05-24',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.032065','-75.026182',0,0,1,0,'published','approved','2024-03-17 18:59:36','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(24,'Deal Desk Manager','Ea animi voluptas labore aperiam aut reprehenderit. Sit necessitatibus error quasi quisquam ex voluptas. Earum iure debitis corporis et sit qui qui minima. Quia voluptates aut quia iure autem hic.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,2,2,2,0,3,9100.00,12200.00,'monthly',1,9,4,4,85,0,10,'2024-04-26',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.573681','-75.514204',0,0,0,0,'published','approved','2024-03-27 06:40:23','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(25,'Director, Revenue Compensation','In et voluptatem voluptate facilis sapiente quia. Quidem et quis non. Veritatis velit odio aliquam neque.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',2,NULL,4,4,4,0,4,8900.00,13600.00,'hourly',0,9,1,2,15,0,8,'2024-04-12',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.963984','-74.778512',0,0,1,1,'published','approved','2024-02-11 22:02:46','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(26,'Program Manager','Sit ut quis perspiciatis rerum vitae. Asperiores ea modi reprehenderit eligendi. Non perspiciatis velit dignissimos rerum. Hic officiis dolores perspiciatis velit voluptatem quidem vel.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,2,2,2,0,3,3200.00,6000.00,'hourly',0,1,4,5,67,0,2,'2024-04-25',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.573681','-75.514204',0,0,1,1,'published','approved','2024-02-07 14:42:28','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(27,'Sr. Manager, Deal Desk - INTL','Illo tempora dolores blanditiis qui deleniti earum excepturi voluptas. Consequuntur explicabo maxime qui sed. Soluta ex quo enim atque vel velit repudiandae.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,6,6,6,0,1,1800.00,9700.00,'weekly',0,8,2,3,153,0,3,'2024-05-01',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.091795','-75.731317',0,0,1,1,'published','approved','2024-02-18 05:00:06','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(28,'Senior Director, Product Management, Actions Runners and Compute Services','Sunt labore minus nostrum nam. Rerum ad quo expedita consequatur. Ad et nam voluptatibus id rem amet voluptas qui. Aliquid necessitatibus voluptas excepturi et.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',11,NULL,5,5,5,0,4,1400.00,10900.00,'daily',0,4,1,2,52,0,3,'2024-04-02',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.437435','-76.599087',0,0,0,1,'published','approved','2024-03-10 07:27:48','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(29,'Alliances Director','Earum unde ut accusantium ut error blanditiis praesentium sed. Ut vel fugiat est ut autem. Voluptatem quasi ratione repudiandae vero eveniet.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,2,2,2,0,5,2900.00,5400.00,'monthly',1,5,2,3,48,0,2,'2024-05-27',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.032065','-75.026182',0,0,0,0,'published','approved','2024-03-03 11:22:38','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(30,'Corporate Sales Representative','Id consequatur sint vel eligendi natus. Et quia quasi illo voluptas et. Sed autem eum dolor sit qui et.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,4,4,4,0,3,1300.00,10100.00,'yearly',0,8,2,5,40,0,2,'2024-04-13',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.697688','-75.295835',0,0,1,1,'published','approved','2024-03-12 04:39:18','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(31,'Country Leader','Quibusdam incidunt tenetur repudiandae excepturi. Reprehenderit repudiandae saepe assumenda eum tempore aspernatur cupiditate.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',2,NULL,4,4,4,0,1,7900.00,14500.00,'daily',1,3,2,1,49,0,8,'2024-04-27',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.963984','-74.778512',0,0,0,0,'published','approved','2024-02-12 05:58:51','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(32,'Customer Success Architect','Est esse laborum veniam impedit ut in repudiandae. Quaerat et quisquam sequi eligendi explicabo ut. Quia rem sunt eum libero ut cumque.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,1,1,1,0,1,1900.00,8100.00,'yearly',0,5,4,2,36,0,4,'2024-04-11',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.882768','-75.7555',0,0,1,0,'published','approved','2024-02-19 04:34:03','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(33,'DevOps Account Executive - US Public Sector','Ipsum tempore quo sunt debitis sequi numquam at. Aut repellat et ea quo voluptas. Iste fuga beatae id voluptatem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,1,1,1,0,1,3200.00,11100.00,'daily',1,6,2,2,128,0,6,'2024-04-19',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.882768','-75.7555',0,0,1,0,'published','approved','2024-03-13 19:14:52','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(34,'Enterprise Account Executive','Quidem libero repellendus dolores quia et voluptatem. Quidem harum maxime nisi repellendus ut voluptatibus similique. Et sit quo aperiam consequatur quaerat.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,1,1,1,0,3,5200.00,14600.00,'weekly',1,7,2,1,153,0,2,'2024-04-24',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.005103','-75.480224',0,0,1,1,'published','approved','2024-02-20 11:52:18','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(35,'Senior Engineering Manager, Product Security Engineering - Paved Paths','Maiores dolor harum cupiditate ea fuga iusto. Natus consequatur ipsum fuga quo quaerat sint at. Non quia tenetur expedita quisquam repellat ut ad.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,1,1,1,0,3,7700.00,15100.00,'yearly',1,2,1,5,100,0,3,'2024-05-20',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.666396','-76.638258',0,0,1,0,'published','approved','2024-02-13 10:51:49','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(36,'Customer Reliability Engineer III','Molestiae aut autem odio. Culpa temporibus atque natus nostrum dolores consequuntur fugiat. Et labore pariatur incidunt quae repellat cum. Sapiente itaque itaque laborum natus ab deserunt architecto.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',3,NULL,5,5,5,0,5,4300.00,7800.00,'weekly',1,9,3,1,90,0,8,'2024-05-18',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.804952','-76.714921',0,0,1,0,'published','approved','2024-02-04 17:32:31','2024-03-27 08:37:42',NULL,NULL,NULL,NULL),(37,'Support Engineer (Enterprise Support Japanese)','Sed magni aut deserunt ex deleniti deleniti occaecati. Corrupti et maxime et. Natus est eligendi dolorem.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',16,NULL,6,6,6,0,2,5400.00,11000.00,'yearly',0,5,2,2,146,0,7,'2024-04-27',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.091795','-75.731317',0,0,1,0,'published','approved','2024-01-28 17:38:01','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(38,'Technical Partner Manager','Sed pariatur voluptate libero ut. Non ullam in eaque doloremque occaecati. Nemo perferendis soluta placeat quis.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',6,NULL,2,2,2,0,3,3900.00,7000.00,'daily',0,10,2,3,116,0,2,'2024-05-23',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.032065','-75.026182',0,0,0,1,'published','approved','2024-02-13 07:38:08','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(39,'Sr Manager, Inside Account Management','Reprehenderit alias ea sequi eaque asperiores. Amet ut voluptate sequi in doloremque necessitatibus. Distinctio ut libero ullam magnam similique.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',13,NULL,1,1,1,0,5,4500.00,7400.00,'yearly',0,10,3,4,115,0,6,'2024-04-23',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.135535','-74.823826',0,0,1,1,'published','approved','2024-03-23 03:39:05','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(40,'Services Sales Representative','Sit porro et distinctio aliquid architecto. Sit doloribus asperiores vel fuga voluptatum. Doloremque excepturi impedit dolor at et hic hic. Nobis earum earum eligendi voluptate et nemo vel.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,1,1,1,0,3,4000.00,8700.00,'weekly',1,9,1,4,95,0,8,'2024-04-26',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.882768','-75.7555',0,0,1,0,'published','approved','2024-03-13 23:38:54','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(41,'Services Delivery Manager','A eaque ea ut quisquam soluta voluptatem officia. Fuga voluptas et minus quis maxime. Aliquid iste eveniet est pariatur nihil incidunt quia quod.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,1,1,1,0,1,6200.00,8800.00,'daily',0,6,3,2,93,0,6,'2024-04-28',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.882768','-75.7555',0,0,0,1,'published','approved','2024-03-19 17:27:22','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(42,'Senior Solutions Engineer','Deserunt est distinctio omnis provident. Commodi sed hic est debitis ullam odit.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',1,NULL,3,3,3,0,5,5900.00,14800.00,'yearly',1,7,3,2,76,0,8,'2024-04-11',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.718679','-75.820883',0,0,0,1,'published','approved','2024-02-03 08:48:31','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(43,'Senior Service Delivery Engineer','Vero quo non sequi aut accusantium velit minus. Laudantium dolore ea culpa rem. Enim et perferendis accusantium ut tempora minima.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',7,NULL,4,4,4,0,4,8700.00,15500.00,'hourly',1,9,3,3,19,0,2,'2024-05-18',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.697688','-75.295835',0,0,0,0,'published','approved','2024-03-15 18:21:53','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(44,'Senior Director, Global Sales Development','Ipsum qui sed debitis optio velit architecto nihil. Perspiciatis ut odit corrupti vel voluptatum non aut ut. Error voluptate harum sed magni omnis.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',5,NULL,2,2,2,0,4,2300.00,4000.00,'yearly',0,5,2,5,100,0,5,'2024-04-03',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.573681','-75.514204',0,0,0,1,'published','approved','2024-03-06 18:01:19','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(45,'Partner Program Manager','Aut veniam ipsam quo reprehenderit. Ut commodi consectetur qui temporibus sunt. Harum occaecati at ea nisi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',8,NULL,2,2,2,0,2,8100.00,11300.00,'yearly',1,6,1,1,108,0,3,'2024-04-09',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.891706','-76.711788',0,0,0,0,'published','approved','2024-03-16 21:30:47','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(46,'Principal Cloud Solutions Engineer','Debitis ut aliquam enim mollitia. Doloremque voluptatem consectetur aut qui. Totam itaque et earum provident. Amet quia architecto est distinctio.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',8,NULL,2,2,2,0,1,6700.00,7300.00,'weekly',0,3,1,4,154,0,8,'2024-04-29',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.891706','-76.711788',0,0,1,0,'published','approved','2024-02-03 03:00:53','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(47,'Senior Cloud Solutions Engineer','Beatae quo animi distinctio eum distinctio nemo. Modi qui ut a et voluptate. Nam voluptatum aut dolores assumenda omnis.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',12,NULL,1,1,1,0,4,1500.00,5100.00,'yearly',0,10,4,2,47,0,4,'2024-04-09',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.005103','-75.480224',0,0,1,1,'published','approved','2024-02-15 08:39:51','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(48,'Senior Customer Success Manager','Aut dolorum minima id omnis iusto vel. Quidem alias et et. Numquam vero molestiae illo recusandae id enim. Dolor perspiciatis alias accusantium mollitia pariatur praesentium iste.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',9,NULL,1,1,1,0,5,9400.00,16900.00,'yearly',0,8,2,2,76,0,3,'2024-04-16',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.400464','-74.880817',0,0,0,1,'published','approved','2024-02-02 22:06:03','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(49,'Inside Account Manager','Consequuntur non ipsa suscipit reprehenderit. Vel hic aut impedit distinctio dolores. Officia ut aspernatur et ea eum neque voluptatibus. Aut facilis tempore nihil sed aut.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',13,NULL,1,1,1,0,4,9600.00,18300.00,'daily',0,5,4,5,134,0,2,'2024-04-12',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'43.135535','-74.823826',0,0,0,1,'published','approved','2024-03-13 20:09:25','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(50,'UX Jobs Board','Adipisci voluptatem sit est laudantium. Illo neque nemo voluptatem fugiat. Est voluptatum nihil maiores laborum voluptas quia expedita. Hic excepturi perspiciatis ducimus id.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',10,NULL,1,1,1,0,2,6700.00,11900.00,'daily',0,8,3,4,108,0,9,'2024-04-21',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.882768','-75.7555',0,0,1,1,'published','approved','2024-02-16 05:30:55','2024-03-27 08:37:43',NULL,NULL,NULL,NULL),(51,'Senior Laravel Developer (TALL Stack)','Consectetur repudiandae id earum commodi illum quo deserunt. Quo repellendus error ea. Iusto nostrum minus dignissimos laudantium ea quasi.','<h5>Responsibilities</h5>\n                <div>\n                    <p>As a Product Designer, you will work within a Product Delivery Team fused with UX, engineering, product and data talent.</p>\n                    <ul>\n                        <li>Have sound knowledge of commercial activities.</li>\n                        <li>Build next-generation web applications with a focus on the client side</li>\n                        <li>Work on multiple projects at once, and consistently meet draft deadlines</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Revise the work of previous designers to create a unified aesthetic for our brand materials</li>\n                    </ul>\n                </div>\n                <h5>Qualification </h5>\n                <div>\n                    <ul>\n                        <li>B.C.A / M.C.A under National University course complete.</li>\n                        <li>3 or more years of professional design experience</li>\n                        <li>have already graduated or are currently in any year of study</li>\n                        <li>Advanced degree or equivalent experience in graphic and web design</li>\n                    </ul>\n                </div>','',20,NULL,1,1,1,0,3,5500.00,11200.00,'daily',1,1,1,5,24,0,9,'2024-05-11',1,'Botble\\JobBoard\\Models\\Account',0,0,0,'42.666396','-76.638258',0,0,1,0,'published','approved','2024-01-30 03:16:21','2024-03-27 08:37:43',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jb_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_categories`
--

DROP TABLE IF EXISTS `jb_jobs_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_categories` (
  `job_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_categories`
--

LOCK TABLES `jb_jobs_categories` WRITE;
/*!40000 ALTER TABLE `jb_jobs_categories` DISABLE KEYS */;
INSERT INTO `jb_jobs_categories` VALUES (1,1),(1,3),(1,8),(2,1),(2,3),(2,9),(3,1),(3,4),(3,9),(4,1),(4,3),(4,7),(5,1),(5,4),(5,8),(6,1),(6,2),(6,10),(7,1),(7,3),(7,9),(8,1),(8,5),(8,8),(9,1),(9,3),(9,10),(10,1),(10,4),(10,8),(11,1),(11,4),(11,7),(12,1),(12,4),(12,8),(13,1),(13,2),(13,10),(14,1),(14,2),(14,6),(15,1),(15,2),(15,9),(16,1),(16,2),(16,6),(17,1),(17,5),(17,7),(18,1),(18,3),(18,6),(19,1),(19,2),(19,10),(20,1),(20,3),(20,9),(21,1),(21,2),(21,6),(22,1),(22,3),(22,8),(23,1),(23,5),(23,6),(24,1),(24,3),(24,8),(25,1),(25,4),(25,10),(26,1),(26,2),(26,8),(27,1),(27,2),(27,6),(28,1),(28,3),(28,9),(29,1),(29,5),(29,8),(30,1),(30,5),(30,9),(31,1),(31,3),(31,10),(32,1),(32,3),(32,7),(33,1),(33,4),(33,7),(34,1),(34,5),(34,10),(35,1),(35,4),(35,8),(36,1),(36,4),(36,9),(37,1),(37,3),(37,9),(38,1),(38,4),(38,6),(39,1),(39,4),(39,9),(40,1),(40,3),(40,10),(41,1),(41,3),(41,7),(42,1),(42,2),(42,8),(43,1),(43,4),(43,9),(44,1),(44,4),(44,6),(45,1),(45,2),(45,8),(46,1),(46,2),(46,7),(47,1),(47,2),(47,6),(48,1),(48,5),(48,8),(49,1),(49,2),(49,6),(50,1),(50,3),(50,10),(51,1),(51,5),(51,9);
/*!40000 ALTER TABLE `jb_jobs_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_skills`
--

DROP TABLE IF EXISTS `jb_jobs_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_skills` (
  `job_id` bigint unsigned NOT NULL,
  `job_skill_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_skills`
--

LOCK TABLES `jb_jobs_skills` WRITE;
/*!40000 ALTER TABLE `jb_jobs_skills` DISABLE KEYS */;
INSERT INTO `jb_jobs_skills` VALUES (1,4),(2,3),(3,3),(4,8),(5,2),(6,4),(7,7),(8,8),(9,1),(10,3),(11,8),(12,5),(13,4),(14,3),(15,5),(16,7),(17,3),(18,6),(19,4),(20,3),(21,4),(22,7),(23,1),(24,6),(25,6),(26,2),(27,8),(28,8),(29,9),(30,8),(31,3),(32,9),(33,9),(34,3),(35,7),(36,8),(37,9),(38,6),(39,3),(40,2),(41,9),(42,4),(43,2),(44,4),(45,5),(46,9),(47,9),(48,2),(49,4),(50,5),(51,3);
/*!40000 ALTER TABLE `jb_jobs_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_tags`
--

DROP TABLE IF EXISTS `jb_jobs_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_tags` (
  `job_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`job_id`,`tag_id`),
  KEY `jb_jobs_tags_job_id_index` (`job_id`),
  KEY `jb_jobs_tags_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_tags`
--

LOCK TABLES `jb_jobs_tags` WRITE;
/*!40000 ALTER TABLE `jb_jobs_tags` DISABLE KEYS */;
INSERT INTO `jb_jobs_tags` VALUES (1,4),(1,8),(2,4),(2,7),(3,2),(3,5),(4,3),(4,7),(5,1),(5,7),(6,3),(6,8),(7,3),(7,8),(8,2),(8,5),(9,2),(9,5),(10,3),(10,5),(11,3),(11,5),(12,4),(12,6),(13,1),(13,6),(14,1),(14,8),(15,1),(15,6),(16,4),(16,8),(17,2),(17,5),(18,1),(18,8),(19,2),(19,5),(20,4),(20,5),(21,3),(21,7),(22,3),(22,7),(23,2),(23,6),(24,4),(24,7),(25,1),(25,8),(26,4),(26,8),(27,1),(27,6),(28,2),(28,7),(29,1),(29,6),(30,3),(30,8),(31,2),(31,5),(32,2),(32,8),(33,1),(33,7),(34,4),(34,8),(35,2),(35,8),(36,4),(36,8),(37,1),(37,7),(38,2),(38,8),(39,2),(39,6),(40,3),(40,6),(41,2),(41,8),(42,4),(42,5),(43,4),(43,6),(44,1),(44,8),(45,4),(45,6),(46,1),(46,8),(47,1),(47,5),(48,4),(48,8),(49,4),(49,7),(50,2),(50,7),(51,4),(51,8);
/*!40000 ALTER TABLE `jb_jobs_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_translations`
--

DROP TABLE IF EXISTS `jb_jobs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_jobs_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`jb_jobs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_translations`
--

LOCK TABLES `jb_jobs_translations` WRITE;
/*!40000 ALTER TABLE `jb_jobs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_jobs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_jobs_types`
--

DROP TABLE IF EXISTS `jb_jobs_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_jobs_types` (
  `job_id` bigint unsigned NOT NULL,
  `job_type_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_jobs_types`
--

LOCK TABLES `jb_jobs_types` WRITE;
/*!40000 ALTER TABLE `jb_jobs_types` DISABLE KEYS */;
INSERT INTO `jb_jobs_types` VALUES (1,5),(2,1),(3,2),(4,3),(5,3),(6,3),(7,1),(8,1),(9,1),(10,3),(11,5),(12,2),(13,3),(14,3),(15,2),(16,1),(17,2),(18,4),(19,4),(20,5),(21,3),(22,2),(23,3),(24,3),(25,4),(26,5),(27,1),(28,2),(29,3),(30,1),(31,3),(32,3),(33,2),(34,4),(35,5),(36,1),(37,4),(38,3),(39,1),(40,1),(41,5),(42,5),(43,5),(44,3),(45,4),(46,5),(47,3),(48,5),(49,3),(50,5),(51,1);
/*!40000 ALTER TABLE `jb_jobs_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_language_levels`
--

DROP TABLE IF EXISTS `jb_language_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_language_levels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_language_levels`
--

LOCK TABLES `jb_language_levels` WRITE;
/*!40000 ALTER TABLE `jb_language_levels` DISABLE KEYS */;
INSERT INTO `jb_language_levels` VALUES (1,'Expert',0,0,'published','2024-03-27 08:37:41','2024-03-27 08:37:41'),(2,'Intermediate',0,0,'published','2024-03-27 08:37:41','2024-03-27 08:37:41'),(3,'Beginner',0,0,'published','2024-03-27 08:37:41','2024-03-27 08:37:41');
/*!40000 ALTER TABLE `jb_language_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_language_levels_translations`
--

DROP TABLE IF EXISTS `jb_language_levels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_language_levels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_language_levels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_language_levels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_language_levels_translations`
--

LOCK TABLES `jb_language_levels_translations` WRITE;
/*!40000 ALTER TABLE `jb_language_levels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_language_levels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_major_subjects`
--

DROP TABLE IF EXISTS `jb_major_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_major_subjects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_major_subjects`
--

LOCK TABLES `jb_major_subjects` WRITE;
/*!40000 ALTER TABLE `jb_major_subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_major_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_packages`
--

DROP TABLE IF EXISTS `jb_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `percent_save` int unsigned DEFAULT '0',
  `number_of_listings` int unsigned NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `account_limit` int unsigned DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_packages`
--

LOCK TABLES `jb_packages` WRITE;
/*!40000 ALTER TABLE `jb_packages` DISABLE KEYS */;
INSERT INTO `jb_packages` VALUES (1,'Free First Post',0.00,1,0,1,0,1,0,'published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(2,'Single Post',250.00,1,0,1,0,NULL,1,'published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(3,'5 Posts',1000.00,1,20,5,0,NULL,0,'published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL);
/*!40000 ALTER TABLE `jb_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_packages_translations`
--

DROP TABLE IF EXISTS `jb_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_packages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_packages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_packages_translations`
--

LOCK TABLES `jb_packages_translations` WRITE;
/*!40000 ALTER TABLE `jb_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_reviews`
--

DROP TABLE IF EXISTS `jb_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reviewable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint unsigned NOT NULL,
  `created_by_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by_id` bigint unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `review` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_unique` (`reviewable_id`,`reviewable_type`,`created_by_id`,`created_by_type`),
  KEY `jb_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`),
  KEY `jb_reviews_created_by_type_created_by_id_index` (`created_by_type`,`created_by_id`),
  KEY `jb_reviews_reviewable_id_reviewable_type_status_index` (`reviewable_id`,`reviewable_type`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_reviews`
--

LOCK TABLES `jb_reviews` WRITE;
/*!40000 ALTER TABLE `jb_reviews` DISABLE KEYS */;
INSERT INTO `jb_reviews` VALUES (1,'Botble\\JobBoard\\Models\\Account',80,'Botble\\JobBoard\\Models\\Company',6,5.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(2,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',62,2.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(3,'Botble\\JobBoard\\Models\\Company',1,'Botble\\JobBoard\\Models\\Account',28,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(4,'Botble\\JobBoard\\Models\\Account',25,'Botble\\JobBoard\\Models\\Company',5,5.00,'Good app, good backup service and support. Good documentation.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(5,'Botble\\JobBoard\\Models\\Account',80,'Botble\\JobBoard\\Models\\Company',11,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(6,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',5,2.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(7,'Botble\\JobBoard\\Models\\Account',48,'Botble\\JobBoard\\Models\\Company',6,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(8,'Botble\\JobBoard\\Models\\Company',5,'Botble\\JobBoard\\Models\\Account',81,3.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(9,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',74,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(10,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',25,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(11,'Botble\\JobBoard\\Models\\Company',2,'Botble\\JobBoard\\Models\\Account',24,1.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(12,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',43,4.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(13,'Botble\\JobBoard\\Models\\Company',15,'Botble\\JobBoard\\Models\\Account',58,4.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(14,'Botble\\JobBoard\\Models\\Account',30,'Botble\\JobBoard\\Models\\Company',13,2.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(15,'Botble\\JobBoard\\Models\\Account',19,'Botble\\JobBoard\\Models\\Company',7,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(16,'Botble\\JobBoard\\Models\\Company',13,'Botble\\JobBoard\\Models\\Account',25,4.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(17,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',68,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(18,'Botble\\JobBoard\\Models\\Account',13,'Botble\\JobBoard\\Models\\Company',10,5.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(19,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',64,2.00,'Good app, good backup service and support. Good documentation.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(20,'Botble\\JobBoard\\Models\\Account',90,'Botble\\JobBoard\\Models\\Company',13,2.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(21,'Botble\\JobBoard\\Models\\Company',5,'Botble\\JobBoard\\Models\\Account',6,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(22,'Botble\\JobBoard\\Models\\Account',53,'Botble\\JobBoard\\Models\\Company',2,5.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(23,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',70,3.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(24,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',87,3.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(25,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',72,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(26,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',67,3.00,'Clean & perfect source code','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(27,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',42,4.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(28,'Botble\\JobBoard\\Models\\Account',48,'Botble\\JobBoard\\Models\\Company',3,2.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(29,'Botble\\JobBoard\\Models\\Company',11,'Botble\\JobBoard\\Models\\Account',36,2.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(30,'Botble\\JobBoard\\Models\\Company',17,'Botble\\JobBoard\\Models\\Account',26,3.00,'Best ecommerce CMS online store!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(31,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',87,5.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(32,'Botble\\JobBoard\\Models\\Company',19,'Botble\\JobBoard\\Models\\Account',15,4.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(33,'Botble\\JobBoard\\Models\\Account',51,'Botble\\JobBoard\\Models\\Company',7,4.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(34,'Botble\\JobBoard\\Models\\Company',3,'Botble\\JobBoard\\Models\\Account',75,2.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(35,'Botble\\JobBoard\\Models\\Account',9,'Botble\\JobBoard\\Models\\Company',14,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(36,'Botble\\JobBoard\\Models\\Account',94,'Botble\\JobBoard\\Models\\Company',15,4.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(37,'Botble\\JobBoard\\Models\\Account',26,'Botble\\JobBoard\\Models\\Company',15,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(38,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',79,5.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(39,'Botble\\JobBoard\\Models\\Account',76,'Botble\\JobBoard\\Models\\Company',5,5.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(40,'Botble\\JobBoard\\Models\\Account',72,'Botble\\JobBoard\\Models\\Company',4,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(41,'Botble\\JobBoard\\Models\\Company',18,'Botble\\JobBoard\\Models\\Account',8,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(42,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',82,4.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(43,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',74,5.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(44,'Botble\\JobBoard\\Models\\Company',12,'Botble\\JobBoard\\Models\\Account',47,1.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(45,'Botble\\JobBoard\\Models\\Account',22,'Botble\\JobBoard\\Models\\Company',12,5.00,'Clean & perfect source code','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(46,'Botble\\JobBoard\\Models\\Company',10,'Botble\\JobBoard\\Models\\Account',94,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(47,'Botble\\JobBoard\\Models\\Account',100,'Botble\\JobBoard\\Models\\Company',12,5.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(48,'Botble\\JobBoard\\Models\\Account',98,'Botble\\JobBoard\\Models\\Company',16,5.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(49,'Botble\\JobBoard\\Models\\Company',14,'Botble\\JobBoard\\Models\\Account',58,5.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(51,'Botble\\JobBoard\\Models\\Account',68,'Botble\\JobBoard\\Models\\Company',13,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(52,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',2,5.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(53,'Botble\\JobBoard\\Models\\Account',26,'Botble\\JobBoard\\Models\\Company',18,4.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(54,'Botble\\JobBoard\\Models\\Company',5,'Botble\\JobBoard\\Models\\Account',99,1.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot BOTBLE Teams','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(55,'Botble\\JobBoard\\Models\\Account',46,'Botble\\JobBoard\\Models\\Company',5,2.00,'Best ecommerce CMS online store!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(56,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',91,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(57,'Botble\\JobBoard\\Models\\Company',2,'Botble\\JobBoard\\Models\\Account',51,2.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(58,'Botble\\JobBoard\\Models\\Account',39,'Botble\\JobBoard\\Models\\Company',8,3.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(59,'Botble\\JobBoard\\Models\\Account',86,'Botble\\JobBoard\\Models\\Company',17,3.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(60,'Botble\\JobBoard\\Models\\Company',5,'Botble\\JobBoard\\Models\\Account',71,5.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(61,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',77,1.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(62,'Botble\\JobBoard\\Models\\Company',20,'Botble\\JobBoard\\Models\\Account',60,2.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(63,'Botble\\JobBoard\\Models\\Account',1,'Botble\\JobBoard\\Models\\Company',14,5.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(64,'Botble\\JobBoard\\Models\\Account',46,'Botble\\JobBoard\\Models\\Company',2,3.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(65,'Botble\\JobBoard\\Models\\Company',14,'Botble\\JobBoard\\Models\\Account',73,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(66,'Botble\\JobBoard\\Models\\Account',82,'Botble\\JobBoard\\Models\\Company',14,5.00,'Good app, good backup service and support. Good documentation.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(67,'Botble\\JobBoard\\Models\\Account',65,'Botble\\JobBoard\\Models\\Company',8,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(68,'Botble\\JobBoard\\Models\\Account',59,'Botble\\JobBoard\\Models\\Company',6,5.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(69,'Botble\\JobBoard\\Models\\Company',17,'Botble\\JobBoard\\Models\\Account',30,4.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(70,'Botble\\JobBoard\\Models\\Company',2,'Botble\\JobBoard\\Models\\Account',79,2.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(71,'Botble\\JobBoard\\Models\\Company',15,'Botble\\JobBoard\\Models\\Account',28,3.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(72,'Botble\\JobBoard\\Models\\Company',7,'Botble\\JobBoard\\Models\\Account',53,3.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(73,'Botble\\JobBoard\\Models\\Account',46,'Botble\\JobBoard\\Models\\Company',15,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(74,'Botble\\JobBoard\\Models\\Account',44,'Botble\\JobBoard\\Models\\Company',6,5.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(75,'Botble\\JobBoard\\Models\\Company',6,'Botble\\JobBoard\\Models\\Account',25,1.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(76,'Botble\\JobBoard\\Models\\Company',10,'Botble\\JobBoard\\Models\\Account',92,3.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(78,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',10,1.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(79,'Botble\\JobBoard\\Models\\Account',53,'Botble\\JobBoard\\Models\\Company',8,1.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(80,'Botble\\JobBoard\\Models\\Account',80,'Botble\\JobBoard\\Models\\Company',16,5.00,'Great system, great support, good job Botble. I\'m looking forward to more great functional plugins.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(81,'Botble\\JobBoard\\Models\\Company',10,'Botble\\JobBoard\\Models\\Account',100,4.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(82,'Botble\\JobBoard\\Models\\Account',45,'Botble\\JobBoard\\Models\\Company',2,4.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(83,'Botble\\JobBoard\\Models\\Account',29,'Botble\\JobBoard\\Models\\Company',4,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(84,'Botble\\JobBoard\\Models\\Account',80,'Botble\\JobBoard\\Models\\Company',10,3.00,'Clean & perfect source code','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(85,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',50,1.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(86,'Botble\\JobBoard\\Models\\Account',95,'Botble\\JobBoard\\Models\\Company',15,4.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the Botble team was really fast & helpful. You guys are awesome!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(87,'Botble\\JobBoard\\Models\\Company',8,'Botble\\JobBoard\\Models\\Account',71,1.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(88,'Botble\\JobBoard\\Models\\Account',46,'Botble\\JobBoard\\Models\\Company',13,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(89,'Botble\\JobBoard\\Models\\Company',19,'Botble\\JobBoard\\Models\\Account',100,4.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(90,'Botble\\JobBoard\\Models\\Account',14,'Botble\\JobBoard\\Models\\Company',1,2.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the Botble Fans.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(91,'Botble\\JobBoard\\Models\\Company',9,'Botble\\JobBoard\\Models\\Account',73,5.00,'Second or third time that I buy a Botble product, happy with the products and support. You guys do a good job :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(92,'Botble\\JobBoard\\Models\\Company',16,'Botble\\JobBoard\\Models\\Account',35,1.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(93,'Botble\\JobBoard\\Models\\Account',80,'Botble\\JobBoard\\Models\\Company',18,3.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(94,'Botble\\JobBoard\\Models\\Account',17,'Botble\\JobBoard\\Models\\Company',4,3.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(95,'Botble\\JobBoard\\Models\\Account',35,'Botble\\JobBoard\\Models\\Company',3,1.00,'Good app, good backup service and support. Good documentation.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(96,'Botble\\JobBoard\\Models\\Company',5,'Botble\\JobBoard\\Models\\Account',78,4.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(97,'Botble\\JobBoard\\Models\\Company',4,'Botble\\JobBoard\\Models\\Account',11,2.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that Botble puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at Botble are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you Botble :)','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(98,'Botble\\JobBoard\\Models\\Company',2,'Botble\\JobBoard\\Models\\Account',21,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(99,'Botble\\JobBoard\\Models\\Company',14,'Botble\\JobBoard\\Models\\Account',5,4.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-03-27 08:38:23','2024-03-27 08:38:23'),(100,'Botble\\JobBoard\\Models\\Company',2,'Botble\\JobBoard\\Models\\Account',40,4.00,'Amazing code, amazing support. Overall, im really confident in Botble and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-03-27 08:38:23','2024-03-27 08:38:23');
/*!40000 ALTER TABLE `jb_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_saved_jobs`
--

DROP TABLE IF EXISTS `jb_saved_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_saved_jobs` (
  `account_id` bigint unsigned NOT NULL,
  `job_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`account_id`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_saved_jobs`
--

LOCK TABLES `jb_saved_jobs` WRITE;
/*!40000 ALTER TABLE `jb_saved_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_saved_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_tags`
--

DROP TABLE IF EXISTS `jb_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_tags`
--

LOCK TABLES `jb_tags` WRITE;
/*!40000 ALTER TABLE `jb_tags` DISABLE KEYS */;
INSERT INTO `jb_tags` VALUES (1,'Illustrator','','published','2024-03-27 08:37:41','2024-03-27 08:37:41'),(2,'Adobe XD','','published','2024-03-27 08:37:41','2024-03-27 08:37:41'),(3,'Figma','','published','2024-03-27 08:37:41','2024-03-27 08:37:41'),(4,'Sketch','','published','2024-03-27 08:37:41','2024-03-27 08:37:41'),(5,'Lunacy','','published','2024-03-27 08:37:41','2024-03-27 08:37:41'),(6,'PHP','','published','2024-03-27 08:37:41','2024-03-27 08:37:41'),(7,'Python','','published','2024-03-27 08:37:41','2024-03-27 08:37:41'),(8,'JavaScript','','published','2024-03-27 08:37:41','2024-03-27 08:37:41');
/*!40000 ALTER TABLE `jb_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_tags_translations`
--

DROP TABLE IF EXISTS `jb_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jb_tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`jb_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_tags_translations`
--

LOCK TABLES `jb_tags_translations` WRITE;
/*!40000 ALTER TABLE `jb_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jb_transactions`
--

DROP TABLE IF EXISTS `jb_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jb_transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `credits` int unsigned NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jb_transactions`
--

LOCK TABLES `jb_transactions` WRITE;
/*!40000 ALTER TABLE `jb_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `jb_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','580a005d3807d4815aa2f313edf1a5af',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','ee41d7fbc6ba47bef034b27291673c2d',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','4d1acedf5b6440299ea5ba1606b2fb60',2,'Botble\\Menu\\Models\\Menu'),(4,'en_US','883dc624c419db4e62d22fb74d96daa8',3,'Botble\\Menu\\Models\\Menu'),(5,'en_US','303ac2eaf3b6ae015d3a2107a77602a8',4,'Botble\\Menu\\Models\\Menu'),(6,'en_US','c14ca7f4dae66f662a3c67765435d558',5,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (41,0,'acer','acer',3,'image/png',285,'our-partners/acer.png','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(42,0,'asus','asus',3,'image/png',314,'our-partners/asus.png','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(43,0,'dell','dell',3,'image/png',296,'our-partners/dell.png','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(44,0,'microsoft','microsoft',3,'image/png',287,'our-partners/microsoft.png','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(45,0,'nokia','nokia',3,'image/png',308,'our-partners/nokia.png','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(46,0,'1','1',4,'image/jpeg',9803,'news/1.jpg','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(47,0,'10','10',4,'image/jpeg',9803,'news/10.jpg','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(48,0,'11','11',4,'image/jpeg',9803,'news/11.jpg','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(49,0,'12','12',4,'image/jpeg',9803,'news/12.jpg','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(50,0,'13','13',4,'image/jpeg',9803,'news/13.jpg','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(51,0,'14','14',4,'image/jpeg',9803,'news/14.jpg','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(52,0,'15','15',4,'image/jpeg',9803,'news/15.jpg','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(53,0,'16','16',4,'image/jpeg',9803,'news/16.jpg','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(54,0,'2','2',4,'image/jpeg',9803,'news/2.jpg','[]','2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(55,0,'3','3',4,'image/jpeg',9803,'news/3.jpg','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(56,0,'4','4',4,'image/jpeg',9803,'news/4.jpg','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(57,0,'5','5',4,'image/jpeg',9803,'news/5.jpg','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(58,0,'6','6',4,'image/jpeg',9803,'news/6.jpg','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(59,0,'7','7',4,'image/jpeg',9803,'news/7.jpg','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(60,0,'8','8',4,'image/jpeg',9803,'news/8.jpg','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(61,0,'9','9',4,'image/jpeg',9803,'news/9.jpg','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(62,0,'cover-image1','cover-image1',4,'image/png',9803,'news/cover-image1.png','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(63,0,'cover-image2','cover-image2',4,'image/png',9803,'news/cover-image2.png','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(64,0,'cover-image3','cover-image3',4,'image/png',9803,'news/cover-image3.png','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(65,0,'img-news1','img-news1',4,'image/png',9803,'news/img-news1.png','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(66,0,'img-news2','img-news2',4,'image/png',9803,'news/img-news2.png','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(67,0,'img-news3','img-news3',4,'image/png',9803,'news/img-news3.png','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(68,0,'1','1',5,'image/jpeg',6977,'galleries/1.jpg','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(69,0,'10','10',5,'image/jpeg',9803,'galleries/10.jpg','[]','2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(70,0,'2','2',5,'image/jpeg',6977,'galleries/2.jpg','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(71,0,'3','3',5,'image/jpeg',6977,'galleries/3.jpg','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(72,0,'4','4',5,'image/jpeg',6977,'galleries/4.jpg','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(73,0,'5','5',5,'image/jpeg',6977,'galleries/5.jpg','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(74,0,'6','6',5,'image/jpeg',6977,'galleries/6.jpg','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(75,0,'7','7',5,'image/jpeg',6977,'galleries/7.jpg','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(76,0,'8','8',5,'image/jpeg',9803,'galleries/8.jpg','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(77,0,'9','9',5,'image/jpeg',9803,'galleries/9.jpg','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(78,0,'widget-banner','widget-banner',6,'image/png',11079,'widgets/widget-banner.png','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(79,0,'404','404',7,'image/png',10947,'general/404.png','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(80,0,'android','android',7,'image/png',477,'general/android.png','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(81,0,'app-store','app-store',7,'image/png',477,'general/app-store.png','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(82,0,'content','content',7,'image/png',1692,'general/content.png','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(83,0,'cover-image','cover-image',7,'image/png',8992,'general/cover-image.png','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(84,0,'customer','customer',7,'image/png',2810,'general/customer.png','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(85,0,'favicon','favicon',7,'image/png',706,'general/favicon.png','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(86,0,'finance','finance',7,'image/png',2460,'general/finance.png','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(87,0,'human','human',7,'image/png',2359,'general/human.png','[]','2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(88,0,'img-about2','img-about2',7,'image/png',36911,'general/img-about2.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(89,0,'lightning','lightning',7,'image/png',2768,'general/lightning.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(90,0,'logo-company','logo-company',7,'image/png',3166,'general/logo-company.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(91,0,'logo-light','logo-light',7,'image/png',2352,'general/logo-light.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(92,0,'logo','logo',7,'image/png',2459,'general/logo.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(93,0,'management','management',7,'image/png',1915,'general/management.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(94,0,'marketing','marketing',7,'image/png',2134,'general/marketing.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(95,0,'newsletter-background-image','newsletter-background-image',7,'image/png',9830,'general/newsletter-background-image.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(96,0,'newsletter-image-left','newsletter-image-left',7,'image/png',4177,'general/newsletter-image-left.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(97,0,'newsletter-image-right','newsletter-image-right',7,'image/png',2886,'general/newsletter-image-right.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(98,0,'research','research',7,'image/png',3206,'general/research.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(99,0,'retail','retail',7,'image/png',2874,'general/retail.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(100,0,'security','security',7,'image/png',2986,'general/security.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(101,0,'img-1','img-1',8,'image/png',2377,'authentication/img-1.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(102,0,'img-2','img-2',8,'image/png',5009,'authentication/img-2.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(103,0,'background-cover-candidate','background-cover-candidate',9,'image/png',436821,'pages/background-cover-candidate.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(104,0,'background_breadcrumb','background_breadcrumb',9,'image/png',6111,'pages/background-breadcrumb.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(105,0,'banner-section-search-box','banner-section-search-box',9,'image/png',20501,'pages/banner-section-search-box.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(106,0,'banner1','banner1',9,'image/png',7381,'pages/banner1.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(107,0,'banner2','banner2',9,'image/png',4920,'pages/banner2.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(108,0,'banner3','banner3',9,'image/png',2472,'pages/banner3.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(109,0,'banner4','banner4',9,'image/png',1952,'pages/banner4.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(110,0,'banner5','banner5',9,'image/png',1545,'pages/banner5.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(111,0,'banner6','banner6',9,'image/png',1609,'pages/banner6.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(112,0,'bg-breadcrumb','bg-breadcrumb',9,'image/png',14250,'pages/bg-breadcrumb.png','[]','2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(113,0,'bg-cat','bg-cat',9,'image/png',60543,'pages/bg-cat.png','[]','2024-03-27 08:37:36','2024-03-27 08:37:36',NULL),(114,0,'bg-left-hiring','bg-left-hiring',9,'image/png',1631,'pages/bg-left-hiring.png','[]','2024-03-27 08:37:36','2024-03-27 08:37:36',NULL),(115,0,'bg-newsletter','bg-newsletter',9,'image/png',4587,'pages/bg-newsletter.png','[]','2024-03-27 08:37:36','2024-03-27 08:37:36',NULL),(116,0,'bg-right-hiring','bg-right-hiring',9,'image/png',3074,'pages/bg-right-hiring.png','[]','2024-03-27 08:37:36','2024-03-27 08:37:36',NULL),(117,0,'controlcard','controlcard',9,'image/png',7404,'pages/controlcard.png','[]','2024-03-27 08:37:36','2024-03-27 08:37:36',NULL),(118,0,'home-page-4-banner','home-page-4-banner',9,'image/png',7596,'pages/home-page-4-banner.png','[]','2024-03-27 08:37:36','2024-03-27 08:37:36',NULL),(119,0,'icon-bottom-banner','icon-bottom-banner',9,'image/png',274,'pages/icon-bottom-banner.png','[]','2024-03-27 08:37:36','2024-03-27 08:37:36',NULL),(120,0,'icon-top-banner','icon-top-banner',9,'image/png',362,'pages/icon-top-banner.png','[]','2024-03-27 08:37:36','2024-03-27 08:37:36',NULL),(121,0,'img-banner','img-banner',9,'image/png',10542,'pages/img-banner.png','[]','2024-03-27 08:37:36','2024-03-27 08:37:36',NULL),(122,0,'img-chart','img-chart',9,'image/png',7549,'pages/img-chart.png','[]','2024-03-27 08:37:36','2024-03-27 08:37:36',NULL),(123,0,'img-job-search','img-job-search',9,'image/png',35569,'pages/img-job-search.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(124,0,'img-profile','img-profile',9,'image/png',9177,'pages/img-profile.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(125,0,'img-single','img-single',9,'image/png',13060,'pages/img-single.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(126,0,'img1','img1',9,'image/png',10246,'pages/img1.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(127,0,'job-tools','job-tools',9,'image/png',2216,'pages/job-tools.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(128,0,'left-job-head','left-job-head',9,'image/png',14956,'pages/left-job-head.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(129,0,'newsletter-left','newsletter-left',9,'image/png',4177,'pages/newsletter-left.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(130,0,'newsletter-right','newsletter-right',9,'image/png',2886,'pages/newsletter-right.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(131,0,'planning-job','planning-job',9,'image/png',1623,'pages/planning-job.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(132,0,'right-job-head','right-job-head',9,'image/png',10955,'pages/right-job-head.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(133,0,'facebook','facebook',10,'image/png',795,'socials/facebook.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(134,0,'linkedin','linkedin',10,'image/png',804,'socials/linkedin.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(135,0,'twitter','twitter',10,'image/png',1029,'socials/twitter.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(136,0,'location1','location1',11,'image/png',5149,'locations/location1.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(137,0,'location2','location2',11,'image/png',5921,'locations/location2.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(138,0,'location3','location3',11,'image/png',5276,'locations/location3.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(139,0,'location4','location4',11,'image/png',5259,'locations/location4.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(140,0,'location5','location5',11,'image/png',5140,'locations/location5.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(141,0,'location6','location6',11,'image/png',4891,'locations/location6.png','[]','2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(142,0,'1','1',12,'image/png',407,'job-categories/1.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(143,0,'10','10',12,'image/png',407,'job-categories/10.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(144,0,'11','11',12,'image/png',407,'job-categories/11.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(145,0,'12','12',12,'image/png',407,'job-categories/12.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(146,0,'13','13',12,'image/png',407,'job-categories/13.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(147,0,'14','14',12,'image/png',407,'job-categories/14.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(148,0,'15','15',12,'image/png',407,'job-categories/15.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(149,0,'16','16',12,'image/png',407,'job-categories/16.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(150,0,'17','17',12,'image/png',407,'job-categories/17.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(151,0,'18','18',12,'image/png',407,'job-categories/18.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(152,0,'19','19',12,'image/png',407,'job-categories/19.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(153,0,'2','2',12,'image/png',407,'job-categories/2.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(154,0,'3','3',12,'image/png',407,'job-categories/3.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(155,0,'4','4',12,'image/png',407,'job-categories/4.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(156,0,'5','5',12,'image/png',407,'job-categories/5.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(157,0,'6','6',12,'image/png',407,'job-categories/6.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(158,0,'7','7',12,'image/png',407,'job-categories/7.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(159,0,'8','8',12,'image/png',407,'job-categories/8.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(160,0,'9','9',12,'image/png',407,'job-categories/9.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(161,0,'img-cover-1','img-cover-1',12,'image/png',33918,'job-categories/img-cover-1.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(162,0,'img-cover-2','img-cover-2',12,'image/png',33918,'job-categories/img-cover-2.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(163,0,'img-cover-3','img-cover-3',12,'image/png',33918,'job-categories/img-cover-3.png','[]','2024-03-27 08:37:39','2024-03-27 08:37:39',NULL),(164,0,'1','1',13,'image/png',598,'companies/1.png','[]','2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(165,0,'2','2',13,'image/png',598,'companies/2.png','[]','2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(166,0,'3','3',13,'image/png',598,'companies/3.png','[]','2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(167,0,'4','4',13,'image/png',598,'companies/4.png','[]','2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(168,0,'5','5',13,'image/png',598,'companies/5.png','[]','2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(169,0,'6','6',13,'image/png',598,'companies/6.png','[]','2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(170,0,'7','7',13,'image/png',598,'companies/7.png','[]','2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(171,0,'8','8',13,'image/png',598,'companies/8.png','[]','2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(172,0,'9','9',13,'image/png',598,'companies/9.png','[]','2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(173,0,'company-cover-image','company-cover-image',13,'image/png',8992,'companies/company-cover-image.png','[]','2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(174,0,'img1','img1',14,'image/png',5706,'jobs/img1.png','[]','2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(175,0,'img2','img2',14,'image/png',5706,'jobs/img2.png','[]','2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(176,0,'img3','img3',14,'image/png',5706,'jobs/img3.png','[]','2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(177,0,'img4','img4',14,'image/png',5706,'jobs/img4.png','[]','2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(178,0,'img5','img5',14,'image/png',5706,'jobs/img5.png','[]','2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(179,0,'img6','img6',14,'image/png',5706,'jobs/img6.png','[]','2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(180,0,'img7','img7',14,'image/png',5706,'jobs/img7.png','[]','2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(181,0,'img8','img8',14,'image/png',5706,'jobs/img8.png','[]','2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(182,0,'img9','img9',14,'image/png',5706,'jobs/img9.png','[]','2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(183,0,'01','01',15,'application/pdf',43496,'resume/01.pdf','[]','2024-03-27 08:37:43','2024-03-27 08:37:43',NULL),(184,0,'1','1',16,'image/png',3090,'avatars/1.png','[]','2024-03-27 08:37:43','2024-03-27 08:37:43',NULL),(185,0,'2','2',16,'image/png',2773,'avatars/2.png','[]','2024-03-27 08:37:43','2024-03-27 08:37:43',NULL),(186,0,'3','3',16,'image/png',2749,'avatars/3.png','[]','2024-03-27 08:37:43','2024-03-27 08:37:43',NULL),(187,0,'1','1',17,'image/png',395380,'covers/1.png','[]','2024-03-27 08:37:43','2024-03-27 08:37:43',NULL),(188,0,'2','2',17,'image/png',1308067,'covers/2.png','[]','2024-03-27 08:37:44','2024-03-27 08:37:44',NULL),(189,0,'3','3',17,'image/png',301502,'covers/3.png','[]','2024-03-27 08:37:44','2024-03-27 08:37:44',NULL),(190,0,'1','1',18,'image/png',4294,'teams/1.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(191,0,'2','2',18,'image/png',4294,'teams/2.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(192,0,'3','3',18,'image/png',4294,'teams/3.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(193,0,'4','4',18,'image/png',4294,'teams/4.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(194,0,'5','5',18,'image/png',4294,'teams/5.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(195,0,'6','6',18,'image/png',4294,'teams/6.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(196,0,'7','7',18,'image/png',4294,'teams/7.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(197,0,'8','8',18,'image/png',4294,'teams/8.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(198,0,'1','1',19,'image/png',3943,'testimonials/1.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(199,0,'2','2',19,'image/png',3943,'testimonials/2.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(200,0,'3','3',19,'image/png',3943,'testimonials/3.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(201,0,'4','4',19,'image/png',3943,'testimonials/4.png','[]','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (3,0,'our-partners',NULL,'our-partners',0,'2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(4,0,'news',NULL,'news',0,'2024-03-27 08:37:32','2024-03-27 08:37:32',NULL),(5,0,'galleries',NULL,'galleries',0,'2024-03-27 08:37:33','2024-03-27 08:37:33',NULL),(6,0,'widgets',NULL,'widgets',0,'2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(7,0,'general',NULL,'general',0,'2024-03-27 08:37:34','2024-03-27 08:37:34',NULL),(8,0,'authentication',NULL,'authentication',0,'2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(9,0,'pages',NULL,'pages',0,'2024-03-27 08:37:35','2024-03-27 08:37:35',NULL),(10,0,'socials',NULL,'socials',0,'2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(11,0,'locations',NULL,'locations',0,'2024-03-27 08:37:37','2024-03-27 08:37:37',NULL),(12,0,'job-categories',NULL,'job-categories',0,'2024-03-27 08:37:38','2024-03-27 08:37:38',NULL),(13,0,'companies',NULL,'companies',0,'2024-03-27 08:37:40','2024-03-27 08:37:40',NULL),(14,0,'jobs',NULL,'jobs',0,'2024-03-27 08:37:41','2024-03-27 08:37:41',NULL),(15,0,'resume',NULL,'resume',0,'2024-03-27 08:37:43','2024-03-27 08:37:43',NULL),(16,0,'avatars',NULL,'avatars',0,'2024-03-27 08:37:43','2024-03-27 08:37:43',NULL),(17,0,'covers',NULL,'covers',0,'2024-03-27 08:37:43','2024-03-27 08:37:43',NULL),(18,0,'teams',NULL,'teams',0,'2024-03-27 08:38:23','2024-03-27 08:38:23',NULL),(19,0,'testimonials',NULL,'testimonials',0,'2024-03-27 08:38:23','2024-03-27 08:38:23',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2024-03-27 08:38:24','2024-03-27 08:38:24');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',1,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(2,1,1,1,'Botble\\Page\\Models\\Page','/homepage-1','fi fi-rr-home',1,'Home 1',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(3,1,1,2,'Botble\\Page\\Models\\Page','/homepage-2','fi fi-rr-home',2,'Home 2',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(4,1,1,3,'Botble\\Page\\Models\\Page','/homepage-3','fi fi-rr-home',3,'Home 3',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(5,1,1,4,'Botble\\Page\\Models\\Page','/homepage-4','fi fi-rr-home',4,'Home 4',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(6,1,1,5,'Botble\\Page\\Models\\Page','/homepage-5','fi fi-rr-home',5,'Home 5',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(7,1,1,6,'Botble\\Page\\Models\\Page','/homepage-6','fi fi-rr-home',6,'Home 6',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(8,1,0,7,'Botble\\Page\\Models\\Page','/jobs',NULL,0,'Find a Job',NULL,'_self',1,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(9,1,8,NULL,NULL,'/jobs?layout=grid','fi fi-rr-briefcase',0,'Jobs Grid',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(10,1,8,NULL,NULL,'/jobs','fi fi-rr-briefcase',0,'Jobs List',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(11,1,8,NULL,NULL,'/jobs/ui-ux-designer-full-time','fi fi-rr-briefcase',0,'Job Details',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(12,1,8,NULL,NULL,'/jobs/full-stack-engineer','fi fi-rr-briefcase',0,'Job External',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(13,1,8,NULL,NULL,'/jobs/java-software-engineer','fi fi-rr-briefcase',0,'Job Hide Company',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(14,1,0,8,'Botble\\Page\\Models\\Page','/companies',NULL,0,'Companies',NULL,'_self',1,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(15,1,14,8,'Botble\\Page\\Models\\Page','/companies','fi fi-rr-briefcase',0,'Companies',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(16,1,14,NULL,NULL,'/companies/linkedin','fi fi-rr-info',0,'Company Details',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(17,1,0,9,'Botble\\Page\\Models\\Page','/candidates',NULL,0,'Candidates',NULL,'_self',1,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(18,1,17,9,'Botble\\Page\\Models\\Page','/candidates','fi fi-rr-user',0,'Candidates Grid',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(19,1,17,NULL,NULL,'/candidates/edythe','fi fi-rr-info',0,'Candidate Details',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(20,1,0,NULL,NULL,'#',NULL,0,'Pages',NULL,'_self',1,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(21,1,20,10,'Botble\\Page\\Models\\Page','/about-us','fi fi-rr-star',0,'About Us',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(22,1,20,11,'Botble\\Page\\Models\\Page','/pricing-plan','fi fi-rr-database',0,'Pricing Plan',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(23,1,20,12,'Botble\\Page\\Models\\Page','/contact','fi fi-rr-paper-plane',0,'Contact Us',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(24,1,20,NULL,NULL,'/register','fi fi-rr-user-add',0,'Register',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(25,1,20,NULL,NULL,'/login','fi fi-rr-fingerprint',0,'Sign in',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(26,1,20,NULL,NULL,'/password/request','fi fi-rr-settings',0,'Reset Password',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(27,1,0,13,'Botble\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',1,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(28,1,27,13,'Botble\\Page\\Models\\Page','/blog','fi fi-rr-edit',0,'Blog Grid',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(29,1,27,NULL,NULL,'/blog/interview-question-why-dont-you-have-a-degree','fi fi-rr-document-signed',0,'Blog Single',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(30,2,0,10,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(31,2,0,NULL,NULL,'#',NULL,0,'Our Team',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(32,2,0,NULL,NULL,'#',NULL,0,'Products',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(33,2,0,12,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(34,3,0,10,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'Feature',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(35,3,0,11,'Botble\\Page\\Models\\Page','/pricing-plan',NULL,0,'Pricing',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(36,3,0,NULL,NULL,'#',NULL,0,'Credit',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(37,3,0,15,'Botble\\Page\\Models\\Page','/faqs',NULL,0,'FAQ',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(38,4,0,NULL,NULL,'#',NULL,0,'iOS',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(39,4,0,NULL,NULL,'#',NULL,0,'Android',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(40,4,0,NULL,NULL,'#',NULL,0,'Microsoft',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(41,4,0,NULL,NULL,'#',NULL,0,'Desktop',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(42,5,0,14,'Botble\\Page\\Models\\Page','/cookie-policy',NULL,0,'Cookie Policy',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(43,5,0,17,'Botble\\Page\\Models\\Page','/terms',NULL,0,'Terms',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24'),(44,5,0,5,'Botble\\Page\\Models\\Page','/homepage-5',NULL,0,'FAQ',NULL,'_self',0,'2024-03-27 08:38:24','2024-03-27 08:38:24');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(2,'Resources','resources','published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(3,'Community','community','published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(4,'Quick links','quick-links','published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(5,'More','more','published','2024-03-27 08:38:24','2024-03-27 08:38:24');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'background_breadcrumb','[\"pages\\/background-breadcrumb.png\"]',10,'Botble\\Page\\Models\\Page','2024-03-27 08:37:32','2024-03-27 08:37:32'),(2,'background_breadcrumb','[\"pages\\/background-breadcrumb.png\"]',12,'Botble\\Page\\Models\\Page','2024-03-27 08:37:32','2024-03-27 08:37:32'),(3,'cover_image','[\"news\\/cover-image1.png\"]',1,'Botble\\Blog\\Models\\Post','2024-03-27 08:37:33','2024-03-27 08:37:33'),(4,'cover_image','[\"news\\/cover-image2.png\"]',2,'Botble\\Blog\\Models\\Post','2024-03-27 08:37:33','2024-03-27 08:37:33'),(5,'cover_image','[\"news\\/cover-image3.png\"]',3,'Botble\\Blog\\Models\\Post','2024-03-27 08:37:33','2024-03-27 08:37:33'),(6,'icon_image','[\"general\\/content.png\"]',1,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(7,'job_category_image','[\"job-categories\\/img-cover-3.png\"]',1,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(8,'icon_image','[\"general\\/research.png\"]',2,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(9,'job_category_image','[\"job-categories\\/img-cover-1.png\"]',2,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(10,'icon_image','[\"general\\/marketing.png\"]',3,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(11,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',3,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(12,'icon_image','[\"general\\/customer.png\"]',4,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(13,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',4,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(14,'icon_image','[\"general\\/finance.png\"]',5,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(15,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',5,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(16,'icon_image','[\"general\\/lightning.png\"]',6,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(17,'job_category_image','[\"job-categories\\/img-cover-1.png\"]',6,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(18,'icon_image','[\"general\\/human.png\"]',7,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(19,'job_category_image','[\"job-categories\\/img-cover-1.png\"]',7,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:39','2024-03-27 08:37:39'),(20,'icon_image','[\"general\\/management.png\"]',8,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:40','2024-03-27 08:37:40'),(21,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',8,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:40','2024-03-27 08:37:40'),(22,'icon_image','[\"general\\/retail.png\"]',9,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:40','2024-03-27 08:37:40'),(23,'job_category_image','[\"job-categories\\/img-cover-1.png\"]',9,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:40','2024-03-27 08:37:40'),(24,'icon_image','[\"general\\/security.png\"]',10,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:40','2024-03-27 08:37:40'),(25,'job_category_image','[\"job-categories\\/img-cover-2.png\"]',10,'Botble\\JobBoard\\Models\\Category','2024-03-27 08:37:40','2024-03-27 08:37:40'),(26,'cover_image','[\"companies\\/company-cover-image.png\"]',1,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(27,'cover_image','[\"companies\\/company-cover-image.png\"]',2,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(28,'cover_image','[\"companies\\/company-cover-image.png\"]',3,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(29,'cover_image','[\"companies\\/company-cover-image.png\"]',4,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(30,'cover_image','[\"companies\\/company-cover-image.png\"]',5,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(31,'cover_image','[\"companies\\/company-cover-image.png\"]',6,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(32,'cover_image','[\"companies\\/company-cover-image.png\"]',7,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(33,'cover_image','[\"companies\\/company-cover-image.png\"]',8,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(34,'cover_image','[\"companies\\/company-cover-image.png\"]',9,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(35,'cover_image','[\"companies\\/company-cover-image.png\"]',10,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(36,'cover_image','[\"companies\\/company-cover-image.png\"]',11,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:40','2024-03-27 08:37:40'),(37,'cover_image','[\"companies\\/company-cover-image.png\"]',12,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:41','2024-03-27 08:37:41'),(38,'cover_image','[\"companies\\/company-cover-image.png\"]',13,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:41','2024-03-27 08:37:41'),(39,'cover_image','[\"companies\\/company-cover-image.png\"]',14,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:41','2024-03-27 08:37:41'),(40,'cover_image','[\"companies\\/company-cover-image.png\"]',15,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:41','2024-03-27 08:37:41'),(41,'cover_image','[\"companies\\/company-cover-image.png\"]',16,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:41','2024-03-27 08:37:41'),(42,'cover_image','[\"companies\\/company-cover-image.png\"]',17,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:41','2024-03-27 08:37:41'),(43,'cover_image','[\"companies\\/company-cover-image.png\"]',18,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:41','2024-03-27 08:37:41'),(44,'cover_image','[\"companies\\/company-cover-image.png\"]',19,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:41','2024-03-27 08:37:41'),(45,'cover_image','[\"companies\\/company-cover-image.png\"]',20,'Botble\\JobBoard\\Models\\Company','2024-03-27 08:37:41','2024-03-27 08:37:41'),(46,'featured_image','[\"jobs\\/img1.png\"]',1,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:41','2024-03-27 08:37:41'),(47,'featured_image','[\"jobs\\/img2.png\"]',2,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:41','2024-03-27 08:37:41'),(48,'featured_image','[\"jobs\\/img3.png\"]',3,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:41','2024-03-27 08:37:41'),(49,'featured_image','[\"jobs\\/img4.png\"]',4,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:41','2024-03-27 08:37:41'),(50,'featured_image','[\"jobs\\/img5.png\"]',5,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:41','2024-03-27 08:37:41'),(51,'featured_image','[\"jobs\\/img6.png\"]',6,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:41','2024-03-27 08:37:41'),(52,'featured_image','[\"jobs\\/img7.png\"]',7,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:41','2024-03-27 08:37:41'),(53,'featured_image','[\"jobs\\/img8.png\"]',8,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:41','2024-03-27 08:37:41'),(54,'featured_image','[\"jobs\\/img9.png\"]',9,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:41','2024-03-27 08:37:41'),(55,'featured_image','[\"jobs\\/img8.png\"]',10,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(56,'featured_image','[\"jobs\\/img1.png\"]',11,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(57,'featured_image','[\"jobs\\/img8.png\"]',12,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(58,'featured_image','[\"jobs\\/img6.png\"]',13,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(59,'featured_image','[\"jobs\\/img1.png\"]',14,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(60,'featured_image','[\"jobs\\/img7.png\"]',15,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(61,'featured_image','[\"jobs\\/img6.png\"]',16,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(62,'featured_image','[\"jobs\\/img6.png\"]',17,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(63,'featured_image','[\"jobs\\/img1.png\"]',18,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(64,'featured_image','[\"jobs\\/img2.png\"]',19,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(65,'featured_image','[\"jobs\\/img9.png\"]',20,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(66,'featured_image','[\"jobs\\/img2.png\"]',21,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(67,'featured_image','[\"jobs\\/img8.png\"]',22,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(68,'featured_image','[\"jobs\\/img1.png\"]',23,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(69,'featured_image','[\"jobs\\/img3.png\"]',24,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(70,'featured_image','[\"jobs\\/img4.png\"]',25,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(71,'featured_image','[\"jobs\\/img7.png\"]',26,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(72,'featured_image','[\"jobs\\/img8.png\"]',27,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(73,'featured_image','[\"jobs\\/img1.png\"]',28,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(74,'featured_image','[\"jobs\\/img9.png\"]',29,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(75,'featured_image','[\"jobs\\/img4.png\"]',30,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(76,'featured_image','[\"jobs\\/img6.png\"]',31,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(77,'featured_image','[\"jobs\\/img4.png\"]',32,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(78,'featured_image','[\"jobs\\/img7.png\"]',33,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(79,'featured_image','[\"jobs\\/img2.png\"]',34,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(80,'featured_image','[\"jobs\\/img6.png\"]',35,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(81,'featured_image','[\"jobs\\/img2.png\"]',36,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:42','2024-03-27 08:37:42'),(82,'featured_image','[\"jobs\\/img5.png\"]',37,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(83,'featured_image','[\"jobs\\/img5.png\"]',38,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(84,'featured_image','[\"jobs\\/img8.png\"]',39,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(85,'featured_image','[\"jobs\\/img8.png\"]',40,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(86,'featured_image','[\"jobs\\/img4.png\"]',41,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(87,'featured_image','[\"jobs\\/img4.png\"]',42,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(88,'featured_image','[\"jobs\\/img2.png\"]',43,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(89,'featured_image','[\"jobs\\/img6.png\"]',44,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(90,'featured_image','[\"jobs\\/img5.png\"]',45,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(91,'featured_image','[\"jobs\\/img5.png\"]',46,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(92,'featured_image','[\"jobs\\/img1.png\"]',47,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(93,'featured_image','[\"jobs\\/img6.png\"]',48,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(94,'featured_image','[\"jobs\\/img5.png\"]',49,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(95,'featured_image','[\"jobs\\/img2.png\"]',50,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(96,'featured_image','[\"jobs\\/img2.png\"]',51,'Botble\\JobBoard\\Models\\Job','2024-03-27 08:37:43','2024-03-27 08:37:43'),(97,'cover_image','[\"covers\\/3.png\"]',1,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:44','2024-03-27 08:37:44'),(98,'cover_image','[\"covers\\/2.png\"]',2,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:45','2024-03-27 08:37:45'),(99,'cover_image','[\"covers\\/2.png\"]',3,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:45','2024-03-27 08:37:45'),(100,'cover_image','[\"covers\\/3.png\"]',4,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:45','2024-03-27 08:37:45'),(101,'cover_image','[\"covers\\/2.png\"]',5,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:46','2024-03-27 08:37:46'),(102,'cover_image','[\"covers\\/2.png\"]',6,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:46','2024-03-27 08:37:46'),(103,'cover_image','[\"covers\\/1.png\"]',7,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:46','2024-03-27 08:37:46'),(104,'cover_image','[\"covers\\/1.png\"]',8,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:47','2024-03-27 08:37:47'),(105,'cover_image','[\"covers\\/2.png\"]',9,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:47','2024-03-27 08:37:47'),(106,'cover_image','[\"covers\\/3.png\"]',10,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:47','2024-03-27 08:37:47'),(107,'cover_image','[\"covers\\/3.png\"]',11,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:48','2024-03-27 08:37:48'),(108,'cover_image','[\"covers\\/2.png\"]',12,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:48','2024-03-27 08:37:48'),(109,'cover_image','[\"covers\\/3.png\"]',13,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:49','2024-03-27 08:37:49'),(110,'cover_image','[\"covers\\/1.png\"]',14,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:49','2024-03-27 08:37:49'),(111,'cover_image','[\"covers\\/1.png\"]',15,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:50','2024-03-27 08:37:50'),(112,'cover_image','[\"covers\\/1.png\"]',16,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:50','2024-03-27 08:37:50'),(113,'cover_image','[\"covers\\/1.png\"]',17,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:50','2024-03-27 08:37:50'),(114,'cover_image','[\"covers\\/3.png\"]',18,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:51','2024-03-27 08:37:51'),(115,'cover_image','[\"covers\\/3.png\"]',19,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:51','2024-03-27 08:37:51'),(116,'cover_image','[\"covers\\/3.png\"]',20,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:52','2024-03-27 08:37:52'),(117,'cover_image','[\"covers\\/3.png\"]',21,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:52','2024-03-27 08:37:52'),(118,'cover_image','[\"covers\\/1.png\"]',22,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:52','2024-03-27 08:37:52'),(119,'cover_image','[\"covers\\/2.png\"]',23,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:53','2024-03-27 08:37:53'),(120,'cover_image','[\"covers\\/3.png\"]',24,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:53','2024-03-27 08:37:53'),(121,'cover_image','[\"covers\\/1.png\"]',25,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:53','2024-03-27 08:37:53'),(122,'cover_image','[\"covers\\/3.png\"]',26,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:54','2024-03-27 08:37:54'),(123,'cover_image','[\"covers\\/2.png\"]',27,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:54','2024-03-27 08:37:54'),(124,'cover_image','[\"covers\\/2.png\"]',28,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:55','2024-03-27 08:37:55'),(125,'cover_image','[\"covers\\/2.png\"]',29,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:55','2024-03-27 08:37:55'),(126,'cover_image','[\"covers\\/2.png\"]',30,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:55','2024-03-27 08:37:55'),(127,'cover_image','[\"covers\\/2.png\"]',31,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:56','2024-03-27 08:37:56'),(128,'cover_image','[\"covers\\/3.png\"]',32,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:56','2024-03-27 08:37:56'),(129,'cover_image','[\"covers\\/3.png\"]',33,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:56','2024-03-27 08:37:56'),(130,'cover_image','[\"covers\\/3.png\"]',34,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:57','2024-03-27 08:37:57'),(131,'cover_image','[\"covers\\/1.png\"]',35,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:57','2024-03-27 08:37:57'),(132,'cover_image','[\"covers\\/1.png\"]',36,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:57','2024-03-27 08:37:57'),(133,'cover_image','[\"covers\\/1.png\"]',37,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:58','2024-03-27 08:37:58'),(134,'cover_image','[\"covers\\/2.png\"]',38,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:58','2024-03-27 08:37:58'),(135,'cover_image','[\"covers\\/1.png\"]',39,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:58','2024-03-27 08:37:58'),(136,'cover_image','[\"covers\\/1.png\"]',40,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:59','2024-03-27 08:37:59'),(137,'cover_image','[\"covers\\/3.png\"]',41,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:59','2024-03-27 08:37:59'),(138,'cover_image','[\"covers\\/1.png\"]',42,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:37:59','2024-03-27 08:37:59'),(139,'cover_image','[\"covers\\/3.png\"]',43,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:00','2024-03-27 08:38:00'),(140,'cover_image','[\"covers\\/3.png\"]',44,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:00','2024-03-27 08:38:00'),(141,'cover_image','[\"covers\\/1.png\"]',45,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:00','2024-03-27 08:38:00'),(142,'cover_image','[\"covers\\/3.png\"]',46,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:01','2024-03-27 08:38:01'),(143,'cover_image','[\"covers\\/1.png\"]',47,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:01','2024-03-27 08:38:01'),(144,'cover_image','[\"covers\\/2.png\"]',48,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:01','2024-03-27 08:38:01'),(145,'cover_image','[\"covers\\/3.png\"]',49,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:02','2024-03-27 08:38:02'),(146,'cover_image','[\"covers\\/2.png\"]',50,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:02','2024-03-27 08:38:02'),(147,'cover_image','[\"covers\\/1.png\"]',51,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:02','2024-03-27 08:38:02'),(148,'cover_image','[\"covers\\/2.png\"]',52,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:03','2024-03-27 08:38:03'),(149,'cover_image','[\"covers\\/3.png\"]',53,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:03','2024-03-27 08:38:03'),(150,'cover_image','[\"covers\\/3.png\"]',54,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:04','2024-03-27 08:38:04'),(151,'cover_image','[\"covers\\/3.png\"]',55,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:04','2024-03-27 08:38:04'),(152,'cover_image','[\"covers\\/3.png\"]',56,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:04','2024-03-27 08:38:04'),(153,'cover_image','[\"covers\\/1.png\"]',57,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:05','2024-03-27 08:38:05'),(154,'cover_image','[\"covers\\/3.png\"]',58,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:05','2024-03-27 08:38:05'),(155,'cover_image','[\"covers\\/2.png\"]',59,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:05','2024-03-27 08:38:05'),(156,'cover_image','[\"covers\\/3.png\"]',60,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:06','2024-03-27 08:38:06'),(157,'cover_image','[\"covers\\/3.png\"]',61,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:06','2024-03-27 08:38:06'),(158,'cover_image','[\"covers\\/1.png\"]',62,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:06','2024-03-27 08:38:06'),(159,'cover_image','[\"covers\\/2.png\"]',63,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:07','2024-03-27 08:38:07'),(160,'cover_image','[\"covers\\/1.png\"]',64,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:07','2024-03-27 08:38:07'),(161,'cover_image','[\"covers\\/2.png\"]',65,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:08','2024-03-27 08:38:08'),(162,'cover_image','[\"covers\\/2.png\"]',66,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:08','2024-03-27 08:38:08'),(163,'cover_image','[\"covers\\/3.png\"]',67,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:08','2024-03-27 08:38:08'),(164,'cover_image','[\"covers\\/1.png\"]',68,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:09','2024-03-27 08:38:09'),(165,'cover_image','[\"covers\\/3.png\"]',69,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:09','2024-03-27 08:38:09'),(166,'cover_image','[\"covers\\/3.png\"]',70,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:10','2024-03-27 08:38:10'),(167,'cover_image','[\"covers\\/1.png\"]',71,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:10','2024-03-27 08:38:10'),(168,'cover_image','[\"covers\\/1.png\"]',72,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:10','2024-03-27 08:38:10'),(169,'cover_image','[\"covers\\/1.png\"]',73,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:11','2024-03-27 08:38:11'),(170,'cover_image','[\"covers\\/1.png\"]',74,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:11','2024-03-27 08:38:11'),(171,'cover_image','[\"covers\\/1.png\"]',75,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:12','2024-03-27 08:38:12'),(172,'cover_image','[\"covers\\/1.png\"]',76,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:12','2024-03-27 08:38:12'),(173,'cover_image','[\"covers\\/2.png\"]',77,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:13','2024-03-27 08:38:13'),(174,'cover_image','[\"covers\\/3.png\"]',78,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:13','2024-03-27 08:38:13'),(175,'cover_image','[\"covers\\/2.png\"]',79,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:14','2024-03-27 08:38:14'),(176,'cover_image','[\"covers\\/2.png\"]',80,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:14','2024-03-27 08:38:14'),(177,'cover_image','[\"covers\\/1.png\"]',81,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:15','2024-03-27 08:38:15'),(178,'cover_image','[\"covers\\/3.png\"]',82,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:15','2024-03-27 08:38:15'),(179,'cover_image','[\"covers\\/1.png\"]',83,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:16','2024-03-27 08:38:16'),(180,'cover_image','[\"covers\\/2.png\"]',84,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:16','2024-03-27 08:38:16'),(181,'cover_image','[\"covers\\/1.png\"]',85,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:17','2024-03-27 08:38:17'),(182,'cover_image','[\"covers\\/2.png\"]',86,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:17','2024-03-27 08:38:17'),(183,'cover_image','[\"covers\\/2.png\"]',87,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:17','2024-03-27 08:38:17'),(184,'cover_image','[\"covers\\/2.png\"]',88,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:18','2024-03-27 08:38:18'),(185,'cover_image','[\"covers\\/1.png\"]',89,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:18','2024-03-27 08:38:18'),(186,'cover_image','[\"covers\\/2.png\"]',90,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:19','2024-03-27 08:38:19'),(187,'cover_image','[\"covers\\/2.png\"]',91,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:19','2024-03-27 08:38:19'),(188,'cover_image','[\"covers\\/3.png\"]',92,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:20','2024-03-27 08:38:20'),(189,'cover_image','[\"covers\\/2.png\"]',93,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:20','2024-03-27 08:38:20'),(190,'cover_image','[\"covers\\/1.png\"]',94,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:20','2024-03-27 08:38:20'),(191,'cover_image','[\"covers\\/2.png\"]',95,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:21','2024-03-27 08:38:21'),(192,'cover_image','[\"covers\\/3.png\"]',96,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:21','2024-03-27 08:38:21'),(193,'cover_image','[\"covers\\/3.png\"]',97,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:22','2024-03-27 08:38:22'),(194,'cover_image','[\"covers\\/1.png\"]',98,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:22','2024-03-27 08:38:22'),(195,'cover_image','[\"covers\\/2.png\"]',99,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:23','2024-03-27 08:38:23'),(196,'cover_image','[\"covers\\/2.png\"]',100,'Botble\\JobBoard\\Models\\Account','2024-03-27 08:38:23','2024-03-27 08:38:23');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2022_04_20_100851_add_index_to_media_table',1),(17,'2022_04_20_101046_add_index_to_menu_table',1),(18,'2022_07_10_034813_move_lang_folder_to_root',1),(19,'2022_08_04_051940_add_missing_column_expires_at',1),(20,'2022_09_01_000001_create_admin_notifications_tables',1),(21,'2022_10_14_024629_drop_column_is_featured',1),(22,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(23,'2022_12_02_093615_update_slug_index_columns',1),(24,'2023_01_30_024431_add_alt_to_media_table',1),(25,'2023_02_16_042611_drop_table_password_resets',1),(26,'2023_04_10_103353_fix_social_links',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_07_19_152743_migrate_old_city_state_image',1),(30,'2023_08_21_090810_make_page_content_nullable',1),(31,'2023_09_14_021936_update_index_for_slugs_table',1),(32,'2023_12_06_100448_change_random_hash_for_media',1),(33,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(34,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(35,'2023_12_20_034718_update_invoice_amount',1),(36,'2015_06_29_025744_create_audit_history',2),(37,'2023_11_14_033417_change_request_column_in_table_audit_histories',2),(38,'2015_06_18_033822_create_blog_table',3),(39,'2021_02_16_092633_remove_default_value_for_author_type',3),(40,'2021_12_03_030600_create_blog_translations',3),(41,'2022_04_19_113923_add_index_to_table_posts',3),(42,'2023_08_29_074620_make_column_author_id_nullable',3),(43,'2016_06_17_091537_create_contacts_table',4),(44,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',4),(45,'2024_03_20_080001_migrate_change_attribute_email_to_nullable_form_contacts_table',4),(46,'2024_03_25_000001_update_captcha_settings_for_contact',4),(47,'2018_07_09_221238_create_faq_table',5),(48,'2021_12_03_082134_create_faq_translations',5),(49,'2023_11_17_063408_add_description_column_to_faq_categories_table',5),(50,'2016_10_13_150201_create_galleries_table',6),(51,'2021_12_03_082953_create_gallery_translations',6),(52,'2022_04_30_034048_create_gallery_meta_translations_table',6),(53,'2023_08_29_075308_make_column_user_id_nullable',6),(54,'2022_06_20_093259_create_job_board_tables',7),(55,'2022_09_12_061845_update_table_activity_logs',7),(56,'2022_09_13_042407_create_table_jb_jobs_types',7),(57,'2022_09_15_030017_update_jb_jobs_table',7),(58,'2022_09_15_094840_add_job_employer_colleagues',7),(59,'2022_09_27_000001_create_jb_invoices_tables',7),(60,'2022_09_30_144924_update_jobs_table',7),(61,'2022_10_04_085631_add_company_logo_to_jb_invoices',7),(62,'2022_10_10_030606_create_reviews_table',7),(63,'2022_11_09_065056_add_missing_jobs_page',7),(64,'2022_11_10_065056_add_columns_to_accounts',7),(65,'2022_11_16_034756_add_column_cover_letter_to_accounts',7),(66,'2022_11_29_304756_create_jb_account_favorite_skills_table',7),(67,'2022_11_29_304757_create_jb_account_favorite_tags',7),(68,'2022_12_26_304758_create_table_jb_experiences',7),(69,'2022_12_26_304759_create_table_jb_education',7),(70,'2023_01_31_023233_create_jb_custom_fields_table',7),(71,'2023_02_06_024257_add_package_translations',7),(72,'2023_02_08_062457_add_custom_fields_translation_table',7),(73,'2023_04_03_126927_add_parent_id_to_jb_categories_table',7),(74,'2023_05_04_000001_add_hide_cv_to_jb_accounts_table',7),(75,'2023_05_09_062031_unique_reviews_table',7),(76,'2023_05_13_180010_make_jb_reviews_table_morphable',7),(77,'2023_05_16_113126_fix_account_confirmed_at',7),(78,'2023_07_03_135746_add_zip_code_to_jb_jobs_table',7),(79,'2023_07_06_022808_create_jb_coupons_table',7),(80,'2023_07_14_045213_add_coupon_code_column_to_jb_invoices_table',7),(81,'2024_01_31_022842_add_description_to_jb_packages_table',7),(82,'2024_02_01_080657_add_tax_id_column_to_jb_companies_table',7),(83,'2016_10_03_032336_create_languages_table',8),(84,'2023_09_14_022423_add_index_for_language_table',8),(85,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(86,'2021_12_03_075608_create_page_translations',9),(87,'2023_07_06_011444_create_slug_translations_table',9),(88,'2019_11_18_061011_create_country_table',10),(89,'2021_12_03_084118_create_location_translations',10),(90,'2021_12_03_094518_migrate_old_location_data',10),(91,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',10),(92,'2022_01_16_085908_improve_plugin_location',10),(93,'2022_08_04_052122_delete_location_backup_tables',10),(94,'2023_04_23_061847_increase_state_translations_abbreviation_column',10),(95,'2023_07_26_041451_add_more_columns_to_location_table',10),(96,'2023_07_27_041451_add_more_columns_to_location_translation_table',10),(97,'2023_08_15_073307_drop_unique_in_states_cities_translations',10),(98,'2023_10_21_065016_make_state_id_in_table_cities_nullable',10),(99,'2017_10_24_154832_create_newsletter_table',11),(100,'2024_03_25_000001_update_captcha_settings_for_newsletter',11),(101,'2017_05_18_080441_create_payment_tables',12),(102,'2021_03_27_144913_add_customer_type_into_table_payments',12),(103,'2021_05_24_034720_make_column_currency_nullable',12),(104,'2021_08_09_161302_add_metadata_column_to_payments_table',12),(105,'2021_10_19_020859_update_metadata_field',12),(106,'2022_06_28_151901_activate_paypal_stripe_plugin',12),(107,'2022_07_07_153354_update_charge_id_in_table_payments',12),(108,'2022_11_02_092723_team_create_team_table',13),(109,'2023_08_11_094574_update_team_table',13),(110,'2023_11_30_085354_add_missing_description_to_team',13),(111,'2018_07_09_214610_create_testimonial_table',14),(112,'2021_12_03_083642_create_testimonials_translations',14),(113,'2016_10_07_193005_create_translations_table',15),(114,'2023_12_12_105220_drop_translations_table',15);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Homepage 1','<div>[search-box title=\"The Easiest Way to Get Your New Job\" highlight_text=\"Easiest Way\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" banner_image_1=\"pages/banner1.png\" icon_top_banner=\"pages/icon-top-banner.png\" banner_image_2=\"pages/banner2.png\" icon_bottom_banner=\"pages/icon-bottom-banner.png\" style=\"style-1\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\"][/featured-job-categories]</div><div>[apply-banner subtitle=\"Let’s Work Together &lt;br\\&gt;&amp; Explore Opportunities\" highlight_sub_title_text=\"Work, Explore\" title_1=\"We are\" title_2=\"HIRING\" button_apply_text=\"Apply\" button_apply_link=\"#\" apply_image_left=\"pages/bg-left-hiring.png\" apply_image_right=\"pages/bg-right-hiring.png\"][/apply-banner]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"4,9,1,3,5,7\" style=\"style-1\"][/job-of-the-day]</div><div>[job-grid title=\"Find The One That’s Right For You\" high_light_title_text=\"Right\" subtitle=\"Millions Of Jobs.\" description=\"Search all the open positions on the web. Get your own personalized salary estimate. Read reviews on over 600,000 companies worldwide. The right job is out there.\" image_job_1=\"pages/img-chart.png\" image_job_2=\"pages/controlcard.png\" image=\"pages/img1.png\" button_text=\"Search jobs\" button_url=\"#\" link_text=\"Learn more\" link_text_url=\"#\"][/job-grid]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\"][/top-companies]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"1,2,3,4,5,6\"][/job-by-location]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(2,'Homepage 2','<div>[search-box subtitle=\"We have 150,000+ live jobs\" title=\"The #1 Job Board for Hiring or Find your next job\" highlight_text=\"Job Board for\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" counter_title_1=\"Daily Jobs Posted\" counter_number_1=\"265\" counter_title_2=\"Recruiters\" counter_number_2=\"17\" counter_title_3=\"Freelancers\" counter_number_3=\"15\" counter_title_4=\"Blog Tips\" counter_number_4=\"28\" background_image=\"pages/banner-section-search-box.png\" style=\"style-2\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"1,2,5,4,7,8\" style=\"style-2\"][/job-of-the-day]</div><div>[popular-category title=\"Popular category\" subtitle=\"Search and connect with the right candidates faster.\"][/popular-category]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"12,46,69,111,121,116,62\" style=\"style-2\"][/job-by-location]</div><div>[counter-section counter_title_1=\"Completed Cases\" counter_description_1=\"We always provide people a complete solution upon focused of any business\" counter_number_1=\"1000\" counter_title_2=\"Our Office\" counter_description_2=\"We always provide people a complete solution upon focused of any business\" counter_number_2=\"1\" counter_title_3=\"Skilled People\" counter_description_3=\"We always provide people a complete solution upon focused of any business\" counter_number_3=\"6\" counter_title_4=\"Happy Clients\" counter_description_4=\"We always provide people a complete solution upon focused of any business\" counter_number_4=\"2\"][/counter-section]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\" style=\"style-2\"][/top-companies]</div><div>[advertisement-banner first_title=\"Job Tools Services\" first_description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet rutrum quam, id faucibus erat interdum a. Curabitur eget tortor a nulla interdum semper.\" load_more_first_content_text=\"Find Out More\" load_more_link_first_content=\"#\" image_of_first_content=\"pages/job-tools.png\" second_title=\"Planning a Job?\" second_description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam laoreet rutrum quam, id faucibus erat interdum a. Curabitur eget tortor a nulla interdum semper.\" load_more_second_content_text=\"Find Out More\" load_more_link_second_content=\"#\" image_of_second_content=\"pages/planning-job.png\"][/advertisement-banner]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(3,'Homepage 3','<div>[search-box title=\"The #1 Job Board for Hiring or Find your next job\" highlight_text=\"Job Board for\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" style=\"style-3\" trending_keywords=\"Design,Development,Manager,Senior\"][/search-box]</div><div>[job-of-the-day title=\"Jobs of the day\" subtitle=\"Search and connect with the right candidates faster.\" job_categories=\"1,2,5,4,7,8\" style=\"style-3\"][/job-of-the-day]</div><div>[top-candidates title=\"Top Candidates\" description=\"Jobs is a curated job board of the best jobs for developers, designers and marketers in the tech industry.\" limit=\"8\" style=\"style-3\"][/top-candidates]</div><div>[top-companies title=\"Top Recruiters\" description=\"Discover your next career move, freelance gig, or internship\" style=\"style-3\"][/top-companies]</div><div>[apply-banner subtitle=\"Let’s Work Together &lt;br\\&gt;&amp; Explore Opportunities\" highlight_sub_title_text=\"Work, Explore\" title_1=\"We are\" title_2=\"HIRING\" button_apply_text=\"Apply\" button_apply_link=\"#\" apply_image_left=\"pages/bg-left-hiring.png\" apply_image_right=\"pages/bg-right-hiring.png\" style=\"style-3\"][/apply-banner]</div><div>[our-partners title=\"Trusted by\" name_1=\"Asus\" url_1=\"https://www.asus.com\" image_1=\"our-partners/asus.png\" name_2=\"Dell\" url_2=\"https://www.dell.com\" image_2=\"our-partners/dell.png\" name_3=\"Microsoft\" url_3=\"https://www.microsoft.com\" image_3=\"our-partners/microsoft.png\" name_4=\"Acer\" url_4=\"https://www.acer.com\" image_4=\"our-partners/acer.png\" name_5=\"Nokia\" url_5=\"https://www.nokia.com\" image_5=\"our-partners/nokia.png\"][/our-partners]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-3\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(4,'Homepage 4','<div>[search-box title=\"Get The Right Job You Deserve\" highlight_text=\"Right Job\" banner_image_1=\"pages/home-page-4-banner.png\" style=\"style-1\" trending_keywords=\"Designer, Web, IOS, Developer, PHP, Senior, Engineer\" background_color=\"#000\"][/search-box]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply discover which is right for you.\" job_categories=\"1,2,3,4,5,6,8,7\" style=\"style-3\"][/job-of-the-day]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\" limit_category=\"10\" background_image=\"pages/bg-cat.png\" style=\"style-2\"][/featured-job-categories]</div><div>[[testimonials title=\"See Some Words\" description=\"Thousands of employee get their ideal jobs and feed back to us!\" style=\"style-2\"][/testimonials]</div><div>[our-partners title=\"Trusted by\" name_1=\"Asus\" url_1=\"https://www.asus.com\" image_1=\"our-partners/asus.png\" name_2=\"Dell\" url_2=\"https://www.dell.com\" image_2=\"our-partners/dell.png\" name_3=\"Microsoft\" url_3=\"https://www.microsoft.com\" image_3=\"our-partners/microsoft.png\" name_4=\"Acer\" url_4=\"https://www.acer.com\" image_4=\"our-partners/acer.png\" name_5=\"Nokia\" url_5=\"https://www.nokia.com\" image_5=\"our-partners/nokia.png\"][/our-partners]</div><div>[popular-category title=\"Popular category\" subtitle=\"Search and connect with the right candidates faster.\"][/popular-category]</div><div>[job-by-location title=\"Jobs by Location\" description=\"Find your favourite jobs and get the benefits of yourself\" city=\"12,46,69,111,121,116,62\" style=\"style-2\"][/job-by-location]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(5,'Homepage 5','<div>[search-box title=\"Find Jobs, &#x3C;br&#x3E; Hire Creatives\" description=\"Each month, more than 3 million job seekers turn to website in their search for work, making over 140,000 applications every single day\" banner_image_1=\"pages/banner1.png\" banner_image_2=\"pages/banner2.png\" banner_image_3=\"pages/banner3.png\" banner_image_4=\"pages/banner4.png\" banner_image_5=\"pages/banner5.png\" banner_image_6=\"pages/banner6.png\" style=\"style-5\"][/search-box]</div><div>[counter-section counter_title_1=\"Completed Cases\" counter_description_1=\"We always provide people a complete solution upon focused of any business\" counter_number_1=\"1000\" counter_title_2=\"Our Office\" counter_description_2=\"We always provide people a complete solution upon focused of any business\" counter_number_2=\"1\" counter_title_3=\"Skilled People\" counter_description_3=\"We always provide people a complete solution upon focused of any business\" counter_number_3=\"6\" counter_title_4=\"Happy Clients\" counter_description_4=\"We always provide people a complete solution upon focused of any business\" counter_number_4=\"2\"][/counter-section]</div><div>[popular-category title=\"Explore the Marketplace\" subtitle=\"Search and connect with the right candidates faster. Tell us what you’ve looking for and we’ll get to work for you.\" style=\"style-5\"][/popular-category]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply &#x3C;br&#x3E; discover which is right for you.\" job_categories=\"1,2,5,4,7,8\" style=\"style-2\"][/job-of-the-day]</div><div>[job-grid style=\"style-2\" title=\"Create Your Personal Account Profile\" subtitle=\"Create Profile\" description=\"Work Profile is a personality assessment that measures an individual\'s work personality through their workplace traits, social and emotional traits; as well as the values and aspirations that drive them forward.\" image=\"pages/img-profile.png\" button_text=\"Create Profile\" button_url=\"/register\"][/job-grid]</div><div>[how-it-works title=\"How It Works\" description=\"Just via some simple steps, you will find your ideal candidates you’r looking for!\" step_label_1=\"Register an &#x3C;br&#x3E; account to start\" step_help_1=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" step_label_2=\"Explore over &#x3C;br&#x3E; thousands of resumes\" step_help_2=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" step_label_3=\"Find the most &#x3C;br&#x3E; suitable candidate\" step_help_3=\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do\" button_label=\"Get Started\" button_url=\"#\"][/how-it-works]</div><div>[top-candidates title=\"Top Candidates\" description=\"Jobs is a curated job board of the best jobs for developers, designers &#x3C;br&#x3E; and marketers in the tech industry.\" limit=\"8\" style=\"style-5\"][/top-candidates]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"Load More Posts\" button_link=\"#\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'homepage',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(6,'Homepage 6','<div>[search-box title=\"There Are 102,256 Postings Here For you!\" highlight_text=\"102,256\" description=\"Find Jobs, Employment & Career Opportunities\" style=\"style-4\" trending_keywords=\"Design,Development,Manager,Senior,,\" background_color=\"#000\"][/search-box]</div><div>[gallery image_1=\"galleries/1.jpg\" image_2=\"galleries/2.jpg\" image_3=\"galleries/3.jpg\" image_4=\"galleries/4.jpg\" image_5=\"galleries/5.jpg\"][/gallery]</div><div>[featured-job-categories title=\"Browse by category\" subtitle=\"Find the job that’s perfect for you. about 800+ new jobs everyday\"][/featured-job-categories]</div><div>[job-grid style=\"style-2\" title=\"Create Your Personal Account Profile\" subtitle=\"Create Profile\" description=\"Work Profile is a personality assessment that measures an individual\'s work personality through their workplace traits, social and emotional traits; as well as the values and aspirations that drive them forward.\" image=\"pages/img-profile.png\" button_text=\"Create Profile\" button_url=\"/register\"][/job-grid]</div><div>[job-of-the-day title=\"Latest Jobs Post\" subtitle=\"Explore the different types of available jobs to apply discover which is right for you.\" job_categories=\"1,2,3,4,5,6\" style=\"style-2\"][/job-of-the-day]</div><div>[job-search-banner title=\"Job search for people passionate about startup\" background_image=\"pages/img-job-search.png\" checkbox_title_1=\"Create an account\" checkbox_description_1=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\" checkbox_title_2=\"Search for Jobs\" checkbox_description_2=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\" checkbox_title_3=\"Save & Apply\" checkbox_description_3=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec justo a quam varius maximus. Maecenas sodales tortor quis tincidunt commodo.\"][/job-search-banner]</div>',1,NULL,'homepage',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(7,'Jobs','<div>[search-box title=\"The official IT Jobs site\" highlight_text=\"IT Jobs\" description=\"“JobBox is our first stop whenever we\'re hiring a PHP role. We\'ve hired 10 PHP developers in the last few years, all thanks to JobBox.” — Andrew Hall, Elite JSC.\" banner_image_1=\"pages/left-job-head.png\" banner_image_2=\"pages/right-job-head.png\" style=\"style-3\" background_color=\"#000\"][/search-box]</div><div>[job-list max_salary_range=\"10000\"][/job-list]</div>',1,NULL,'default',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(8,'Companies','<div>[job-companies title=\"Browse Companies\" subtitle=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque delectus molestias quis?\"][/job-companies]</div>',1,NULL,'default',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(9,'Candidates','<div>[job-candidates title=\"Browse Candidates\" description=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque &#x3C;br&#x3E; delectus molestias quis?\" number_per_page=\"9\" style=\"grid\"][/job-candidates]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" style=\"style-2\"][/news-and-blogs]</div>',1,NULL,'default',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(10,'About us','<div>[company-about title=\"About Our Company\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" title_box=\"What we can do?\" image=\"general/img-about2.png\" description_box=\"Aenean sollicituin, lorem quis bibendum auctor nisi elit consequat ipsum sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet maurisorbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctora ornare odio. Aenean sollicituin, lorem quis bibendum auctor nisi elit consequat ipsum sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet maurisorbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctora ornare odio. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis non nisi purus. Integer sit nostra, per inceptos himenaeos. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis non nisi purus. Integer sit nostra, per inceptos himenaeos.\" url=\"/\" text_button_box=\"Read more\"][/company-about]</div><div>[team title=\"About Our Company\" sub_title=\"OUR COMPANY\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" number_of_people=\"8\"][/team]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"View More\" button_link=\"/blog\" style=\"style-2\"][/news-and-blogs]</div><div>[testimonials title=\"Our Happy Customer\" description=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(11,'Pricing Plan','<div>[pricing-table title=\"Pricing Table\" subtitle=\"Choose The Best Plan That’s For You\" number_of_package=\"3\"][/pricing-table]</div><div>[faq title=\"Frequently Asked Questions\" subtitle=\"Aliquam a augue suscipit, luctus neque purus ipsum neque dolor primis a libero tempus, blandit and cursus varius and magnis sapien\" number_of_faq=\"4\"][/faq]</div><div>[testimonials title=\"Our Happy Customer\" subtitle=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'default',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(12,'Contact','<div>[company-information company_name=\"Jobbox Company\" logo_company=\"general/logo-company.png\" company_address=\"205 North Michigan Avenue, Suite 810 Chicago, 60601, US\" company_phone=\"0543213336\" company_email=\"contact@jobbox.com\" branch_company_name_0=\"London\" branch_company_address_0=\"2118 Thornridge Cir. Syracuse, Connecticut 35624\" branch_company_name_1=\"New York\" branch_company_address_1=\"4517 Washington Ave. Manchester, Kentucky 39495\" branch_company_name_2=\"Chicago\" branch_company_address_2=\"3891 Ranchview Dr. Richardson, California 62639\" branch_company_name_3=\"San Francisco\" branch_company_address_3=\"4140 Parker Rd. Allentown, New Mexico 31134\" branch_company_name_4=\"Sysney\" branch_company_address_4=\"3891 Ranchview Dr. Richardson, California 62639\" branch_company_name_5=\"Singapore\" branch_company_address_5=\"4140 Parker Rd. Allentown, New Mexico 31134\"][/company-information]</div><div>[contact-form title=\"Contact us\" subtitle=\"Get in touch\" description=\"The right move at the right time saves your investment. live the dream of expanding your business.\" image=\"image-contact.png\" show_newsletter=\"yes\"][/contact-form]</div><div>[team title=\"Meet Our Team\" subtitle=\"OUR COMPANY\" description=\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ligula ante, dictum non aliquet eu, dapibus ac quam. Morbi vel ante viverra orci tincidunt tempor eu id ipsum. Sed consectetur, risus a blandit tempor, velit magna pellentesque risus, at congue tellus dui quis nisl.\" number_of_people=\"8\"][/team]</div><div>[news-and-blogs title=\"News and Blog\" subtitle=\"Get the latest news, updates and tips\" button_text=\"View More\" button_link=\"/blog\" style=\"style-2\"][/news-and-blogs]</div><div>[testimonials title=\"Our Happy Customer\" subtitle=\"When it comes to choosing the right web hosting provider, we know how easy it is to get overwhelmed with the number.\"][/testimonials]</div>',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(13,'Blog','---',1,NULL,'page-detail','Get the latest news, updates and tips','published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(14,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><ul><li>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</li><li>Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</li><li>XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</li></ul>',1,NULL,'page-detail-boxed',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(15,'FAQs','<div>[faq title=\"Frequently Asked Questions\" number_of_faq=\"4\"][/faq]</div>',1,NULL,'page-detail',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(16,'Services','<p>Last came a rumbling of little Alice and all the players, except the King, \'that only makes the world am I? Ah, THAT\'S the great hall, with the words came very queer to ME.\' \'You!\' said the Hatter. \'You MUST remember,\' remarked the King, the Queen, who was beginning to write this down on their backs was the BEST butter,\' the March Hare went on. \'Would you like to be no chance of this, so that her flamingo was gone in a trembling voice, \'--and I hadn\'t begun my tea--not above a week or so--and.</p><p>The pepper when he pleases!\' CHORUS. \'Wow! wow! wow!\' While the Duchess to play croquet.\' Then they both sat silent and looked into its eyes again, to see it again, but it all is! I\'ll try and repeat something now. Tell her to begin.\' For, you see, because some of them attempted to explain the paper. \'If there\'s no use now,\' thought poor Alice, that she had not gone far before they saw Alice coming. \'There\'s PLENTY of room!\' said Alice a little glass box that was lying on the same age as.</p><p>Dinah, if I fell off the mushroom, and crawled away in the sun. (IF you don\'t even know what a long time with one of the ground.\' So she stood watching them, and just as she went on \'And how do you call it sad?\' And she opened the door between us. For instance, suppose it were white, but there were any tears. No, there were TWO little shrieks, and more sounds of broken glass, from which she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked.</p><p>Alice hastily replied; \'at least--at least I mean what I should be like then?\' And she opened the door between us. For instance, suppose it doesn\'t mind.\' The table was a body to cut it off from: that he shook both his shoes on. \'--and just take his head contemptuously. \'I dare say you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice to herself. At this moment the door opened inwards, and Alice\'s elbow was pressed hard against it, that attempt proved a failure. Alice heard it.</p>',1,NULL,'page-detail-boxed',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(17,'Terms','<p>Do you think you\'re changed, do you?\' \'I\'m afraid I am, sir,\' said Alice; \'but a grin without a porpoise.\' \'Wouldn\'t it really?\' said Alice hastily; \'but I\'m not used to it as you are; secondly, because they\'re making such a dreadful time.\' So Alice got up this morning, but I THINK I can find it.\' And she began thinking over other children she knew, who might do very well as if she could remember them, all these changes are! I\'m never sure what I\'m going to begin again, it was too late to wish.</p><p>And she\'s such a very short time the Queen in front of them, and it\'ll sit up and down, and felt quite relieved to see if there were no tears. \'If you\'re going to leave off being arches to do next, when suddenly a White Rabbit as he wore his crown over the fire, and at once in her face, and was surprised to find that she might as well say that \"I see what was coming. It was high time you were me?\' \'Well, perhaps you haven\'t found it advisable--\"\' \'Found WHAT?\' said the Mock Turtle replied in a.</p><p>Who ever saw one that size? Why, it fills the whole party look so grave and anxious.) Alice could bear: she got used to it as you might like to show you! A little bright-eyed terrier, you know, as we were. My notion was that you never to lose YOUR temper!\' \'Hold your tongue!\' added the Queen. An invitation for the end of the room. The cook threw a frying-pan after her as hard as it happens; and if it likes.\' \'I\'d rather finish my tea,\' said the Hatter. \'Nor I,\' said the Cat. \'I said pig,\'.</p><p>Presently the Rabbit hastily interrupted. \'There\'s a great hurry, muttering to himself in an offended tone, \'Hm! No accounting for tastes! Sing her \"Turtle Soup,\" will you, won\'t you join the dance. So they got their tails in their proper places--ALL,\' he repeated with great curiosity, and this was of very little use, as it went. So she went on just as she said this she looked up, and began staring at the other, and making faces at him as he found it advisable--\"\' \'Found WHAT?\' said the King.</p>',1,NULL,'page-detail-boxed',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32'),(18,'Job Categories','<div>[search-box title=\"22 Jobs Available Now\" highlight_text=\"22 Jobs\" description=\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero repellendus magni, atque delectus molestias quis?\" banner_image_1=\"pages/left-job-head.png\" banner_image_2=\"pages/right-job-head.png\" style=\"style-3\" background_color=\"#000\"][/search-box]</div><div>[popular-category title=\"Popular category\" limit_category=\"8\" style=\"style-1\"][/popular-category]</div><div>[job-categories title=\"Categories\" subtitle=\"All categories\" limit_category=\"8\"][/job-categories]</div>',1,NULL,'default',NULL,'published','2024-03-27 08:37:32','2024-03-27 08:37:32');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (3,1),(6,1),(3,2),(5,2),(4,3),(7,3);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Interview Question: Why Dont You Have a Degree?','Repudiandae accusantium numquam id quis eos totam aut et. Deleniti aliquam quis natus dolor tenetur eos est ut. Blanditiis ab sed aspernatur in ipsa aut.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Alice; \'you needn\'t be so stingy about it, you know.\' \'Not the same as they lay sprawling about, reminding her very much pleased at having found out that the cause of this remark, and thought it must be getting somewhere near the door as you liked.\' \'Is that all?\' said Alice, whose thoughts were still running on the end of his shrill little voice, the name of the sort. Next came an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a row of lamps hanging from the sky! Ugh, Serpent!\' \'But I\'m NOT a serpent, I tell you!\' But she went on, without attending to her, one on each side, and opened their eyes and mouths so VERY much out of the fact. \'I keep them to sell,\' the Hatter said, turning to Alice. \'Only a thimble,\' said Alice sadly. \'Hand it over a little quicker. \'What a pity it wouldn\'t stay!\' sighed the Hatter. This piece of evidence we\'ve heard yet,\' said the cook. \'Treacle,\' said a whiting to a day-school, too,\' said Alice; \'but a grin without a cat! It\'s the most.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Majesty!\' the soldiers had to double themselves up and said, \'So you think you might like to show you! A little bright-eyed terrier, you know, with oh, such long curly brown hair! And it\'ll fetch things when you come and join the dance. Will you, won\'t you, won\'t you, will you, won\'t you, won\'t you, will you join the dance?\"\' \'Thank you, sir, for your walk!\" \"Coming in a mournful tone, \'he won\'t do a thing as \"I sleep when I grow up, I\'ll write one--but I\'m grown up now,\' she added in an.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>BEE,\" but it was certainly not becoming. \'And that\'s the jury-box,\' thought Alice, and she looked at the top of it. She stretched herself up and down looking for eggs, I know all the other queer noises, would change (she knew) to the door, she walked sadly down the little golden key and hurried upstairs, in great disgust, and walked two and two, as the other.\' As soon as she went down to the Mock Turtle in the distance would take the hint; but the Gryphon answered, very nearly in the sea!\' cried the Mouse, turning to Alice for some time without hearing anything more: at last turned sulky, and would only say, \'I am older than you, and must know better\'; and this Alice thought to herself. \'I dare say you never even spoke to Time!\' \'Perhaps not,\' Alice cautiously replied: \'but I know all sorts of things--I can\'t remember half of them--and it belongs to the door, and the jury asked. \'That I can\'t show it you myself,\' the Mock Turtle replied, counting off the fire, stirring a large pigeon.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Alice: \'I don\'t know what they\'re about!\' \'Read them,\' said the King. The White Rabbit read:-- \'They told me you had been anything near the door that led into the court, \'Bring me the list of the house, quite forgetting in the pool, \'and she sits purring so nicely by the Hatter, with an M?\' said Alice. \'What IS the use of repeating all that stuff,\' the Mock Turtle would be quite as safe to stay in here any longer!\' She waited for a minute or two, looking for eggs, as it can talk: at any rate, there\'s no room at all for any of them. \'I\'m sure those are not the same, shedding gallons of tears, but said nothing. \'When we were little,\' the Mock Turtle in the sea, \'and in that case I can creep under the circumstances. There was a paper label, with the Duchess, it had fallen into the garden, where Alice could hear the name \'W. RABBIT\' engraved upon it. She went on again:-- \'I didn\'t write it, and on both sides at once. The Dormouse had closed its eyes by this time, and was delighted to.</p>','published',3,'Botble\\JobBoard\\Models\\Account',1,'news/img-news1.png',1808,NULL,'2024-03-08 17:19:17','2024-03-08 17:19:17'),(2,'21 Job Interview Tips: How To Make a Great Impression','Nihil labore recusandae in saepe eveniet. Ut cupiditate dolorem aut facilis non blanditiis delectus. Et assumenda debitis ad occaecati nobis et.','<p>Dinah my dear! I wish you wouldn\'t mind,\' said Alice: \'three inches is such a thing. After a time she had to pinch it to her usual height. It was the Hatter. This piece of it at all. \'But perhaps he can\'t help that,\' said the Gryphon, \'she wants for to know when the White Rabbit; \'in fact, there\'s nothing written on the bank, with her friend. When she got used to do:-- \'How doth the little--\"\' and she went on in a frightened tone. \'The Queen of Hearts, and I never knew so much contradicted in her life, and had no idea what a Mock Turtle said: \'I\'m too stiff. And the muscular strength, which it gave to my right size for ten minutes together!\' \'Can\'t remember WHAT things?\' said the Lory, with a teacup in one hand, and Alice thought over all she could not taste theirs, and the reason of that?\' \'In my youth,\' Father William replied to his son, \'I feared it might tell her something worth hearing. For some minutes the whole head appeared, and then said \'The fourth.\' \'Two days wrong!\'.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I know all the jurymen on to himself in an angry voice--the Rabbit\'s--\'Pat! Pat! Where are you?\' And then a great hurry to change the subject of conversation. \'Are you--are you fond--of--of dogs?\' The Mouse gave a look askance-- Said he thanked the whiting kindly, but he would deny it too: but the three were all ornamented with hearts. Next came the guests, mostly Kings and Queens, and among them Alice recognised the White Rabbit, \'but it doesn\'t mind.\' The table was a queer-shaped little.</p><p class=\"text-center\"><img src=\"/storage/news/8.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>I dare say there may be ONE.\' \'One, indeed!\' said the Caterpillar. Alice thought the whole pack of cards, after all. I needn\'t be afraid of it. She went on just as she was looking at the cook tulip-roots instead of onions.\' Seven flung down his face, as long as it can\'t possibly make me larger, it must be really offended. \'We won\'t talk about cats or dogs either, if you cut your finger VERY deeply with a teacup in one hand and a piece of evidence we\'ve heard yet,\' said the Footman. \'That\'s the most important piece of rudeness was more and more faintly came, carried on the twelfth?\' Alice went on, \'and most things twinkled after that--only the March Hare moved into the court, \'Bring me the truth: did you manage to do next, when suddenly a White Rabbit hurried by--the frightened Mouse splashed his way through the door, she walked on in the pool was getting quite crowded with the other: the Duchess asked, with another hedgehog, which seemed to think to herself, \'whenever I eat one of.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>Him, and ourselves, and it. Don\'t let him know she liked them best, For this must ever be A secret, kept from all the jurymen are back in a bit.\' \'Perhaps it doesn\'t matter much,\' thought Alice, \'to pretend to be executed for having missed their turns, and she said aloud. \'I shall sit here,\' he said, turning to the door, she walked down the little door: but, alas! the little creature down, and nobody spoke for some minutes. Alice thought she might as well as the March Hare. Alice sighed wearily. \'I think you might knock, and I could let you out, you know.\' Alice had no pictures or conversations in it, and found that, as nearly as she picked her way out. \'I shall do nothing of tumbling down stairs! How brave they\'ll all think me at home! Why, I wouldn\'t be in before the end of his tail. \'As if it makes rather a handsome pig, I think.\' And she began again. \'I should like to be listening, so she went on planning to herself \'This is Bill,\' she gave her one, they gave him two, You gave us.</p>','published',4,'Botble\\JobBoard\\Models\\Account',1,'news/img-news2.png',904,NULL,'2024-03-19 12:57:47','2024-03-19 12:57:47'),(3,'39 Strengths and Weaknesses To Discuss in a Job Interview','Sapiente amet minima nostrum aut. Esse non in ratione qui aliquam sed ratione. Nihil assumenda tenetur impedit consequatur et mollitia molestiae.','<p>Caterpillar. \'Well, perhaps not,\' said Alice desperately: \'he\'s perfectly idiotic!\' And she began very cautiously: \'But I don\'t like the look of it now in sight, and no room at all know whether it was empty: she did not like the Mock Turtle yet?\' \'No,\' said the last words out loud, and the others looked round also, and all dripping wet, cross, and uncomfortable. The moment Alice appeared, she was coming to, but it is.\' \'Then you may stand down,\' continued the Pigeon, raising its voice to its feet, ran round the hall, but they were nice grand words to say.) Presently she began nursing her child again, singing a sort of lullaby to it in a very curious to know when the race was over. However, when they liked, and left foot, so as to the other, and making faces at him as he found it made no mark; but he now hastily began again, using the ink, that was sitting on the floor, and a large flower-pot that stood near. The three soldiers wandered about in a frightened tone. \'The Queen of.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>White Rabbit, with a teacup in one hand and a fan! Quick, now!\' And Alice was rather glad there WAS no one could possibly hear you.\' And certainly there was a very poor speaker,\' said the Mouse, sharply and very soon came upon a neat little house, and wondering what to beautify is, I can\'t put it to annoy, Because he knows it teases.\' CHORUS. (In which the wretched Hatter trembled so, that Alice said; \'there\'s a large pigeon had flown into her face, and large eyes like a steam-engine when she.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>It was the fan she was not a VERY turn-up nose, much more like a tunnel for some minutes. Alice thought she might find another key on it, and then sat upon it.) \'I\'m glad they don\'t give birthday presents like that!\' He got behind Alice as it happens; and if it makes me grow large again, for really I\'m quite tired and out of breath, and said to herself, \'after such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let him know she liked them best, For this must ever be A secret, kept from all the jurymen are back in a sorrowful tone; \'at least there\'s no use in knocking,\' said the Cat, \'a dog\'s not mad. You grant that?\' \'I suppose they are the jurors.\' She said the Pigeon; \'but I know all sorts of things, and she, oh! she knows such a neck as that! No, no! You\'re a serpent; and there\'s no name signed at the end.\' \'If you didn\'t sign it,\' said Alice, \'and why it is I hate cats and dogs.\' It was all ridges and furrows; the balls were live hedgehogs, the mallets.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\" style=\"width: 100%\" class=\"image_resized\" alt=\"image\"></p><p>What happened to you? Tell us all about as curious as it could go, and broke off a little recovered from the Gryphon, and the moon, and memory, and muchness--you know you say pig, or fig?\' said the Duchess, who seemed ready to sink into the court, without even waiting to put it more clearly,\' Alice replied very politely, \'if I had it written down: but I THINK I can creep under the hedge. In another moment that it was quite silent for a little timidly: \'but it\'s no use in knocking,\' said the King, \'or I\'ll have you executed, whether you\'re nervous or not.\' \'I\'m a poor man,\' the Hatter with a whiting. Now you know.\' \'Not at all,\' said Alice: \'she\'s so extremely--\' Just then she remembered trying to box her own courage. \'It\'s no use their putting their heads down! I am to see that the Queen said--\' \'Get to your little boy, And beat him when he sneezes: He only does it to her ear, and whispered \'She\'s under sentence of execution. Then the Queen added to one of the thing Mock Turtle yet?\'.</p>','published',5,'Botble\\JobBoard\\Models\\Account',1,'news/img-news3.png',1939,NULL,'2024-03-01 04:36:51','2024-03-01 04:36:51');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"extensions.index\":true,\"systems.cronjob\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"plugins.captcha\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"galleries.index\":true,\"galleries.create\":true,\"galleries.edit\":true,\"galleries.destroy\":true,\"plugins.job-board\":true,\"jobs.index\":true,\"jobs.create\":true,\"jobs.edit\":true,\"jobs.destroy\":true,\"import-jobs.index\":true,\"export-jobs.index\":true,\"job-applications.index\":true,\"job-applications.edit\":true,\"job-applications.destroy\":true,\"accounts.index\":true,\"accounts.create\":true,\"accounts.edit\":true,\"accounts.destroy\":true,\"accounts.import\":true,\"accounts.export\":true,\"packages.index\":true,\"packages.create\":true,\"packages.edit\":true,\"packages.destroy\":true,\"companies.index\":true,\"companies.create\":true,\"companies.edit\":true,\"companies.destroy\":true,\"export-companies.index\":true,\"import-companies.index\":true,\"job-board.custom-fields.index\":true,\"job-board.custom-fields.create\":true,\"job-board.custom-fields.edit\":true,\"job-board.custom-fields.destroy\":true,\"job-attributes.index\":true,\"job-categories.index\":true,\"job-categories.create\":true,\"job-categories.edit\":true,\"job-categories.destroy\":true,\"job-types.index\":true,\"job-types.create\":true,\"job-types.edit\":true,\"job-types.destroy\":true,\"job-skills.index\":true,\"job-skills.create\":true,\"job-skills.edit\":true,\"job-skills.destroy\":true,\"job-shifts.index\":true,\"job-shifts.create\":true,\"job-shifts.edit\":true,\"job-shifts.destroy\":true,\"job-experiences.index\":true,\"job-experiences.create\":true,\"job-experiences.edit\":true,\"job-experiences.destroy\":true,\"language-levels.index\":true,\"language-levels.create\":true,\"language-levels.edit\":true,\"language-levels.destroy\":true,\"career-levels.index\":true,\"career-levels.create\":true,\"career-levels.edit\":true,\"career-levels.destroy\":true,\"functional-areas.index\":true,\"functional-areas.create\":true,\"functional-areas.edit\":true,\"functional-areas.destroy\":true,\"degree-types.index\":true,\"degree-types.create\":true,\"degree-types.edit\":true,\"degree-types.destroy\":true,\"degree-levels.index\":true,\"degree-levels.create\":true,\"degree-levels.edit\":true,\"degree-levels.destroy\":true,\"job-board.tag.index\":true,\"job-board.tag.create\":true,\"job-board.tag.edit\":true,\"job-board.tag.destroy\":true,\"job-board.settings\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"reviews.index\":true,\"reviews.destroy\":true,\"invoice-template.index\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"social-login.settings\":true,\"team.index\":true,\"team.create\":true,\"team.edit\":true,\"team.destroy\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}','Admin users role',1,1,1,'2024-03-27 08:37:28','2024-03-27 08:37:28');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2024-03-27 08:37:29'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"faq\",\"gallery\",\"job-board\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"team\",\"testimonial\",\"translation\"]',NULL,'2024-03-27 08:37:29'),(6,'language_hide_default','1',NULL,NULL),(7,'language_switcher_display','dropdown',NULL,NULL),(8,'language_display','all',NULL,NULL),(9,'language_hide_languages','[]',NULL,NULL),(10,'show_admin_bar','1',NULL,NULL),(11,'theme','jobbox',NULL,NULL),(12,'admin_logo','general/logo-light.png',NULL,NULL),(13,'admin_favicon','general/favicon.png',NULL,NULL),(14,'theme-jobbox-site_title','JobBox - Laravel Job Board Script',NULL,NULL),(15,'theme-jobbox-seo_description','JobBox is a neat, clean and professional job board website script for your organization. It’s easy to build a complete Job Board site with JobBox script.',NULL,NULL),(16,'theme-jobbox-copyright','©2024 Archi Elite JSC. All right reserved.',NULL,NULL),(17,'theme-jobbox-favicon','general/favicon.png',NULL,NULL),(18,'theme-jobbox-logo','general/logo.png',NULL,NULL),(19,'theme-jobbox-hotline','+(123) 345-6789',NULL,NULL),(20,'theme-jobbox-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(21,'theme-jobbox-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(22,'theme-jobbox-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(23,'theme-jobbox-homepage_id','1',NULL,NULL),(24,'theme-jobbox-blog_page_id','13',NULL,NULL),(25,'theme-jobbox-preloader_enabled','no',NULL,NULL),(26,'theme-jobbox-job_categories_page_id','18',NULL,NULL),(27,'theme-jobbox-job_candidates_page_id','9',NULL,NULL),(28,'theme-jobbox-default_company_cover_image','general/cover-image.png',NULL,NULL),(29,'theme-jobbox-job_companies_page_id','8',NULL,NULL),(30,'theme-jobbox-job_list_page_id','7',NULL,NULL),(31,'theme-jobbox-email','contact@jobbox.com',NULL,NULL),(32,'theme-jobbox-404_page_image','general/404.png',NULL,NULL),(33,'theme-jobbox-background_breadcrumb','pages/bg-breadcrumb.png',NULL,NULL),(34,'theme-jobbox-blog_page_template_blog','blog_gird_1',NULL,NULL),(35,'theme-jobbox-background_blog_single','pages/img-single.png',NULL,NULL),(36,'theme-jobbox-auth_background_image_1','authentication/img-1.png',NULL,NULL),(37,'theme-jobbox-auth_background_image_2','authentication/img-2.png',NULL,NULL),(38,'theme-jobbox-background_cover_candidate_default','pages/background-cover-candidate.png',NULL,NULL),(39,'theme-jobbox-job_board_max_salary_filter','10000',NULL,NULL),(40,'theme-jobbox-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"socials\\/facebook.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/facebook.com\"}],[{\"key\":\"social-name\",\"value\":\"Linkedin\"},{\"key\":\"social-icon\",\"value\":\"socials\\/linkedin.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/linkedin.com\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"socials\\/twitter.png\"},{\"key\":\"social-url\",\"value\":\"https:\\/\\/twitter.com\"}]]',NULL,NULL),(41,'media_random_hash','67d19b31ddb1364691a5d3a478317aee',NULL,NULL),(42,'permalink-botble-blog-models-post','blog',NULL,NULL),(43,'permalink-botble-blog-models-category','blog',NULL,NULL),(44,'payment_cod_status','1',NULL,NULL),(45,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(46,'payment_bank_transfer_status','1',NULL,NULL),(47,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,NULL),(48,'payment_stripe_payment_type','stripe_checkout',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'homepage-1',1,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(2,'homepage-2',2,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(3,'homepage-3',3,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(4,'homepage-4',4,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(5,'homepage-5',5,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(6,'homepage-6',6,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(7,'jobs',7,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(8,'companies',8,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(9,'candidates',9,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(10,'about-us',10,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(11,'pricing-plan',11,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(12,'contact',12,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(13,'blog',13,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(14,'cookie-policy',14,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(15,'faqs',15,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(16,'services',16,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(17,'terms',17,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(18,'job-categories',18,'Botble\\Page\\Models\\Page','','2024-03-27 08:37:32','2024-03-27 08:37:32'),(19,'design',1,'Botble\\Blog\\Models\\Category','blog','2024-03-27 08:37:33','2024-03-27 08:37:37'),(20,'lifestyle',2,'Botble\\Blog\\Models\\Category','blog','2024-03-27 08:37:33','2024-03-27 08:37:37'),(21,'travel-tips',3,'Botble\\Blog\\Models\\Category','blog','2024-03-27 08:37:33','2024-03-27 08:37:37'),(22,'healthy',4,'Botble\\Blog\\Models\\Category','blog','2024-03-27 08:37:33','2024-03-27 08:37:37'),(23,'travel-tips',5,'Botble\\Blog\\Models\\Category','blog','2024-03-27 08:37:33','2024-03-27 08:37:37'),(24,'hotel',6,'Botble\\Blog\\Models\\Category','blog','2024-03-27 08:37:33','2024-03-27 08:37:37'),(25,'nature',7,'Botble\\Blog\\Models\\Category','blog','2024-03-27 08:37:33','2024-03-27 08:37:37'),(26,'new',1,'Botble\\Blog\\Models\\Tag','tag','2024-03-27 08:37:33','2024-03-27 08:37:33'),(27,'event',2,'Botble\\Blog\\Models\\Tag','tag','2024-03-27 08:37:33','2024-03-27 08:37:33'),(28,'interview-question-why-dont-you-have-a-degree',1,'Botble\\Blog\\Models\\Post','blog','2024-03-27 08:37:33','2024-03-27 08:37:37'),(29,'21-job-interview-tips-how-to-make-a-great-impression',2,'Botble\\Blog\\Models\\Post','blog','2024-03-27 08:37:33','2024-03-27 08:37:37'),(30,'39-strengths-and-weaknesses-to-discuss-in-a-job-interview',3,'Botble\\Blog\\Models\\Post','blog','2024-03-27 08:37:33','2024-03-27 08:37:37'),(31,'perfect',1,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-27 08:37:34','2024-03-27 08:37:34'),(32,'new-day',2,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-27 08:37:34','2024-03-27 08:37:34'),(33,'happy-day',3,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-27 08:37:34','2024-03-27 08:37:34'),(34,'nature',4,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-27 08:37:34','2024-03-27 08:37:34'),(35,'morning',5,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-27 08:37:34','2024-03-27 08:37:34'),(36,'photography',6,'Botble\\Gallery\\Models\\Gallery','galleries','2024-03-27 08:37:34','2024-03-27 08:37:34'),(37,'content-writer',1,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-27 08:37:39','2024-03-27 08:37:39'),(38,'market-research',2,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-27 08:37:39','2024-03-27 08:37:39'),(39,'marketing-sale',3,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-27 08:37:39','2024-03-27 08:37:39'),(40,'customer-help',4,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-27 08:37:39','2024-03-27 08:37:39'),(41,'finance',5,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-27 08:37:39','2024-03-27 08:37:39'),(42,'software',6,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-27 08:37:39','2024-03-27 08:37:39'),(43,'human-resource',7,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-27 08:37:39','2024-03-27 08:37:39'),(44,'management',8,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-27 08:37:40','2024-03-27 08:37:40'),(45,'retail-products',9,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-27 08:37:40','2024-03-27 08:37:40'),(46,'security-analyst',10,'Botble\\JobBoard\\Models\\Category','job-categories','2024-03-27 08:37:40','2024-03-27 08:37:40'),(47,'linkedin',1,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(48,'adobe-illustrator',2,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(49,'bing-search',3,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(50,'dailymotion',4,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(51,'linkedin',5,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(52,'quora-jsc',6,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(53,'nintendo',7,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(54,'periscope',8,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(55,'newsum',9,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(56,'powerhome',10,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(57,'whopcom',11,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:40','2024-03-27 08:37:40'),(58,'greenwood',12,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:41','2024-03-27 08:37:41'),(59,'kentucky',13,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:41','2024-03-27 08:37:41'),(60,'equity',14,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:41','2024-03-27 08:37:41'),(61,'honda',15,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:41','2024-03-27 08:37:41'),(62,'toyota',16,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:41','2024-03-27 08:37:41'),(63,'lexus',17,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:41','2024-03-27 08:37:41'),(64,'ondo',18,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:41','2024-03-27 08:37:41'),(65,'square',19,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:41','2024-03-27 08:37:41'),(66,'visa',20,'Botble\\JobBoard\\Models\\Company','companies','2024-03-27 08:37:41','2024-03-27 08:37:41'),(67,'illustrator',1,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-27 08:37:41','2024-03-27 08:37:41'),(68,'adobe-xd',2,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-27 08:37:41','2024-03-27 08:37:41'),(69,'figma',3,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-27 08:37:41','2024-03-27 08:37:41'),(70,'sketch',4,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-27 08:37:41','2024-03-27 08:37:41'),(71,'lunacy',5,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-27 08:37:41','2024-03-27 08:37:41'),(72,'php',6,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-27 08:37:41','2024-03-27 08:37:41'),(73,'python',7,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-27 08:37:41','2024-03-27 08:37:41'),(74,'javascript',8,'Botble\\JobBoard\\Models\\Tag','job-tags','2024-03-27 08:37:41','2024-03-27 08:37:41'),(75,'ui-ux-designer-full-time',1,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:41','2024-03-27 08:37:41'),(76,'full-stack-engineer',2,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:41','2024-03-27 08:37:41'),(77,'java-software-engineer',3,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:41','2024-03-27 08:37:41'),(78,'digital-marketing-manager',4,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:41','2024-03-27 08:37:41'),(79,'frontend-developer',5,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:41','2024-03-27 08:37:41'),(80,'react-native-web-developer',6,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:41','2024-03-27 08:37:41'),(81,'senior-system-engineer',7,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:41','2024-03-27 08:37:41'),(82,'products-manager',8,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:41','2024-03-27 08:37:41'),(83,'lead-quality-control-qa',9,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:41','2024-03-27 08:37:41'),(84,'principal-designer-design-systems',10,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(85,'devops-architect',11,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(86,'senior-software-engineer-npm-cli',12,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(87,'senior-systems-engineer',13,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(88,'software-engineer-actions-platform',14,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(89,'staff-engineering-manager-actions',15,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(90,'staff-engineering-manager-actions-runtime',16,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(91,'staff-engineering-manager-packages',17,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(92,'staff-software-engineer',18,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(93,'systems-software-engineer',19,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(94,'senior-compensation-analyst',20,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(95,'senior-accessibility-program-manager',21,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(96,'analyst-relations-manager-application-security',22,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(97,'senior-enterprise-advocate-emea',23,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(98,'deal-desk-manager',24,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(99,'director-revenue-compensation',25,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(100,'program-manager',26,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(101,'sr-manager-deal-desk-intl',27,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(102,'senior-director-product-management-actions-runners-and-compute-services',28,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(103,'alliances-director',29,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(104,'corporate-sales-representative',30,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(105,'country-leader',31,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(106,'customer-success-architect',32,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(107,'devops-account-executive-us-public-sector',33,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(108,'enterprise-account-executive',34,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(109,'senior-engineering-manager-product-security-engineering-paved-paths',35,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(110,'customer-reliability-engineer-iii',36,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:42','2024-03-27 08:37:42'),(111,'support-engineer-enterprise-support-japanese',37,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(112,'technical-partner-manager',38,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(113,'sr-manager-inside-account-management',39,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(114,'services-sales-representative',40,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(115,'services-delivery-manager',41,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(116,'senior-solutions-engineer',42,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(117,'senior-service-delivery-engineer',43,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(118,'senior-director-global-sales-development',44,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(119,'partner-program-manager',45,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(120,'principal-cloud-solutions-engineer',46,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(121,'senior-cloud-solutions-engineer',47,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(122,'senior-customer-success-manager',48,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(123,'inside-account-manager',49,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(124,'ux-jobs-board',50,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(125,'senior-laravel-developer-tall-stack',51,'Botble\\JobBoard\\Models\\Job','jobs','2024-03-27 08:37:43','2024-03-27 08:37:43'),(126,'victoria',1,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:44','2024-03-27 08:37:44'),(127,'martin',2,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:45','2024-03-27 08:37:45'),(128,'sarah',3,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:45','2024-03-27 08:37:45'),(129,'steven',4,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:45','2024-03-27 08:37:45'),(130,'william',5,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:46','2024-03-27 08:37:46'),(131,'louvenia',6,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:46','2024-03-27 08:37:46'),(132,'cassie',7,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:46','2024-03-27 08:37:46'),(133,'lenny',8,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:47','2024-03-27 08:37:47'),(134,'brock',9,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:47','2024-03-27 08:37:47'),(135,'jaquan',10,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:47','2024-03-27 08:37:47'),(136,'kareem',11,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:48','2024-03-27 08:37:48'),(137,'larry',12,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:48','2024-03-27 08:37:48'),(138,'jett',13,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:49','2024-03-27 08:37:49'),(139,'shania',14,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:49','2024-03-27 08:37:49'),(140,'cassie',15,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:50','2024-03-27 08:37:50'),(141,'layla',16,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:50','2024-03-27 08:37:50'),(142,'newell',17,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:50','2024-03-27 08:37:50'),(143,'amir',18,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:51','2024-03-27 08:37:51'),(144,'kristofer',19,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:51','2024-03-27 08:37:51'),(145,'asa',20,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:52','2024-03-27 08:37:52'),(146,'maxine',21,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:52','2024-03-27 08:37:52'),(147,'samson',22,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:52','2024-03-27 08:37:52'),(148,'norene',23,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:53','2024-03-27 08:37:53'),(149,'aditya',24,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:53','2024-03-27 08:37:53'),(150,'damian',25,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:53','2024-03-27 08:37:53'),(151,'omari',26,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:54','2024-03-27 08:37:54'),(152,'winston',27,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:54','2024-03-27 08:37:54'),(153,'sim',28,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:55','2024-03-27 08:37:55'),(154,'edythe',29,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:55','2024-03-27 08:37:55'),(155,'dewayne',30,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:55','2024-03-27 08:37:55'),(156,'renee',31,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:56','2024-03-27 08:37:56'),(157,'franco',32,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:56','2024-03-27 08:37:56'),(158,'lucy',33,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:56','2024-03-27 08:37:56'),(159,'jamar',34,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:57','2024-03-27 08:37:57'),(160,'dora',35,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:57','2024-03-27 08:37:57'),(161,'hermann',36,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:57','2024-03-27 08:37:57'),(162,'easter',37,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:58','2024-03-27 08:37:58'),(163,'douglas',38,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:58','2024-03-27 08:37:58'),(164,'halie',39,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:58','2024-03-27 08:37:58'),(165,'ora',40,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:59','2024-03-27 08:37:59'),(166,'reba',41,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:59','2024-03-27 08:37:59'),(167,'candelario',42,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:37:59','2024-03-27 08:37:59'),(168,'domingo',43,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:00','2024-03-27 08:38:00'),(169,'amira',44,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:00','2024-03-27 08:38:00'),(170,'marcus',45,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:00','2024-03-27 08:38:00'),(171,'doyle',46,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:01','2024-03-27 08:38:01'),(172,'lawson',47,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:01','2024-03-27 08:38:01'),(173,'kody',48,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:01','2024-03-27 08:38:01'),(174,'dana',49,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:02','2024-03-27 08:38:02'),(175,'ava',50,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:02','2024-03-27 08:38:02'),(176,'gideon',51,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:02','2024-03-27 08:38:02'),(177,'sonya',52,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:03','2024-03-27 08:38:03'),(178,'bret',53,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:03','2024-03-27 08:38:03'),(179,'godfrey',54,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:04','2024-03-27 08:38:04'),(180,'lavada',55,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:04','2024-03-27 08:38:04'),(181,'dallin',56,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:04','2024-03-27 08:38:04'),(182,'evert',57,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:05','2024-03-27 08:38:05'),(183,'minerva',58,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:05','2024-03-27 08:38:05'),(184,'fanny',59,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:05','2024-03-27 08:38:05'),(185,'kameron',60,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:06','2024-03-27 08:38:06'),(186,'jamie',61,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:06','2024-03-27 08:38:06'),(187,'dana',62,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:06','2024-03-27 08:38:06'),(188,'damien',63,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:07','2024-03-27 08:38:07'),(189,'fern',64,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:07','2024-03-27 08:38:07'),(190,'sabina',65,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:08','2024-03-27 08:38:08'),(191,'geovanni',66,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:08','2024-03-27 08:38:08'),(192,'hollie',67,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:08','2024-03-27 08:38:08'),(193,'marianne',68,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:09','2024-03-27 08:38:09'),(194,'emil',69,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:09','2024-03-27 08:38:09'),(195,'earnest',70,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:10','2024-03-27 08:38:10'),(196,'delphine',71,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:10','2024-03-27 08:38:10'),(197,'teresa',72,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:11','2024-03-27 08:38:11'),(198,'estel',73,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:11','2024-03-27 08:38:11'),(199,'joelle',74,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:11','2024-03-27 08:38:11'),(200,'marty',75,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:12','2024-03-27 08:38:12'),(201,'alvera',76,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:12','2024-03-27 08:38:12'),(202,'jennie',77,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:13','2024-03-27 08:38:13'),(203,'aimee',78,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:13','2024-03-27 08:38:13'),(204,'herta',79,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:14','2024-03-27 08:38:14'),(205,'eryn',80,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:14','2024-03-27 08:38:14'),(206,'madisyn',81,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:15','2024-03-27 08:38:15'),(207,'tierra',82,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:15','2024-03-27 08:38:15'),(208,'enos',83,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:16','2024-03-27 08:38:16'),(209,'chyna',84,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:16','2024-03-27 08:38:16'),(210,'pedro',85,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:17','2024-03-27 08:38:17'),(211,'cristian',86,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:17','2024-03-27 08:38:17'),(212,'margarita',87,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:17','2024-03-27 08:38:17'),(213,'alexandria',88,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:18','2024-03-27 08:38:18'),(214,'kenneth',89,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:18','2024-03-27 08:38:18'),(215,'ruben',90,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:19','2024-03-27 08:38:19'),(216,'kelton',91,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:19','2024-03-27 08:38:19'),(217,'merl',92,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:20','2024-03-27 08:38:20'),(218,'matteo',93,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:20','2024-03-27 08:38:20'),(219,'brown',94,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:20','2024-03-27 08:38:20'),(220,'elna',95,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:21','2024-03-27 08:38:21'),(221,'maximo',96,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:21','2024-03-27 08:38:21'),(222,'carolyne',97,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:22','2024-03-27 08:38:22'),(223,'marcia',98,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:22','2024-03-27 08:38:22'),(224,'jessy',99,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:23','2024-03-27 08:38:23'),(225,'idell',100,'Botble\\JobBoard\\Models\\Account','candidates','2024-03-27 08:38:23','2024-03-27 08:38:23'),(226,'interview-question-why-dont-you-have-a-degree',1,'Botble\\Blog\\Models\\Post','','2024-03-27 08:38:24','2024-03-27 08:38:24'),(227,'21-job-interview-tips-how-to-make-a-great-impression',2,'Botble\\Blog\\Models\\Post','','2024-03-27 08:38:24','2024-03-27 08:38:24'),(228,'39-strengths-and-weaknesses-to-discuss-in-a-job-interview',3,'Botble\\Blog\\Models\\Post','','2024-03-27 08:38:24','2024-03-27 08:38:24'),(229,'design',1,'Botble\\Blog\\Models\\Category','','2024-03-27 08:38:24','2024-03-27 08:38:24'),(230,'lifestyle',2,'Botble\\Blog\\Models\\Category','','2024-03-27 08:38:24','2024-03-27 08:38:24'),(231,'travel-tips',3,'Botble\\Blog\\Models\\Category','','2024-03-27 08:38:24','2024-03-27 08:38:24'),(232,'healthy',4,'Botble\\Blog\\Models\\Category','','2024-03-27 08:38:24','2024-03-27 08:38:24'),(233,'travel-tips',5,'Botble\\Blog\\Models\\Category','','2024-03-27 08:38:24','2024-03-27 08:38:24'),(234,'hotel',6,'Botble\\Blog\\Models\\Category','','2024-03-27 08:38:24','2024-03-27 08:38:24'),(235,'nature',7,'Botble\\Blog\\Models\\Category','','2024-03-27 08:38:24','2024-03-27 08:38:24'),(236,'jack-persion',1,'Botble\\Team\\Models\\Team','teams','2024-03-27 08:38:24','2024-03-27 08:38:24'),(237,'tyler-men',2,'Botble\\Team\\Models\\Team','teams','2024-03-27 08:38:24','2024-03-27 08:38:24'),(238,'mohamed-salah',3,'Botble\\Team\\Models\\Team','teams','2024-03-27 08:38:24','2024-03-27 08:38:24'),(239,'xao-shin',4,'Botble\\Team\\Models\\Team','teams','2024-03-27 08:38:24','2024-03-27 08:38:24'),(240,'peter-cop',5,'Botble\\Team\\Models\\Team','teams','2024-03-27 08:38:24','2024-03-27 08:38:24'),(241,'jacob-jones',6,'Botble\\Team\\Models\\Team','teams','2024-03-27 08:38:24','2024-03-27 08:38:24'),(242,'court-henry',7,'Botble\\Team\\Models\\Team','teams','2024-03-27 08:38:24','2024-03-27 08:38:24'),(243,'theresa',8,'Botble\\Team\\Models\\Team','teams','2024-03-27 08:38:24','2024-03-27 08:38:24');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'France','france','FR',1,0,NULL,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(2,'England','england','EN',2,0,NULL,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(3,'New York','new-york','NY',1,0,NULL,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(4,'Holland','holland','HL',4,0,NULL,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(5,'Denmark','denmark','DN',5,0,NULL,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37'),(6,'Germany','germany','GER',1,0,NULL,0,'published','2024-03-27 08:37:37','2024-03-27 08:37:37');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'New',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-27 08:37:33','2024-03-27 08:37:33'),(2,'Event',NULL,'Botble\\ACL\\Models\\User',NULL,'published','2024-03-27 08:37:33','2024-03-27 08:37:33');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `socials` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Jack Persion','teams/1.png','Developer Fullstack','USA','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL,NULL,NULL,NULL,NULL,NULL),(2,'Tyler Men','teams/2.png','Business Analyst','Qatar','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL,NULL,NULL,NULL,NULL,NULL),(3,'Mohamed Salah','teams/3.png','Developer Fullstack','India','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL,NULL,NULL,NULL,NULL,NULL),(4,'Xao Shin','teams/4.png','Developer Fullstack','China','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL,NULL,NULL,NULL,NULL,NULL),(5,'Peter Cop','teams/5.png','Designer','Russia','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL,NULL,NULL,NULL,NULL,NULL),(6,'Jacob Jones','teams/6.png','Frontend Developer','New York, US','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL,NULL,NULL,NULL,NULL,NULL),(7,'Court Henry','teams/7.png','Backend Developer','Portugal','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL,NULL,NULL,NULL,NULL,NULL),(8,'Theresa','teams/8.png','Backend Developer','Thailand','\"{\\\"facebook\\\":\\\"fb.com\\\",\\\"twitter\\\":\\\"twitter.com\\\",\\\"instagram\\\":\\\"instagram.com\\\"}\"','published','2024-03-27 08:38:23','2024-03-27 08:38:23',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_translations`
--

DROP TABLE IF EXISTS `teams_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teams_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`teams_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_translations`
--

LOCK TABLES `teams_translations` WRITE;
/*!40000 ALTER TABLE `teams_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Ellis Kim','Alice replied very politely, feeling quite pleased to find that she wasn\'t a really good school,\' said the Caterpillar. Alice said very politely, \'if I had our Dinah here, I know I do!\' said Alice.','testimonials/1.png','Digital Artist','published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(2,'John Smith','No, it\'ll never do to come down the chimney close above her: then, saying to herself, \'it would have appeared to them to sell,\' the Hatter went on all the things between whiles.\' \'Then you keep.','testimonials/2.png','Product designer','published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(3,'Sayen Ahmod','I say,\' the Mock Turtle went on, \'if you don\'t know what they\'re like.\' \'I believe so,\' Alice replied very politely, \'if I had it written down: but I shall be late!\' (when she thought it over.','testimonials/3.png','Developer','published','2024-03-27 08:38:24','2024-03-27 08:38:24'),(4,'Tayla Swef','Hatter; \'so I can\'t understand it myself to begin again, it was all about, and make one repeat lessons!\' thought Alice; \'but when you throw them, and just as I used--and I don\'t remember where.\'.','testimonials/4.png','Graphic designer','published','2024-03-27 08:38:24','2024-03-27 08:38:24');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'melba09@bernhard.com',NULL,'$2y$12$3ahxtMD3cw/31fZ32ajlBeqfHiFSY6.iYl1kckGH0T43kDwL02akC',NULL,'2024-03-27 08:37:28','2024-03-27 08:37:28','Garnet','Feest','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'NewsletterWidget','pre_footer_sidebar','jobbox',0,'{\"id\":\"NewsletterWidget\",\"title\":\"New Things Will Always <br> Update Regularly\",\"background_image\":\"general\\/newsletter-background-image.png\",\"image_left\":\"general\\/newsletter-image-left.png\",\"image_right\":\"general\\/newsletter-image-right.png\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(2,'SiteInformationWidget','footer_sidebar','jobbox',1,'{\"introduction\":\"JobBox is the heart of the design community and the best resource to discover and connect with designers and jobs worldwide.\",\"facebook_url\":\"#\",\"twitter_url\":\"#\",\"linkedin_url\":\"#\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(3,'CustomMenuWidget','footer_sidebar','jobbox',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Resources\",\"menu_id\":\"resources\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(4,'CustomMenuWidget','footer_sidebar','jobbox',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Community\",\"menu_id\":\"community\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(5,'CustomMenuWidget','footer_sidebar','jobbox',4,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(6,'CustomMenuWidget','footer_sidebar','jobbox',5,'{\"id\":\"CustomMenuWidget\",\"name\":\"More\",\"menu_id\":\"more\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(7,'DownloadWidget','footer_sidebar','jobbox',6,'{\"app_store_url\":\"#\",\"app_store_image\":\"general\\/app-store.png\",\"android_app_url\":\"#\",\"google_play_image\":\"general\\/android.png\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(8,'BlogSearchWidget','primary_sidebar','jobbox',1,'{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(9,'BlogCategoriesWidget','primary_sidebar','jobbox',2,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(10,'BlogPostsWidget','primary_sidebar','jobbox',3,'{\"id\":\"BlogPostsWidget\",\"type\":\"popular\",\"name\":\"Popular Posts\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(11,'BlogTagsWidget','primary_sidebar','jobbox',4,'{\"id\":\"BlogTagsWidget\",\"name\":\"Popular Tags\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(12,'BlogSearchWidget','blog_sidebar','jobbox',0,'{\"id\":\"BlogSearchWidget\",\"name\":\"Blog Search\",\"description\":\"Search blog posts\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(13,'BlogPostsWidget','blog_sidebar','jobbox',1,'{\"id\":\"BlogPostsWidget\",\"name\":\"Blog posts\",\"description\":\"Blog posts widget.\",\"type\":\"popular\",\"number_display\":5}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(14,'AdsBannerWidget','blog_sidebar','jobbox',2,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(15,'GalleryWidget','blog_sidebar','jobbox',3,'{\"id\":\"GalleryWidget\",\"name\":\"Gallery\",\"title_gallery\":\"Gallery\",\"number_image\":8}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(16,'AdsBannerWidget','candidate_sidebar','jobbox',0,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-03-27 08:37:34','2024-03-27 08:37:34'),(17,'AdsBannerWidget','company_sidebar','jobbox',0,'{\"id\":\"AdsBannerWidget\",\"name\":\"Ads banner\",\"banner_ads\":\"widgets\\/widget-banner.png\",\"url\":\"\\/\"}','2024-03-27 08:37:34','2024-03-27 08:37:34');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-27 22:38:26
