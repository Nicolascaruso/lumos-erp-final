-- MySQL dump 10.13  Distrib 8.0.32, for macos11.7 (x86_64)
--
-- Host: localhost    Database: ultimate_basic
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `account_transactions`
--

DROP TABLE IF EXISTS `account_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `transaction_payment_id` int DEFAULT NULL,
  `transfer_transaction_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_transactions_account_id_index` (`account_id`),
  KEY `account_transactions_transaction_id_index` (`transaction_id`),
  KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  KEY `account_transactions_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_transactions`
--

LOCK TABLES `account_transactions` WRITE;
/*!40000 ALTER TABLE `account_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int DEFAULT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `banco` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `agencia` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conta` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titular` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `padrao` tinyint(1) NOT NULL DEFAULT '0',
  `cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `carteira` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `convenio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `juros` decimal(10,2) NOT NULL DEFAULT '0.00',
  `multa` decimal(10,2) NOT NULL DEFAULT '0.00',
  `juros_apos` int NOT NULL DEFAULT '0',
  `tipo` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `banks_business_id_foreign` (`business_id`),
  KEY `banks_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `banks_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `banks_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcodes`
--

DROP TABLE IF EXISTS `barcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int DEFAULT NULL,
  `business_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barcodes_business_id_foreign` (`business_id`),
  CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcodes`
--

LOCK TABLES `barcodes` WRITE;
/*!40000 ALTER TABLE `barcodes` DISABLE KEYS */;
INSERT INTO `barcodes` VALUES (1,'20 Labels per Sheet - (8.5\" x 11\")','Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 4\" x 1\"\\r\\nLabels per sheet: 20',3.7500,1.0000,8.5000,11.0000,0.5000,0.5000,0.0000,0.1562,2,0,0,20,NULL,'2017-12-18 08:13:44','2017-12-18 08:13:44'),(2,'30 Labels per sheet - (8.5\" x 11\")','Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2.625\" x 1\"\\r\\nLabels per sheet: 30',2.6250,1.0000,8.5000,11.0000,0.5000,0.2198,0.0000,0.1400,3,0,0,30,NULL,'2017-12-18 08:04:39','2017-12-18 08:10:40'),(3,'32 Labels per sheet - (8.5\" x 11\")','Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1.25\"\\r\\nLabels per sheet: 32',2.0000,1.2500,8.5000,11.0000,0.5000,0.2500,0.0000,0.0000,4,0,0,32,NULL,'2017-12-18 07:55:40','2017-12-18 07:55:40'),(4,'40 Labels per sheet - (8.5\" x 11\")','Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 2\" x 1\"\\r\\nLabels per sheet: 40',2.0000,1.0000,8.5000,11.0000,0.5000,0.2500,0.0000,0.0000,4,0,0,40,NULL,'2017-12-18 07:58:40','2017-12-18 07:58:40'),(5,'50 Labels per Sheet - (8.5\" x 11\")','Sheet Size: 8.5\" x 11\"\\r\\nLabel Size: 1.5\" x 1\"\\r\\nLabels per sheet: 50',1.5000,1.0000,8.5000,11.0000,0.5000,0.5000,0.0000,0.0000,5,0,0,50,NULL,'2017-12-18 07:51:10','2017-12-18 07:51:10'),(6,'Continuous Rolls - 31.75mm x 25.4mm','Label Size: 31.75mm x 25.4mm\\r\\nGap: 3.18mm',1.2500,1.0000,1.2500,0.0000,0.1250,0.0000,0.1250,0.0000,1,0,1,NULL,NULL,'2017-12-18 07:51:10','2017-12-18 07:51:10');
/*!40000 ALTER TABLE `barcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boletos`
--

DROP TABLE IF EXISTS `boletos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boletos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bank_id` int unsigned NOT NULL,
  `revenue_id` int unsigned NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_documento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carteira` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `convenio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linha_digitavel` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_arquivo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `juros` decimal(10,2) NOT NULL,
  `multa` decimal(10,2) NOT NULL,
  `juros_apos` int NOT NULL,
  `instrucoes` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` tinyint(1) NOT NULL DEFAULT '0',
  `posto` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `codigo_cliente` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boletos_bank_id_foreign` (`bank_id`),
  KEY `boletos_revenue_id_foreign` (`revenue_id`),
  CONSTRAINT `boletos_bank_id_foreign` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `boletos_revenue_id_foreign` FOREIGN KEY (`revenue_id`) REFERENCES `revenues` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletos`
--

LOCK TABLES `boletos` WRITE;
/*!40000 ALTER TABLE `boletos` DISABLE KEYS */;
/*!40000 ALTER TABLE `boletos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int unsigned NOT NULL,
  `waiter_id` int unsigned DEFAULT NULL,
  `table_id` int unsigned DEFAULT NULL,
  `correspondent_id` int DEFAULT NULL,
  `business_id` int unsigned NOT NULL,
  `location_id` int unsigned NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int unsigned NOT NULL,
  `booking_status` enum('booked','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_contact_id_foreign` (`contact_id`),
  KEY `bookings_business_id_foreign` (`business_id`),
  KEY `bookings_created_by_foreign` (`created_by`),
  KEY `bookings_table_id_index` (`table_id`),
  KEY `bookings_waiter_id_index` (`waiter_id`),
  KEY `bookings_location_id_index` (`location_id`),
  CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brands_business_id_foreign` (`business_id`),
  KEY `brands_created_by_foreign` (`created_by`),
  CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int unsigned DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int unsigned NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'America/Sao_Paulo',
  `fy_start_month` tinyint NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int unsigned DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int unsigned NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int unsigned NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `custom_labels` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `razao_social` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `cnpj` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00.000.000/0000-00',
  `ie` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00000000000',
  `senha_certificado` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1234',
  `certificado` blob NOT NULL,
  `cidade_id` int unsigned DEFAULT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00000-000',
  `telefone` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000-0000',
  `ultimo_numero_nfe` int NOT NULL DEFAULT '0',
  `ultimo_numero_nfce` int NOT NULL DEFAULT '0',
  `ultimo_numero_cte` int NOT NULL DEFAULT '0',
  `ultimo_numero_mdfe` int NOT NULL DEFAULT '0',
  `inscricao_municipal` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `numero_serie_nfe` int NOT NULL DEFAULT '1',
  `numero_serie_nfce` int NOT NULL DEFAULT '1',
  `numero_serie_cte` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `numero_serie_mdfe` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `ambiente` int NOT NULL DEFAULT '2',
  `regime` int NOT NULL DEFAULT '1',
  `cst_csosn_padrao` int NOT NULL DEFAULT '101',
  `cst_cofins_padrao` int NOT NULL DEFAULT '49',
  `cst_pis_padrao` int NOT NULL DEFAULT '49',
  `cst_ipi_padrao` int NOT NULL DEFAULT '99',
  `perc_icms_padrao` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_pis_padrao` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_cofins_padrao` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_ipi_padrao` decimal(5,2) NOT NULL DEFAULT '0.00',
  `pCredSN` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ncm_padrao` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfop_saida_estadual_padrao` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfop_saida_inter_estadual_padrao` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `csc` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `csc_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `aut_xml` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `certificado_urn` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `casas_decimais_valor` int NOT NULL DEFAULT '2',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_owner_id_foreign` (`owner_id`),
  KEY `business_currency_id_foreign` (`currency_id`),
  KEY `business_cidade_id_foreign` (`cidade_id`),
  KEY `business_default_sales_tax_foreign` (`default_sales_tax`),
  CONSTRAINT `business_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_locations`
--

DROP TABLE IF EXISTS `business_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `business_locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int unsigned NOT NULL,
  `invoice_layout_id` int unsigned NOT NULL,
  `selling_price_group_id` int DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `razao_social` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `cnpj` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00.000.000/0000-00',
  `ie` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00000000000',
  `senha_certificado` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1234',
  `certificado` blob NOT NULL,
  `cidade_id` int unsigned DEFAULT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*',
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00000-000',
  `telefone` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00 00000-0000',
  `ultimo_numero_nfe` int NOT NULL DEFAULT '0',
  `ultimo_numero_nfce` int NOT NULL DEFAULT '0',
  `ultimo_numero_cte` int NOT NULL DEFAULT '0',
  `ultimo_numero_mdfe` int NOT NULL DEFAULT '0',
  `inscricao_municipal` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `numero_serie_nfe` int NOT NULL DEFAULT '1',
  `numero_serie_nfce` int NOT NULL DEFAULT '1',
  `numero_serie_cte` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `numero_serie_mdfe` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `ambiente` int NOT NULL DEFAULT '2',
  `regime` int NOT NULL DEFAULT '1',
  `cst_csosn_padrao` int NOT NULL DEFAULT '101',
  `cst_cofins_padrao` int NOT NULL DEFAULT '49',
  `cst_pis_padrao` int NOT NULL DEFAULT '49',
  `cst_ipi_padrao` int NOT NULL DEFAULT '99',
  `perc_icms_padrao` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_pis_padrao` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_cofins_padrao` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_ipi_padrao` decimal(5,2) NOT NULL DEFAULT '0.00',
  `ncm_padrao` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfop_saida_estadual_padrao` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfop_saida_inter_estadual_padrao` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `csc` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `aut_xml` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `csc_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `info_complementar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `business_locations_cidade_id_foreign` (`cidade_id`),
  KEY `business_locations_business_id_index` (`business_id`),
  KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_locations_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_locations`
--

LOCK TABLES `business_locations` WRITE;
/*!40000 ALTER TABLE `business_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_te_descargas`
--

DROP TABLE IF EXISTS `c_te_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `c_te_descargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seg_cod_barras` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `c_te_descargas_info_id_foreign` (`info_id`),
  CONSTRAINT `c_te_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_te_descargas`
--

LOCK TABLES `c_te_descargas` WRITE;
/*!40000 ALTER TABLE `c_te_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_te_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrossel_ecommerces`
--

DROP TABLE IF EXISTS `carrossel_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrossel_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `titulo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_acao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome_botao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor_fundo` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carrossel_ecommerces_business_id_foreign` (`business_id`),
  CONSTRAINT `carrossel_ecommerces_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrossel_ecommerces`
--

LOCK TABLES `carrossel_ecommerces` WRITE;
/*!40000 ALTER TABLE `carrossel_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrossel_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_register_transactions`
--

DROP TABLE IF EXISTS `cash_register_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_register_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cash_register_id` int unsigned NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` enum('cash','card','debit','cheque','bank_transfer','other','boleto','pix') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_register_transactions`
--

LOCK TABLES `cash_register_transactions` WRITE;
/*!40000 ALTER TABLE `cash_register_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_register_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_registers`
--

DROP TABLE IF EXISTS `cash_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_registers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `location_id` int DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int NOT NULL DEFAULT '0',
  `total_cheques` int NOT NULL DEFAULT '0',
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cash_registers_business_id_foreign` (`business_id`),
  KEY `cash_registers_user_id_foreign` (`user_id`),
  KEY `cash_registers_location_id_index` (`location_id`),
  CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_registers`
--

LOCK TABLES `cash_registers` WRITE;
/*!40000 ALTER TABLE `cash_registers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_registers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria_conta_financeiras`
--

DROP TABLE IF EXISTS `categoria_conta_financeiras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria_conta_financeiras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_conta_financeiras`
--

LOCK TABLES `categoria_conta_financeiras` WRITE;
/*!40000 ALTER TABLE `categoria_conta_financeiras` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria_conta_financeiras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int unsigned NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL,
  `created_by` int unsigned NOT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ecommerce` tinyint(1) NOT NULL,
  `destaque` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_business_id_foreign` (`business_id`),
  KEY `categories_created_by_foreign` (`created_by`),
  CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorizables`
--

DROP TABLE IF EXISTS `categorizables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorizables` (
  `category_id` int NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint unsigned NOT NULL,
  KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorizables`
--

LOCK TABLES `categorizables` WRITE;
/*!40000 ALTER TABLE `categorizables` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorizables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cidade_frete_gratis`
--

DROP TABLE IF EXISTS `cidade_frete_gratis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidade_frete_gratis` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cidade_frete_gratis_business_id_foreign` (`business_id`),
  CONSTRAINT `cidade_frete_gratis_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cidade_frete_gratis`
--

LOCK TABLES `cidade_frete_gratis` WRITE;
/*!40000 ALTER TABLE `cidade_frete_gratis` DISABLE KEYS */;
/*!40000 ALTER TABLE `cidade_frete_gratis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciots`
--

DROP TABLE IF EXISTS `ciots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ciots_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `ciots_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciots`
--

LOCK TABLES `ciots` WRITE;
/*!40000 ALTER TABLE `ciots` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5571 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'1100015','Alta Floresta D\'Oeste','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(2,'1100023','Ariquemes','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(3,'1100031','Cabixi','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(4,'1100049','Cacoal','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(5,'1100056','Cerejeiras','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(6,'1100064','Colorado do Oeste','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(7,'1100072','Corumbiara','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(8,'1100080','Costa Marques','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(9,'1100098','Espigao D\'Oeste','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(10,'1100106','Guajara-Mirim','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(11,'1100114','Jaru','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(12,'1100122','Ji-Parana','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(13,'1100130','Machadinho D\'Oeste','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(14,'1100148','Nova Brasilândia D\'Oeste','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(15,'1100155','Ouro Preto do Oeste','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(16,'1100189','Pimenta Bueno','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(17,'1100205','Porto Velho','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(18,'1100254','Presidente Medici','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(19,'1100262','Rio Crespo','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(20,'1100288','Rolim de Moura','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(21,'1100296','Santa Luzia D\'Oeste','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(22,'1100304','Vilhena','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(23,'1100320','Sao Miguel do Guapore','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(24,'1100338','Nova Mamore','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(25,'1100346','Alvorada D\'Oeste','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(26,'1100379','Alto Alegre dos Parecis','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(27,'1100403','Alto Paraiso','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(28,'1100452','Buritis','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(29,'1100502','Novo Horizonte do Oeste','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(30,'1100601','Cacaulândia','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(31,'1100700','Campo Novo de Rondônia','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(32,'1100809','Candeias do Jamari','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(33,'1100908','Castanheiras','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(34,'1100924','Chupinguaia','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(35,'1100940','Cujubim','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(36,'1101005','Governador Jorge Teixeira','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(37,'1101104','Itapua do Oeste','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(38,'1101203','Ministro Andreazza','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(39,'1101302','Mirante da Serra','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(40,'1101401','Monte Negro','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(41,'1101435','Nova Uniao','RO','2024-07-03 11:37:04','2024-07-03 11:37:04'),(42,'1101450','Parecis','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(43,'1101468','Pimenteiras do Oeste','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(44,'1101476','Primavera de Rondônia','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(45,'1101484','Sao Felipe D\'Oeste','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(46,'1101492','Sao Francisco do Guapore','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(47,'1101500','Seringueiras','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(48,'1101559','Teixeiropolis','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(49,'1101609','Theobroma','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(50,'1101708','Urupa','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(51,'1101757','Vale do Anari','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(52,'1101807','Vale do Paraiso','RO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(53,'1200013','Acrelândia','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(54,'1200054','Assis Brasil','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(55,'1200104','Brasileia','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(56,'1200138','Bujari','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(57,'1200179','Capixaba','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(58,'1200203','Cruzeiro do Sul','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(59,'1200252','Epitaciolândia','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(60,'1200302','Feijo','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(61,'1200328','Jordao','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(62,'1200336','Mâncio Lima','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(63,'1200344','Manoel Urbano','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(64,'1200351','Marechal Thaumaturgo','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(65,'1200385','Placido de Castro','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(66,'1200393','Porto Walter','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(67,'1200401','Rio Branco','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(68,'1200427','Rodrigues Alves','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(69,'1200435','Santa Rosa do Purus','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(70,'1200450','Senador Guiomard','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(71,'1200500','Sena Madureira','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(72,'1200609','Tarauaca','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(73,'1200708','Xapuri','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(74,'1200807','Porto Acre','AC','2024-07-03 11:37:05','2024-07-03 11:37:05'),(75,'1300029','Alvaraes','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(76,'1300060','Amatura','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(77,'1300086','Anama','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(78,'1300102','Anori','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(79,'1300144','Apui','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(80,'1300201','Atalaia do Norte','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(81,'1300300','Autazes','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(82,'1300409','Barcelos','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(83,'1300508','Barreirinha','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(84,'1300607','Benjamin Constant','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(85,'1300631','Beruri','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(86,'1300680','Boa Vista do Ramos','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(87,'1300706','Boca do Acre','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(88,'1300805','Borba','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(89,'1300839','Caapiranga','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(90,'1300904','Canutama','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(91,'1301001','Carauari','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(92,'1301100','Careiro','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(93,'1301159','Careiro da Varzea','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(94,'1301209','Coari','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(95,'1301308','Codajas','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(96,'1301407','Eirunepe','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(97,'1301506','Envira','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(98,'1301605','Fonte Boa','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(99,'1301654','Guajara','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(100,'1301704','Humaita','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(101,'1301803','Ipixuna','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(102,'1301852','Iranduba','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(103,'1301902','Itacoatiara','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(104,'1301951','Itamarati','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(105,'1302009','Itapiranga','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(106,'1302108','Japura','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(107,'1302207','Jurua','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(108,'1302306','Jutai','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(109,'1302405','Labrea','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(110,'1302504','Manacapuru','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(111,'1302553','Manaquiri','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(112,'1302603','Manaus','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(113,'1302702','Manicore','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(114,'1302801','Maraa','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(115,'1302900','Maues','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(116,'1303007','Nhamunda','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(117,'1303106','Nova Olinda do Norte','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(118,'1303205','Novo Airao','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(119,'1303304','Novo Aripuana','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(120,'1303403','Parintins','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(121,'1303502','Pauini','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(122,'1303536','Presidente Figueiredo','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(123,'1303569','Rio Preto da Eva','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(124,'1303601','Santa Isabel do Rio Negro','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(125,'1303700','Santo Antônio do Iça','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(126,'1303809','Sao Gabriel da Cachoeira','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(127,'1303908','Sao Paulo de Olivença','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(128,'1303957','Sao Sebastiao do Uatuma','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(129,'1304005','Silves','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(130,'1304062','Tabatinga','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(131,'1304104','Tapaua','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(132,'1304203','Tefe','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(133,'1304237','Tonantins','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(134,'1304260','Uarini','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(135,'1304302','Urucara','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(136,'1304401','Urucurituba','AM','2024-07-03 11:37:05','2024-07-03 11:37:05'),(137,'1400027','Amajari','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(138,'1400050','Alto Alegre','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(139,'1400100','Boa Vista','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(140,'1400159','Bonfim','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(141,'1400175','Canta','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(142,'1400209','Caracarai','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(143,'1400233','Caroebe','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(144,'1400282','Iracema','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(145,'1400308','Mucajai','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(146,'1400407','Normandia','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(147,'1400456','Pacaraima','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(148,'1400472','Rorainopolis','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(149,'1400506','Sao Joao da Baliza','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(150,'1400605','Sao Luiz','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(151,'1400704','Uiramuta','RR','2024-07-03 11:37:05','2024-07-03 11:37:05'),(152,'1500107','Abaetetuba','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(153,'1500131','Abel Figueiredo','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(154,'1500206','Acara','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(155,'1500305','Afua','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(156,'1500347','agua Azul do Norte','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(157,'1500404','Alenquer','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(158,'1500503','Almeirim','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(159,'1500602','Altamira','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(160,'1500701','Anajas','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(161,'1500800','Ananindeua','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(162,'1500859','Anapu','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(163,'1500909','Augusto Corrêa','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(164,'1500958','Aurora do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(165,'1501006','Aveiro','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(166,'1501105','Bagre','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(167,'1501204','Baiao','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(168,'1501253','Bannach','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(169,'1501303','Barcarena','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(170,'1501402','Belem','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(171,'1501451','Belterra','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(172,'1501501','Benevides','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(173,'1501576','Bom Jesus do Tocantins','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(174,'1501600','Bonito','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(175,'1501709','Bragança','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(176,'1501725','Brasil Novo','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(177,'1501758','Brejo Grande do Araguaia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(178,'1501782','Breu Branco','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(179,'1501808','Breves','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(180,'1501907','Bujaru','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(181,'1501956','Cachoeira do Piria','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(182,'1502004','Cachoeira do Arari','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(183,'1502103','Cameta','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(184,'1502152','Canaa dos Carajas','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(185,'1502202','Capanema','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(186,'1502301','Capitao Poço','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(187,'1502400','Castanhal','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(188,'1502509','Chaves','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(189,'1502608','Colares','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(190,'1502707','Conceiçao do Araguaia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(191,'1502756','Concordia do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(192,'1502764','Cumaru do Norte','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(193,'1502772','Curionopolis','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(194,'1502806','Curralinho','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(195,'1502855','Curua','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(196,'1502905','Curuça','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(197,'1502939','Dom Eliseu','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(198,'1502954','Eldorado dos Carajas','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(199,'1503002','Faro','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(200,'1503044','Floresta do Araguaia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(201,'1503077','Garrafao do Norte','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(202,'1503093','Goianesia do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(203,'1503101','Gurupa','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(204,'1503200','Igarape-Açu','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(205,'1503309','Igarape-Miri','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(206,'1503408','Inhangapi','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(207,'1503457','Ipixuna do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(208,'1503507','Irituia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(209,'1503606','Itaituba','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(210,'1503705','Itupiranga','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(211,'1503754','Jacareacanga','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(212,'1503804','Jacunda','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(213,'1503903','Juruti','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(214,'1504000','Limoeiro do Ajuru','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(215,'1504059','Mae do Rio','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(216,'1504109','Magalhaes Barata','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(217,'1504208','Maraba','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(218,'1504307','Maracana','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(219,'1504406','Marapanim','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(220,'1504422','Marituba','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(221,'1504455','Medicilândia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(222,'1504505','Melgaço','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(223,'1504604','Mocajuba','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(224,'1504703','Moju','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(225,'1504752','Mojui dos Campos','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(226,'1504802','Monte Alegre','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(227,'1504901','Muana','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(228,'1504950','Nova Esperança do Piria','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(229,'1504976','Nova Ipixuna','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(230,'1505007','Nova Timboteua','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(231,'1505031','Novo Progresso','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(232,'1505064','Novo Repartimento','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(233,'1505106','obidos','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(234,'1505205','Oeiras do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(235,'1505304','Oriximina','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(236,'1505403','Ourem','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(237,'1505437','Ourilândia do Norte','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(238,'1505486','Pacaja','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(239,'1505494','Palestina do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(240,'1505502','Paragominas','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(241,'1505536','Parauapebas','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(242,'1505551','Pau D\'Arco','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(243,'1505601','Peixe-Boi','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(244,'1505635','Piçarra','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(245,'1505650','Placas','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(246,'1505700','Ponta de Pedras','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(247,'1505809','Portel','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(248,'1505908','Porto de Moz','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(249,'1506005','Prainha','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(250,'1506104','Primavera','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(251,'1506112','Quatipuru','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(252,'1506138','Redençao','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(253,'1506161','Rio Maria','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(254,'1506187','Rondon do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(255,'1506195','Ruropolis','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(256,'1506203','Salinopolis','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(257,'1506302','Salvaterra','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(258,'1506351','Santa Barbara do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(259,'1506401','Santa Cruz do Arari','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(260,'1506500','Santa Isabel do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(261,'1506559','Santa Luzia do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(262,'1506583','Santa Maria das Barreiras','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(263,'1506609','Santa Maria do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(264,'1506708','Santana do Araguaia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(265,'1506807','Santarem','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(266,'1506906','Santarem Novo','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(267,'1507003','Santo Antônio do Taua','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(268,'1507102','Sao Caetano de Odivelas','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(269,'1507151','Sao Domingos do Araguaia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(270,'1507201','Sao Domingos do Capim','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(271,'1507300','Sao Felix do Xingu','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(272,'1507409','Sao Francisco do Para','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(273,'1507458','Sao Geraldo do Araguaia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(274,'1507466','Sao Joao da Ponta','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(275,'1507474','Sao Joao de Pirabas','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(276,'1507508','Sao Joao do Araguaia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(277,'1507607','Sao Miguel do Guama','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(278,'1507706','Sao Sebastiao da Boa Vista','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(279,'1507755','Sapucaia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(280,'1507805','Senador Jose Porfirio','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(281,'1507904','Soure','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(282,'1507953','Tailândia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(283,'1507961','Terra Alta','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(284,'1507979','Terra Santa','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(285,'1508001','Tome-Açu','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(286,'1508035','Tracuateua','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(287,'1508050','Trairao','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(288,'1508084','Tucuma','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(289,'1508100','Tucurui','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(290,'1508126','Ulianopolis','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(291,'1508159','Uruara','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(292,'1508209','Vigia','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(293,'1508308','Viseu','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(294,'1508357','Vitoria do Xingu','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(295,'1508407','Xinguara','PA','2024-07-03 11:37:05','2024-07-03 11:37:05'),(296,'1600055','Serra do Navio','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(297,'1600105','Amapa','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(298,'1600154','Pedra Branca do Amapari','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(299,'1600204','Calçoene','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(300,'1600212','Cutias','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(301,'1600238','Ferreira Gomes','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(302,'1600253','Itaubal','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(303,'1600279','Laranjal do Jari','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(304,'1600303','Macapa','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(305,'1600402','Mazagao','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(306,'1600501','Oiapoque','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(307,'1600535','Porto Grande','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(308,'1600550','Pracuúba','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(309,'1600600','Santana','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(310,'1600709','Tartarugalzinho','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(311,'1600808','Vitoria do Jari','AP','2024-07-03 11:37:05','2024-07-03 11:37:05'),(312,'1700251','Abreulândia','TO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(313,'1700301','Aguiarnopolis','TO','2024-07-03 11:37:05','2024-07-03 11:37:05'),(314,'1700350','Aliança do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(315,'1700400','Almas','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(316,'1700707','Alvorada','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(317,'1701002','Ananas','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(318,'1701051','Angico','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(319,'1701101','Aparecida do Rio Negro','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(320,'1701309','Aragominas','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(321,'1701903','Araguacema','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(322,'1702000','Araguaçu','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(323,'1702109','Araguaina','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(324,'1702158','Araguana','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(325,'1702208','Araguatins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(326,'1702307','Arapoema','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(327,'1702406','Arraias','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(328,'1702554','Augustinopolis','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(329,'1702703','Aurora do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(330,'1702901','Axixa do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(331,'1703008','Babaçulândia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(332,'1703057','Bandeirantes do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(333,'1703073','Barra do Ouro','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(334,'1703107','Barrolândia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(335,'1703206','Bernardo Sayao','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(336,'1703305','Bom Jesus do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(337,'1703602','Brasilândia do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(338,'1703701','Brejinho de Nazare','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(339,'1703800','Buriti do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(340,'1703826','Cachoeirinha','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(341,'1703842','Campos Lindos','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(342,'1703867','Cariri do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(343,'1703883','Carmolândia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(344,'1703891','Carrasco Bonito','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(345,'1703909','Caseara','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(346,'1704105','Centenario','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(347,'1704600','Chapada de Areia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(348,'1705102','Chapada da Natividade','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(349,'1705508','Colinas do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(350,'1705557','Combinado','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(351,'1705607','Conceiçao do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(352,'1706001','Couto Magalhaes','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(353,'1706100','Cristalândia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(354,'1706258','Crixas do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(355,'1706506','Darcinopolis','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(356,'1707009','Dianopolis','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(357,'1707108','Divinopolis do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(358,'1707207','Dois Irmaos do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(359,'1707306','Duere','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(360,'1707405','Esperantina','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(361,'1707553','Fatima','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(362,'1707652','Figueiropolis','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(363,'1707702','Filadelfia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(364,'1708205','Formoso do Araguaia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(365,'1708254','Fortaleza do Tabocao','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(366,'1708304','Goianorte','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(367,'1709005','Goiatins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(368,'1709302','Guarai','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(369,'1709500','Gurupi','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(370,'1709807','Ipueiras','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(371,'1710508','Itacaja','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(372,'1710706','Itaguatins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(373,'1710904','Itapiratins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(374,'1711100','Itapora do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(375,'1711506','Jaú do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(376,'1711803','Juarina','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(377,'1711902','Lagoa da Confusao','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(378,'1711951','Lagoa do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(379,'1712009','Lajeado','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(380,'1712157','Lavandeira','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(381,'1712405','Lizarda','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(382,'1712454','Luzinopolis','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(383,'1712504','Marianopolis do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(384,'1712702','Mateiros','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(385,'1712801','Maurilândia do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(386,'1713205','Miracema do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(387,'1713304','Miranorte','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(388,'1713601','Monte do Carmo','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(389,'1713700','Monte Santo do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(390,'1713809','Palmeiras do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(391,'1713957','Muricilândia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(392,'1714203','Natividade','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(393,'1714302','Nazare','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(394,'1714880','Nova Olinda','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(395,'1715002','Nova Rosalândia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(396,'1715101','Novo Acordo','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(397,'1715150','Novo Alegre','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(398,'1715259','Novo Jardim','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(399,'1715507','Oliveira de Fatima','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(400,'1715705','Palmeirante','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(401,'1715754','Palmeiropolis','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(402,'1716109','Paraiso do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(403,'1716208','Parana','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(404,'1716307','Pau D\'Arco','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(405,'1716505','Pedro Afonso','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(406,'1716604','Peixe','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(407,'1716653','Pequizeiro','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(408,'1716703','Colmeia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(409,'1717008','Pindorama do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(410,'1717206','Piraquê','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(411,'1717503','Pium','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(412,'1717800','Ponte Alta do Bom Jesus','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(413,'1717909','Ponte Alta do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(414,'1718006','Porto Alegre do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(415,'1718204','Porto Nacional','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(416,'1718303','Praia Norte','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(417,'1718402','Presidente Kennedy','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(418,'1718451','Pugmil','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(419,'1718501','Recursolândia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(420,'1718550','Riachinho','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(421,'1718659','Rio da Conceiçao','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(422,'1718709','Rio dos Bois','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(423,'1718758','Rio Sono','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(424,'1718808','Sampaio','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(425,'1718840','Sandolândia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(426,'1718865','Santa Fe do Araguaia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(427,'1718881','Santa Maria do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(428,'1718899','Santa Rita do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(429,'1718907','Santa Rosa do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(430,'1719004','Santa Tereza do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(431,'1720002','Santa Terezinha do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(432,'1720101','Sao Bento do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(433,'1720150','Sao Felix do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(434,'1720200','Sao Miguel do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(435,'1720259','Sao Salvador do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(436,'1720309','Sao Sebastiao do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(437,'1720499','Sao Valerio','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(438,'1720655','Silvanopolis','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(439,'1720804','Sitio Novo do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(440,'1720853','Sucupira','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(441,'1720903','Taguatinga','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(442,'1720937','Taipas do Tocantins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(443,'1720978','Talisma','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(444,'1721000','Palmas','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(445,'1721109','Tocantinia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(446,'1721208','Tocantinopolis','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(447,'1721257','Tupirama','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(448,'1721307','Tupiratins','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(449,'1722081','Wanderlândia','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(450,'1722107','Xambioa','TO','2024-07-03 11:37:06','2024-07-03 11:37:06'),(451,'2100055','Açailândia','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(452,'2100105','Afonso Cunha','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(453,'2100154','agua Doce do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(454,'2100204','Alcântara','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(455,'2100303','Aldeias Altas','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(456,'2100402','Altamira do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(457,'2100436','Alto Alegre do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(458,'2100477','Alto Alegre do Pindare','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(459,'2100501','Alto Parnaiba','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(460,'2100550','Amapa do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(461,'2100600','Amarante do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(462,'2100709','Anajatuba','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(463,'2100808','Anapurus','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(464,'2100832','Apicum-Açu','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(465,'2100873','Araguana','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(466,'2100907','Araioses','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(467,'2100956','Arame','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(468,'2101004','Arari','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(469,'2101103','Axixa','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(470,'2101202','Bacabal','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(471,'2101251','Bacabeira','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(472,'2101301','Bacuri','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(473,'2101350','Bacurituba','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(474,'2101400','Balsas','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(475,'2101509','Barao de Grajaú','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(476,'2101608','Barra do Corda','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(477,'2101707','Barreirinhas','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(478,'2101731','Belagua','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(479,'2101772','Bela Vista do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(480,'2101806','Benedito Leite','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(481,'2101905','Bequimao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(482,'2101939','Bernardo do Mearim','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(483,'2101970','Boa Vista do Gurupi','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(484,'2102002','Bom Jardim','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(485,'2102036','Bom Jesus das Selvas','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(486,'2102077','Bom Lugar','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(487,'2102101','Brejo','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(488,'2102150','Brejo de Areia','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(489,'2102200','Buriti','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(490,'2102309','Buriti Bravo','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(491,'2102325','Buriticupu','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(492,'2102358','Buritirana','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(493,'2102374','Cachoeira Grande','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(494,'2102408','Cajapio','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(495,'2102507','Cajari','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(496,'2102556','Campestre do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(497,'2102606','Cândido Mendes','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(498,'2102705','Cantanhede','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(499,'2102754','Capinzal do Norte','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(500,'2102804','Carolina','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(501,'2102903','Carutapera','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(502,'2103000','Caxias','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(503,'2103109','Cedral','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(504,'2103125','Central do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(505,'2103158','Centro do Guilherme','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(506,'2103174','Centro Novo do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(507,'2103208','Chapadinha','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(508,'2103257','Cidelândia','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(509,'2103307','Codo','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(510,'2103406','Coelho Neto','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(511,'2103505','Colinas','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(512,'2103554','Conceiçao do Lago-Açu','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(513,'2103604','Coroata','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(514,'2103703','Cururupu','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(515,'2103752','Davinopolis','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(516,'2103802','Dom Pedro','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(517,'2103901','Duque Bacelar','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(518,'2104008','Esperantinopolis','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(519,'2104057','Estreito','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(520,'2104073','Feira Nova do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(521,'2104081','Fernando Falcao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(522,'2104099','Formosa da Serra Negra','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(523,'2104107','Fortaleza dos Nogueiras','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(524,'2104206','Fortuna','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(525,'2104305','Godofredo Viana','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(526,'2104404','Gonçalves Dias','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(527,'2104503','Governador Archer','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(528,'2104552','Governador Edison Lobao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(529,'2104602','Governador Eugênio Barros','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(530,'2104628','Governador Luiz Rocha','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(531,'2104651','Governador Newton Bello','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(532,'2104677','Governador Nunes Freire','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(533,'2104701','Graça Aranha','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(534,'2104800','Grajaú','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(535,'2104909','Guimaraes','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(536,'2105005','Humberto de Campos','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(537,'2105104','Icatu','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(538,'2105153','Igarape do Meio','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(539,'2105203','Igarape Grande','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(540,'2105302','Imperatriz','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(541,'2105351','Itaipava do Grajaú','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(542,'2105401','Itapecuru Mirim','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(543,'2105427','Itinga do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(544,'2105450','Jatoba','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(545,'2105476','Jenipapo dos Vieiras','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(546,'2105500','Joao Lisboa','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(547,'2105609','Joselândia','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(548,'2105658','Junco do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(549,'2105708','Lago da Pedra','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(550,'2105807','Lago do Junco','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(551,'2105906','Lago Verde','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(552,'2105922','Lagoa do Mato','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(553,'2105948','Lago dos Rodrigues','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(554,'2105963','Lagoa Grande do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(555,'2105989','Lajeado Novo','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(556,'2106003','Lima Campos','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(557,'2106102','Loreto','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(558,'2106201','Luis Domingues','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(559,'2106300','Magalhaes de Almeida','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(560,'2106326','Maracaçume','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(561,'2106359','Maraja do Sena','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(562,'2106375','Maranhaozinho','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(563,'2106409','Mata Roma','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(564,'2106508','Matinha','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(565,'2106607','Matões','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(566,'2106631','Matões do Norte','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(567,'2106672','Milagres do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(568,'2106706','Mirador','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(569,'2106755','Miranda do Norte','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(570,'2106805','Mirinzal','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(571,'2106904','Monçao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(572,'2107001','Montes Altos','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(573,'2107100','Morros','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(574,'2107209','Nina Rodrigues','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(575,'2107258','Nova Colinas','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(576,'2107308','Nova Iorque','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(577,'2107357','Nova Olinda do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(578,'2107407','Olho D\'agua das Cunhas','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(579,'2107456','Olinda Nova do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(580,'2107506','Paço do Lumiar','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(581,'2107605','Palmeirândia','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(582,'2107704','Paraibano','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(583,'2107803','Parnarama','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(584,'2107902','Passagem Franca','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(585,'2108009','Pastos Bons','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(586,'2108058','Paulino Neves','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(587,'2108108','Paulo Ramos','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(588,'2108207','Pedreiras','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(589,'2108256','Pedro do Rosario','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(590,'2108306','Penalva','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(591,'2108405','Peri Mirim','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(592,'2108454','Peritoro','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(593,'2108504','Pindare-Mirim','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(594,'2108603','Pinheiro','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(595,'2108702','Pio XII','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(596,'2108801','Pirapemas','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(597,'2108900','Poçao de Pedras','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(598,'2109007','Porto Franco','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(599,'2109056','Porto Rico do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(600,'2109106','Presidente Dutra','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(601,'2109205','Presidente Juscelino','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(602,'2109239','Presidente Medici','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(603,'2109270','Presidente Sarney','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(604,'2109304','Presidente Vargas','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(605,'2109403','Primeira Cruz','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(606,'2109452','Raposa','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(607,'2109502','Riachao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(608,'2109551','Ribamar Fiquene','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(609,'2109601','Rosario','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(610,'2109700','Sambaiba','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(611,'2109759','Santa Filomena do Maranhao','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(612,'2109809','Santa Helena','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(613,'2109908','Santa Inês','MA','2024-07-03 11:37:06','2024-07-03 11:37:06'),(614,'2110005','Santa Luzia','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(615,'2110039','Santa Luzia do Parua','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(616,'2110104','Santa Quiteria do Maranhao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(617,'2110203','Santa Rita','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(618,'2110237','Santana do Maranhao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(619,'2110278','Santo Amaro do Maranhao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(620,'2110302','Santo Antônio dos Lopes','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(621,'2110401','Sao Benedito do Rio Preto','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(622,'2110500','Sao Bento','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(623,'2110609','Sao Bernardo','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(624,'2110658','Sao Domingos do Azeitao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(625,'2110708','Sao Domingos do Maranhao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(626,'2110807','Sao Felix de Balsas','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(627,'2110856','Sao Francisco do Brejao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(628,'2110906','Sao Francisco do Maranhao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(629,'2111003','Sao Joao Batista','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(630,'2111029','Sao Joao do Carú','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(631,'2111052','Sao Joao do Paraiso','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(632,'2111078','Sao Joao do Soter','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(633,'2111102','Sao Joao dos Patos','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(634,'2111201','Sao Jose de Ribamar','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(635,'2111250','Sao Jose dos Basilios','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(636,'2111300','Sao Luis','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(637,'2111409','Sao Luis Gonzaga do Maranhao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(638,'2111508','Sao Mateus do Maranhao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(639,'2111532','Sao Pedro da agua Branca','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(640,'2111573','Sao Pedro dos Crentes','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(641,'2111607','Sao Raimundo das Mangabeiras','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(642,'2111631','Sao Raimundo do Doca Bezerra','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(643,'2111672','Sao Roberto','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(644,'2111706','Sao Vicente Ferrer','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(645,'2111722','Satubinha','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(646,'2111748','Senador Alexandre Costa','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(647,'2111763','Senador La Rocque','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(648,'2111789','Serrano do Maranhao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(649,'2111805','Sitio Novo','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(650,'2111904','Sucupira do Norte','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(651,'2111953','Sucupira do Riachao','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(652,'2112001','Tasso Fragoso','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(653,'2112100','Timbiras','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(654,'2112209','Timon','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(655,'2112233','Trizidela do Vale','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(656,'2112274','Tufilândia','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(657,'2112308','Tuntum','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(658,'2112407','Turiaçu','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(659,'2112456','Turilândia','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(660,'2112506','Tutoia','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(661,'2112605','Urbano Santos','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(662,'2112704','Vargem Grande','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(663,'2112803','Viana','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(664,'2112852','Vila Nova dos Martirios','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(665,'2112902','Vitoria do Mearim','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(666,'2113009','Vitorino Freire','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(667,'2114007','Ze Doca','MA','2024-07-03 11:37:07','2024-07-03 11:37:07'),(668,'2200053','Acaua','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(669,'2200103','Agricolândia','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(670,'2200202','agua Branca','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(671,'2200251','Alagoinha do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(672,'2200277','Alegrete do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(673,'2200301','Alto Longa','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(674,'2200400','Altos','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(675,'2200459','Alvorada do Gurgueia','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(676,'2200509','Amarante','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(677,'2200608','Angical do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(678,'2200707','Anisio de Abreu','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(679,'2200806','Antônio Almeida','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(680,'2200905','Aroazes','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(681,'2200954','Aroeiras do Itaim','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(682,'2201002','Arraial','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(683,'2201051','Assunçao do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(684,'2201101','Avelino Lopes','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(685,'2201150','Baixa Grande do Ribeiro','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(686,'2201176','Barra D\'Alcântara','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(687,'2201200','Barras','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(688,'2201309','Barreiras do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(689,'2201408','Barro Duro','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(690,'2201507','Batalha','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(691,'2201556','Bela Vista do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(692,'2201572','Belem do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(693,'2201606','Beneditinos','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(694,'2201705','Bertolinia','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(695,'2201739','Betânia do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(696,'2201770','Boa Hora','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(697,'2201804','Bocaina','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(698,'2201903','Bom Jesus','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(699,'2201919','Bom Principio do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(700,'2201929','Bonfim do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(701,'2201945','Boqueirao do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(702,'2201960','Brasileira','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(703,'2201988','Brejo do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(704,'2202000','Buriti dos Lopes','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(705,'2202026','Buriti dos Montes','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(706,'2202059','Cabeceiras do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(707,'2202075','Cajazeiras do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(708,'2202083','Cajueiro da Praia','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(709,'2202091','Caldeirao Grande do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(710,'2202109','Campinas do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(711,'2202117','Campo Alegre do Fidalgo','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(712,'2202133','Campo Grande do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(713,'2202174','Campo Largo do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(714,'2202208','Campo Maior','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(715,'2202251','Canavieira','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(716,'2202307','Canto do Buriti','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(717,'2202406','Capitao de Campos','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(718,'2202455','Capitao Gervasio Oliveira','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(719,'2202505','Caracol','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(720,'2202539','Caraúbas do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(721,'2202554','Caridade do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(722,'2202604','Castelo do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(723,'2202653','Caxingo','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(724,'2202703','Cocal','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(725,'2202711','Cocal de Telha','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(726,'2202729','Cocal dos Alves','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(727,'2202737','Coivaras','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(728,'2202752','Colônia do Gurgueia','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(729,'2202778','Colônia do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(730,'2202802','Conceiçao do Caninde','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(731,'2202851','Coronel Jose Dias','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(732,'2202901','Corrente','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(733,'2203008','Cristalândia do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(734,'2203107','Cristino Castro','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(735,'2203206','Curimata','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(736,'2203230','Currais','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(737,'2203255','Curralinhos','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(738,'2203271','Curral Novo do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(739,'2203305','Demerval Lobao','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(740,'2203354','Dirceu Arcoverde','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(741,'2203404','Dom Expedito Lopes','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(742,'2203420','Domingos Mourao','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(743,'2203453','Dom Inocêncio','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(744,'2203503','Elesbao Veloso','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(745,'2203602','Eliseu Martins','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(746,'2203701','Esperantina','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(747,'2203750','Fartura do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(748,'2203800','Flores do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(749,'2203859','Floresta do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(750,'2203909','Floriano','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(751,'2204006','Francinopolis','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(752,'2204105','Francisco Ayres','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(753,'2204154','Francisco Macedo','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(754,'2204204','Francisco Santos','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(755,'2204303','Fronteiras','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(756,'2204352','Geminiano','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(757,'2204402','Gilbues','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(758,'2204501','Guadalupe','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(759,'2204550','Guaribas','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(760,'2204600','Hugo Napoleao','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(761,'2204659','Ilha Grande','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(762,'2204709','Inhuma','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(763,'2204808','Ipiranga do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(764,'2204907','Isaias Coelho','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(765,'2205003','Itainopolis','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(766,'2205102','Itaueira','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(767,'2205151','Jacobina do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(768,'2205201','Jaicos','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(769,'2205250','Jardim do Mulato','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(770,'2205276','Jatoba do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(771,'2205300','Jerumenha','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(772,'2205359','Joao Costa','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(773,'2205409','Joaquim Pires','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(774,'2205458','Joca Marques','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(775,'2205508','Jose de Freitas','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(776,'2205516','Juazeiro do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(777,'2205524','Júlio Borges','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(778,'2205532','Jurema','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(779,'2205540','Lagoinha do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(780,'2205557','Lagoa Alegre','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(781,'2205565','Lagoa do Barro do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(782,'2205573','Lagoa de Sao Francisco','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(783,'2205581','Lagoa do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(784,'2205599','Lagoa do Sitio','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(785,'2205607','Landri Sales','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(786,'2205706','Luis Correia','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(787,'2205805','Luzilândia','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(788,'2205854','Madeiro','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(789,'2205904','Manoel Emidio','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(790,'2205953','Marcolândia','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(791,'2206001','Marcos Parente','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(792,'2206050','Massapê do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(793,'2206100','Matias Olimpio','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(794,'2206209','Miguel Alves','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(795,'2206308','Miguel Leao','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(796,'2206357','Milton Brandao','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(797,'2206407','Monsenhor Gil','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(798,'2206506','Monsenhor Hipolito','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(799,'2206605','Monte Alegre do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(800,'2206654','Morro Cabeça no Tempo','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(801,'2206670','Morro do Chapeu do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(802,'2206696','Murici dos Portelas','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(803,'2206704','Nazare do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(804,'2206720','Nazaria','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(805,'2206753','Nossa Senhora de Nazare','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(806,'2206803','Nossa Senhora dos Remedios','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(807,'2206902','Novo Oriente do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(808,'2206951','Novo Santo Antônio','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(809,'2207009','Oeiras','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(810,'2207108','Olho D\'agua do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(811,'2207207','Padre Marcos','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(812,'2207306','Paes Landim','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(813,'2207355','Pajeú do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(814,'2207405','Palmeira do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(815,'2207504','Palmeirais','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(816,'2207553','Paqueta','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(817,'2207603','Parnagua','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(818,'2207702','Parnaiba','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(819,'2207751','Passagem Franca do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(820,'2207777','Patos do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(821,'2207793','Pau D\'Arco do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(822,'2207801','Paulistana','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(823,'2207850','Pavussu','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(824,'2207900','Pedro II','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(825,'2207934','Pedro Laurentino','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(826,'2207959','Nova Santa Rita','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(827,'2208007','Picos','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(828,'2208106','Pimenteiras','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(829,'2208205','Pio IX','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(830,'2208304','Piracuruca','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(831,'2208403','Piripiri','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(832,'2208502','Porto','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(833,'2208551','Porto Alegre do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(834,'2208601','Prata do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(835,'2208650','Queimada Nova','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(836,'2208700','Redençao do Gurgueia','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(837,'2208809','Regeneraçao','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(838,'2208858','Riacho Frio','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(839,'2208874','Ribeira do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(840,'2208908','Ribeiro Gonçalves','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(841,'2209005','Rio Grande do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(842,'2209104','Santa Cruz do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(843,'2209153','Santa Cruz dos Milagres','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(844,'2209203','Santa Filomena','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(845,'2209302','Santa Luz','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(846,'2209351','Santana do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(847,'2209377','Santa Rosa do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(848,'2209401','Santo Antônio de Lisboa','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(849,'2209450','Santo Antônio dos Milagres','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(850,'2209500','Santo Inacio do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(851,'2209559','Sao Braz do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(852,'2209609','Sao Felix do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(853,'2209658','Sao Francisco de Assis do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(854,'2209708','Sao Francisco do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(855,'2209757','Sao Gonçalo do Gurgueia','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(856,'2209807','Sao Gonçalo do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(857,'2209856','Sao Joao da Canabrava','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(858,'2209872','Sao Joao da Fronteira','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(859,'2209906','Sao Joao da Serra','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(860,'2209955','Sao Joao da Varjota','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(861,'2209971','Sao Joao do Arraial','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(862,'2210003','Sao Joao do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(863,'2210052','Sao Jose do Divino','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(864,'2210102','Sao Jose do Peixe','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(865,'2210201','Sao Jose do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(866,'2210300','Sao Juliao','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(867,'2210359','Sao Lourenço do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(868,'2210375','Sao Luis do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(869,'2210383','Sao Miguel da Baixa Grande','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(870,'2210391','Sao Miguel do Fidalgo','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(871,'2210409','Sao Miguel do Tapuio','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(872,'2210508','Sao Pedro do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(873,'2210607','Sao Raimundo Nonato','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(874,'2210623','Sebastiao Barros','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(875,'2210631','Sebastiao Leal','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(876,'2210656','Sigefredo Pacheco','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(877,'2210706','Simões','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(878,'2210805','Simplicio Mendes','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(879,'2210904','Socorro do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(880,'2210938','Sussuapara','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(881,'2210953','Tamboril do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(882,'2210979','Tanque do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(883,'2211001','Teresina','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(884,'2211100','Uniao','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(885,'2211209','Uruçui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(886,'2211308','Valença do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(887,'2211357','Varzea Branca','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(888,'2211407','Varzea Grande','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(889,'2211506','Vera Mendes','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(890,'2211605','Vila Nova do Piaui','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(891,'2211704','Wall Ferraz','PI','2024-07-03 11:37:07','2024-07-03 11:37:07'),(892,'2300101','Abaiara','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(893,'2300150','Acarape','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(894,'2300200','Acaraú','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(895,'2300309','Acopiara','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(896,'2300408','Aiuaba','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(897,'2300507','Alcântaras','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(898,'2300606','Altaneira','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(899,'2300705','Alto Santo','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(900,'2300754','Amontada','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(901,'2300804','Antonina do Norte','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(902,'2300903','Apuiares','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(903,'2301000','Aquiraz','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(904,'2301109','Aracati','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(905,'2301208','Aracoiaba','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(906,'2301257','Ararenda','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(907,'2301307','Araripe','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(908,'2301406','Aratuba','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(909,'2301505','Arneiroz','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(910,'2301604','Assare','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(911,'2301703','Aurora','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(912,'2301802','Baixio','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(913,'2301851','Banabuiú','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(914,'2301901','Barbalha','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(915,'2301950','Barreira','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(916,'2302008','Barro','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(917,'2302057','Barroquinha','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(918,'2302107','Baturite','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(919,'2302206','Beberibe','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(920,'2302305','Bela Cruz','CE','2024-07-03 11:37:07','2024-07-03 11:37:07'),(921,'2302404','Boa Viagem','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(922,'2302503','Brejo Santo','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(923,'2302602','Camocim','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(924,'2302701','Campos Sales','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(925,'2302800','Caninde','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(926,'2302909','Capistrano','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(927,'2303006','Caridade','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(928,'2303105','Carire','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(929,'2303204','Caririaçu','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(930,'2303303','Cariús','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(931,'2303402','Carnaubal','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(932,'2303501','Cascavel','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(933,'2303600','Catarina','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(934,'2303659','Catunda','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(935,'2303709','Caucaia','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(936,'2303808','Cedro','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(937,'2303907','Chaval','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(938,'2303931','Choro','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(939,'2303956','Chorozinho','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(940,'2304004','Coreaú','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(941,'2304103','Crateús','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(942,'2304202','Crato','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(943,'2304236','Croata','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(944,'2304251','Cruz','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(945,'2304269','Deputado Irapuan Pinheiro','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(946,'2304277','Ererê','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(947,'2304285','Eusebio','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(948,'2304301','Farias Brito','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(949,'2304350','Forquilha','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(950,'2304400','Fortaleza','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(951,'2304459','Fortim','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(952,'2304509','Frecheirinha','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(953,'2304608','General Sampaio','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(954,'2304657','Graça','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(955,'2304707','Granja','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(956,'2304806','Granjeiro','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(957,'2304905','Groairas','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(958,'2304954','Guaiúba','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(959,'2305001','Guaraciaba do Norte','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(960,'2305100','Guaramiranga','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(961,'2305209','Hidrolândia','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(962,'2305233','Horizonte','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(963,'2305266','Ibaretama','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(964,'2305308','Ibiapina','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(965,'2305332','Ibicuitinga','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(966,'2305357','Icapui','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(967,'2305407','Ico','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(968,'2305506','Iguatu','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(969,'2305605','Independência','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(970,'2305654','Ipaporanga','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(971,'2305704','Ipaumirim','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(972,'2305803','Ipu','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(973,'2305902','Ipueiras','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(974,'2306009','Iracema','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(975,'2306108','Irauçuba','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(976,'2306207','Itaiçaba','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(977,'2306256','Itaitinga','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(978,'2306306','Itapage','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(979,'2306405','Itapipoca','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(980,'2306504','Itapiúna','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(981,'2306553','Itarema','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(982,'2306603','Itatira','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(983,'2306702','Jaguaretama','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(984,'2306801','Jaguaribara','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(985,'2306900','Jaguaribe','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(986,'2307007','Jaguaruana','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(987,'2307106','Jardim','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(988,'2307205','Jati','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(989,'2307254','Jijoca de Jericoacoara','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(990,'2307304','Juazeiro do Norte','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(991,'2307403','Jucas','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(992,'2307502','Lavras da Mangabeira','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(993,'2307601','Limoeiro do Norte','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(994,'2307635','Madalena','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(995,'2307650','Maracanaú','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(996,'2307700','Maranguape','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(997,'2307809','Marco','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(998,'2307908','Martinopole','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(999,'2308005','Massapê','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1000,'2308104','Mauriti','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1001,'2308203','Meruoca','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1002,'2308302','Milagres','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1003,'2308351','Milha','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1004,'2308377','Miraima','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1005,'2308401','Missao Velha','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1006,'2308500','Mombaça','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1007,'2308609','Monsenhor Tabosa','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1008,'2308708','Morada Nova','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1009,'2308807','Moraújo','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1010,'2308906','Morrinhos','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1011,'2309003','Mucambo','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1012,'2309102','Mulungu','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1013,'2309201','Nova Olinda','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1014,'2309300','Nova Russas','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1015,'2309409','Novo Oriente','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1016,'2309458','Ocara','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1017,'2309508','Oros','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1018,'2309607','Pacajus','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1019,'2309706','Pacatuba','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1020,'2309805','Pacoti','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1021,'2309904','Pacuja','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1022,'2310001','Palhano','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1023,'2310100','Palmacia','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1024,'2310209','Paracuru','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1025,'2310258','Paraipaba','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1026,'2310308','Parambu','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1027,'2310407','Paramoti','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1028,'2310506','Pedra Branca','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1029,'2310605','Penaforte','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1030,'2310704','Pentecoste','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1031,'2310803','Pereiro','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1032,'2310852','Pindoretama','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1033,'2310902','Piquet Carneiro','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1034,'2310951','Pires Ferreira','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1035,'2311009','Poranga','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1036,'2311108','Porteiras','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1037,'2311207','Potengi','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1038,'2311231','Potiretama','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1039,'2311264','Quiterianopolis','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1040,'2311306','Quixada','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1041,'2311355','Quixelô','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1042,'2311405','Quixeramobim','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1043,'2311504','Quixere','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1044,'2311603','Redençao','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1045,'2311702','Reriutaba','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1046,'2311801','Russas','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1047,'2311900','Saboeiro','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1048,'2311959','Salitre','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1049,'2312007','Santana do Acaraú','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1050,'2312106','Santana do Cariri','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1051,'2312205','Santa Quiteria','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1052,'2312304','Sao Benedito','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1053,'2312403','Sao Gonçalo do Amarante','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1054,'2312502','Sao Joao do Jaguaribe','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1055,'2312601','Sao Luis do Curu','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1056,'2312700','Senador Pompeu','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1057,'2312809','Senador Sa','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1058,'2312908','Sobral','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1059,'2313005','Solonopole','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1060,'2313104','Tabuleiro do Norte','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1061,'2313203','Tamboril','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1062,'2313252','Tarrafas','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1063,'2313302','Taua','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1064,'2313351','Tejuçuoca','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1065,'2313401','Tiangua','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1066,'2313500','Trairi','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1067,'2313559','Tururu','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1068,'2313609','Ubajara','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1069,'2313708','Umari','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1070,'2313757','Umirim','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1071,'2313807','Uruburetama','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1072,'2313906','Uruoca','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1073,'2313955','Varjota','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1074,'2314003','Varzea Alegre','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1075,'2314102','Viçosa do Ceara','CE','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1076,'2400109','Acari','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1077,'2400208','Açu','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1078,'2400307','Afonso Bezerra','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1079,'2400406','agua Nova','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1080,'2400505','Alexandria','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1081,'2400604','Almino Afonso','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1082,'2400703','Alto do Rodrigues','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1083,'2400802','Angicos','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1084,'2400901','Antônio Martins','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1085,'2401008','Apodi','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1086,'2401107','Areia Branca','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1087,'2401206','Arês','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1088,'2401305','Augusto Severo','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1089,'2401404','Baia Formosa','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1090,'2401453','Baraúna','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1091,'2401503','Barcelona','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1092,'2401602','Bento Fernandes','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1093,'2401651','Bodo','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1094,'2401701','Bom Jesus','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1095,'2401800','Brejinho','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1096,'2401859','Caiçara do Norte','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1097,'2401909','Caiçara do Rio do Vento','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1098,'2402006','Caico','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1099,'2402105','Campo Redondo','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1100,'2402204','Canguaretama','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1101,'2402303','Caraúbas','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1102,'2402402','Carnaúba dos Dantas','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1103,'2402501','Carnaubais','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1104,'2402600','Ceara-Mirim','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1105,'2402709','Cerro Cora','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1106,'2402808','Coronel Ezequiel','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1107,'2402907','Coronel Joao Pessoa','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1108,'2403004','Cruzeta','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1109,'2403103','Currais Novos','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1110,'2403202','Doutor Severiano','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1111,'2403251','Parnamirim','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1112,'2403301','Encanto','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1113,'2403400','Equador','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1114,'2403509','Espirito Santo','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1115,'2403608','Extremoz','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1116,'2403707','Felipe Guerra','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1117,'2403756','Fernando Pedroza','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1118,'2403806','Florânia','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1119,'2403905','Francisco Dantas','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1120,'2404002','Frutuoso Gomes','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1121,'2404101','Galinhos','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1122,'2404200','Goianinha','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1123,'2404309','Governador Dix-Sept Rosado','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1124,'2404408','Grossos','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1125,'2404507','Guamare','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1126,'2404606','Ielmo Marinho','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1127,'2404705','Ipanguaçu','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1128,'2404804','Ipueira','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1129,'2404853','Itaja','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1130,'2404903','Itaú','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1131,'2405009','Jaçana','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1132,'2405108','Jandaira','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1133,'2405207','Janduis','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1134,'2405306','Januario Cicco','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1135,'2405405','Japi','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1136,'2405504','Jardim de Angicos','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1137,'2405603','Jardim de Piranhas','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1138,'2405702','Jardim do Serido','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1139,'2405801','Joao Câmara','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1140,'2405900','Joao Dias','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1141,'2406007','Jose da Penha','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1142,'2406106','Jucurutu','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1143,'2406155','Jundia','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1144,'2406205','Lagoa D\'Anta','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1145,'2406304','Lagoa de Pedras','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1146,'2406403','Lagoa de Velhos','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1147,'2406502','Lagoa Nova','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1148,'2406601','Lagoa Salgada','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1149,'2406700','Lajes','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1150,'2406809','Lajes Pintadas','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1151,'2406908','Lucrecia','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1152,'2407005','Luis Gomes','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1153,'2407104','Macaiba','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1154,'2407203','Macau','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1155,'2407252','Major Sales','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1156,'2407302','Marcelino Vieira','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1157,'2407401','Martins','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1158,'2407500','Maxaranguape','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1159,'2407609','Messias Targino','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1160,'2407708','Montanhas','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1161,'2407807','Monte Alegre','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1162,'2407906','Monte das Gameleiras','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1163,'2408003','Mossoro','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1164,'2408102','Natal','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1165,'2408201','Nisia Floresta','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1166,'2408300','Nova Cruz','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1167,'2408409','Olho-D\'agua do Borges','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1168,'2408508','Ouro Branco','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1169,'2408607','Parana','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1170,'2408706','Paraú','RN','2024-07-03 11:37:08','2024-07-03 11:37:08'),(1171,'2408805','Parazinho','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1172,'2408904','Parelhas','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1173,'2408953','Rio do Fogo','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1174,'2409100','Passa e Fica','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1175,'2409209','Passagem','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1176,'2409308','Patu','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1177,'2409332','Santa Maria','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1178,'2409407','Pau dos Ferros','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1179,'2409506','Pedra Grande','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1180,'2409605','Pedra Preta','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1181,'2409704','Pedro Avelino','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1182,'2409803','Pedro Velho','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1183,'2409902','Pendências','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1184,'2410009','Pilões','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1185,'2410108','Poço Branco','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1186,'2410207','Portalegre','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1187,'2410256','Porto do Mangue','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1188,'2410306','Presidente Juscelino','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1189,'2410405','Pureza','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1190,'2410504','Rafael Fernandes','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1191,'2410603','Rafael Godeiro','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1192,'2410702','Riacho da Cruz','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1193,'2410801','Riacho de Santana','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1194,'2410900','Riachuelo','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1195,'2411007','Rodolfo Fernandes','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1196,'2411056','Tibau','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1197,'2411106','Ruy Barbosa','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1198,'2411205','Santa Cruz','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1199,'2411403','Santana do Matos','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1200,'2411429','Santana do Serido','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1201,'2411502','Santo Antônio','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1202,'2411601','Sao Bento do Norte','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1203,'2411700','Sao Bento do Trairi','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1204,'2411809','Sao Fernando','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1205,'2411908','Sao Francisco do Oeste','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1206,'2412005','Sao Gonçalo do Amarante','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1207,'2412104','Sao Joao do Sabugi','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1208,'2412203','Sao Jose de Mipibu','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1209,'2412302','Sao Jose do Campestre','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1210,'2412401','Sao Jose do Serido','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1211,'2412500','Sao Miguel','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1212,'2412559','Sao Miguel do Gostoso','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1213,'2412609','Sao Paulo do Potengi','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1214,'2412708','Sao Pedro','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1215,'2412807','Sao Rafael','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1216,'2412906','Sao Tome','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1217,'2413003','Sao Vicente','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1218,'2413102','Senador Eloi de Souza','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1219,'2413201','Senador Georgino Avelino','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1220,'2413300','Serra de Sao Bento','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1221,'2413359','Serra do Mel','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1222,'2413409','Serra Negra do Norte','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1223,'2413508','Serrinha','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1224,'2413557','Serrinha dos Pintos','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1225,'2413607','Severiano Melo','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1226,'2413706','Sitio Novo','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1227,'2413805','Taboleiro Grande','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1228,'2413904','Taipu','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1229,'2414001','Tangara','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1230,'2414100','Tenente Ananias','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1231,'2414159','Tenente Laurentino Cruz','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1232,'2414209','Tibau do Sul','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1233,'2414308','Timbaúba dos Batistas','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1234,'2414407','Touros','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1235,'2414456','Triunfo Potiguar','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1236,'2414506','Umarizal','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1237,'2414605','Upanema','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1238,'2414704','Varzea','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1239,'2414753','Venha-Ver','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1240,'2414803','Vera Cruz','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1241,'2414902','Viçosa','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1242,'2415008','Vila Flor','RN','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1243,'2500106','agua Branca','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1244,'2500205','Aguiar','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1245,'2500304','Alagoa Grande','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1246,'2500403','Alagoa Nova','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1247,'2500502','Alagoinha','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1248,'2500536','Alcantil','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1249,'2500577','Algodao de Jandaira','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1250,'2500601','Alhandra','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1251,'2500700','Sao Joao do Rio do Peixe','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1252,'2500734','Amparo','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1253,'2500775','Aparecida','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1254,'2500809','Araçagi','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1255,'2500908','Arara','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1256,'2501005','Araruna','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1257,'2501104','Areia','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1258,'2501153','Areia de Baraúnas','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1259,'2501203','Areial','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1260,'2501302','Aroeiras','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1261,'2501351','Assunçao','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1262,'2501401','Baia da Traiçao','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1263,'2501500','Bananeiras','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1264,'2501534','Baraúna','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1265,'2501575','Barra de Santana','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1266,'2501609','Barra de Santa Rosa','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1267,'2501708','Barra de Sao Miguel','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1268,'2501807','Bayeux','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1269,'2501906','Belem','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1270,'2502003','Belem do Brejo do Cruz','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1271,'2502052','Bernardino Batista','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1272,'2502102','Boa Ventura','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1273,'2502151','Boa Vista','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1274,'2502201','Bom Jesus','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1275,'2502300','Bom Sucesso','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1276,'2502409','Bonito de Santa Fe','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1277,'2502508','Boqueirao','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1278,'2502607','Igaracy','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1279,'2502706','Borborema','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1280,'2502805','Brejo do Cruz','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1281,'2502904','Brejo dos Santos','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1282,'2503001','Caapora','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1283,'2503100','Cabaceiras','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1284,'2503209','Cabedelo','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1285,'2503308','Cachoeira dos indios','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1286,'2503407','Cacimba de Areia','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1287,'2503506','Cacimba de Dentro','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1288,'2503555','Cacimbas','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1289,'2503605','Caiçara','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1290,'2503704','Cajazeiras','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1291,'2503753','Cajazeirinhas','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1292,'2503803','Caldas Brandao','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1293,'2503902','Camalaú','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1294,'2504009','Campina Grande','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1295,'2504033','Capim','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1296,'2504074','Caraúbas','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1297,'2504108','Carrapateira','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1298,'2504157','Casserengue','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1299,'2504207','Catingueira','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1300,'2504306','Catole do Rocha','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1301,'2504355','Caturite','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1302,'2504405','Conceiçao','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1303,'2504504','Condado','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1304,'2504603','Conde','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1305,'2504702','Congo','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1306,'2504801','Coremas','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1307,'2504850','Coxixola','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1308,'2504900','Cruz do Espirito Santo','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1309,'2505006','Cubati','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1310,'2505105','Cuite','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1311,'2505204','Cuitegi','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1312,'2505238','Cuite de Mamanguape','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1313,'2505279','Curral de Cima','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1314,'2505303','Curral Velho','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1315,'2505352','Damiao','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1316,'2505402','Desterro','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1317,'2505501','Vista Serrana','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1318,'2505600','Diamante','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1319,'2505709','Dona Inês','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1320,'2505808','Duas Estradas','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1321,'2505907','Emas','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1322,'2506004','Esperança','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1323,'2506103','Fagundes','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1324,'2506202','Frei Martinho','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1325,'2506251','Gado Bravo','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1326,'2506301','Guarabira','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1327,'2506400','Gurinhem','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1328,'2506509','Gurjao','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1329,'2506608','Ibiara','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1330,'2506707','Imaculada','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1331,'2506806','Inga','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1332,'2506905','Itabaiana','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1333,'2507002','Itaporanga','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1334,'2507101','Itapororoca','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1335,'2507200','Itatuba','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1336,'2507309','Jacaraú','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1337,'2507408','Jerico','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1338,'2507507','Joao Pessoa','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1339,'2507606','Juarez Tavora','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1340,'2507705','Juazeirinho','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1341,'2507804','Junco do Serido','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1342,'2507903','Juripiranga','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1343,'2508000','Juru','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1344,'2508109','Lagoa','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1345,'2508208','Lagoa de Dentro','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1346,'2508307','Lagoa Seca','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1347,'2508406','Lastro','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1348,'2508505','Livramento','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1349,'2508554','Logradouro','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1350,'2508604','Lucena','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1351,'2508703','Mae D\'agua','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1352,'2508802','Malta','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1353,'2508901','Mamanguape','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1354,'2509008','Manaira','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1355,'2509057','Marcaçao','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1356,'2509107','Mari','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1357,'2509156','Marizopolis','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1358,'2509206','Massaranduba','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1359,'2509305','Mataraca','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1360,'2509339','Matinhas','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1361,'2509370','Mato Grosso','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1362,'2509396','Matureia','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1363,'2509404','Mogeiro','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1364,'2509503','Montadas','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1365,'2509602','Monte Horebe','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1366,'2509701','Monteiro','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1367,'2509800','Mulungu','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1368,'2509909','Natuba','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1369,'2510006','Nazarezinho','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1370,'2510105','Nova Floresta','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1371,'2510204','Nova Olinda','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1372,'2510303','Nova Palmeira','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1373,'2510402','Olho D\'agua','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1374,'2510501','Olivedos','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1375,'2510600','Ouro Velho','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1376,'2510659','Parari','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1377,'2510709','Passagem','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1378,'2510808','Patos','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1379,'2510907','Paulista','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1380,'2511004','Pedra Branca','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1381,'2511103','Pedra Lavrada','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1382,'2511202','Pedras de Fogo','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1383,'2511301','Pianco','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1384,'2511400','Picui','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1385,'2511509','Pilar','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1386,'2511608','Pilões','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1387,'2511707','Pilõezinhos','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1388,'2511806','Pirpirituba','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1389,'2511905','Pitimbu','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1390,'2512002','Pocinhos','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1391,'2512036','Poço Dantas','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1392,'2512077','Poço de Jose de Moura','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1393,'2512101','Pombal','PB','2024-07-03 11:37:09','2024-07-03 11:37:09'),(1394,'2512200','Prata','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1395,'2512309','Princesa Isabel','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1396,'2512408','Puxinana','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1397,'2512507','Queimadas','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1398,'2512606','Quixaba','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1399,'2512705','Remigio','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1400,'2512721','Pedro Regis','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1401,'2512747','Riachao','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1402,'2512754','Riachao do Bacamarte','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1403,'2512762','Riachao do Poço','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1404,'2512788','Riacho de Santo Antônio','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1405,'2512804','Riacho dos Cavalos','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1406,'2512903','Rio Tinto','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1407,'2513000','Salgadinho','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1408,'2513109','Salgado de Sao Felix','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1409,'2513158','Santa Cecilia','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1410,'2513208','Santa Cruz','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1411,'2513307','Santa Helena','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1412,'2513356','Santa Inês','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1413,'2513406','Santa Luzia','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1414,'2513505','Santana de Mangueira','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1415,'2513604','Santana dos Garrotes','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1416,'2513653','Joca Claudino','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1417,'2513703','Santa Rita','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1418,'2513802','Santa Teresinha','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1419,'2513851','Santo Andre','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1420,'2513901','Sao Bento','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1421,'2513927','Sao Bentinho','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1422,'2513943','Sao Domingos do Cariri','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1423,'2513968','Sao Domingos','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1424,'2513984','Sao Francisco','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1425,'2514008','Sao Joao do Cariri','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1426,'2514107','Sao Joao do Tigre','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1427,'2514206','Sao Jose da Lagoa Tapada','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1428,'2514305','Sao Jose de Caiana','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1429,'2514404','Sao Jose de Espinharas','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1430,'2514453','Sao Jose dos Ramos','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1431,'2514503','Sao Jose de Piranhas','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1432,'2514552','Sao Jose de Princesa','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1433,'2514602','Sao Jose do Bonfim','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1434,'2514651','Sao Jose do Brejo do Cruz','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1435,'2514701','Sao Jose do Sabugi','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1436,'2514800','Sao Jose dos Cordeiros','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1437,'2514909','Sao Mamede','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1438,'2515005','Sao Miguel de Taipu','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1439,'2515104','Sao Sebastiao de Lagoa de Roça','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1440,'2515203','Sao Sebastiao do Umbuzeiro','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1441,'2515302','Sape','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1442,'2515401','Sao Vicente do Serido','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1443,'2515500','Serra Branca','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1444,'2515609','Serra da Raiz','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1445,'2515708','Serra Grande','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1446,'2515807','Serra Redonda','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1447,'2515906','Serraria','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1448,'2515930','Sertaozinho','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1449,'2515971','Sobrado','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1450,'2516003','Solânea','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1451,'2516102','Soledade','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1452,'2516151','Sossêgo','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1453,'2516201','Sousa','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1454,'2516300','Sume','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1455,'2516409','Tacima','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1456,'2516508','Taperoa','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1457,'2516607','Tavares','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1458,'2516706','Teixeira','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1459,'2516755','Tenorio','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1460,'2516805','Triunfo','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1461,'2516904','Uiraúna','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1462,'2517001','Umbuzeiro','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1463,'2517100','Varzea','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1464,'2517209','Vieiropolis','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1465,'2517407','Zabelê','PB','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1466,'2600054','Abreu e Lima','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1467,'2600104','Afogados da Ingazeira','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1468,'2600203','Afrânio','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1469,'2600302','Agrestina','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1470,'2600401','agua Preta','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1471,'2600500','aguas Belas','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1472,'2600609','Alagoinha','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1473,'2600708','Aliança','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1474,'2600807','Altinho','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1475,'2600906','Amaraji','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1476,'2601003','Angelim','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1477,'2601052','Araçoiaba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1478,'2601102','Araripina','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1479,'2601201','Arcoverde','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1480,'2601300','Barra de Guabiraba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1481,'2601409','Barreiros','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1482,'2601508','Belem de Maria','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1483,'2601607','Belem do Sao Francisco','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1484,'2601706','Belo Jardim','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1485,'2601805','Betânia','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1486,'2601904','Bezerros','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1487,'2602001','Bodoco','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1488,'2602100','Bom Conselho','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1489,'2602209','Bom Jardim','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1490,'2602308','Bonito','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1491,'2602407','Brejao','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1492,'2602506','Brejinho','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1493,'2602605','Brejo da Madre de Deus','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1494,'2602704','Buenos Aires','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1495,'2602803','Buique','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1496,'2602902','Cabo de Santo Agostinho','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1497,'2603009','Cabrobo','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1498,'2603108','Cachoeirinha','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1499,'2603207','Caetes','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1500,'2603306','Calçado','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1501,'2603405','Calumbi','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1502,'2603454','Camaragibe','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1503,'2603504','Camocim de Sao Felix','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1504,'2603603','Camutanga','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1505,'2603702','Canhotinho','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1506,'2603801','Capoeiras','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1507,'2603900','Carnaiba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1508,'2603926','Carnaubeira da Penha','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1509,'2604007','Carpina','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1510,'2604106','Caruaru','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1511,'2604155','Casinhas','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1512,'2604205','Catende','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1513,'2604304','Cedro','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1514,'2604403','Cha de Alegria','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1515,'2604502','Cha Grande','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1516,'2604601','Condado','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1517,'2604700','Correntes','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1518,'2604809','Cortês','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1519,'2604908','Cumaru','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1520,'2605004','Cupira','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1521,'2605103','Custodia','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1522,'2605152','Dormentes','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1523,'2605202','Escada','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1524,'2605301','Exu','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1525,'2605400','Feira Nova','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1526,'2605459','Fernando de Noronha','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1527,'2605509','Ferreiros','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1528,'2605608','Flores','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1529,'2605707','Floresta','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1530,'2605806','Frei Miguelinho','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1531,'2605905','Gameleira','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1532,'2606002','Garanhuns','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1533,'2606101','Gloria do Goita','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1534,'2606200','Goiana','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1535,'2606309','Granito','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1536,'2606408','Gravata','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1537,'2606507','Iati','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1538,'2606606','Ibimirim','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1539,'2606705','Ibirajuba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1540,'2606804','Igarassu','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1541,'2606903','Iguaraci','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1542,'2607000','Inaja','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1543,'2607109','Ingazeira','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1544,'2607208','Ipojuca','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1545,'2607307','Ipubi','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1546,'2607406','Itacuruba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1547,'2607505','Itaiba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1548,'2607604','Ilha de Itamaraca','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1549,'2607653','Itambe','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1550,'2607703','Itapetim','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1551,'2607752','Itapissuma','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1552,'2607802','Itaquitinga','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1553,'2607901','Jaboatao dos Guararapes','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1554,'2607950','Jaqueira','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1555,'2608008','Jataúba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1556,'2608057','Jatoba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1557,'2608107','Joao Alfredo','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1558,'2608206','Joaquim Nabuco','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1559,'2608255','Jucati','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1560,'2608305','Jupi','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1561,'2608404','Jurema','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1562,'2608453','Lagoa do Carro','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1563,'2608503','Lagoa de Itaenga','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1564,'2608602','Lagoa do Ouro','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1565,'2608701','Lagoa dos Gatos','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1566,'2608750','Lagoa Grande','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1567,'2608800','Lajedo','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1568,'2608909','Limoeiro','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1569,'2609006','Macaparana','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1570,'2609105','Machados','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1571,'2609154','Manari','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1572,'2609204','Maraial','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1573,'2609303','Mirandiba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1574,'2609402','Moreno','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1575,'2609501','Nazare da Mata','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1576,'2609600','Olinda','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1577,'2609709','Orobo','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1578,'2609808','Oroco','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1579,'2609907','Ouricuri','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1580,'2610004','Palmares','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1581,'2610103','Palmeirina','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1582,'2610202','Panelas','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1583,'2610301','Paranatama','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1584,'2610400','Parnamirim','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1585,'2610509','Passira','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1586,'2610608','Paudalho','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1587,'2610707','Paulista','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1588,'2610806','Pedra','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1589,'2610905','Pesqueira','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1590,'2611002','Petrolândia','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1591,'2611101','Petrolina','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1592,'2611200','Poçao','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1593,'2611309','Pombos','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1594,'2611408','Primavera','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1595,'2611507','Quipapa','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1596,'2611533','Quixaba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1597,'2611606','Recife','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1598,'2611705','Riacho das Almas','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1599,'2611804','Ribeirao','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1600,'2611903','Rio Formoso','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1601,'2612000','Saire','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1602,'2612109','Salgadinho','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1603,'2612208','Salgueiro','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1604,'2612307','Saloa','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1605,'2612406','Sanharo','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1606,'2612455','Santa Cruz','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1607,'2612471','Santa Cruz da Baixa Verde','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1608,'2612505','Santa Cruz do Capibaribe','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1609,'2612554','Santa Filomena','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1610,'2612604','Santa Maria da Boa Vista','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1611,'2612703','Santa Maria do Cambuca','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1612,'2612802','Santa Terezinha','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1613,'2612901','Sao Benedito do Sul','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1614,'2613008','Sao Bento do Una','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1615,'2613107','Sao Caitano','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1616,'2613206','Sao Joao','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1617,'2613305','Sao Joaquim do Monte','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1618,'2613404','Sao Jose da Coroa Grande','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1619,'2613503','Sao Jose do Belmonte','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1620,'2613602','Sao Jose do Egito','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1621,'2613701','Sao Lourenço da Mata','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1622,'2613800','Sao Vicente Ferrer','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1623,'2613909','Serra Talhada','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1624,'2614006','Serrita','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1625,'2614105','Sertânia','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1626,'2614204','Sirinhaem','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1627,'2614303','Moreilândia','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1628,'2614402','Solidao','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1629,'2614501','Surubim','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1630,'2614600','Tabira','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1631,'2614709','Tacaimbo','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1632,'2614808','Tacaratu','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1633,'2614857','Tamandare','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1634,'2615003','Taquaritinga do Norte','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1635,'2615102','Terezinha','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1636,'2615201','Terra Nova','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1637,'2615300','Timbaúba','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1638,'2615409','Toritama','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1639,'2615508','Tracunhaem','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1640,'2615607','Trindade','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1641,'2615706','Triunfo','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1642,'2615805','Tupanatinga','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1643,'2615904','Tuparetama','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1644,'2616001','Venturosa','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1645,'2616100','Verdejante','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1646,'2616183','Vertente do Lerio','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1647,'2616209','Vertentes','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1648,'2616308','Vicência','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1649,'2616407','Vitoria de Santo Antao','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1650,'2616506','Xexeu','PE','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1651,'2700102','agua Branca','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1652,'2700201','Anadia','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1653,'2700300','Arapiraca','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1654,'2700409','Atalaia','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1655,'2700508','Barra de Santo Antônio','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1656,'2700607','Barra de Sao Miguel','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1657,'2700706','Batalha','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1658,'2700805','Belem','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1659,'2700904','Belo Monte','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1660,'2701001','Boca da Mata','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1661,'2701100','Branquinha','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1662,'2701209','Cacimbinhas','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1663,'2701308','Cajueiro','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1664,'2701357','Campestre','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1665,'2701407','Campo Alegre','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1666,'2701506','Campo Grande','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1667,'2701605','Canapi','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1668,'2701704','Capela','AL','2024-07-03 11:37:10','2024-07-03 11:37:10'),(1669,'2701803','Carneiros','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1670,'2701902','Cha Preta','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1671,'2702009','Coite do Noia','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1672,'2702108','Colônia Leopoldina','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1673,'2702207','Coqueiro Seco','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1674,'2702306','Coruripe','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1675,'2702355','Craibas','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1676,'2702405','Delmiro Gouveia','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1677,'2702504','Dois Riachos','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1678,'2702553','Estrela de Alagoas','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1679,'2702603','Feira Grande','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1680,'2702702','Feliz Deserto','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1681,'2702801','Flexeiras','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1682,'2702900','Girau do Ponciano','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1683,'2703007','Ibateguara','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1684,'2703106','Igaci','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1685,'2703205','Igreja Nova','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1686,'2703304','Inhapi','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1687,'2703403','Jacare dos Homens','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1688,'2703502','Jacuipe','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1689,'2703601','Japaratinga','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1690,'2703700','Jaramataia','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1691,'2703759','Jequia da Praia','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1692,'2703809','Joaquim Gomes','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1693,'2703908','Jundia','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1694,'2704005','Junqueiro','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1695,'2704104','Lagoa da Canoa','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1696,'2704203','Limoeiro de Anadia','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1697,'2704302','Maceio','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1698,'2704401','Major Isidoro','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1699,'2704500','Maragogi','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1700,'2704609','Maravilha','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1701,'2704708','Marechal Deodoro','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1702,'2704807','Maribondo','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1703,'2704906','Mar Vermelho','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1704,'2705002','Mata Grande','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1705,'2705101','Matriz de Camaragibe','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1706,'2705200','Messias','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1707,'2705309','Minador do Negrao','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1708,'2705408','Monteiropolis','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1709,'2705507','Murici','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1710,'2705606','Novo Lino','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1711,'2705705','Olho D\'agua das Flores','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1712,'2705804','Olho D\'agua do Casado','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1713,'2705903','Olho D\'agua Grande','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1714,'2706000','Olivença','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1715,'2706109','Ouro Branco','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1716,'2706208','Palestina','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1717,'2706307','Palmeira dos indios','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1718,'2706406','Pao de Açúcar','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1719,'2706422','Pariconha','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1720,'2706448','Paripueira','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1721,'2706505','Passo de Camaragibe','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1722,'2706604','Paulo Jacinto','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1723,'2706703','Penedo','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1724,'2706802','Piaçabuçu','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1725,'2706901','Pilar','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1726,'2707008','Pindoba','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1727,'2707107','Piranhas','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1728,'2707206','Poço das Trincheiras','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1729,'2707305','Porto Calvo','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1730,'2707404','Porto de Pedras','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1731,'2707503','Porto Real do Colegio','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1732,'2707602','Quebrangulo','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1733,'2707701','Rio Largo','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1734,'2707800','Roteiro','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1735,'2707909','Santa Luzia do Norte','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1736,'2708006','Santana do Ipanema','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1737,'2708105','Santana do Mundaú','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1738,'2708204','Sao Bras','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1739,'2708303','Sao Jose da Laje','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1740,'2708402','Sao Jose da Tapera','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1741,'2708501','Sao Luis do Quitunde','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1742,'2708600','Sao Miguel dos Campos','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1743,'2708709','Sao Miguel dos Milagres','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1744,'2708808','Sao Sebastiao','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1745,'2708907','Satuba','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1746,'2708956','Senador Rui Palmeira','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1747,'2709004','Tanque D\'Arca','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1748,'2709103','Taquarana','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1749,'2709152','Teotônio Vilela','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1750,'2709202','Traipu','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1751,'2709301','Uniao dos Palmares','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1752,'2709400','Viçosa','AL','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1753,'2800100','Amparo de Sao Francisco','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1754,'2800209','Aquidaba','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1755,'2800308','Aracaju','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1756,'2800407','Araua','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1757,'2800506','Areia Branca','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1758,'2800605','Barra dos Coqueiros','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1759,'2800670','Boquim','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1760,'2800704','Brejo Grande','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1761,'2801009','Campo do Brito','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1762,'2801108','Canhoba','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1763,'2801207','Caninde de Sao Francisco','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1764,'2801306','Capela','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1765,'2801405','Carira','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1766,'2801504','Carmopolis','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1767,'2801603','Cedro de Sao Joao','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1768,'2801702','Cristinapolis','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1769,'2801900','Cumbe','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1770,'2802007','Divina Pastora','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1771,'2802106','Estância','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1772,'2802205','Feira Nova','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1773,'2802304','Frei Paulo','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1774,'2802403','Gararu','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1775,'2802502','General Maynard','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1776,'2802601','Gracho Cardoso','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1777,'2802700','Ilha das Flores','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1778,'2802809','Indiaroba','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1779,'2802908','Itabaiana','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1780,'2803005','Itabaianinha','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1781,'2803104','Itabi','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1782,'2803203','Itaporanga D\'Ajuda','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1783,'2803302','Japaratuba','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1784,'2803401','Japoata','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1785,'2803500','Lagarto','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1786,'2803609','Laranjeiras','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1787,'2803708','Macambira','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1788,'2803807','Malhada dos Bois','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1789,'2803906','Malhador','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1790,'2804003','Maruim','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1791,'2804102','Moita Bonita','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1792,'2804201','Monte Alegre de Sergipe','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1793,'2804300','Muribeca','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1794,'2804409','Neopolis','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1795,'2804458','Nossa Senhora Aparecida','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1796,'2804508','Nossa Senhora da Gloria','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1797,'2804607','Nossa Senhora das Dores','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1798,'2804706','Nossa Senhora de Lourdes','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1799,'2804805','Nossa Senhora do Socorro','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1800,'2804904','Pacatuba','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1801,'2805000','Pedra Mole','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1802,'2805109','Pedrinhas','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1803,'2805208','Pinhao','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1804,'2805307','Pirambu','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1805,'2805406','Poço Redondo','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1806,'2805505','Poço Verde','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1807,'2805604','Porto da Folha','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1808,'2805703','Propria','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1809,'2805802','Riachao do Dantas','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1810,'2805901','Riachuelo','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1811,'2806008','Ribeiropolis','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1812,'2806107','Rosario do Catete','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1813,'2806206','Salgado','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1814,'2806305','Santa Luzia do Itanhy','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1815,'2806404','Santana do Sao Francisco','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1816,'2806503','Santa Rosa de Lima','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1817,'2806602','Santo Amaro das Brotas','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1818,'2806701','Sao Cristovao','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1819,'2806800','Sao Domingos','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1820,'2806909','Sao Francisco','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1821,'2807006','Sao Miguel do Aleixo','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1822,'2807105','Simao Dias','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1823,'2807204','Siriri','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1824,'2807303','Telha','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1825,'2807402','Tobias Barreto','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1826,'2807501','Tomar do Geru','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1827,'2807600','Umbaúba','SE','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1828,'2900108','Abaira','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1829,'2900207','Abare','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1830,'2900306','Acajutiba','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1831,'2900355','Adustina','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1832,'2900405','agua Fria','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1833,'2900504','erico Cardoso','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1834,'2900603','Aiquara','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1835,'2900702','Alagoinhas','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1836,'2900801','Alcobaça','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1837,'2900900','Almadina','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1838,'2901007','Amargosa','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1839,'2901106','Amelia Rodrigues','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1840,'2901155','America Dourada','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1841,'2901205','Anage','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1842,'2901304','Andarai','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1843,'2901353','Andorinha','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1844,'2901403','Angical','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1845,'2901502','Anguera','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1846,'2901601','Antas','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1847,'2901700','Antônio Cardoso','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1848,'2901809','Antônio Gonçalves','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1849,'2901908','Apora','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1850,'2901957','Apuarema','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1851,'2902005','Aracatu','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1852,'2902054','Araças','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1853,'2902104','Araci','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1854,'2902203','Aramari','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1855,'2902252','Arataca','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1856,'2902302','Aratuipe','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1857,'2902401','Aurelino Leal','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1858,'2902500','Baianopolis','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1859,'2902609','Baixa Grande','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1860,'2902658','Banzaê','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1861,'2902708','Barra','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1862,'2902807','Barra da Estiva','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1863,'2902906','Barra do Choça','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1864,'2903003','Barra do Mendes','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1865,'2903102','Barra do Rocha','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1866,'2903201','Barreiras','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1867,'2903235','Barro Alto','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1868,'2903276','Barrocas','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1869,'2903300','Barro Preto','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1870,'2903409','Belmonte','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1871,'2903508','Belo Campo','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1872,'2903607','Biritinga','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1873,'2903706','Boa Nova','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1874,'2903805','Boa Vista do Tupim','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1875,'2903904','Bom Jesus da Lapa','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1876,'2903953','Bom Jesus da Serra','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1877,'2904001','Boninal','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1878,'2904050','Bonito','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1879,'2904100','Boquira','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1880,'2904209','Botupora','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1881,'2904308','Brejões','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1882,'2904407','Brejolândia','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1883,'2904506','Brotas de Macaúbas','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1884,'2904605','Brumado','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1885,'2904704','Buerarema','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1886,'2904753','Buritirama','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1887,'2904803','Caatiba','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1888,'2904852','Cabaceiras do Paraguaçu','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1889,'2904902','Cachoeira','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1890,'2905008','Cacule','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1891,'2905107','Caem','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1892,'2905156','Caetanos','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1893,'2905206','Caetite','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1894,'2905305','Cafarnaum','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1895,'2905404','Cairu','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1896,'2905503','Caldeirao Grande','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1897,'2905602','Camacan','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1898,'2905701','Camaçari','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1899,'2905800','Camamu','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1900,'2905909','Campo Alegre de Lourdes','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1901,'2906006','Campo Formoso','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1902,'2906105','Canapolis','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1903,'2906204','Canarana','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1904,'2906303','Canavieiras','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1905,'2906402','Candeal','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1906,'2906501','Candeias','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1907,'2906600','Candiba','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1908,'2906709','Cândido Sales','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1909,'2906808','Cansançao','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1910,'2906824','Canudos','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1911,'2906857','Capela do Alto Alegre','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1912,'2906873','Capim Grosso','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1913,'2906899','Caraibas','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1914,'2906907','Caravelas','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1915,'2907004','Cardeal da Silva','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1916,'2907103','Carinhanha','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1917,'2907202','Casa Nova','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1918,'2907301','Castro Alves','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1919,'2907400','Catolândia','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1920,'2907509','Catu','BA','2024-07-03 11:37:11','2024-07-03 11:37:11'),(1921,'2907558','Caturama','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1922,'2907608','Central','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1923,'2907707','Chorrocho','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1924,'2907806','Cicero Dantas','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1925,'2907905','Cipo','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1926,'2908002','Coaraci','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1927,'2908101','Cocos','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1928,'2908200','Conceiçao da Feira','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1929,'2908309','Conceiçao do Almeida','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1930,'2908408','Conceiçao do Coite','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1931,'2908507','Conceiçao do Jacuipe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1932,'2908606','Conde','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1933,'2908705','Condeúba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1934,'2908804','Contendas do Sincora','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1935,'2908903','Coraçao de Maria','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1936,'2909000','Cordeiros','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1937,'2909109','Coribe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1938,'2909208','Coronel Joao Sa','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1939,'2909307','Correntina','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1940,'2909406','Cotegipe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1941,'2909505','Cravolândia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1942,'2909604','Crisopolis','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1943,'2909703','Cristopolis','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1944,'2909802','Cruz das Almas','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1945,'2909901','Curaça','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1946,'2910008','Dario Meira','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1947,'2910057','Dias D\'avila','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1948,'2910107','Dom Basilio','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1949,'2910206','Dom Macedo Costa','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1950,'2910305','Elisio Medrado','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1951,'2910404','Encruzilhada','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1952,'2910503','Entre Rios','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1953,'2910602','Esplanada','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1954,'2910701','Euclides da Cunha','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1955,'2910727','Eunapolis','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1956,'2910750','Fatima','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1957,'2910776','Feira da Mata','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1958,'2910800','Feira de Santana','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1959,'2910859','Filadelfia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1960,'2910909','Firmino Alves','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1961,'2911006','Floresta Azul','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1962,'2911105','Formosa do Rio Preto','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1963,'2911204','Gandu','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1964,'2911253','Gaviao','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1965,'2911303','Gentio do Ouro','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1966,'2911402','Gloria','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1967,'2911501','Gongogi','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1968,'2911600','Governador Mangabeira','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1969,'2911659','Guajeru','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1970,'2911709','Guanambi','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1971,'2911808','Guaratinga','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1972,'2911857','Heliopolis','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1973,'2911907','Iaçu','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1974,'2912004','Ibiassucê','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1975,'2912103','Ibicarai','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1976,'2912202','Ibicoara','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1977,'2912301','Ibicui','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1978,'2912400','Ibipeba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1979,'2912509','Ibipitanga','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1980,'2912608','Ibiquera','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1981,'2912707','Ibirapitanga','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1982,'2912806','Ibirapua','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1983,'2912905','Ibirataia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1984,'2913002','Ibitiara','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1985,'2913101','Ibitita','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1986,'2913200','Ibotirama','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1987,'2913309','Ichu','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1988,'2913408','Igapora','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1989,'2913457','Igrapiúna','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1990,'2913507','Iguai','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1991,'2913606','Ilheus','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1992,'2913705','Inhambupe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1993,'2913804','Ipecaeta','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1994,'2913903','Ipiaú','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1995,'2914000','Ipira','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1996,'2914109','Ipupiara','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1997,'2914208','Irajuba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1998,'2914307','Iramaia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(1999,'2914406','Iraquara','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2000,'2914505','Irara','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2001,'2914604','Irecê','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2002,'2914653','Itabela','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2003,'2914703','Itaberaba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2004,'2914802','Itabuna','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2005,'2914901','Itacare','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2006,'2915007','Itaete','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2007,'2915106','Itagi','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2008,'2915205','Itagiba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2009,'2915304','Itagimirim','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2010,'2915353','Itaguaçu da Bahia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2011,'2915403','Itaju do Colônia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2012,'2915502','Itajuipe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2013,'2915601','Itamaraju','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2014,'2915700','Itamari','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2015,'2915809','Itambe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2016,'2915908','Itanagra','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2017,'2916005','Itanhem','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2018,'2916104','Itaparica','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2019,'2916203','Itape','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2020,'2916302','Itapebi','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2021,'2916401','Itapetinga','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2022,'2916500','Itapicuru','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2023,'2916609','Itapitanga','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2024,'2916708','Itaquara','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2025,'2916807','Itarantim','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2026,'2916856','Itatim','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2027,'2916906','Itiruçu','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2028,'2917003','Itiúba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2029,'2917102','Itororo','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2030,'2917201','Ituaçu','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2031,'2917300','Itubera','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2032,'2917334','Iuiú','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2033,'2917359','Jaborandi','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2034,'2917409','Jacaraci','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2035,'2917508','Jacobina','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2036,'2917607','Jaguaquara','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2037,'2917706','Jaguarari','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2038,'2917805','Jaguaripe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2039,'2917904','Jandaira','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2040,'2918001','Jequie','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2041,'2918100','Jeremoabo','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2042,'2918209','Jiquiriça','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2043,'2918308','Jitaúna','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2044,'2918357','Joao Dourado','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2045,'2918407','Juazeiro','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2046,'2918456','Jucuruçu','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2047,'2918506','Jussara','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2048,'2918555','Jussari','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2049,'2918605','Jussiape','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2050,'2918704','Lafaiete Coutinho','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2051,'2918753','Lagoa Real','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2052,'2918803','Laje','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2053,'2918902','Lajedao','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2054,'2919009','Lajedinho','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2055,'2919058','Lajedo do Tabocal','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2056,'2919108','Lamarao','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2057,'2919157','Lapao','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2058,'2919207','Lauro de Freitas','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2059,'2919306','Lençois','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2060,'2919405','Licinio de Almeida','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2061,'2919504','Livramento de Nossa Senhora','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2062,'2919553','Luis Eduardo Magalhaes','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2063,'2919603','Macajuba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2064,'2919702','Macarani','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2065,'2919801','Macaúbas','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2066,'2919900','Macurure','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2067,'2919926','Madre de Deus','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2068,'2919959','Maetinga','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2069,'2920007','Maiquinique','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2070,'2920106','Mairi','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2071,'2920205','Malhada','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2072,'2920304','Malhada de Pedras','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2073,'2920403','Manoel Vitorino','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2074,'2920452','Mansidao','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2075,'2920502','Maracas','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2076,'2920601','Maragogipe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2077,'2920700','Maraú','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2078,'2920809','Marcionilio Souza','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2079,'2920908','Mascote','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2080,'2921005','Mata de Sao Joao','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2081,'2921054','Matina','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2082,'2921104','Medeiros Neto','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2083,'2921203','Miguel Calmon','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2084,'2921302','Milagres','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2085,'2921401','Mirangaba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2086,'2921450','Mirante','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2087,'2921500','Monte Santo','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2088,'2921609','Morpara','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2089,'2921708','Morro do Chapeu','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2090,'2921807','Mortugaba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2091,'2921906','Mucugê','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2092,'2922003','Mucuri','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2093,'2922052','Mulungu do Morro','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2094,'2922102','Mundo Novo','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2095,'2922201','Muniz Ferreira','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2096,'2922250','Muquem de Sao Francisco','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2097,'2922300','Muritiba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2098,'2922409','Mutuipe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2099,'2922508','Nazare','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2100,'2922607','Nilo Peçanha','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2101,'2922656','Nordestina','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2102,'2922706','Nova Canaa','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2103,'2922730','Nova Fatima','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2104,'2922755','Nova Ibia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2105,'2922805','Nova Itarana','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2106,'2922854','Nova Redençao','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2107,'2922904','Nova Soure','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2108,'2923001','Nova Viçosa','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2109,'2923035','Novo Horizonte','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2110,'2923050','Novo Triunfo','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2111,'2923100','Olindina','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2112,'2923209','Oliveira dos Brejinhos','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2113,'2923308','Ouriçangas','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2114,'2923357','Ourolândia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2115,'2923407','Palmas de Monte Alto','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2116,'2923506','Palmeiras','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2117,'2923605','Paramirim','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2118,'2923704','Paratinga','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2119,'2923803','Paripiranga','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2120,'2923902','Pau Brasil','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2121,'2924009','Paulo Afonso','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2122,'2924058','Pe de Serra','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2123,'2924108','Pedrao','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2124,'2924207','Pedro Alexandre','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2125,'2924306','Piata','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2126,'2924405','Pilao Arcado','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2127,'2924504','Pindai','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2128,'2924603','Pindobaçu','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2129,'2924652','Pintadas','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2130,'2924678','Pirai do Norte','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2131,'2924702','Piripa','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2132,'2924801','Piritiba','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2133,'2924900','Planaltino','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2134,'2925006','Planalto','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2135,'2925105','Poções','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2136,'2925204','Pojuca','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2137,'2925253','Ponto Novo','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2138,'2925303','Porto Seguro','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2139,'2925402','Potiragua','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2140,'2925501','Prado','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2141,'2925600','Presidente Dutra','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2142,'2925709','Presidente Jânio Quadros','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2143,'2925758','Presidente Tancredo Neves','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2144,'2925808','Queimadas','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2145,'2925907','Quijingue','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2146,'2925931','Quixabeira','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2147,'2925956','Rafael Jambeiro','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2148,'2926004','Remanso','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2149,'2926103','Retirolândia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2150,'2926202','Riachao das Neves','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2151,'2926301','Riachao do Jacuipe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2152,'2926400','Riacho de Santana','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2153,'2926509','Ribeira do Amparo','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2154,'2926608','Ribeira do Pombal','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2155,'2926657','Ribeirao do Largo','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2156,'2926707','Rio de Contas','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2157,'2926806','Rio do Antônio','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2158,'2926905','Rio do Pires','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2159,'2927002','Rio Real','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2160,'2927101','Rodelas','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2161,'2927200','Ruy Barbosa','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2162,'2927309','Salinas da Margarida','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2163,'2927408','Salvador','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2164,'2927507','Santa Barbara','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2165,'2927606','Santa Brigida','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2166,'2927705','Santa Cruz Cabralia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2167,'2927804','Santa Cruz da Vitoria','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2168,'2927903','Santa Inês','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2169,'2928000','Santaluz','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2170,'2928059','Santa Luzia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2171,'2928109','Santa Maria da Vitoria','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2172,'2928208','Santana','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2173,'2928307','Santanopolis','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2174,'2928406','Santa Rita de Cassia','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2175,'2928505','Santa Teresinha','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2176,'2928604','Santo Amaro','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2177,'2928703','Santo Antônio de Jesus','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2178,'2928802','Santo Estêvao','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2179,'2928901','Sao Desiderio','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2180,'2928950','Sao Domingos','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2181,'2929008','Sao Felix','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2182,'2929057','Sao Felix do Coribe','BA','2024-07-03 11:37:12','2024-07-03 11:37:12'),(2183,'2929107','Sao Felipe','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2184,'2929206','Sao Francisco do Conde','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2185,'2929255','Sao Gabriel','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2186,'2929305','Sao Gonçalo dos Campos','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2187,'2929354','Sao Jose da Vitoria','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2188,'2929370','Sao Jose do Jacuipe','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2189,'2929404','Sao Miguel das Matas','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2190,'2929503','Sao Sebastiao do Passe','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2191,'2929602','Sapeaçu','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2192,'2929701','Satiro Dias','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2193,'2929750','Saubara','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2194,'2929800','Saúde','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2195,'2929909','Seabra','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2196,'2930006','Sebastiao Laranjeiras','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2197,'2930105','Senhor do Bonfim','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2198,'2930154','Serra do Ramalho','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2199,'2930204','Sento Se','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2200,'2930303','Serra Dourada','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2201,'2930402','Serra Preta','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2202,'2930501','Serrinha','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2203,'2930600','Serrolândia','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2204,'2930709','Simões Filho','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2205,'2930758','Sitio do Mato','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2206,'2930766','Sitio do Quinto','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2207,'2930774','Sobradinho','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2208,'2930808','Souto Soares','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2209,'2930907','Tabocas do Brejo Velho','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2210,'2931004','Tanhaçu','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2211,'2931053','Tanque Novo','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2212,'2931103','Tanquinho','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2213,'2931202','Taperoa','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2214,'2931301','Tapiramuta','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2215,'2931350','Teixeira de Freitas','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2216,'2931400','Teodoro Sampaio','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2217,'2931509','Teofilândia','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2218,'2931608','Teolândia','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2219,'2931707','Terra Nova','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2220,'2931806','Tremedal','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2221,'2931905','Tucano','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2222,'2932002','Uaua','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2223,'2932101','Ubaira','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2224,'2932200','Ubaitaba','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2225,'2932309','Ubata','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2226,'2932408','Uibai','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2227,'2932457','Umburanas','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2228,'2932507','Una','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2229,'2932606','Urandi','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2230,'2932705','Uruçuca','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2231,'2932804','Utinga','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2232,'2932903','Valença','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2233,'2933000','Valente','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2234,'2933059','Varzea da Roça','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2235,'2933109','Varzea do Poço','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2236,'2933158','Varzea Nova','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2237,'2933174','Varzedo','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2238,'2933208','Vera Cruz','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2239,'2933257','Vereda','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2240,'2933307','Vitoria da Conquista','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2241,'2933406','Wagner','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2242,'2933455','Wanderley','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2243,'2933505','Wenceslau Guimaraes','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2244,'2933604','Xique-Xique','BA','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2245,'3100104','Abadia dos Dourados','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2246,'3100203','Abaete','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2247,'3100302','Abre Campo','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2248,'3100401','Acaiaca','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2249,'3100500','Açucena','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2250,'3100609','agua Boa','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2251,'3100708','agua Comprida','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2252,'3100807','Aguanil','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2253,'3100906','aguas Formosas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2254,'3101003','aguas Vermelhas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2255,'3101102','Aimores','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2256,'3101201','Aiuruoca','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2257,'3101300','Alagoa','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2258,'3101409','Albertina','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2259,'3101508','Alem Paraiba','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2260,'3101607','Alfenas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2261,'3101631','Alfredo Vasconcelos','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2262,'3101706','Almenara','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2263,'3101805','Alpercata','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2264,'3101904','Alpinopolis','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2265,'3102001','Alterosa','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2266,'3102050','Alto Caparao','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2267,'3102100','Alto Rio Doce','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2268,'3102209','Alvarenga','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2269,'3102308','Alvinopolis','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2270,'3102407','Alvorada de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2271,'3102506','Amparo do Serra','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2272,'3102605','Andradas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2273,'3102704','Cachoeira de Pajeú','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2274,'3102803','Andrelândia','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2275,'3102852','Angelândia','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2276,'3102902','Antônio Carlos','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2277,'3103009','Antônio Dias','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2278,'3103108','Antônio Prado de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2279,'3103207','Araçai','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2280,'3103306','Aracitaba','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2281,'3103405','Araçuai','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2282,'3103504','Araguari','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2283,'3103603','Arantina','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2284,'3103702','Araponga','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2285,'3103751','Arapora','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2286,'3103801','Arapua','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2287,'3103900','Araújos','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2288,'3104007','Araxa','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2289,'3104106','Arceburgo','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2290,'3104205','Arcos','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2291,'3104304','Areado','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2292,'3104403','Argirita','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2293,'3104452','Aricanduva','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2294,'3104502','Arinos','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2295,'3104601','Astolfo Dutra','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2296,'3104700','Ataleia','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2297,'3104809','Augusto de Lima','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2298,'3104908','Baependi','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2299,'3105004','Baldim','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2300,'3105103','Bambui','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2301,'3105202','Bandeira','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2302,'3105301','Bandeira do Sul','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2303,'3105400','Barao de Cocais','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2304,'3105509','Barao de Monte Alto','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2305,'3105608','Barbacena','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2306,'3105707','Barra Longa','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2307,'3105905','Barroso','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2308,'3106002','Bela Vista de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2309,'3106101','Belmiro Braga','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2310,'3106200','Belo Horizonte','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2311,'3106309','Belo Oriente','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2312,'3106408','Belo Vale','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2313,'3106507','Berilo','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2314,'3106606','Bertopolis','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2315,'3106655','Berizal','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2316,'3106705','Betim','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2317,'3106804','Bias Fortes','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2318,'3106903','Bicas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2319,'3107000','Biquinhas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2320,'3107109','Boa Esperança','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2321,'3107208','Bocaina de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2322,'3107307','Bocaiúva','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2323,'3107406','Bom Despacho','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2324,'3107505','Bom Jardim de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2325,'3107604','Bom Jesus da Penha','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2326,'3107703','Bom Jesus do Amparo','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2327,'3107802','Bom Jesus do Galho','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2328,'3107901','Bom Repouso','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2329,'3108008','Bom Sucesso','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2330,'3108107','Bonfim','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2331,'3108206','Bonfinopolis de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2332,'3108255','Bonito de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2333,'3108305','Borda da Mata','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2334,'3108404','Botelhos','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2335,'3108503','Botumirim','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2336,'3108552','Brasilândia de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2337,'3108602','Brasilia de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2338,'3108701','Bras Pires','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2339,'3108800','Braúnas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2340,'3108909','Brazopolis','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2341,'3109006','Brumadinho','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2342,'3109105','Bueno Brandao','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2343,'3109204','Buenopolis','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2344,'3109253','Bugre','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2345,'3109303','Buritis','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2346,'3109402','Buritizeiro','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2347,'3109451','Cabeceira Grande','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2348,'3109501','Cabo Verde','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2349,'3109600','Cachoeira da Prata','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2350,'3109709','Cachoeira de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2351,'3109808','Cachoeira Dourada','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2352,'3109907','Caetanopolis','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2353,'3110004','Caete','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2354,'3110103','Caiana','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2355,'3110202','Cajuri','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2356,'3110301','Caldas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2357,'3110400','Camacho','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2358,'3110509','Camanducaia','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2359,'3110608','Cambui','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2360,'3110707','Cambuquira','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2361,'3110806','Campanario','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2362,'3110905','Campanha','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2363,'3111002','Campestre','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2364,'3111101','Campina Verde','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2365,'3111150','Campo Azul','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2366,'3111200','Campo Belo','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2367,'3111309','Campo do Meio','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2368,'3111408','Campo Florido','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2369,'3111507','Campos Altos','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2370,'3111606','Campos Gerais','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2371,'3111705','Canaa','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2372,'3111804','Canapolis','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2373,'3111903','Cana Verde','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2374,'3112000','Candeias','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2375,'3112059','Cantagalo','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2376,'3112109','Caparao','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2377,'3112208','Capela Nova','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2378,'3112307','Capelinha','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2379,'3112406','Capetinga','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2380,'3112505','Capim Branco','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2381,'3112604','Capinopolis','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2382,'3112653','Capitao Andrade','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2383,'3112703','Capitao Eneas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2384,'3112802','Capitolio','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2385,'3112901','Caputira','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2386,'3113008','Carai','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2387,'3113107','Caranaiba','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2388,'3113206','Carandai','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2389,'3113305','Carangola','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2390,'3113404','Caratinga','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2391,'3113503','Carbonita','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2392,'3113602','Careaçu','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2393,'3113701','Carlos Chagas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2394,'3113800','Carmesia','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2395,'3113909','Carmo da Cachoeira','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2396,'3114006','Carmo da Mata','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2397,'3114105','Carmo de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2398,'3114204','Carmo do Cajuru','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2399,'3114303','Carmo do Paranaiba','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2400,'3114402','Carmo do Rio Claro','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2401,'3114501','Carmopolis de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2402,'3114550','Carneirinho','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2403,'3114600','Carrancas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2404,'3114709','Carvalhopolis','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2405,'3114808','Carvalhos','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2406,'3114907','Casa Grande','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2407,'3115003','Cascalho Rico','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2408,'3115102','Cassia','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2409,'3115201','Conceiçao da Barra de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2410,'3115300','Cataguases','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2411,'3115359','Catas Altas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2412,'3115409','Catas Altas da Noruega','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2413,'3115458','Catuji','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2414,'3115474','Catuti','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2415,'3115508','Caxambu','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2416,'3115607','Cedro do Abaete','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2417,'3115706','Central de Minas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2418,'3115805','Centralina','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2419,'3115904','Chacara','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2420,'3116001','Chale','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2421,'3116100','Chapada do Norte','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2422,'3116159','Chapada Gaúcha','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2423,'3116209','Chiador','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2424,'3116308','Cipotânea','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2425,'3116407','Claraval','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2426,'3116506','Claro dos Poções','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2427,'3116605','Claudio','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2428,'3116704','Coimbra','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2429,'3116803','Coluna','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2430,'3116902','Comendador Gomes','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2431,'3117009','Comercinho','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2432,'3117108','Conceiçao da Aparecida','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2433,'3117207','Conceiçao das Pedras','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2434,'3117306','Conceiçao das Alagoas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2435,'3117405','Conceiçao de Ipanema','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2436,'3117504','Conceiçao do Mato Dentro','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2437,'3117603','Conceiçao do Para','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2438,'3117702','Conceiçao do Rio Verde','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2439,'3117801','Conceiçao dos Ouros','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2440,'3117836','Cônego Marinho','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2441,'3117876','Confins','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2442,'3117900','Congonhal','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2443,'3118007','Congonhas','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2444,'3118106','Congonhas do Norte','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2445,'3118205','Conquista','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2446,'3118304','Conselheiro Lafaiete','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2447,'3118403','Conselheiro Pena','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2448,'3118502','Consolaçao','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2449,'3118601','Contagem','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2450,'3118700','Coqueiral','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2451,'3118809','Coraçao de Jesus','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2452,'3118908','Cordisburgo','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2453,'3119005','Cordislândia','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2454,'3119104','Corinto','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2455,'3119203','Coroaci','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2456,'3119302','Coromandel','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2457,'3119401','Coronel Fabriciano','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2458,'3119500','Coronel Murta','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2459,'3119609','Coronel Pacheco','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2460,'3119708','Coronel Xavier Chaves','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2461,'3119807','Corrego Danta','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2462,'3119906','Corrego do Bom Jesus','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2463,'3119955','Corrego Fundo','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2464,'3120003','Corrego Novo','MG','2024-07-03 11:37:13','2024-07-03 11:37:13'),(2465,'3120102','Couto de Magalhaes de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2466,'3120151','Crisolita','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2467,'3120201','Cristais','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2468,'3120300','Cristalia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2469,'3120409','Cristiano Otoni','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2470,'3120508','Cristina','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2471,'3120607','Crucilândia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2472,'3120706','Cruzeiro da Fortaleza','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2473,'3120805','Cruzilia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2474,'3120839','Cuparaque','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2475,'3120870','Curral de Dentro','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2476,'3120904','Curvelo','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2477,'3121001','Datas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2478,'3121100','Delfim Moreira','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2479,'3121209','Delfinopolis','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2480,'3121258','Delta','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2481,'3121308','Descoberto','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2482,'3121407','Desterro de Entre Rios','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2483,'3121506','Desterro do Melo','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2484,'3121605','Diamantina','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2485,'3121704','Diogo de Vasconcelos','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2486,'3121803','Dionisio','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2487,'3121902','Divinesia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2488,'3122009','Divino','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2489,'3122108','Divino das Laranjeiras','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2490,'3122207','Divinolândia de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2491,'3122306','Divinopolis','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2492,'3122355','Divisa Alegre','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2493,'3122405','Divisa Nova','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2494,'3122454','Divisopolis','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2495,'3122470','Dom Bosco','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2496,'3122504','Dom Cavati','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2497,'3122603','Dom Joaquim','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2498,'3122702','Dom Silverio','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2499,'3122801','Dom Viçoso','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2500,'3122900','Dona Eusebia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2501,'3123007','Dores de Campos','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2502,'3123106','Dores de Guanhaes','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2503,'3123205','Dores do Indaia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2504,'3123304','Dores do Turvo','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2505,'3123403','Doresopolis','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2506,'3123502','Douradoquara','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2507,'3123528','Durande','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2508,'3123601','Eloi Mendes','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2509,'3123700','Engenheiro Caldas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2510,'3123809','Engenheiro Navarro','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2511,'3123858','Entre Folhas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2512,'3123908','Entre Rios de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2513,'3124005','Ervalia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2514,'3124104','Esmeraldas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2515,'3124203','Espera Feliz','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2516,'3124302','Espinosa','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2517,'3124401','Espirito Santo do Dourado','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2518,'3124500','Estiva','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2519,'3124609','Estrela Dalva','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2520,'3124708','Estrela do Indaia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2521,'3124807','Estrela do Sul','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2522,'3124906','Eugenopolis','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2523,'3125002','Ewbank da Câmara','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2524,'3125101','Extrema','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2525,'3125200','Fama','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2526,'3125309','Faria Lemos','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2527,'3125408','Felicio dos Santos','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2528,'3125507','Sao Gonçalo do Rio Preto','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2529,'3125606','Felisburgo','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2530,'3125705','Felixlândia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2531,'3125804','Fernandes Tourinho','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2532,'3125903','Ferros','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2533,'3125952','Fervedouro','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2534,'3126000','Florestal','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2535,'3126109','Formiga','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2536,'3126208','Formoso','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2537,'3126307','Fortaleza de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2538,'3126406','Fortuna de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2539,'3126505','Francisco Badaro','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2540,'3126604','Francisco Dumont','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2541,'3126703','Francisco Sa','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2542,'3126752','Franciscopolis','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2543,'3126802','Frei Gaspar','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2544,'3126901','Frei Inocêncio','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2545,'3126950','Frei Lagonegro','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2546,'3127008','Fronteira','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2547,'3127057','Fronteira dos Vales','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2548,'3127073','Fruta de Leite','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2549,'3127107','Frutal','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2550,'3127206','Funilândia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2551,'3127305','Galileia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2552,'3127339','Gameleiras','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2553,'3127354','Glaucilândia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2554,'3127370','Goiabeira','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2555,'3127388','Goiana','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2556,'3127404','Gonçalves','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2557,'3127503','Gonzaga','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2558,'3127602','Gouveia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2559,'3127701','Governador Valadares','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2560,'3127800','Grao Mogol','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2561,'3127909','Grupiara','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2562,'3128006','Guanhaes','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2563,'3128105','Guape','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2564,'3128204','Guaraciaba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2565,'3128253','Guaraciama','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2566,'3128303','Guaranesia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2567,'3128402','Guarani','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2568,'3128501','Guarara','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2569,'3128600','Guarda-Mor','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2570,'3128709','Guaxupe','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2571,'3128808','Guidoval','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2572,'3128907','Guimarânia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2573,'3129004','Guiricema','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2574,'3129103','Gurinhata','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2575,'3129202','Heliodora','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2576,'3129301','Iapu','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2577,'3129400','Ibertioga','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2578,'3129509','Ibia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2579,'3129608','Ibiai','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2580,'3129657','Ibiracatu','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2581,'3129707','Ibiraci','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2582,'3129806','Ibirite','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2583,'3129905','Ibitiúra de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2584,'3130002','Ibituruna','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2585,'3130051','Icarai de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2586,'3130101','Igarape','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2587,'3130200','Igaratinga','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2588,'3130309','Iguatama','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2589,'3130408','Ijaci','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2590,'3130507','Ilicinea','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2591,'3130556','Imbe de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2592,'3130606','Inconfidentes','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2593,'3130655','Indaiabira','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2594,'3130705','Indianopolis','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2595,'3130804','Ingai','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2596,'3130903','Inhapim','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2597,'3131000','Inhaúma','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2598,'3131109','Inimutaba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2599,'3131158','Ipaba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2600,'3131208','Ipanema','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2601,'3131307','Ipatinga','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2602,'3131406','Ipiaçu','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2603,'3131505','Ipuiúna','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2604,'3131604','Irai de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2605,'3131703','Itabira','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2606,'3131802','Itabirinha','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2607,'3131901','Itabirito','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2608,'3132008','Itacambira','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2609,'3132107','Itacarambi','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2610,'3132206','Itaguara','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2611,'3132305','Itaipe','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2612,'3132404','Itajuba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2613,'3132503','Itamarandiba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2614,'3132602','Itamarati de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2615,'3132701','Itambacuri','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2616,'3132800','Itambe do Mato Dentro','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2617,'3132909','Itamogi','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2618,'3133006','Itamonte','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2619,'3133105','Itanhandu','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2620,'3133204','Itanhomi','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2621,'3133303','Itaobim','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2622,'3133402','Itapagipe','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2623,'3133501','Itapecerica','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2624,'3133600','Itapeva','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2625,'3133709','Itatiaiuçu','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2626,'3133758','Itaú de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2627,'3133808','Itaúna','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2628,'3133907','Itaverava','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2629,'3134004','Itinga','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2630,'3134103','Itueta','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2631,'3134202','Ituiutaba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2632,'3134301','Itumirim','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2633,'3134400','Iturama','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2634,'3134509','Itutinga','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2635,'3134608','Jaboticatubas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2636,'3134707','Jacinto','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2637,'3134806','Jacui','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2638,'3134905','Jacutinga','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2639,'3135001','Jaguaraçu','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2640,'3135050','Jaiba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2641,'3135076','Jampruca','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2642,'3135100','Janaúba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2643,'3135209','Januaria','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2644,'3135308','Japaraiba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2645,'3135357','Japonvar','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2646,'3135407','Jeceaba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2647,'3135456','Jenipapo de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2648,'3135506','Jequeri','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2649,'3135605','Jequitai','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2650,'3135704','Jequitiba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2651,'3135803','Jequitinhonha','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2652,'3135902','Jesuânia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2653,'3136009','Joaima','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2654,'3136108','Joanesia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2655,'3136207','Joao Monlevade','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2656,'3136306','Joao Pinheiro','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2657,'3136405','Joaquim Felicio','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2658,'3136504','Jordânia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2659,'3136520','Jose Gonçalves de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2660,'3136553','Jose Raydan','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2661,'3136579','Josenopolis','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2662,'3136603','Nova Uniao','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2663,'3136652','Juatuba','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2664,'3136702','Juiz de Fora','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2665,'3136801','Juramento','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2666,'3136900','Juruaia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2667,'3136959','Juvenilia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2668,'3137007','Ladainha','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2669,'3137106','Lagamar','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2670,'3137205','Lagoa da Prata','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2671,'3137304','Lagoa dos Patos','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2672,'3137403','Lagoa Dourada','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2673,'3137502','Lagoa Formosa','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2674,'3137536','Lagoa Grande','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2675,'3137601','Lagoa Santa','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2676,'3137700','Lajinha','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2677,'3137809','Lambari','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2678,'3137908','Lamim','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2679,'3138005','Laranjal','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2680,'3138104','Lassance','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2681,'3138203','Lavras','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2682,'3138302','Leandro Ferreira','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2683,'3138351','Leme do Prado','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2684,'3138401','Leopoldina','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2685,'3138500','Liberdade','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2686,'3138609','Lima Duarte','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2687,'3138625','Limeira do Oeste','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2688,'3138658','Lontra','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2689,'3138674','Luisburgo','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2690,'3138682','Luislândia','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2691,'3138708','Luminarias','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2692,'3138807','Luz','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2693,'3138906','Machacalis','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2694,'3139003','Machado','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2695,'3139102','Madre de Deus de Minas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2696,'3139201','Malacacheta','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2697,'3139250','Mamonas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2698,'3139300','Manga','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2699,'3139409','Manhuaçu','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2700,'3139508','Manhumirim','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2701,'3139607','Mantena','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2702,'3139706','Maravilhas','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2703,'3139805','Mar de Espanha','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2704,'3139904','Maria da Fe','MG','2024-07-03 11:37:14','2024-07-03 11:37:14'),(2705,'3140001','Mariana','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2706,'3140100','Marilac','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2707,'3140159','Mario Campos','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2708,'3140209','Maripa de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2709,'3140308','Marlieria','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2710,'3140407','Marmelopolis','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2711,'3140506','Martinho Campos','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2712,'3140530','Martins Soares','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2713,'3140555','Mata Verde','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2714,'3140605','Materlândia','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2715,'3140704','Mateus Leme','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2716,'3140803','Matias Barbosa','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2717,'3140852','Matias Cardoso','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2718,'3140902','Matipo','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2719,'3141009','Mato Verde','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2720,'3141108','Matozinhos','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2721,'3141207','Matutina','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2722,'3141306','Medeiros','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2723,'3141405','Medina','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2724,'3141504','Mendes Pimentel','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2725,'3141603','Mercês','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2726,'3141702','Mesquita','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2727,'3141801','Minas Novas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2728,'3141900','Minduri','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2729,'3142007','Mirabela','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2730,'3142106','Miradouro','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2731,'3142205','Mirai','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2732,'3142254','Miravânia','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2733,'3142304','Moeda','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2734,'3142403','Moema','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2735,'3142502','Monjolos','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2736,'3142601','Monsenhor Paulo','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2737,'3142700','Montalvânia','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2738,'3142809','Monte Alegre de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2739,'3142908','Monte Azul','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2740,'3143005','Monte Belo','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2741,'3143104','Monte Carmelo','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2742,'3143153','Monte Formoso','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2743,'3143203','Monte Santo de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2744,'3143302','Montes Claros','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2745,'3143401','Monte Siao','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2746,'3143450','Montezuma','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2747,'3143500','Morada Nova de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2748,'3143609','Morro da Garça','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2749,'3143708','Morro do Pilar','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2750,'3143807','Munhoz','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2751,'3143906','Muriae','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2752,'3144003','Mutum','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2753,'3144102','Muzambinho','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2754,'3144201','Nacip Raydan','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2755,'3144300','Nanuque','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2756,'3144359','Naque','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2757,'3144375','Natalândia','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2758,'3144409','Natercia','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2759,'3144508','Nazareno','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2760,'3144607','Nepomuceno','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2761,'3144656','Ninheira','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2762,'3144672','Nova Belem','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2763,'3144706','Nova Era','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2764,'3144805','Nova Lima','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2765,'3144904','Nova Modica','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2766,'3145000','Nova Ponte','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2767,'3145059','Nova Porteirinha','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2768,'3145109','Nova Resende','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2769,'3145208','Nova Serrana','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2770,'3145307','Novo Cruzeiro','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2771,'3145356','Novo Oriente de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2772,'3145372','Novorizonte','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2773,'3145406','Olaria','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2774,'3145455','Olhos-D\'agua','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2775,'3145505','Olimpio Noronha','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2776,'3145604','Oliveira','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2777,'3145703','Oliveira Fortes','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2778,'3145802','Onça de Pitangui','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2779,'3145851','Oratorios','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2780,'3145877','Orizânia','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2781,'3145901','Ouro Branco','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2782,'3146008','Ouro Fino','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2783,'3146107','Ouro Preto','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2784,'3146206','Ouro Verde de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2785,'3146255','Padre Carvalho','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2786,'3146305','Padre Paraiso','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2787,'3146404','Paineiras','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2788,'3146503','Pains','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2789,'3146552','Pai Pedro','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2790,'3146602','Paiva','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2791,'3146701','Palma','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2792,'3146750','Palmopolis','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2793,'3146909','Papagaios','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2794,'3147006','Paracatu','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2795,'3147105','Para de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2796,'3147204','Paraguaçu','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2797,'3147303','Paraisopolis','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2798,'3147402','Paraopeba','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2799,'3147501','Passabem','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2800,'3147600','Passa Quatro','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2801,'3147709','Passa Tempo','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2802,'3147808','Passa-Vinte','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2803,'3147907','Passos','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2804,'3147956','Patis','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2805,'3148004','Patos de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2806,'3148103','Patrocinio','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2807,'3148202','Patrocinio do Muriae','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2808,'3148301','Paula Cândido','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2809,'3148400','Paulistas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2810,'3148509','Pavao','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2811,'3148608','Peçanha','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2812,'3148707','Pedra Azul','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2813,'3148756','Pedra Bonita','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2814,'3148806','Pedra do Anta','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2815,'3148905','Pedra do Indaia','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2816,'3149002','Pedra Dourada','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2817,'3149101','Pedralva','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2818,'3149150','Pedras de Maria da Cruz','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2819,'3149200','Pedrinopolis','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2820,'3149309','Pedro Leopoldo','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2821,'3149408','Pedro Teixeira','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2822,'3149507','Pequeri','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2823,'3149606','Pequi','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2824,'3149705','Perdigao','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2825,'3149804','Perdizes','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2826,'3149903','Perdões','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2827,'3149952','Periquito','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2828,'3150000','Pescador','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2829,'3150109','Piau','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2830,'3150158','Piedade de Caratinga','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2831,'3150208','Piedade de Ponte Nova','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2832,'3150307','Piedade do Rio Grande','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2833,'3150406','Piedade dos Gerais','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2834,'3150505','Pimenta','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2835,'3150539','Pingo-D\'agua','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2836,'3150570','Pintopolis','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2837,'3150604','Piracema','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2838,'3150703','Pirajuba','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2839,'3150802','Piranga','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2840,'3150901','Piranguçu','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2841,'3151008','Piranguinho','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2842,'3151107','Pirapetinga','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2843,'3151206','Pirapora','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2844,'3151305','Piraúba','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2845,'3151404','Pitangui','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2846,'3151503','Piumhi','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2847,'3151602','Planura','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2848,'3151701','Poço Fundo','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2849,'3151800','Poços de Caldas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2850,'3151909','Pocrane','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2851,'3152006','Pompeu','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2852,'3152105','Ponte Nova','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2853,'3152131','Ponto Chique','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2854,'3152170','Ponto dos Volantes','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2855,'3152204','Porteirinha','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2856,'3152303','Porto Firme','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2857,'3152402','Pote','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2858,'3152501','Pouso Alegre','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2859,'3152600','Pouso Alto','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2860,'3152709','Prados','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2861,'3152808','Prata','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2862,'3152907','Pratapolis','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2863,'3153004','Pratinha','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2864,'3153103','Presidente Bernardes','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2865,'3153202','Presidente Juscelino','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2866,'3153301','Presidente Kubitschek','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2867,'3153400','Presidente Olegario','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2868,'3153509','Alto Jequitiba','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2869,'3153608','Prudente de Morais','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2870,'3153707','Quartel Geral','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2871,'3153806','Queluzito','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2872,'3153905','Raposos','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2873,'3154002','Raul Soares','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2874,'3154101','Recreio','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2875,'3154150','Reduto','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2876,'3154200','Resende Costa','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2877,'3154309','Resplendor','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2878,'3154408','Ressaquinha','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2879,'3154457','Riachinho','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2880,'3154507','Riacho dos Machados','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2881,'3154606','Ribeirao das Neves','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2882,'3154705','Ribeirao Vermelho','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2883,'3154804','Rio Acima','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2884,'3154903','Rio Casca','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2885,'3155009','Rio Doce','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2886,'3155108','Rio do Prado','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2887,'3155207','Rio Espera','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2888,'3155306','Rio Manso','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2889,'3155405','Rio Novo','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2890,'3155504','Rio Paranaiba','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2891,'3155603','Rio Pardo de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2892,'3155702','Rio Piracicaba','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2893,'3155801','Rio Pomba','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2894,'3155900','Rio Preto','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2895,'3156007','Rio Vermelho','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2896,'3156106','Ritapolis','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2897,'3156205','Rochedo de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2898,'3156304','Rodeiro','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2899,'3156403','Romaria','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2900,'3156452','Rosario da Limeira','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2901,'3156502','Rubelita','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2902,'3156601','Rubim','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2903,'3156700','Sabara','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2904,'3156809','Sabinopolis','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2905,'3156908','Sacramento','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2906,'3157005','Salinas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2907,'3157104','Salto da Divisa','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2908,'3157203','Santa Barbara','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2909,'3157252','Santa Barbara do Leste','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2910,'3157278','Santa Barbara do Monte Verde','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2911,'3157302','Santa Barbara do Tugúrio','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2912,'3157336','Santa Cruz de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2913,'3157377','Santa Cruz de Salinas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2914,'3157401','Santa Cruz do Escalvado','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2915,'3157500','Santa Efigênia de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2916,'3157609','Santa Fe de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2917,'3157658','Santa Helena de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2918,'3157708','Santa Juliana','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2919,'3157807','Santa Luzia','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2920,'3157906','Santa Margarida','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2921,'3158003','Santa Maria de Itabira','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2922,'3158102','Santa Maria do Salto','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2923,'3158201','Santa Maria do Suaçui','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2924,'3158300','Santana da Vargem','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2925,'3158409','Santana de Cataguases','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2926,'3158508','Santana de Pirapama','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2927,'3158607','Santana do Deserto','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2928,'3158706','Santana do Garambeu','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2929,'3158805','Santana do Jacare','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2930,'3158904','Santana do Manhuaçu','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2931,'3158953','Santana do Paraiso','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2932,'3159001','Santana do Riacho','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2933,'3159100','Santana dos Montes','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2934,'3159209','Santa Rita de Caldas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2935,'3159308','Santa Rita de Jacutinga','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2936,'3159357','Santa Rita de Minas','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2937,'3159407','Santa Rita de Ibitipoca','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2938,'3159506','Santa Rita do Itueto','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2939,'3159605','Santa Rita do Sapucai','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2940,'3159704','Santa Rosa da Serra','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2941,'3159803','Santa Vitoria','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2942,'3159902','Santo Antônio do Amparo','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2943,'3160009','Santo Antônio do Aventureiro','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2944,'3160108','Santo Antônio do Grama','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2945,'3160207','Santo Antônio do Itambe','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2946,'3160306','Santo Antônio do Jacinto','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2947,'3160405','Santo Antônio do Monte','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2948,'3160454','Santo Antônio do Retiro','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2949,'3160504','Santo Antônio do Rio Abaixo','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2950,'3160603','Santo Hipolito','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2951,'3160702','Santos Dumont','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2952,'3160801','Sao Bento Abade','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2953,'3160900','Sao Bras do Suaçui','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2954,'3160959','Sao Domingos das Dores','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2955,'3161007','Sao Domingos do Prata','MG','2024-07-03 11:37:15','2024-07-03 11:37:15'),(2956,'3161056','Sao Felix de Minas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2957,'3161106','Sao Francisco','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2958,'3161205','Sao Francisco de Paula','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2959,'3161304','Sao Francisco de Sales','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2960,'3161403','Sao Francisco do Gloria','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2961,'3161502','Sao Geraldo','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2962,'3161601','Sao Geraldo da Piedade','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2963,'3161650','Sao Geraldo do Baixio','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2964,'3161700','Sao Gonçalo do Abaete','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2965,'3161809','Sao Gonçalo do Para','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2966,'3161908','Sao Gonçalo do Rio Abaixo','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2967,'3162005','Sao Gonçalo do Sapucai','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2968,'3162104','Sao Gotardo','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2969,'3162203','Sao Joao Batista do Gloria','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2970,'3162252','Sao Joao da Lagoa','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2971,'3162302','Sao Joao da Mata','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2972,'3162401','Sao Joao da Ponte','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2973,'3162450','Sao Joao das Missões','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2974,'3162500','Sao Joao del Rei','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2975,'3162559','Sao Joao do Manhuaçu','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2976,'3162575','Sao Joao do Manteninha','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2977,'3162609','Sao Joao do Oriente','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2978,'3162658','Sao Joao do Pacui','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2979,'3162708','Sao Joao do Paraiso','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2980,'3162807','Sao Joao Evangelista','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2981,'3162906','Sao Joao Nepomuceno','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2982,'3162922','Sao Joaquim de Bicas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2983,'3162948','Sao Jose da Barra','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2984,'3162955','Sao Jose da Lapa','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2985,'3163003','Sao Jose da Safira','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2986,'3163102','Sao Jose da Varginha','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2987,'3163201','Sao Jose do Alegre','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2988,'3163300','Sao Jose do Divino','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2989,'3163409','Sao Jose do Goiabal','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2990,'3163508','Sao Jose do Jacuri','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2991,'3163607','Sao Jose do Mantimento','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2992,'3163706','Sao Lourenço','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2993,'3163805','Sao Miguel do Anta','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2994,'3163904','Sao Pedro da Uniao','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2995,'3164001','Sao Pedro dos Ferros','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2996,'3164100','Sao Pedro do Suaçui','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2997,'3164209','Sao Romao','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2998,'3164308','Sao Roque de Minas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(2999,'3164407','Sao Sebastiao da Bela Vista','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3000,'3164431','Sao Sebastiao da Vargem Alegre','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3001,'3164472','Sao Sebastiao do Anta','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3002,'3164506','Sao Sebastiao do Maranhao','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3003,'3164605','Sao Sebastiao do Oeste','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3004,'3164704','Sao Sebastiao do Paraiso','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3005,'3164803','Sao Sebastiao do Rio Preto','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3006,'3164902','Sao Sebastiao do Rio Verde','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3007,'3165008','Sao Tiago','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3008,'3165107','Sao Tomas de Aquino','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3009,'3165206','Sao Thome das Letras','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3010,'3165305','Sao Vicente de Minas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3011,'3165404','Sapucai-Mirim','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3012,'3165503','Sardoa','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3013,'3165537','Sarzedo','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3014,'3165552','Setubinha','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3015,'3165560','Sem-Peixe','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3016,'3165578','Senador Amaral','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3017,'3165602','Senador Cortes','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3018,'3165701','Senador Firmino','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3019,'3165800','Senador Jose Bento','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3020,'3165909','Senador Modestino Gonçalves','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3021,'3166006','Senhora de Oliveira','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3022,'3166105','Senhora do Porto','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3023,'3166204','Senhora dos Remedios','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3024,'3166303','Sericita','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3025,'3166402','Seritinga','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3026,'3166501','Serra Azul de Minas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3027,'3166600','Serra da Saudade','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3028,'3166709','Serra dos Aimores','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3029,'3166808','Serra do Salitre','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3030,'3166907','Serrania','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3031,'3166956','Serranopolis de Minas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3032,'3167004','Serranos','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3033,'3167103','Serro','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3034,'3167202','Sete Lagoas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3035,'3167301','Silveirânia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3036,'3167400','Silvianopolis','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3037,'3167509','Simao Pereira','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3038,'3167608','Simonesia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3039,'3167707','Sobralia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3040,'3167806','Soledade de Minas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3041,'3167905','Tabuleiro','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3042,'3168002','Taiobeiras','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3043,'3168051','Taparuba','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3044,'3168101','Tapira','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3045,'3168200','Tapirai','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3046,'3168309','Taquaraçu de Minas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3047,'3168408','Tarumirim','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3048,'3168507','Teixeiras','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3049,'3168606','Teofilo Otoni','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3050,'3168705','Timoteo','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3051,'3168804','Tiradentes','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3052,'3168903','Tiros','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3053,'3169000','Tocantins','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3054,'3169059','Tocos do Moji','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3055,'3169109','Toledo','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3056,'3169208','Tombos','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3057,'3169307','Três Corações','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3058,'3169356','Três Marias','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3059,'3169406','Três Pontas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3060,'3169505','Tumiritinga','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3061,'3169604','Tupaciguara','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3062,'3169703','Turmalina','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3063,'3169802','Turvolândia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3064,'3169901','Uba','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3065,'3170008','Ubai','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3066,'3170057','Ubaporanga','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3067,'3170107','Uberaba','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3068,'3170206','Uberlândia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3069,'3170305','Umburatiba','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3070,'3170404','Unai','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3071,'3170438','Uniao de Minas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3072,'3170479','Uruana de Minas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3073,'3170503','Urucânia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3074,'3170529','Urucuia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3075,'3170578','Vargem Alegre','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3076,'3170602','Vargem Bonita','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3077,'3170651','Vargem Grande do Rio Pardo','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3078,'3170701','Varginha','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3079,'3170750','Varjao de Minas','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3080,'3170800','Varzea da Palma','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3081,'3170909','Varzelândia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3082,'3171006','Vazante','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3083,'3171030','Verdelândia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3084,'3171071','Veredinha','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3085,'3171105','Verissimo','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3086,'3171154','Vermelho Novo','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3087,'3171204','Vespasiano','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3088,'3171303','Viçosa','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3089,'3171402','Vieiras','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3090,'3171501','Mathias Lobato','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3091,'3171600','Virgem da Lapa','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3092,'3171709','Virginia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3093,'3171808','Virginopolis','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3094,'3171907','Virgolândia','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3095,'3172004','Visconde do Rio Branco','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3096,'3172103','Volta Grande','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3097,'3172202','Wenceslau Braz','MG','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3098,'3200102','Afonso Claudio','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3099,'3200136','aguia Branca','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3100,'3200169','agua Doce do Norte','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3101,'3200201','Alegre','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3102,'3200300','Alfredo Chaves','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3103,'3200359','Alto Rio Novo','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3104,'3200409','Anchieta','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3105,'3200508','Apiaca','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3106,'3200607','Aracruz','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3107,'3200706','Atilio Vivacqua','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3108,'3200805','Baixo Guandu','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3109,'3200904','Barra de Sao Francisco','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3110,'3201001','Boa Esperança','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3111,'3201100','Bom Jesus do Norte','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3112,'3201159','Brejetuba','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3113,'3201209','Cachoeiro de Itapemirim','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3114,'3201308','Cariacica','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3115,'3201407','Castelo','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3116,'3201506','Colatina','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3117,'3201605','Conceiçao da Barra','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3118,'3201704','Conceiçao do Castelo','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3119,'3201803','Divino de Sao Lourenço','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3120,'3201902','Domingos Martins','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3121,'3202009','Dores do Rio Preto','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3122,'3202108','Ecoporanga','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3123,'3202207','Fundao','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3124,'3202256','Governador Lindenberg','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3125,'3202306','Guaçui','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3126,'3202405','Guarapari','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3127,'3202454','Ibatiba','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3128,'3202504','Ibiraçu','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3129,'3202553','Ibitirama','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3130,'3202603','Iconha','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3131,'3202652','Irupi','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3132,'3202702','Itaguaçu','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3133,'3202801','Itapemirim','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3134,'3202900','Itarana','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3135,'3203007','Iúna','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3136,'3203056','Jaguare','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3137,'3203106','Jerônimo Monteiro','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3138,'3203130','Joao Neiva','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3139,'3203163','Laranja da Terra','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3140,'3203205','Linhares','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3141,'3203304','Mantenopolis','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3142,'3203320','Marataizes','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3143,'3203346','Marechal Floriano','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3144,'3203353','Marilândia','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3145,'3203403','Mimoso do Sul','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3146,'3203502','Montanha','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3147,'3203601','Mucurici','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3148,'3203700','Muniz Freire','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3149,'3203809','Muqui','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3150,'3203908','Nova Venecia','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3151,'3204005','Pancas','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3152,'3204054','Pedro Canario','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3153,'3204104','Pinheiros','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3154,'3204203','Piúma','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3155,'3204252','Ponto Belo','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3156,'3204302','Presidente Kennedy','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3157,'3204351','Rio Bananal','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3158,'3204401','Rio Novo do Sul','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3159,'3204500','Santa Leopoldina','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3160,'3204559','Santa Maria de Jetiba','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3161,'3204609','Santa Teresa','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3162,'3204658','Sao Domingos do Norte','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3163,'3204708','Sao Gabriel da Palha','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3164,'3204807','Sao Jose do Calçado','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3165,'3204906','Sao Mateus','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3166,'3204955','Sao Roque do Canaa','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3167,'3205002','Serra','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3168,'3205010','Sooretama','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3169,'3205036','Vargem Alta','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3170,'3205069','Venda Nova do Imigrante','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3171,'3205101','Viana','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3172,'3205150','Vila Pavao','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3173,'3205176','Vila Valerio','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3174,'3205200','Vila Velha','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3175,'3205309','Vitoria','ES','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3176,'3300100','Angra dos Reis','RJ','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3177,'3300159','Aperibe','RJ','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3178,'3300209','Araruama','RJ','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3179,'3300225','Areal','RJ','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3180,'3300233','Armaçao dos Búzios','RJ','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3181,'3300258','Arraial do Cabo','RJ','2024-07-03 11:37:16','2024-07-03 11:37:16'),(3182,'3300308','Barra do Pirai','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3183,'3300407','Barra Mansa','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3184,'3300456','Belford Roxo','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3185,'3300506','Bom Jardim','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3186,'3300605','Bom Jesus do Itabapoana','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3187,'3300704','Cabo Frio','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3188,'3300803','Cachoeiras de Macacu','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3189,'3300902','Cambuci','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3190,'3300936','Carapebus','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3191,'3300951','Comendador Levy Gasparian','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3192,'3301009','Campos dos Goytacazes','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3193,'3301108','Cantagalo','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3194,'3301157','Cardoso Moreira','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3195,'3301207','Carmo','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3196,'3301306','Casimiro de Abreu','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3197,'3301405','Conceiçao de Macabu','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3198,'3301504','Cordeiro','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3199,'3301603','Duas Barras','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3200,'3301702','Duque de Caxias','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3201,'3301801','Engenheiro Paulo de Frontin','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3202,'3301850','Guapimirim','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3203,'3301876','Iguaba Grande','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3204,'3301900','Itaborai','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3205,'3302007','Itaguai','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3206,'3302056','Italva','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3207,'3302106','Itaocara','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3208,'3302205','Itaperuna','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3209,'3302254','Itatiaia','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3210,'3302270','Japeri','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3211,'3302304','Laje do Muriae','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3212,'3302403','Macae','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3213,'3302452','Macuco','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3214,'3302502','Mage','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3215,'3302601','Mangaratiba','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3216,'3302700','Marica','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3217,'3302809','Mendes','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3218,'3302858','Mesquita','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3219,'3302908','Miguel Pereira','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3220,'3303005','Miracema','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3221,'3303104','Natividade','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3222,'3303203','Nilopolis','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3223,'3303302','Niteroi','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3224,'3303401','Nova Friburgo','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3225,'3303500','Nova Iguaçu','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3226,'3303609','Paracambi','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3227,'3303708','Paraiba do Sul','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3228,'3303807','Paraty','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3229,'3303856','Paty do Alferes','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3230,'3303906','Petropolis','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3231,'3303955','Pinheiral','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3232,'3304003','Pirai','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3233,'3304102','Porciúncula','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3234,'3304110','Porto Real','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3235,'3304128','Quatis','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3236,'3304144','Queimados','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3237,'3304151','Quissama','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3238,'3304201','Resende','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3239,'3304300','Rio Bonito','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3240,'3304409','Rio Claro','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3241,'3304508','Rio das Flores','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3242,'3304524','Rio das Ostras','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3243,'3304557','Rio de Janeiro','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3244,'3304607','Santa Maria Madalena','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3245,'3304706','Santo Antônio de Padua','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3246,'3304755','Sao Francisco de Itabapoana','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3247,'3304805','Sao Fidelis','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3248,'3304904','Sao Gonçalo','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3249,'3305000','Sao Joao da Barra','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3250,'3305109','Sao Joao de Meriti','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3251,'3305133','Sao Jose de Uba','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3252,'3305158','Sao Jose do Vale do Rio Preto','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3253,'3305208','Sao Pedro da Aldeia','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3254,'3305307','Sao Sebastiao do Alto','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3255,'3305406','Sapucaia','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3256,'3305505','Saquarema','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3257,'3305554','Seropedica','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3258,'3305604','Silva Jardim','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3259,'3305703','Sumidouro','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3260,'3305752','Tangua','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3261,'3305802','Teresopolis','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3262,'3305901','Trajano de Moraes','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3263,'3306008','Três Rios','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3264,'3306107','Valença','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3265,'3306156','Varre-Sai','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3266,'3306206','Vassouras','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3267,'3306305','Volta Redonda','RJ','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3268,'3500105','Adamantina','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3269,'3500204','Adolfo','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3270,'3500303','Aguai','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3271,'3500402','aguas da Prata','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3272,'3500501','aguas de Lindoia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3273,'3500550','aguas de Santa Barbara','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3274,'3500600','aguas de Sao Pedro','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3275,'3500709','Agudos','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3276,'3500758','Alambari','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3277,'3500808','Alfredo Marcondes','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3278,'3500907','Altair','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3279,'3501004','Altinopolis','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3280,'3501103','Alto Alegre','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3281,'3501152','Aluminio','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3282,'3501202','alvares Florence','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3283,'3501301','alvares Machado','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3284,'3501400','alvaro de Carvalho','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3285,'3501509','Alvinlândia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3286,'3501608','Americana','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3287,'3501707','Americo Brasiliense','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3288,'3501806','Americo de Campos','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3289,'3501905','Amparo','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3290,'3502002','Analândia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3291,'3502101','Andradina','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3292,'3502200','Angatuba','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3293,'3502309','Anhembi','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3294,'3502408','Anhumas','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3295,'3502507','Aparecida','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3296,'3502606','Aparecida D\'Oeste','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3297,'3502705','Apiai','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3298,'3502754','Araçariguama','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3299,'3502804','Araçatuba','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3300,'3502903','Araçoiaba da Serra','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3301,'3503000','Aramina','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3302,'3503109','Arandu','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3303,'3503158','Arapei','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3304,'3503208','Araraquara','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3305,'3503307','Araras','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3306,'3503356','Arco-iris','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3307,'3503406','Arealva','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3308,'3503505','Areias','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3309,'3503604','Areiopolis','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3310,'3503703','Ariranha','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3311,'3503802','Artur Nogueira','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3312,'3503901','Aruja','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3313,'3503950','Aspasia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3314,'3504008','Assis','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3315,'3504107','Atibaia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3316,'3504206','Auriflama','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3317,'3504305','Avai','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3318,'3504404','Avanhandava','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3319,'3504503','Avare','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3320,'3504602','Bady Bassitt','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3321,'3504701','Balbinos','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3322,'3504800','Balsamo','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3323,'3504909','Bananal','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3324,'3505005','Barao de Antonina','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3325,'3505104','Barbosa','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3326,'3505203','Bariri','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3327,'3505302','Barra Bonita','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3328,'3505351','Barra do Chapeu','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3329,'3505401','Barra do Turvo','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3330,'3505500','Barretos','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3331,'3505609','Barrinha','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3332,'3505708','Barueri','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3333,'3505807','Bastos','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3334,'3505906','Batatais','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3335,'3506003','Bauru','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3336,'3506102','Bebedouro','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3337,'3506201','Bento de Abreu','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3338,'3506300','Bernardino de Campos','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3339,'3506359','Bertioga','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3340,'3506409','Bilac','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3341,'3506508','Birigui','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3342,'3506607','Biritiba-Mirim','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3343,'3506706','Boa Esperança do Sul','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3344,'3506805','Bocaina','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3345,'3506904','Bofete','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3346,'3507001','Boituva','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3347,'3507100','Bom Jesus dos Perdões','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3348,'3507159','Bom Sucesso de Itarare','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3349,'3507209','Bora','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3350,'3507308','Boraceia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3351,'3507407','Borborema','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3352,'3507456','Borebi','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3353,'3507506','Botucatu','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3354,'3507605','Bragança Paulista','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3355,'3507704','Braúna','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3356,'3507753','Brejo Alegre','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3357,'3507803','Brodowski','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3358,'3507902','Brotas','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3359,'3508009','Buri','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3360,'3508108','Buritama','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3361,'3508207','Buritizal','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3362,'3508306','Cabralia Paulista','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3363,'3508405','Cabreúva','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3364,'3508504','Caçapava','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3365,'3508603','Cachoeira Paulista','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3366,'3508702','Caconde','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3367,'3508801','Cafelândia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3368,'3508900','Caiabu','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3369,'3509007','Caieiras','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3370,'3509106','Caiua','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3371,'3509205','Cajamar','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3372,'3509254','Cajati','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3373,'3509304','Cajobi','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3374,'3509403','Cajuru','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3375,'3509452','Campina do Monte Alegre','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3376,'3509502','Campinas','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3377,'3509601','Campo Limpo Paulista','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3378,'3509700','Campos do Jordao','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3379,'3509809','Campos Novos Paulista','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3380,'3509908','Cananeia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3381,'3509957','Canas','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3382,'3510005','Cândido Mota','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3383,'3510104','Cândido Rodrigues','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3384,'3510153','Canitar','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3385,'3510203','Capao Bonito','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3386,'3510302','Capela do Alto','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3387,'3510401','Capivari','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3388,'3510500','Caraguatatuba','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3389,'3510609','Carapicuiba','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3390,'3510708','Cardoso','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3391,'3510807','Casa Branca','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3392,'3510906','Cassia dos Coqueiros','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3393,'3511003','Castilho','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3394,'3511102','Catanduva','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3395,'3511201','Catigua','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3396,'3511300','Cedral','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3397,'3511409','Cerqueira Cesar','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3398,'3511508','Cerquilho','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3399,'3511607','Cesario Lange','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3400,'3511706','Charqueada','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3401,'3511904','Clementina','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3402,'3512001','Colina','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3403,'3512100','Colômbia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3404,'3512209','Conchal','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3405,'3512308','Conchas','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3406,'3512407','Cordeiropolis','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3407,'3512506','Coroados','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3408,'3512605','Coronel Macedo','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3409,'3512704','Corumbatai','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3410,'3512803','Cosmopolis','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3411,'3512902','Cosmorama','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3412,'3513009','Cotia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3413,'3513108','Cravinhos','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3414,'3513207','Cristais Paulista','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3415,'3513306','Cruzalia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3416,'3513405','Cruzeiro','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3417,'3513504','Cubatao','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3418,'3513603','Cunha','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3419,'3513702','Descalvado','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3420,'3513801','Diadema','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3421,'3513850','Dirce Reis','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3422,'3513900','Divinolândia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3423,'3514007','Dobrada','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3424,'3514106','Dois Corregos','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3425,'3514205','Dolcinopolis','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3426,'3514304','Dourado','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3427,'3514403','Dracena','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3428,'3514502','Duartina','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3429,'3514601','Dumont','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3430,'3514700','Echapora','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3431,'3514809','Eldorado','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3432,'3514908','Elias Fausto','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3433,'3514924','Elisiario','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3434,'3514957','Embaúba','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3435,'3515004','Embu das Artes','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3436,'3515103','Embu-Guaçu','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3437,'3515129','Emilianopolis','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3438,'3515152','Engenheiro Coelho','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3439,'3515186','Espirito Santo do Pinhal','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3440,'3515194','Espirito Santo do Turvo','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3441,'3515202','Estrela D\'Oeste','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3442,'3515301','Estrela do Norte','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3443,'3515350','Euclides da Cunha Paulista','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3444,'3515400','Fartura','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3445,'3515509','Fernandopolis','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3446,'3515608','Fernando Prestes','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3447,'3515657','Fernao','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3448,'3515707','Ferraz de Vasconcelos','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3449,'3515806','Flora Rica','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3450,'3515905','Floreal','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3451,'3516002','Florida Paulista','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3452,'3516101','Florinia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3453,'3516200','Franca','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3454,'3516309','Francisco Morato','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3455,'3516408','Franco da Rocha','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3456,'3516507','Gabriel Monteiro','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3457,'3516606','Galia','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3458,'3516705','Garça','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3459,'3516804','Gastao Vidigal','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3460,'3516853','Gaviao Peixoto','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3461,'3516903','General Salgado','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3462,'3517000','Getulina','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3463,'3517109','Glicerio','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3464,'3517208','Guaiçara','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3465,'3517307','Guaimbê','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3466,'3517406','Guaira','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3467,'3517505','Guapiaçu','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3468,'3517604','Guapiara','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3469,'3517703','Guara','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3470,'3517802','Guaraçai','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3471,'3517901','Guaraci','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3472,'3518008','Guarani D\'Oeste','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3473,'3518107','Guaranta','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3474,'3518206','Guararapes','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3475,'3518305','Guararema','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3476,'3518404','Guaratingueta','SP','2024-07-03 11:37:17','2024-07-03 11:37:17'),(3477,'3518503','Guarei','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3478,'3518602','Guariba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3479,'3518701','Guaruja','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3480,'3518800','Guarulhos','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3481,'3518859','Guatapara','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3482,'3518909','Guzolândia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3483,'3519006','Herculândia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3484,'3519055','Holambra','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3485,'3519071','Hortolândia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3486,'3519105','Iacanga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3487,'3519204','Iacri','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3488,'3519253','Iaras','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3489,'3519303','Ibate','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3490,'3519402','Ibira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3491,'3519501','Ibirarema','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3492,'3519600','Ibitinga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3493,'3519709','Ibiúna','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3494,'3519808','Icem','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3495,'3519907','Iepê','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3496,'3520004','Igaraçu do Tietê','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3497,'3520103','Igarapava','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3498,'3520202','Igarata','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3499,'3520301','Iguape','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3500,'3520400','Ilhabela','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3501,'3520426','Ilha Comprida','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3502,'3520442','Ilha Solteira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3503,'3520509','Indaiatuba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3504,'3520608','Indiana','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3505,'3520707','Indiapora','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3506,'3520806','Inúbia Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3507,'3520905','Ipaussu','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3508,'3521002','Ipero','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3509,'3521101','Ipeúna','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3510,'3521150','Ipigua','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3511,'3521200','Iporanga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3512,'3521309','Ipua','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3513,'3521408','Iracemapolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3514,'3521507','Irapua','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3515,'3521606','Irapuru','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3516,'3521705','Itabera','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3517,'3521804','Itai','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3518,'3521903','Itajobi','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3519,'3522000','Itaju','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3520,'3522109','Itanhaem','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3521,'3522158','Itaoca','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3522,'3522208','Itapecerica da Serra','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3523,'3522307','Itapetininga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3524,'3522406','Itapeva','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3525,'3522505','Itapevi','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3526,'3522604','Itapira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3527,'3522653','Itapirapua Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3528,'3522703','Itapolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3529,'3522802','Itaporanga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3530,'3522901','Itapui','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3531,'3523008','Itapura','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3532,'3523107','Itaquaquecetuba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3533,'3523206','Itarare','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3534,'3523305','Itariri','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3535,'3523404','Itatiba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3536,'3523503','Itatinga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3537,'3523602','Itirapina','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3538,'3523701','Itirapua','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3539,'3523800','Itobi','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3540,'3523909','Itu','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3541,'3524006','Itupeva','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3542,'3524105','Ituverava','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3543,'3524204','Jaborandi','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3544,'3524303','Jaboticabal','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3545,'3524402','Jacarei','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3546,'3524501','Jaci','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3547,'3524600','Jacupiranga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3548,'3524709','Jaguariúna','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3549,'3524808','Jales','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3550,'3524907','Jambeiro','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3551,'3525003','Jandira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3552,'3525102','Jardinopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3553,'3525201','Jarinu','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3554,'3525300','Jaú','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3555,'3525409','Jeriquara','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3556,'3525508','Joanopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3557,'3525607','Joao Ramalho','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3558,'3525706','Jose Bonifacio','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3559,'3525805','Júlio Mesquita','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3560,'3525854','Jumirim','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3561,'3525904','Jundiai','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3562,'3526001','Junqueiropolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3563,'3526100','Juquia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3564,'3526209','Juquitiba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3565,'3526308','Lagoinha','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3566,'3526407','Laranjal Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3567,'3526506','Lavinia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3568,'3526605','Lavrinhas','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3569,'3526704','Leme','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3570,'3526803','Lençois Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3571,'3526902','Limeira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3572,'3527009','Lindoia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3573,'3527108','Lins','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3574,'3527207','Lorena','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3575,'3527256','Lourdes','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3576,'3527306','Louveira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3577,'3527405','Lucelia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3578,'3527504','Lucianopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3579,'3527603','Luis Antônio','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3580,'3527702','Luiziânia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3581,'3527801','Lupercio','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3582,'3527900','Lutecia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3583,'3528007','Macatuba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3584,'3528106','Macaubal','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3585,'3528205','Macedônia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3586,'3528304','Magda','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3587,'3528403','Mairinque','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3588,'3528502','Mairipora','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3589,'3528601','Manduri','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3590,'3528700','Maraba Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3591,'3528809','Maracai','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3592,'3528858','Marapoama','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3593,'3528908','Mariapolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3594,'3529005','Marilia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3595,'3529104','Marinopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3596,'3529203','Martinopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3597,'3529302','Matao','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3598,'3529401','Maua','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3599,'3529500','Mendonça','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3600,'3529609','Meridiano','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3601,'3529658','Mesopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3602,'3529708','Miguelopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3603,'3529807','Mineiros do Tietê','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3604,'3529906','Miracatu','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3605,'3530003','Mira Estrela','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3606,'3530102','Mirandopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3607,'3530201','Mirante do Paranapanema','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3608,'3530300','Mirassol','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3609,'3530409','Mirassolândia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3610,'3530508','Mococa','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3611,'3530607','Mogi das Cruzes','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3612,'3530706','Mogi Guaçu','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3613,'3530805','Moji Mirim','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3614,'3530904','Mombuca','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3615,'3531001','Monções','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3616,'3531100','Mongagua','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3617,'3531209','Monte Alegre do Sul','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3618,'3531308','Monte Alto','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3619,'3531407','Monte Aprazivel','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3620,'3531506','Monte Azul Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3621,'3531605','Monte Castelo','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3622,'3531704','Monteiro Lobato','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3623,'3531803','Monte Mor','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3624,'3531902','Morro Agudo','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3625,'3532009','Morungaba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3626,'3532058','Motuca','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3627,'3532108','Murutinga do Sul','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3628,'3532157','Nantes','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3629,'3532207','Narandiba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3630,'3532306','Natividade da Serra','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3631,'3532405','Nazare Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3632,'3532504','Neves Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3633,'3532603','Nhandeara','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3634,'3532702','Nipoa','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3635,'3532801','Nova Aliança','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3636,'3532827','Nova Campina','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3637,'3532843','Nova Canaa Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3638,'3532868','Nova Castilho','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3639,'3532900','Nova Europa','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3640,'3533007','Nova Granada','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3641,'3533106','Nova Guataporanga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3642,'3533205','Nova Independência','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3643,'3533254','Novais','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3644,'3533304','Nova Luzitânia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3645,'3533403','Nova Odessa','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3646,'3533502','Novo Horizonte','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3647,'3533601','Nuporanga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3648,'3533700','Ocauçu','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3649,'3533809','oleo','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3650,'3533908','Olimpia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3651,'3534005','Onda Verde','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3652,'3534104','Oriente','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3653,'3534203','Orindiúva','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3654,'3534302','Orlândia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3655,'3534401','Osasco','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3656,'3534500','Oscar Bressane','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3657,'3534609','Osvaldo Cruz','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3658,'3534708','Ourinhos','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3659,'3534757','Ouroeste','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3660,'3534807','Ouro Verde','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3661,'3534906','Pacaembu','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3662,'3535002','Palestina','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3663,'3535101','Palmares Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3664,'3535200','Palmeira D\'Oeste','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3665,'3535309','Palmital','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3666,'3535408','Panorama','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3667,'3535507','Paraguaçu Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3668,'3535606','Paraibuna','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3669,'3535705','Paraiso','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3670,'3535804','Paranapanema','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3671,'3535903','Paranapua','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3672,'3536000','Parapua','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3673,'3536109','Pardinho','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3674,'3536208','Pariquera-Açu','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3675,'3536257','Parisi','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3676,'3536307','Patrocinio Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3677,'3536406','Pauliceia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3678,'3536505','Paulinia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3679,'3536570','Paulistânia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3680,'3536604','Paulo de Faria','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3681,'3536703','Pederneiras','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3682,'3536802','Pedra Bela','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3683,'3536901','Pedranopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3684,'3537008','Pedregulho','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3685,'3537107','Pedreira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3686,'3537156','Pedrinhas Paulista','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3687,'3537206','Pedro de Toledo','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3688,'3537305','Penapolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3689,'3537404','Pereira Barreto','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3690,'3537503','Pereiras','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3691,'3537602','Peruibe','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3692,'3537701','Piacatu','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3693,'3537800','Piedade','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3694,'3537909','Pilar do Sul','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3695,'3538006','Pindamonhangaba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3696,'3538105','Pindorama','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3697,'3538204','Pinhalzinho','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3698,'3538303','Piquerobi','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3699,'3538501','Piquete','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3700,'3538600','Piracaia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3701,'3538709','Piracicaba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3702,'3538808','Piraju','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3703,'3538907','Pirajui','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3704,'3539004','Pirangi','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3705,'3539103','Pirapora do Bom Jesus','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3706,'3539202','Pirapozinho','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3707,'3539301','Pirassununga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3708,'3539400','Piratininga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3709,'3539509','Pitangueiras','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3710,'3539608','Planalto','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3711,'3539707','Platina','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3712,'3539806','Poa','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3713,'3539905','Poloni','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3714,'3540002','Pompeia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3715,'3540101','Pongai','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3716,'3540200','Pontal','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3717,'3540259','Pontalinda','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3718,'3540309','Pontes Gestal','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3719,'3540408','Populina','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3720,'3540507','Porangaba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3721,'3540606','Porto Feliz','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3722,'3540705','Porto Ferreira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3723,'3540754','Potim','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3724,'3540804','Potirendaba','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3725,'3540853','Pracinha','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3726,'3540903','Pradopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3727,'3541000','Praia Grande','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3728,'3541059','Pratânia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3729,'3541109','Presidente Alves','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3730,'3541208','Presidente Bernardes','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3731,'3541307','Presidente Epitacio','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3732,'3541406','Presidente Prudente','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3733,'3541505','Presidente Venceslau','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3734,'3541604','Promissao','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3735,'3541653','Quadra','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3736,'3541703','Quata','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3737,'3541802','Queiroz','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3738,'3541901','Queluz','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3739,'3542008','Quintana','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3740,'3542107','Rafard','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3741,'3542206','Rancharia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3742,'3542305','Redençao da Serra','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3743,'3542404','Regente Feijo','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3744,'3542503','Reginopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3745,'3542602','Registro','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3746,'3542701','Restinga','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3747,'3542800','Ribeira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3748,'3542909','Ribeirao Bonito','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3749,'3543006','Ribeirao Branco','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3750,'3543105','Ribeirao Corrente','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3751,'3543204','Ribeirao do Sul','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3752,'3543238','Ribeirao dos indios','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3753,'3543253','Ribeirao Grande','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3754,'3543303','Ribeirao Pires','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3755,'3543402','Ribeirao Preto','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3756,'3543501','Riversul','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3757,'3543600','Rifaina','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3758,'3543709','Rincao','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3759,'3543808','Rinopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3760,'3543907','Rio Claro','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3761,'3544004','Rio das Pedras','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3762,'3544103','Rio Grande da Serra','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3763,'3544202','Riolândia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3764,'3544251','Rosana','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3765,'3544301','Roseira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3766,'3544400','Rubiacea','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3767,'3544509','Rubineia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3768,'3544608','Sabino','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3769,'3544707','Sagres','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3770,'3544806','Sales','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3771,'3544905','Sales Oliveira','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3772,'3545001','Salesopolis','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3773,'3545100','Salmourao','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3774,'3545159','Saltinho','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3775,'3545209','Salto','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3776,'3545308','Salto de Pirapora','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3777,'3545407','Salto Grande','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3778,'3545506','Sandovalina','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3779,'3545605','Santa Adelia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3780,'3545704','Santa Albertina','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3781,'3545803','Santa Barbara D\'Oeste','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3782,'3546009','Santa Branca','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3783,'3546108','Santa Clara D\'Oeste','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3784,'3546207','Santa Cruz da Conceiçao','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3785,'3546256','Santa Cruz da Esperança','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3786,'3546306','Santa Cruz das Palmeiras','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3787,'3546405','Santa Cruz do Rio Pardo','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3788,'3546504','Santa Ernestina','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3789,'3546603','Santa Fe do Sul','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3790,'3546702','Santa Gertrudes','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3791,'3546801','Santa Isabel','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3792,'3546900','Santa Lúcia','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3793,'3547007','Santa Maria da Serra','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3794,'3547106','Santa Mercedes','SP','2024-07-03 11:37:18','2024-07-03 11:37:18'),(3795,'3547205','Santana da Ponte Pensa','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3796,'3547304','Santana de Parnaiba','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3797,'3547403','Santa Rita D\'Oeste','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3798,'3547502','Santa Rita do Passa Quatro','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3799,'3547601','Santa Rosa de Viterbo','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3800,'3547650','Santa Salete','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3801,'3547700','Santo Anastacio','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3802,'3547809','Santo Andre','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3803,'3547908','Santo Antônio da Alegria','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3804,'3548005','Santo Antônio de Posse','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3805,'3548054','Santo Antônio do Aracangua','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3806,'3548104','Santo Antônio do Jardim','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3807,'3548203','Santo Antônio do Pinhal','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3808,'3548302','Santo Expedito','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3809,'3548401','Santopolis do Aguapei','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3810,'3548500','Santos','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3811,'3548609','Sao Bento do Sapucai','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3812,'3548708','Sao Bernardo do Campo','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3813,'3548807','Sao Caetano do Sul','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3814,'3548906','Sao Carlos','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3815,'3549003','Sao Francisco','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3816,'3549102','Sao Joao da Boa Vista','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3817,'3549201','Sao Joao das Duas Pontes','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3818,'3549250','Sao Joao de Iracema','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3819,'3549300','Sao Joao do Pau D\'Alho','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3820,'3549409','Sao Joaquim da Barra','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3821,'3549508','Sao Jose da Bela Vista','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3822,'3549607','Sao Jose do Barreiro','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3823,'3549706','Sao Jose do Rio Pardo','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3824,'3549805','Sao Jose do Rio Preto','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3825,'3549904','Sao Jose dos Campos','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3826,'3549953','Sao Lourenço da Serra','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3827,'3550001','Sao Luis do Paraitinga','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3828,'3550100','Sao Manuel','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3829,'3550209','Sao Miguel Arcanjo','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3830,'3550308','Sao Paulo','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3831,'3550407','Sao Pedro','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3832,'3550506','Sao Pedro do Turvo','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3833,'3550605','Sao Roque','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3834,'3550704','Sao Sebastiao','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3835,'3550803','Sao Sebastiao da Grama','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3836,'3550902','Sao Simao','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3837,'3551009','Sao Vicente','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3838,'3551108','Sarapui','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3839,'3551207','Sarutaia','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3840,'3551306','Sebastianopolis do Sul','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3841,'3551405','Serra Azul','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3842,'3551504','Serrana','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3843,'3551603','Serra Negra','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3844,'3551702','Sertaozinho','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3845,'3551801','Sete Barras','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3846,'3551900','Severinia','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3847,'3552007','Silveiras','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3848,'3552106','Socorro','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3849,'3552205','Sorocaba','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3850,'3552304','Sud Mennucci','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3851,'3552403','Sumare','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3852,'3552502','Suzano','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3853,'3552551','Suzanapolis','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3854,'3552601','Tabapua','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3855,'3552700','Tabatinga','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3856,'3552809','Taboao da Serra','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3857,'3552908','Taciba','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3858,'3553005','Taguai','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3859,'3553104','Taiaçu','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3860,'3553203','Taiúva','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3861,'3553302','Tambaú','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3862,'3553401','Tanabi','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3863,'3553500','Tapirai','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3864,'3553609','Tapiratiba','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3865,'3553658','Taquaral','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3866,'3553708','Taquaritinga','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3867,'3553807','Taquarituba','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3868,'3553856','Taquarivai','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3869,'3553906','Tarabai','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3870,'3553955','Taruma','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3871,'3554003','Tatui','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3872,'3554102','Taubate','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3873,'3554201','Tejupa','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3874,'3554300','Teodoro Sampaio','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3875,'3554409','Terra Roxa','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3876,'3554508','Tietê','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3877,'3554607','Timburi','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3878,'3554656','Torre de Pedra','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3879,'3554706','Torrinha','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3880,'3554755','Trabiju','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3881,'3554805','Tremembe','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3882,'3554904','Três Fronteiras','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3883,'3554953','Tuiuti','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3884,'3555000','Tupa','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3885,'3555109','Tupi Paulista','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3886,'3555208','Turiúba','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3887,'3555307','Turmalina','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3888,'3555356','Ubarana','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3889,'3555406','Ubatuba','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3890,'3555505','Ubirajara','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3891,'3555604','Uchoa','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3892,'3555703','Uniao Paulista','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3893,'3555802','Urânia','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3894,'3555901','Uru','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3895,'3556008','Urupês','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3896,'3556107','Valentim Gentil','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3897,'3556206','Valinhos','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3898,'3556305','Valparaiso','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3899,'3556354','Vargem','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3900,'3556404','Vargem Grande do Sul','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3901,'3556453','Vargem Grande Paulista','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3902,'3556503','Varzea Paulista','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3903,'3556602','Vera Cruz','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3904,'3556701','Vinhedo','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3905,'3556800','Viradouro','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3906,'3556909','Vista Alegre do Alto','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3907,'3556958','Vitoria Brasil','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3908,'3557006','Votorantim','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3909,'3557105','Votuporanga','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3910,'3557154','Zacarias','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3911,'3557204','Chavantes','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3912,'3557303','Estiva Gerbi','SP','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3913,'4100103','Abatia','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3914,'4100202','Adrianopolis','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3915,'4100301','Agudos do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3916,'4100400','Almirante Tamandare','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3917,'4100459','Altamira do Parana','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3918,'4100509','Altônia','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3919,'4100608','Alto Parana','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3920,'4100707','Alto Piquiri','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3921,'4100806','Alvorada do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3922,'4100905','Amapora','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3923,'4101002','Ampere','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3924,'4101051','Anahy','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3925,'4101101','Andira','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3926,'4101150','Ângulo','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3927,'4101200','Antonina','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3928,'4101309','Antônio Olinto','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3929,'4101408','Apucarana','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3930,'4101507','Arapongas','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3931,'4101606','Arapoti','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3932,'4101655','Arapua','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3933,'4101705','Araruna','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3934,'4101804','Araucaria','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3935,'4101853','Ariranha do Ivai','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3936,'4101903','Assai','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3937,'4102000','Assis Chateaubriand','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3938,'4102109','Astorga','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3939,'4102208','Atalaia','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3940,'4102307','Balsa Nova','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3941,'4102406','Bandeirantes','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3942,'4102505','Barbosa Ferraz','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3943,'4102604','Barracao','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3944,'4102703','Barra do Jacare','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3945,'4102752','Bela Vista da Caroba','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3946,'4102802','Bela Vista do Paraiso','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3947,'4102901','Bituruna','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3948,'4103008','Boa Esperança','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3949,'4103024','Boa Esperança do Iguaçu','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3950,'4103040','Boa Ventura de Sao Roque','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3951,'4103057','Boa Vista da Aparecida','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3952,'4103107','Bocaiúva do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3953,'4103156','Bom Jesus do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3954,'4103206','Bom Sucesso','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3955,'4103222','Bom Sucesso do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3956,'4103305','Borrazopolis','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3957,'4103354','Braganey','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3958,'4103370','Brasilândia do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3959,'4103404','Cafeara','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3960,'4103453','Cafelândia','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3961,'4103479','Cafezal do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3962,'4103503','California','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3963,'4103602','Cambara','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3964,'4103701','Cambe','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3965,'4103800','Cambira','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3966,'4103909','Campina da Lagoa','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3967,'4103958','Campina do Simao','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3968,'4104006','Campina Grande do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3969,'4104055','Campo Bonito','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3970,'4104105','Campo do Tenente','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3971,'4104204','Campo Largo','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3972,'4104253','Campo Magro','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3973,'4104303','Campo Mourao','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3974,'4104402','Cândido de Abreu','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3975,'4104428','Candoi','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3976,'4104451','Cantagalo','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3977,'4104501','Capanema','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3978,'4104600','Capitao Leônidas Marques','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3979,'4104659','Carambei','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3980,'4104709','Carlopolis','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3981,'4104808','Cascavel','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3982,'4104907','Castro','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3983,'4105003','Catanduvas','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3984,'4105102','Centenario do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3985,'4105201','Cerro Azul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3986,'4105300','Ceu Azul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3987,'4105409','Chopinzinho','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3988,'4105508','Cianorte','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3989,'4105607','cidades Gaúcha','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3990,'4105706','Clevelândia','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3991,'4105805','Colombo','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3992,'4105904','Colorado','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3993,'4106001','Congonhinhas','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3994,'4106100','Conselheiro Mairinck','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3995,'4106209','Contenda','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3996,'4106308','Corbelia','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3997,'4106407','Cornelio Procopio','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3998,'4106456','Coronel Domingos Soares','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(3999,'4106506','Coronel Vivida','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4000,'4106555','Corumbatai do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4001,'4106571','Cruzeiro do Iguaçu','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4002,'4106605','Cruzeiro do Oeste','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4003,'4106704','Cruzeiro do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4004,'4106803','Cruz Machado','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4005,'4106852','Cruzmaltina','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4006,'4106902','Curitiba','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4007,'4107009','Curiúva','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4008,'4107108','Diamante do Norte','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4009,'4107124','Diamante do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4010,'4107157','Diamante D\'Oeste','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4011,'4107207','Dois Vizinhos','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4012,'4107256','Douradina','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4013,'4107306','Doutor Camargo','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4014,'4107405','Eneas Marques','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4015,'4107504','Engenheiro Beltrao','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4016,'4107520','Esperança Nova','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4017,'4107538','Entre Rios do Oeste','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4018,'4107546','Espigao Alto do Iguaçu','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4019,'4107553','Farol','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4020,'4107603','Faxinal','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4021,'4107652','Fazenda Rio Grande','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4022,'4107702','Fênix','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4023,'4107736','Fernandes Pinheiro','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4024,'4107751','Figueira','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4025,'4107801','Florai','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4026,'4107850','Flor da Serra do Sul','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4027,'4107900','Floresta','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4028,'4108007','Florestopolis','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4029,'4108106','Florida','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4030,'4108205','Formosa do Oeste','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4031,'4108304','Foz do Iguaçu','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4032,'4108320','Francisco Alves','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4033,'4108403','Francisco Beltrao','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4034,'4108452','Foz do Jordao','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4035,'4108502','General Carneiro','PR','2024-07-03 11:37:19','2024-07-03 11:37:19'),(4036,'4108551','Godoy Moreira','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4037,'4108601','Goioerê','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4038,'4108650','Goioxim','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4039,'4108700','Grandes Rios','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4040,'4108809','Guaira','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4041,'4108908','Guairaça','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4042,'4108957','Guamiranga','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4043,'4109005','Guapirama','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4044,'4109104','Guaporema','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4045,'4109203','Guaraci','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4046,'4109302','Guaraniaçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4047,'4109401','Guarapuava','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4048,'4109500','Guaraqueçaba','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4049,'4109609','Guaratuba','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4050,'4109658','Honorio Serpa','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4051,'4109708','Ibaiti','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4052,'4109757','Ibema','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4053,'4109807','Ibipora','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4054,'4109906','Icaraima','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4055,'4110003','Iguaraçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4056,'4110052','Iguatu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4057,'4110078','Imbaú','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4058,'4110102','Imbituva','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4059,'4110201','Inacio Martins','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4060,'4110300','Inaja','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4061,'4110409','Indianopolis','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4062,'4110508','Ipiranga','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4063,'4110607','Ipora','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4064,'4110656','Iracema do Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4065,'4110706','Irati','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4066,'4110805','Iretama','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4067,'4110904','Itaguaje','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4068,'4110953','Itaipulândia','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4069,'4111001','Itambaraca','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4070,'4111100','Itambe','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4071,'4111209','Itapejara D\'Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4072,'4111258','Itaperuçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4073,'4111308','Itaúna do Sul','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4074,'4111407','Ivai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4075,'4111506','Ivaipora','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4076,'4111555','Ivate','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4077,'4111605','Ivatuba','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4078,'4111704','Jaboti','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4079,'4111803','Jacarezinho','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4080,'4111902','Jaguapita','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4081,'4112009','Jaguariaiva','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4082,'4112108','Jandaia do Sul','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4083,'4112207','Janiopolis','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4084,'4112306','Japira','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4085,'4112405','Japura','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4086,'4112504','Jardim Alegre','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4087,'4112603','Jardim Olinda','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4088,'4112702','Jataizinho','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4089,'4112751','Jesuitas','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4090,'4112801','Joaquim Tavora','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4091,'4112900','Jundiai do Sul','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4092,'4112959','Juranda','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4093,'4113007','Jussara','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4094,'4113106','Kalore','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4095,'4113205','Lapa','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4096,'4113254','Laranjal','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4097,'4113304','Laranjeiras do Sul','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4098,'4113403','Leopolis','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4099,'4113429','Lidianopolis','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4100,'4113452','Lindoeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4101,'4113502','Loanda','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4102,'4113601','Lobato','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4103,'4113700','Londrina','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4104,'4113734','Luiziana','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4105,'4113759','Lunardelli','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4106,'4113809','Lupionopolis','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4107,'4113908','Mallet','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4108,'4114005','Mamborê','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4109,'4114104','Mandaguaçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4110,'4114203','Mandaguari','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4111,'4114302','Mandirituba','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4112,'4114351','Manfrinopolis','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4113,'4114401','Mangueirinha','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4114,'4114500','Manoel Ribas','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4115,'4114609','Marechal Cândido Rondon','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4116,'4114708','Maria Helena','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4117,'4114807','Marialva','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4118,'4114906','Marilândia do Sul','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4119,'4115002','Marilena','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4120,'4115101','Mariluz','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4121,'4115200','Maringa','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4122,'4115309','Mariopolis','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4123,'4115358','Maripa','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4124,'4115408','Marmeleiro','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4125,'4115457','Marquinho','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4126,'4115507','Marumbi','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4127,'4115606','Matelândia','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4128,'4115705','Matinhos','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4129,'4115739','Mato Rico','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4130,'4115754','Maua da Serra','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4131,'4115804','Medianeira','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4132,'4115853','Mercedes','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4133,'4115903','Mirador','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4134,'4116000','Miraselva','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4135,'4116059','Missal','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4136,'4116109','Moreira Sales','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4137,'4116208','Morretes','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4138,'4116307','Munhoz de Melo','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4139,'4116406','Nossa Senhora das Graças','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4140,'4116505','Nova Aliança do Ivai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4141,'4116604','Nova America da Colina','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4142,'4116703','Nova Aurora','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4143,'4116802','Nova Cantu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4144,'4116901','Nova Esperança','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4145,'4116950','Nova Esperança do Sudoeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4146,'4117008','Nova Fatima','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4147,'4117057','Nova Laranjeiras','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4148,'4117107','Nova Londrina','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4149,'4117206','Nova Olimpia','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4150,'4117214','Nova Santa Barbara','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4151,'4117222','Nova Santa Rosa','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4152,'4117255','Nova Prata do Iguaçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4153,'4117271','Nova Tebas','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4154,'4117297','Novo Itacolomi','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4155,'4117305','Ortigueira','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4156,'4117404','Ourizona','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4157,'4117453','Ouro Verde do Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4158,'4117503','Paiçandu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4159,'4117602','Palmas','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4160,'4117701','Palmeira','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4161,'4117800','Palmital','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4162,'4117909','Palotina','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4163,'4118006','Paraiso do Norte','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4164,'4118105','Paranacity','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4165,'4118204','Paranagua','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4166,'4118303','Paranapoema','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4167,'4118402','Paranavai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4168,'4118451','Pato Bragado','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4169,'4118501','Pato Branco','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4170,'4118600','Paula Freitas','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4171,'4118709','Paulo Frontin','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4172,'4118808','Peabiru','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4173,'4118857','Perobal','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4174,'4118907','Perola','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4175,'4119004','Perola D\'Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4176,'4119103','Piên','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4177,'4119152','Pinhais','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4178,'4119202','Pinhalao','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4179,'4119251','Pinhal de Sao Bento','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4180,'4119301','Pinhao','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4181,'4119400','Pirai do Sul','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4182,'4119509','Piraquara','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4183,'4119608','Pitanga','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4184,'4119657','Pitangueiras','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4185,'4119707','Planaltina do Parana','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4186,'4119806','Planalto','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4187,'4119905','Ponta Grossa','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4188,'4119954','Pontal do Parana','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4189,'4120002','Porecatu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4190,'4120101','Porto Amazonas','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4191,'4120150','Porto Barreiro','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4192,'4120200','Porto Rico','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4193,'4120309','Porto Vitoria','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4194,'4120333','Prado Ferreira','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4195,'4120358','Pranchita','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4196,'4120408','Presidente Castelo Branco','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4197,'4120507','Primeiro de Maio','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4198,'4120606','Prudentopolis','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4199,'4120655','Quarto Centenario','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4200,'4120705','Quatigua','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4201,'4120804','Quatro Barras','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4202,'4120853','Quatro Pontes','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4203,'4120903','Quedas do Iguaçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4204,'4121000','Querência do Norte','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4205,'4121109','Quinta do Sol','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4206,'4121208','Quitandinha','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4207,'4121257','Ramilândia','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4208,'4121307','Rancho Alegre','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4209,'4121356','Rancho Alegre D\'Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4210,'4121406','Realeza','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4211,'4121505','Rebouças','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4212,'4121604','Renascença','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4213,'4121703','Reserva','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4214,'4121752','Reserva do Iguaçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4215,'4121802','Ribeirao Claro','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4216,'4121901','Ribeirao do Pinhal','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4217,'4122008','Rio Azul','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4218,'4122107','Rio Bom','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4219,'4122156','Rio Bonito do Iguaçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4220,'4122172','Rio Branco do Ivai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4221,'4122206','Rio Branco do Sul','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4222,'4122305','Rio Negro','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4223,'4122404','Rolândia','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4224,'4122503','Roncador','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4225,'4122602','Rondon','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4226,'4122651','Rosario do Ivai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4227,'4122701','Sabaudia','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4228,'4122800','Salgado Filho','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4229,'4122909','Salto do Itarare','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4230,'4123006','Salto do Lontra','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4231,'4123105','Santa Amelia','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4232,'4123204','Santa Cecilia do Pavao','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4233,'4123303','Santa Cruz de Monte Castelo','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4234,'4123402','Santa Fe','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4235,'4123501','Santa Helena','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4236,'4123600','Santa Inês','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4237,'4123709','Santa Isabel do Ivai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4238,'4123808','Santa Izabel do Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4239,'4123824','Santa Lúcia','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4240,'4123857','Santa Maria do Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4241,'4123907','Santa Mariana','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4242,'4123956','Santa Mônica','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4243,'4124004','Santana do Itarare','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4244,'4124020','Santa Tereza do Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4245,'4124053','Santa Terezinha de Itaipu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4246,'4124103','Santo Antônio da Platina','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4247,'4124202','Santo Antônio do Caiua','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4248,'4124301','Santo Antônio do Paraiso','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4249,'4124400','Santo Antônio do Sudoeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4250,'4124509','Santo Inacio','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4251,'4124608','Sao Carlos do Ivai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4252,'4124707','Sao Jerônimo da Serra','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4253,'4124806','Sao Joao','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4254,'4124905','Sao Joao do Caiua','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4255,'4125001','Sao Joao do Ivai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4256,'4125100','Sao Joao do Triunfo','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4257,'4125209','Sao Jorge D\'Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4258,'4125308','Sao Jorge do Ivai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4259,'4125357','Sao Jorge do Patrocinio','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4260,'4125407','Sao Jose da Boa Vista','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4261,'4125456','Sao Jose das Palmeiras','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4262,'4125506','Sao Jose dos Pinhais','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4263,'4125555','Sao Manoel do Parana','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4264,'4125605','Sao Mateus do Sul','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4265,'4125704','Sao Miguel do Iguaçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4266,'4125753','Sao Pedro do Iguaçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4267,'4125803','Sao Pedro do Ivai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4268,'4125902','Sao Pedro do Parana','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4269,'4126009','Sao Sebastiao da Amoreira','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4270,'4126108','Sao Tome','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4271,'4126207','Sapopema','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4272,'4126256','Sarandi','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4273,'4126272','Saudade do Iguaçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4274,'4126306','Senges','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4275,'4126355','Serranopolis do Iguaçu','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4276,'4126405','Sertaneja','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4277,'4126504','Sertanopolis','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4278,'4126603','Siqueira Campos','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4279,'4126652','Sulina','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4280,'4126678','Tamarana','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4281,'4126702','Tamboara','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4282,'4126801','Tapejara','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4283,'4126900','Tapira','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4284,'4127007','Teixeira Soares','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4285,'4127106','Telêmaco Borba','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4286,'4127205','Terra Boa','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4287,'4127304','Terra Rica','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4288,'4127403','Terra Roxa','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4289,'4127502','Tibagi','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4290,'4127601','Tijucas do Sul','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4291,'4127700','Toledo','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4292,'4127809','Tomazina','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4293,'4127858','Três Barras do Parana','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4294,'4127882','Tunas do Parana','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4295,'4127908','Tuneiras do Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4296,'4127957','Tupassi','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4297,'4127965','Turvo','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4298,'4128005','Ubirata','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4299,'4128104','Umuarama','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4300,'4128203','Uniao da Vitoria','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4301,'4128302','Uniflor','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4302,'4128401','Urai','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4303,'4128500','Wenceslau Braz','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4304,'4128534','Ventania','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4305,'4128559','Vera Cruz do Oeste','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4306,'4128609','Verê','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4307,'4128625','Alto Paraiso','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4308,'4128633','Doutor Ulysses','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4309,'4128658','Virmond','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4310,'4128708','Vitorino','PR','2024-07-03 11:37:20','2024-07-03 11:37:20'),(4311,'4128807','Xambrê','PR','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4312,'4200051','Abdon Batista','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4313,'4200101','Abelardo Luz','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4314,'4200200','Agrolândia','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4315,'4200309','Agronômica','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4316,'4200408','agua Doce','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4317,'4200507','aguas de Chapeco','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4318,'4200556','aguas Frias','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4319,'4200606','aguas Mornas','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4320,'4200705','Alfredo Wagner','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4321,'4200754','Alto Bela Vista','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4322,'4200804','Anchieta','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4323,'4200903','Angelina','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4324,'4201000','Anita Garibaldi','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4325,'4201109','Anitapolis','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4326,'4201208','Antônio Carlos','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4327,'4201257','Apiúna','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4328,'4201273','Arabuta','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4329,'4201307','Araquari','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4330,'4201406','Ararangua','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4331,'4201505','Armazem','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4332,'4201604','Arroio Trinta','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4333,'4201653','Arvoredo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4334,'4201703','Ascurra','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4335,'4201802','Atalanta','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4336,'4201901','Aurora','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4337,'4201950','Balneario Arroio do Silva','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4338,'4202008','Balneario Camboriú','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4339,'4202057','Balneario Barra do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4340,'4202073','Balneario Gaivota','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4341,'4202081','Bandeirante','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4342,'4202099','Barra Bonita','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4343,'4202107','Barra Velha','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4344,'4202131','Bela Vista do Toldo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4345,'4202156','Belmonte','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4346,'4202206','Benedito Novo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4347,'4202305','Biguaçu','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4348,'4202404','Blumenau','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4349,'4202438','Bocaina do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4350,'4202453','Bombinhas','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4351,'4202503','Bom Jardim da Serra','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4352,'4202537','Bom Jesus','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4353,'4202578','Bom Jesus do Oeste','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4354,'4202602','Bom Retiro','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4355,'4202701','Botuvera','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4356,'4202800','Braço do Norte','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4357,'4202859','Braço do Trombudo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4358,'4202875','Brunopolis','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4359,'4202909','Brusque','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4360,'4203006','Caçador','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4361,'4203105','Caibi','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4362,'4203154','Calmon','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4363,'4203204','Camboriú','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4364,'4203253','Capao Alto','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4365,'4203303','Campo Alegre','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4366,'4203402','Campo Belo do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4367,'4203501','Campo Erê','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4368,'4203600','Campos Novos','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4369,'4203709','Canelinha','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4370,'4203808','Canoinhas','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4371,'4203907','Capinzal','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4372,'4203956','Capivari de Baixo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4373,'4204004','Catanduvas','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4374,'4204103','Caxambu do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4375,'4204152','Celso Ramos','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4376,'4204178','Cerro Negro','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4377,'4204194','Chapadao do Lageado','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4378,'4204202','Chapeco','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4379,'4204251','Cocal do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4380,'4204301','Concordia','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4381,'4204350','Cordilheira Alta','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4382,'4204400','Coronel Freitas','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4383,'4204459','Coronel Martins','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4384,'4204509','Corupa','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4385,'4204558','Correia Pinto','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4386,'4204608','Criciúma','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4387,'4204707','Cunha Pora','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4388,'4204756','Cunhatai','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4389,'4204806','Curitibanos','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4390,'4204905','Descanso','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4391,'4205001','Dionisio Cerqueira','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4392,'4205100','Dona Emma','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4393,'4205159','Doutor Pedrinho','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4394,'4205175','Entre Rios','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4395,'4205191','Ermo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4396,'4205209','Erval Velho','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4397,'4205308','Faxinal dos Guedes','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4398,'4205357','Flor do Sertao','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4399,'4205407','Florianopolis','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4400,'4205431','Formosa do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4401,'4205456','Forquilhinha','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4402,'4205506','Fraiburgo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4403,'4205555','Frei Rogerio','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4404,'4205605','Galvao','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4405,'4205704','Garopaba','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4406,'4205803','Garuva','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4407,'4205902','Gaspar','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4408,'4206009','Governador Celso Ramos','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4409,'4206108','Grao Para','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4410,'4206207','Gravatal','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4411,'4206306','Guabiruba','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4412,'4206405','Guaraciaba','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4413,'4206504','Guaramirim','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4414,'4206603','Guaruja do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4415,'4206652','Guatambú','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4416,'4206702','Herval D\'Oeste','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4417,'4206751','Ibiam','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4418,'4206801','Ibicare','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4419,'4206900','Ibirama','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4420,'4207007','Içara','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4421,'4207106','Ilhota','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4422,'4207205','Imarui','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4423,'4207304','Imbituba','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4424,'4207403','Imbuia','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4425,'4207502','Indaial','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4426,'4207577','Iomerê','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4427,'4207601','Ipira','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4428,'4207650','Ipora do Oeste','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4429,'4207684','Ipuaçu','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4430,'4207700','Ipumirim','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4431,'4207759','Iraceminha','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4432,'4207809','Irani','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4433,'4207858','Irati','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4434,'4207908','Irineopolis','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4435,'4208005','Ita','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4436,'4208104','Itaiopolis','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4437,'4208203','Itajai','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4438,'4208302','Itapema','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4439,'4208401','Itapiranga','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4440,'4208450','Itapoa','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4441,'4208500','Ituporanga','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4442,'4208609','Jabora','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4443,'4208708','Jacinto Machado','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4444,'4208807','Jaguaruna','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4445,'4208906','Jaragua do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4446,'4208955','Jardinopolis','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4447,'4209003','Joaçaba','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4448,'4209102','Joinville','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4449,'4209151','Jose Boiteux','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4450,'4209177','Jupia','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4451,'4209201','Lacerdopolis','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4452,'4209300','Lages','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4453,'4209409','Laguna','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4454,'4209458','Lajeado Grande','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4455,'4209508','Laurentino','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4456,'4209607','Lauro Muller','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4457,'4209706','Lebon Regis','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4458,'4209805','Leoberto Leal','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4459,'4209854','Lindoia do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4460,'4209904','Lontras','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4461,'4210001','Luiz Alves','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4462,'4210035','Luzerna','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4463,'4210050','Macieira','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4464,'4210100','Mafra','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4465,'4210209','Major Gercino','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4466,'4210308','Major Vieira','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4467,'4210407','Maracaja','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4468,'4210506','Maravilha','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4469,'4210555','Marema','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4470,'4210605','Massaranduba','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4471,'4210704','Matos Costa','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4472,'4210803','Meleiro','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4473,'4210852','Mirim Doce','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4474,'4210902','Modelo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4475,'4211009','Mondai','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4476,'4211058','Monte Carlo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4477,'4211108','Monte Castelo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4478,'4211207','Morro da Fumaça','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4479,'4211256','Morro Grande','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4480,'4211306','Navegantes','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4481,'4211405','Nova Erechim','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4482,'4211454','Nova Itaberaba','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4483,'4211504','Nova Trento','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4484,'4211603','Nova Veneza','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4485,'4211652','Novo Horizonte','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4486,'4211702','Orleans','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4487,'4211751','Otacilio Costa','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4488,'4211801','Ouro','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4489,'4211850','Ouro Verde','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4490,'4211876','Paial','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4491,'4211892','Painel','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4492,'4211900','Palhoça','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4493,'4212007','Palma Sola','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4494,'4212056','Palmeira','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4495,'4212106','Palmitos','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4496,'4212205','Papanduva','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4497,'4212239','Paraiso','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4498,'4212254','Passo de Torres','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4499,'4212270','Passos Maia','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4500,'4212304','Paulo Lopes','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4501,'4212403','Pedras Grandes','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4502,'4212502','Penha','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4503,'4212601','Peritiba','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4504,'4212650','Pescaria Brava','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4505,'4212700','Petrolândia','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4506,'4212809','Balneario Piçarras','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4507,'4212908','Pinhalzinho','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4508,'4213005','Pinheiro Preto','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4509,'4213104','Piratuba','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4510,'4213153','Planalto Alegre','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4511,'4213203','Pomerode','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4512,'4213302','Ponte Alta','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4513,'4213351','Ponte Alta do Norte','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4514,'4213401','Ponte Serrada','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4515,'4213500','Porto Belo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4516,'4213609','Porto Uniao','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4517,'4213708','Pouso Redondo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4518,'4213807','Praia Grande','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4519,'4213906','Presidente Castello Branco','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4520,'4214003','Presidente Getúlio','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4521,'4214102','Presidente Nereu','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4522,'4214151','Princesa','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4523,'4214201','Quilombo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4524,'4214300','Rancho Queimado','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4525,'4214409','Rio das Antas','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4526,'4214508','Rio do Campo','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4527,'4214607','Rio do Oeste','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4528,'4214706','Rio dos Cedros','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4529,'4214805','Rio do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4530,'4214904','Rio Fortuna','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4531,'4215000','Rio Negrinho','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4532,'4215059','Rio Rufino','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4533,'4215075','Riqueza','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4534,'4215109','Rodeio','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4535,'4215208','Romelândia','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4536,'4215307','Salete','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4537,'4215356','Saltinho','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4538,'4215406','Salto Veloso','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4539,'4215455','Sangao','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4540,'4215505','Santa Cecilia','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4541,'4215554','Santa Helena','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4542,'4215604','Santa Rosa de Lima','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4543,'4215653','Santa Rosa do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4544,'4215679','Santa Terezinha','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4545,'4215687','Santa Terezinha do Progresso','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4546,'4215695','Santiago do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4547,'4215703','Santo Amaro da Imperatriz','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4548,'4215752','Sao Bernardino','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4549,'4215802','Sao Bento do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4550,'4215901','Sao Bonifacio','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4551,'4216008','Sao Carlos','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4552,'4216057','Sao Cristovao do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4553,'4216107','Sao Domingos','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4554,'4216206','Sao Francisco do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4555,'4216255','Sao Joao do Oeste','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4556,'4216305','Sao Joao Batista','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4557,'4216354','Sao Joao do Itaperiú','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4558,'4216404','Sao Joao do Sul','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4559,'4216503','Sao Joaquim','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4560,'4216602','Sao Jose','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4561,'4216701','Sao Jose do Cedro','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4562,'4216800','Sao Jose do Cerrito','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4563,'4216909','Sao Lourenço do Oeste','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4564,'4217006','Sao Ludgero','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4565,'4217105','Sao Martinho','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4566,'4217154','Sao Miguel da Boa Vista','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4567,'4217204','Sao Miguel do Oeste','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4568,'4217253','Sao Pedro de Alcântara','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4569,'4217303','Saudades','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4570,'4217402','Schroeder','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4571,'4217501','Seara','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4572,'4217550','Serra Alta','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4573,'4217600','Sideropolis','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4574,'4217709','Sombrio','SC','2024-07-03 11:37:21','2024-07-03 11:37:21'),(4575,'4217758','Sul Brasil','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4576,'4217808','Taio','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4577,'4217907','Tangara','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4578,'4217956','Tigrinhos','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4579,'4218004','Tijucas','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4580,'4218103','Timbe do Sul','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4581,'4218202','Timbo','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4582,'4218251','Timbo Grande','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4583,'4218301','Três Barras','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4584,'4218350','Treviso','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4585,'4218400','Treze de Maio','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4586,'4218509','Treze Tilias','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4587,'4218608','Trombudo Central','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4588,'4218707','Tubarao','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4589,'4218756','Tunapolis','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4590,'4218806','Turvo','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4591,'4218855','Uniao do Oeste','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4592,'4218905','Urubici','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4593,'4218954','Urupema','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4594,'4219002','Urussanga','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4595,'4219101','Vargeao','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4596,'4219150','Vargem','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4597,'4219176','Vargem Bonita','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4598,'4219200','Vidal Ramos','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4599,'4219309','Videira','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4600,'4219358','Vitor Meireles','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4601,'4219408','Witmarsum','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4602,'4219507','Xanxerê','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4603,'4219606','Xavantina','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4604,'4219705','Xaxim','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4605,'4219853','Zortea','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4606,'4220000','Balneario Rincao','SC','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4607,'4300034','Acegua','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4608,'4300059','agua Santa','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4609,'4300109','Agudo','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4610,'4300208','Ajuricaba','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4611,'4300307','Alecrim','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4612,'4300406','Alegrete','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4613,'4300455','Alegria','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4614,'4300471','Almirante Tamandare do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4615,'4300505','Alpestre','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4616,'4300554','Alto Alegre','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4617,'4300570','Alto Feliz','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4618,'4300604','Alvorada','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4619,'4300638','Amaral Ferrador','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4620,'4300646','Ametista do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4621,'4300661','Andre da Rocha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4622,'4300703','Anta Gorda','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4623,'4300802','Antônio Prado','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4624,'4300851','Arambare','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4625,'4300877','Ararica','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4626,'4300901','Aratiba','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4627,'4301008','Arroio do Meio','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4628,'4301057','Arroio do Sal','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4629,'4301073','Arroio do Padre','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4630,'4301107','Arroio dos Ratos','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4631,'4301206','Arroio do Tigre','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4632,'4301305','Arroio Grande','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4633,'4301404','Arvorezinha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4634,'4301503','Augusto Pestana','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4635,'4301552','aurea','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4636,'4301602','Bage','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4637,'4301636','Balneario Pinhal','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4638,'4301651','Barao','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4639,'4301701','Barao de Cotegipe','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4640,'4301750','Barao do Triunfo','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4641,'4301800','Barracao','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4642,'4301859','Barra do Guarita','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4643,'4301875','Barra do Quarai','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4644,'4301909','Barra do Ribeiro','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4645,'4301925','Barra do Rio Azul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4646,'4301958','Barra Funda','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4647,'4302006','Barros Cassal','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4648,'4302055','Benjamin Constant do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4649,'4302105','Bento Gonçalves','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4650,'4302154','Boa Vista das Missões','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4651,'4302204','Boa Vista do Burica','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4652,'4302220','Boa Vista do Cadeado','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4653,'4302238','Boa Vista do Incra','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4654,'4302253','Boa Vista do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4655,'4302303','Bom Jesus','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4656,'4302352','Bom Principio','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4657,'4302378','Bom Progresso','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4658,'4302402','Bom Retiro do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4659,'4302451','Boqueirao do Leao','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4660,'4302501','Bossoroca','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4661,'4302584','Bozano','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4662,'4302600','Braga','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4663,'4302659','Brochier','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4664,'4302709','Butia','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4665,'4302808','Caçapava do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4666,'4302907','Cacequi','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4667,'4303004','Cachoeira do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4668,'4303103','Cachoeirinha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4669,'4303202','Cacique Doble','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4670,'4303301','Caibate','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4671,'4303400','Caiçara','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4672,'4303509','Camaqua','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4673,'4303558','Camargo','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4674,'4303608','Cambara do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4675,'4303673','Campestre da Serra','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4676,'4303707','Campina das Missões','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4677,'4303806','Campinas do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4678,'4303905','Campo Bom','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4679,'4304002','Campo Novo','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4680,'4304101','Campos Borges','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4681,'4304200','Candelaria','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4682,'4304309','Cândido Godoi','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4683,'4304358','Candiota','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4684,'4304408','Canela','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4685,'4304507','Canguçu','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4686,'4304606','Canoas','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4687,'4304614','Canudos do Vale','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4688,'4304622','Capao Bonito do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4689,'4304630','Capao da Canoa','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4690,'4304655','Capao do Cipo','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4691,'4304663','Capao do Leao','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4692,'4304671','Capivari do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4693,'4304689','Capela de Santana','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4694,'4304697','Capitao','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4695,'4304705','Carazinho','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4696,'4304713','Caraa','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4697,'4304804','Carlos Barbosa','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4698,'4304853','Carlos Gomes','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4699,'4304903','Casca','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4700,'4304952','Caseiros','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4701,'4305009','Catuipe','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4702,'4305108','Caxias do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4703,'4305116','Centenario','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4704,'4305124','Cerrito','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4705,'4305132','Cerro Branco','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4706,'4305157','Cerro Grande','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4707,'4305173','Cerro Grande do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4708,'4305207','Cerro Largo','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4709,'4305306','Chapada','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4710,'4305355','Charqueadas','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4711,'4305371','Charrua','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4712,'4305405','Chiapetta','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4713,'4305439','Chui','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4714,'4305447','Chuvisca','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4715,'4305454','Cidreira','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4716,'4305504','Ciriaco','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4717,'4305587','Colinas','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4718,'4305603','Colorado','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4719,'4305702','Condor','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4720,'4305801','Constantina','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4721,'4305835','Coqueiro Baixo','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4722,'4305850','Coqueiros do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4723,'4305871','Coronel Barros','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4724,'4305900','Coronel Bicaco','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4725,'4305934','Coronel Pilar','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4726,'4305959','Cotipora','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4727,'4305975','Coxilha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4728,'4306007','Crissiumal','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4729,'4306056','Cristal','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4730,'4306072','Cristal do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4731,'4306106','Cruz Alta','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4732,'4306130','Cruzaltense','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4733,'4306205','Cruzeiro do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4734,'4306304','David Canabarro','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4735,'4306320','Derrubadas','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4736,'4306353','Dezesseis de Novembro','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4737,'4306379','Dilermando de Aguiar','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4738,'4306403','Dois Irmaos','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4739,'4306429','Dois Irmaos das Missões','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4740,'4306452','Dois Lajeados','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4741,'4306502','Dom Feliciano','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4742,'4306551','Dom Pedro de Alcântara','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4743,'4306601','Dom Pedrito','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4744,'4306700','Dona Francisca','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4745,'4306734','Doutor Mauricio Cardoso','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4746,'4306759','Doutor Ricardo','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4747,'4306767','Eldorado do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4748,'4306809','Encantado','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4749,'4306908','Encruzilhada do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4750,'4306924','Engenho Velho','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4751,'4306932','Entre-Ijuis','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4752,'4306957','Entre Rios do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4753,'4306973','Erebango','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4754,'4307005','Erechim','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4755,'4307054','Ernestina','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4756,'4307104','Herval','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4757,'4307203','Erval Grande','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4758,'4307302','Erval Seco','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4759,'4307401','Esmeralda','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4760,'4307450','Esperança do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4761,'4307500','Espumoso','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4762,'4307559','Estaçao','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4763,'4307609','Estância Velha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4764,'4307708','Esteio','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4765,'4307807','Estrela','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4766,'4307815','Estrela Velha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4767,'4307831','Eugênio de Castro','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4768,'4307864','Fagundes Varela','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4769,'4307906','Farroupilha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4770,'4308003','Faxinal do Soturno','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4771,'4308052','Faxinalzinho','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4772,'4308078','Fazenda Vilanova','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4773,'4308102','Feliz','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4774,'4308201','Flores da Cunha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4775,'4308250','Floriano Peixoto','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4776,'4308300','Fontoura Xavier','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4777,'4308409','Formigueiro','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4778,'4308433','Forquetinha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4779,'4308458','Fortaleza dos Valos','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4780,'4308508','Frederico Westphalen','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4781,'4308607','Garibaldi','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4782,'4308656','Garruchos','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4783,'4308706','Gaurama','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4784,'4308805','General Câmara','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4785,'4308854','Gentil','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4786,'4308904','Getúlio Vargas','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4787,'4309001','Girua','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4788,'4309050','Glorinha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4789,'4309100','Gramado','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4790,'4309126','Gramado dos Loureiros','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4791,'4309159','Gramado Xavier','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4792,'4309209','Gravatai','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4793,'4309258','Guabiju','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4794,'4309308','Guaiba','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4795,'4309407','Guapore','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4796,'4309506','Guarani das Missões','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4797,'4309555','Harmonia','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4798,'4309571','Herveiras','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4799,'4309605','Horizontina','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4800,'4309654','Hulha Negra','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4801,'4309704','Humaita','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4802,'4309753','Ibarama','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4803,'4309803','Ibiaça','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4804,'4309902','Ibiraiaras','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4805,'4309951','Ibirapuita','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4806,'4310009','Ibiruba','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4807,'4310108','Igrejinha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4808,'4310207','Ijui','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4809,'4310306','Ilopolis','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4810,'4310330','Imbe','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4811,'4310363','Imigrante','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4812,'4310405','Independência','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4813,'4310413','Inhacora','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4814,'4310439','Ipê','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4815,'4310462','Ipiranga do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4816,'4310504','Irai','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4817,'4310538','Itaara','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4818,'4310553','Itacurubi','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4819,'4310579','Itapuca','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4820,'4310603','Itaqui','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4821,'4310652','Itati','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4822,'4310702','Itatiba do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4823,'4310751','Ivora','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4824,'4310801','Ivoti','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4825,'4310850','Jaboticaba','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4826,'4310876','Jacuizinho','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4827,'4310900','Jacutinga','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4828,'4311007','Jaguarao','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4829,'4311106','Jaguari','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4830,'4311122','Jaquirana','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4831,'4311130','Jari','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4832,'4311155','Joia','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4833,'4311205','Júlio de Castilhos','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4834,'4311239','Lagoa Bonita do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4835,'4311254','Lagoao','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4836,'4311270','Lagoa dos Três Cantos','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4837,'4311304','Lagoa Vermelha','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4838,'4311403','Lajeado','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4839,'4311429','Lajeado do Bugre','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4840,'4311502','Lavras do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4841,'4311601','Liberato Salzano','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4842,'4311627','Lindolfo Collor','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4843,'4311643','Linha Nova','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4844,'4311700','Machadinho','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4845,'4311718','Maçambara','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4846,'4311734','Mampituba','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4847,'4311759','Manoel Viana','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4848,'4311775','Maquine','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4849,'4311791','Marata','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4850,'4311809','Marau','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4851,'4311908','Marcelino Ramos','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4852,'4311981','Mariana Pimentel','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4853,'4312005','Mariano Moro','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4854,'4312054','Marques de Souza','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4855,'4312104','Mata','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4856,'4312138','Mato Castelhano','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4857,'4312153','Mato Leitao','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4858,'4312179','Mato Queimado','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4859,'4312203','Maximiliano de Almeida','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4860,'4312252','Minas do Leao','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4861,'4312302','Miraguai','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4862,'4312351','Montauri','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4863,'4312377','Monte Alegre dos Campos','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4864,'4312385','Monte Belo do Sul','RS','2024-07-03 11:37:22','2024-07-03 11:37:22'),(4865,'4312401','Montenegro','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4866,'4312427','Mormaço','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4867,'4312443','Morrinhos do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4868,'4312450','Morro Redondo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4869,'4312476','Morro Reuter','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4870,'4312500','Mostardas','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4871,'4312609','Muçum','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4872,'4312617','Muitos Capões','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4873,'4312625','Muliterno','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4874,'4312658','Nao-Me-Toque','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4875,'4312674','Nicolau Vergueiro','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4876,'4312708','Nonoai','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4877,'4312757','Nova Alvorada','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4878,'4312807','Nova Araça','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4879,'4312906','Nova Bassano','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4880,'4312955','Nova Boa Vista','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4881,'4313003','Nova Brescia','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4882,'4313011','Nova Candelaria','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4883,'4313037','Nova Esperança do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4884,'4313060','Nova Hartz','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4885,'4313086','Nova Padua','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4886,'4313102','Nova Palma','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4887,'4313201','Nova Petropolis','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4888,'4313300','Nova Prata','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4889,'4313334','Nova Ramada','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4890,'4313359','Nova Roma do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4891,'4313375','Nova Santa Rita','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4892,'4313391','Novo Cabrais','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4893,'4313409','Novo Hamburgo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4894,'4313425','Novo Machado','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4895,'4313441','Novo Tiradentes','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4896,'4313466','Novo Xingu','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4897,'4313490','Novo Barreiro','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4898,'4313508','Osorio','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4899,'4313607','Paim Filho','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4900,'4313656','Palmares do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4901,'4313706','Palmeira das Missões','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4902,'4313805','Palmitinho','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4903,'4313904','Panambi','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4904,'4313953','Pantano Grande','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4905,'4314001','Parai','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4906,'4314027','Paraiso do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4907,'4314035','Pareci Novo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4908,'4314050','Parobe','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4909,'4314068','Passa Sete','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4910,'4314076','Passo do Sobrado','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4911,'4314100','Passo Fundo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4912,'4314134','Paulo Bento','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4913,'4314159','Paverama','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4914,'4314175','Pedras Altas','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4915,'4314209','Pedro Osorio','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4916,'4314308','Pejuçara','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4917,'4314407','Pelotas','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4918,'4314423','Picada Cafe','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4919,'4314456','Pinhal','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4920,'4314464','Pinhal da Serra','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4921,'4314472','Pinhal Grande','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4922,'4314498','Pinheirinho do Vale','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4923,'4314506','Pinheiro Machado','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4924,'4314548','Pinto Bandeira','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4925,'4314555','Pirapo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4926,'4314605','Piratini','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4927,'4314704','Planalto','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4928,'4314753','Poço das Antas','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4929,'4314779','Pontao','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4930,'4314787','Ponte Preta','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4931,'4314803','Portao','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4932,'4314902','Porto Alegre','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4933,'4315008','Porto Lucena','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4934,'4315057','Porto Maua','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4935,'4315073','Porto Vera Cruz','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4936,'4315107','Porto Xavier','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4937,'4315131','Pouso Novo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4938,'4315149','Presidente Lucena','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4939,'4315156','Progresso','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4940,'4315172','Protasio Alves','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4941,'4315206','Putinga','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4942,'4315305','Quarai','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4943,'4315313','Quatro Irmaos','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4944,'4315321','Quevedos','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4945,'4315354','Quinze de Novembro','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4946,'4315404','Redentora','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4947,'4315453','Relvado','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4948,'4315503','Restinga Seca','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4949,'4315552','Rio dos indios','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4950,'4315602','Rio Grande','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4951,'4315701','Rio Pardo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4952,'4315750','Riozinho','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4953,'4315800','Roca Sales','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4954,'4315909','Rodeio Bonito','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4955,'4315958','Rolador','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4956,'4316006','Rolante','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4957,'4316105','Ronda Alta','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4958,'4316204','Rondinha','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4959,'4316303','Roque Gonzales','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4960,'4316402','Rosario do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4961,'4316428','Sagrada Familia','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4962,'4316436','Saldanha Marinho','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4963,'4316451','Salto do Jacui','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4964,'4316477','Salvador das Missões','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4965,'4316501','Salvador do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4966,'4316600','Sananduva','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4967,'4316709','Santa Barbara do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4968,'4316733','Santa Cecilia do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4969,'4316758','Santa Clara do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4970,'4316808','Santa Cruz do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4971,'4316907','Santa Maria','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4972,'4316956','Santa Maria do Herval','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4973,'4316972','Santa Margarida do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4974,'4317004','Santana da Boa Vista','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4975,'4317103','Sant\'Ana do Livramento','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4976,'4317202','Santa Rosa','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4977,'4317251','Santa Tereza','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4978,'4317301','Santa Vitoria do Palmar','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4979,'4317400','Santiago','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4980,'4317509','Santo Ângelo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4981,'4317558','Santo Antônio do Palma','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4982,'4317608','Santo Antônio da Patrulha','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4983,'4317707','Santo Antônio das Missões','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4984,'4317756','Santo Antônio do Planalto','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4985,'4317806','Santo Augusto','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4986,'4317905','Santo Cristo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4987,'4317954','Santo Expedito do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4988,'4318002','Sao Borja','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4989,'4318051','Sao Domingos do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4990,'4318101','Sao Francisco de Assis','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4991,'4318200','Sao Francisco de Paula','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4992,'4318309','Sao Gabriel','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4993,'4318408','Sao Jerônimo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4994,'4318424','Sao Joao da Urtiga','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4995,'4318432','Sao Joao do Polêsine','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4996,'4318440','Sao Jorge','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4997,'4318457','Sao Jose das Missões','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4998,'4318465','Sao Jose do Herval','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(4999,'4318481','Sao Jose do Hortêncio','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5000,'4318499','Sao Jose do Inhacora','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5001,'4318507','Sao Jose do Norte','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5002,'4318606','Sao Jose do Ouro','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5003,'4318614','Sao Jose do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5004,'4318622','Sao Jose dos Ausentes','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5005,'4318705','Sao Leopoldo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5006,'4318804','Sao Lourenço do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5007,'4318903','Sao Luiz Gonzaga','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5008,'4319000','Sao Marcos','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5009,'4319109','Sao Martinho','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5010,'4319125','Sao Martinho da Serra','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5011,'4319158','Sao Miguel das Missões','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5012,'4319208','Sao Nicolau','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5013,'4319307','Sao Paulo das Missões','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5014,'4319356','Sao Pedro da Serra','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5015,'4319364','Sao Pedro das Missões','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5016,'4319372','Sao Pedro do Butia','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5017,'4319406','Sao Pedro do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5018,'4319505','Sao Sebastiao do Cai','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5019,'4319604','Sao Sepe','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5020,'4319703','Sao Valentim','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5021,'4319711','Sao Valentim do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5022,'4319737','Sao Valerio do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5023,'4319752','Sao Vendelino','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5024,'4319802','Sao Vicente do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5025,'4319901','Sapiranga','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5026,'4320008','Sapucaia do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5027,'4320107','Sarandi','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5028,'4320206','Seberi','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5029,'4320230','Sede Nova','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5030,'4320263','Segredo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5031,'4320305','Selbach','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5032,'4320321','Senador Salgado Filho','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5033,'4320354','Sentinela do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5034,'4320404','Serafina Corrêa','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5035,'4320453','Serio','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5036,'4320503','Sertao','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5037,'4320552','Sertao Santana','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5038,'4320578','Sete de Setembro','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5039,'4320602','Severiano de Almeida','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5040,'4320651','Silveira Martins','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5041,'4320677','Sinimbu','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5042,'4320701','Sobradinho','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5043,'4320800','Soledade','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5044,'4320859','Tabai','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5045,'4320909','Tapejara','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5046,'4321006','Tapera','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5047,'4321105','Tapes','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5048,'4321204','Taquara','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5049,'4321303','Taquari','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5050,'4321329','Taquaruçu do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5051,'4321352','Tavares','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5052,'4321402','Tenente Portela','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5053,'4321436','Terra de Areia','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5054,'4321451','Teutônia','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5055,'4321469','Tio Hugo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5056,'4321477','Tiradentes do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5057,'4321493','Toropi','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5058,'4321501','Torres','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5059,'4321600','Tramandai','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5060,'4321626','Travesseiro','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5061,'4321634','Três Arroios','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5062,'4321667','Três Cachoeiras','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5063,'4321709','Três Coroas','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5064,'4321808','Três de Maio','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5065,'4321832','Três Forquilhas','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5066,'4321857','Três Palmeiras','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5067,'4321907','Três Passos','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5068,'4321956','Trindade do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5069,'4322004','Triunfo','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5070,'4322103','Tucunduva','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5071,'4322152','Tunas','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5072,'4322186','Tupanci do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5073,'4322202','Tupancireta','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5074,'4322251','Tupandi','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5075,'4322301','Tuparendi','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5076,'4322327','Turuçu','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5077,'4322343','Ubiretama','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5078,'4322350','Uniao da Serra','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5079,'4322376','Unistalda','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5080,'4322400','Uruguaiana','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5081,'4322509','Vacaria','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5082,'4322525','Vale Verde','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5083,'4322533','Vale do Sol','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5084,'4322541','Vale Real','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5085,'4322558','Vanini','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5086,'4322608','Venâncio Aires','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5087,'4322707','Vera Cruz','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5088,'4322806','Veranopolis','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5089,'4322855','Vespasiano Correa','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5090,'4322905','Viadutos','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5091,'4323002','Viamao','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5092,'4323101','Vicente Dutra','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5093,'4323200','Victor Graeff','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5094,'4323309','Vila Flores','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5095,'4323358','Vila Lângaro','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5096,'4323408','Vila Maria','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5097,'4323457','Vila Nova do Sul','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5098,'4323507','Vista Alegre','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5099,'4323606','Vista Alegre do Prata','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5100,'4323705','Vista Gaúcha','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5101,'4323754','Vitoria das Missões','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5102,'4323770','Westfalia','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5103,'4323804','Xangri-la','RS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5104,'5000203','agua Clara','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5105,'5000252','Alcinopolis','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5106,'5000609','Amambai','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5107,'5000708','Anastacio','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5108,'5000807','Anaurilândia','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5109,'5000856','Angelica','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5110,'5000906','Antônio Joao','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5111,'5001003','Aparecida do Taboado','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5112,'5001102','Aquidauana','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5113,'5001243','Aral Moreira','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5114,'5001508','Bandeirantes','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5115,'5001904','Bataguassu','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5116,'5002001','Bataypora','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5117,'5002100','Bela Vista','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5118,'5002159','Bodoquena','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5119,'5002209','Bonito','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5120,'5002308','Brasilândia','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5121,'5002407','Caarapo','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5122,'5002605','Camapua','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5123,'5002704','Campo Grande','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5124,'5002803','Caracol','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5125,'5002902','Cassilândia','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5126,'5002951','Chapadao do Sul','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5127,'5003108','Corguinho','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5128,'5003157','Coronel Sapucaia','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5129,'5003207','Corumba','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5130,'5003256','Costa Rica','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5131,'5003306','Coxim','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5132,'5003454','Deodapolis','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5133,'5003488','Dois Irmaos do Buriti','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5134,'5003504','Douradina','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5135,'5003702','Dourados','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5136,'5003751','Eldorado','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5137,'5003801','Fatima do Sul','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5138,'5003900','Figueirao','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5139,'5004007','Gloria de Dourados','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5140,'5004106','Guia Lopes da Laguna','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5141,'5004304','Iguatemi','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5142,'5004403','Inocência','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5143,'5004502','Itapora','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5144,'5004601','Itaquirai','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5145,'5004700','Ivinhema','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5146,'5004809','Japora','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5147,'5004908','Jaraguari','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5148,'5005004','Jardim','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5149,'5005103','Jatei','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5150,'5005152','Juti','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5151,'5005202','Ladario','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5152,'5005251','Laguna Carapa','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5153,'5005400','Maracaju','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5154,'5005608','Miranda','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5155,'5005681','Mundo Novo','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5156,'5005707','Navirai','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5157,'5005806','Nioaque','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5158,'5006002','Nova Alvorada do Sul','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5159,'5006200','Nova Andradina','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5160,'5006259','Novo Horizonte do Sul','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5161,'5006275','Paraiso das aguas','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5162,'5006309','Paranaiba','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5163,'5006358','Paranhos','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5164,'5006408','Pedro Gomes','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5165,'5006606','Ponta Pora','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5166,'5006903','Porto Murtinho','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5167,'5007109','Ribas do Rio Pardo','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5168,'5007208','Rio Brilhante','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5169,'5007307','Rio Negro','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5170,'5007406','Rio Verde de Mato Grosso','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5171,'5007505','Rochedo','MS','2024-07-03 11:37:23','2024-07-03 11:37:23'),(5172,'5007554','Santa Rita do Pardo','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5173,'5007695','Sao Gabriel do Oeste','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5174,'5007703','Sete Quedas','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5175,'5007802','Selviria','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5176,'5007901','Sidrolândia','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5177,'5007935','Sonora','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5178,'5007950','Tacuru','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5179,'5007976','Taquarussu','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5180,'5008008','Terenos','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5181,'5008305','Três Lagoas','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5182,'5008404','Vicentina','MS','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5183,'5100102','Acorizal','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5184,'5100201','agua Boa','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5185,'5100250','Alta Floresta','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5186,'5100300','Alto Araguaia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5187,'5100359','Alto Boa Vista','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5188,'5100409','Alto Garças','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5189,'5100508','Alto Paraguai','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5190,'5100607','Alto Taquari','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5191,'5100805','Apiacas','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5192,'5101001','Araguaiana','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5193,'5101209','Araguainha','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5194,'5101258','Araputanga','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5195,'5101308','Arenapolis','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5196,'5101407','Aripuana','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5197,'5101605','Barao de Melgaço','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5198,'5101704','Barra do Bugres','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5199,'5101803','Barra do Garças','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5200,'5101852','Bom Jesus do Araguaia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5201,'5101902','Brasnorte','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5202,'5102504','Caceres','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5203,'5102603','Campinapolis','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5204,'5102637','Campo Novo do Parecis','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5205,'5102678','Campo Verde','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5206,'5102686','Campos de Júlio','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5207,'5102694','Canabrava do Norte','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5208,'5102702','Canarana','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5209,'5102793','Carlinda','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5210,'5102850','Castanheira','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5211,'5103007','Chapada dos Guimaraes','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5212,'5103056','Claudia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5213,'5103106','Cocalinho','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5214,'5103205','Colider','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5215,'5103254','Colniza','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5216,'5103304','Comodoro','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5217,'5103353','Confresa','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5218,'5103361','Conquista D\'Oeste','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5219,'5103379','Cotriguaçu','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5220,'5103403','Cuiaba','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5221,'5103437','Curvelândia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5222,'5103452','Denise','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5223,'5103502','Diamantino','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5224,'5103601','Dom Aquino','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5225,'5103700','Feliz Natal','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5226,'5103809','Figueiropolis D\'Oeste','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5227,'5103858','Gaúcha do Norte','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5228,'5103908','General Carneiro','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5229,'5103957','Gloria D\'Oeste','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5230,'5104104','Guaranta do Norte','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5231,'5104203','Guiratinga','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5232,'5104500','Indiavai','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5233,'5104526','Ipiranga do Norte','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5234,'5104542','Itanhanga','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5235,'5104559','Itaúba','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5236,'5104609','Itiquira','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5237,'5104807','Jaciara','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5238,'5104906','Jangada','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5239,'5105002','Jauru','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5240,'5105101','Juara','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5241,'5105150','Juina','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5242,'5105176','Juruena','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5243,'5105200','Juscimeira','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5244,'5105234','Lambari D\'Oeste','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5245,'5105259','Lucas do Rio Verde','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5246,'5105309','Luciara','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5247,'5105507','Vila Bela da Santissima Trindade','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5248,'5105580','Marcelândia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5249,'5105606','Matupa','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5250,'5105622','Mirassol D\'Oeste','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5251,'5105903','Nobres','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5252,'5106000','Nortelândia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5253,'5106109','Nossa Senhora do Livramento','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5254,'5106158','Nova Bandeirantes','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5255,'5106174','Nova Nazare','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5256,'5106182','Nova Lacerda','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5257,'5106190','Nova Santa Helena','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5258,'5106208','Nova Brasilândia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5259,'5106216','Nova Canaa do Norte','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5260,'5106224','Nova Mutum','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5261,'5106232','Nova Olimpia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5262,'5106240','Nova Ubirata','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5263,'5106257','Nova Xavantina','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5264,'5106265','Novo Mundo','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5265,'5106273','Novo Horizonte do Norte','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5266,'5106281','Novo Sao Joaquim','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5267,'5106299','Paranaita','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5268,'5106307','Paranatinga','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5269,'5106315','Novo Santo Antônio','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5270,'5106372','Pedra Preta','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5271,'5106422','Peixoto de Azevedo','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5272,'5106455','Planalto da Serra','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5273,'5106505','Pocone','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5274,'5106653','Pontal do Araguaia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5275,'5106703','Ponte Branca','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5276,'5106752','Pontes e Lacerda','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5277,'5106778','Porto Alegre do Norte','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5278,'5106802','Porto dos Gaúchos','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5279,'5106828','Porto Esperidiao','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5280,'5106851','Porto Estrela','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5281,'5107008','Poxoreo','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5282,'5107040','Primavera do Leste','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5283,'5107065','Querência','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5284,'5107107','Sao Jose dos Quatro Marcos','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5285,'5107156','Reserva do Cabaçal','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5286,'5107180','Ribeirao Cascalheira','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5287,'5107198','Ribeiraozinho','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5288,'5107206','Rio Branco','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5289,'5107248','Santa Carmem','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5290,'5107263','Santo Afonso','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5291,'5107297','Sao Jose do Povo','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5292,'5107305','Sao Jose do Rio Claro','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5293,'5107354','Sao Jose do Xingu','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5294,'5107404','Sao Pedro da Cipa','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5295,'5107578','Rondolândia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5296,'5107602','Rondonopolis','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5297,'5107701','Rosario Oeste','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5298,'5107743','Santa Cruz do Xingu','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5299,'5107750','Salto do Ceu','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5300,'5107768','Santa Rita do Trivelato','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5301,'5107776','Santa Terezinha','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5302,'5107792','Santo Antônio do Leste','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5303,'5107800','Santo Antônio do Leverger','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5304,'5107859','Sao Felix do Araguaia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5305,'5107875','Sapezal','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5306,'5107883','Serra Nova Dourada','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5307,'5107909','Sinop','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5308,'5107925','Sorriso','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5309,'5107941','Tabapora','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5310,'5107958','Tangara da Serra','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5311,'5108006','Tapurah','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5312,'5108055','Terra Nova do Norte','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5313,'5108105','Tesouro','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5314,'5108204','Torixoreu','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5315,'5108303','Uniao do Sul','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5316,'5108352','Vale de Sao Domingos','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5317,'5108402','Varzea Grande','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5318,'5108501','Vera','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5319,'5108600','Vila Rica','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5320,'5108808','Nova Guarita','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5321,'5108857','Nova Marilândia','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5322,'5108907','Nova Maringa','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5323,'5108956','Nova Monte Verde','MT','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5324,'5200050','Abadia de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5325,'5200100','Abadiânia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5326,'5200134','Acreúna','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5327,'5200159','Adelândia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5328,'5200175','agua Fria de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5329,'5200209','agua Limpa','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5330,'5200258','aguas Lindas de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5331,'5200308','Alexânia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5332,'5200506','Aloândia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5333,'5200555','Alto Horizonte','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5334,'5200605','Alto Paraiso de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5335,'5200803','Alvorada do Norte','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5336,'5200829','Amaralina','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5337,'5200852','Americano do Brasil','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5338,'5200902','Amorinopolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5339,'5201108','Anapolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5340,'5201207','Anhanguera','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5341,'5201306','Anicuns','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5342,'5201405','Aparecida de Goiânia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5343,'5201454','Aparecida do Rio Doce','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5344,'5201504','Apore','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5345,'5201603','Araçu','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5346,'5201702','Aragarças','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5347,'5201801','Aragoiânia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5348,'5202155','Araguapaz','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5349,'5202353','Arenopolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5350,'5202502','Aruana','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5351,'5202601','Aurilândia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5352,'5202809','Avelinopolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5353,'5203104','Baliza','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5354,'5203203','Barro Alto','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5355,'5203302','Bela Vista de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5356,'5203401','Bom Jardim de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5357,'5203500','Bom Jesus de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5358,'5203559','Bonfinopolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5359,'5203575','Bonopolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5360,'5203609','Brazabrantes','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5361,'5203807','Britânia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5362,'5203906','Buriti Alegre','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5363,'5203939','Buriti de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5364,'5203962','Buritinopolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5365,'5204003','Cabeceiras','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5366,'5204102','Cachoeira Alta','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5367,'5204201','Cachoeira de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5368,'5204250','Cachoeira Dourada','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5369,'5204300','Caçu','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5370,'5204409','Caiapônia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5371,'5204508','Caldas Novas','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5372,'5204557','Caldazinha','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5373,'5204607','Campestre de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5374,'5204656','Campinaçu','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5375,'5204706','Campinorte','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5376,'5204805','Campo Alegre de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5377,'5204854','Campo Limpo de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5378,'5204904','Campos Belos','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5379,'5204953','Campos Verdes','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5380,'5205000','Carmo do Rio Verde','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5381,'5205059','Castelândia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5382,'5205109','Catalao','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5383,'5205208','Caturai','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5384,'5205307','Cavalcante','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5385,'5205406','Ceres','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5386,'5205455','Cezarina','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5387,'5205471','Chapadao do Ceu','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5388,'5205497','cidades Ocidental','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5389,'5205513','Cocalzinho de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5390,'5205521','Colinas do Sul','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5391,'5205703','Corrego do Ouro','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5392,'5205802','Corumba de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5393,'5205901','Corumbaiba','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5394,'5206206','Cristalina','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5395,'5206305','Cristianopolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5396,'5206404','Crixas','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5397,'5206503','Crominia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5398,'5206602','Cumari','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5399,'5206701','Damianopolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5400,'5206800','Damolândia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5401,'5206909','Davinopolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5402,'5207105','Diorama','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5403,'5207253','Doverlândia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5404,'5207352','Edealina','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5405,'5207402','Edeia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5406,'5207501','Estrela do Norte','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5407,'5207535','Faina','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5408,'5207600','Fazenda Nova','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5409,'5207808','Firminopolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5410,'5207907','Flores de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5411,'5208004','Formosa','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5412,'5208103','Formoso','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5413,'5208152','Gameleira de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5414,'5208301','Divinopolis de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5415,'5208400','Goianapolis','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5416,'5208509','Goiandira','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5417,'5208608','Goianesia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5418,'5208707','Goiânia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5419,'5208806','Goianira','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5420,'5208905','Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5421,'5209101','Goiatuba','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5422,'5209150','Gouvelândia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5423,'5209200','Guapo','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5424,'5209291','Guaraita','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5425,'5209408','Guarani de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5426,'5209457','Guarinos','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5427,'5209606','Heitorai','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5428,'5209705','Hidrolândia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5429,'5209804','Hidrolina','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5430,'5209903','Iaciara','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5431,'5209937','Inaciolândia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5432,'5209952','Indiara','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5433,'5210000','Inhumas','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5434,'5210109','Ipameri','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5435,'5210158','Ipiranga de Goias','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5436,'5210208','Ipora','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5437,'5210307','Israelândia','GO','2024-07-03 11:37:24','2024-07-03 11:37:24'),(5438,'5210406','Itaberai','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5439,'5210562','Itaguari','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5440,'5210604','Itaguaru','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5441,'5210802','Itaja','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5442,'5210901','Itapaci','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5443,'5211008','Itapirapua','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5444,'5211206','Itapuranga','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5445,'5211305','Itaruma','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5446,'5211404','Itauçu','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5447,'5211503','Itumbiara','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5448,'5211602','Ivolândia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5449,'5211701','Jandaia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5450,'5211800','Jaragua','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5451,'5211909','Jatai','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5452,'5212006','Jaupaci','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5453,'5212055','Jesúpolis','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5454,'5212105','Joviânia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5455,'5212204','Jussara','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5456,'5212253','Lagoa Santa','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5457,'5212303','Leopoldo de Bulhões','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5458,'5212501','Luziânia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5459,'5212600','Mairipotaba','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5460,'5212709','Mambai','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5461,'5212808','Mara Rosa','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5462,'5212907','Marzagao','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5463,'5212956','Matrincha','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5464,'5213004','Maurilândia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5465,'5213053','Mimoso de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5466,'5213087','Minaçu','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5467,'5213103','Mineiros','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5468,'5213400','Moipora','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5469,'5213509','Monte Alegre de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5470,'5213707','Montes Claros de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5471,'5213756','Montividiu','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5472,'5213772','Montividiu do Norte','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5473,'5213806','Morrinhos','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5474,'5213855','Morro Agudo de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5475,'5213905','Mossâmedes','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5476,'5214002','Mozarlândia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5477,'5214051','Mundo Novo','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5478,'5214101','Mutunopolis','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5479,'5214408','Nazario','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5480,'5214507','Neropolis','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5481,'5214606','Niquelândia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5482,'5214705','Nova America','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5483,'5214804','Nova Aurora','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5484,'5214838','Nova Crixas','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5485,'5214861','Nova Gloria','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5486,'5214879','Nova Iguaçu de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5487,'5214903','Nova Roma','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5488,'5215009','Nova Veneza','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5489,'5215207','Novo Brasil','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5490,'5215231','Novo Gama','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5491,'5215256','Novo Planalto','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5492,'5215306','Orizona','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5493,'5215405','Ouro Verde de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5494,'5215504','Ouvidor','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5495,'5215603','Padre Bernardo','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5496,'5215652','Palestina de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5497,'5215702','Palmeiras de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5498,'5215801','Palmelo','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5499,'5215900','Palminopolis','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5500,'5216007','Panama','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5501,'5216304','Paranaiguara','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5502,'5216403','Paraúna','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5503,'5216452','Perolândia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5504,'5216809','Petrolina de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5505,'5216908','Pilar de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5506,'5217104','Piracanjuba','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5507,'5217203','Piranhas','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5508,'5217302','Pirenopolis','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5509,'5217401','Pires do Rio','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5510,'5217609','Planaltina','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5511,'5217708','Pontalina','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5512,'5218003','Porangatu','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5513,'5218052','Porteirao','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5514,'5218102','Portelândia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5515,'5218300','Posse','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5516,'5218391','Professor Jamil','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5517,'5218508','Quirinopolis','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5518,'5218607','Rialma','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5519,'5218706','Rianapolis','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5520,'5218789','Rio Quente','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5521,'5218805','Rio Verde','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5522,'5218904','Rubiataba','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5523,'5219001','Sanclerlândia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5524,'5219100','Santa Barbara de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5525,'5219209','Santa Cruz de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5526,'5219258','Santa Fe de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5527,'5219308','Santa Helena de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5528,'5219357','Santa Isabel','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5529,'5219407','Santa Rita do Araguaia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5530,'5219456','Santa Rita do Novo Destino','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5531,'5219506','Santa Rosa de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5532,'5219605','Santa Tereza de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5533,'5219704','Santa Terezinha de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5534,'5219712','Santo Antônio da Barra','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5535,'5219738','Santo Antônio de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5536,'5219753','Santo Antônio do Descoberto','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5537,'5219803','Sao Domingos','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5538,'5219902','Sao Francisco de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5539,'5220009','Sao Joao D\'Aliança','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5540,'5220058','Sao Joao da Paraúna','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5541,'5220108','Sao Luis de Montes Belos','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5542,'5220157','Sao Luiz do Norte','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5543,'5220207','Sao Miguel do Araguaia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5544,'5220264','Sao Miguel do Passa Quatro','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5545,'5220280','Sao Patricio','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5546,'5220405','Sao Simao','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5547,'5220454','Senador Canedo','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5548,'5220504','Serranopolis','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5549,'5220603','Silvânia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5550,'5220686','Simolândia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5551,'5220702','Sitio D\'Abadia','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5552,'5221007','Taquaral de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5553,'5221080','Teresina de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5554,'5221197','Terezopolis de Goias','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5565,'5221908','Varjao','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5566,'5222005','Vianopolis','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5567,'5222054','Vicentinopolis','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5568,'5222203','Vila Boa','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5569,'5222302','Vila Propicio','GO','2024-07-03 11:37:25','2024-07-03 11:37:25'),(5570,'5300108','Brasilia','DF','2024-07-03 11:37:25','2024-07-03 11:37:25');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_ecommerces`
--

DROP TABLE IF EXISTS `cliente_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobre_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ie` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_ecommerces_business_id_foreign` (`business_id`),
  CONSTRAINT `cliente_ecommerces_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_ecommerces`
--

LOCK TABLES `cliente_ecommerces` WRITE;
/*!40000 ALTER TABLE `cliente_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componente_ctes`
--

DROP TABLE IF EXISTS `componente_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `componente_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,4) NOT NULL,
  `cte_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `componente_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `componente_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componente_ctes`
--

LOCK TABLES `componente_ctes` WRITE;
/*!40000 ALTER TABLE `componente_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `componente_ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_ecommerces`
--

DROP TABLE IF EXISTS `config_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `img_contato` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `fav_icon` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `timer_carrossel` int NOT NULL DEFAULT '5',
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_facebook` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_twiter` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_instagram` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frete_gratis_valor` decimal(10,2) NOT NULL,
  `mercadopago_public_key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mercadopago_access_token` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `funcionamento` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `politica_privacidade` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `src_mapa` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `google_api` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `business_id` int unsigned NOT NULL,
  `token` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor_fundo` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#000',
  `cor_btn` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#000',
  `mensagem_agradecimento` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `config_ecommerces_business_id_foreign` (`business_id`),
  CONSTRAINT `config_ecommerces_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_ecommerces`
--

LOCK TABLES `config_ecommerces` WRITE;
/*!40000 ALTER TABLE `config_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `city_id` int unsigned NOT NULL,
  `cpf_cnpj` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ie_rg` varchar(18) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `consumidor_final` int NOT NULL DEFAULT '1',
  `contribuinte` int NOT NULL DEFAULT '1',
  `rua` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rua_entrega` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `complement` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro_entrega` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep_entrega` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id_entrega` int unsigned DEFAULT NULL,
  `cod_pais` int NOT NULL DEFAULT '1058',
  `id_estrangeiro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `total_rp` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacts_business_id_foreign` (`business_id`),
  KEY `contacts_city_id_foreign` (`city_id`),
  KEY `contacts_city_id_entrega_foreign` (`city_id_entrega`),
  KEY `contacts_created_by_foreign` (`created_by`),
  KEY `contacts_type_index` (`type`),
  KEY `contacts_contact_status_index` (`contact_status`),
  CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contacts_city_id_entrega_foreign` FOREIGN KEY (`city_id_entrega`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contacts_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contato_ecommerces`
--

DROP TABLE IF EXISTS `contato_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contato_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contato_ecommerces_business_id_foreign` (`business_id`),
  CONSTRAINT `contato_ecommerces_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contato_ecommerces`
--

LOCK TABLES `contato_ecommerces` WRITE;
/*!40000 ALTER TABLE `contato_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `contato_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contigencia_nves`
--

DROP TABLE IF EXISTS `contigencia_nves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contigencia_nves` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `json` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_emissao` enum('SVCAN','SVCRS','EPEC') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contigencia_nves_business_id_foreign` (`business_id`),
  CONSTRAINT `contigencia_nves_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contigencia_nves`
--

LOCK TABLES `contigencia_nves` WRITE;
/*!40000 ALTER TABLE `contigencia_nves` DISABLE KEYS */;
/*!40000 ALTER TABLE `contigencia_nves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctes`
--

DROP TABLE IF EXISTS `ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `location_id` int unsigned DEFAULT NULL,
  `chave_nfe` varchar(450) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remetente_id` int unsigned NOT NULL,
  `destinatario_id` int unsigned NOT NULL,
  `recebedor_id` int unsigned DEFAULT NULL,
  `expedidor_id` int unsigned DEFAULT NULL,
  `usuario_id` int unsigned NOT NULL,
  `natureza_id` int unsigned NOT NULL,
  `tomador` int NOT NULL,
  `municipio_envio` int unsigned NOT NULL,
  `municipio_inicio` int unsigned NOT NULL,
  `municipio_fim` int unsigned NOT NULL,
  `logradouro_tomador` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero_tomador` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro_tomador` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep_tomador` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `municipio_tomador` int unsigned DEFAULT NULL,
  `valor_transporte` decimal(10,2) NOT NULL,
  `valor_receber` decimal(10,2) NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `produto_predominante` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_previsata_entrega` date NOT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_cce` int NOT NULL,
  `cte_numero` int NOT NULL DEFAULT '0',
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path_xml` varchar(51) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `retira` tinyint(1) NOT NULL,
  `detalhes_retira` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modal` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `veiculo_id` int unsigned NOT NULL,
  `tpDoc` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descOutros` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nDoc` int NOT NULL,
  `vDocFisc` decimal(10,2) NOT NULL,
  `globalizado` int NOT NULL,
  `cst` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '00',
  `perc_icms` decimal(5,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ctes_business_id_foreign` (`business_id`),
  KEY `ctes_location_id_foreign` (`location_id`),
  KEY `ctes_remetente_id_foreign` (`remetente_id`),
  KEY `ctes_destinatario_id_foreign` (`destinatario_id`),
  KEY `ctes_recebedor_id_foreign` (`recebedor_id`),
  KEY `ctes_expedidor_id_foreign` (`expedidor_id`),
  KEY `ctes_usuario_id_foreign` (`usuario_id`),
  KEY `ctes_natureza_id_foreign` (`natureza_id`),
  KEY `ctes_municipio_envio_foreign` (`municipio_envio`),
  KEY `ctes_municipio_inicio_foreign` (`municipio_inicio`),
  KEY `ctes_municipio_fim_foreign` (`municipio_fim`),
  KEY `ctes_municipio_tomador_foreign` (`municipio_tomador`),
  KEY `ctes_veiculo_id_foreign` (`veiculo_id`),
  CONSTRAINT `ctes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ctes_destinatario_id_foreign` FOREIGN KEY (`destinatario_id`) REFERENCES `contacts` (`id`),
  CONSTRAINT `ctes_expedidor_id_foreign` FOREIGN KEY (`expedidor_id`) REFERENCES `contacts` (`id`),
  CONSTRAINT `ctes_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ctes_municipio_envio_foreign` FOREIGN KEY (`municipio_envio`) REFERENCES `cities` (`id`),
  CONSTRAINT `ctes_municipio_fim_foreign` FOREIGN KEY (`municipio_fim`) REFERENCES `cities` (`id`),
  CONSTRAINT `ctes_municipio_inicio_foreign` FOREIGN KEY (`municipio_inicio`) REFERENCES `cities` (`id`),
  CONSTRAINT `ctes_municipio_tomador_foreign` FOREIGN KEY (`municipio_tomador`) REFERENCES `cities` (`id`),
  CONSTRAINT `ctes_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `ctes_recebedor_id_foreign` FOREIGN KEY (`recebedor_id`) REFERENCES `contacts` (`id`),
  CONSTRAINT `ctes_remetente_id_foreign` FOREIGN KEY (`remetente_id`) REFERENCES `contacts` (`id`),
  CONSTRAINT `ctes_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ctes_veiculo_id_foreign` FOREIGN KEY (`veiculo_id`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctes`
--

LOCK TABLES `ctes` WRITE;
/*!40000 ALTER TABLE `ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom_clientes`
--

DROP TABLE IF EXISTS `cupom_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom_clientes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cupom_id` int unsigned NOT NULL,
  `cliente_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cupom_clientes_cupom_id_foreign` (`cupom_id`),
  KEY `cupom_clientes_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `cupom_clientes_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cupom_clientes_cupom_id_foreign` FOREIGN KEY (`cupom_id`) REFERENCES `cupom_descontos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom_clientes`
--

LOCK TABLES `cupom_clientes` WRITE;
/*!40000 ALTER TABLE `cupom_clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom_descontos`
--

DROP TABLE IF EXISTS `cupom_descontos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupom_descontos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cupom_descontos_business_id_foreign` (`business_id`),
  CONSTRAINT `cupom_descontos_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom_descontos`
--

LOCK TABLES `cupom_descontos` WRITE;
/*!40000 ALTER TABLE `cupom_descontos` DISABLE KEYS */;
/*!40000 ALTER TABLE `cupom_descontos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currencies`
--

LOCK TABLES `currencies` WRITE;
/*!40000 ALTER TABLE `currencies` DISABLE KEYS */;
INSERT INTO `currencies` VALUES (1,'Albania','Leke','ALL','Lek',',','.',NULL,NULL),(2,'America','Dollars','USD','$',',','.',NULL,NULL),(3,'Afghanistan','Afghanis','AF','؋',',','.',NULL,NULL),(4,'Argentina','Pesos','ARS','$',',','.',NULL,NULL),(5,'Aruba','Guilders','AWG','ƒ',',','.',NULL,NULL),(6,'Australia','Dollars','AUD','$',',','.',NULL,NULL),(7,'Azerbaijan','New Manats','AZ','ман',',','.',NULL,NULL),(8,'Bahamas','Dollars','BSD','$',',','.',NULL,NULL),(9,'Barbados','Dollars','BBD','$',',','.',NULL,NULL),(10,'Belarus','Rubles','BYR','p.',',','.',NULL,NULL),(11,'Belgium','Euro','EUR','€',',','.',NULL,NULL),(12,'Beliz','Dollars','BZD','BZ$',',','.',NULL,NULL),(13,'Bermuda','Dollars','BMD','$',',','.',NULL,NULL),(14,'Bolivia','Bolivianos','BOB','$b',',','.',NULL,NULL),(15,'Bosnia and Herzegovina','Convertible Marka','BAM','KM',',','.',NULL,NULL),(16,'Botswana','Pula\'s','BWP','P',',','.',NULL,NULL),(17,'Bulgaria','Leva','BG','лв',',','.',NULL,NULL),(18,'Brazil','Reais','BRL','R$','','.',NULL,NULL),(19,'Britain [United Kingdom]','Pounds','GBP','£',',','.',NULL,NULL),(20,'Brunei Darussalam','Dollars','BND','$',',','.',NULL,NULL),(21,'Cambodia','Riels','KHR','៛',',','.',NULL,NULL),(22,'Canada','Dollars','CAD','$',',','.',NULL,NULL),(23,'Cayman Islands','Dollars','KYD','$',',','.',NULL,NULL),(24,'Chile','Pesos','CLP','$',',','.',NULL,NULL),(25,'China','Yuan Renminbi','CNY','¥',',','.',NULL,NULL),(26,'Colombia','Pesos','COP','$',',','.',NULL,NULL),(27,'Costa Rica','Colón','CRC','₡',',','.',NULL,NULL),(28,'Croatia','Kuna','HRK','kn',',','.',NULL,NULL),(29,'Cuba','Pesos','CUP','₱',',','.',NULL,NULL),(30,'Cyprus','Euro','EUR','€','.',',',NULL,NULL),(31,'Czech Republic','Koruny','CZK','Kč',',','.',NULL,NULL),(32,'Denmark','Kroner','DKK','kr',',','.',NULL,NULL),(33,'Dominican Republic','Pesos','DOP ','RD$',',','.',NULL,NULL),(34,'East Caribbean','Dollars','XCD','$',',','.',NULL,NULL),(35,'Egypt','Pounds','EGP','£',',','.',NULL,NULL),(36,'El Salvador','Colones','SVC','$',',','.',NULL,NULL),(37,'England [United Kingdom]','Pounds','GBP','£',',','.',NULL,NULL),(38,'Euro','Euro','EUR','€','.',',',NULL,NULL),(39,'Falkland Islands','Pounds','FKP','£',',','.',NULL,NULL),(40,'Fiji','Dollars','FJD','$',',','.',NULL,NULL),(41,'France','Euro','EUR','€','.',',',NULL,NULL),(42,'Ghana','Cedis','GHC','¢',',','.',NULL,NULL),(43,'Gibraltar','Pounds','GIP','£',',','.',NULL,NULL),(44,'Greece','Euro','EUR','€','.',',',NULL,NULL),(45,'Guatemala','Quetzales','GTQ','Q',',','.',NULL,NULL),(46,'Guernsey','Pounds','GGP','£',',','.',NULL,NULL),(47,'Guyana','Dollars','GYD','$',',','.',NULL,NULL),(48,'Holland [Netherlands]','Euro','EUR','€','.',',',NULL,NULL),(49,'Honduras','Lempiras','HNL','L',',','.',NULL,NULL),(50,'Hong Kong','Dollars','HKD','$',',','.',NULL,NULL),(51,'Hungary','Forint','HUF','Ft',',','.',NULL,NULL),(52,'Iceland','Kronur','ISK','kr',',','.',NULL,NULL),(53,'India','Rupees','INR','₹',',','.',NULL,NULL),(54,'Indonesia','Rupiahs','IDR','Rp',',','.',NULL,NULL),(55,'Iran','Rials','IRR','﷼',',','.',NULL,NULL),(56,'Ireland','Euro','EUR','€','.',',',NULL,NULL),(57,'Isle of Man','Pounds','IMP','£',',','.',NULL,NULL),(58,'Israel','New Shekels','ILS','₪',',','.',NULL,NULL),(59,'Italy','Euro','EUR','€','.',',',NULL,NULL),(60,'Jamaica','Dollars','JMD','J$',',','.',NULL,NULL),(61,'Japan','Yen','JPY','¥',',','.',NULL,NULL),(62,'Jersey','Pounds','JEP','£',',','.',NULL,NULL),(63,'Kazakhstan','Tenge','KZT','лв',',','.',NULL,NULL),(64,'Korea [North]','Won','KPW','₩',',','.',NULL,NULL),(65,'Korea [South]','Won','KRW','₩',',','.',NULL,NULL),(66,'Kyrgyzstan','Soms','KGS','лв',',','.',NULL,NULL),(67,'Laos','Kips','LAK','₭',',','.',NULL,NULL),(68,'Latvia','Lati','LVL','Ls',',','.',NULL,NULL),(69,'Lebanon','Pounds','LBP','£',',','.',NULL,NULL),(70,'Liberia','Dollars','LRD','$',',','.',NULL,NULL),(71,'Liechtenstein','Switzerland Francs','CHF','CHF',',','.',NULL,NULL),(72,'Lithuania','Litai','LTL','Lt',',','.',NULL,NULL),(73,'Luxembourg','Euro','EUR','€','.',',',NULL,NULL),(74,'Macedonia','Denars','MKD','ден',',','.',NULL,NULL),(75,'Malaysia','Ringgits','MYR','RM',',','.',NULL,NULL),(76,'Malta','Euro','EUR','€','.',',',NULL,NULL),(77,'Mauritius','Rupees','MUR','₨',',','.',NULL,NULL),(78,'Mexico','Pesos','MXN','$',',','.',NULL,NULL),(79,'Mongolia','Tugriks','MNT','₮',',','.',NULL,NULL),(80,'Mozambique','Meticais','MZ','MT',',','.',NULL,NULL),(81,'Namibia','Dollars','NAD','$',',','.',NULL,NULL),(82,'Nepal','Rupees','NPR','₨',',','.',NULL,NULL),(83,'Netherlands Antilles','Guilders','ANG','ƒ',',','.',NULL,NULL),(84,'Netherlands','Euro','EUR','€','.',',',NULL,NULL),(85,'New Zealand','Dollars','NZD','$',',','.',NULL,NULL),(86,'Nicaragua','Cordobas','NIO','C$',',','.',NULL,NULL),(87,'Nigeria','Nairas','NG','₦',',','.',NULL,NULL),(88,'North Korea','Won','KPW','₩',',','.',NULL,NULL),(89,'Norway','Krone','NOK','kr',',','.',NULL,NULL),(90,'Oman','Rials','OMR','﷼',',','.',NULL,NULL),(91,'Pakistan','Rupees','PKR','₨',',','.',NULL,NULL),(92,'Panama','Balboa','PAB','B/.',',','.',NULL,NULL),(93,'Paraguay','Guarani','PYG','Gs',',','.',NULL,NULL),(94,'Peru','Nuevos Soles','PE','S/.',',','.',NULL,NULL),(95,'Philippines','Pesos','PHP','Php',',','.',NULL,NULL),(96,'Poland','Zlotych','PL','zł',',','.',NULL,NULL),(97,'Qatar','Rials','QAR','﷼',',','.',NULL,NULL),(98,'Romania','New Lei','RO','lei',',','.',NULL,NULL),(99,'Russia','Rubles','RUB','руб',',','.',NULL,NULL),(100,'Saint Helena','Pounds','SHP','£',',','.',NULL,NULL),(101,'Saudi Arabia','Riyals','SAR','﷼',',','.',NULL,NULL),(102,'Serbia','Dinars','RSD','Дин.',',','.',NULL,NULL),(103,'Seychelles','Rupees','SCR','₨',',','.',NULL,NULL),(104,'Singapore','Dollars','SGD','$',',','.',NULL,NULL),(105,'Slovenia','Euro','EUR','€','.',',',NULL,NULL),(106,'Solomon Islands','Dollars','SBD','$',',','.',NULL,NULL),(107,'Somalia','Shillings','SOS','S',',','.',NULL,NULL),(108,'South Africa','Rand','ZAR','R',',','.',NULL,NULL),(109,'South Korea','Won','KRW','₩',',','.',NULL,NULL),(110,'Spain','Euro','EUR','€','.',',',NULL,NULL),(111,'Sri Lanka','Rupees','LKR','₨',',','.',NULL,NULL),(112,'Sweden','Kronor','SEK','kr',',','.',NULL,NULL),(113,'Switzerland','Francs','CHF','CHF',',','.',NULL,NULL),(114,'Suriname','Dollars','SRD','$',',','.',NULL,NULL),(115,'Syria','Pounds','SYP','£',',','.',NULL,NULL),(116,'Taiwan','New Dollars','TWD','NT$',',','.',NULL,NULL),(117,'Thailand','Baht','THB','฿',',','.',NULL,NULL),(118,'Trinidad and Tobago','Dollars','TTD','TT$',',','.',NULL,NULL),(119,'Turkey','Lira','TRY','TL',',','.',NULL,NULL),(120,'Turkey','Liras','TRL','£',',','.',NULL,NULL),(121,'Tuvalu','Dollars','TVD','$',',','.',NULL,NULL),(122,'Ukraine','Hryvnia','UAH','₴',',','.',NULL,NULL),(123,'United Kingdom','Pounds','GBP','£',',','.',NULL,NULL),(124,'United States of America','Dollars','USD','$',',','.',NULL,NULL),(125,'Uruguay','Pesos','UYU','$U',',','.',NULL,NULL),(126,'Uzbekistan','Sums','UZS','лв',',','.',NULL,NULL),(127,'Vatican City','Euro','EUR','€','.',',',NULL,NULL),(128,'Venezuela','Bolivares Fuertes','VEF','Bs',',','.',NULL,NULL),(129,'Vietnam','Dong','VND','₫',',','.',NULL,NULL),(130,'Yemen','Rials','YER','﷼',',','.',NULL,NULL),(131,'Zimbabwe','Zimbabwe Dollars','ZWD','Z$',',','.',NULL,NULL),(132,'Iraq','Iraqi dinar','IQD','د.ع',',','.',NULL,NULL),(133,'Kenya','Kenyan shilling','KES','KSh',',','.',NULL,NULL),(134,'Bangladesh','Taka','BDT','৳',',','.',NULL,NULL),(135,'Algerie','Algerian dinar','DZD','د.ج',' ','.',NULL,NULL),(136,'United Arab Emirates','United Arab Emirates dirham','AED','د.إ',',','.',NULL,NULL),(137,'Uganda','Uganda shillings','UGX','USh',',','.',NULL,NULL),(138,'Tanzania','Tanzanian shilling','TZS','TSh',',','.',NULL,NULL),(139,'Angola','Kwanza','AOA','Kz',',','.',NULL,NULL),(140,'Kuwait','Kuwaiti dinar','KWD','KD',',','.',NULL,NULL);
/*!40000 ALTER TABLE `currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curtida_produto_ecommerces`
--

DROP TABLE IF EXISTS `curtida_produto_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curtida_produto_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `curtida_produto_ecommerces_produto_id_foreign` (`produto_id`),
  KEY `curtida_produto_ecommerces_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `curtida_produto_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `curtida_produto_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curtida_produto_ecommerces`
--

LOCK TABLES `curtida_produto_ecommerces` WRITE;
/*!40000 ALTER TABLE `curtida_produto_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `curtida_produto_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_groups`
--

DROP TABLE IF EXISTS `customer_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `created_by` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_groups_business_id_foreign` (`business_id`),
  CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_groups`
--

LOCK TABLES `customer_groups` WRITE;
/*!40000 ALTER TABLE `customer_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_configurations`
--

DROP TABLE IF EXISTS `dashboard_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_configurations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `created_by` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_configurations_business_id_foreign` (`business_id`),
  CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_configurations`
--

LOCK TABLES `dashboard_configurations` WRITE;
/*!40000 ALTER TABLE `dashboard_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucaos`
--

DROP TABLE IF EXISTS `devolucaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `contact_id` int unsigned NOT NULL,
  `natureza_id` int unsigned NOT NULL,
  `business_id` int unsigned NOT NULL,
  `location_id` int unsigned DEFAULT NULL,
  `valor_integral` decimal(10,2) NOT NULL,
  `valor_devolvido` decimal(10,2) NOT NULL,
  `motivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacao` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` int NOT NULL,
  `devolucao_parcial` tinyint(1) NOT NULL,
  `chave_nf_entrada` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nNf` int NOT NULL,
  `vFrete` decimal(10,2) NOT NULL,
  `vDesc` decimal(10,2) NOT NULL,
  `chave_gerada` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_gerado` int NOT NULL,
  `vSeguro` decimal(10,2) NOT NULL,
  `vOutro` decimal(10,2) NOT NULL,
  `tipo` int NOT NULL DEFAULT '1',
  `sequencia_cce` int NOT NULL DEFAULT '0',
  `transportadora_nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_cidade` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_cpf_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_ie` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `transportadora_endereco` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_quantidade` decimal(6,2) NOT NULL DEFAULT '0.00',
  `frete_especie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_marca` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_tipo` int NOT NULL DEFAULT '0',
  `veiculo_placa` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `veiculo_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `frete_peso_bruto` decimal(10,3) NOT NULL DEFAULT '0.000',
  `frete_peso_liquido` decimal(10,3) NOT NULL DEFAULT '0.000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devolucaos_contact_id_foreign` (`contact_id`),
  KEY `devolucaos_natureza_id_foreign` (`natureza_id`),
  KEY `devolucaos_business_id_foreign` (`business_id`),
  KEY `devolucaos_location_id_foreign` (`location_id`),
  CONSTRAINT `devolucaos_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `devolucaos_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`),
  CONSTRAINT `devolucaos_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `devolucaos_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucaos`
--

LOCK TABLES `devolucaos` WRITE;
/*!40000 ALTER TABLE `devolucaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `devolucaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `applicable_in_spg` tinyint(1) DEFAULT '0',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `discounts_business_id_index` (`business_id`),
  KEY `discounts_brand_id_index` (`brand_id`),
  KEY `discounts_category_id_index` (`category_id`),
  KEY `discounts_location_id_index` (`location_id`),
  KEY `discounts_priority_index` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_and_notes`
--

DROP TABLE IF EXISTS `document_and_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `document_and_notes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `notable_id` int NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_and_notes_business_id_index` (`business_id`),
  KEY `document_and_notes_notable_id_index` (`notable_id`),
  KEY `document_and_notes_created_by_index` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_and_notes`
--

LOCK TABLES `document_and_notes` WRITE;
/*!40000 ALTER TABLE `document_and_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_and_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emissao_contigencias`
--

DROP TABLE IF EXISTS `emissao_contigencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emissao_contigencias` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recibo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serie` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` int NOT NULL,
  `valor` decimal(16,7) NOT NULL,
  `data_emissao` timestamp NULL DEFAULT NULL,
  `status_reenvio` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emissao_contigencias_business_id_foreign` (`business_id`),
  CONSTRAINT `emissao_contigencias_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emissao_contigencias`
--

LOCK TABLES `emissao_contigencias` WRITE;
/*!40000 ALTER TABLE `emissao_contigencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `emissao_contigencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco_ecommerces`
--

DROP TABLE IF EXISTS `endereco_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `endereco_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` int unsigned NOT NULL,
  `rua` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bairro` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `endereco_ecommerces_cliente_id_foreign` (`cliente_id`),
  CONSTRAINT `endereco_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco_ecommerces`
--

LOCK TABLES `endereco_ecommerces` WRITE;
/*!40000 ALTER TABLE `endereco_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expense_categories_business_id_foreign` (`business_id`),
  CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_categories`
--

LOCK TABLES `expense_categories` WRITE;
/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;
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
-- Table structure for table `group_sub_taxes`
--

DROP TABLE IF EXISTS `group_sub_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int unsigned NOT NULL,
  `tax_id` int unsigned NOT NULL,
  KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  KEY `group_sub_taxes_tax_id_foreign` (`tax_id`),
  CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_sub_taxes`
--

LOCK TABLES `group_sub_taxes` WRITE;
/*!40000 ALTER TABLE `group_sub_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_sub_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ibpts`
--

DROP TABLE IF EXISTS `ibpts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ibpts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versao` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ibpts`
--

LOCK TABLES `ibpts` WRITE;
/*!40000 ALTER TABLE `ibpts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ibpts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_descargas`
--

DROP TABLE IF EXISTS `info_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info_descargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `tp_unid_transp` int NOT NULL,
  `id_unid_transp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `info_descargas_mdfe_id_foreign` (`mdfe_id`),
  KEY `info_descargas_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `info_descargas_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `info_descargas_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_descargas`
--

LOCK TABLES `info_descargas` WRITE;
/*!40000 ALTER TABLE `info_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informativo_ecommerces`
--

DROP TABLE IF EXISTS `informativo_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informativo_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `informativo_ecommerces_business_id_foreign` (`business_id`),
  CONSTRAINT `informativo_ecommerces_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informativo_ecommerces`
--

LOCK TABLES `informativo_ecommerces` WRITE;
/*!40000 ALTER TABLE `informativo_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `informativo_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inutils`
--

DROP TABLE IF EXISTS `inutils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inutils` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `business_id` bigint NOT NULL,
  `nNFIni` bigint NOT NULL,
  `nNFFin` bigint NOT NULL,
  `serie` int NOT NULL,
  `tpAmb` int NOT NULL,
  `modelo` int NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xJust` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inutils`
--

LOCK TABLES `inutils` WRITE;
/*!40000 ALTER TABLE `inutils` DISABLE KEYS */;
/*!40000 ALTER TABLE `inutils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_layouts`
--

DROP TABLE IF EXISTS `invoice_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_layouts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int unsigned NOT NULL,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_layouts_business_id_foreign` (`business_id`),
  CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_layouts`
--

LOCK TABLES `invoice_layouts` WRITE;
/*!40000 ALTER TABLE `invoice_layouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_schemes`
--

DROP TABLE IF EXISTS `invoice_schemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice_schemes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int DEFAULT NULL,
  `invoice_count` int NOT NULL DEFAULT '0',
  `total_digits` int DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_schemes_business_id_foreign` (`business_id`),
  CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_schemes`
--

LOCK TABLES `invoice_schemes` WRITE;
/*!40000 ALTER TABLE `invoice_schemes` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice_schemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_devolucaos`
--

DROP TABLE IF EXISTS `item_devolucaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_devolucaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cod` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ncm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codBarras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_unit` decimal(10,2) NOT NULL,
  `quantidade` decimal(8,2) NOT NULL,
  `item_parcial` tinyint(1) NOT NULL,
  `unidade_medida` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_csosn` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_pis` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_cofins` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cst_ipi` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perc_icms` decimal(8,2) NOT NULL,
  `vICMS` decimal(10,2) NOT NULL,
  `perc_pis` decimal(8,2) NOT NULL,
  `perc_cofins` decimal(8,2) NOT NULL,
  `perc_ipi` decimal(8,2) NOT NULL,
  `pRedBC` decimal(8,2) NOT NULL,
  `vBC` decimal(8,2) NOT NULL,
  `devolucao_id` int unsigned NOT NULL,
  `codigo_anp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `descricao_anp` varchar(95) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `perc_glp` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_gnn` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_gni` decimal(5,2) NOT NULL DEFAULT '0.00',
  `uf_cons` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_partida` decimal(10,2) NOT NULL DEFAULT '0.00',
  `unidade_tributavel` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quantidade_tributavel` decimal(10,2) NOT NULL DEFAULT '0.00',
  `vBCSTRet` decimal(8,2) NOT NULL DEFAULT '0.00',
  `vFrete` decimal(8,2) NOT NULL DEFAULT '0.00',
  `modBCST` decimal(8,2) NOT NULL,
  `vBCST` decimal(8,2) NOT NULL,
  `pICMSST` decimal(8,2) NOT NULL,
  `vICMSST` decimal(8,2) NOT NULL,
  `pMVAST` decimal(8,2) NOT NULL,
  `orig` int NOT NULL,
  `pST` decimal(10,2) NOT NULL,
  `vICMSSubstituto` decimal(10,2) NOT NULL,
  `vICMSSTRet` decimal(10,2) NOT NULL,
  `vbcPis` decimal(12,2) NOT NULL,
  `vbcCofins` decimal(12,2) NOT NULL,
  `vbcIpi` decimal(12,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_devolucaos_devolucao_id_foreign` (`devolucao_id`),
  CONSTRAINT `item_devolucaos_devolucao_id_foreign` FOREIGN KEY (`devolucao_id`) REFERENCES `devolucaos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_devolucaos`
--

LOCK TABLES `item_devolucaos` WRITE;
/*!40000 ALTER TABLE `item_devolucaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_devolucaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_dves`
--

DROP TABLE IF EXISTS `item_dves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_dves` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `numero_nfe` int NOT NULL,
  `produto_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_dves_business_id_foreign` (`business_id`),
  CONSTRAINT `item_dves_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_dves`
--

LOCK TABLES `item_dves` WRITE;
/*!40000 ALTER TABLE `item_dves` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_dves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_ibpts`
--

DROP TABLE IF EXISTS `item_ibpts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_ibpts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ibte_id` int unsigned NOT NULL,
  `codigo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacional_federal` decimal(5,2) NOT NULL,
  `importado_federal` decimal(5,2) NOT NULL,
  `estadual` decimal(5,2) NOT NULL,
  `municipal` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_ibpts_ibte_id_foreign` (`ibte_id`),
  CONSTRAINT `item_ibpts_ibte_id_foreign` FOREIGN KEY (`ibte_id`) REFERENCES `ibpts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_ibpts`
--

LOCK TABLES `item_ibpts` WRITE;
/*!40000 ALTER TABLE `item_ibpts` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_ibpts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido_ecommerces`
--

DROP TABLE IF EXISTS `item_pedido_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pedido_id` int unsigned NOT NULL,
  `produto_id` int unsigned NOT NULL,
  `quantidade` int NOT NULL,
  `variacao_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_pedido_ecommerces_pedido_id_foreign` (`pedido_id`),
  KEY `item_pedido_ecommerces_produto_id_foreign` (`produto_id`),
  CONSTRAINT `item_pedido_ecommerces_pedido_id_foreign` FOREIGN KEY (`pedido_id`) REFERENCES `pedido_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `item_pedido_ecommerces_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido_ecommerces`
--

LOCK TABLES `item_pedido_ecommerces` WRITE;
/*!40000 ALTER TABLE `item_pedido_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lacre_transportes`
--

DROP TABLE IF EXISTS `lacre_transportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lacre_transportes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lacre_transportes_info_id_foreign` (`info_id`),
  CONSTRAINT `lacre_transportes_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lacre_transportes`
--

LOCK TABLES `lacre_transportes` WRITE;
/*!40000 ALTER TABLE `lacre_transportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lacre_transportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lacre_unidade_cargas`
--

DROP TABLE IF EXISTS `lacre_unidade_cargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lacre_unidade_cargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `numero` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lacre_unidade_cargas_info_id_foreign` (`info_id`),
  CONSTRAINT `lacre_unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lacre_unidade_cargas`
--

LOCK TABLES `lacre_unidade_cargas` WRITE;
/*!40000 ALTER TABLE `lacre_unidade_cargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `lacre_unidade_cargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manifesto_limites`
--

DROP TABLE IF EXISTS `manifesto_limites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manifesto_limites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manifesto_limites_business_id_foreign` (`business_id`),
  CONSTRAINT `manifesto_limites_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manifesto_limites`
--

LOCK TABLES `manifesto_limites` WRITE;
/*!40000 ALTER TABLE `manifesto_limites` DISABLE KEYS */;
/*!40000 ALTER TABLE `manifesto_limites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manifestos`
--

DROP TABLE IF EXISTS `manifestos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manifestos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `location_id` int unsigned DEFAULT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `num_prot` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_emissao` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sequencia_evento` int NOT NULL,
  `fatura_salva` tinyint(1) NOT NULL,
  `tipo` int NOT NULL,
  `nsu` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manifestos_business_id_foreign` (`business_id`),
  KEY `manifestos_location_id_foreign` (`location_id`),
  CONSTRAINT `manifestos_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `manifestos_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manifestos`
--

LOCK TABLES `manifestos` WRITE;
/*!40000 ALTER TABLE `manifestos` DISABLE KEYS */;
/*!40000 ALTER TABLE `manifestos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mdves`
--

DROP TABLE IF EXISTS `mdves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mdves` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `location_id` int unsigned DEFAULT NULL,
  `uf_inicio` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf_fim` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `encerrado` tinyint(1) NOT NULL,
  `data_inicio_viagem` date NOT NULL,
  `carga_posterior` tinyint(1) NOT NULL,
  `cnpj_contratante` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `veiculo_tracao_id` int unsigned NOT NULL,
  `veiculo_reboque1_id` int unsigned DEFAULT NULL,
  `veiculo_reboque2_id` int unsigned DEFAULT NULL,
  `veiculo_reboque3_id` int unsigned DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mdfe_numero` int NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `protocolo` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seguradora_nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seguradora_cnpj` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_apolice` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_averbacao` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor_carga` decimal(10,2) NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `info_complementar` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_adicional_fisco` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condutor_nome` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condutor_cpf` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lac_rodo` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_emit` int NOT NULL,
  `tp_transp` int NOT NULL,
  `produto_pred_nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_pred_ncm` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `produto_pred_cod_barras` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_carrega` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cep_descarrega` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tp_carga` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude_carregamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude_carregamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude_descarregamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude_descarregamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdves_business_id_foreign` (`business_id`),
  KEY `mdves_location_id_foreign` (`location_id`),
  KEY `mdves_veiculo_tracao_id_foreign` (`veiculo_tracao_id`),
  KEY `mdves_veiculo_reboque1_id_foreign` (`veiculo_reboque1_id`),
  KEY `mdves_veiculo_reboque2_id_foreign` (`veiculo_reboque2_id`),
  KEY `mdves_veiculo_reboque3_id_foreign` (`veiculo_reboque3_id`),
  CONSTRAINT `mdves_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mdves_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `mdves_veiculo_reboque1_id_foreign` FOREIGN KEY (`veiculo_reboque1_id`) REFERENCES `veiculos` (`id`),
  CONSTRAINT `mdves_veiculo_reboque2_id_foreign` FOREIGN KEY (`veiculo_reboque2_id`) REFERENCES `veiculos` (`id`),
  CONSTRAINT `mdves_veiculo_reboque3_id_foreign` FOREIGN KEY (`veiculo_reboque3_id`) REFERENCES `veiculos` (`id`),
  CONSTRAINT `mdves_veiculo_tracao_id_foreign` FOREIGN KEY (`veiculo_tracao_id`) REFERENCES `veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mdves`
--

LOCK TABLES `mdves` WRITE;
/*!40000 ALTER TABLE `mdves` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `uploaded_by` int DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medida_ctes`
--

DROP TABLE IF EXISTS `medida_ctes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medida_ctes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cod_unidade` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_medida` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_carga` decimal(10,4) NOT NULL,
  `cte_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medida_ctes_cte_id_foreign` (`cte_id`),
  CONSTRAINT `medida_ctes_cte_id_foreign` FOREIGN KEY (`cte_id`) REFERENCES `ctes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medida_ctes`
--

LOCK TABLES `medida_ctes` WRITE;
/*!40000 ALTER TABLE `medida_ctes` DISABLE KEYS */;
/*!40000 ALTER TABLE `medida_ctes` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_02_21_105329_create_system_table',1),(2,'2014_10_12_000000_create_users_table',1),(3,'2014_10_12_003455_create_cities_table',1),(4,'2014_10_12_100000_create_password_resets_table',1),(5,'2017_07_05_071953_create_currencies_table',1),(6,'2017_07_05_073658_create_business_table',1),(7,'2017_07_05_074333_create_natureza_operacaos_table',1),(8,'2017_07_22_075923_add_business_id_users_table',1),(9,'2017_07_23_113209_create_brands_table',1),(10,'2017_07_26_083429_create_permission_tables',1),(11,'2017_07_26_110000_create_tax_rates_table',1),(12,'2017_07_26_122313_create_units_table',1),(13,'2017_07_27_075706_create_contacts_table',1),(14,'2017_08_04_071038_create_categories_table',1),(15,'2017_08_08_115903_create_products_table',1),(16,'2017_08_09_061616_create_variation_templates_table',1),(17,'2017_08_09_061638_create_variation_value_templates_table',1),(18,'2017_08_10_061146_create_product_variations_table',1),(19,'2017_08_10_061216_create_variations_table',1),(20,'2017_08_18_054827_create_transportadoras_table',1),(21,'2017_08_19_054827_create_transactions_table',1),(22,'2017_08_31_073533_create_purchase_lines_table',1),(23,'2017_10_15_064638_create_transaction_payments_table',1),(24,'2017_10_31_065621_add_default_sales_tax_to_business_table',1),(25,'2017_11_20_051930_create_table_group_sub_taxes',1),(26,'2017_11_20_063603_create_transaction_sell_lines',1),(27,'2017_11_21_064540_create_barcodes_table',1),(28,'2017_11_23_181237_create_invoice_schemes_table',1),(29,'2017_12_25_122822_create_business_locations_table',1),(30,'2017_12_25_160253_add_location_id_to_transactions_table',1),(31,'2017_12_25_163227_create_variation_location_details_table',1),(32,'2018_01_04_115627_create_sessions_table',1),(33,'2018_01_05_112817_create_invoice_layouts_table',1),(34,'2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations',1),(35,'2018_01_08_104124_create_expense_categories_table',1),(36,'2018_01_08_123327_modify_transactions_table_for_expenses',1),(37,'2018_01_09_111005_modify_payment_status_in_transactions_table',1),(38,'2018_01_09_111109_add_paid_on_column_to_transaction_payments_table',1),(39,'2018_01_25_172439_add_printer_related_fields_to_business_locations_table',1),(40,'2018_01_27_184322_create_printers_table',1),(41,'2018_01_30_181442_create_cash_registers_table',1),(42,'2018_01_31_125836_create_cash_register_transactions_table',1),(43,'2018_02_07_173326_modify_business_table',1),(44,'2018_02_08_105425_add_enable_product_expiry_column_to_business_table',1),(45,'2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table',1),(46,'2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table',1),(47,'2018_02_08_155348_add_exchange_rate_to_transactions_table',1),(48,'2018_02_09_124945_modify_transaction_payments_table_for_contact_payments',1),(49,'2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table',1),(50,'2018_02_12_114605_add_quantity_sold_in_purchase_lines_table',1),(51,'2018_02_13_183323_alter_decimal_fields_size',1),(52,'2018_02_14_161928_add_transaction_edit_days_to_business_table',1),(53,'2018_02_15_161032_add_document_column_to_transactions_table',1),(54,'2018_02_17_124709_add_more_options_to_invoice_layouts',1),(55,'2018_02_19_111517_add_keyboard_shortcut_column_to_business_table',1),(56,'2018_02_19_121537_stock_adjustment_move_to_transaction_table',1),(57,'2018_02_20_165505_add_is_direct_sale_column_to_transactions_table',1),(58,'2018_02_23_100549_version_1_2',1),(59,'2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table',1),(60,'2018_02_26_103612_add_sales_commission_agent_column_to_business_table',1),(61,'2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt',1),(62,'2018_02_26_134500_add_commission_agent_to_transactions_table',1),(63,'2018_02_27_121422_add_item_addition_method_to_business_table',1),(64,'2018_02_27_170232_modify_transactions_table_for_stock_transfer',1),(65,'2018_03_05_153510_add_enable_inline_tax_column_to_business_table',1),(66,'2018_03_06_210206_modify_product_barcode_types',1),(67,'2018_03_13_181541_add_expiry_type_to_business_table',1),(68,'2018_03_16_113446_product_expiry_setting_for_business',1),(69,'2018_03_19_113601_add_business_settings_options',1),(70,'2018_03_26_125334_add_pos_settings_to_business_table',1),(71,'2018_03_26_165350_create_customer_groups_table',1),(72,'2018_03_27_122720_customer_group_related_changes_in_tables',1),(73,'2018_03_29_110138_change_tax_field_to_nullable_in_business_table',1),(74,'2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table',1),(75,'2018_03_29_134340_add_inline_discount_fields_in_purchase_lines',1),(76,'2018_03_31_140921_update_transactions_table_exchange_rate',1),(77,'2018_04_03_103037_add_contact_id_to_contacts_table',1),(78,'2018_04_03_122709_add_changes_to_invoice_layouts_table',1),(79,'2018_04_09_135320_change_exchage_rate_size_in_business_table',1),(80,'2018_04_17_123122_add_lot_number_to_business',1),(81,'2018_04_17_160845_add_product_racks_table',1),(82,'2018_04_20_182015_create_res_tables_table',1),(83,'2018_04_24_105246_restaurant_fields_in_transaction_table',1),(84,'2018_04_24_114149_add_enabled_modules_business_table',1),(85,'2018_04_24_133704_add_modules_fields_in_invoice_layout_table',1),(86,'2018_04_27_132653_quotation_related_change',1),(87,'2018_05_02_104439_add_date_format_and_time_format_to_business',1),(88,'2018_05_02_111939_add_sell_return_to_transaction_payments',1),(89,'2018_05_14_114027_add_rows_positions_for_products',1),(90,'2018_05_14_125223_add_weight_to_products_table',1),(91,'2018_05_14_164754_add_opening_stock_permission',1),(92,'2018_05_15_134729_add_design_to_invoice_layouts',1),(93,'2018_05_16_183307_add_tax_fields_invoice_layout',1),(94,'2018_05_18_191956_add_sell_return_to_transaction_table',1),(95,'2018_05_21_131349_add_custom_fileds_to_contacts_table',1),(96,'2018_05_21_131607_invoice_layout_fields_for_sell_return',1),(97,'2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table',1),(98,'2018_05_22_123527_create_reference_counts_table',1),(99,'2018_05_22_154540_add_ref_no_prefixes_column_to_business_table',1),(100,'2018_05_24_132620_add_ref_no_column_to_transaction_payments_table',1),(101,'2018_05_24_161026_add_location_id_column_to_business_location_table',1),(102,'2018_05_25_180603_create_modifiers_related_table',1),(103,'2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table',1),(104,'2018_05_31_114645_add_res_order_status_column_to_transactions_table',1),(105,'2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table',1),(106,'2018_06_05_111905_modify_products_table_for_modifiers',1),(107,'2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table',1),(108,'2018_06_07_152443_add_is_service_staff_to_roles_table',1),(109,'2018_06_07_182258_add_image_field_to_products_table',1),(110,'2018_06_13_133705_create_bookings_table',1),(111,'2018_06_15_173636_add_email_column_to_contacts_table',1),(112,'2018_06_27_182835_add_superadmin_related_fields_business',1),(113,'2018_06_27_185405_create_packages_table',1),(114,'2018_06_28_182803_create_subscriptions_table',1),(115,'2018_07_10_101913_add_custom_fields_to_products_table',1),(116,'2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table',1),(117,'2018_07_17_163920_add_theme_skin_color_column_to_business_table',1),(118,'2018_07_17_182021_add_rows_to_system_table',1),(119,'2018_07_19_131721_add_options_to_packages_table',1),(120,'2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table',1),(121,'2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table',1),(122,'2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table',1),(123,'2018_07_26_124720_change_design_column_type_in_invoice_layouts_table',1),(124,'2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table',1),(125,'2018_07_28_103614_add_credit_limit_column_to_contacts_table',1),(126,'2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table',1),(127,'2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods',1),(128,'2018_08_14_104036_add_opening_balance_type_to_transactions_table',1),(129,'2018_08_17_155534_add_min_termination_alert_days',1),(130,'2018_08_28_105945_add_business_based_username_settings_to_system_table',1),(131,'2018_08_30_105906_add_superadmin_communicator_logs_table',1),(132,'2018_09_04_155900_create_accounts_table',1),(133,'2018_09_06_114438_create_selling_price_groups_table',1),(134,'2018_09_06_154057_create_variation_group_prices_table',1),(135,'2018_09_07_102413_add_permission_to_access_default_selling_price',1),(136,'2018_09_07_134858_add_selling_price_group_id_to_transactions_table',1),(137,'2018_09_10_112448_update_product_type_to_single_if_null_in_products_table',1),(138,'2018_09_10_152703_create_account_transactions_table',1),(139,'2018_09_10_173656_add_account_id_column_to_transaction_payments_table',1),(140,'2018_09_19_123914_create_notification_templates_table',1),(141,'2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table',1),(142,'2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table',1),(143,'2018_09_26_105557_add_transaction_payments_for_existing_expenses',1),(144,'2018_09_27_111609_modify_transactions_table_for_purchase_return',1),(145,'2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table',1),(146,'2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table',1),(147,'2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table',1),(148,'2018_10_03_185947_add_default_notification_templates_to_database',1),(149,'2018_10_09_153105_add_business_id_to_transaction_payments_table',1),(150,'2018_10_16_135229_create_permission_for_sells_and_purchase',1),(151,'2018_10_22_114441_add_columns_for_variable_product_modifications',1),(152,'2018_10_22_134428_modify_variable_product_data',1),(153,'2018_10_30_181558_add_table_tax_headings_to_invoice_layout',1),(154,'2018_10_31_122619_add_pay_terms_field_transactions_table',1),(155,'2018_10_31_161328_add_new_permissions_for_pos_screen',1),(156,'2018_10_31_174752_add_access_selected_contacts_only_to_users_table',1),(157,'2018_10_31_175627_add_user_contact_access',1),(158,'2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table',1),(159,'2018_11_02_130636_add_custom_permissions_to_packages_table',1),(160,'2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table',1),(161,'2018_11_05_161848_add_more_fields_to_packages_table',1),(162,'2018_11_08_105621_add_role_permissions',1),(163,'2018_11_26_114135_add_is_suspend_column_to_transactions_table',1),(164,'2018_11_28_104410_modify_units_table_for_multi_unit',1),(165,'2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines',1),(166,'2018_11_29_115918_add_primary_key_in_system_table',1),(167,'2018_12_03_185546_add_product_description_column_to_products_table',1),(168,'2018_12_06_114937_modify_system_table_and_users_table',1),(169,'2018_12_10_124621_modify_system_table_values_null_default',1),(170,'2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table',1),(171,'2018_12_14_103307_modify_system_table',1),(172,'2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table',1),(173,'2018_12_18_170656_add_invoice_token_column_to_transaction_table',1),(174,'2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table',1),(175,'2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table',1),(176,'2018_12_24_154933_create_notifications_table',1),(177,'2019_01_08_112015_add_document_column_to_transaction_payments_table',1),(178,'2019_01_10_124645_add_account_permission',1),(179,'2019_01_16_125825_add_subscription_no_column_to_transactions_table',1),(180,'2019_01_28_111647_add_order_addresses_column_to_transactions_table',1),(181,'2019_02_13_173821_add_is_inactive_column_to_products_table',1),(182,'2019_02_19_103118_create_discounts_table',1),(183,'2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table',1),(184,'2019_02_21_134324_add_permission_for_discount',1),(185,'2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table',1),(186,'2019_03_09_102425_add_sub_type_column_to_transactions_table',1),(187,'2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table',1),(188,'2019_03_12_120336_create_activity_log_table',1),(189,'2019_03_15_132925_create_media_table',1),(190,'2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table',1),(191,'2019_05_10_132311_add_missing_column_indexing',1),(192,'2019_05_10_135434_add_missing_database_column_indexes',1),(193,'2019_05_14_091812_add_show_image_column_to_invoice_layouts_table',1),(194,'2019_05_25_104922_add_view_purchase_price_permission',1),(195,'2019_06_17_103515_add_profile_informations_columns_to_users_table',1),(196,'2019_06_18_135524_add_permission_to_view_own_sales_only',1),(197,'2019_06_19_112058_add_database_changes_for_reward_points',1),(198,'2019_06_28_133732_change_type_column_to_string_in_transactions_table',1),(199,'2019_07_13_111420_add_is_created_from_api_column_to_transactions_table',1),(200,'2019_07_15_165136_add_fields_for_combo_product',1),(201,'2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table',1),(202,'2019_07_22_152649_add_not_for_selling_in_product_table',1),(203,'2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table',1),(204,'2019_08_08_162302_add_sub_units_related_fields',1),(205,'2019_08_16_115300_create_superadmin_frontend_pages_table',1),(206,'2019_08_19_000000_create_failed_jobs_table',1),(207,'2019_08_26_133419_update_price_fields_decimal_point',1),(208,'2019_09_02_160054_remove_location_permissions_from_roles',1),(209,'2019_09_03_185259_add_permission_for_pos_screen',1),(210,'2019_09_04_163141_add_location_id_to_cash_registers_table',1),(211,'2019_09_04_184008_create_types_of_services_table',1),(212,'2019_09_06_131445_add_types_of_service_fields_to_transactions_table',1),(213,'2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table',1),(214,'2019_09_12_105616_create_product_locations_table',1),(215,'2019_09_17_122522_add_custom_labels_column_to_business_table',1),(216,'2019_09_18_164319_add_shipping_fields_to_transactions_table',1),(217,'2019_09_19_170927_close_all_active_registers',1),(218,'2019_09_23_161906_add_media_description_cloumn_to_media_table',1),(219,'2019_10_18_155633_create_account_types_table',1),(220,'2019_10_22_163335_add_common_settings_column_to_business_table',1),(221,'2019_10_29_132521_add_update_purchase_status_permission',1),(222,'2019_11_09_110522_add_indexing_to_lot_number',1),(223,'2019_11_19_170824_add_is_active_column_to_business_locations_table',1),(224,'2019_11_21_162913_change_quantity_field_types_to_decimal',1),(225,'2019_11_25_160340_modify_categories_table_for_polymerphic_relationship',1),(226,'2019_12_02_105025_create_warranties_table',1),(227,'2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table',1),(228,'2019_12_05_183955_add_more_fields_to_users_table',1),(229,'2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table',1),(230,'2019_12_11_121307_add_draft_and_quotation_list_permissions',1),(231,'2019_12_12_180126_copy_expense_total_to_total_before_tax',1),(232,'2019_12_14_000001_create_personal_access_tokens_table',1),(233,'2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table',1),(234,'2019_12_25_173413_create_dashboard_configurations_table',1),(235,'2020_01_08_133506_create_document_and_notes_table',1),(236,'2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table',1),(237,'2020_01_16_174818_add_round_off_amount_field_to_transactions_table',1),(238,'2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table',1),(239,'2020_02_18_172447_add_import_fields_to_transactions_table',1),(240,'2020_03_13_135844_add_is_active_column_to_selling_price_groups_table',1),(241,'2020_03_16_115449_add_contact_status_field_to_contacts_table',1),(242,'2020_03_26_124736_add_allow_login_column_in_users_table',1),(243,'2020_04_13_154150_add_feature_products_column_to_business_loactions',1),(244,'2020_04_15_151802_add_user_type_to_users_table',1),(245,'2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table',1),(246,'2020_04_28_111436_add_shipping_address_to_contacts_table',1),(247,'2020_06_01_094654_add_max_sale_discount_column_to_users_table',1),(248,'2020_08_16_154813_create_devolucaos_table',1),(249,'2020_08_16_155443_create_item_devolucaos_table',1),(250,'2020_11_14_143711_create_veiculos_table',1),(251,'2020_11_15_142315_create_ctes_table',1),(252,'2020_11_15_142325_create_componente_ctes_table',1),(253,'2020_11_15_142337_create_medida_ctes_table',1),(254,'2020_11_21_090013_create_manifestos_table',1),(255,'2020_11_21_090053_create_manifesto_limites_table',1),(256,'2020_11_21_090341_create_item_dves_table',1),(257,'2021_02_23_100732_create_mdves_table',1),(258,'2021_02_23_101052_create_municipio_carregamentos_table',1),(259,'2021_02_23_101145_create_percursos_table',1),(260,'2021_02_23_101216_create_ciots_table',1),(261,'2021_02_23_101247_create_vale_pedagios_table',1),(262,'2021_02_23_101319_create_info_descargas_table',1),(263,'2021_02_23_101410_create_n_fe_descargas_table',1),(264,'2021_02_23_101419_create_c_te_descargas_table',1),(265,'2021_02_23_101513_create_lacre_unidade_cargas_table',1),(266,'2021_02_23_101534_create_unidade_cargas_table',1),(267,'2021_02_23_101621_create_lacre_transportes_table',1),(268,'2021_03_04_211806_create_ibpts_table',1),(269,'2021_03_04_211819_create_item_ibpts_table',1),(270,'2021_03_27_080343_create_pais_table',1),(271,'2021_07_09_181453_create_config_ecommerces_table',1),(272,'2021_07_10_171100_create_cliente_ecommerces_table',1),(273,'2021_07_10_171238_create_endereco_ecommerces_table',1),(274,'2021_07_10_182003_create_pedido_ecommerces_table',1),(275,'2021_07_11_171835_create_item_pedido_ecommerces_table',1),(276,'2021_07_13_175943_create_carrossel_ecommerces_table',1),(277,'2021_07_18_093744_create_informativo_ecommerces_table',1),(278,'2021_07_18_093804_create_contato_ecommerces_table',1),(279,'2021_07_21_150022_create_produto_imagems_table',1),(280,'2021_07_30_131207_create_curtida_produto_ecommerces_table',1),(281,'2022_05_12_115945_create_cidade_frete_gratis_table',1),(282,'2022_05_12_120043_create_cupom_descontos_table',1),(283,'2022_05_12_120158_create_cupom_clientes_table',1),(284,'2022_06_13_104034_create_table_inutils',1),(285,'2022_07_06_155322_create_revenues_table',1),(286,'2022_07_07_012807_create_banks_table',1),(287,'2022_07_07_185537_create_boletos_table',1),(288,'2022_07_07_185856_create_remessas_table',1),(289,'2022_07_07_185857_create_remessa_boletos_table',1),(290,'2022_07_09_112243_create_payment_plans_table',1),(291,'2022_11_07_134949_create_categoria_conta_financeiras_table',1),(292,'2022_11_08_103054_add_column_table_youtube_video_lessons',1),(293,'2022_12_19_102559_create_sangria_suprimentos_table',1),(294,'2023_03_15_150121_create_system_updates_table',1),(295,'2023_05_05_112039_create_contigencia_nves_table',1),(296,'2023_05_05_112110_create_emissao_contigencias_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` int unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio_carregamentos`
--

DROP TABLE IF EXISTS `municipio_carregamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio_carregamentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `municipio_carregamentos_mdfe_id_foreign` (`mdfe_id`),
  KEY `municipio_carregamentos_cidade_id_foreign` (`cidade_id`),
  CONSTRAINT `municipio_carregamentos_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `municipio_carregamentos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio_carregamentos`
--

LOCK TABLES `municipio_carregamentos` WRITE;
/*!40000 ALTER TABLE `municipio_carregamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio_carregamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `n_fe_descargas`
--

DROP TABLE IF EXISTS `n_fe_descargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `n_fe_descargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `chave` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seg_cod_barras` varchar(44) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `n_fe_descargas_info_id_foreign` (`info_id`),
  CONSTRAINT `n_fe_descargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `n_fe_descargas`
--

LOCK TABLES `n_fe_descargas` WRITE;
/*!40000 ALTER TABLE `n_fe_descargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `n_fe_descargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `natureza_operacaos`
--

DROP TABLE IF EXISTS `natureza_operacaos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `natureza_operacaos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `natureza` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cfop_entrada_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfop_entrada_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfop_saida_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfop_saida_inter_estadual` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `business_id` int unsigned NOT NULL,
  `finNFe` int NOT NULL DEFAULT '1',
  `tipo` int NOT NULL DEFAULT '1',
  `sobrescreve_cfop` tinyint(1) NOT NULL DEFAULT '0',
  `bonificacao` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `natureza_operacaos_business_id_foreign` (`business_id`),
  CONSTRAINT `natureza_operacaos_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `natureza_operacaos`
--

LOCK TABLES `natureza_operacaos` WRITE;
/*!40000 ALTER TABLE `natureza_operacaos` DISABLE KEYS */;
/*!40000 ALTER TABLE `natureza_operacaos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_templates`
--

DROP TABLE IF EXISTS `notification_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_templates`
--

LOCK TABLES `notification_templates` WRITE;
/*!40000 ALTER TABLE `notification_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_count` int NOT NULL COMMENT 'No. of Business Locations, 0 = infinite option.',
  `user_count` int NOT NULL,
  `product_count` int NOT NULL,
  `bookings` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable bookings',
  `kitchen` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable kitchen',
  `order_screen` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable order_screen',
  `tables` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Enable/Disable tables',
  `invoice_count` int NOT NULL,
  `interval` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval_count` int NOT NULL,
  `trial_days` int NOT NULL,
  `price` decimal(22,4) NOT NULL,
  `custom_permissions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `sort_order` int NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `is_one_time` tinyint(1) NOT NULL DEFAULT '0',
  `enable_custom_link` tinyint(1) NOT NULL DEFAULT '0',
  `custom_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_link_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `enabled_modules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packages`
--

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo` int NOT NULL,
  `nome` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,132,'Afeganistão','2024-07-03 11:37:02','2024-07-03 11:37:02'),(2,7560,'África do Sul','2024-07-03 11:37:02','2024-07-03 11:37:02'),(3,175,'Albânia, República da','2024-07-03 11:37:02','2024-07-03 11:37:02'),(4,230,'Alemanha','2024-07-03 11:37:02','2024-07-03 11:37:02'),(5,370,'Andorra Sim','2024-07-03 11:37:02','2024-07-03 11:37:02'),(6,400,'Angola','2024-07-03 11:37:02','2024-07-03 11:37:02'),(7,418,'Anguilla Sim','2024-07-03 11:37:02','2024-07-03 11:37:02'),(8,434,'Antigua e Barbuda Sim','2024-07-03 11:37:02','2024-07-03 11:37:02'),(9,477,'Antilhas Holandesas Sim','2024-07-03 11:37:02','2024-07-03 11:37:02'),(10,531,'Arábia Saudita','2024-07-03 11:37:02','2024-07-03 11:37:02'),(11,590,'Argélia','2024-07-03 11:37:02','2024-07-03 11:37:02'),(12,639,'Argentina','2024-07-03 11:37:02','2024-07-03 11:37:02'),(13,647,'Armênia, República da','2024-07-03 11:37:02','2024-07-03 11:37:02'),(14,655,'Aruba','2024-07-03 11:37:02','2024-07-03 11:37:02'),(15,698,'Austrália','2024-07-03 11:37:03','2024-07-03 11:37:03'),(16,728,'Áustria','2024-07-03 11:37:03','2024-07-03 11:37:03'),(17,736,'Azerbaijão, República do','2024-07-03 11:37:03','2024-07-03 11:37:03'),(18,779,'Bahamas, Ilhas Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(19,809,'Bahrein, Ilhas Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(20,817,'Bangladesh','2024-07-03 11:37:03','2024-07-03 11:37:03'),(21,833,'Barbados Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(22,850,'Belarus','2024-07-03 11:37:03','2024-07-03 11:37:03'),(23,876,'Bélgica','2024-07-03 11:37:03','2024-07-03 11:37:03'),(24,884,'Belize Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(25,2291,'Benin','2024-07-03 11:37:03','2024-07-03 11:37:03'),(26,906,'    Bermudas Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(27,973,'Bolívia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(28,981,'Bósnia-Herzegovina','2024-07-03 11:37:03','2024-07-03 11:37:03'),(29,1015,'Botsuana','2024-07-03 11:37:03','2024-07-03 11:37:03'),(30,1058,'Brasil','2024-07-03 11:37:03','2024-07-03 11:37:03'),(31,1082,'Brunei','2024-07-03 11:37:03','2024-07-03 11:37:03'),(32,1112,'Bulgária, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(33,310,'Burkina Faso','2024-07-03 11:37:03','2024-07-03 11:37:03'),(34,1155,'Burundi','2024-07-03 11:37:03','2024-07-03 11:37:03'),(35,1198,'Butão','2024-07-03 11:37:03','2024-07-03 11:37:03'),(36,1279,'Cabo Verde, República de','2024-07-03 11:37:03','2024-07-03 11:37:03'),(37,1457,'Camarões','2024-07-03 11:37:03','2024-07-03 11:37:03'),(38,1414,'Camboja','2024-07-03 11:37:03','2024-07-03 11:37:03'),(39,1490,'Canadá','2024-07-03 11:37:03','2024-07-03 11:37:03'),(40,1504,'Canal, Ilhas do (Jersey e Guernsey) Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(41,1511,'Canárias, Ilhas','2024-07-03 11:37:03','2024-07-03 11:37:03'),(42,1546,'Catar','2024-07-03 11:37:03','2024-07-03 11:37:03'),(43,1376,'Cayman, Ilhas Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(44,1538,'Cazaquistão, República do','2024-07-03 11:37:03','2024-07-03 11:37:03'),(45,7889,'Chade','2024-07-03 11:37:03','2024-07-03 11:37:03'),(46,1589,'Chile','2024-07-03 11:37:03','2024-07-03 11:37:03'),(47,1600,'China, República Popular da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(48,1635,'Chipre Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(49,5118,'Christmas, Ilha (Navidad)','2024-07-03 11:37:03','2024-07-03 11:37:03'),(50,7412,'Cingapura','2024-07-03 11:37:03','2024-07-03 11:37:03'),(51,1651,'Cocos (Keeling), Ilhas','2024-07-03 11:37:03','2024-07-03 11:37:03'),(52,1694,'Colômbia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(53,1732,'Comores, Ilhas','2024-07-03 11:37:03','2024-07-03 11:37:03'),(54,8885,'Congo, República Democrática do','2024-07-03 11:37:03','2024-07-03 11:37:03'),(55,1775,'Congo, República do','2024-07-03 11:37:03','2024-07-03 11:37:03'),(56,1830,'Cook, Ilhas Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(57,1872,'Coréia, Rep. Pop. Democrática da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(58,1902,'Coréia, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(59,1937,'Costa do Marfim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(60,1961,'Costa Rica  Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(61,1988,'Coveite','2024-07-03 11:37:03','2024-07-03 11:37:03'),(62,1953,'Croácia, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(63,1996,'Cuba','2024-07-03 11:37:03','2024-07-03 11:37:03'),(64,2321,'Dinamarca','2024-07-03 11:37:03','2024-07-03 11:37:03'),(65,7838,'Djibuti Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(66,2356,'Dominica, Ilha Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(67,2402,'Egito','2024-07-03 11:37:03','2024-07-03 11:37:03'),(68,6874,'El Salvador','2024-07-03 11:37:03','2024-07-03 11:37:03'),(69,2445,'Emirados Árabes Unidos','2024-07-03 11:37:03','2024-07-03 11:37:03'),(70,2399,'Equador','2024-07-03 11:37:03','2024-07-03 11:37:03'),(71,2437,'Eritréia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(72,6289,'Escócia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(73,2470,'Eslovaca, República','2024-07-03 11:37:03','2024-07-03 11:37:03'),(74,2461,'Eslovênia, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(75,2453,'Espanha','2024-07-03 11:37:03','2024-07-03 11:37:03'),(76,2496,'Estados Unidos','2024-07-03 11:37:03','2024-07-03 11:37:03'),(77,2518,'Estônia, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(78,2534,'Etiópia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(79,2550,'Falkland (Ilhas Malvinas)','2024-07-03 11:37:03','2024-07-03 11:37:03'),(80,2593,'Feroe, Ilhas','2024-07-03 11:37:03','2024-07-03 11:37:03'),(81,8702,'Fiji','2024-07-03 11:37:03','2024-07-03 11:37:03'),(82,2674,'Filipinas','2024-07-03 11:37:03','2024-07-03 11:37:03'),(83,2712,'Finlândia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(84,1619,'Formosa (Taiwan)','2024-07-03 11:37:03','2024-07-03 11:37:03'),(85,2755,'França','2024-07-03 11:37:03','2024-07-03 11:37:03'),(86,2810,'Gabão','2024-07-03 11:37:03','2024-07-03 11:37:03'),(87,6289,'Gales, País de','2024-07-03 11:37:03','2024-07-03 11:37:03'),(88,2852,'Gâmbia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(89,2895,'Gana','2024-07-03 11:37:03','2024-07-03 11:37:03'),(90,2917,'Geórgia, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(91,2933,'Gibraltar Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(92,6289,'Grã-Bretanha','2024-07-03 11:37:03','2024-07-03 11:37:03'),(93,2976,'Granada Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(94,3018,'Grécia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(95,3050,'Groenlândia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(96,3093,'Guadalupe','2024-07-03 11:37:03','2024-07-03 11:37:03'),(97,3131,'Guam','2024-07-03 11:37:03','2024-07-03 11:37:03'),(98,3174,'Guatemala','2024-07-03 11:37:03','2024-07-03 11:37:03'),(99,3379,'Guiana','2024-07-03 11:37:03','2024-07-03 11:37:03'),(100,3255,'Guiana Francesa','2024-07-03 11:37:03','2024-07-03 11:37:03'),(101,3298,'Guiné','2024-07-03 11:37:03','2024-07-03 11:37:03'),(102,3344,'Guiné-Bissau','2024-07-03 11:37:03','2024-07-03 11:37:03'),(103,3310,'Guiné-Equatorial','2024-07-03 11:37:03','2024-07-03 11:37:03'),(104,3417,'Haiti','2024-07-03 11:37:03','2024-07-03 11:37:03'),(105,5738,'Holanda (Países Baixos)','2024-07-03 11:37:03','2024-07-03 11:37:03'),(106,3450,'Honduras','2024-07-03 11:37:03','2024-07-03 11:37:03'),(107,3514,'Hong Kong, Região Adm. Especial','2024-07-03 11:37:03','2024-07-03 11:37:03'),(108,3557,'Hungria, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(109,3573,'Iêmen','2024-07-03 11:37:03','2024-07-03 11:37:03'),(110,3611,'Índia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(111,3654,'Indonésia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(112,6289,'Inglaterra','2024-07-03 11:37:03','2024-07-03 11:37:03'),(113,3727,'Irã, República Islâmica do','2024-07-03 11:37:03','2024-07-03 11:37:03'),(114,3697,'Iraque','2024-07-03 11:37:03','2024-07-03 11:37:03'),(115,3751,'Irlanda','2024-07-03 11:37:03','2024-07-03 11:37:03'),(116,6289,'Irlanda do Norte','2024-07-03 11:37:03','2024-07-03 11:37:03'),(117,3794,'Islândia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(118,3832,'Israel','2024-07-03 11:37:03','2024-07-03 11:37:03'),(119,3867,'Itália','2024-07-03 11:37:03','2024-07-03 11:37:03'),(120,3883,'Iugoslávia, República Fed. da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(121,3913,'Jamaica','2024-07-03 11:37:03','2024-07-03 11:37:03'),(122,3999,'Japão','2024-07-03 11:37:03','2024-07-03 11:37:03'),(123,3964,'Johnston, Ilhas','2024-07-03 11:37:03','2024-07-03 11:37:03'),(124,4030,'Jordânia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(125,4111,'Kiribati','2024-07-03 11:37:03','2024-07-03 11:37:03'),(126,4200,'Laos, Rep. Pop. Democrática do','2024-07-03 11:37:03','2024-07-03 11:37:03'),(127,4235,'Lebuan Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(128,4260,'Lesoto','2024-07-03 11:37:03','2024-07-03 11:37:03'),(129,4278,'Letônia, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(130,4316,'Líbano','2024-07-03 11:37:03','2024-07-03 11:37:03'),(131,4340,'Libéria Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(132,4383,'Líbia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(133,4405,'Liechtenstein Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(134,4421,'Lituânia, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(135,4456,'Luxemburgo','2024-07-03 11:37:03','2024-07-03 11:37:03'),(136,4472,'Macau','2024-07-03 11:37:03','2024-07-03 11:37:03'),(137,4499,'Macedônia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(138,4502,'Madagascar','2024-07-03 11:37:03','2024-07-03 11:37:03'),(139,4525,'Madeira, Ilha da Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(140,4553,'Malásia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(141,4588,'Malavi','2024-07-03 11:37:03','2024-07-03 11:37:03'),(142,4618,'Maldivas','2024-07-03 11:37:03','2024-07-03 11:37:03'),(143,4642,'Máli','2024-07-03 11:37:03','2024-07-03 11:37:03'),(144,4677,'Malta Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(145,3595,'Man, Ilhas Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(146,4723,'Marianas do Norte','2024-07-03 11:37:03','2024-07-03 11:37:03'),(147,4740,'Marrocos','2024-07-03 11:37:03','2024-07-03 11:37:03'),(148,4766,'Marshall, Ilhas Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(149,4774,'Martinica','2024-07-03 11:37:03','2024-07-03 11:37:03'),(150,4855,'Maurício Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(151,4880,'Mauritânia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(152,4936,'México','2024-07-03 11:37:03','2024-07-03 11:37:03'),(153,930,'Mianmar (Birmânia)','2024-07-03 11:37:03','2024-07-03 11:37:03'),(154,4995,'Micronésia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(155,4901,'Midway, Ilhas','2024-07-03 11:37:03','2024-07-03 11:37:03'),(156,5053,'Moçambique','2024-07-03 11:37:03','2024-07-03 11:37:03'),(157,4944,'Moldávia, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(158,4952,'Mônaco Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(159,4979,'Mongólia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(160,5010,'Montserrat, Ilhas Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(161,5070,'Namíbia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(162,5088,'Nauru Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(163,5177,'Nepal','2024-07-03 11:37:03','2024-07-03 11:37:03'),(164,5215,'Nicarágua','2024-07-03 11:37:03','2024-07-03 11:37:03'),(165,5258,'Niger','2024-07-03 11:37:03','2024-07-03 11:37:03'),(166,5282,'Nigéria','2024-07-03 11:37:03','2024-07-03 11:37:03'),(167,5312,'Niue, Ilha Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(168,5355,'Norfolk, Ilha','2024-07-03 11:37:03','2024-07-03 11:37:03'),(169,5380,'Noruega','2024-07-03 11:37:03','2024-07-03 11:37:03'),(170,5428,'Nova Caledônia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(171,5487,'Nova Zelândia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(172,5568,'Omã','2024-07-03 11:37:03','2024-07-03 11:37:03'),(173,5738,'Países Baixos (Holanda)','2024-07-03 11:37:03','2024-07-03 11:37:03'),(174,5754,'Palau','2024-07-03 11:37:03','2024-07-03 11:37:03'),(175,5800,'Panamá Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(176,5452,'Papua Nova Guiné','2024-07-03 11:37:03','2024-07-03 11:37:03'),(177,5762,'Paquistão','2024-07-03 11:37:03','2024-07-03 11:37:03'),(178,5860,'Paraguai','2024-07-03 11:37:03','2024-07-03 11:37:03'),(179,5894,'Peru','2024-07-03 11:37:03','2024-07-03 11:37:03'),(180,5932,'Pitcairn, Ilha','2024-07-03 11:37:03','2024-07-03 11:37:03'),(181,5991,'Polinésia Francesa','2024-07-03 11:37:03','2024-07-03 11:37:03'),(182,6033,'Polônia, República da','2024-07-03 11:37:03','2024-07-03 11:37:03'),(183,6114,'Porto Rico','2024-07-03 11:37:03','2024-07-03 11:37:03'),(184,6076,'Portugal','2024-07-03 11:37:03','2024-07-03 11:37:03'),(185,6238,'Quênia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(186,6254,'Quirguiz, República','2024-07-03 11:37:03','2024-07-03 11:37:03'),(187,6289,'Reino Unido','2024-07-03 11:37:03','2024-07-03 11:37:03'),(188,6408,'República Centro-Africana','2024-07-03 11:37:03','2024-07-03 11:37:03'),(189,6475,'República Dominicana','2024-07-03 11:37:03','2024-07-03 11:37:03'),(190,6602,'Reunião, Ilha','2024-07-03 11:37:03','2024-07-03 11:37:03'),(191,6700,'Romênia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(192,6750,'Ruanda','2024-07-03 11:37:03','2024-07-03 11:37:03'),(193,6769,'Rússia','2024-07-03 11:37:03','2024-07-03 11:37:03'),(194,6858,'Saara Ocidental','2024-07-03 11:37:03','2024-07-03 11:37:03'),(195,6777,'Salomão, Ilhas','2024-07-03 11:37:03','2024-07-03 11:37:03'),(196,6904,'Samoa Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(197,6912,'Samoa Americana','2024-07-03 11:37:03','2024-07-03 11:37:03'),(198,6971,'San Marino Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(199,7102,'Santa Helena','2024-07-03 11:37:03','2024-07-03 11:37:03'),(200,7153,'Santa Lúcia Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(201,6955,'São Cristóvão e Neves Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(202,7005,'São Pedro e Miquelon','2024-07-03 11:37:03','2024-07-03 11:37:03'),(203,7200,'São Tomé e Príncipe, Ilhas','2024-07-03 11:37:03','2024-07-03 11:37:03'),(204,7056,'São Vicente e Granadinas Sim','2024-07-03 11:37:03','2024-07-03 11:37:03'),(205,7285,'Senegal','2024-07-03 11:37:03','2024-07-03 11:37:03'),(206,7358,'Serra Leoa','2024-07-03 11:37:03','2024-07-03 11:37:03'),(207,7315,'Seychelles Sim','2024-07-03 11:37:04','2024-07-03 11:37:04'),(208,7447,'Síria, República Árabe da','2024-07-03 11:37:04','2024-07-03 11:37:04'),(209,7480,'Somália','2024-07-03 11:37:04','2024-07-03 11:37:04'),(210,7501,'Sri Lanka','2024-07-03 11:37:04','2024-07-03 11:37:04'),(211,7544,'Suazilândia','2024-07-03 11:37:04','2024-07-03 11:37:04'),(212,7595,'Sudão','2024-07-03 11:37:04','2024-07-03 11:37:04'),(213,7641,'Suécia','2024-07-03 11:37:04','2024-07-03 11:37:04'),(214,7676,'Suíça','2024-07-03 11:37:04','2024-07-03 11:37:04'),(215,7706,'Suriname','2024-07-03 11:37:04','2024-07-03 11:37:04'),(216,7722,'Tadjiquistão','2024-07-03 11:37:04','2024-07-03 11:37:04'),(217,7765,'Tailândia','2024-07-03 11:37:04','2024-07-03 11:37:04'),(218,7803,'Tanzânia, República Unida da','2024-07-03 11:37:04','2024-07-03 11:37:04'),(219,7919,'Tcheca, República','2024-07-03 11:37:04','2024-07-03 11:37:04'),(220,7820,'Território Britânico Oc. Índico ','2024-07-03 11:37:04','2024-07-03 11:37:04'),(221,7951,'Timor Leste','2024-07-03 11:37:04','2024-07-03 11:37:04'),(222,8001,'Togo','2024-07-03 11:37:04','2024-07-03 11:37:04'),(223,8109,'Tonga Sim','2024-07-03 11:37:04','2024-07-03 11:37:04'),(224,8052,'Toquelau, Ilhas','2024-07-03 11:37:04','2024-07-03 11:37:04'),(225,8150,'Trinidad e Tobago','2024-07-03 11:37:04','2024-07-03 11:37:04'),(226,8206,'Tunísia','2024-07-03 11:37:04','2024-07-03 11:37:04'),(227,8230,'Turcas e Caicos, Ilhas Sim','2024-07-03 11:37:04','2024-07-03 11:37:04'),(228,8249,'Turcomenistão, República do','2024-07-03 11:37:04','2024-07-03 11:37:04'),(229,8273,'Turquia','2024-07-03 11:37:04','2024-07-03 11:37:04'),(230,8281,'Tuvalu','2024-07-03 11:37:04','2024-07-03 11:37:04'),(231,8311,'Ucrânia','2024-07-03 11:37:04','2024-07-03 11:37:04'),(232,8338,'Uganda','2024-07-03 11:37:04','2024-07-03 11:37:04'),(233,8451,'Uruguai','2024-07-03 11:37:04','2024-07-03 11:37:04'),(234,8478,'Uzbequistão, República do','2024-07-03 11:37:04','2024-07-03 11:37:04'),(235,5517,'Vanuatu Sim','2024-07-03 11:37:04','2024-07-03 11:37:04'),(236,8486,'Vaticano, Estado da Cidade do','2024-07-03 11:37:04','2024-07-03 11:37:04'),(237,8508,'Venezuela','2024-07-03 11:37:04','2024-07-03 11:37:04'),(238,8583,'Vietnã','2024-07-03 11:37:04','2024-07-03 11:37:04'),(239,8630,'Virgens, Ilhas (Britânicas) Sim','2024-07-03 11:37:04','2024-07-03 11:37:04'),(240,8664,'Virgens, Ilhas (E.U.A.) Sim','2024-07-03 11:37:04','2024-07-03 11:37:04'),(241,8737,'Wake, Ilha','2024-07-03 11:37:04','2024-07-03 11:37:04'),(242,8753,'Wallis e Futuna, Ilhas','2024-07-03 11:37:04','2024-07-03 11:37:04'),(243,8907,'Zâmbia','2024-07-03 11:37:04','2024-07-03 11:37:04'),(244,6653,'Zimbábue','2024-07-03 11:37:04','2024-07-03 11:37:04'),(245,8958,'Zona do Canal do Panamá','2024-07-03 11:37:04','2024-07-03 11:37:04');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `payment_plans`
--

DROP TABLE IF EXISTS `payment_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_plans` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `payerFirstName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payerLastName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payerEmail` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `docNumber` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transacao_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `forma_pagamento` enum('pix','cartao','boleto') COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_boleto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_cartao` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `package_id` int NOT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_plans`
--

LOCK TABLES `payment_plans` WRITE;
/*!40000 ALTER TABLE `payment_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_ecommerces`
--

DROP TABLE IF EXISTS `pedido_ecommerces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_ecommerces` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `cliente_id` int unsigned DEFAULT NULL,
  `endereco_id` int unsigned DEFAULT NULL,
  `status` int NOT NULL,
  `status_preparacao` int NOT NULL,
  `codigo_rastreio` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_total` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `valor_desconto` decimal(10,2) NOT NULL,
  `tipo_frete` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `venda_id` int NOT NULL DEFAULT '0',
  `numero_nfe` int NOT NULL DEFAULT '0',
  `observacao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rand_pedido` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_boleto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transacao_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `forma_pagamento` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status_pagamento` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status_detalhe` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cupom_desconto` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_ecommerces_business_id_foreign` (`business_id`),
  KEY `pedido_ecommerces_cliente_id_foreign` (`cliente_id`),
  KEY `pedido_ecommerces_endereco_id_foreign` (`endereco_id`),
  CONSTRAINT `pedido_ecommerces_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_ecommerces_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `cliente_ecommerces` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pedido_ecommerces_endereco_id_foreign` FOREIGN KEY (`endereco_id`) REFERENCES `endereco_ecommerces` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_ecommerces`
--

LOCK TABLES `pedido_ecommerces` WRITE;
/*!40000 ALTER TABLE `pedido_ecommerces` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_ecommerces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `percursos`
--

DROP TABLE IF EXISTS `percursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `percursos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `percursos_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `percursos_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `percursos`
--

LOCK TABLES `percursos` WRITE;
/*!40000 ALTER TABLE `percursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `percursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'profit_loss_report.view','web','2024-07-03 11:36:32',NULL),(2,'direct_sell.access','web','2024-07-03 11:36:32',NULL),(3,'product.opening_stock','web','2024-07-03 11:36:38','2024-07-03 11:36:38'),(4,'crud_all_bookings','web','2024-07-03 11:36:41','2024-07-03 11:36:41'),(5,'crud_own_bookings','web','2024-07-03 11:36:41','2024-07-03 11:36:41'),(6,'access_default_selling_price','web','2024-07-03 11:36:42','2024-07-03 11:36:42'),(7,'purchase.payments','web','2024-07-03 11:36:43','2024-07-03 11:36:43'),(8,'sell.payments','web','2024-07-03 11:36:44','2024-07-03 11:36:44'),(9,'edit_product_price_from_sale_screen','web','2024-07-03 11:36:44','2024-07-03 11:36:44'),(10,'edit_product_discount_from_sale_screen','web','2024-07-03 11:36:44','2024-07-03 11:36:44'),(11,'roles.view','web','2024-07-03 11:36:44','2024-07-03 11:36:44'),(12,'roles.create','web','2024-07-03 11:36:44','2024-07-03 11:36:44'),(13,'roles.update','web','2024-07-03 11:36:44','2024-07-03 11:36:44'),(14,'roles.delete','web','2024-07-03 11:36:44','2024-07-03 11:36:44'),(15,'account.access','web','2024-07-03 11:36:46','2024-07-03 11:36:46'),(16,'discount.access','web','2024-07-03 11:36:46','2024-07-03 11:36:46'),(17,'view_purchase_price','web','2024-07-03 11:36:47','2024-07-03 11:36:47'),(18,'view_own_sell_only','web','2024-07-03 11:36:47','2024-07-03 11:36:47'),(19,'edit_product_discount_from_pos_screen','web','2024-07-03 11:36:49','2024-07-03 11:36:49'),(20,'edit_product_price_from_pos_screen','web','2024-07-03 11:36:49','2024-07-03 11:36:49'),(21,'access_shipping','web','2024-07-03 11:36:50','2024-07-03 11:36:50'),(22,'purchase.update_status','web','2024-07-03 11:36:51','2024-07-03 11:36:51'),(23,'list_drafts','web','2024-07-03 11:36:51','2024-07-03 11:36:51'),(24,'list_quotations','web','2024-07-03 11:36:52','2024-07-03 11:36:52'),(25,'user.view','web','2024-07-03 11:37:02',NULL),(26,'user.create','web','2024-07-03 11:37:02',NULL),(27,'user.update','web','2024-07-03 11:37:02',NULL),(28,'user.delete','web','2024-07-03 11:37:02',NULL),(29,'supplier.view','web','2024-07-03 11:37:02',NULL),(30,'supplier.create','web','2024-07-03 11:37:02',NULL),(31,'supplier.update','web','2024-07-03 11:37:02',NULL),(32,'supplier.delete','web','2024-07-03 11:37:02',NULL),(33,'customer.view','web','2024-07-03 11:37:02',NULL),(34,'customer.create','web','2024-07-03 11:37:02',NULL),(35,'customer.update','web','2024-07-03 11:37:02',NULL),(36,'customer.delete','web','2024-07-03 11:37:02',NULL),(37,'product.view','web','2024-07-03 11:37:02',NULL),(38,'product.create','web','2024-07-03 11:37:02',NULL),(39,'product.update','web','2024-07-03 11:37:02',NULL),(40,'product.delete','web','2024-07-03 11:37:02',NULL),(41,'purchase.view','web','2024-07-03 11:37:02',NULL),(42,'purchase.create','web','2024-07-03 11:37:02',NULL),(43,'purchase.update','web','2024-07-03 11:37:02',NULL),(44,'purchase.delete','web','2024-07-03 11:37:02',NULL),(45,'sell.view','web','2024-07-03 11:37:02',NULL),(46,'sell.create','web','2024-07-03 11:37:02',NULL),(47,'sell.update','web','2024-07-03 11:37:02',NULL),(48,'sell.delete','web','2024-07-03 11:37:02',NULL),(49,'purchase_n_sell_report.view','web','2024-07-03 11:37:02',NULL),(50,'contacts_report.view','web','2024-07-03 11:37:02',NULL),(51,'stock_report.view','web','2024-07-03 11:37:02',NULL),(52,'tax_report.view','web','2024-07-03 11:37:02',NULL),(53,'trending_product_report.view','web','2024-07-03 11:37:02',NULL),(54,'register_report.view','web','2024-07-03 11:37:02',NULL),(55,'sales_representative.view','web','2024-07-03 11:37:02',NULL),(56,'expense_report.view','web','2024-07-03 11:37:02',NULL),(57,'business_settings.access','web','2024-07-03 11:37:02',NULL),(58,'barcode_settings.access','web','2024-07-03 11:37:02',NULL),(59,'invoice_settings.access','web','2024-07-03 11:37:02',NULL),(60,'brand.view','web','2024-07-03 11:37:02',NULL),(61,'brand.create','web','2024-07-03 11:37:02',NULL),(62,'brand.update','web','2024-07-03 11:37:02',NULL),(63,'brand.delete','web','2024-07-03 11:37:02',NULL),(64,'tax_rate.view','web','2024-07-03 11:37:02',NULL),(65,'tax_rate.create','web','2024-07-03 11:37:02',NULL),(66,'tax_rate.update','web','2024-07-03 11:37:02',NULL),(67,'tax_rate.delete','web','2024-07-03 11:37:02',NULL),(68,'unit.view','web','2024-07-03 11:37:02',NULL),(69,'unit.create','web','2024-07-03 11:37:02',NULL),(70,'unit.update','web','2024-07-03 11:37:02',NULL),(71,'unit.delete','web','2024-07-03 11:37:02',NULL),(72,'category.view','web','2024-07-03 11:37:02',NULL),(73,'category.create','web','2024-07-03 11:37:02',NULL),(74,'category.update','web','2024-07-03 11:37:02',NULL),(75,'category.delete','web','2024-07-03 11:37:02',NULL),(76,'expense.access','web','2024-07-03 11:37:02',NULL),(77,'access_all_locations','web','2024-07-03 11:37:02',NULL),(78,'dashboard.data','web','2024-07-03 11:37:02',NULL),(79,'ecommerce.view','web','2024-07-03 11:37:02',NULL),(80,'ecommerce.create','web','2024-07-03 11:37:02',NULL),(81,'ecommerce.update','web','2024-07-03 11:37:02',NULL),(82,'ecommerce.delete','web','2024-07-03 11:37:02',NULL),(83,'revenues.access','web','2024-07-03 11:37:02',NULL),(84,'cte.view','web','2024-07-03 11:37:02',NULL),(85,'cte.create','web','2024-07-03 11:37:02',NULL),(86,'cte.update','web','2024-07-03 11:37:02',NULL),(87,'cte.delete','web','2024-07-03 11:37:02',NULL),(88,'mdfe.view','web','2024-07-03 11:37:02',NULL),(89,'mdfe.create','web','2024-07-03 11:37:02',NULL),(90,'mdfe.update','web','2024-07-03 11:37:02',NULL),(91,'mdfe.delete','web','2024-07-03 11:37:02',NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
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
-- Table structure for table `printers`
--

DROP TABLE IF EXISTS `printers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `printers_business_id_foreign` (`business_id`),
  CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printers`
--

LOCK TABLES `printers` WRITE;
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_locations`
--

DROP TABLE IF EXISTS `product_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_locations` (
  `product_id` int NOT NULL,
  `location_id` int NOT NULL,
  KEY `product_locations_product_id_index` (`product_id`),
  KEY `product_locations_location_id_index` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_locations`
--

LOCK TABLES `product_locations` WRITE;
/*!40000 ALTER TABLE `product_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_racks`
--

DROP TABLE IF EXISTS `product_racks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_racks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `location_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_racks`
--

LOCK TABLES `product_racks` WRITE;
/*!40000 ALTER TABLE `product_racks` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_racks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_variations`
--

DROP TABLE IF EXISTS `product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_variations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `variation_template_id` int DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_variations_name_index` (`name`),
  KEY `product_variations_product_id_index` (`product_id`),
  CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_variations`
--

LOCK TABLES `product_variations` WRITE;
/*!40000 ALTER TABLE `product_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int unsigned NOT NULL,
  `type` enum('single','variable','modifier','combo') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int unsigned DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int unsigned DEFAULT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `sub_category_id` int unsigned DEFAULT NULL,
  `tax` int unsigned DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned NOT NULL,
  `warranty_id` int DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `perc_icms` decimal(4,2) NOT NULL DEFAULT '0.00',
  `perc_pis` decimal(4,2) NOT NULL DEFAULT '0.00',
  `perc_cofins` decimal(4,2) NOT NULL DEFAULT '0.00',
  `perc_ipi` decimal(4,2) NOT NULL DEFAULT '0.00',
  `pCredSN` decimal(5,2) NOT NULL DEFAULT '0.00',
  `cfop_interno` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '5101',
  `cfop_externo` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '6101',
  `cst_csosn` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '101',
  `cst_pis` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '49',
  `cst_cofins` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '49',
  `cst_ipi` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '99',
  `ncm` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `cest` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_barras` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `codigo_anp` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `perc_glp` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_gnn` decimal(5,2) NOT NULL DEFAULT '0.00',
  `perc_gni` decimal(5,2) NOT NULL DEFAULT '0.00',
  `valor_partida` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `unidade_tributavel` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `quantidade_tributavel` decimal(10,4) NOT NULL DEFAULT '0.0000',
  `tipo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `veicProd` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tpOp` int NOT NULL DEFAULT '0',
  `chassi` varchar(17) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cCor` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `xCor` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pot` int NOT NULL DEFAULT '0',
  `cilin` int NOT NULL DEFAULT '0',
  `pesoL` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `pesoB` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `nSerie` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tpComb` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nMotor` varchar(21) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `CMT` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `dist` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `anoMod` int NOT NULL DEFAULT '0',
  `anoFab` int NOT NULL DEFAULT '0',
  `tpPint` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tpVeic` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `espVeic` int NOT NULL DEFAULT '0',
  `VIN` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `condVeic` int NOT NULL DEFAULT '0',
  `cMod` int NOT NULL DEFAULT '0',
  `cCorDENATRAN` int NOT NULL DEFAULT '0',
  `lota` int NOT NULL DEFAULT '0',
  `tpRest` int NOT NULL DEFAULT '0',
  `origem` int NOT NULL DEFAULT '0',
  `cenq_ipi` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '999',
  `ecommerce` tinyint(1) NOT NULL DEFAULT '0',
  `valor_ecommerce` decimal(12,2) NOT NULL DEFAULT '0.00',
  `altura` decimal(8,2) NOT NULL DEFAULT '0.00',
  `largura` decimal(8,2) NOT NULL DEFAULT '0.00',
  `comprimento` decimal(8,2) NOT NULL DEFAULT '0.00',
  `destaque` tinyint(1) NOT NULL DEFAULT '0',
  `novo` tinyint(1) NOT NULL DEFAULT '0',
  `perc_icms_interestadual` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_icms_interno` decimal(10,2) NOT NULL DEFAULT '0.00',
  `perc_fcp_interestadual` decimal(10,2) NOT NULL DEFAULT '0.00',
  `modBCST` int NOT NULL DEFAULT '0',
  `modBC` int NOT NULL DEFAULT '0',
  `pICMSST` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_sub_category_id_foreign` (`sub_category_id`),
  KEY `products_tax_foreign` (`tax`),
  KEY `products_name_index` (`name`),
  KEY `products_business_id_index` (`business_id`),
  KEY `products_unit_id_index` (`unit_id`),
  KEY `products_created_by_index` (`created_by`),
  KEY `products_warranty_id_index` (`warranty_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_imagems`
--

DROP TABLE IF EXISTS `produto_imagems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto_imagems` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `produto_id` int unsigned NOT NULL,
  `img` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_imagems_produto_id_foreign` (`produto_id`),
  CONSTRAINT `produto_imagems_produto_id_foreign` FOREIGN KEY (`produto_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_imagems`
--

LOCK TABLES `produto_imagems` WRITE;
/*!40000 ALTER TABLE `produto_imagems` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_imagems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_lines`
--

DROP TABLE IF EXISTS `purchase_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_lines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `variation_id` int unsigned NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int unsigned DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  KEY `purchase_lines_product_id_foreign` (`product_id`),
  KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  KEY `purchase_lines_lot_number_index` (`lot_number`),
  CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_lines`
--

LOCK TABLES `purchase_lines` WRITE;
/*!40000 ALTER TABLE `purchase_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_counts`
--

DROP TABLE IF EXISTS `reference_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reference_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int NOT NULL,
  `business_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_counts`
--

LOCK TABLES `reference_counts` WRITE;
/*!40000 ALTER TABLE `reference_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remessa_boletos`
--

DROP TABLE IF EXISTS `remessa_boletos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remessa_boletos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `remessa_id` int unsigned NOT NULL,
  `boleto_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remessa_boletos_remessa_id_foreign` (`remessa_id`),
  KEY `remessa_boletos_boleto_id_foreign` (`boleto_id`),
  CONSTRAINT `remessa_boletos_boleto_id_foreign` FOREIGN KEY (`boleto_id`) REFERENCES `boletos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `remessa_boletos_remessa_id_foreign` FOREIGN KEY (`remessa_id`) REFERENCES `remessas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remessa_boletos`
--

LOCK TABLES `remessa_boletos` WRITE;
/*!40000 ALTER TABLE `remessa_boletos` DISABLE KEYS */;
/*!40000 ALTER TABLE `remessa_boletos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remessas`
--

DROP TABLE IF EXISTS `remessas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remessas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome_arquivo` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `remessas_business_id_foreign` (`business_id`),
  CONSTRAINT `remessas_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remessas`
--

LOCK TABLES `remessas` WRITE;
/*!40000 ALTER TABLE `remessas` DISABLE KEYS */;
/*!40000 ALTER TABLE `remessas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_product_modifier_sets`
--

DROP TABLE IF EXISTS `res_product_modifier_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product',
  KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`),
  CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_product_modifier_sets`
--

LOCK TABLES `res_product_modifier_sets` WRITE;
/*!40000 ALTER TABLE `res_product_modifier_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_product_modifier_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `res_tables`
--

DROP TABLE IF EXISTS `res_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `res_tables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `location_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `res_tables_business_id_foreign` (`business_id`),
  CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `res_tables`
--

LOCK TABLES `res_tables` WRITE;
/*!40000 ALTER TABLE `res_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `res_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revenues`
--

DROP TABLE IF EXISTS `revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revenues` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `referencia` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacao` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vencimento` date NOT NULL,
  `recebimento` date NOT NULL,
  `business_id` int unsigned NOT NULL,
  `valor_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `valor_recebido` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `expense_category_id` int unsigned DEFAULT NULL,
  `tipo_pagamento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_id` int unsigned NOT NULL,
  `contact_id` int unsigned NOT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revenues_business_id_foreign` (`business_id`),
  KEY `revenues_created_by_foreign` (`created_by`),
  KEY `revenues_expense_category_id_foreign` (`expense_category_id`),
  KEY `revenues_location_id_foreign` (`location_id`),
  KEY `revenues_contact_id_foreign` (`contact_id`),
  CONSTRAINT `revenues_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `revenues_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `revenues_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `revenues_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `revenues_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revenues`
--

LOCK TABLES `revenues` WRITE;
/*!40000 ALTER TABLE `revenues` DISABLE KEYS */;
/*!40000 ALTER TABLE `revenues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int unsigned NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_business_id_foreign` (`business_id`),
  CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sangria_suprimentos`
--

DROP TABLE IF EXISTS `sangria_suprimentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sangria_suprimentos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `cash_id` int unsigned NOT NULL,
  `type` enum('sangria','suprimento') COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `note` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sangria_suprimentos_cash_id_foreign` (`cash_id`),
  CONSTRAINT `sangria_suprimentos_cash_id_foreign` FOREIGN KEY (`cash_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sangria_suprimentos`
--

LOCK TABLES `sangria_suprimentos` WRITE;
/*!40000 ALTER TABLE `sangria_suprimentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `sangria_suprimentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sell_line_warranties`
--

DROP TABLE IF EXISTS `sell_line_warranties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int NOT NULL,
  `warranty_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell_line_warranties`
--

LOCK TABLES `sell_line_warranties` WRITE;
/*!40000 ALTER TABLE `sell_line_warranties` DISABLE KEYS */;
/*!40000 ALTER TABLE `sell_line_warranties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selling_price_groups`
--

DROP TABLE IF EXISTS `selling_price_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selling_price_groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int unsigned NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `selling_price_groups_business_id_foreign` (`business_id`),
  CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selling_price_groups`
--

LOCK TABLES `selling_price_groups` WRITE;
/*!40000 ALTER TABLE `selling_price_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `selling_price_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustment_lines`
--

DROP TABLE IF EXISTS `stock_adjustment_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_adjustment_lines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `variation_id` int unsigned NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int DEFAULT NULL,
  `lot_no_line_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustment_lines`
--

LOCK TABLES `stock_adjustment_lines` WRITE;
/*!40000 ALTER TABLE `stock_adjustment_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_adjustment_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_adjustments_temp`
--

DROP TABLE IF EXISTS `stock_adjustments_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_adjustments_temp` (
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_adjustments_temp`
--

LOCK TABLES `stock_adjustments_temp` WRITE;
/*!40000 ALTER TABLE `stock_adjustments_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_adjustments_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscriptions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `package_id` int unsigned NOT NULL,
  `start_date` date DEFAULT NULL,
  `trial_end_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `package_price` decimal(22,4) NOT NULL,
  `package_details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_id` int unsigned NOT NULL,
  `paid_via` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_transaction_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('approved','waiting','declined') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'waiting',
  `qr_code_base64` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_boleto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `numero_cartao` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `forma_pagamento` enum('pix','cartao','boleto') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_mp` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscriptions_business_id_foreign` (`business_id`),
  KEY `subscriptions_package_id_index` (`package_id`),
  KEY `subscriptions_created_id_index` (`created_id`),
  CONSTRAINT `subscriptions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superadmin_communicator_logs`
--

DROP TABLE IF EXISTS `superadmin_communicator_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superadmin_communicator_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_ids` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superadmin_communicator_logs`
--

LOCK TABLES `superadmin_communicator_logs` WRITE;
/*!40000 ALTER TABLE `superadmin_communicator_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `superadmin_communicator_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `superadmin_frontend_pages`
--

DROP TABLE IF EXISTS `superadmin_frontend_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `superadmin_frontend_pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_shown` tinyint(1) NOT NULL,
  `menu_order` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `superadmin_frontend_pages`
--

LOCK TABLES `superadmin_frontend_pages` WRITE;
/*!40000 ALTER TABLE `superadmin_frontend_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `superadmin_frontend_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES (1,'db_version',NULL),(2,'default_business_active_status','1'),(3,'superadmin_version','2.2'),(4,'app_currency_id','2'),(5,'invoice_business_name','Slym'),(6,'invoice_business_landmark','Landmark'),(7,'invoice_business_zip','Zip'),(8,'invoice_business_state','State'),(9,'invoice_business_city','City'),(10,'invoice_business_country','Country'),(11,'email','superadmin@example.com'),(12,'package_expiry_alert_days','5'),(13,'enable_business_based_username','0');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_updates`
--

DROP TABLE IF EXISTS `system_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_updates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_updates`
--

LOCK TABLES `system_updates` WRITE;
/*!40000 ALTER TABLE `system_updates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_rates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_rates_business_id_foreign` (`business_id`),
  KEY `tax_rates_created_by_foreign` (`created_by`),
  CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_rates`
--

LOCK TABLES `tax_rates` WRITE;
/*!40000 ALTER TABLE `tax_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_payments`
--

DROP TABLE IF EXISTS `transaction_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_payments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int unsigned DEFAULT NULL,
  `business_id` int DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` enum('cash','card','debit','cheque','bank_transfer','other','boleto','pix') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int NOT NULL,
  `payment_for` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_payments_created_by_index` (`created_by`),
  KEY `transaction_payments_parent_id_index` (`parent_id`),
  CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_payments`
--

LOCK TABLES `transaction_payments` WRITE;
/*!40000 ALTER TABLE `transaction_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_sell_lines`
--

DROP TABLE IF EXISTS `transaction_sell_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_sell_lines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `variation_id` int unsigned NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int unsigned DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  `lot_no_line_id` int DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `res_service_staff_id` int DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int DEFAULT NULL,
  `n_pedido` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n_item` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  KEY `transaction_sell_lines_children_type_index` (`children_type`),
  KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_sell_lines`
--

LOCK TABLES `transaction_sell_lines` WRITE;
/*!40000 ALTER TABLE `transaction_sell_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_sell_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

DROP TABLE IF EXISTS `transaction_sell_lines_purchase_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `sell_line_id` int unsigned DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int unsigned DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int unsigned NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sell_line_id` (`sell_line_id`),
  KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  KEY `purchase_line_id` (`purchase_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

LOCK TABLES `transaction_sell_lines_purchase_lines` WRITE;
/*!40000 ALTER TABLE `transaction_sell_lines_purchase_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_sell_lines_purchase_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `location_id` int unsigned DEFAULT NULL,
  `res_table_id` int unsigned DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int unsigned DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('received','pending','ordered','draft','final') COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int unsigned DEFAULT NULL,
  `customer_group_id` int DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int unsigned DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `rp_redeemed` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Difference of rounded total and actual total',
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int unsigned DEFAULT NULL,
  `expense_for` int unsigned DEFAULT NULL,
  `commission_agent` int DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int DEFAULT NULL,
  `return_parent_id` int DEFAULT NULL,
  `opening_stock_product_id` int DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `import_batch` int DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `natureza_id` int unsigned DEFAULT NULL,
  `placa` varchar(9) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `valor_frete` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tipo` int NOT NULL DEFAULT '0',
  `qtd_volumes` int NOT NULL DEFAULT '0',
  `numeracao_volumes` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `especie` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `peso_liquido` decimal(8,3) NOT NULL DEFAULT '0.000',
  `peso_bruto` decimal(8,3) NOT NULL DEFAULT '0.000',
  `numero_nfe` int NOT NULL DEFAULT '0',
  `numero_nfce` int NOT NULL DEFAULT '0',
  `numero_nfe_entrada` int NOT NULL DEFAULT '0',
  `chave` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `chave_entrada` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sequencia_cce` int NOT NULL DEFAULT '0',
  `cpf_nota` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `troco` decimal(10,2) NOT NULL DEFAULT '0.00',
  `valor_recebido` decimal(10,2) NOT NULL DEFAULT '0.00',
  `transportadora_id` int unsigned DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NOVO',
  `recibo` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referencia_nfe` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pedido_ecommerce_id` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `transactions_tax_id_foreign` (`tax_id`),
  KEY `transactions_business_id_index` (`business_id`),
  KEY `transactions_type_index` (`type`),
  KEY `transactions_contact_id_index` (`contact_id`),
  KEY `transactions_transaction_date_index` (`transaction_date`),
  KEY `transactions_created_by_index` (`created_by`),
  KEY `transactions_natureza_id_foreign` (`natureza_id`),
  KEY `transactions_transportadora_id_foreign` (`transportadora_id`),
  KEY `transactions_location_id_index` (`location_id`),
  KEY `transactions_expense_for_foreign` (`expense_for`),
  KEY `transactions_expense_category_id_index` (`expense_category_id`),
  KEY `transactions_sub_type_index` (`sub_type`),
  KEY `transactions_return_parent_id_index` (`return_parent_id`),
  KEY `type` (`type`),
  CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  CONSTRAINT `transactions_natureza_id_foreign` FOREIGN KEY (`natureza_id`) REFERENCES `natureza_operacaos` (`id`),
  CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transactions_transportadora_id_foreign` FOREIGN KEY (`transportadora_id`) REFERENCES `transportadoras` (`id`) ON DELETE CASCADE
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
-- Table structure for table `transportadoras`
--

DROP TABLE IF EXISTS `transportadoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transportadoras` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj_cpf` varchar(19) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000.000.000-00',
  `logradouro` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade_id` int unsigned NOT NULL,
  `business_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transportadoras_cidade_id_foreign` (`cidade_id`),
  KEY `transportadoras_business_id_foreign` (`business_id`),
  CONSTRAINT `transportadoras_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transportadoras_cidade_id_foreign` FOREIGN KEY (`cidade_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportadoras`
--

LOCK TABLES `transportadoras` WRITE;
/*!40000 ALTER TABLE `transportadoras` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportadoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_of_services`
--

DROP TABLE IF EXISTS `types_of_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_of_services` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `types_of_services_business_id_index` (`business_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_of_services`
--

LOCK TABLES `types_of_services` WRITE;
/*!40000 ALTER TABLE `types_of_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `types_of_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_cargas`
--

DROP TABLE IF EXISTS `unidade_cargas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidade_cargas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `info_id` int unsigned NOT NULL,
  `id_unidade_carga` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantidade_rateio` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unidade_cargas_info_id_foreign` (`info_id`),
  CONSTRAINT `unidade_cargas_info_id_foreign` FOREIGN KEY (`info_id`) REFERENCES `info_descargas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_cargas`
--

LOCK TABLES `unidade_cargas` WRITE;
/*!40000 ALTER TABLE `unidade_cargas` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade_cargas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `units` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_business_id_foreign` (`business_id`),
  KEY `units_created_by_foreign` (`created_by`),
  KEY `units_base_unit_id_index` (`base_unit_id`),
  CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_contact_access`
--

DROP TABLE IF EXISTS `user_contact_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_contact_access` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `contact_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_contact_access`
--

LOCK TABLES `user_contact_access` WRITE;
/*!40000 ALTER TABLE `user_contact_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_contact_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pt',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int unsigned DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_business_id_foreign` (`business_id`),
  KEY `users_user_type_index` (`user_type`),
  CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vale_pedagios`
--

DROP TABLE IF EXISTS `vale_pedagios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vale_pedagios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mdfe_id` int unsigned NOT NULL,
  `cnpj_fornecedor` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cnpj_fornecedor_pagador` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_compra` varchar(18) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vale_pedagios_mdfe_id_foreign` (`mdfe_id`),
  CONSTRAINT `vale_pedagios_mdfe_id_foreign` FOREIGN KEY (`mdfe_id`) REFERENCES `mdves` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vale_pedagios`
--

LOCK TABLES `vale_pedagios` WRITE;
/*!40000 ALTER TABLE `vale_pedagios` DISABLE KEYS */;
/*!40000 ALTER TABLE `vale_pedagios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_group_prices`
--

DROP TABLE IF EXISTS `variation_group_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation_group_prices` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `variation_id` int unsigned NOT NULL,
  `price_group_id` int unsigned NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`),
  CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_group_prices`
--

LOCK TABLES `variation_group_prices` WRITE;
/*!40000 ALTER TABLE `variation_group_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_group_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_location_details`
--

DROP TABLE IF EXISTS `variation_location_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation_location_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned NOT NULL,
  `product_variation_id` int unsigned NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int unsigned NOT NULL,
  `location_id` int unsigned NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_location_details_location_id_foreign` (`location_id`),
  KEY `variation_location_details_product_id_index` (`product_id`),
  KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  KEY `variation_location_details_variation_id_index` (`variation_id`),
  CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_location_details`
--

LOCK TABLES `variation_location_details` WRITE;
/*!40000 ALTER TABLE `variation_location_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_location_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_templates`
--

DROP TABLE IF EXISTS `variation_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_templates_business_id_foreign` (`business_id`),
  CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_templates`
--

LOCK TABLES `variation_templates` WRITE;
/*!40000 ALTER TABLE `variation_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_value_templates`
--

DROP TABLE IF EXISTS `variation_value_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variation_value_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `variation_value_templates_name_index` (`name`),
  KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`),
  CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_value_templates`
--

LOCK TABLES `variation_value_templates` WRITE;
/*!40000 ALTER TABLE `variation_value_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `variation_value_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int unsigned NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int unsigned NOT NULL,
  `variation_value_id` int DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details',
  PRIMARY KEY (`id`),
  KEY `variations_product_id_foreign` (`product_id`),
  KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  KEY `variations_name_index` (`name`),
  KEY `variations_sub_sku_index` (`sub_sku`),
  KEY `variations_variation_value_id_index` (`variation_value_id`),
  CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variations`
--

LOCK TABLES `variations` WRITE;
/*!40000 ALTER TABLE `variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `business_id` int unsigned NOT NULL,
  `placa` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marca` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rntrc` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_carroceira` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_rodado` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tara` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidade` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_documento` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_ie` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_uf` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proprietario_tp` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `veiculos_business_id_foreign` (`business_id`),
  CONSTRAINT `veiculos_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warranties`
--

DROP TABLE IF EXISTS `warranties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warranties` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration` int NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warranties`
--

LOCK TABLES `warranties` WRITE;
/*!40000 ALTER TABLE `warranties` DISABLE KEYS */;
/*!40000 ALTER TABLE `warranties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `youtube_video_lessons`
--

DROP TABLE IF EXISTS `youtube_video_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `youtube_video_lessons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `url_from_youtube` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_from_app` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background_color` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_button` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icone` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fas fa-play',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `youtube_video_lessons`
--

LOCK TABLES `youtube_video_lessons` WRITE;
/*!40000 ALTER TABLE `youtube_video_lessons` DISABLE KEYS */;
/*!40000 ALTER TABLE `youtube_video_lessons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-03  8:39:03
