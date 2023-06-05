-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: corporative
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `account_codes`
--

DROP TABLE IF EXISTS `account_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_codes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `range` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeactivated` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_codes_range_unique` (`range`),
  UNIQUE KEY `account_codes_label_unique` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_codes`
--

LOCK TABLES `account_codes` WRITE;
/*!40000 ALTER TABLE `account_codes` DISABLE KEYS */;
INSERT INTO `account_codes` VALUES (1,'11000 - 12000','Current Assets','current-assets',0,'2023-05-18 14:27:22','2023-05-19 13:43:14'),(2,'20000 - 20999','Liabilities','liabilities',0,'2023-05-18 14:50:32','2023-05-19 13:42:55'),(3,'21000 - 21999','Current Liabilities','current-liabilities',0,'2023-05-18 14:50:54','2023-05-19 13:44:03'),(4,'13000 - 17000','Non-Current Assets','non-current-assets',0,'2023-05-19 13:42:19','2023-05-19 13:42:19'),(5,'10000 - 10999','Assets','assets',0,'2023-05-19 13:43:34','2023-05-19 13:43:34'),(6,'22000 - 23000','Non-Current Liabilities','non-current-liabilities',0,'2023-05-19 13:44:43','2023-05-19 13:44:43'),(7,'30000 - 39999','Equity','equity',0,'2023-05-19 13:45:21','2023-05-19 13:45:21'),(8,'40000 - 49999','Revenue','revenue',0,'2023-05-19 13:45:39','2023-05-19 13:45:39'),(9,'50000 - 59999','Cost of Goods Sold','cost-of-goods-sold',0,'2023-05-19 13:46:12','2023-05-19 13:46:12'),(10,'60000 - 82999','Expenses','expenses',0,'2023-05-19 13:46:37','2023-05-19 13:46:37'),(11,'83000 - 83999','Supervision Fee','supervision-fee',0,'2023-05-19 13:47:12','2023-05-19 13:47:12'),(12,'90000 - 91000','Other Payment','other-payment',0,'2023-05-19 13:47:41','2023-05-19 13:47:41');
/*!40000 ALTER TABLE `account_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accountable_id` bigint unsigned NOT NULL,
  `accountable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accounts_account_number_unique` (`account_number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Stanbic IBTC','324123432',1,'App\\Models\\Organization',0,'2023-05-22 06:43:57','2023-05-22 06:43:57'),(2,'Zenith Bank','1015159444',2,'App\\Models\\Organization',0,'2023-05-22 06:56:33','2023-05-22 06:56:33'),(3,'Guaranteed Trust Bank','0212329846',2,'App\\Models\\Organization',0,'2023-05-22 06:58:18','2023-05-22 06:58:18'),(4,'Fidelity Bank','5080092566',2,'App\\Models\\Organization',0,'2023-05-22 07:00:03','2023-05-22 07:00:03'),(5,'Firstbank','2031452838',2,'App\\Models\\Organization',0,'2023-05-22 07:00:26','2023-05-22 07:00:26'),(6,'Stanbic IBTC','0026360846',2,'App\\Models\\Organization',0,'2023-05-22 07:00:47','2023-05-22 07:00:47'),(7,'Guaranteed Trust Bank','0225992031',1,'App\\Models\\User',1,'2023-06-04 09:54:20','2023-06-04 11:05:23'),(10,'Access Bank','0056075457',1,'App\\Models\\User',0,'2023-06-04 11:06:00','2023-06-04 11:06:00');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `air_tickets`
--

DROP TABLE IF EXISTS `air_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `air_tickets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `airplane_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `noOfPassengers` bigint NOT NULL DEFAULT '0',
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_to_takeoff` date DEFAULT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_to_destination` date DEFAULT NULL,
  `amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `period` enum('morning','afternoon','evening') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'morning',
  `type` enum('local','international') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `route` enum('one-way','return','multi-city') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'return',
  `status` enum('pending','response','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `air_tickets_code_unique` (`code`),
  KEY `air_tickets_user_id_foreign` (`user_id`),
  KEY `air_tickets_airplane_id_foreign` (`airplane_id`),
  CONSTRAINT `air_tickets_airplane_id_foreign` FOREIGN KEY (`airplane_id`) REFERENCES `airplanes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `air_tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `air_tickets`
--

LOCK TABLES `air_tickets` WRITE;
/*!40000 ALTER TABLE `air_tickets` DISABLE KEYS */;
INSERT INTO `air_tickets` VALUES (1,1,5,'AIR56078',1,'Port Harcourt City (PHC)','2023-06-19','Lagos','2023-06-25',230134.43,'afternoon','local','return','approved','2023-06-01 11:10:15','2023-06-01 13:02:51');
/*!40000 ALTER TABLE `air_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplanes`
--

DROP TABLE IF EXISTS `airplanes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplanes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeactivated` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplanes`
--

LOCK TABLES `airplanes` WRITE;
/*!40000 ALTER TABLE `airplanes` DISABLE KEYS */;
INSERT INTO `airplanes` VALUES (1,'Ibom Air',0,'2023-05-30 00:41:09','2023-05-30 00:41:09'),(2,'Arik Air',0,'2023-05-30 00:41:23','2023-05-30 00:41:23'),(3,'Air Peace',0,'2023-05-30 00:42:45','2023-05-30 00:42:45'),(4,'Aero Contractors',0,'2023-05-30 00:43:08','2023-05-30 00:43:08'),(5,'United Nigeria Airline',0,'2023-05-30 00:44:07','2023-05-30 00:44:07'),(6,'Max Air',0,'2023-05-30 00:44:21','2023-05-30 00:44:21'),(7,'Dana Air',0,'2023-05-30 00:44:32','2023-05-30 00:44:32'),(8,'Azman Air',0,'2023-05-30 06:36:17','2023-05-30 06:36:17'),(9,'Overland Airways',0,'2023-05-30 06:36:40','2023-05-30 06:36:40'),(10,'Green Africa Airways',0,'2023-05-30 06:37:05','2023-05-30 06:37:05');
/*!40000 ALTER TABLE `airplanes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `organization_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved_amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `paid` decimal(30,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(30,2) NOT NULL DEFAULT '0.00',
  `date_awarded` date DEFAULT NULL,
  `date_accepted_or_denied` datetime DEFAULT NULL,
  `date_commenced` datetime DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `date_closed` datetime DEFAULT NULL,
  `status` enum('pending','accepted','inprogress','denied','completed','overdue') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `awards_code_unique` (`code`),
  KEY `awards_user_id_foreign` (`user_id`),
  KEY `awards_organization_id_foreign` (`organization_id`),
  KEY `awards_project_id_foreign` (`project_id`),
  CONSTRAINT `awards_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (1,1,1,1,'CTR210222',7600000.00,0.00,7600000.00,'2023-05-02',NULL,'2023-05-30 00:00:00','2023-12-02',NULL,'pending',0,'2023-05-23 07:01:41','2023-05-23 07:01:41');
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batches`
--

DROP TABLE IF EXISTS `batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `sub_budget_head_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `noOfPayments` int NOT NULL DEFAULT '0',
  `total_amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `batches_code_unique` (`code`),
  KEY `batches_user_id_foreign` (`user_id`),
  CONSTRAINT `batches_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batches`
--

LOCK TABLES `batches` WRITE;
/*!40000 ALTER TABLE `batches` DISABLE KEYS */;
INSERT INTO `batches` VALUES (2,'TPP0820',1,'C026',1,4500000.00,'pending',0,'2023-05-28 06:56:13','2023-05-28 06:56:13'),(3,'MP69890',1,'C006',1,1000000.00,'pending',0,'2023-05-30 15:21:16','2023-05-30 15:21:16'),(4,'TPP7904',1,'C027',1,726000.00,'pending',0,'2023-05-30 15:27:49','2023-05-30 15:27:49'),(5,'MP61170',1,'C006',1,720000.00,'pending',0,'2023-06-02 13:32:15','2023-06-02 13:32:15');
/*!40000 ALTER TABLE `batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budget_heads`
--

DROP TABLE IF EXISTS `budget_heads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget_heads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `budget_heads_label_unique` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budget_heads`
--

LOCK TABLES `budget_heads` WRITE;
/*!40000 ALTER TABLE `budget_heads` DISABLE KEYS */;
INSERT INTO `budget_heads` VALUES (1,'OPERATING','operating','2023-04-26 09:38:17','2023-04-26 09:38:17'),(2,'PERSONEL','personel','2023-04-26 09:38:17','2023-04-26 09:38:17'),(3,'OVERHEAD','overhead','2023-04-26 09:38:17','2023-04-26 09:38:17'),(4,'CAPITAL','capital','2023-04-26 09:38:17','2023-04-26 09:38:17'),(5,'Testing','testing','2023-04-26 11:00:35','2023-04-26 11:00:35'),(6,'OTHER PAYMENTS','other-payments','2023-05-11 12:02:01','2023-05-11 12:02:01');
/*!40000 ALTER TABLE `budget_heads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_label_unique` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'SERVICE','service','A service type category','2023-04-26 09:40:42','2023-04-26 10:37:10'),(2,'LOAN','loan','A loan category','2023-04-26 09:40:42','2023-04-26 10:37:40'),(3,'REQUEST','request',NULL,'2023-04-26 09:40:42','2023-04-26 09:40:42'),(4,'STAFF','staff',NULL,'2023-04-26 09:40:42','2023-04-26 09:40:42'),(5,'INVENTORY','inventory',NULL,'2023-04-26 09:40:42','2023-04-26 09:40:42'),(6,'WELFARE','welfare',NULL,'2023-04-26 09:40:42','2023-04-26 09:40:42'),(7,'ASSETS','assets',NULL,'2023-04-26 09:40:42','2023-04-26 09:40:42'),(8,'PROJECTS','projects',NULL,'2023-04-26 09:40:42','2023-04-26 09:40:42'),(9,'LOGISTICS','logistics',NULL,'2023-04-26 09:40:42','2023-04-26 09:40:42'),(10,'TRAINING','training',NULL,'2023-04-26 09:40:42','2023-04-26 09:40:42'),(11,'COMMITTEE','committee',NULL,'2023-04-26 09:40:42','2023-04-26 09:40:42'),(12,'Testing','testing','A test','2023-04-26 10:39:28','2023-04-26 10:39:28');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chart_of_accounts`
--

DROP TABLE IF EXISTS `chart_of_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chart_of_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_code_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chart_of_accounts_code_unique` (`code`),
  KEY `chart_of_accounts_account_code_id_foreign` (`account_code_id`),
  CONSTRAINT `chart_of_accounts_account_code_id_foreign` FOREIGN KEY (`account_code_id`) REFERENCES `account_codes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chart_of_accounts`
--

LOCK TABLES `chart_of_accounts` WRITE;
/*!40000 ALTER TABLE `chart_of_accounts` DISABLE KEYS */;
INSERT INTO `chart_of_accounts` VALUES (1,1,'11110','CASH AT HAND','This account refers to money (bills and coins) still in the possession of the cooperative’s custodian.','2023-05-19 13:49:47','2023-05-19 13:52:36'),(2,1,'11120','CHECKS & OTHER CASH ITEMS (COCI)','This account refers to dated checks, postal money order (PMO) and demand drafts awaiting deposits','2023-05-19 13:50:57','2023-05-19 13:50:57'),(3,1,'11140','CASH IN COOPERATIVE FEDERATION','This account refers to money deposited in the bank under the name of the cooperative, i.e. savings, current, time deposits, and combo-account.  A subsidiary ledger shall be maintained for each bank account.','2023-05-19 13:51:54','2023-05-19 13:51:54'),(4,1,'11150','PETTY CASH FUND','This account refers to limited amount of money set aside for small expenditures such as stationeries, supplies and fares maintained under an imprest system. It should be replenished periodically when the fund gets low.','2023-05-19 13:53:42','2023-05-19 13:53:42'),(5,1,'11160','REVOVLING FUND','This account refers to the amount set aside to cover disbursements for recurring transactions maintained under an imprest system. It should be replenished periodically when the fund gets low . This may include emergency purchases, withdrawal of deposits, release of loan proceeds, etc., the maximum amount of which shall be predetermined by the Management Committee.','2023-05-19 13:54:17','2023-05-19 13:54:17'),(6,1,'11210','LOAN RECEIVABLE - CURRENT','This account refers to the outstanding balance of loans granted to the members which are not yet due.','2023-05-19 13:57:39','2023-05-19 13:57:39'),(7,1,'11220','LOAN RECEIVEABLE - OVERDUE','This account refers to outstanding balance of loans to member-borrowers not paid on installment due dates using the Portfolio at Risk (PAR).','2023-05-19 13:58:17','2023-05-19 13:58:17'),(8,1,'11130','CASH IN BANK','This account refers to money deposited in the bank under the name of the cooperative, i.e. savings, current, time deposits, and combo-account.  A subsidiary ledger shall be maintained for each bank account.','2023-06-03 10:30:11','2023-06-03 10:30:11');
/*!40000 ALTER TABLE `chart_of_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contributions`
--

DROP TABLE IF EXISTS `contributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contributions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `fee` decimal(30,2) NOT NULL DEFAULT '0.00',
  `month` enum('january','february','march','april','may','june','july','august','september','october','november','december') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'january',
  `year` bigint NOT NULL DEFAULT '0',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `current` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contributions_user_id_foreign` (`user_id`),
  CONSTRAINT `contributions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contributions`
--

LOCK TABLES `contributions` WRITE;
/*!40000 ALTER TABLE `contributions` DISABLE KEYS */;
INSERT INTO `contributions` VALUES (1,1,60000.00,'april',0,'active',1,'2023-04-24 12:29:11','2023-04-24 12:29:11'),(2,2,0.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(3,3,100000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(4,4,250000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(5,5,50000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(6,6,50000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(7,7,10000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(8,8,120000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(9,9,5000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(10,10,10000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(11,11,10000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(12,12,100000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(13,13,40000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(14,14,80000.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(15,15,0.00,'april',0,'active',1,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(16,16,10000.00,'april',0,'active',1,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(17,17,20000.00,'april',0,'active',1,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(18,18,20000.00,'april',0,'active',1,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(19,19,0.00,'april',0,'active',1,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(20,20,75000.00,'april',0,'active',1,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(21,21,75000.00,'april',0,'active',1,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(22,22,50000.00,'april',0,'active',1,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(23,23,0.00,'april',0,'active',1,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(24,24,20000.00,'april',0,'active',1,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(25,25,50000.00,'april',0,'active',1,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(26,26,30000.00,'april',0,'active',1,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(27,27,20000.00,'april',0,'active',1,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(28,28,50000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(29,29,50000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(30,30,70000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(31,31,10000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(32,32,10000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(33,33,25000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(34,34,10000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(35,35,10000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(36,36,30000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(37,37,25000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(38,38,20000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(39,39,40000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(40,40,30000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(41,41,30000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(42,42,20000.00,'april',0,'active',1,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(43,43,50000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(44,44,100000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(45,45,20000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(46,46,50000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(47,47,70000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(48,48,100000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(49,49,20000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(50,50,30000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(51,51,20000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(52,52,50000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(53,53,50000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(54,54,30000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(55,55,5000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(56,56,10000.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(57,57,0.00,'april',0,'active',1,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(58,58,20000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(59,59,20000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(60,60,5000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(61,61,40000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(62,62,10000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(63,63,10000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(64,64,5000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(65,65,10000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(66,66,10000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(67,67,85000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(68,68,50000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(69,69,20000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(70,70,50000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(71,71,30000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(72,72,50000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(73,73,10000.00,'april',0,'active',1,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(74,74,5000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(75,75,100000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(76,76,50000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(77,77,40000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(78,78,10000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(79,79,10000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(80,80,80000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(81,81,10000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(82,82,30000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(83,83,0.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(84,84,50000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(85,85,50000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(86,86,5000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(87,87,20000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(88,88,90000.00,'april',0,'active',1,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(89,89,100000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(90,90,5000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(91,91,110000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(92,92,10000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(93,93,200000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(94,94,70000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(95,95,30000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(96,96,30000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(97,97,100000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(98,98,10000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(99,99,15000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(100,100,10000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(101,101,20000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(102,102,10000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(103,103,50000.00,'april',0,'active',1,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(104,104,50000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(105,105,100000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(106,106,20000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(107,107,10000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(108,108,70000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(109,109,20000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(110,110,20000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(111,111,150000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(112,112,20000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(113,113,20000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(114,114,50000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(115,115,20000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(116,116,50000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(117,117,30000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(118,118,50000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(119,119,100000.00,'april',0,'active',1,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(120,120,100000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(121,121,10000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(122,122,30000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(123,123,20000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(124,124,10000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(125,125,130000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(126,126,20000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(127,127,10000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(128,128,5000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(129,129,5000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(130,130,10000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(131,131,15000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(132,132,50000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(133,133,50000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(134,134,30000.00,'april',0,'active',1,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(135,135,20000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(136,136,30000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(137,137,0.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(138,138,0.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(139,139,0.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(140,140,50000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(141,141,50000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(142,142,15000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(143,143,10000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(144,144,50000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(145,145,10000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(146,146,10000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(147,147,20000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(148,148,45000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(149,149,10000.00,'april',0,'active',1,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(150,150,10000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(151,151,50000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(152,152,10000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(153,153,70000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(154,154,10000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(155,155,60000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(156,156,10000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(157,157,20000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(158,158,50000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(159,159,20000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(160,160,10000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(161,161,50000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(162,162,75000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(163,163,15000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(164,164,30000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(165,165,20000.00,'april',0,'active',1,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(166,166,70000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(167,167,0.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(168,168,5000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(169,169,100000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(170,170,30000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(171,171,30000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(172,172,30000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(173,173,30000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(174,174,0.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(175,175,20000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(176,176,10000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(177,177,25000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(178,178,0.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(179,179,0.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(180,180,20000.00,'april',0,'active',1,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(181,181,5000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(182,182,10000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(183,183,20000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(184,184,0.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(185,185,100000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(186,186,20000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(187,187,50000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(188,188,20000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(189,189,200000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(190,190,50000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(191,191,0.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(192,192,5000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(193,193,30000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(194,194,70000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(195,195,50000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(196,196,100000.00,'april',0,'active',1,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(197,197,30000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(198,198,5000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(199,199,20000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(200,200,40000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(201,201,10000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(202,202,5000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(203,203,50000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(204,204,10000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(205,205,50000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(206,206,30000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(207,207,25000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(208,208,20000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(209,209,10000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(210,210,50000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(211,211,20000.00,'april',0,'active',1,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(212,212,20000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(213,213,300000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(214,214,20000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(215,215,10000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(216,216,10000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(217,217,10000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(218,218,10000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(219,219,50000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(220,220,50000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(221,221,10000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(222,222,30000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(223,223,10000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(224,224,10000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(225,225,20000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(226,226,50000.00,'april',0,'active',1,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(227,227,20000.00,'april',0,'active',1,'2023-04-26 09:35:08','2023-04-26 09:35:08'),(228,228,20000.00,'april',0,'active',1,'2023-04-26 09:35:08','2023-04-26 09:35:08'),(229,229,30000.00,'april',0,'active',1,'2023-04-26 09:35:08','2023-04-26 09:35:08'),(230,230,100000.00,'april',0,'active',1,'2023-04-26 09:35:08','2023-04-26 09:35:08'),(231,231,50000.00,'may',2023,'active',1,'2023-05-27 09:18:25','2023-05-27 09:18:25');
/*!40000 ALTER TABLE `contributions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `trxRef` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','verified','failed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `resolved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deposits_trxref_unique` (`trxRef`),
  KEY `deposits_user_id_foreign` (`user_id`),
  CONSTRAINT `deposits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES (1,1,'TRX094677',500000.00,'verified',1,'2023-05-28 09:02:52','2023-05-28 09:48:03'),(2,1,'TRX526578',1200000.00,'verified',1,'2023-05-30 15:35:17','2023-05-30 15:36:31');
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `electronics`
--

DROP TABLE IF EXISTS `electronics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `electronics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `approved_amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `duration` int NOT NULL DEFAULT '0',
  `preferred_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `electronics_code_unique` (`code`),
  KEY `electronics_user_id_foreign` (`user_id`),
  CONSTRAINT `electronics_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `electronics`
--

LOCK TABLES `electronics` WRITE;
/*!40000 ALTER TABLE `electronics` DISABLE KEYS */;
/*!40000 ALTER TABLE `electronics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenditures`
--

DROP TABLE IF EXISTS `expenditures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenditures` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `sub_budget_head_id` bigint unsigned NOT NULL,
  `loan_id` bigint NOT NULL DEFAULT '0',
  `batch_id` bigint NOT NULL DEFAULT '0',
  `trxRef` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `beneficiary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `type` enum('inflow','outflow') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'outflow',
  `category` enum('loan','deposit','salary','contribution','dividend','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'loan',
  `method` enum('cash','electronic','check','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'electronic',
  `payment_type` enum('staff','member','third-party','other') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `status` enum('pending','cleared','batched','reversed','deposit','paid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `expenditureable_id` bigint unsigned NOT NULL,
  `expenditureable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `expenditures_trxref_unique` (`trxRef`),
  KEY `expenditures_user_id_foreign` (`user_id`),
  KEY `expenditures_sub_budget_head_id_foreign` (`sub_budget_head_id`),
  CONSTRAINT `expenditures_sub_budget_head_id_foreign` FOREIGN KEY (`sub_budget_head_id`) REFERENCES `sub_budget_heads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expenditures_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenditures`
--

LOCK TABLES `expenditures` WRITE;
/*!40000 ALTER TABLE `expenditures` DISABLE KEYS */;
INSERT INTO `expenditures` VALUES (2,1,25,0,2,'LN808035','Raaxo Synergy Limited','Payment for the automation of the cooperative portal',4500000.00,'outflow','other','electronic','third-party','cleared',1,'App\\Models\\Organization','2023-05-23 08:54:23','2023-05-28 06:56:13'),(3,1,6,5,3,'LN238588','Super Administrator','Television Set Purchase',1000000.00,'outflow','loan','electronic','member','cleared',1,'App\\Models\\User','2023-05-30 15:17:35','2023-05-30 15:21:16'),(4,1,26,0,4,'LN044541','Raaxo Synergy Limited','2nd Milestone for web app payment',726000.00,'outflow','other','electronic','third-party','cleared',1,'App\\Models\\Organization','2023-05-30 15:27:28','2023-05-30 15:27:49'),(5,1,6,6,5,'EXP86958','OKEZIE UNAGHA','A description here',720000.00,'outflow','loan','electronic','member','cleared',227,'App\\Models\\User','2023-06-02 13:31:40','2023-06-02 13:32:15');
/*!40000 ALTER TABLE `expenditures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sub_budget_head_id` bigint unsigned NOT NULL,
  `frequency` enum('months','years') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'months',
  `commitment` bigint NOT NULL DEFAULT '0',
  `max_repayment_tenor` bigint NOT NULL DEFAULT '0',
  `offer_limit` decimal(30,2) NOT NULL DEFAULT '0.00',
  `percentage_deduction` bigint NOT NULL DEFAULT '0',
  `payable_from` enum('salary','upfront','special','custom') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'salary',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `features_sub_budget_head_id_foreign` (`sub_budget_head_id`),
  CONSTRAINT `features_sub_budget_head_id_foreign` FOREIGN KEY (`sub_budget_head_id`) REFERENCES `sub_budget_heads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (6,5,'months',0,12,4000000.00,0,'salary','2023-04-29 15:16:58','2023-05-17 12:45:53'),(7,6,'months',0,12,6000000.00,0,'salary','2023-04-29 15:21:05','2023-04-29 15:21:05'),(8,8,'years',30,3,20000000.00,4,'custom','2023-04-29 15:39:32','2023-04-29 15:39:32'),(9,7,'months',0,12,3000000.00,0,'salary','2023-04-29 15:41:05','2023-04-29 15:41:05'),(10,4,'years',0,1,30000000.00,12,'upfront','2023-04-29 15:46:04','2023-04-29 15:46:04');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funds`
--

DROP TABLE IF EXISTS `funds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sub_budget_head_id` bigint unsigned NOT NULL,
  `approved_amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `booked_expenditure` decimal(30,2) NOT NULL DEFAULT '0.00',
  `actual_expenditure` decimal(30,2) NOT NULL DEFAULT '0.00',
  `booked_balance` decimal(30,2) NOT NULL DEFAULT '0.00',
  `actual_balance` decimal(30,2) NOT NULL DEFAULT '0.00',
  `year` int NOT NULL DEFAULT '0',
  `isExhausted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funds_sub_budget_head_id_foreign` (`sub_budget_head_id`),
  CONSTRAINT `funds_sub_budget_head_id_foreign` FOREIGN KEY (`sub_budget_head_id`) REFERENCES `sub_budget_heads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funds`
--

LOCK TABLES `funds` WRITE;
/*!40000 ALTER TABLE `funds` DISABLE KEYS */;
INSERT INTO `funds` VALUES (1,1,60000000.00,0.00,0.00,60000000.00,60000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(2,2,200000000.00,0.00,0.00,200000000.00,200000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(3,3,310000000.00,0.00,0.00,310000000.00,310000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(4,4,250000000.00,0.00,0.00,250000000.00,250000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(5,5,30000000.00,0.00,0.00,31200000.00,30000000.00,2023,0,'2023-04-26 09:41:57','2023-05-23 08:00:45'),(6,6,10000000.00,1720000.00,0.00,8280000.00,10000000.00,2023,0,'2023-04-26 09:41:57','2023-06-02 13:31:40'),(7,7,25000000.00,0.00,0.00,25000000.00,25000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(8,8,40000000.00,0.00,0.00,40000000.00,40000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(9,9,40000000.00,0.00,0.00,40000000.00,40000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(10,10,10000000.00,0.00,0.00,10000000.00,10000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(11,11,15000000.00,0.00,0.00,15000000.00,15000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(12,12,430000.00,0.00,0.00,430000.00,430000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(13,13,3500000.00,0.00,0.00,3500000.00,3500000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(14,14,1500000.00,0.00,0.00,1500000.00,1500000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(15,15,100000.00,0.00,0.00,100000.00,100000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(16,16,1500000.00,0.00,0.00,1500000.00,1500000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(17,17,250000.00,0.00,0.00,250000.00,250000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(18,18,300000.00,0.00,0.00,300000.00,300000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(19,19,700000.00,0.00,0.00,700000.00,700000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(20,20,3000000.00,0.00,0.00,3000000.00,3000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(21,21,10000000.00,0.00,0.00,10000000.00,10000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(22,22,400000.00,0.00,0.00,400000.00,400000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(23,23,700000.00,0.00,0.00,700000.00,700000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(24,24,20000000.00,0.00,0.00,20000000.00,20000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(25,25,5000000.00,4500000.00,0.00,500000.00,5000000.00,2023,0,'2023-04-26 09:41:57','2023-05-23 08:54:23'),(26,26,2500000.00,726000.00,0.00,1774000.00,2500000.00,2023,0,'2023-04-26 09:41:57','2023-05-30 15:27:28'),(27,27,1000000.00,0.00,0.00,1000000.00,1000000.00,2023,0,'2023-04-26 09:41:57','2023-04-26 09:41:57'),(28,29,500000000.00,0.00,0.00,500000000.00,500000000.00,2023,0,'2023-04-26 14:09:05','2023-04-26 14:09:05'),(29,28,1000000000.00,0.00,0.00,1000000000.00,1000000000.00,2023,0,'2023-04-26 14:10:27','2023-04-26 14:10:27');
/*!40000 ALTER TABLE `funds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guarantors`
--

DROP TABLE IF EXISTS `guarantors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guarantors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `guarantors_loan_id_foreign` (`loan_id`),
  KEY `guarantors_user_id_foreign` (`user_id`),
  CONSTRAINT `guarantors_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guarantors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guarantors`
--

LOCK TABLES `guarantors` WRITE;
/*!40000 ALTER TABLE `guarantors` DISABLE KEYS */;
INSERT INTO `guarantors` VALUES (10,5,197,'Please Approve','approved','2023-05-30 14:52:11','2023-05-30 14:56:28'),(11,5,162,'Please Approve','approved','2023-05-30 14:52:11','2023-05-30 14:58:11'),(14,5,46,'Please Approve','approved','2023-05-30 15:04:08','2023-05-30 15:12:13');
/*!40000 ALTER TABLE `guarantors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `installments`
--

DROP TABLE IF EXISTS `installments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `installments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `loan_id` bigint unsigned NOT NULL,
  `capital` decimal(30,2) NOT NULL DEFAULT '0.00',
  `fee` decimal(30,2) NOT NULL DEFAULT '0.00',
  `interest` decimal(30,2) NOT NULL DEFAULT '0.00',
  `interestSum` decimal(30,2) NOT NULL DEFAULT '0.00',
  `balance` decimal(30,2) NOT NULL DEFAULT '0.00',
  `due_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `status` enum('pending','paid','overdue') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `installments_loan_id_foreign` (`loan_id`),
  CONSTRAINT `installments_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `installments`
--

LOCK TABLES `installments` WRITE;
/*!40000 ALTER TABLE `installments` DISABLE KEYS */;
INSERT INTO `installments` VALUES (63,5,112000.00,9333.33,0.00,12000.00,0.00,'2023-06-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(64,5,112000.00,9333.33,0.00,12000.00,0.00,'2023-07-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(65,5,112000.00,9333.33,0.00,12000.00,0.00,'2023-08-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(66,5,112000.00,9333.33,0.00,12000.00,0.00,'2023-09-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(67,5,112000.00,9333.33,0.00,12000.00,0.00,'2023-10-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(68,5,112000.00,9333.33,0.00,12000.00,0.00,'2023-11-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(69,5,112000.00,9333.33,0.00,12000.00,0.00,'2023-12-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(70,5,112000.00,9333.33,0.00,12000.00,0.00,'2024-01-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(71,5,112000.00,9333.33,0.00,12000.00,0.00,'2024-02-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(72,5,112000.00,9333.33,0.00,12000.00,0.00,'2024-03-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(73,5,112000.00,9333.33,0.00,12000.00,0.00,'2024-04-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(74,5,112000.00,9333.33,0.00,12000.00,0.00,'2024-05-26 00:00:00',NULL,'pending',0,'2023-05-30 14:51:09','2023-05-30 14:51:09'),(75,6,806400.00,89600.00,0.00,86400.00,0.00,'2023-10-26 00:00:00',NULL,'pending',0,'2023-06-02 13:07:47','2023-06-02 13:07:47'),(76,6,806400.00,89600.00,0.00,86400.00,0.00,'2023-11-26 00:00:00',NULL,'pending',0,'2023-06-02 13:07:47','2023-06-02 13:07:47'),(77,6,806400.00,89600.00,0.00,86400.00,0.00,'2023-12-26 00:00:00',NULL,'pending',0,'2023-06-02 13:07:47','2023-06-02 13:07:47'),(78,6,806400.00,89600.00,0.00,86400.00,0.00,'2024-01-26 00:00:00',NULL,'pending',0,'2023-06-02 13:07:47','2023-06-02 13:07:47'),(79,6,806400.00,89600.00,0.00,86400.00,0.00,'2024-02-26 00:00:00',NULL,'pending',0,'2023-06-02 13:07:47','2023-06-02 13:07:47'),(80,6,806400.00,89600.00,0.00,86400.00,0.00,'2024-03-26 00:00:00',NULL,'pending',0,'2023-06-02 13:07:47','2023-06-02 13:07:47'),(81,6,806400.00,89600.00,0.00,86400.00,0.00,'2024-04-26 00:00:00',NULL,'pending',0,'2023-06-02 13:07:47','2023-06-02 13:07:47'),(82,6,806400.00,89600.00,0.00,86400.00,0.00,'2024-05-26 00:00:00',NULL,'pending',0,'2023-06-02 13:07:47','2023-06-02 13:07:47'),(83,6,806400.00,89600.00,0.00,86400.00,0.00,'2024-06-26 00:00:00',NULL,'pending',0,'2023-06-02 13:07:47','2023-06-02 13:07:47');
/*!40000 ALTER TABLE `installments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `expenditure_id` bigint unsigned NOT NULL,
  `chart_of_account_id` bigint unsigned NOT NULL,
  `credit_account_id` bigint unsigned NOT NULL,
  `debit_account_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `journals_expenditure_id_foreign` (`expenditure_id`),
  KEY `journals_chart_of_account_id_foreign` (`chart_of_account_id`),
  KEY `journals_credit_account_id_foreign` (`credit_account_id`),
  KEY `journals_debit_account_id_foreign` (`debit_account_id`),
  CONSTRAINT `journals_chart_of_account_id_foreign` FOREIGN KEY (`chart_of_account_id`) REFERENCES `chart_of_accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `journals_credit_account_id_foreign` FOREIGN KEY (`credit_account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `journals_debit_account_id_foreign` FOREIGN KEY (`debit_account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `journals_expenditure_id_foreign` FOREIGN KEY (`expenditure_id`) REFERENCES `expenditures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (1,2,6,1,5,'2023-05-26 11:09:28','2023-05-26 11:09:28'),(2,4,4,1,3,'2023-05-30 15:29:29','2023-05-30 15:29:29');
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledgers`
--

DROP TABLE IF EXISTS `ledgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledgers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `journal_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `type` enum('D','C') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'D',
  `post_date` datetime DEFAULT NULL,
  `status` enum('pending','fulfilled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ledgers_journal_id_foreign` (`journal_id`),
  KEY `ledgers_account_id_foreign` (`account_id`),
  CONSTRAINT `ledgers_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ledgers_journal_id_foreign` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledgers`
--

LOCK TABLES `ledgers` WRITE;
/*!40000 ALTER TABLE `ledgers` DISABLE KEYS */;
INSERT INTO `ledgers` VALUES (1,1,5,4500000.00,'D','2023-05-26 12:09:28','pending','2023-05-26 11:09:28','2023-05-26 11:09:28'),(2,1,1,4500000.00,'C','2023-05-26 12:09:28','pending','2023-05-26 11:09:28','2023-05-26 11:09:28'),(3,2,3,726000.00,'D','2023-05-30 16:29:29','fulfilled','2023-05-30 15:29:29','2023-05-30 15:30:11'),(4,2,1,726000.00,'C','2023-05-30 16:29:29','fulfilled','2023-05-30 15:29:29','2023-05-30 15:30:15');
/*!40000 ALTER TABLE `ledgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquidations`
--

DROP TABLE IF EXISTS `liquidations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquidations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `loan_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `type` enum('partial','complete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'partial',
  `status` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `liquidations_code_unique` (`code`),
  KEY `liquidations_user_id_foreign` (`user_id`),
  KEY `liquidations_loan_id_foreign` (`loan_id`),
  CONSTRAINT `liquidations_loan_id_foreign` FOREIGN KEY (`loan_id`) REFERENCES `loans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `liquidations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidations`
--

LOCK TABLES `liquidations` WRITE;
/*!40000 ALTER TABLE `liquidations` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquidations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `sub_budget_head_id` bigint unsigned NOT NULL,
  `preferred_tenor` bigint NOT NULL DEFAULT '0',
  `request_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `approved_amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `interest_rate` bigint NOT NULL DEFAULT '0',
  `commitment_rate` bigint NOT NULL DEFAULT '0',
  `remittance` decimal(30,2) NOT NULL DEFAULT '0.00',
  `deduction` decimal(30,2) NOT NULL DEFAULT '0.00',
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deduction_month` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capitalSum` decimal(30,2) NOT NULL DEFAULT '0.00',
  `commitment` decimal(30,2) NOT NULL DEFAULT '0.00',
  `interestSum` decimal(30,2) NOT NULL DEFAULT '0.00',
  `totalPayable` decimal(30,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','registered','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `state` enum('active','inactive','repaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loans_request_code_unique` (`request_code`),
  KEY `loans_user_id_foreign` (`user_id`),
  KEY `loans_sub_budget_head_id_foreign` (`sub_budget_head_id`),
  CONSTRAINT `loans_sub_budget_head_id_foreign` FOREIGN KEY (`sub_budget_head_id`) REFERENCES `sub_budget_heads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `loans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
INSERT INTO `loans` VALUES (5,1,6,12,'C006511184',1000000.00,0.00,12,0,100000.00,0.00,'Television Set Purchase',NULL,0.00,0.00,12000.00,112000.00,'approved','inactive',0,0,'2023-05-30 14:51:09','2023-05-30 15:15:05'),(6,227,6,9,'C006295956',720000.00,720000.00,12,0,720000.00,0.00,'A description here',NULL,0.00,0.00,86400.00,806400.00,'approved','inactive',0,0,'2023-06-02 13:07:47','2023-06-02 13:14:55');
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_reset_tokens_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2016_06_01_000001_create_oauth_auth_codes_table',1),(5,'2016_06_01_000002_create_oauth_access_tokens_table',1),(6,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(7,'2016_06_01_000004_create_oauth_clients_table',1),(8,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(9,'2019_08_19_000000_create_failed_jobs_table',1),(10,'2019_12_14_000001_create_personal_access_tokens_table',1),(11,'2023_04_19_111645_add_columns_to_users_table',1),(12,'2023_04_20_093005_create_organizations_table',1),(13,'2023_04_20_093821_create_accounts_table',1),(14,'2023_04_20_094359_create_contributions_table',1),(15,'2023_04_20_095145_create_categories_table',1),(16,'2023_04_20_095341_create_settings_table',1),(17,'2023_04_20_095948_create_account_codes_table',1),(18,'2023_04_20_100425_create_chart_of_accounts_table',1),(19,'2023_04_20_101016_create_budget_heads_table',1),(20,'2023_04_20_101123_create_sub_budget_heads_table',1),(21,'2023_04_20_101729_create_funds_table',1),(22,'2023_04_20_102809_create_features_table',1),(23,'2023_04_20_104435_create_modules_table',1),(24,'2023_04_20_104936_create_roles_table',1),(25,'2023_04_20_105324_create_roleables_table',1),(26,'2023_04_20_105646_create_loans_table',1),(27,'2023_04_20_110535_create_installments_table',1),(28,'2023_04_20_111118_create_guarantors_table',1),(29,'2023_04_20_111923_create_expenditures_table',1),(30,'2023_04_20_124346_create_transactions_table',1),(31,'2023_04_20_125245_create_journals_table',1),(32,'2023_04_20_125853_create_ledgers_table',1),(33,'2023_04_20_130455_create_batches_table',1),(34,'2023_04_20_131023_create_deposits_table',1),(35,'2023_04_20_131337_create_services_table',1),(36,'2023_04_20_131636_create_service_requests_table',1),(37,'2023_04_22_214024_create_wallets_table',1),(38,'2023_04_25_145636_add_column_to_sub_budget_heads_table',2),(39,'2023_04_28_125148_add_columns_to_loans_table',3),(40,'2023_04_29_050925_create_variants_table',4),(41,'2023_04_29_162317_add_columns_to_features_table',5),(43,'2023_05_08_231811_add_even_more_columns_to_loans_table',6),(45,'2023_05_10_131848_alter_columns_on_expenditure_table',7),(46,'2023_05_11_002638_add_unique_code_to_batches',8),(47,'2023_05_11_093329_add_budget_code_to_batches_table',9),(48,'2023_05_21_222555_create_projects_table',10),(50,'2023_05_22_081101_create_awards_table',11),(52,'2023_05_23_084926_add_columns_to_expenditure_table',12),(53,'2023_05_26_121051_add_column_to_ledgers_table',13),(54,'2023_05_27_101222_add_columns_to_contributions_table',14),(55,'2023_05_27_115320_add_columns_to_users_table',15),(56,'2023_05_29_221220_create_airplanes_table',16),(72,'2023_05_29_221842_create_air_tickets_table',17),(73,'2023_05_29_221855_create_passengers_table',17),(77,'2023_06_01_231832_create_electronics_table',18),(78,'2023_06_04_121743_create_liquidations_table',19);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parentId` bigint NOT NULL DEFAULT '0',
  `type` enum('application','module','page') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'module',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `modules_label_unique` (`label`),
  UNIQUE KEY `modules_code_unique` (`code`),
  UNIQUE KEY `modules_url_unique` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,'Administration','administration','ADM','engineering','/administration',0,'application','2023-04-24 12:29:11','2023-04-24 12:29:11'),(2,'Configuration','configuration','CNF','construction','/administration/configuration',1,'module','2023-04-24 12:29:11','2023-04-24 12:29:11'),(3,'Import','import','IMP','upload','/administration/import',2,'page','2023-04-24 12:29:11','2023-04-24 12:29:11'),(4,'Settings','settings','STS','settings','/administration/settings',2,'page','2023-04-24 12:29:11','2023-04-24 12:29:11'),(5,'Modules','modules','MOD','grid_view','/administration/modules',2,'page','2023-04-24 20:28:11','2023-04-24 20:28:11'),(6,'Secretariat','secretariat','SCR','corporate_fare','/secretariat',0,'application','2023-04-25 10:05:19','2023-04-25 10:05:19'),(8,'Budget','budget','BGT','account_balance','/secretariat/budget',6,'module','2023-04-25 10:12:29','2023-04-25 10:12:29'),(9,'Budget Heads','budget-heads','BHD','store','/secretariat/budget-heads',8,'page','2023-04-25 10:15:17','2023-04-25 10:15:17'),(10,'Sub Heads','sub-heads','SBH','domain','/secretariat/sub-budget-heads',8,'page','2023-04-25 10:18:13','2023-04-25 10:20:02'),(12,'Accounting','accounting','ACT','account_tree','/secretariat/accounting',6,'module','2023-04-25 10:52:39','2023-04-25 10:54:42'),(13,'Account Codes','account-codes','ACE','savings','/secretariat/account-codes',12,'page','2023-04-25 10:56:40','2023-04-25 11:06:37'),(14,'Chart Accounts','chart-accounts','COA','subtitles','/secretariat/chart-of-accounts',12,'page','2023-04-25 10:57:52','2023-04-25 11:06:52'),(15,'Journals','journals','JOR','receipt','/secretariat/journals',12,'page','2023-04-25 10:59:10','2023-04-25 10:59:10'),(16,'Ledgers','ledgers','LDG','article','/secretariat/ledgers',12,'page','2023-04-25 10:59:58','2023-04-25 10:59:58'),(17,'Expenditures','expenditures','EXP','shopping_cart','/secretariat/expenditures',8,'page','2023-04-25 11:01:06','2023-04-25 11:01:06'),(18,'Batch','batch','BTH','layers','/secretariat/batches',8,'page','2023-04-25 11:02:53','2023-04-25 11:02:53'),(19,'Funds','funds','FND','account_balance_wallet','/secretariat/funds',8,'page','2023-04-25 11:27:03','2023-04-25 11:27:03'),(20,'Categories','categories','CTE','category','/secretariat/categories',8,'page','2023-04-25 14:00:57','2023-04-25 14:00:57'),(21,'Features','features','FTS','menu','/secretariat/features',8,'page','2023-04-25 14:33:48','2023-04-25 14:34:49'),(22,'Stakeholders','stakeholders','SKE','groups','/stakeholders',0,'application','2023-04-27 05:31:10','2023-04-27 05:31:10'),(23,'Requests','requests','RQS','public','/stakeholders/requests',22,'module','2023-04-27 05:32:32','2023-04-27 05:39:44'),(24,'Loans','loans','LNS','work','/stakeholders/loans',23,'page','2023-04-27 05:37:29','2023-04-27 05:37:29'),(25,'Activity','activity','ACV','rowing','/stakeholders/activity',22,'module','2023-05-04 14:58:53','2023-05-04 14:58:53'),(26,'Sureties','sureties','SRE','face','/stakeholders/sureties',25,'page','2023-05-04 22:53:05','2023-05-04 22:53:05'),(27,'Decisions','decisions','DSC','handshake','/secretariat/decisions',6,'module','2023-05-08 10:19:19','2023-05-08 10:19:19'),(28,'Registered Loans','registered-loans','RGL','bar_chart','/secretariat/registered-loans',27,'page','2023-05-08 10:20:25','2023-05-08 10:21:21'),(29,'Payments','payments','PYT','receipt','/secretariat/payments',8,'page','2023-05-10 20:00:41','2023-05-10 20:00:41'),(30,'Works','works','PRJ','work','/secretariat/works',6,'module','2023-05-21 12:55:09','2023-05-21 12:58:41'),(31,'Vendors','vendors','VND','apartment','/secretariat/vendors',30,'page','2023-05-21 12:57:02','2023-05-21 12:57:02'),(32,'Accounts','accounts','ACO','account_balance','/secretariat/accounts',30,'page','2023-05-21 13:03:34','2023-05-21 13:03:34'),(33,'Projects','projects','PRG','psychology','/secretariat/projects',30,'page','2023-05-21 22:21:06','2023-05-21 22:21:06'),(34,'Contracts','contracts','CTR','gavel','/secretariat/contract/awards',30,'page','2023-05-22 22:23:32','2023-05-22 22:23:32'),(35,'Members','members','MEM','groups','/secretariat/members',27,'page','2023-05-26 12:47:25','2023-05-26 12:47:25'),(36,'Roles','roles','RLE','assignment','/administration/roles',2,'page','2023-05-28 00:25:39','2023-05-28 00:25:39'),(37,'Deposits','deposits','DPT','card_travel','/stakeholders/deposits',25,'page','2023-05-28 08:03:33','2023-05-28 08:15:55'),(38,'Air Tickets','air-tickets','ATK','flight','/stakeholders/air-ticket/request',23,'page','2023-05-28 08:05:58','2023-05-29 23:49:15'),(39,'Liquidate','liquidate','LQD','wallet','/stakeholders/liquidate',23,'page','2023-05-28 08:08:43','2023-05-28 08:08:43'),(40,'Manage Deposits','manage-deposits','MTD','computer','/secretariat/manage/deposits',27,'page','2023-05-28 09:05:13','2023-05-28 09:05:13'),(41,'Airlines','airlines','ALI','airlines','/secretariat/airlines',30,'page','2023-05-30 00:31:35','2023-05-30 00:31:35'),(42,'Service Requests','service-requests','SRT','lan','/secretariat/service-requests',6,'module','2023-05-30 14:16:17','2023-05-30 14:16:17'),(43,'Ticket Requests','ticket-requests','TRT','flight','/secretariat/tickets',42,'page','2023-05-30 14:18:10','2023-05-30 14:19:14'),(44,'Reports','reports','RET','report','/secretariat/reports',6,'module','2023-06-01 13:40:37','2023-06-01 13:40:37'),(45,'Trail Balance','trail-balance','TRB','balance','/secretariat/reports/trail-balance',44,'page','2023-06-01 13:42:33','2023-06-01 20:54:01'),(46,'Generate','generate','GRA','print','/secretariat/report/generate',44,'page','2023-06-01 21:11:57','2023-06-01 21:11:57'),(47,'Electronic Purchase','electronic-purchase','ELP','devices','/stakeholders/electronic/purchase',23,'page','2023-06-01 21:22:49','2023-06-01 21:22:49'),(48,'Electronic Requests','electronic-requests','EEQ','receipt','/secretariat/electronic/purchase/requests',42,'page','2023-06-02 01:00:14','2023-06-02 01:01:23'),(49,'Apply Loans','apply-loans','ALN','approval','/secretariat/apply/loans',30,'page','2023-06-02 01:37:20','2023-06-02 01:38:13'),(50,'Credit Members','credit-members','CMT','savings','/secretariat/credit/members',30,'page','2023-06-03 07:08:14','2023-06-03 07:08:14'),(51,'Make Deductions','make-deductions','MDC','exposure','/secretariat/make/deductions',30,'page','2023-06-03 07:09:26','2023-06-03 07:09:26'),(52,'Liquidation Requests','liquidation-requests','LQR','subtitles','/secretariat/liquidation/requests',42,'page','2023-06-04 10:37:48','2023-06-04 10:37:48');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('0410c141917c3bf8db0944d559b9a3825f318fd1ba9b1c3c24efbddffffb7f7beabc0c49548a3840',1,1,'authToken','[]',0,'2023-06-02 07:29:57','2023-06-02 07:29:57','2023-12-02 08:29:57'),('0445a6417bc5dbc6f8996836c13beadb2e4c49882e3a09a4e904de73c04bff143b992c0d9fdcbfce',1,1,'authToken','[]',1,'2023-05-30 14:28:23','2023-05-30 15:08:19','2023-11-30 15:28:23'),('04a984ea0bd5445edcfeb7825c0d4c8b9e4fae650f9982d0a5090554c1c1f8a2cc545f91b475f51b',162,1,'authToken','[]',1,'2023-05-30 14:57:59','2023-05-30 14:59:34','2023-11-30 15:57:59'),('08be77975fb33008053e6e3934cafa827790c33824dc463497ba62a06ed3a19e52b5b420e0b981d1',86,1,'authToken','[]',1,'2023-05-30 15:01:24','2023-05-30 15:03:29','2023-11-30 16:01:24'),('0a92c0c4a358161275bfda782c3e9b85d96651ea0b533ff0daee6765e180f3fea5dca9d9cd3b7a0b',1,1,'authToken','[]',0,'2023-06-01 21:23:02','2023-06-01 21:23:02','2023-12-01 22:23:02'),('0aace0cecd2ad21d56d220fb69497289fd0eb203d864958e7c767fba1abce0c6bceb81ab6699761a',1,1,'authToken','[]',1,'2023-05-28 08:16:21','2023-05-30 15:08:19','2023-11-28 09:16:21'),('0adef9752873b3fe708a0bd4d8bfbb9c13a513169a8691e6aedd70fc511ec2c5fc70a9eb9a9cca43',1,1,'authToken','[]',1,'2023-05-27 09:44:44','2023-05-30 15:08:19','2023-11-27 10:44:44'),('0eb526607290e500633f2b7c632156d0b867c45babf7efb25a4ddadd840b8fe7c450e1de6c68c92e',1,1,'authToken','[]',1,'2023-05-22 22:22:00','2023-05-30 15:08:19','2023-11-22 23:22:00'),('10e82b230d202b9ed321b53ca18409b2bb601203eda7de088c37b4f27c826a628ef12aab31d05a5e',46,1,'authToken','[]',1,'2023-05-30 15:05:28','2023-05-31 07:40:06','2023-11-30 16:05:28'),('11f59f35460132d175b77449c57cc7a5252d3432e152a0fad4e174be9198d31d4789a6afc08bdd61',1,1,'authToken','[]',1,'2023-05-28 06:55:25','2023-05-30 15:08:19','2023-11-28 07:55:25'),('22f5d5952af606770ea354a51823059578715975c663baf03b04a39a240ab4d6acbc7d26453f7aef',1,1,'authToken','[]',0,'2023-06-02 00:13:09','2023-06-02 00:13:09','2023-12-02 01:13:09'),('23069275cc150d62a9872f7216bef4f17c697d296e341a2ef5f4360e4d61364078aacc85cdbc2126',1,1,'authToken','[]',0,'2023-06-02 12:44:47','2023-06-02 12:44:47','2023-12-02 13:44:47'),('23a92dd9bea240f477609c5d86d54335ba3d782724f66169791363b9071ba96e361c010e0d86cf36',46,1,'authToken','[]',1,'2023-05-30 15:11:40','2023-05-31 07:40:06','2023-11-30 16:11:40'),('255ba6c0c071143cbb33bdf8897d9425f75194678a6cd90b65cae4657d49475b20f2f25c027e94e4',1,1,'authToken','[]',0,'2023-06-02 01:37:34','2023-06-02 01:37:34','2023-12-02 02:37:34'),('265fd69b27aaded212c1deac042ea42b235ee29d7c449987c85b3e12a9a7a43ef15f35532e969c8e',1,1,'authToken','[]',1,'2023-05-21 12:59:05','2023-05-30 15:08:19','2023-11-21 13:59:05'),('274a5fc2af02cdf11fc7f8360e1f5fef0b3c26e6df1ac55fb067bbdec2ac39ed13c60917e18cfa2e',1,1,'authToken','[]',1,'2023-05-27 09:41:32','2023-05-30 15:08:19','2023-11-27 10:41:32'),('312e846a361303137d1f8d032e972a6bfc9b8fb7b25cfd24e4747d9b63b9a2f3ac1b113ffdb35754',1,1,'authToken','[]',1,'2023-05-28 08:34:19','2023-05-30 15:08:19','2023-11-28 09:34:19'),('31b1ec8ab9dfaab254a00674310733f70d46d968799c9bf4a0a4240e778f9f81c8a71bf7b3490c64',1,1,'authToken','[]',1,'2023-05-28 09:00:56','2023-05-30 15:08:19','2023-11-28 10:00:56'),('3345e01e285c66d345ea23a14e93b2449812ec68a6c6aafa5cf27221978ac5e7d1d35614c1ee1834',86,1,'authToken','[]',1,'2023-05-30 15:01:08','2023-05-30 15:03:29','2023-11-30 16:01:08'),('3368396f466856f8ef3e150f2beced832a1dab9f7bc74c1a1fac4cb4d7ce7acf686fdf68947f0ba0',162,1,'authToken','[]',1,'2023-05-30 14:57:47','2023-05-30 14:59:34','2023-11-30 15:57:47'),('33dcc48637c3458cc55afc79d113c76d7b3624c1cec0ae9e13ba14fa6f530db5ebf9ca014b0b6e64',86,1,'authToken','[]',1,'2023-05-30 15:00:27','2023-05-30 15:03:29','2023-11-30 16:00:27'),('352f81194c0ff04b0938c97fcc515cbdefc9cdf3b3ef8b57684e09f5b515202d899747350c650e35',1,1,'authToken','[]',0,'2023-06-04 21:01:27','2023-06-04 21:01:27','2023-12-04 22:01:27'),('35d37cfc669491361013ed606eca1ce30583e4ef556f3d0a27391e7770b3d98dfe7a2b16781f8a4b',1,1,'authToken','[]',0,'2023-06-03 07:33:17','2023-06-03 07:33:17','2023-12-03 08:33:17'),('37250b563e40010947a259351d5d0614ae98f36a6c22ed765eceb1fdc8335181ae91eed3c063e4a9',1,1,'authToken','[]',0,'2023-06-04 10:04:22','2023-06-04 10:04:22','2023-12-04 11:04:22'),('38856be676c6f5c9d92ad9c516cc8fdd59417c51872b7e43311ca7fd577275d35054d77b25c82726',1,1,'authToken','[]',1,'2023-05-26 07:24:16','2023-05-30 15:08:19','2023-11-26 08:24:16'),('3c21c1e2dcfdc5ea5c14d5dbb27bce92eb4d3af0148e445fbd871b71c9ffba2e521b9ea8be9fe9b5',1,1,'authToken','[]',1,'2023-05-29 23:53:03','2023-05-30 15:08:19','2023-11-30 00:53:03'),('3c4b56196b82264fa5a30304647224804cfbb9c24a7a10b59570f2aa128ae3f305294e3df07faaae',197,1,'authToken','[]',1,'2023-05-30 14:55:14','2023-05-30 14:57:21','2023-11-30 15:55:14'),('40cac50e032bfa020920b2538ae6985f2ed448dbe6268d1bbc0b6b1650313809249f3cc409f5d955',1,1,'authToken','[]',1,'2023-05-29 23:49:30','2023-05-30 15:08:19','2023-11-30 00:49:30'),('463588d482fcdb5ac161e819424b6f44612ad1a1411050773ecb946c037f7f99e2fdd583c68ea630',1,1,'authToken','[]',0,'2023-06-04 10:00:45','2023-06-04 10:00:45','2023-12-04 11:00:45'),('476e8b1aca405fd89e2f44ebf4e4b6f53e3e6a6c094e070ce71e6ef01e36ee95c8b1792f3a24b5d5',1,1,'authToken','[]',0,'2023-05-30 15:11:17','2023-05-30 15:11:17','2023-11-30 16:11:17'),('4be45741ab30d6e4013f47f632d73f924aa376be78b2248b62a681e6b3c9cef5a9e452dabe630d3a',1,1,'authToken','[]',1,'2023-05-28 00:24:30','2023-05-30 15:08:19','2023-11-28 01:24:30'),('4ce8cc36921090c1f42c3a64ce82c293d62bd2e777e39112cb503fd044d15f0e96c2b662ee5d2f11',46,1,'authToken','[]',1,'2023-05-30 15:08:36','2023-05-31 07:40:06','2023-11-30 16:08:36'),('4e5a4ba58ca50509834c7b67e00504883d73ade3c038e1abbfa6ccf389abc166c8bd2e7a0e11fe07',1,1,'authToken','[]',0,'2023-06-04 10:30:51','2023-06-04 10:30:51','2023-12-04 11:30:51'),('522258d041ad9fd4f22a45a2933d8759ddf14f3e243720fb721274b10d9ef14018f80b9b209b82f3',1,1,'authToken','[]',0,'2023-06-02 13:04:10','2023-06-02 13:04:10','2023-12-02 14:04:10'),('53f541c17e88e4b054f0f3d7f9e249eb48e5cdc418c4fc1a2f8317c1bc538b634056b245f18f2466',86,1,'authToken','[]',1,'2023-05-30 15:01:46','2023-05-30 15:03:29','2023-11-30 16:01:46'),('5451062721f84bd03acdfefadf6fb5a4c6653e73f111edcd1a5d22b294bf0b0fb9cfc8d7cbc59d66',86,1,'authToken','[]',1,'2023-05-30 15:02:06','2023-05-30 15:03:29','2023-11-30 16:02:06'),('5c87d20b2f3d46f39716c5360f416ec0be94e0723cc87af7020d61d4668981e25bdfe34cc2a47723',1,1,'authToken','[]',1,'2023-05-28 01:22:50','2023-05-30 15:08:19','2023-11-28 02:22:50'),('5dce0bedbcc9a6e8290f324a052743eecedc05aa572bacd87f0f5c1944ab0d5f90e1bdc2ba44213a',1,1,'authToken','[]',0,'2023-06-04 08:47:53','2023-06-04 08:47:53','2023-12-04 09:47:53'),('5f69227a50029bc779c6fb10b96fb95e38581281752e448014ec9024ea53e863dc82cb26ff1dcca0',1,1,'authToken','[]',1,'2023-05-22 22:23:57','2023-05-30 15:08:19','2023-11-22 23:23:57'),('6000e70538cf70c515670fcdd071e7d820bd70d38ccc8b7e2d0c46a24858f268e341e4d5508efaea',1,1,'authToken','[]',0,'2023-06-03 07:02:38','2023-06-03 07:02:38','2023-12-03 08:02:38'),('6029fb31f6dbab0b70dffd0c74c9256d933692a0eae5c9d0e09aed240a50ac2c4be4d2886fd75491',1,1,'authToken','[]',1,'2023-05-27 08:06:50','2023-05-30 15:08:19','2023-11-27 09:06:50'),('6603f85e776715339bcb97f64a22d023a6639b2ba4376c43a24085bc307af96083818fccde00fe07',1,1,'authToken','[]',0,'2023-06-04 10:32:44','2023-06-04 10:32:44','2023-12-04 11:32:44'),('66911e7329f6000d2a038dbdb55548adaa48da3051a5502362d9324a8356265e10619af2029751c7',1,1,'authToken','[]',0,'2023-06-01 20:54:17','2023-06-01 20:54:17','2023-12-01 21:54:17'),('6b597983e65857ef250fa10ed66ed0f67caa9d8f0e84c50791f2c849f5410c2785f482903909f638',1,1,'authToken','[]',0,'2023-06-03 07:09:46','2023-06-03 07:09:46','2023-12-03 08:09:46'),('6c97d6b46d36bdfabe5f36e015bfa2b46adf7fe0c8dc006a5bd0e1b77ad7d32b8b3d147c5cfab133',86,1,'authToken','[]',1,'2023-05-30 15:02:24','2023-05-30 15:03:29','2023-11-30 16:02:24'),('72c157008c83b4a4c77f8f8f6d5f878e888c6a4ec8e12de40f9b1755d8484eefcbf3c72864337466',46,1,'authToken','[]',1,'2023-05-30 15:06:03','2023-05-31 07:40:06','2023-11-30 16:06:03'),('731e7078989f029b2a76d26c21829da76e07db2b8ad4699d6d2a87b6df4e0c4991dfcac220e29550',1,1,'authToken','[]',1,'2023-05-21 22:21:22','2023-05-30 15:08:19','2023-11-21 23:21:22'),('79b637ee56981a2f0a68e1be219199d0233d38151044bdaba8ef17e8cbc1e513be15630346c22fe2',1,1,'authToken','[]',1,'2023-05-18 14:04:39','2023-05-30 15:08:19','2023-11-18 15:04:39'),('7ef6482c993b39b145407a817f0ac4ccd2abefd40edfba2be2e462b772556faaec4ce2a552b471a3',1,1,'authToken','[]',1,'2023-05-28 09:30:29','2023-05-30 15:08:19','2023-11-28 10:30:29'),('7f76b7dfb3030b236c4cdd6291800536706a12a6cd061f7b4a8c2a1036bfb279f00b78bc3c5d2cab',1,1,'authToken','[]',1,'2023-05-18 13:28:47','2023-05-30 15:08:19','2023-11-18 14:28:47'),('819317ed4b06e8d2455a1606aff673af34b6f151c6142344721769d9603419dc49df6fbaf4ce43ea',1,1,'authToken','[]',1,'2023-05-26 07:23:57','2023-05-30 15:08:19','2023-11-26 08:23:57'),('850058516fbc92fce2befe601f26f2c9c7e70380bca35bb2e2a4e2a23c087d0d589b531ed6cf736e',1,1,'authToken','[]',1,'2023-05-21 13:03:52','2023-05-30 15:08:19','2023-11-21 14:03:52'),('866e8a23d209e639385a5547b2d85b59144117fd697066c32ee47647655a8b6bb6312086dea49503',1,1,'authToken','[]',1,'2023-05-27 08:57:15','2023-05-30 15:08:19','2023-11-27 09:57:15'),('8a5cb466ad1dfe37596156ade5fbe67314d1f089816e257bf90f55754e909e3abdff29425cfd7f80',1,1,'authToken','[]',0,'2023-05-30 15:36:42','2023-05-30 15:36:42','2023-11-30 16:36:42'),('8fc0b376a06b22b9676e26f1ab2c0670669f4f6b49e7161af798ebe230506447075494a47afa3d0e',1,1,'authToken','[]',1,'2023-05-26 12:47:37','2023-05-30 15:08:19','2023-11-26 13:47:37'),('95fa12a46de97e507638bd2505b5b426a740b54e6b24c2cb9782cb583463376f9041942fda53701f',1,1,'authToken','[]',1,'2023-05-28 09:50:05','2023-05-30 15:08:19','2023-11-28 10:50:05'),('97100d8139b0c6cb76a739328979ccf5c8186c2b9ee3b0069dff1a0be1b0edb832118ff30df6a506',1,1,'authToken','[]',0,'2023-06-04 10:38:00','2023-06-04 10:38:00','2023-12-04 11:38:00'),('975300cd927d95226eca3321d9104b5514f1dcf04635a0429c61c97653dda86278097cd3dec38690',1,1,'authToken','[]',0,'2023-06-01 21:18:25','2023-06-01 21:18:25','2023-12-01 22:18:25'),('9aa5e4f6981f5fa6383397847ef40fd13581ebcfaa01ff774cccb00a82618bec7fb8ff4981af1ede',1,1,'authToken','[]',0,'2023-06-02 01:00:33','2023-06-02 01:00:33','2023-12-02 02:00:33'),('9d1f96292bafd21f0218782aa557192b7f9f52d25c3bd4332527feb11c07c356a5cdbf33c6ada39e',86,1,'authToken','[]',1,'2023-05-30 15:00:12','2023-05-30 15:03:29','2023-11-30 16:00:12'),('9f58b691f702dfff8fb5656bb45729b1cc96f69bfe2da6e9b30bde1ddd388c4edbacabe234ae9140',1,1,'authToken','[]',0,'2023-06-04 09:47:28','2023-06-04 09:47:28','2023-12-04 10:47:28'),('a1b81752efca6340fa22fc3a55c6d47b0b6c8971f82c38a5e1f09d1ba85581cae533278e1cc1957b',1,1,'authToken','[]',1,'2023-05-28 08:09:26','2023-05-30 15:08:19','2023-11-28 09:09:26'),('a4dc57cbfb4e3f5854c712f92bb2b3c263c69e39bf364739d5237da8882e1a8e86b6044f9fd8ab79',1,1,'authToken','[]',0,'2023-05-30 15:11:56','2023-05-30 15:11:56','2023-11-30 16:11:56'),('a51b8bad4f7383bd7642742d349c092bddfcd892fa01ca1062988104f91f3d739be05ff1eed35a01',1,1,'authToken','[]',0,'2023-06-02 07:32:08','2023-06-02 07:32:08','2023-12-02 08:32:08'),('a7c77d8c570507a04c1cbfaa401951a2e7a3218fdbf33e2830ede7dbe61f95bc3a9626714b3bf97e',1,1,'authToken','[]',0,'2023-06-02 10:00:17','2023-06-02 10:00:17','2023-12-02 11:00:17'),('aea3c16709b7e8766d0f8074e67c62a5f917cff72704156be234679eb96f2b9bb20bde3c8a3846fc',46,1,'authToken','[]',1,'2023-05-30 15:11:31','2023-05-31 07:40:06','2023-11-30 16:11:31'),('af9555ccba3d7af24e0a3caa2324dc044dac07527821946b01abcec123ed6973ce0b66651e0154ed',1,1,'authToken','[]',1,'2023-05-27 08:07:05','2023-05-30 15:08:19','2023-11-27 09:07:05'),('b16224641c6bc20aa39a2b31d738a303752b723e662d1ac9bfb8efc2d0943b4941fd0f9028e45db6',46,1,'authToken','[]',1,'2023-05-30 15:08:13','2023-05-31 07:40:06','2023-11-30 16:08:13'),('b295b43ae21a40d9f5ae6b701645fe91ed90b0d856870b8933316a0cd11e9adda8969433d49a58d4',1,1,'authToken','[]',0,'2023-06-04 21:41:56','2023-06-04 21:41:56','2023-12-04 22:41:56'),('b560c3520c5d42afd4f209860d2c48a51387e1782dfcc97e3550501aeab59209aa70bd6267977ca3',1,1,'authToken','[]',1,'2023-05-18 09:50:40','2023-05-30 15:08:19','2023-11-18 10:50:40'),('b72a8622507dcdcff6f99b8d649a9457b46463a299eb893eda8353861ca612ab2f73cebe21fe350c',1,1,'authToken','[]',1,'2023-05-30 00:40:40','2023-05-30 15:08:19','2023-11-30 01:40:40'),('bbed84a1830fcc3bf1aa19b6ee90d4a9397118f8716b93af0747d16ffd7c0a7044c6332c67340f21',1,1,'authToken','[]',0,'2023-06-01 13:42:49','2023-06-01 13:42:49','2023-12-01 14:42:49'),('c035c681a42dabcf12ab6e4e51debfa290a388704b004446fb94e2cd75d943cf30127e9b4a1dd19b',46,1,'authToken','[]',1,'2023-05-30 15:08:28','2023-05-31 07:40:06','2023-11-30 16:08:28'),('c11458b6039772952673b0e0da680a303bce73e959b0286ff80aa46e0141e5a69060398cd79e4b8f',1,1,'authToken','[]',1,'2023-05-28 00:39:27','2023-05-30 15:08:19','2023-11-28 01:39:27'),('c128b04c1794c40ba7a8719b2a11bea59c6fd28036eb278974711bf2ca5d549e090bc50501503115',1,1,'authToken','[]',0,'2023-06-02 01:01:33','2023-06-02 01:01:33','2023-12-02 02:01:33'),('c1a8f23e848af3b2c1f1068b75bcaf659081bc8ea7a0f59c1e24d573cd18a8e9cd63980963b9c4d5',1,1,'authToken','[]',0,'2023-05-30 15:10:29','2023-05-30 15:10:29','2023-11-30 16:10:29'),('c3c9dba5182386c839cbc8cc00e287e6e10c59f139631ca4133da78ce75011aa3a215e303e9e39a7',197,1,'authToken','[]',1,'2023-05-30 14:55:31','2023-05-30 14:57:21','2023-11-30 15:55:31'),('ca0ccc7031553c4d33c04c2b7432c9a9c43bb61bad46987d095ab90a4f72b76a2988721b0391e273',1,1,'authToken','[]',0,'2023-06-01 23:14:54','2023-06-01 23:14:54','2023-12-02 00:14:54'),('ca9967e97c6c1fc1bdf83d0b6c0c9d3ae79c1d6e7e7032bc832e8e0ba0e5a10dabf891bae6c9a9a7',1,1,'authToken','[]',1,'2023-05-18 13:31:26','2023-05-30 15:08:19','2023-11-18 14:31:26'),('cc53d18d3528f40887a7e46b673c3747b07c6e9d0bac39b0212074200f12bea1edc3ab531778ee00',1,1,'authToken','[]',0,'2023-06-04 21:34:53','2023-06-04 21:34:53','2023-12-04 22:34:53'),('ccc5433387d5bdda238f9eb82c17a1c3fa259681d20658b2403f7cc87c75005e6d8f9af8f9ff0e93',1,1,'authToken','[]',1,'2023-05-28 00:33:19','2023-05-30 15:08:19','2023-11-28 01:33:19'),('ce8b36e00d4a0caeaf47c96f371a7ba9aee07d044ca8965cef2dfdee70f8806c0a63b141969266dd',46,1,'authToken','[]',1,'2023-05-30 15:05:20','2023-05-31 07:40:06','2023-11-30 16:05:20'),('d1d8d5e5aec98df7810f28106ae09c29d6a8df34860a8dcc18634e81a25ba97ea1b5f352da9bde81',1,1,'authToken','[]',0,'2023-06-01 23:18:13','2023-06-01 23:18:13','2023-12-02 00:18:13'),('d1ff3aa517c7076586579a5d0b57df32d44eb95fa8cb2bba33834fe2d8863c69594915e4289757e2',1,1,'authToken','[]',1,'2023-05-30 00:01:32','2023-05-30 15:08:19','2023-11-30 01:01:32'),('d5e59cb6feb7ec283eb2b83ef97481d755dbb18d265753a508abb769fb428044adddf4fae7744285',1,1,'authToken','[]',0,'2023-06-04 09:49:53','2023-06-04 09:49:53','2023-12-04 10:49:53'),('d787bdd1458be95e8d26350ed606151ac862915a09405c8934b3d5ad3ac28fa97ff1646776daf0ca',1,1,'authToken','[]',1,'2023-05-28 09:05:27','2023-05-30 15:08:19','2023-11-28 10:05:27'),('d7b6de24f66fb0ee15b19e03e6b5dde34e88743870d461db26e5f8cfd7adfaa72dae18f239bbdf0c',1,1,'authToken','[]',1,'2023-05-30 06:35:37','2023-05-30 15:08:19','2023-11-30 07:35:37'),('da131899a2edefb7c2a2ed636371f3016c1fe2f0038d1a013dcd66f05fddcaeef4bff2ad9588a526',1,1,'authToken','[]',0,'2023-06-02 01:38:26','2023-06-02 01:38:26','2023-12-02 02:38:26'),('dbbc5bfdc29b06e2efcdea4e2f98340985a0f5a552d1a989544b6f24868b1a012037fb88ab7b570c',1,1,'authToken','[]',0,'2023-06-01 20:50:32','2023-06-01 20:50:32','2023-12-01 21:50:32'),('dbcc5aae5b56797b24a264b8c2fe8f7a2aaee8cffa6069089d3324da89211e4c84cfbd7f4d2a2c33',1,1,'authToken','[]',1,'2023-05-18 09:50:16','2023-05-30 15:08:19','2023-11-18 10:50:16'),('dcc64e1eca6bf0ce5847121d6c2cc8845f5588a42d338ec426665f9db7dd3a84b1d4946595e9b731',1,1,'authToken','[]',1,'2023-05-28 09:47:25','2023-05-30 15:08:19','2023-11-28 10:47:25'),('dcc8636af0216dc0fe6e187a815793a851bc4c66cdb5a42f5aab5bb7f744f3f32d07f6fdff108946',1,1,'authToken','[]',0,'2023-06-01 10:52:01','2023-06-01 10:52:01','2023-12-01 11:52:01'),('dcc9a87b1f60b8ad267eb680103909375da2a0f29e9442ddcb61cec13baef7b36714430b2f13727b',1,1,'authToken','[]',0,'2023-06-02 08:49:32','2023-06-02 08:49:32','2023-12-02 09:49:32'),('dd038507d3dd6fc3a43825c09ea97038e78a004249d06fe5868d18ab655c12c6e0889a2ecdb790a8',1,1,'authToken','[]',1,'2023-05-30 14:19:23','2023-05-30 15:08:19','2023-11-30 15:19:23'),('dd3824f28aa2479a25afb8d389d386bdfe9b641408a2249ef08b78bc4f508137b0890102fcead723',1,1,'authToken','[]',1,'2023-05-28 08:48:16','2023-05-30 15:08:19','2023-11-28 09:48:16'),('dfc6d8504479cc47c8cd6ad9a9c313302f1a207534cec87a1aae60e832728a2c31c418c28267133d',1,1,'authToken','[]',0,'2023-06-01 12:59:12','2023-06-01 12:59:12','2023-12-01 13:59:12'),('e29d94e259d28b8ad3f78206a7ec279d92ca8a5fd711a1cc571953d7b7b179cdbdf5206ba2988a11',1,1,'authToken','[]',1,'2023-05-30 14:44:08','2023-05-30 15:08:19','2023-11-30 15:44:08'),('e3863135ca6ac3f965c86cb229d5e58f5513db360b675f1a5618be73e092ba91308fe936801b116d',46,1,'authToken','[]',1,'2023-05-30 15:10:10','2023-05-31 07:40:06','2023-11-30 16:10:10'),('e5940841c2b600f02e150073e58cdd3c0a7ac90f6008e6b01b5f7d9019d673629bfa1f884b162078',1,1,'authToken','[]',0,'2023-06-05 03:37:15','2023-06-05 03:37:15','2023-12-05 04:37:15'),('e95d86ca76d6551f01b89411053df132ab31b2ac4530cf139bc8f97e56fa2e45b42536f0b289c860',1,1,'authToken','[]',1,'2023-05-28 00:26:03','2023-05-30 15:08:19','2023-11-28 01:26:03'),('e9aba89284e2550d3d343be40b299431a87c4f850a64b9641930f6e661018233296f169cd9666955',1,1,'authToken','[]',1,'2023-05-30 14:18:23','2023-05-30 15:08:19','2023-11-30 15:18:23'),('ea83b7e209384efe2131e237507f11c00ac7f8ac115b8faa3aec1f73c06285b6a3c984592a884a96',1,1,'authToken','[]',1,'2023-05-21 12:57:19','2023-05-30 15:08:19','2023-11-21 13:57:19'),('ef0290ef047f3384c7f8a7c99e3c0e7f67b11c2a8daf5517cb70aeeb19b84dceb0213ad11bd21a28',1,1,'authToken','[]',1,'2023-05-26 10:33:35','2023-05-30 15:08:19','2023-11-26 11:33:35'),('f1d92b39ccf230ac1161c69d66cda7ee7ce070da691533a1b301f8b06e5a7ef6136e886d181f72d5',1,1,'authToken','[]',0,'2023-06-04 10:01:36','2023-06-04 10:01:36','2023-12-04 11:01:36'),('f6d3c00122c80a4e2693f08c5e03f374703c5749e24d80efd4abc5ed5ebed35c40d0320044068913',1,1,'authToken','[]',1,'2023-05-28 07:05:51','2023-05-30 15:08:19','2023-11-28 08:05:51'),('f71f76760c1159965d439c771f10e0c5b06624e38e8504d415f5702ef68360c6d3c5b214ca65442a',1,1,'authToken','[]',1,'2023-05-26 10:38:20','2023-05-30 15:08:19','2023-11-26 11:38:20'),('fa7c7e0b05962ff26f77593cd12db94064ab6b8883ada04e0b9fae2e75c89a79b630ebdec82f09be',1,1,'authToken','[]',1,'2023-05-21 12:06:35','2023-05-30 15:08:19','2023-11-21 13:06:35'),('feaaa24464fed811f9b73384bfec30ac3ba12496119c74b353b1667a5c678087beb179989630df98',46,1,'authToken','[]',1,'2023-05-30 15:05:47','2023-05-31 07:40:06','2023-11-30 16:05:47');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','M1QtwFCnWCIWkwB2vFEpdEResaPDgUDmNZ5DZzab',NULL,'http://localhost',1,0,0,'2023-04-24 12:29:07','2023-04-24 12:29:07'),(2,NULL,'Laravel Password Grant Client','munqzeI62CDoFQZUUX4O4qBati2fRBzpR2ycFcE4','users','http://localhost',0,1,0,'2023-04-24 12:29:07','2023-04-24 12:29:07');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2023-04-24 12:29:07','2023-04-24 12:29:07');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reg_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tin_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('vendor','self','support') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'vendor',
  `status` enum('pending','verified') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organizations_reg_no_unique` (`reg_no`),
  UNIQUE KEY `organizations_tin_no_unique` (`tin_no`),
  UNIQUE KEY `organizations_email_unique` (`email`),
  UNIQUE KEY `organizations_code_unique` (`code`),
  UNIQUE KEY `organizations_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'RC243556','12345-0001','Raaxo Synergy Limited','PY74980','projects@raaxo.ng','09023146272','vendor','verified','2023-05-21 21:11:50','2023-05-21 21:23:55'),(2,'RC563521','23456-0002','NCDMB Cooperative Society','PY63593','info@ncdmbcoop.com','09093479079','self','verified','2023-05-22 06:11:59','2023-05-22 06:11:59');
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `air_ticket_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('adult','child','infant') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'adult',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `passengers_air_ticket_id_foreign` (`air_ticket_id`),
  CONSTRAINT `passengers_air_ticket_id_foreign` FOREIGN KEY (`air_ticket_id`) REFERENCES `air_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,1,'Uche Levi','levi.uche@gmail.com','09094322111','adult','2023-06-01 11:10:15','2023-06-01 11:10:15');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `sub_budget_head_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` bigint NOT NULL DEFAULT '1',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','awarded','incomplete','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_code_unique` (`code`),
  KEY `projects_user_id_foreign` (`user_id`),
  KEY `projects_sub_budget_head_id_foreign` (`sub_budget_head_id`),
  CONSTRAINT `projects_sub_budget_head_id_foreign` FOREIGN KEY (`sub_budget_head_id`) REFERENCES `sub_budget_heads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,1,25,'PY36382666','Automation of the Cooperative Process',186,'Building a portal to automate the process of the agency','pending',0,'2023-05-21 23:18:52','2023-05-21 23:19:24');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleables`
--

DROP TABLE IF EXISTS `roleables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roleables` (
  `role_id` bigint unsigned NOT NULL,
  `roleable_id` bigint unsigned NOT NULL,
  `roleable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleables`
--

LOCK TABLES `roleables` WRITE;
/*!40000 ALTER TABLE `roleables` DISABLE KEYS */;
INSERT INTO `roleables` VALUES (1,1,'App\\Models\\Module'),(1,2,'App\\Models\\Module'),(1,3,'App\\Models\\Module'),(1,4,'App\\Models\\Module'),(1,1,'App\\Models\\User'),(1,5,'App\\Models\\Module'),(1,6,'App\\Models\\Module'),(1,8,'App\\Models\\Module'),(1,9,'App\\Models\\Module'),(1,10,'App\\Models\\Module'),(1,12,'App\\Models\\Module'),(1,13,'App\\Models\\Module'),(1,14,'App\\Models\\Module'),(1,15,'App\\Models\\Module'),(1,16,'App\\Models\\Module'),(1,17,'App\\Models\\Module'),(1,18,'App\\Models\\Module'),(1,19,'App\\Models\\Module'),(1,20,'App\\Models\\Module'),(1,21,'App\\Models\\Module'),(1,22,'App\\Models\\Module'),(1,23,'App\\Models\\Module'),(1,24,'App\\Models\\Module'),(1,25,'App\\Models\\Module'),(1,26,'App\\Models\\Module'),(2,25,'App\\Models\\Module'),(2,26,'App\\Models\\Module'),(2,24,'App\\Models\\Module'),(2,22,'App\\Models\\Module'),(2,197,'App\\Models\\User'),(2,162,'App\\Models\\User'),(2,225,'App\\Models\\User'),(1,27,'App\\Models\\Module'),(1,28,'App\\Models\\Module'),(2,28,'App\\Models\\Module'),(1,29,'App\\Models\\Module'),(1,30,'App\\Models\\Module'),(1,31,'App\\Models\\Module'),(1,32,'App\\Models\\Module'),(1,33,'App\\Models\\Module'),(1,34,'App\\Models\\Module'),(1,35,'App\\Models\\Module'),(2,231,'App\\Models\\User'),(2,227,'App\\Models\\User'),(2,212,'App\\Models\\User'),(1,36,'App\\Models\\Module'),(1,37,'App\\Models\\Module'),(2,38,'App\\Models\\Module'),(1,38,'App\\Models\\Module'),(2,39,'App\\Models\\Module'),(1,39,'App\\Models\\Module'),(2,37,'App\\Models\\Module'),(1,40,'App\\Models\\Module'),(1,41,'App\\Models\\Module'),(1,42,'App\\Models\\Module'),(1,43,'App\\Models\\Module'),(2,46,'App\\Models\\User'),(1,44,'App\\Models\\Module'),(1,45,'App\\Models\\Module'),(1,46,'App\\Models\\Module'),(1,47,'App\\Models\\Module'),(1,48,'App\\Models\\Module'),(1,49,'App\\Models\\Module'),(1,50,'App\\Models\\Module'),(1,51,'App\\Models\\Module'),(1,52,'App\\Models\\Module');
/*!40000 ALTER TABLE `roleables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slot` bigint NOT NULL DEFAULT '1',
  `start` datetime DEFAULT NULL,
  `expire` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_label_unique` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Super Administrator','super-administrator',1,NULL,NULL,'2023-04-24 12:29:11','2023-04-24 12:29:11'),(2,'Member','member',1000,NULL,NULL,'2023-05-06 22:48:17','2023-05-06 22:48:17'),(3,'General Secretary','general-secretary',1,NULL,NULL,'2023-05-28 00:39:48','2023-05-28 00:39:48'),(4,'President','president',1,NULL,NULL,'2023-05-28 00:40:50','2023-05-28 00:40:50'),(5,'Treasurer','treasurer',1,NULL,NULL,'2023-05-28 00:41:03','2023-05-28 00:41:03'),(6,'Account Officers','account-officers',5,NULL,NULL,'2023-05-28 00:41:15','2023-05-28 00:41:25');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_requests`
--

DROP TABLE IF EXISTS `service_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_requests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `service_id` bigint unsigned NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `requested_amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `approved_amount` decimal(30,2) NOT NULL DEFAULT '0.00',
  `status` enum('pending','approved','denied') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `disbursed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_requests_code_unique` (`code`),
  KEY `service_requests_user_id_foreign` (`user_id`),
  KEY `service_requests_service_id_foreign` (`service_id`),
  CONSTRAINT `service_requests_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `service_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_requests`
--

LOCK TABLES `service_requests` WRITE;
/*!40000 ALTER TABLE `service_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sub_budget_head_id` bigint unsigned NOT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_label_unique` (`label`),
  UNIQUE KEY `services_prefix_unique` (`prefix`),
  UNIQUE KEY `services_code_unique` (`code`),
  KEY `services_sub_budget_head_id_foreign` (`sub_budget_head_id`),
  CONSTRAINT `services_sub_budget_head_id_foreign` FOREIGN KEY (`sub_budget_head_id`) REFERENCES `sub_budget_heads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `input_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '0',
  `group` enum('site','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'site',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_budget_heads`
--

DROP TABLE IF EXISTS `sub_budget_heads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_budget_heads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `budget_head_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('capital','recurrent','personnel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'capital',
  `group` enum('inflow','outflow') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'outflow',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sub_budget_heads_code_unique` (`code`),
  KEY `sub_budget_heads_budget_head_id_foreign` (`budget_head_id`),
  KEY `sub_budget_heads_category_id_foreign` (`category_id`),
  CONSTRAINT `sub_budget_heads_budget_head_id_foreign` FOREIGN KEY (`budget_head_id`) REFERENCES `budget_heads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `sub_budget_heads_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_budget_heads`
--

LOCK TABLES `sub_budget_heads` WRITE;
/*!40000 ALTER TABLE `sub_budget_heads` DISABLE KEYS */;
INSERT INTO `sub_budget_heads` VALUES (1,1,1,'GRANT/BANK LOAN','C001','capital','inflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(2,1,1,'CONTRIBUTIONS','C002','personnel','inflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(3,1,1,'LUMPSUM REMITTANCE','C003','recurrent','inflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(4,1,2,'SPECIAL LOAN','C004','personnel','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(5,1,2,'REGULAR LOAN','C005','personnel','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(6,1,3,'ELECTRONIC LOAN','C006','personnel','outflow','active','2023-04-26 09:41:57','2023-06-01 20:57:14'),(7,1,3,'AIRTICKET','C007','personnel','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(8,1,2,'CAR LOAN','C008','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(9,1,3,'END OF YEAR PURCHASE','C009','personnel','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(10,1,3,'WITHDRAWAL/CLOSURE/REFUND','C010','personnel','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(11,2,4,'SALARY','C011','personnel','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(12,2,4,'HEALTH AND INSURANCE','C012','personnel','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(13,2,4,'PENSION','C013','personnel','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(14,3,5,'IMPREST','C015','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(15,3,5,'COMMUNICATIONS','C016','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(16,3,5,'OFFICE STATIONARIES/PRINTING/COMPUTERS','C017','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(17,3,5,'REPAIR AND MAINTENANCE','C018','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(18,3,6,'ENTERTAINMENT','C019','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(19,3,9,'TRANSPORTATION','C020','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(20,3,9,'CONSULTANCY SERVICES: LEGAL/FINANCIAL SERVICES','C021','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(21,3,10,'TRAINING (OFFICIALS AND MEMBERS)','C022','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(22,3,11,'COMMITTEE STIPEND','C023','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(23,3,6,'WELFARE','C024','recurrent','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(24,4,7,'INVESTMENT MINI MART','C025','capital','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(25,4,8,'AUTOMATION OF PROCESS: WEB APPLICATION','C026','capital','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(26,4,8,'AUTOMATION OF PROCESS: MOBILE APPLICATION','C027','capital','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(27,4,8,'AUTOMATION OF PROCESS: DEPLOYMENT, API TOOLS, CLOUDFARE SECURITY, TRAINING, 1 YEAR SUPPORT','C028','capital','outflow','active','2023-04-26 09:41:57','2023-04-26 09:41:57'),(28,5,12,'TEST','T01','capital','inflow','active','2023-04-26 12:27:26','2023-04-26 12:33:18'),(29,5,12,'ANOTHER TEST','AT01','recurrent','inflow','active','2023-04-26 12:29:43','2023-04-26 12:33:11'),(30,6,7,'REPAYMENTS','C029','recurrent','inflow','active','2023-05-11 12:03:26','2023-06-01 20:58:02');
/*!40000 ALTER TABLE `sub_budget_heads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `expenditure_id` bigint unsigned NOT NULL,
  `type` enum('DR','CR') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DR',
  `transactionable_id` bigint unsigned NOT NULL,
  `transactionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_expenditure_id_foreign` (`expenditure_id`),
  CONSTRAINT `transactions_expenditure_id_foreign` FOREIGN KEY (`expenditure_id`) REFERENCES `expenditures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `membership_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `staff_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middlename` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contribution_fee` decimal(30,2) NOT NULL DEFAULT '0.00',
  `type` enum('staff','member','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'member',
  `status` enum('pending','active','blocked','left') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_membership_no_unique` (`membership_no`),
  UNIQUE KEY `users_staff_no_unique` (`staff_no`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'AD001','ADMIN','Super',NULL,'Administrator','09093479079',60000.00,'admin','active','admin@admin.com',NULL,'$2y$10$HvNxGoF2S.78ff1pYa7lzOHPt2y/BLV5TBaLTD5EJuWKN49unaeau',1,0,NULL,'2023-04-24 12:29:11','2023-04-24 12:29:11'),(2,'A0001',NULL,'FOLASADE','','ALMONA','AT1HQSfeqlG',0.00,'member','pending','folasadei2@yahoo.com',NULL,'$2y$10$6iQCWW504.RpTPh8NHzJUOAq4c4vc7BJ8RuXuetOV5F2.3.GJfYTq',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(3,'A0002',NULL,'OLADELE','','BUKI','kq03sWVKsvV',100000.00,'member','pending','oladele.buki@ncdmb.gov.ng',NULL,'$2y$10$WlcjTVi5H7kAuzWk54bHb.TjHtw5ZGBzMUJzq42a4/Z3k91MIa30y',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(4,'A0003',NULL,'ABDULMALIK','','HALILU','u1AG9piSca1',250000.00,'member','pending','abdulmalik.halilu@ncdmb.gov.ng',NULL,'$2y$10$gCbsuS5FLv9JFjs2splxoeXEVWcoMpgGY7gs2qiQIevtnUySX4geS',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(5,'A0009',NULL,'OBINNA','A.','OFILI','XYBlLvjnI0g',50000.00,'member','pending','obinna.ofili@ncdmb.gov.ng',NULL,'$2y$10$lR4wCCz4L1fwJ0srB6YlKuPOukrk5F45sMEFwHTKAx9QcWS2h51nm',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(6,'A0010',NULL,'AMARACHI','JONATHAN','NJOKU','HOfLyfdux1q',50000.00,'member','pending','jonathan.njoku@ncdmb.gov.ng',NULL,'$2y$10$cf1hZ.q1eknKSNBDHHtzvuSVRN2oPlQ0z33czf.7OwkLUvwmjUQWm',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(7,'A0011',NULL,'FARID','ABDALLAH','FARID','0ZtWDIhhKWL',10000.00,'member','pending','farid.blell@ncdmb.gov.ng',NULL,'$2y$10$0CldO9dKZtVGqPLHnGOHb.0Kj64mgbPmyeASKqyxl2r77mKYk2lFO',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(8,'A0012',NULL,'EMMANUEL','','OHANYERE','6b8ObLDFoVl',120000.00,'member','pending','emma.ohanyere@ncdmb.gov.ng',NULL,'$2y$10$XkiIQ1YCE14sNCcHvOWqvOFietlWZAUTDtbfKWf2Z2RtoqOjUlFR.',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(9,'A0013',NULL,'CHIDINMA','SYLVIA','OKORONKWO','AFNw2FwYDn1',5000.00,'member','pending','sylvia.josh-ogwo@ncdmb.gov.ng',NULL,'$2y$10$60UliOAXGx77W80fDJw62Oh1OTvXLns/1a1AKlWCjpikrz17k8kLG',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(10,'A0014',NULL,'LINDA','IKHIANOSEN','ESEKHILE','4XASgUWaBZq',10000.00,'member','pending','linda.wilfred@ncdmb.gov.ng',NULL,'$2y$10$72Gnu5mUoIM8jUemXCv1p.AyTqCjHR8mYuILmTdg7VxlcmrtoU75u',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(11,'A0015',NULL,'KOREDE','JOSEPH','OSHAGBAMI','rXPbXTJ9aR2',10000.00,'member','pending','joseph.oshagbami@ncdmb.gov.ng',NULL,'$2y$10$b9tKVvPDY5JZHc3B85PtZu5Lrhp03neK9pCZHfqmsLXyTokQapAOG',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(12,'A0016',NULL,'MAUREEN','CHIOMA','IBEANU','BvKl7ChJYOJ',100000.00,'member','pending','chioma_ikenna.isiguzo@ncdmb.gov.ng',NULL,'$2y$10$Lbs66fClQUmUaRbjfRKeBOFjMHy4pV10uQ7GU0p0j1lsO/mz3il12',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(13,'A0017',NULL,'OYELEKE','C.','TELEOLA','luYya1UgGIq',40000.00,'member','pending','teleola.oyeleke@ncdmb.gov.ng',NULL,'$2y$10$CfF37k90ACIzSSrWycLVQucONiJbQlMm/Arqg7ub1I9OXPcYBRimK',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(14,'A0018',NULL,'OSE','KHADIJAH','JEKHINE','eUG3IHsufOF',80000.00,'member','pending','khadijah.jekhine@ncdmb.gov.ng',NULL,'$2y$10$z7cyCeCHktJOgvxDXfrzFug2FVG3a1BEbBeQ4maUkrOiL7/.kYE7a',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(15,'A0019',NULL,'IK','','JOY-UZOR','TXEyuVORVUv',0.00,'member','pending','ik.joy-uzor@ncdmb.gov.ng',NULL,'$2y$10$4S7fHvqHd0UHdpxuaLLi7uvNP4RYlzQmhvNNghDaiyVy1Fqn1gH3y',0,0,NULL,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(16,'A0020',NULL,'CHINEYELU','','NNOLI','vEmfkwgMsph',10000.00,'member','pending','nnoli.chinyelu@ncdmb.gov.ng',NULL,'$2y$10$IYXCy5F9.5O9741J9YvKSO4OaB24LcOD72vX4Y8hmALNex8R2t3BO',0,0,NULL,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(17,'A0021',NULL,'ISAAC','UKPONG','AKPAN','ui6qhyWrj2c',20000.00,'member','pending','akpan.isaac@ncdmb.gov.ng',NULL,'$2y$10$vKc4h3w9NLrP7LfcrhTGsut9vCiYToMJPYp4pXFHOh0cQcABa0y3K',0,0,NULL,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(18,'A0024',NULL,'CHARITY','TARI','LEGHEMO','Z0zbjxCXhjW',20000.00,'member','pending','charity.leghemo@ncdmb.gov.ng',NULL,'$2y$10$5Cs0.Pd10Z0pPrVFnZZUbOS3.T/z3tn2aY1Jej3KmMbSCjRDON0me',0,0,NULL,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(19,'A0025',NULL,'JEFFERSON','','TUATONGHA','2YEeCBZaJVH',0.00,'member','pending','jefferson.tuatongha@ncdmb.gov.ng',NULL,'$2y$10$yp3G0H9J/Ep2AFKTfQHFY..h8hMaWWnHQE59Cx8BdDkda/.k0p6pi',0,0,NULL,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(20,'A0026',NULL,'JERRY','','ATABONG','EMZdQjUtnuX',75000.00,'member','pending','jerry.atabong@ncdmb.gov.ng',NULL,'$2y$10$chLuSw/kEex8oGsAOxtI6eyTIkAeQZR1rPcRNyXCofBHu4.DgyFxu',0,0,NULL,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(21,'A0028',NULL,'CHIAMAKA','IWEKA','OBIOMA','m1Z4IyXZQmA',75000.00,'member','pending','obioma.iweka@ncdmb.gov.ng',NULL,'$2y$10$PwB/WCo2QBZ6dPh/NmPfpeYwCJQQ/hVlTFBZvWeAwV2zr.k3ic4qm',0,0,NULL,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(22,'A0029',NULL,'IKENNA','CHIMEZIE','ISIGUZO','xz8mvltctll',50000.00,'member','pending','ikenna.isiguzo@ncdmb.gov.ng',NULL,'$2y$10$fvK11gop5vlNzqDEBQyEauFx7mxLhP0f363eUKVVR/I0G9zFPHrhq',0,0,NULL,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(23,'A0031',NULL,'ADELANA','','AKINTUNDE','FDS7LYN26YB',0.00,'member','pending','adelana.akintunde@ncdmb.gov.ng',NULL,'$2y$10$zzbF865uglQmJw28yllDtuhcp.3menxnhk/2VnbzPHBPtl2RG9zfy',0,0,NULL,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(24,'A0033',NULL,'CHISA','BLESSING','NWANKWO','PZ3xHAGIFIw',20000.00,'member','pending','blessing.kenneth@ncdmb.gov.ng',NULL,'$2y$10$M5LL/sXi1NvQVLPQtYXpM.glgxqcdJENyBi67pYkqg6lI8Nr5IXae',0,0,NULL,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(25,'A0034',NULL,'USMAN','','GARBA','eDTyoENGBXb',50000.00,'member','pending','usman.garba@ncdmb.gov.ng',NULL,'$2y$10$pA3/YTeM/ojz2iwVNVCUjOUzoLtOlShlEUKEny215.VAkYNPQXlEe',0,0,NULL,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(26,'A0035',NULL,'PORBENI','','OYINKE','9OQ7XiwQW8s',30000.00,'member','pending','oyinke.porbeni@ncdmb.gov.ng',NULL,'$2y$10$OBnLnuNuFlPnix0vs0YkaeQP1MSu/G9tUTUCCOTjpTp9c9WFZcxHi',0,0,NULL,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(27,'A0036',NULL,'ISREAL','OLUWAFEMI','AJAYI','zKRSxm0DPkj',20000.00,'member','pending','oluwafemi.ajayi@ncdmb.gov.ng',NULL,'$2y$10$M9MaWHSkWuC2c2Gqxpo3CuGJtn9tTKTNXHp8QLbDTqtX4ASKUAOe2',0,0,NULL,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(28,'A0037',NULL,'RICHARD','','ADEOLA','CdDrD2GIbT3',50000.00,'member','pending','richard.adeola@ncdmb.gov.ng',NULL,'$2y$10$0H90Cs7zkgLw24LjVOr8OOqkmg.pIP8DKg605q3ehEBJxB/swtZ7K',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(29,'A0038',NULL,'SALO','','OKOYA','RNFTNW88x08',50000.00,'member','pending','salo.okoya@ncdmb.gov.ng',NULL,'$2y$10$SGMcy60TiZ2mcPFEJNj./ewgRKBYy4k/AgNWLVu2VHsrIcoyiuADm',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(30,'A0039',NULL,'CAPTAIN','SUNDAY','ADAMA','lrkY9UN1dhP',70000.00,'member','pending','captain.adama@ncdmb.gov.ng',NULL,'$2y$10$3jfIC12yjaKsmaeV/OfeeO4hHU16sXUITVWioDpj3/n5fbIMijvF6',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(31,'A0040',NULL,'CHUX','EDMOND','EJIOGU','nciQQYhJ5A7',10000.00,'member','pending','chux.ejiogu@ncdmb.gov.ng',NULL,'$2y$10$H1N0OsqPkyBK9L6N0Qg9d.OWPITZZuVlishXfC/8Icp2DCNP0ELlK',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(32,'A0041',NULL,'PHOTO','ZUOWEI','FROFOUN','OSPK0nfLANa',10000.00,'member','pending','zuowei.frofoun@ncdmb.gov.ng',NULL,'$2y$10$cvFp6DWNFIFXwp6gLonJO.Q.6UNldZO.ARJ/9NGHJZOk5gBp0TcxS',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(33,'A0042',NULL,'OBINNA','CHRIS','OSUJI','QdzbUSL5ffe',25000.00,'member','pending','chris.osuji@ncdmb.gov.ng',NULL,'$2y$10$yrgrizjs6S0Faw0KHJOgiONBIXg4YySMZfZLAx.X6ey675MHyRiIy',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(34,'A0043',NULL,'SOLOMON','','ATTAH','jYm8RWD9EGW',10000.00,'member','pending','solomon.attah@ncdmb.gov.ng',NULL,'$2y$10$FXgMrF7n/m5Paf4caIPs9OvbW0.Vz4ZRhFXfzI.JZfCylUv7.z1le',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(35,'A0045',NULL,'BETHAR','CHUKWUEMEKA','ALARIBE','OwHu1zM4vHC',10000.00,'member','pending','bertha.alaribe@ncdmb.gov.ng',NULL,'$2y$10$4VNGDKaawE8dE8orOp9wpOv8DXhZ7/utktpIouYXuBmuSszbyqSr2',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(36,'A0046',NULL,'HAUWA','ABUBAKAR','HAMISU','34YtTvzewrH',30000.00,'member','pending','hauwa.hamisu@ncdmb.gov.ng',NULL,'$2y$10$WkVqcNgTxMJoJIWgYr875esoYrzy3SHeO16fX5TmONy3slpWFLmp6',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(37,'A0047',NULL,'ABIODUN','','AKINWOMOJU','AWTdHqhn2wn',25000.00,'member','pending','abiodun.akinwomoju@ncdmb.gov.ng',NULL,'$2y$10$oPqA/Ug/GsL4c/cvHmMbC.o1meI3FET.HWbamSiLE4VU0HQgV/CTC',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(38,'A0049',NULL,'KINGDOM','','UNWENE','eTHY4vpVz9H',20000.00,'member','pending','kingdom.unwene@ncdmb.gov.ng',NULL,'$2y$10$OktwSLgTzFnd4XR7.QGtXuJyhaEL3B8QZGPQJCXxJQ7Gn.QBvotOC',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(39,'A0050',NULL,'NKECHI','','NKECHI','0nv48mOF8QI',40000.00,'member','pending','nkechinyere.udu-nwachi@ncdmb.gov.ng',NULL,'$2y$10$lAt4R0JUAHpn246760pizuhSMZsq96g3oogVI1N5H39e0N6LXlRlu',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(40,'A0051',NULL,'MOHAMMED','AHMED','AHMED','MvXzBP70N3T',30000.00,'member','pending','ahmed.mohammed@ncdmb.gov.ng',NULL,'$2y$10$PC3iHaziuck6LD03N39.yujn7jQuvpzj.A6aCCd0zjlprgedcaN9W',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(41,'A0052',NULL,'NANDER','','SALMWANG','r44OsBpvqg3',30000.00,'member','pending','nander.salmwang@ncdmb.gov.ng',NULL,'$2y$10$l/4t5DTfJLWRJ197jRhe/eRNIX7qFoIajTUB.pSqhlOAiMyVbsSKS',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(42,'A0053',NULL,'OBINNA','','EZEOBI','aw0XUmpHj2Y',20000.00,'member','pending','obinna.ezeobi@ncdmb.gov.ng',NULL,'$2y$10$.cCcvot6HHcOXxIB/0IUO.u0KbfVHYGuA0AJi.lxN9K0ZDltsjxcm',0,0,NULL,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(43,'A0054',NULL,'SELEKE-ERE','','OWOUPELE','5ee7Yv8lG2U',50000.00,'member','pending','seleke-ere.owoupele@ncdmb.gov.ng',NULL,'$2y$10$zFray8gJDImJ69DUBhkNs.1hbCjAI6.QDE/lYLNECJYrGEyr40a36',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(44,'A0055',NULL,'EBIERE','EUNICE','KPUNPAMO','gQLUvaUYixw',100000.00,'member','pending','ebiere.kpunpamo@ncdmb.gov.ng',NULL,'$2y$10$ZFFcd5./s9uHwdJgNe90g.3o7n0ec9BmTfKhbGZ3C5iQnSF1ZdVt.',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(45,'A0056',NULL,'GABRIEL','','OKPETU','jMFAIecxM4Q',20000.00,'member','pending','gabriel.okpetu@ncdmb.gov.ng',NULL,'$2y$10$ahUoxdxDWXDBpA103/xbn.OIP5hByf0c8YachcYBuJCg/0XoUC1nm',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(46,'A0057',NULL,'BABARINDE','VICTOR','OLUWUYIWA','ld7KvGcjNha',50000.00,'member','pending','victor.muyiwa@ncdmb.gov.ng',NULL,'$2y$10$HvNxGoF2S.78ff1pYa7lzOHPt2y/BLV5TBaLTD5EJuWKN49unaeau',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(47,'A0058',NULL,'PETER','ODO','ISU','Y4SNqc1tr5Y',70000.00,'member','pending','peter.odo@ncdmb.gov.ng',NULL,'$2y$10$Y4FY4xYGGaah15xxzeq1heErsCBMh.qS3xrgDSC0l5I2zDOh6xVH.',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(48,'A0059',NULL,'DAVID','','OPARA','R0bG8L3bJbc',100000.00,'member','pending','david.opara@ncdmb.gov.ng',NULL,'$2y$10$iQwS.tiIDCBTE1lJ.C72Dusgzlc170R5ae8kxnvgsUrujmHMBESxK',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(49,'A0060',NULL,'OBINNA','CHIMEZIE','AGBUGBA','kXlVP4ZrQfV',20000.00,'member','pending','obinna.agbugba@ncdmb.gov.ng',NULL,'$2y$10$46htWYUcmj27bvpe5pjnqOvhd9XevmCggli5zNcCu7swqtUa9Jg3G',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(50,'A0061',NULL,'SPIFF','TOBIN','BIRIYAI','FatBL73lkLm',30000.00,'member','pending','tobin.spiff@ncdmb.gov.ng',NULL,'$2y$10$8lM1foj7b39oJ/R7XnhRMOVlKmkmLY8IsyvatLqlHbCZHFdETNbVa',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(51,'A0062',NULL,'YAGUE','JAMES','TUBIKUMO','nl3224pJ9Mu',20000.00,'member','pending','tubikumo.yague@ncdmb.gov.ng',NULL,'$2y$10$QjnWUpdVCCd0l0iP0yI5..lgHQyaS6GKqTaFhv4nAG4XY6oo7DYdK',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(52,'A0063',NULL,'ADIKE','','KOPIAM','3csDghEYw1W',50000.00,'member','pending','kopiam.adike@ncdmb.gov.ng',NULL,'$2y$10$b64vtSnwClBHObU7qzHgzOVV8UHDAJzQJIjlWHlS0b/nQVW7oE4pO',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(53,'A0064',NULL,'ITA','','NYOKI','VvwNSQn4ccu',50000.00,'member','pending','nyoki.ita@ncdmb.gov.ng',NULL,'$2y$10$FF46tvd4c1aTHIXf.9Q8De/5v.GmFx0hZwpkQimfzEuis6OnJ/LzS',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(54,'A0065',NULL,'IFEANYI','CHUKWUDI','ANIAGUDO','nTQbXlLpjcU',30000.00,'member','pending','chukwudi.aniagudo@ncdmb.gov.ng',NULL,'$2y$10$XxaH9h9jC.7Nq6OwHezv8.rcFp5XhWpAX/uhi..wqBJR7k4vfsFyW',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(55,'A0066',NULL,'FLORENCE','GEORGE','EDUM','kgodpwSqdH0',5000.00,'member','pending','florence.george@ncdmb.gov.ng',NULL,'$2y$10$Bdh9nzI0RnWphp7.ub80ZeNFdQr.DNxOjItSB4S2KN4RlRfg59mRO',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(56,'A0067',NULL,'BUFAZI','','TAREOWEI','HSfMLe4OhgY',10000.00,'member','pending','tareowei.bufazi@ncdmb.gov.ng',NULL,'$2y$10$7QZQsWhDurzwjlAdbaphHuNQgNoz3yrcaWOakdyDg5ZsFVf38e0HG',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(57,'A0069',NULL,'JOSEPH','A.','TAMUNOIBELEMA','YfbPMhXTaSU',0.00,'member','pending','joseph.tamunoibelema@ncdmb.gov.ng',NULL,'$2y$10$HJufpWFAKUh8XGTRlq9eauZKE51x4f5Aq7nYlTrNWG8W7q77i9aCa',0,0,NULL,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(58,'A0070',NULL,'OPEYEMI','IBRAHIM','AMBALI','YWuNHznxQj1',20000.00,'member','pending','opeyemi.ambali@ncdmb.gov.ng',NULL,'$2y$10$0nRNvbjf8RbfBdxc7xzIF.8U2.J67HXgeHWEnNeapXv6BF94JravO',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(59,'A0071',NULL,'OZIMEDE','SULEIMAN','AGBONMERE','DGq5KEKmDT9',20000.00,'member','pending','suleiman.ozimede@ncdmb.gov.ng',NULL,'$2y$10$mSKdlmfUZMlfFU6mM97etu87T9Ax/rN9v44TBVMIZGlmixlb7/.Xq',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(60,'A0072',NULL,'OBIORA','COLLINS','IFEKA','lfSKok4pmlB',5000.00,'member','pending','collins.ifeka@ncdmb.gov.ng',NULL,'$2y$10$saj9n3cxA2ykhlQgCZfM/.ohXgDZLv3VhG02H439RpnVCFJKb9xOe',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(61,'A0073',NULL,'OBOT','','UDUAK','tdsrET1d5R1',40000.00,'member','pending','uduak.obot@ncdmb.gov.ng',NULL,'$2y$10$E4oDH7jXOxdL7fDYrvnO2evQ2lF6aGe/Hef6WfMkE.xKjtrmI254O',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(62,'A0074',NULL,'TOSIN','S.','AFOLABI','ZJkbpntkydH',10000.00,'member','pending','oluwatosin.afolabi@ncdmb.gov.ng',NULL,'$2y$10$fjeqhXmhFrosQwMeeHYjH.T1O/HN7Q2wgEWuwSh7K7HoRl0lOfzCi',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(63,'A0075',NULL,'BERNARD','','NWAOKEDIBE','oBDhBGcYXs1',10000.00,'member','pending','bernard.nwaokedibe@ncdmb.gov.ng',NULL,'$2y$10$odWDGSuxjaCx.htFBk4gc.dXwXKKdsAwTgPyWovN8goe/Ft0a63EO',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(64,'A0076',NULL,'MERCY','MARYJANE','EDIKE','bkSw2KqXDX5',5000.00,'member','pending','maryjanedike3@gmail.com',NULL,'$2y$10$80gZAALetvRakp2G54iBMeBLtVwcc9WP38rRMYCgPY5gjBRemYAWa',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(65,'A0078',NULL,'THELMA','AWELE','ANAZIAH','jGBYjGbc215',10000.00,'member','pending','thelma.anaziah@ncdmb.gov.ng',NULL,'$2y$10$1ocZxU8ah.B13WuWGJt6l.ymXaI5Fd/Cqrw5BHnvBLbSX46lycuS2',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(66,'A0079',NULL,'ENE','','ETTE','Xt6Y51OqQp9',10000.00,'member','pending','ene.ette@ncdmb.gov.ng',NULL,'$2y$10$zYdGdbdBnf7m35PCv69AzOwk3M7PFA7h2yPr0w9zcCB5Oo84aoC7a',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(67,'A0080',NULL,'CHUKWUKA','JAMES','EZEDIMBU','vEQRIon4fEt',85000.00,'member','pending','james.ezedimbu@ncdmb.gov.ng',NULL,'$2y$10$O0GGlyVx5CoYC0dMTAclxutM0bDwVzVT6PgIrB6E7dl9MN83davwe',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(68,'A0081',NULL,'CITYFAITH','ZORASI','BARIBOR','p4A1W31HlSI',50000.00,'member','pending','cityfaith.zorasi@ncdmb.gov.ng',NULL,'$2y$10$1BtLHXuCZ45UnGnc1m4PWevoox7.8Fs.pbMBTbwgLDruqzDMmS6PK',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(69,'A0083',NULL,'OLAJIDE','AHMED','OBALOLA','r5QfgU6v3tU',20000.00,'member','pending','olajide.obalola@ncdmb.gov.ng',NULL,'$2y$10$59jo5t6ONba58eEPQT9Y4.A27ExJ/Gt7zdFtBQC3WL0h.kmmtroyi',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(70,'A0084',NULL,'ASANGOLO','O.','DALLAS','9X8TEFJVMwN',50000.00,'member','pending','dallas.asangolo@ncdmb.gov.ng',NULL,'$2y$10$2c2NLG4/03WV1a4nflWJw.a21fNz/bplXfkuUD.yKcahX171jPJjS',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(71,'A0085',NULL,'MABEL','CHINENYE','OBONIN','r2LVbr5AkeH',30000.00,'member','pending','mabel.anameze@ncdmb.gov.ng',NULL,'$2y$10$74kgEzsB6ojPbySelcLWGugWp1BzSd92JUxQrZ2o65v3.SOjQQ3eq',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(72,'A0087',NULL,'CHUKUWUMA','EMMANUEL','UDOM','NL7kjCChtiH',50000.00,'member','pending','chukwuma.udom@ncdmb.gov.ng',NULL,'$2y$10$5YExSPIeVBW4aIE9LODBueYXCiggmb8na4VqNwd8/EJscbUKeyGq2',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(73,'A0088',NULL,'TARILATE','','TEIDE-BRIBENA','Yw328r3eDQH',10000.00,'member','pending','tarilate.teide-bribena@ncdmb.gov.ng',NULL,'$2y$10$rC76I6NW2nTKwWjtOdPGhOiweqrg0aqQxcXqTx283RDUDvIKXSc9O',0,0,NULL,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(74,'A0089',NULL,'JUNE','PATRICK','OPUOWEI','ufHaDxqbmTl',5000.00,'member','pending','patrick.june@ncdmb.gov.ng',NULL,'$2y$10$vq1FJbxxjrWmn17TPpfzE.J5O7iSFGkY7vxJBMk3u2MEZZM876SX6',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(75,'A0090',NULL,'SONIA','LEKOMA','NWINNEH','gHaXSv0gBIj',100000.00,'member','pending','lekoma.nwineh@ncdmb.gov.ng',NULL,'$2y$10$6THOJIIWz8y4yAvP/vcWC.gaP7Op1zOBV41svOdC/.wENd/OHgEWe',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(76,'A0092',NULL,'EREFA','SAMPSON','MAMUNGHA','ZuHhWEyhLVE',50000.00,'member','pending','sampson.erefa@ncdmb.gov.ng',NULL,'$2y$10$ibA7.o9DClOHhhRtYIVRZe9CEX6yXVftNPCTVBn6wdI8yjlnnzWXe',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(77,'A0093',NULL,'UTIBE','','OGBODU','2qmyMukGk1d',40000.00,'member','pending','utibe.ogbodu@ncdmb.gov.ng',NULL,'$2y$10$BCKmQLVpVw0W9lkkM6oCC.C/qtuc4VzvRXSX4DgXi2VgdUdw.PFC6',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(78,'A0094',NULL,'BLESSING','I.','OKHIEHE','ouh6YxoF3Uj',10000.00,'member','pending','blessing.okhiehe@ncdmb.gov.ng',NULL,'$2y$10$cJpkjCIWbrgHP7OnuYEDMe3dCyTkEUHhLD..Va5tp0naUKo7Ca7k6',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(79,'A0095',NULL,'BRIGHT','TORUBENI','AMATORU','anQCHz6msFS',10000.00,'member','pending','bright.amatoru@ncdmb.gov.ng',NULL,'$2y$10$.qtUNUlI40tR776x5GjGDeTf6wnOFxnUvT67xR//PBMtZljr3frPa',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(80,'A0096',NULL,'REX-OGIBUKU','','MINABAI','A0Srd8gAAOO',80000.00,'member','pending','minabai.rex-ogbuku@ncdmb.gov.ng',NULL,'$2y$10$oB.6JpOoNbv6no58lmjWo.o8D6kJ1pujUTaPSz5doxWga9IWs0gtO',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(81,'A0097',NULL,'OSAGIE','DANDY','ABUDU','yrOY03H8upY',10000.00,'member','pending','dandy.osagie@ncdmb.gov.ng',NULL,'$2y$10$QKtANSmtsMusWC4lusL6XuG.2r2MBFEQrvkSrf38HYkg458s4c26a',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(82,'A0098',NULL,'BENSON','OLUWATOYIN','INIFIE','FvHSiVZ705B',30000.00,'member','pending','benson.inifie@ncdmb.gov.ng',NULL,'$2y$10$/voEXPNLalJnQ7Na7fCBQ.WPS8wKSaX6xxEHUlbbX9jHQoxACJHde',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(83,'A0101',NULL,'JOSEPH','BROWN','ATIBE','ho8vtpGcqrg',0.00,'member','pending','brown.joseph@ncdmb.gov.ng',NULL,'$2y$10$E7YMsZky34.Hip1W6Ohd3uCjeNYN1XwvjoGr4p1oVLVH9x.xrcgAa',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(84,'A0104',NULL,'PREYE','OWOUPELE','AMANGALA','KiCv6Mlcv1P',50000.00,'member','pending','preye.owoupele@ncdmb.gov.ng',NULL,'$2y$10$AABNR4ZSJLEXIhd0bSGLuen7EGaNnCuUXBkBeXAT365j/rigghP86',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(85,'A0105',NULL,'CHINENYE','OBIAGERI','NWAUWA','hmvxowThTnQ',50000.00,'member','pending','chinenye.uzor@ncdmb.gov.ng',NULL,'$2y$10$y54SIVwn9FRIoCZoJf0mcuveK4kK7qtpW94zlh9WUYILVj2wUNL0i',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(86,'A0106','A00000','TAIWO','EVELYN','CHARLES','08134086360',5000.00,'member','active','eveclems08@gmail.com',NULL,'$2y$10$HvNxGoF2S.78ff1pYa7lzOHPt2y/BLV5TBaLTD5EJuWKN49unaeau',1,0,NULL,'2023-04-26 09:34:58','2023-05-30 15:00:52'),(87,'A0107',NULL,'DESMOND','','AWUMADE','SHjUzlEJIwp',20000.00,'member','pending','awumade.desmond@ncdmb.gov.ng',NULL,'$2y$10$maO6f1XuvlyovGKtqWhrJOKk1pjNz8pXeD77KjXPjumqCZ1KCGa/K',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(88,'A0109',NULL,'DEBBI','MIENB','ABU','FwTYvS28Mlk',90000.00,'member','pending','debbie.abu@ncdmb.gov.ng',NULL,'$2y$10$AetmhFR9ffPeLBQYFW57L.RmpbslMvVxiedWm1J635.cgxaZ8FZ7q',0,0,NULL,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(89,'A0110',NULL,'TURNER','J.','EREFAGHA','hvcOtBnvG2i',100000.00,'member','pending','erefagha.turner@ncdmb.gov.ng',NULL,'$2y$10$6fb6cZf3arH4wSICvPoSXuZ3EwzMwjHXmpB447bBIqQPJKovO7/Vm',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(90,'A0111',NULL,'ANTHONY','','WOYENGIDINIPRE','FKm9xQqSRqQ',5000.00,'member','pending','woyengidinipre.anthony@ncdmb.gov.ng',NULL,'$2y$10$YUFV03jz9/tV6au.dZ/FPuD7PcRZ1NVGJxyXgLq3A1QEGsKaac/ju',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(91,'A0112',NULL,'TONARI','OLARENWAJU','OGIASA','8g9sz9DlXfy',110000.00,'member','pending','tonari.ogiasa@ncdmb.gov.ng',NULL,'$2y$10$qKHh.qktD7R.yiq3C.iZWO3avlWLKIoZ9PqdSWyk6Bu6.Zgoyz8qe',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(92,'A0114',NULL,'BALA','EMMANUEL','YUSUF','Id3Uk43rNJr',10000.00,'member','pending','emmanuel.yusuf@ncdmb.gov.ng',NULL,'$2y$10$vhkxORKM5SmImg1BKBG3J.YGh1HtnWjlpEddJc61g77S9UuJ5ncrG',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(93,'A0115',NULL,'YARONIN','','ABI','7Mn8XoO75qD',200000.00,'member','pending','abi.yaronin@ncdmb.gov.ng',NULL,'$2y$10$gl4OvXR5qwavCn/.rPjYBucCjds6fBnqHV0.L7bLbpLycAIdTj1Qm',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(94,'A0116',NULL,'MERCY','AZIBAYAM','EGBA','b0TDbCH7aMk',70000.00,'member','pending','mercy.beredugo@ncdmb.gov.ng',NULL,'$2y$10$xCtbIs13cN21xDE96bIBteHibjVzyOE9RfwNQqFEbRSspTxMxN4NW',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(95,'A0117',NULL,'BRIAYE','','AMIEKUMO','u40IRlFQKgv',30000.00,'member','pending','braiye.amiekumo@ncdmb.gov.ng',NULL,'$2y$10$jcTTd7HvIyGainQXvzGn2u8scZhYiPyrn54VkB4xQNbPC20g8mZVS',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(96,'A0118',NULL,'REGINA','IDUMANGI','AMIEKUMO','sPsHBlcOr74',30000.00,'member','pending','regina.amiekumo@ncdmb.gov.ng',NULL,'$2y$10$AeIEZAmdTzw4zHiJeJB86.GkucH3yXRPWy0kPG4Ak8Wj7jOGFEkja',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(97,'A0119',NULL,'JOSEPH','','ADEBAYO','6Wd5JtfgAw7',100000.00,'member','pending','joseph.adebayo@ncdmb.gov.ng',NULL,'$2y$10$N3DUbyamLtevwKusrdYWgO18BRxXk2B7El53Ri1Mq5yqvUqHLs.sa',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(98,'A0120',NULL,'BLESSING','IME','EKPE','15qYUK04iGN',10000.00,'member','pending','blessing.ekpe@ncdmb.gov.ng',NULL,'$2y$10$AalnrE3TKTU5gr7weWbj1.ke/VOkKfeMsmpMFdX07a7rLnICPte1.',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(99,'A0121',NULL,'EBUBE','AJEROH','AMAM','MSVLZcYhD5Y',15000.00,'member','pending','amam.ajeroh@ncdmb.gov.ng',NULL,'$2y$10$bMOTedsO9L5EXZMfa5gMDOK2dsj3rTeLUEBPaqlrIeCSy5iYZ2TR2',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(100,'A0122',NULL,'EMBELEAKPO','HILARY','ABIDDE','YC3zAhnOt1i',10000.00,'member','pending','abidde.embeleakpo@ncdmb.gov.ng',NULL,'$2y$10$JtjEIzihf1QnTVmYgjqefO/UOCT0ala8cyTAtK1zXssXw5LEKhz2y',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(101,'A0123',NULL,'GHALI','J','SALIHU','QtA8SwymfEp',20000.00,'member','pending','ghali.salihu@ncdmb.gov.ng',NULL,'$2y$10$cDVEWTQrZuCVJLhSyzuf9.pU3oC7rNxXwpybt4fqEESEv1F6.Yc32',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(102,'A0125',NULL,'YOUNG','GODWIN','GODWIN','zHGenEGTWt7',10000.00,'member','pending','godwin.young@ncdmb.gov.ng',NULL,'$2y$10$mhnRSR0uIkYVuDAV.qXzBOEoxKDTIfzOop0EyJ10xV4dXahTn5.cC',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(103,'A0126',NULL,'PIUS','OBUDUN','WARITIMI','jem5mFS4J8n',50000.00,'member','pending','waritimi.pius@ncdmb.gov.ng',NULL,'$2y$10$se7.SbiuiWvGxonsocuqWubtvuqWSvtbifmLrivGUHdWYJa6zNYpa',0,0,NULL,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(104,'A0127',NULL,'EBIYE','','OYAKEME-AGBEGHA','5fU0zsQWWuw',50000.00,'member','pending','oyake.ebiye@ncdmb.gov.ng',NULL,'$2y$10$9O/X.aroBhRMr5y2SpvkMuYPPE.UaJ3JmNNRYtejlr.Xr8C.31VE2',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(105,'A0129',NULL,'ANGELA','','OKORO','6rTiwfaziII',100000.00,'member','pending','angela.okoro@ncdmb.gov.ng',NULL,'$2y$10$g8vvcXHe4YkAjlrNmpKsn.EuzcmJeh2gDaxvY5KZJM0TeHQKG2FxO',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(106,'A0130',NULL,'DOKUBO','','OBONGO','HktY8oMUsmB',20000.00,'member','pending','dokubo.obongo@ncdmb.gov.ng',NULL,'$2y$10$KvIdUr4YMdTE1fpwZlV8zu2U4YOYqPdrST4HSlKt8soZtLbTjuLuG',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(107,'A0131',NULL,'ONAJERO','KOINYAN','OSIEBE','O18SiLMujuM',10000.00,'member','pending','onajero.osiebe@ncdmb.gov.ng',NULL,'$2y$10$3A30G5mpGdxFLR/9dBu/RuQHkD6ugZ/hDrdvBP7bk10yODFJmkBqy',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(108,'A0132',NULL,'SILAS','OMOMEHIN','AJIMIJAYE','5b8P8IGUYYn',70000.00,'member','pending','omomehin.ajimijaye@ncdmb.gov.ng',NULL,'$2y$10$CVhF9VkljthZY0w25e4ZJecpqTMS5jvh6srzqBY4FBuaEc2rIPdDa',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(109,'A0133',NULL,'ZUWAIRAT','','ASEKOME','Je2ESykmhqC',20000.00,'member','pending','zuwairat.asekome@ncdmb.gov.ng',NULL,'$2y$10$6a292TOlzCJ/UHenAu8GIeBYuok3zt9zq2/Ja8k.UTFz.QdadXNr.',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(110,'A0134',NULL,'HEDNA','O.','OKWU','Z9Bx0jo4sE0',20000.00,'member','pending','hedna.okwu@ncdmb.gov.ng',NULL,'$2y$10$vJA2fbciK3zSy1m2wEwSy.S5tsEYWGZn0Pe4OXG4VGve3lo2PhWkC',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(111,'A0135',NULL,'ZUOFA','','IZONEBI','WM5OGvSFKU4',150000.00,'member','pending','izonebi.zuofa@ncdmb.gov.ng',NULL,'$2y$10$6Tl0c4xdTfhQZlUxmDo2C.O6S1AHeEbo7AIUXjeAjtOc3gY3sfjmi',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(112,'A0137',NULL,'ALIYU','M.','LIMAN','HhtB6nWueLY',20000.00,'member','pending','aliyu.liman@ncdmb.gov.ng',NULL,'$2y$10$7DJ/9s5p0pHuOvEgejIA2OykH8mVHQzUYTYej12IXcV3e6Awz4HAW',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(113,'A0138',NULL,'JOSEPH','','SAMUEL','au4iClOLX5V',20000.00,'member','pending','samuel.joseph@ncdmb.gov.ng',NULL,'$2y$10$pGsbnqnhVO3xWg0oOuDG6OfhgnnF8cLL2xbqgsrp8PqWs1bbI8X8m',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(114,'A0139',NULL,'LEVI','U.','ONYEKAONWU','axqYwEgXDxd',50000.00,'member','pending','levi.onyekaonwu@ncdmb.gov.ng',NULL,'$2y$10$D5e4fLCp3D7JVTZ0/1GTkeLBNdDL8U8aC.a.eOh4WngHLrHP0L0RW',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(115,'A0140',NULL,'MOSES','EKPENYONG','ANYAMA','5J0V4Z6rFC8',20000.00,'member','pending','moses.anyama@ncdmb.gov.ng',NULL,'$2y$10$OLYoy0E/EQH./kpmSeHn1Oo.MyflS12ikZOlrqzqMSymxlKuo8jRy',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(116,'A0141',NULL,'LILLY','FUN-AKPO','WARRI','tA5xxXvkFnL',50000.00,'member','pending','lily.warri@ncdmb.gov.ng',NULL,'$2y$10$p9GsNZ0OGiUNyHrokh7Wquz82bYLOolaQFipbcCg2RiKPqUzVxLOa',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(117,'A0142',NULL,'BARTHOLOMEW','E.','ALOZIE','07duSkWa5M5',30000.00,'member','pending','batholomew.alozie@ncdmb.gov.ng',NULL,'$2y$10$fcLlGE4MVdjqcgkEz51NLeBDS3aFoaisjGZPboZiWTBLXbdMeTNa.',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(118,'A0143',NULL,'ETIFA','','ETIFA','zKXR3a7raKl',50000.00,'member','pending','etifa.teikakpo@ncdmb.gov.ng',NULL,'$2y$10$cx1baUjnYUTTicPKCojYn.jMXUwUWeDHkS9pc0hCIhG0AVH1BRVKC',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(119,'A0144',NULL,'ADEOLA','','OMOLE','LWjwp3KIA5g',100000.00,'member','pending','adeola.omole@ncdmb.gov.ng',NULL,'$2y$10$q3JvK6KdFQjtewu0ExLwHOFuJ73XUQ.yIi1czuNtoEusehrxKZEQO',0,0,NULL,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(120,'A0146',NULL,'NURA','DANMARAYA','ALIYU','ELLxZrssUiz',100000.00,'member','pending','aliyu.danmara@ncdmb.gov.ng',NULL,'$2y$10$l8UrMHDS2lCenS0H2Lm6jO45r4faL9Hw9NTJ0OdH3B4nyR.0ocr6i',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(121,'A0147',NULL,'KINGSLEY','C.','OZOH','k1QW5DQFeTa',10000.00,'member','pending','ozoh.kingsley@ncdmb.gov.ng',NULL,'$2y$10$bN2CkNljO7qZutBUNoyejun.dVBSK/.K86/Zxauwx0LLbDDuMLlK.',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(122,'A0148',NULL,'AGEV','ROBERT','TERNGU','M3SqXGCv16v',30000.00,'member','pending','agev.terngu@ncdmb.gov.ng',NULL,'$2y$10$b.sLWz8HvVDFVYnF94FF5OGHct6D2stDtdoBmpq71y1hB97OMoRpS',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(123,'A0149',NULL,'CHINEDU','C.','IKEJIANI','q2n7nZeiJfi',20000.00,'member','pending','chinedu.ikejiani@ncdmb.gov.ng',NULL,'$2y$10$orwHan8j3wyMPkaRPsu6LO435DDgvpvLkRIOP7rRDM6mUxqPBAlae',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(124,'A0150',NULL,'UGOCHUKWU','M.','OGBONNA','9r50aD5uvGP',10000.00,'member','pending','ogbonna.martin@ncdmb.gov.ng',NULL,'$2y$10$kDId6RRylKfPFXE5a43J2uyj9qmvI34qDIrjuu5RtPuT7moiVqeOe',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(125,'A0151',NULL,'AMANDA','','YEKOROGHA','avmOnguDCKg',130000.00,'member','pending','amanda.yekorogha@ncdmb.gov.ng',NULL,'$2y$10$L0HrzpJ0gYyku2BU6n/4/.C9ARkNDhxaE2mwlYn/hRCNZs8DPriAu',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(126,'A0152',NULL,'RECHAEL','PRE-ERE','EJINDU','s9ci17v97RH',20000.00,'member','pending','racheal.ejindu@ncdmb.gov.ng',NULL,'$2y$10$rrA57Cw3iTSKZKvbfwDgdumDic/Eeb5x53I6xBboiJEm3ZEZe36ZG',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(127,'A0154',NULL,'CHRISTOPHER','U.','OGANUZOR','CV1FsP82z23',10000.00,'member','pending','oganuzor.uchechukwu@ncdmb.gov.ng',NULL,'$2y$10$xe3rpjonutNpugTvUf2UZ.ZBVtXzzmYAbWhxLhOuxrCEb4dZxpnA6',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(128,'A0155',NULL,'EMILY','','OMAJURUN','pnfgWGCh62n',5000.00,'member','pending','omajurune93@gmail.com',NULL,'$2y$10$F2p/w7z1s0mkDbaiCfrAr.Zu2HADNaxvh9NFBfGVjd90OLWa8CQvq',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(129,'A0157',NULL,'CROWN','E.','LAYEFA','Ho8GAST5hXF',5000.00,'member','pending','layefacrown@gmail.com',NULL,'$2y$10$v.AOkha68s3XqIFoPl7O3ODmbw8zVmIF4/FE01ml1OjyquBtXTsau',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(130,'A0158',NULL,'EBIERE','BLESSING','AGBALALAH','mogF934CKQq',10000.00,'member','pending','ebiere.agbalalah@ncdmb.gov.ng',NULL,'$2y$10$7RAjsnRVUGyIKQlHp1yGaul70KtiCIpK0UBLJUR6B87tTvi4.CNoG',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(131,'A0159',NULL,'QUEEN','ASA','ENWEREM','hXoj93ssXoM',15000.00,'member','pending','enwerem.chika@ncdmb.gov.ng',NULL,'$2y$10$wHIVIPVFGji53yO2GhHo..nkpOSOPPc0515E8C1T4dEHreYyYk/Lq',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(132,'A0160',NULL,'BOMA','BLACKDUKE','TORTY','rBJWfQl5PgS',50000.00,'member','pending','boma.torty@ncdmb.gov.ng',NULL,'$2y$10$zVcpKwN7SkJvXauB7pigW.7oBo48Bp62sCbDq.huFv7y1qG1lvGZW',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(133,'A0161',NULL,'NABOTH','O','ONYESOH','89Yy128tYzG',50000.00,'member','pending','naboth.onyesoh@ncdmb.gov.ng',NULL,'$2y$10$JhO1XacP9BkPmjZwZ2ajIeR9i75Jf5zmkayQOaBqWgw872Zya4Abq',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(134,'A0162',NULL,'KELLY','','KELLY','QJl2jF5Wvpv',30000.00,'member','pending','kelly.olaye@ncdmb.gov.ng',NULL,'$2y$10$flKlonBrDERnPiz4rkx14.qnzqIns.Wb.OrD1y0Y0r.xNezMgAJTm',0,0,NULL,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(135,'A0163',NULL,'JEPHTHAH','VINCENT','AYEBAIFIE','5WYgIzLgnzC',20000.00,'member','pending','jephthah.vincent@ncdmb.gov.ng',NULL,'$2y$10$0H7sJpTASWiQEzWaIb0/o.z/X53.78R/HNST/qkOzGjtJO1P/qL9q',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(136,'A0164',NULL,'KAYODE','UMAR','ARIKEWUYO','Be8NXV5Ozgy',30000.00,'member','pending','arikewuyo.kayode@ncdmb.gov.ng',NULL,'$2y$10$DpOHD09nYy4be2VYU9wnDeuL3n1TVeTM1ZIucr2UKn88ibC89vxIe',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(137,'A0165',NULL,'OLUBISI','JOHN','OKUNOLA','gLSSF6RUhQu',0.00,'member','pending','olubisi.okunola@ncdmb.gov.ng',NULL,'$2y$10$cI0dFKdq.z11ysHV.zH0L.8man66OXg5XRr1akN8t3toclkfq1Ska',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(138,'A0166',NULL,'WILLIAM','J','ARIKEKPAR','0HCnsB9ZDUS',0.00,'member','pending','william.arikekpar@ncdmb.gov.ng',NULL,'$2y$10$PxLJj71O1SIsPdAAADM/rOWOG3mxjfFWtbqip2VCNMSjZbAIP2JLq',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(139,'A0167',NULL,'ALEXIS','BOSEDE','EMMELLE','p33BCQ0OhWS',0.00,'member','pending','alexis.emelle@ncdmb.gov.ng',NULL,'$2y$10$HtRzqBeWdvLkVu1k4/teV.knUrYVGwcL3qFrp9QXIveEUDiMwez/G',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(140,'A0168',NULL,'DORIS','OBUTO','OPUWARI','G3hmva6cMTv',50000.00,'member','pending','doris.opuwari@ncdmb.gov.ng',NULL,'$2y$10$fNxbNh.BuP.wSLRAJhgxTuDD1dfOWH.2eDcg1xkl9pqnJAPF.8oVm',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(141,'A0169',NULL,'DIDI','GBANO','OGEDEGBE','pIFoLhUW9TO',50000.00,'member','pending','ogedegbe.gbano-didi@ncdmb.gov.ng',NULL,'$2y$10$M1ZLEvlPSdpSuEGBdCuD..GTM12jGmNyDN78BUu3iXagmkSkfyMDK',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(142,'A0170',NULL,'DAVID','IKIEUGO','AGAMINI','BZkIoUiK3AI',15000.00,'member','pending','david.agamini@ncdmb.gov.ng',NULL,'$2y$10$WPU2mJzUrQoOzOpirYt7Ye48wnQ0oorL3e0u64Zg9HU7V6h7fPGB6',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(143,'A0171',NULL,'IKENNA','','UMUNNAKWE','QvE1dOOumNZ',10000.00,'member','pending','ikenna.umunnakwe@ncdmb.gov.ng',NULL,'$2y$10$VzkHq1kmnjT43IJhKWirpO2NK.eGRV8vZRPOmCI7xViCxZ/hqymIy',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(144,'A0172',NULL,'ELVIS','ADIME','OGEDE','DHLnNg6UkuM',50000.00,'member','pending','elvis.ogede@ncdmb.gov.ng',NULL,'$2y$10$IwbBBvStTmID2v0teRczYOvpljtG4DKTISs1peZXhnbeL0vA58.KW',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(145,'A0173',NULL,'CHIDINMA','','ADIELE','zF22Xdnzuh8',10000.00,'member','pending','chidinma.adiele@ncdmb.gov.ng',NULL,'$2y$10$1o0ahTK.JHYKzhNP.o31sOibt0ps61u7QjEhWCHxZ1hBhNwIkJ22q',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(146,'A0174',NULL,'OTAMINAGUO','','OGHE','OtGi8RLidft',10000.00,'member','pending','otaminaguo.oghe@ncdmb.gov.ng',NULL,'$2y$10$967MSQdgKaN1lGG6zMhqse0blMJYQfkGPqj1WJlbMb0OJX.Eot8ku',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(147,'A0175',NULL,'ISMAIL','','ABUBAKAR','F4o1TrQC5ph',20000.00,'member','pending','ismail.abubakar@ncdmb.gov.ng',NULL,'$2y$10$KUnN1xxWN2iVVYWFpREUgO0zZRkOGuEy/R2WrRypAOLbW4iGYndpa',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(148,'A0177',NULL,'BENEDICTA','ATARAM','ALLISON-OGURU','LNwvLo0krAv',45000.00,'member','pending','benedicta.allison@ncdmb.gov.ng',NULL,'$2y$10$MIfa9dOBEpPk8M158/LMk.y/eJLVaZ7mNbW2rz6wHNJrLMG6Dn7MK',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(149,'A0178',NULL,'EMMANUEL','','UMEANYA','Zy9UU9Z7JOE',10000.00,'member','pending','umeanya.emmanuel@ncdmb.gov.ng',NULL,'$2y$10$tV.0xCXPTm6hUSBCOczs5u0Wam362Av/mrOgynmaNLashugxJQER.',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(150,'A0179',NULL,'SHEBA','','OLUGBENGA','0WrWnFnVhgw',10000.00,'member','pending','olugbenga.sheba@ncdmb.gov.ng',NULL,'$2y$10$MuP.uqxrV1CykPyWJ7oR3eI40w.HIlniGX7XTFUzbx83tEl9OOueS',0,0,NULL,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(151,'A0182',NULL,'NANCY','INYANGETE','INYANG','fXcFm0jTvaT',50000.00,'member','pending','nancy.inyang@ncdmb.gov.ng',NULL,'$2y$10$ivEmsXe7Y4D6k0IUANhzYe7yKbVkJBx1vp7wvJf8El/B6keosPMHi',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(152,'A0183',NULL,'JOHN','IJEOMA','BARIGHA','H9bvFgMOsHK',10000.00,'member','pending','john.barigha@ncdmb.gov.ng',NULL,'$2y$10$u3WVSczvgMaIa7M7YmYSQuY8jn1nngOcnsy1cRwKP2Z3rk5Mi.woy',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(153,'A0185',NULL,'GODFREY','GODFREY','DEMEYIN','rp6KJENToS4',70000.00,'member','pending','godfrey.demeyin@ncdmb.gov.ng',NULL,'$2y$10$ND93d7H8aoWuHv4vT1bW5u.kLzrFRimPtSH1MYyZ88Nrf4BVvAgLe',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(154,'A0186',NULL,'JOHN','WUPUIKUMO','IFIDI','jg02DUgHduV',10000.00,'member','pending','john.ifidi@ncdmb.gov.ng',NULL,'$2y$10$QsLxQPJyMaxN7Ba1kp4I4uvkESwaia2d9gYBXbcI.5ktFcDsnvR72',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(155,'A0187',NULL,'EDACHE','EMMANUEL','ABAKPA','DvXzqE3yclO',60000.00,'member','pending','emmanuel.abakpa@ncdmb.gov.ng',NULL,'$2y$10$35xfOPYm3ydtzYuEZkdrhuPkEr1Snvr4yvoB5kkLouv4AvTv6BdOW',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(156,'A0188',NULL,'IFEANYI','N.','NWOKEMODO','HP5wpbU9e2B',10000.00,'member','pending','ifeanyi.nwokemodo@ncdmb.gov.ng',NULL,'$2y$10$rs3gXzqAK7mqqCcpIAW9M.XmA0ljQym6IEMLbmNA0cSP18asmXL2u',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(157,'A0189',NULL,'LOTANNA','ONYEKACHI','OGBUAGU','cNkk5gm9zkc',20000.00,'member','pending','lotanna.onyekachi@ncdmb.gov.ng',NULL,'$2y$10$HCOMQ9BPDUGWwi/VaL/.1O7FFAgVXF9bvGz5IM2IoyXLeTjVSUcsG',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(158,'A0190',NULL,'ADEDAMOLA','A.','ADERIBIGBE','Ymls82ipwBO',50000.00,'member','pending','aderibigbe.adedamola@ncdmb.gov.ng',NULL,'$2y$10$anIn1s2wFdlhsroHuPK7WOoXn3dnVkIGr72zxGlnmWb3g4Ci1bzZq',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(159,'A0191',NULL,'NELSON','UGO','AJUONUMA','Cowzsma4sEa',20000.00,'member','pending','nelson.ajuonuma@ncdmb.gov.ng',NULL,'$2y$10$d8nfEYR36rFNaHXeyNpI1e20syi3NCMYvV8fzwmnC.SKTEkmg56q6',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(160,'A0192',NULL,'AYIMOVIE','DIEKIVIA','IKIOGHA','UEz1A84yCo0',10000.00,'member','pending','ayimovie.ikiogha@ncdmb.gov.ng',NULL,'$2y$10$17aWth2xH7neK4tGrgJwB.9NcZ7RfybT5DL/7xjFF7lC.JYjiBOHm',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(161,'A0193',NULL,'MOHAMMED','UMAR','BABANGIDA','WqngchxLBnm',50000.00,'member','pending','mohammed.umar@ncdmb.gov.ng',NULL,'$2y$10$Cm/dSlrzLxg6Y4UACU2GUez/vXWDi1B2GBlCTWzMVsRWvMmInH6ny',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(162,'A0194',NULL,'MAKERA','','MAC-INEGITE','iIqcb3O7WmC',75000.00,'member','pending','makera.mac-inegite@ncdmb.gov.ng',NULL,'$2y$10$HvNxGoF2S.78ff1pYa7lzOHPt2y/BLV5TBaLTD5EJuWKN49unaeau',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(163,'A0195',NULL,'GODSWILL','CHUKWUEMEKA','OGEH','R0SSVNnHALc',15000.00,'member','pending','ogeh.godswill@ncdmb.gov.ng',NULL,'$2y$10$3OGtkg8H5Sc4gnaqBJ/IAeSy6bGlOVC78NEZHBuXR95p7FBLlTpUi',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(164,'A0196',NULL,'GRACE','KELVIN','KELVIN','WdXUsBcBJ8i',30000.00,'member','pending','grace.wilson@ncdmb.gov.ng',NULL,'$2y$10$xoHO5sfnr3hfpCgHxa1TVOSBczc6fBTP9vpR2wwOakwKDGDW1vJ8q',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(165,'A0197',NULL,'KENNEDY','C.','NWOBI','BZiOfzKbu8t',20000.00,'member','pending','nwobi.kennedy@ncdmb.gov.ng',NULL,'$2y$10$o4AHV7h2.CJEw.BPPB8Qoe/8j/E.fpQOBx5BZnK.MBn0wqmR5CrKy',0,0,NULL,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(166,'A0198',NULL,'GLORIA','','KALU','lU4RhxOLWll',70000.00,'member','pending','gloria.kalu@ncdmb.gov.ng',NULL,'$2y$10$0qBv24DExh0vykRI7bw7ce/RYfd.LVXLgD1hNDeh.WB4ypDbnjWkm',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(167,'A0199',NULL,'MAUREEN','ADA','OHAERI','CoIcXSA8fcM',0.00,'member','pending','maureen.ohaeri@ncdmb.gov.ng',NULL,'$2y$10$.9rZfVHBjd6AxZSad6dJ/OdgxdHVYw.5ufvVH/ZfSqLnK8ki2ivy6',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(168,'A0201',NULL,'AUGUSTINA','','AKAGBUSI','DvNbM0I4jqk',5000.00,'member','pending','augustinaakagbusi@gmail.com',NULL,'$2y$10$GC9nruwJxSKdHbzw67Rgyu/wlkQrv5.01Mi6HuIF6Chhf7Kyq5Vyi',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(169,'A0202',NULL,'SIMEON','O.','ESIEKPE','bBO3xXIpfiK',100000.00,'member','pending','simeon.esiekpe@ncdmb.gov.ng',NULL,'$2y$10$vkv2zGtQI3fak4Yj0rjbDOOXxBctWDXZIoUvlyYyLxAkhXc00B2fC',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(170,'A0203',NULL,'RICHARD','JOHN','TORU','SsVzyZmJTf8',30000.00,'member','pending','john.toru@ncdmb.gov.ng',NULL,'$2y$10$q8kXKsE/fjFivDvns/A32OCMiZw9mUEj5qcVT6yJvmIrHvGJIS1qa',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(171,'A0205',NULL,'MARTHA','S.','EBIBAI','7qYYKdCFajU',30000.00,'member','pending','martha.ebibai@ncdmb.gov.ng',NULL,'$2y$10$nvns2eyapDr0R/wmJVpSXO.Wojx3mgkRfd27TgAchHjSPRe4g17bu',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(172,'A0206',NULL,'WALTER','GODWIN','ASUKWU','YbzByZ4M0bg',30000.00,'member','pending','walter.asukwo@ncdmb.gov.ng',NULL,'$2y$10$m1C6PsNyM707RoG6Y6T5uuZjM9Q89DpokWeWmCfuwmQVWNxrNxDlG',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(173,'A0207',NULL,'EMMANUEL','UMEME','PAULKER','RBvrmNAcqTd',30000.00,'member','pending','emmanuel.umeme@ncdmb.gov.ng',NULL,'$2y$10$EBvPXjvR6f4Yy3mklUsBruoBDyUfwWlonAz9CFN80C3AUvUEC8o6e',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(174,'A0208',NULL,'MAUREEN','OKIEMUTE','OBUKOFE','4LeJhQ5yBvy',0.00,'member','pending','maureen.obukofe@ncdmb.gov.ng',NULL,'$2y$10$kpnjje53VwMdVC7P8dHb1OLn7nDLMr72GMlvOln561wNamVSdyPsG',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(175,'A0209',NULL,'BILLY','ADEMI','OSIGWE','8he5fxedsed',20000.00,'member','pending','osigwe.billy@ncdmb.gov.ng',NULL,'$2y$10$2Wh3PyA.JNUV56Tslf8jPuPvy51CU6Crk9csiWAaCOmdHdh.0WjV.',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(176,'A0210',NULL,'BASSEY','','UWEM','ua70cbdTmWj',10000.00,'member','pending','uwem.bassey@ncdmb.gov.ng',NULL,'$2y$10$e.4fXtvQF1kjYNAt.Seet.OsWJlyes7uqYwt7YSKgLo1t4eYsqg.i',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(177,'A0211',NULL,'BABATUNDE','PAUL','AKHIHIERO','CoDqtpDxFR2',25000.00,'member','pending','babatunde.akhihiero@ncdmb.gov.ng',NULL,'$2y$10$U9MwzrEFwoDaB5LKPLrYkub2CwsYJcoVlcDaPSwGcr5Gq1ysYTpcW',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(178,'A0212',NULL,'TASSALLAH','','TERSUGH','cxHH3a5LnKO',0.00,'member','pending','tassallah.tersugh@ncdmb.gov.ng',NULL,'$2y$10$8oOCZS8wS8wd6HXOCUmxCezutwlBeAlFnSJADB0EBcNmyCwNFXGzi',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(179,'A0213',NULL,'JONAH','MOSES','OKONTE','W0oEm0IfCqa',0.00,'member','pending','okonte-jonah.moses@ncdmb.gov.ng',NULL,'$2y$10$YbcxfNb1qsumRtsBFkgrS.xpCUEw7sebQVxZA1sdXxWoKy/9PxVLS',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(180,'A0214',NULL,'HENRY','LAMIEDOR','ALOGIDI','qYw4gYIqdvf',20000.00,'member','pending','lamiedor.alogidi@ncdmb.gov.ng',NULL,'$2y$10$aEEUUGJZPTYYsrIHFlJJjOdgEv70HbhsoLN6Vqr6fXp2zrL9qMf2S',0,0,NULL,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(181,'A0215',NULL,'SALLAHUDEEN','','MUHAMMED','noSRzsyyoD1',5000.00,'member','pending','sallahudeen.muhammad@ncdmb.gov.ng',NULL,'$2y$10$QCdWixoMYjEIYZO7oTNYvOqPlxpXTQhkisyUjmAbMWAbKvs6YWbk6',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(182,'A0216',NULL,'PRUDENCE','','AKUDO','0fpm5TZz8Qv',10000.00,'member','pending','prudence.gift@ncdmb.gov.ng',NULL,'$2y$10$Iju8u6Nj78AdxgVsGrLuFOXBBH./lf5TCPWsNjujdrIROVuI9Ba42',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(183,'A0217',NULL,'PETER','O.','EWHRUDJAKPO','NoOFSWBhAO3',20000.00,'member','pending','ewhrudjakpo.peter@ncdmb.gov.ng',NULL,'$2y$10$NjmPdhVOM9BYpwhBzDLJBu5aCLL8onQ9KPCkMCT0stxNeYwSkvCbG',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(184,'A0218',NULL,'PATRICK','','OBAH','uOFOyxdit96',0.00,'member','pending','patrick.obah@ncdmb.gov.ng',NULL,'$2y$10$UT6c3iQqGHlm3zf/g412VufKWXugygrAIcTLP59nZqniRpgPd/lY6',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(185,'A0219',NULL,'DAN','KIKILE','ESUEME','vtYOQ9gyWVF',100000.00,'member','pending','esueme.kikile@ncdmb.gov.ng',NULL,'$2y$10$OZ71Bo8N0ytMKyg7BZxmQuR.fU7X3TOM50uSrM.TZOBwascRIbLqu',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(186,'A0221',NULL,'JAMES','','EYETIGHA','xxsJp6ND6ip',20000.00,'member','pending','james.eyetigha@ncdmb.gov.ng',NULL,'$2y$10$AIv8UqFxODSpWvmfn4Jvn.f7UfXSCxcFElSktdaujBVVu1g4EsSFO',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(187,'A0222',NULL,'MOSES','','OPUWARI','Gk5lf3W3n2T',50000.00,'member','pending','frank.opuwari@ncdmb.gov.ng',NULL,'$2y$10$3GFjAwy3e5SHiOKrt.tOvue/SmEJ5MOIPFG9NX2uFqX9YJ1SkogLO',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(188,'A0223',NULL,'BASHIR','','AHMED','g4hjkgYCHr0',20000.00,'member','pending','ahmed.bashir@ncdmb.gov.ng',NULL,'$2y$10$XqVIyqRhecMX/4BbcKdPfObekyT/0NH147tKZUt5nsGrOPuAFqPI2',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(189,'A0224',NULL,'ISAAC','TEIDOU','YALAH','BETDNvhoGIU',200000.00,'member','pending','isaac.yalah@ncdmb.gov.ng',NULL,'$2y$10$hd7LOwkrQzp055tzD4rcjelBJWD0wSLu6fD3WR3Iq0lVOiriuYIx.',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(190,'A0225',NULL,'TEDDY','INEIKIDOU','BAI','1k0YobS9Fz1',50000.00,'member','pending','teddy.bai@ncdmb.gov.ng',NULL,'$2y$10$QLAe5N/xTkiMOPeT4X0XWeDpcXBCd0/jtHitG7xfRB1qQOxkuiyX6',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(191,'A0226',NULL,'IFEANYI','UKOHA','UKONU','dli1KyQYd7P',0.00,'member','pending','ifeanyi.ukoha@ncdmb.gov.ng',NULL,'$2y$10$8q5cgFgNzoRP43xysjYJkOV.fyQ/mUW17scZj6Z7rqBpMm4i7opmi',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(192,'A0227',NULL,'FRANKLIN','','IZIBETOYINI','9zLNjC6Eyo6',5000.00,'member','pending','franklinizibetoyini@yahoo.com',NULL,'$2y$10$YPDqi9WAsTeTtXUs9TCvBeMde8T1EmVxzmGRvPqiR7aNm.Z7xukXy',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(193,'A0229',NULL,'JOHN','OZEKHOME','ILU','hNmK5pmKXQY',30000.00,'member','pending','ilu.ozekhome@ncdmb.gov.ng',NULL,'$2y$10$.2AH9DI8jyE85049UQVsKOY7MRZlxJrHeQ36rhv6mGIIxkXlIerP.',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(194,'A0230',NULL,'MUBARAQ','M.','ZUBAIR','CZejpx3eA5C',70000.00,'member','pending','mubaraq.zubair@ncdmb.gov.ng',NULL,'$2y$10$6YNt7kG0yuJ./oOoRYKrDe7wlM6UGyexTEYLajqxXR6qPc5Q3bPwy',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(195,'A0232',NULL,'ATONBARA','','OMBU','DqozW7jOWAq',50000.00,'member','pending','atonbara.ombu@ncdmb.gov.ng',NULL,'$2y$10$ZcJrjRhLPuWv11aJFGtGV.hZWUrW6AgIHhPF2Bwzda3vQjzuqsxAq',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(196,'A0233',NULL,'FATEEMAH','MOHAMMED','BASHIR','hdoM6ALr150',100000.00,'member','pending','fateemah.mohammed@ncdmb.gov.ng',NULL,'$2y$10$AxIyh74arI0jPq7smrmR1uxDDOkg0Z.7KD3tTTv6Aao0vrU41NWda',0,0,NULL,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(197,'A0234',NULL,'BOBBY','TAMUNOTONYE','EKARO','V0VA7SPViij',30000.00,'member','pending','bobby.ekaro@ncdmb.gov.ng',NULL,'$2y$10$HvNxGoF2S.78ff1pYa7lzOHPt2y/BLV5TBaLTD5EJuWKN49unaeau',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(198,'A0235',NULL,'KIO','','MIKIETUONISO','Jex8V5vjl2W',5000.00,'member','pending','mikietuoniso.kio@ncdmb.gov.ng',NULL,'$2y$10$Jb9VqUmdMUUHVhsOsdw9quZ0wTM7nrmln0bIhGWs9chFxKZY3Nnsi',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(199,'A0236',NULL,'USMAN','SHEHU','MAMUDU','kFnzXwrxjSn',20000.00,'member','pending','usman.mamudu@ncdmb.gov.ng',NULL,'$2y$10$Wb/wHtjIMThhyK8iKSoWqeiJEmcrw1DjQcvNCi0FNQqIqufiDPEuy',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(200,'A0237',NULL,'CHUKS','PETER','ONYEMAKONOR','k5ENrxeLpjU',40000.00,'member','pending','chuks.onyemakonor@ncdmb.gov.ng',NULL,'$2y$10$e6dTCj5ek5XVcGfhz7JiL.meSkiEawdSX1V1XimrKvr3UJz3DRzk6',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(201,'A0238',NULL,'SHUAIB','BABA','ISA','qUbZuKD96Y9',10000.00,'member','pending','shuaib.baba@ncdmb.gov.ng',NULL,'$2y$10$neYosgVvIAUWcNrFjFVLPOWnPBtnSBgceMP5OxCIVMCWbWlUgp/U2',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(202,'A0239',NULL,'CHINOMNSO','IKENNA','NWORGU','n5vHmQankbB',5000.00,'member','pending','chinomnso.nworgu@ncdmb.gov.ng',NULL,'$2y$10$R.paxON1FBIAqq8ZBz7bZemwUruValaWODRKyixfzDoNFHxvjlEBq',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(203,'A0240',NULL,'ANDY','','JISU','D6ncEqvgFs8',50000.00,'member','pending','andy.jisu@ncdmb.gov.ng',NULL,'$2y$10$a7O.IqOqUN97s96U0m7yxOZYgb4szjcOFysASMdCw5/5aWwT34HVu',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(204,'A0241',NULL,'UMUKO','UMUKO','SANJU','84dNqZmXMDN',10000.00,'member','pending','sanju.mabiaku@ncdmb.gov.ng',NULL,'$2y$10$g4kfhUCEq7/.MLc3ydw4uO5E3hOVjU5JOyQRut4jGYiVCB5ItaYgO',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(205,'A0242',NULL,'OGHENEKEVWE','EMERALD','ONOJETA','7TyLmEpGTjd',50000.00,'member','pending','oghenekevwe.onojeta@ncdmb.gov.ng',NULL,'$2y$10$iyHGaWUjRtZeb5NAbEcCo.K4rKQ51r4zBWWSQLE/17hLuB5K2nzBG',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(206,'A0243',NULL,'KAMSELEM','','MOHAMMED','tZObe9JqwwM',30000.00,'member','pending','kamselem.mohammed@ncdmb.gov.ng',NULL,'$2y$10$6UsTKZjITOpWTM9e42t5hOMKpT96RGa3HwH7k8vVIQq90Lg8OGfky',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(207,'A0244',NULL,'LIVINUS','ODU','OFFRE','NVbUwa97CWR',25000.00,'member','pending','livinus.offre@ncdmb.gov.ng',NULL,'$2y$10$Kw4ty0c3MNsrQLsrfZ44S.qVoxVBRtDUhnWEnUnSxvv/uSvD9nzaG',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(208,'A0245',NULL,'TOLULOPE','DORCAS','WLLIAMS','8L4LBj5uPOo',20000.00,'member','pending','tolulope.williams@ncdmb.gov.ng',NULL,'$2y$10$Vk/ZG5dF3YkhQSbIsjQfGudbcm2ofJlSJkL/tYm7Xv3n9WGbKuuju',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(209,'A0246',NULL,'SADIQ','ABUBAKAR','BUKAR','1SjcK0Jj12O',10000.00,'member','pending','abubakar.bukar@ncdmb.gov.ng',NULL,'$2y$10$DVcRdlzmBQlKB8NXaaUnj.13i7kaZsjn2AbXHpLDsytAAUhtmXTJe',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(210,'A0247',NULL,'TARIDOUYE','DISEYE','GAGARIGA','lrLZuyeOnkI',50000.00,'member','pending','taridouye.gagariga@ncdmb.gov.ng',NULL,'$2y$10$IAxCL3Fxx2Z2U34ZZvm3JuKmBISbiCehOWBBoQ4wEY4B5gLlDT85e',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(211,'A0248',NULL,'ARNOLD','UKUNORITSEMOFE','MEGBELE','qAgS25xme4Q',20000.00,'member','pending','mofe.megbele@ncdmb.gov.ng',NULL,'$2y$10$Zw.OqWJrucVNnW4FbAyreOUUVPsfjqO73RJ3e4qciJLn0X0mZfAsq',0,0,NULL,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(212,'A0249',NULL,'OYIZA','PREYE','LAMBERT','m8nB1IdnEah',20000.00,'member','active','oyiza.lambert@ncdmb.gov.ng',NULL,'$2y$10$/CzHQ3NsVTWTH5ImUNYuteuH8qUo2zaqqP7pNm/EJnF4.k2hmbvPu',1,0,NULL,'2023-04-26 09:35:07','2023-05-27 15:10:36'),(213,'A0250',NULL,'SIMBI','KESIYE','WABOTE','0a0pvh2aJcz',300000.00,'member','pending','simbi.wabote@ncdmb.gov.ng',NULL,'$2y$10$PJoE/iovFG.FvSzxDYth6.b7yKA97hBLELGKM.1xaeqEWhWlSvUmu',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(214,'A0251',NULL,'IBILOLIA','ESTHER','DIKIO','kdRm9hOL3Id',20000.00,'member','pending','ibilolia.dikio@ncdmb.gov.ng',NULL,'$2y$10$5iGrcdrzLvz4XoZkfUG7uud7nAsCLV71gVsQeVx1pNL2SX6keEtYq',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(215,'A0252',NULL,'IBISO','IBIBO','OYIBO','ycj6D8v6D36',10000.00,'member','pending','ibiso.oyibo@ncdmb.gov.ng',NULL,'$2y$10$9HZFmFXw6otPUr56JJUXwe6ND38JZ/imqBh4hDh9FpJC64F5Bq1Vq',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(216,'A0253',NULL,'JACKSON','ERE','SELE','3rKUNfWvnyL',10000.00,'member','active','jackson.sele@ncdmb.gov.ng',NULL,'$2y$10$GhLA4szyGh.p2hgO90rUp.LiDu2K3z1IpdIq0qLNoOkpCrkdnBsju',1,0,NULL,'2023-04-26 09:35:07','2023-05-27 10:45:41'),(217,'A0254',NULL,'PEREGBE','','MABINTON','F99sJ7auoMS',10000.00,'member','pending','peregbe.mabinton@ncdmb.gov.ng',NULL,'$2y$10$5RZYsAyODifPjFU9j9k.Wubtpa7bakforzXSyUs17iZbrxIVYI/KO',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(218,'A0255',NULL,'LIVINGSTONE','GODWIN','CHIMADHU','qwS6wAXqF4G',10000.00,'member','pending','livingstone.godwin@ncdmb.gov.ng',NULL,'$2y$10$gugzu2jc9Gn/z7GwM8H2me3v1zBGrP2xKhv9V/qcD3GNDMVD/P3x2',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(219,'A0256',NULL,'OLUWAFEMI','OLUWAFEMI','AKINMABOGUNJE','r9UKIPp6eEC',50000.00,'member','pending','adeniyi.akinmabogunje@ncdmb.gov.ng',NULL,'$2y$10$GYrwJuZhCSbR/JvRVPwsku/B7WGeVFtUn3hGXUEKcL5UvOamfN/eq',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(220,'A0257',NULL,'JASON','CHUKUYENUM','OGANUFA','rh44YNSwDhF',50000.00,'member','pending','chukuyenum.oganufa@ncdmb.gov.ng',NULL,'$2y$10$zswFVIbLL3sNBeF/K3WNwu6FVPzQUL.w4iki61jx6UGWnbzEIW0GK',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(221,'A0258',NULL,'DESMOND','OKIEMUTE','IGBERAJEGHRE','6p0mng2KFeC',10000.00,'member','pending','desmond.okiemute@ncdmb.gov.ng',NULL,'$2y$10$K0GwWtNmARzmPDEySqEXYuWp6R7HojDHqbj/rdjY/yQ6pljWVg1eG',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(222,'A0259',NULL,'KELSEY','','IDAREFAA','7BAKU6LMr7u',30000.00,'member','pending','kelsey.idaerefaa@ncdmb.gov.ng',NULL,'$2y$10$Rbs0L/wheu2Pzqc9ttUgvu5943N3Q89GgpCJVftdSdDSJlo.Frs2O',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(223,'A0260',NULL,'AYOKOMI','AYODABO','OSHIN','HZmaj9wNl72',10000.00,'member','pending','ayokomi.oshin@ncdmb.gov.ng',NULL,'$2y$10$G/wSK4OXY.I.OHLhqrhWgu9rQGbhy5H/I4x0oPn.oQEoPXAdFMj0K',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(224,'A0261',NULL,'MOHAMMED','BELLO','KAWU','fGSiZkjpzyf',10000.00,'member','pending','bello.kawu@ncdmb.gov.ng',NULL,'$2y$10$blTXew5diIXJyucXtIUsdeY5EU/tsiIwY8aBPg5yFFjtUDVZnjpvq',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(225,'A0262',NULL,'VICTOR','','AMABEBE','FaKhbPLQWQx',20000.00,'member','pending','victor.amabebe@ncdmb.gov.ng',NULL,'$2y$10$26tvnuCRtccsGGrO1w.T1.id7y4TRNBDtPVHMVdzH7U022tPieR3q',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(226,'A0263',NULL,'MALACHI','UCHE','UCHE','dmeOgmHdsAO',50000.00,'member','pending','uche.uche@ncdmb.gov.ng',NULL,'$2y$10$4NpFqJonVu8u71Hhmgc6tOao3CQDSirn.61iWhBkG9SWesKDyRry2',0,0,NULL,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(227,'A0264',NULL,'OKEZIE','KELECHI','UNAGHA','MoHfOKMPoNz',20000.00,'member','pending','okezie.unagha@ncdmb.gov.ng',NULL,'$2y$10$Nt04lTuabb4Mp2nCPil/suTWL.mlLHSkjAKNgoqo239mos.Nan71C',0,0,NULL,'2023-04-26 09:35:08','2023-04-26 09:35:08'),(228,'A0265',NULL,'ROWLAND','UKAN','IDAGBO','4bz4xRbHejr',20000.00,'member','pending','ukan.idagbo@ncdmb.gov.ng',NULL,'$2y$10$LZqfiwnIFErkV6bqQ.xa4.ylLYy4vRZw4mqGv9de/Nx4Y9LmH2lmW',0,0,NULL,'2023-04-26 09:35:08','2023-04-26 09:35:08'),(229,'A0266','42334','MAYOWA','OWOLABI','ELEWUDE','74365467822',30000.00,'member','active','mayowa.elewude@ncdmb.gov.ng',NULL,'$2y$10$rMTkw4pR70LeBXyQ4snA0ePmRxJU5ndRFdRz/686.BiTP.p8D4PAi',1,0,NULL,'2023-04-26 09:35:08','2023-05-27 11:06:53'),(230,'A0267',NULL,'ABAYOMI','JOHN','BAMIDELE','Z1fjAiRZFcv',100000.00,'member','pending','abayomi.bamidele@ncdmb.gov.ng',NULL,'$2y$10$GWCUe41eP8ixBkE.aeCN4OSbuLZQtkrOAUG08pOSof5hEhHibZH9W',0,0,NULL,'2023-04-26 09:35:08','2023-04-26 09:35:08'),(231,'B98145','43222','FirstT','Timer','Random','956949382212',50000.00,'member','active','pteam@add.com',NULL,'$2y$10$qY6BAWPSeNmNk4zTVdSzUeKIFI8bpCJ4eujEFxeSjXiV7fVrps.gG',1,0,NULL,'2023-05-27 09:18:25','2023-05-29 17:58:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variants`
--

DROP TABLE IF EXISTS `variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variants` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `feature_id` bigint unsigned NOT NULL,
  `interest_rate` bigint NOT NULL DEFAULT '0',
  `tenor` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variants_feature_id_foreign` (`feature_id`),
  CONSTRAINT `variants_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variants`
--

LOCK TABLES `variants` WRITE;
/*!40000 ALTER TABLE `variants` DISABLE KEYS */;
INSERT INTO `variants` VALUES (1,6,8,12,'2023-04-29 15:16:58','2023-04-29 15:16:58'),(2,7,12,12,'2023-04-29 15:21:05','2023-04-29 15:21:05'),(3,7,6,6,'2023-04-29 15:21:05','2023-04-29 15:21:05'),(4,8,12,3,'2023-04-29 15:39:32','2023-04-29 15:39:32'),(5,9,12,12,'2023-04-29 15:41:05','2023-04-29 15:41:05'),(6,9,6,6,'2023-04-29 15:41:05','2023-04-29 15:41:05'),(7,10,12,1,'2023-04-29 15:46:04','2023-04-29 15:46:04'),(8,6,16,24,'2023-05-17 12:45:53','2023-05-17 12:45:53');
/*!40000 ALTER TABLE `variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `savings` decimal(30,2) NOT NULL DEFAULT '0.00',
  `uncleared` decimal(30,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wallets_user_id_foreign` (`user_id`),
  CONSTRAINT `wallets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

LOCK TABLES `wallets` WRITE;
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,1,1760000.00,0.00,'2023-04-24 12:29:11','2023-05-30 15:36:31'),(2,2,1238022.31,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(3,3,2338989.07,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(4,4,6457329.36,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(5,5,5192165.44,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(6,6,745310.09,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(7,7,1051644.96,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(8,8,6657951.77,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(9,9,561987.00,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(10,10,1113845.23,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(11,11,1121957.13,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(12,12,2087080.29,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(13,13,2491605.94,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(14,14,774497.04,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(15,15,257444.47,0.00,'2023-04-26 09:32:09','2023-04-26 09:32:09'),(16,16,662879.82,0.00,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(17,17,2174459.25,0.00,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(18,18,1058353.20,0.00,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(19,19,1907883.94,0.00,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(20,20,691000.92,0.00,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(21,21,772720.95,0.00,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(22,22,808640.17,0.00,'2023-04-26 09:32:10','2023-04-26 09:32:10'),(23,23,400000.00,0.00,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(24,24,1832505.02,0.00,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(25,25,921341.40,0.00,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(26,26,2201610.28,0.00,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(27,27,402690.18,0.00,'2023-04-26 09:34:54','2023-04-26 09:34:54'),(28,28,3882280.92,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(29,29,1444396.61,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(30,30,2008213.96,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(31,31,2663498.99,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(32,32,3551850.84,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(33,33,125000.13,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(34,34,650698.93,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(35,35,1434711.42,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(36,36,875187.38,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(37,37,1727713.53,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(38,38,735520.54,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(39,39,423939.36,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(40,40,2256392.67,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(41,41,620874.02,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(42,42,967710.66,0.00,'2023-04-26 09:34:55','2023-04-26 09:34:55'),(43,43,2366721.61,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(44,44,2160574.72,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(45,45,2186721.61,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(46,46,4738481.36,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(47,47,1621138.49,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(48,48,1319286.25,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(49,49,1259085.97,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(50,50,1327775.84,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(51,51,1210475.75,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(52,52,3110759.27,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(53,53,2278652.39,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(54,54,271183.26,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(55,55,537192.33,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(56,56,1066328.67,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(57,57,377746.25,0.00,'2023-04-26 09:34:56','2023-04-26 09:34:56'),(58,58,1676792.30,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(59,59,1815803.31,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(60,60,378899.56,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(61,61,2202241.86,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(62,62,961146.32,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(63,63,682004.01,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(64,64,201314.36,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(65,65,268917.98,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(66,66,1062479.93,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(67,67,2415196.88,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(68,68,2575325.75,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(69,69,535450.88,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(70,70,2010857.91,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(71,71,782435.75,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(72,72,1221626.09,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(73,73,881370.96,0.00,'2023-04-26 09:34:57','2023-04-26 09:34:57'),(74,74,256984.56,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(75,75,2443332.09,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(76,76,684507.92,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(77,77,1172746.48,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(78,78,338069.14,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(79,79,276440.64,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(80,80,3497378.94,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(81,81,281537.08,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(82,82,1395747.44,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(83,83,998847.70,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(84,84,734508.33,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(85,85,856713.31,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(86,86,215805.75,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(87,87,1242153.60,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(88,88,2028458.73,0.00,'2023-04-26 09:34:58','2023-04-26 09:34:58'),(89,89,1534777.75,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(90,90,455284.93,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(91,91,3920002.85,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(92,92,983570.52,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(93,93,1701321.82,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(94,94,4340723.45,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(95,95,1083570.52,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(96,96,1083570.52,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(97,97,3600018.91,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(98,98,909711.56,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(99,99,945398.50,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(100,100,130192.13,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(101,101,3078990.34,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(102,102,1602830.54,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(103,103,1296534.59,0.00,'2023-04-26 09:34:59','2023-04-26 09:34:59'),(104,104,3832196.54,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(105,105,9672376.39,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(106,106,1953823.05,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(107,107,271205.90,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(108,108,5386119.63,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(109,109,2125049.05,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(110,110,1823269.13,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(111,111,1107416.62,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(112,112,741600.01,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(113,113,2298310.61,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(114,114,3070788.45,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(115,115,1934580.62,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(116,116,4400788.33,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(117,117,2886193.58,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(118,118,1658419.43,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(119,119,3223056.13,0.00,'2023-04-26 09:35:00','2023-04-26 09:35:00'),(120,120,1379319.22,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(121,121,64356.48,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(122,122,1188128.11,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(123,123,424128.29,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(124,124,1022543.47,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(125,125,7647553.99,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(126,126,386854.12,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(127,127,943427.08,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(128,128,252520.84,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(129,129,180408.82,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(130,130,931521.20,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(131,131,966521.20,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(132,132,1560567.33,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(133,133,4512290.77,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(134,134,935793.41,0.00,'2023-04-26 09:35:01','2023-04-26 09:35:01'),(135,135,1172088.55,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(136,136,732497.80,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(137,137,75325.37,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(138,138,9427867.87,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(139,139,133728.71,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(140,140,2848941.82,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(141,141,1781361.18,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(142,142,1125385.14,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(143,143,825786.48,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(144,144,1442427.21,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(145,145,854742.39,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(146,146,848184.79,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(147,147,1381324.71,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(148,148,179999.82,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(149,149,757867.21,0.00,'2023-04-26 09:35:02','2023-04-26 09:35:02'),(150,150,2322514.79,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(151,151,1888274.28,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(152,152,759608.82,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(153,153,2068747.29,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(154,154,824373.08,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(155,155,1139798.95,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(156,156,740700.57,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(157,157,874373.08,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(158,158,2952004.44,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(159,159,1648747.25,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(160,160,1314352.50,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(161,161,3283227.33,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(162,162,936348.92,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(163,163,1200844.91,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(164,164,1093769.67,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(165,165,1461979.19,0.00,'2023-04-26 09:35:03','2023-04-26 09:35:03'),(166,166,751514.32,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(167,167,1499999.97,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(168,168,138770.23,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(169,169,1119569.71,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(170,170,1430236.15,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(171,171,1216435.07,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(172,172,2033124.90,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(173,173,2015243.88,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(174,174,2068099.36,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(175,175,1067828.29,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(176,176,626984.93,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(177,177,1406557.48,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(178,178,1216024.63,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(179,179,313492.46,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(180,180,1216043.91,0.00,'2023-04-26 09:35:04','2023-04-26 09:35:04'),(181,181,313492.46,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(182,182,615794.19,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(183,183,1231588.37,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(184,184,260349.85,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(185,185,2789895.13,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(186,186,929649.92,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(187,187,1226832.69,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(188,188,1078852.33,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(189,189,5572861.72,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(190,190,1975730.90,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(191,191,1224608.39,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(192,192,322995.50,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(193,193,2458012.52,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(194,194,2428405.89,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(195,195,2223055.91,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(196,196,854995.45,0.00,'2023-04-26 09:35:05','2023-04-26 09:35:05'),(197,197,1089222.36,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(198,198,176440.99,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(199,199,705763.98,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(200,200,1146370.87,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(201,201,195290.27,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(202,202,155251.90,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(203,203,1898548.53,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(204,204,301921.33,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(205,205,934034.78,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(206,206,592689.86,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(207,207,603362.32,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(208,208,501921.33,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(209,209,140384.27,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(210,210,550000.00,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(211,211,220000.00,0.00,'2023-04-26 09:35:06','2023-04-26 09:35:06'),(212,212,160000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(213,213,3000000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(214,214,200000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(215,215,120000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(216,216,120000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(217,217,120000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(218,218,120000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(219,219,450000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(220,220,450000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(221,221,120000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(222,222,360000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(223,223,110000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(224,224,90000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(225,225,180000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(226,226,400000.00,0.00,'2023-04-26 09:35:07','2023-04-26 09:35:07'),(227,227,160000.00,0.00,'2023-04-26 09:35:08','2023-04-26 09:35:08'),(228,228,160000.00,0.00,'2023-04-26 09:35:08','2023-04-26 09:35:08'),(229,229,240000.00,0.00,'2023-04-26 09:35:08','2023-04-26 09:35:08'),(230,230,500000.00,0.00,'2023-04-26 09:35:08','2023-04-26 09:35:08');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-05  5:43:46
