/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - andritoko
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`andritoko` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `andritoko`;

/*Table structure for table `banners` */

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banners_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `banners` */

insert  into `banners`(`id`,`title`,`slug`,`photo`,`description`,`status`,`created_at`,`updated_at`) values 
(5,'Indomie Diskon besar Besarann','indomie-diskon-besar-besarann','/storage/photos/1/Banner/banner indomie.jpg','<p>Buruan beliii</p>','active','2023-11-13 12:43:17','2023-11-13 12:43:17'),
(7,'Diskonn','diskonn','/storage/photos/1/Banner/banner diskon.jpg','<p>Diskon 50% bagi yang beruntung</p>','active','2023-11-13 12:44:18','2023-11-13 12:44:18');

/*Table structure for table `brands` */

DROP TABLE IF EXISTS `brands`;

CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `brands` */

insert  into `brands`(`id`,`title`,`slug`,`status`,`created_at`,`updated_at`) values 
(4,'Sterofom','sterofom','active','2024-07-04 13:00:24','2024-07-04 13:00:24'),
(5,'Sedotan Garis','sedotan-garis','active','2024-07-05 12:41:19','2024-07-05 12:41:19'),
(6,'Sedotan Steril','sedotan-steril','active','2024-07-05 12:41:26','2024-07-05 12:41:26'),
(7,'Sedotan Polos','sedotan-boba','active','2024-07-12 10:32:40','2024-07-12 10:35:33'),
(8,'Sedotan Boba','sedotan-boba-2407122443-754','active','2024-07-12 11:24:43','2024-07-12 11:24:43'),
(9,'Kresek Polos','kresek-polos','active','2024-07-15 02:09:24','2024-07-15 02:09:24');

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_order_id_foreign` (`order_id`),
  CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `carts` */

insert  into `carts`(`id`,`product_id`,`order_id`,`user_id`,`price`,`status`,`quantity`,`amount`,`created_at`,`updated_at`) values 
(45,19,NULL,34,12000.00,'new',1,12000.00,'2024-07-26 16:41:30','2024-07-26 16:41:30');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_added_by_foreign` (`added_by`),
  CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`title`,`slug`,`summary`,`photo`,`is_parent`,`parent_id`,`added_by`,`status`,`created_at`,`updated_at`) values 
(5,'Kertas','kertas',NULL,NULL,1,NULL,NULL,'active','2024-07-04 11:24:04','2024-07-04 11:24:04'),
(6,'Sedotan','sedotan',NULL,NULL,1,NULL,NULL,'active','2024-07-04 11:24:32','2024-07-04 11:24:32'),
(7,'Sterofom','sterofom',NULL,NULL,1,NULL,NULL,'active','2024-07-04 11:24:38','2024-07-04 11:24:38'),
(8,'Kantong Kresek','kantong-kresek',NULL,NULL,1,NULL,NULL,'active','2024-07-11 22:47:48','2024-07-11 22:47:48'),
(9,'Seal Cup','seal-cup',NULL,NULL,1,NULL,NULL,'active','2024-07-11 22:52:39','2024-07-11 23:02:49');

/*Table structure for table `coupons` */

DROP TABLE IF EXISTS `coupons`;

CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `type` enum('fixed','percent') NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `coupons` */

insert  into `coupons`(`id`,`code`,`type`,`value`,`status`,`created_at`,`updated_at`) values 
(1,'abc123','fixed',300.00,'active',NULL,NULL),
(2,'111111','percent',10.00,'active',NULL,NULL),
(5,'abcd','fixed',250.00,'active','2020-08-18 03:54:58','2020-08-18 03:54:58');

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `messages` */

DROP TABLE IF EXISTS `messages`;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(191) NOT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `message` longtext NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `messages` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2019_12_14_000001_create_personal_access_tokens_table',1),
(2,'2024_07_18_012754_add_shipping_details_to_orders_table',1),
(3,'2024_07_18_013054_add_shipping_details_to_orders',1),
(4,'2024_07_20_203347_create_order_items_table',2);

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(191) NOT NULL,
  `notifiable_type` varchar(191) NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications` */

insert  into `notifications`(`id`,`type`,`notifiable_type`,`notifiable_id`,`data`,`read_at`,`created_at`,`updated_at`) values 
('00569089-e6c7-4e26-8196-9564fb81ab6f','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/sedotan-steril-isi-250\",\"fas\":\"fa-star\"}',NULL,'2024-07-09 01:07:35','2024-07-09 01:07:35'),
('27014f33-c813-40d5-9ddc-01c15b81c092','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/27\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-09 01:54:53','2024-07-09 01:54:53'),
('361a05ff-bb38-43d1-86a6-91d9a5f90a84','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/sedotan-steril-hitam-isi-250\",\"fas\":\"fa-star\"}',NULL,'2024-07-04 12:53:02','2024-07-04 12:53:02'),
('3d0f34e8-3e94-493d-8d87-b49b292e87fa','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/21\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-04 13:09:47','2024-07-04 13:09:47'),
('416eaf95-886a-4ea4-a7e7-42b7c8fd356f','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/16\",\"fas\":\"fa-file-alt\"}',NULL,'2023-11-24 09:45:46','2023-11-24 09:45:46'),
('440037ad-181c-4e6c-86df-c3a509a76230','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/24\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-05 12:11:38','2024-07-05 12:11:38'),
('4d1ce841-5a97-4ad6-80db-5cf0e6999f06','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/12\",\"fas\":\"fa-file-alt\"}',NULL,'2023-11-15 19:23:17','2023-11-15 19:23:17'),
('5cd2d509-fe64-4e20-b699-150301f83ba3','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/26\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-06 17:17:04','2024-07-06 17:17:04'),
('5e754441-cb7a-47c7-97ff-719532d95b75','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/22\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-04 13:35:34','2024-07-04 13:35:34'),
('6540a8ab-1e1b-431f-ada8-d95d17680efd','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/31\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-17 13:09:06','2024-07-17 13:09:06'),
('65ee29c1-8788-4699-a6b0-58ca1eb93080','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/indomie\",\"fas\":\"fa-star\"}',NULL,'2023-11-15 19:13:24','2023-11-15 19:13:24'),
('6974b877-a737-44fb-9e8a-4b4bba656eff','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/13\",\"fas\":\"fa-file-alt\"}',NULL,'2023-11-16 07:40:06','2023-11-16 07:40:06'),
('6980c7ea-2194-4f56-b5e2-34d63b1698fc','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}',NULL,'2023-11-13 12:16:12','2023-11-13 12:16:12'),
('718b53c2-e3a2-4102-8c47-4d9bd82d1259','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/30\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-17 13:08:06','2024-07-17 13:08:06'),
('74178182-cc6f-4b28-8e6e-117647548759','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}',NULL,'2023-11-13 12:55:10','2023-11-13 12:55:10'),
('7d1d97f5-7f70-40e1-a1ef-379120f6da4d','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/biskuat\",\"fas\":\"fa-star\"}',NULL,'2023-11-23 09:19:54','2023-11-23 09:19:54'),
('83413778-4a1a-4ccf-904f-451ede4e75f3','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/29\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-16 21:44:28','2024-07-16 21:44:28'),
('8425763a-4a0a-48e4-a8b8-6f2637c92f6f','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}','2023-11-13 12:00:37','2023-11-13 11:59:48','2023-11-13 12:00:37'),
('8aae34c4-f4a0-4f90-a142-79d40cab6352','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}',NULL,'2023-11-13 12:11:18','2023-11-13 12:11:18'),
('9806ef4a-d6af-480c-9b97-b1ffee0368f2','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/milo\",\"fas\":\"fa-star\"}',NULL,'2023-11-16 08:51:42','2023-11-16 08:51:42'),
('9c605904-32ab-4fe7-a50e-13674fa45710','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/17\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-03 20:58:55','2024-07-03 20:58:55'),
('a658df87-8fff-4eaa-9775-d15ae12e8007','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/20\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-04 13:05:58','2024-07-04 13:05:58'),
('b08a189f-5b1a-42ba-bed9-c135b5f2e905','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/15\",\"fas\":\"fa-file-alt\"}',NULL,'2023-11-23 09:19:11','2023-11-23 09:19:11'),
('c4b3d4fe-b6a7-46d1-931a-b4f1b106f883','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/14\",\"fas\":\"fa-file-alt\"}',NULL,'2023-11-16 08:55:49','2023-11-16 08:55:49'),
('c539a213-85c8-4363-818e-8a882ba78aae','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/11\",\"fas\":\"fa-file-alt\"}',NULL,'2023-11-15 11:44:59','2023-11-15 11:44:59'),
('d3f82998-3913-4945-9cd4-834d9ab28fdd','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/19\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-04 13:04:21','2024-07-04 13:04:21'),
('d83db11e-7d45-457a-a473-5ebe915c19ca','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/32\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-18 08:19:16','2024-07-18 08:19:16'),
('e3b82b4e-e8ae-4448-ac71-4e7d94b49e0b','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/23\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-05 09:35:07','2024-07-05 09:35:07'),
('e911d72f-a576-4d5b-b70c-40582047b280','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/25\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-05 12:14:58','2024-07-05 12:14:58'),
('e939ee7a-f092-4902-8b98-63320061b7c7','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/product-detail\\/indomie\",\"fas\":\"fa-star\"}',NULL,'2023-11-15 12:08:43','2023-11-15 12:08:43'),
('eac45c5b-c8fd-46b6-b445-c0a739545898','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/28\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-15 10:15:25','2024-07-15 10:15:25'),
('fa397ac8-0dc2-4c4a-ab84-865ac3d45f2f','App\\Notifications\\StatusNotification','App\\User',33,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/18\",\"fas\":\"fa-file-alt\"}',NULL,'2024-07-04 12:19:53','2024-07-04 12:19:53'),
('fdc98d82-f736-4803-a324-3b9e2afd8e45','App\\Notifications\\StatusNotification','App\\User',1,'{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}','2023-11-13 11:14:47','2023-11-13 11:14:29','2023-11-13 11:14:47');

/*Table structure for table `order_items` */

DROP TABLE IF EXISTS `order_items`;

CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `order_items` */

insert  into `order_items`(`id`,`order_id`,`product_id`,`quantity`,`price`,`created_at`,`updated_at`) values 
(1,33,13,3,10000.00,'2024-07-21 16:12:02','2024-07-21 16:12:02'),
(2,33,13,1,10000.00,'2024-07-21 16:12:02','2024-07-21 16:12:02'),
(3,33,13,1,10000.00,'2024-07-21 16:12:02','2024-07-21 16:12:02'),
(4,33,16,5,5000.00,'2024-07-21 16:12:02','2024-07-21 16:12:02'),
(5,33,15,1,6000.00,'2024-07-21 16:12:02','2024-07-21 16:12:02'),
(6,33,16,1,5000.00,'2024-07-21 16:12:02','2024-07-21 16:12:02'),
(7,33,16,1,5000.00,'2024-07-21 16:12:02','2024-07-21 16:12:02'),
(8,33,15,2,6000.00,'2024-07-21 16:12:02','2024-07-21 16:12:02'),
(9,34,19,1,12000.00,'2024-07-26 16:29:49','2024-07-26 16:29:49');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `sub_total` double(8,2) DEFAULT NULL,
  `shipping_id` bigint(20) unsigned DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `payment_method` enum('cod','paypal','qris') DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') DEFAULT 'new',
  `first_name` varchar(191) DEFAULT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `country` varchar(191) DEFAULT NULL,
  `post_code` varchar(191) DEFAULT NULL,
  `address1` text DEFAULT NULL,
  `address2` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `province` varchar(191) DEFAULT NULL,
  `city` varchar(191) DEFAULT NULL,
  `shipping_service` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_shipping_id_foreign` (`shipping_id`),
  CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `orders` */

insert  into `orders`(`id`,`order_number`,`user_id`,`sub_total`,`shipping_id`,`coupon`,`total_amount`,`quantity`,`payment_method`,`payment_status`,`status`,`first_name`,`last_name`,`email`,`phone`,`country`,`post_code`,`address1`,`address2`,`created_at`,`updated_at`,`province`,`city`,`shipping_service`) values 
(26,'ORD-IRUUW59NEB',37,30000.00,4,NULL,35000.00,3,'qris','paid','delivered','Sapto','Utomo','sapto@gmail.com','085522','ID','64123','gurah','Kediri','2024-07-06 17:17:02','2024-07-12 10:57:57',NULL,NULL,NULL),
(27,'ORD-RSZF8QPWVF',37,10000.00,4,NULL,15000.00,1,'cod','unpaid','new','Sapto','Jonathan','sapto@gmail.com','086482','ID','64125','banjaran','Kediri','2024-07-09 01:54:51','2024-07-09 01:54:51',NULL,NULL,NULL),
(28,'ORD-6YWE6UB2FI',37,10000.00,2,NULL,13000.00,1,'cod','unpaid','new','Sapto','Utomo','sapto@gmail.com','0846412','ID','64125','singonegaran','Kediri','2024-07-15 10:15:23','2024-07-15 10:15:23',NULL,NULL,NULL),
(29,'ORD-RVD69RZQCO',37,25000.00,5,NULL,33000.00,5,'qris','paid','new','Sapto','Jonathan','sapto@gmail.com','084638273','ID','64123','singonegaran','Kediri','2024-07-16 21:44:26','2024-07-16 21:44:26',NULL,NULL,NULL),
(30,'ORD-D7U8OJGOMD',37,6000.00,NULL,NULL,6000.00,1,'cod','unpaid','new','Sapto','Utomo','sapto@gmail.com','96353','ID','64125','banjaran','Kediri','2024-07-17 13:08:04','2024-07-17 13:08:04',NULL,NULL,NULL),
(31,'ORD-77LMDTHGRV',37,5000.00,2,NULL,8000.00,1,'cod','unpaid','new','Sapto','Sapto','sapto@gmail.com','324234','ID','64124','gurah','Kediri','2024-07-17 13:09:06','2024-07-17 13:09:06',NULL,NULL,NULL),
(32,'ORD-MJFYRIN6EG',37,5000.00,NULL,NULL,27000.00,1,'cod','unpaid','new','Sapto','Utomo','sapto@gmail.com','992131',NULL,'64125',NULL,NULL,'2024-07-26 15:36:35','2024-07-18 08:19:14',NULL,NULL,NULL),
(33,'ORD-669CD0E2910A0',37,103000.00,NULL,NULL,135000.00,15,NULL,'paid','new','Sapto','Jonathan','sapto@gmail.com','9278362','ID','615261',NULL,NULL,'2024-07-26 15:36:32','2024-07-21 16:12:48','1','32','32000'),
(34,'ORD-66A36C8DADE2E',34,12000.00,NULL,NULL,12000.00,1,NULL,'unpaid','new','Jonathan','sapto','jsaptoutomo@gmail.com','123331','ID','64212',NULL,NULL,'2024-07-26 16:29:49','2024-07-26 16:29:49','11','178',NULL);

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
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

/*Data for the table `personal_access_tokens` */

/*Table structure for table `post_categories` */

DROP TABLE IF EXISTS `post_categories`;

CREATE TABLE `post_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_categories` */

insert  into `post_categories`(`id`,`title`,`slug`,`status`,`created_at`,`updated_at`) values 
(1,'Travel','contrary','active','2020-08-14 08:51:03','2020-08-14 08:51:39'),
(2,'Electronics','richard','active','2020-08-14 08:51:22','2020-08-14 08:52:00'),
(3,'Cloths','cloths','active','2020-08-14 08:52:22','2020-08-14 08:52:22'),
(4,'enjoy','enjoy','active','2020-08-14 10:16:10','2020-08-14 10:16:10'),
(5,'Post Category','post-category','active','2020-08-15 13:59:04','2020-08-15 13:59:04');

/*Table structure for table `post_comments` */

DROP TABLE IF EXISTS `post_comments`;

CREATE TABLE `post_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `comment` text NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `replied_comment` text DEFAULT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_comments` */

/*Table structure for table `post_tags` */

DROP TABLE IF EXISTS `post_tags`;

CREATE TABLE `post_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `post_tags` */

insert  into `post_tags`(`id`,`title`,`slug`,`status`,`created_at`,`updated_at`) values 
(1,'Enjoy','enjoy','active','2020-08-14 08:53:52','2020-08-14 08:53:52'),
(2,'2020','2020','active','2020-08-14 08:54:09','2020-08-14 08:54:09'),
(3,'Visit nepal 2020','visit-nepal-2020','active','2020-08-14 08:54:33','2020-08-14 08:54:33'),
(4,'Tag','tag','active','2020-08-15 13:59:31','2020-08-15 13:59:31');

/*Table structure for table `posts` */

DROP TABLE IF EXISTS `posts`;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `quote` text DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `tags` varchar(191) DEFAULT NULL,
  `post_cat_id` bigint(20) unsigned DEFAULT NULL,
  `post_tag_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  KEY `posts_added_by_foreign` (`added_by`),
  CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `posts` */

/*Table structure for table `product_reviews` */

DROP TABLE IF EXISTS `product_reviews`;

CREATE TABLE `product_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_user_id_foreign` (`user_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_reviews` */

insert  into `product_reviews`(`id`,`user_id`,`product_id`,`rate`,`review`,`status`,`created_at`,`updated_at`) values 
(7,34,NULL,5,'Mantap','active','2024-07-04 12:53:02','2024-07-04 12:53:02'),
(8,37,13,5,'Mantap','active','2024-07-09 01:07:34','2024-07-09 01:07:34');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `summary` text NOT NULL,
  `description` longtext DEFAULT NULL,
  `photo` text NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) DEFAULT 'M',
  `condition` enum('default','new','hot') NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `satuan_id` int(20) DEFAULT NULL,
  `jumlah_satuan` int(20) DEFAULT NULL,
  `weight` decimal(8,2) NOT NULL DEFAULT 0.00,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) unsigned DEFAULT NULL,
  `child_cat_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_cat_id_foreign` (`cat_id`),
  KEY `products_child_cat_id_foreign` (`child_cat_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id`,`title`,`slug`,`summary`,`description`,`photo`,`stock`,`size`,`condition`,`status`,`price`,`satuan_id`,`jumlah_satuan`,`weight`,`discount`,`is_featured`,`cat_id`,`child_cat_id`,`brand_id`,`created_at`,`updated_at`) values 
(13,'Sedotan Steril isi 250','sedotan-steril-isi-250','<p>Sedotan Steril isi 250<br></p>','<p>Sedotan Steril isi 250<br></p>','/storage/photos/33/garis ijo.jpg',7,'','default','active',10000.00,NULL,NULL,1.00,0.00,1,6,NULL,6,'2024-07-05 12:42:57','2024-07-24 20:14:09'),
(14,'Sedotan Garis Hijau','sedotan-garis-hijau','<p>Sedotan Garis Hijau&nbsp;<br></p>','<p>Sedotan Garis Hijau&nbsp;<br></p>','/storage/photos/33/garis ijo.jpg',10,'','default','active',5000.00,NULL,NULL,1.00,0.00,1,6,NULL,5,'2024-07-05 12:56:27','2024-07-05 12:56:27'),
(15,'Sedotan Polos Campur','sedotan-garis-merah','<p>Sedotan Polos Campur</p>','<p>Sedotan Polos Campur<br></p>','/storage/photos/33/sedotan campur.jpg',20,'','default','active',6000.00,NULL,NULL,1.00,0.00,0,6,NULL,7,'2024-07-12 10:42:57','2024-07-12 10:46:10'),
(16,'Sedotan Boba','Sedotan Boba','<p>Sedotan Boba<br></p>','<p>Sedotan Boba<br></p>','/storage/photos/33/sedotan boba.jpeg',20,'','default','active',5000.00,NULL,NULL,1.00,0.00,0,6,NULL,8,NULL,'2024-07-15 01:52:27'),
(17,'Kantong Kresek Putih Jumbo','kantong-kresek-putih-jumbo','<p>Kantong Kresek Putih Jumbo<br></p>','<p>Kantong Kresek Putih Jumbo<br></p>','/storage/photos/33/Kresek putih.jpg',10,'','default','active',6000.00,2,2,6.00,0.00,0,8,NULL,9,'2024-07-15 02:11:25','2024-07-29 18:47:56'),
(19,'cobaaaaaaaaaaaa','cobaaaaaaaaaaaa','<p>cobaaaaaaaaaaaa<br></p>','<p>cobaaaaaaaaaaaa<br></p>','/storage/photos/33/garis ijo.jpg',100,'','default','active',12000.00,5,5,100.00,0.00,1,5,NULL,4,'2024-07-24 22:03:44','2024-07-29 18:49:01');

/*Table structure for table `satuan` */

DROP TABLE IF EXISTS `satuan`;

CREATE TABLE `satuan` (
  `satuan_id` int(20) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(255) DEFAULT NULL,
  `weight` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`satuan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `satuan` */

insert  into `satuan`(`satuan_id`,`nama_satuan`,`weight`) values 
(1,'coba',0.20),
(2,'tes',3.00),
(5,'Sedotan Garis',20.00);

/*Table structure for table `satuan_jumlah` */

DROP TABLE IF EXISTS `satuan_jumlah`;

CREATE TABLE `satuan_jumlah` (
  `id_st` int(20) NOT NULL AUTO_INCREMENT,
  `satuan_id` int(20) DEFAULT NULL,
  `jumlah_satuan` int(20) DEFAULT NULL,
  PRIMARY KEY (`id_st`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `satuan_jumlah` */

insert  into `satuan_jumlah`(`id_st`,`satuan_id`,`jumlah_satuan`) values 
(8,5,5),
(9,2,2),
(10,2,1),
(11,2,5);

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `short_des` text NOT NULL,
  `logo` varchar(191) NOT NULL,
  `photo` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `settings` */

insert  into `settings`(`id`,`description`,`short_des`,`logo`,`photo`,`address`,`phone`,`email`,`created_at`,`updated_at`) values 
(1,'<p>Jonathan Sapto Utomo<br></p>','Toko Andrimas','/storage/photos/martlogo.png','/storage/photos/1/Blog/kelngronggo.jpg','Kediri','0858589898986','jsaptoutomo@gmail.com',NULL,'2024-07-18 08:22:03');

/*Table structure for table `shippings` */

DROP TABLE IF EXISTS `shippings`;

CREATE TABLE `shippings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `shippings` */

insert  into `shippings`(`id`,`type`,`price`,`status`,`created_at`,`updated_at`) values 
(1,'JNT',7000.00,'active','2023-11-11 01:32:16','2023-11-11 01:32:16'),
(2,'JNE',3000.00,'active','2023-11-11 01:37:35','2023-11-11 01:37:35'),
(3,'Taruna',0.00,'active','2023-11-15 19:36:37','2023-11-15 19:36:37'),
(4,'Ninja',5000.00,'active','2023-11-23 09:29:37','2023-11-23 09:29:37'),
(5,'Sicepat',8000.00,'active','2024-07-12 10:48:14','2024-07-12 10:53:14');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `role` enum('admin','user','gudang','kurir') NOT NULL DEFAULT 'user',
  `provider` varchar(191) DEFAULT NULL,
  `provider_id` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`photo`,`role`,`provider`,`provider_id`,`status`,`remember_token`,`created_at`,`updated_at`) values 
(33,'Admin','admin@gmail.com',NULL,'$2y$10$815j.WIkHs1XibCA2oW7BODgV7uwGcIH8eTFA0Ru51JviZGtd2Vqy',NULL,'admin',NULL,NULL,'active',NULL,'2024-07-03 18:24:39','2024-07-03 18:24:39'),
(34,'Jonathan','jsaptoutomo@gmail.com',NULL,'$2y$10$CgEtyxjhijXNi1gyKKuYM..cb0LNtm0zYFvdD.7RkP4Uoivni8nDy',NULL,'user',NULL,NULL,'active',NULL,'2024-07-03 20:56:14','2024-07-03 20:56:14'),
(36,'Kurir','kurir@gmail.com',NULL,'$2y$10$SRpaymxV7xSrobLYfr/vNun6NoqEdOKZ2U23UeUD42/qsbrNdFIki',NULL,'kurir',NULL,NULL,'active',NULL,'2024-07-03 21:30:31','2024-07-03 21:30:31'),
(37,'Sapto','sapto@gmail.com',NULL,'$2y$10$o23QiYMQqvxZQkkUsGbpLudQJ85sUQd/TDmdGwQl7/37qfb9jSEyi',NULL,'user',NULL,NULL,'active',NULL,'2024-07-06 16:53:42','2024-07-06 16:53:42'),
(38,'Gudang','gudang@gmail.com',NULL,'$2y$10$5qSR.1s.Pf6kfr5g8FG5TOsx7mLDjFqlO0aqPQd8kPXwdQsdNTwsa',NULL,'gudang',NULL,NULL,'active',NULL,'2024-07-06 17:47:59','2024-07-06 17:47:59'),
(39,'Gudang 2','gudang2@gmail.com',NULL,'$2y$10$kmdXlLiV4FLxZVW6O2e.D.BgdEXSMpbBAq5peoDoehqHHUWVvpE/y',NULL,'gudang',NULL,NULL,'active',NULL,'2024-07-12 11:00:25','2024-07-12 11:02:57');

/*Table structure for table `wishlists` */

DROP TABLE IF EXISTS `wishlists`;

CREATE TABLE `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `cart_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_cart_id_foreign` (`cart_id`),
  CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `wishlists` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
