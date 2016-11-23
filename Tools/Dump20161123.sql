CREATE DATABASE  IF NOT EXISTS `Tickets_development` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `Tickets_development`;
-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: Tickets_development
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_adress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (1,'CLE NARBONNE','10.111.1.240'),(2,'CLE MONTPELLIER','10.134.2.240'),(3,'CLE NÎMES','10.130.1.240'),(4,'CLE PROVENCE','10.113.2.240'),(5,'CLE PERPIGNAN','10.166.1.240'),(6,'CLE TOULOUSE','10.131.2.240'),(7,'CLE VALENCE','10.126.2.240'),(8,'CLE RODEZ','10.112.1.240'),(11,'CLE LYON','10.169.3.240'),(12,'CLE FREJUS','10.183.3.240'),(13,'CLE LATTES','208.67.220.123'),(14,'CLE BORDEAUX','8.8.4.4'),(16,'CLE TOULON','208.67.222.220'),(19,'CLE ILE DE FRANCE','208.67.220.222'),(20,'CLE NICE','208.67.222.123'),(21,'CLE TARBES','NULL'),(22,'CLE NANTES','10.144.2.240'),(23,'CLE BAYONNE','8.8.8.8'),(26,'CLE CAEN','NULL'),(27,'CLE CHAMBERY','NULL'),(29,'CLE TROYES','NULL'),(30,'CLE DIJON','NULL'),(31,'CLE LILLE','NULL'),(32,'CLE COLMAR','10.168.1.240'),(33,'CLE LIMOGES','NULL'),(34,'CLE RENNES','10.135.3.240'),(35,'CLE BAeeeeYeONNE','8.8.8.8');
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archives`
--

DROP TABLE IF EXISTS `archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `incident_id` int(11) DEFAULT NULL,
  `sender_id` smallint(6) DEFAULT NULL,
  `receiver_id` smallint(6) DEFAULT NULL,
  `ip_adress_sender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pc_id` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_archives_on_incident_id` (`incident_id`),
  KEY `index_archives_on_pc_id` (`pc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archives`
--

LOCK TABLES `archives` WRITE;
/*!40000 ALTER TABLE `archives` DISABLE KEYS */;
INSERT INTO `archives` VALUES (37,'Incident créé par Montesinos\n          Jeremy',37,1,NULL,NULL,NULL,'2016-06-29 08:04:52','2016-06-29 08:04:52'),(38,'Rolala\r\n',37,1,NULL,'127.0.0.1',NULL,'2016-06-29 08:04:52','2016-06-29 08:04:52'),(39,'Cloture de l\'incident : Cloturation !',37,1,NULL,'127.0.0.1',NULL,'2016-06-29 08:04:52','2016-06-29 08:04:52'),(51,'Incident créé par Kopf\n          Sandrine',44,11,NULL,NULL,NULL,'2016-07-12 09:40:17','2016-07-12 09:40:17'),(68,'Incident affecté',44,11,NULL,NULL,NULL,'2016-07-12 09:40:17','2016-07-12 09:40:17'),(69,'l',44,1,11,'127.0.0.1',NULL,'2016-07-12 09:40:17','2016-07-12 09:40:17'),(70,'b',44,11,1,'127.0.0.1',NULL,'2016-07-12 09:40:17','2016-07-12 09:40:17'),(71,'eee',44,1,11,'127.0.0.1',NULL,'2016-07-12 09:40:18','2016-07-12 09:40:18'),(72,'ffff',44,11,1,'127.0.0.1',NULL,'2016-07-12 09:40:18','2016-07-12 09:40:18'),(73,'Cloture de l\'incident : kk',44,1,11,'127.0.0.1',NULL,'2016-07-12 09:40:18','2016-07-12 09:40:18'),(74,'Cloture de l\'incident : ddddd',44,11,1,'127.0.0.1',NULL,'2016-07-12 09:40:18','2016-07-12 09:40:18'),(75,'Incident créé par Kopf\n          Sandrine',50,11,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(76,'Incident affecté',50,11,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(77,'Incident affecté',50,11,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(78,'dg',50,11,1,'127.0.0.1',NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(79,'Cloture de l\'incident : gggg',50,1,11,'127.0.0.1',NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(80,'dzdazdezqd',50,11,1,'127.0.0.1',NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(81,'Cloture de l\'incident : efzefzef',50,1,11,'127.0.0.1',NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(82,'Cloture de l\'incident : eqfzefsef',50,11,1,'127.0.0.1',NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(86,'Incident créé par Kopf\n          Sandrine',52,11,NULL,NULL,NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(87,'Incident affecté',52,11,NULL,NULL,NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(88,'sefsefesf',52,1,11,'127.0.0.1',NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(89,'zerserzer',52,11,1,'127.0.0.1',NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(90,'Cloture de l\'incident : xdfefs',52,1,11,'127.0.0.1',NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(91,'Cloture de l\'incident : tgdrtgdrgrdgr',52,11,1,'127.0.0.1',NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(102,'Incident créé par Montesinos\n          Jeremy',62,1,NULL,NULL,NULL,'2016-07-21 07:58:06','2016-07-21 07:58:06'),(104,'Incident créé par Montesinos\n          Jeremy',64,1,NULL,NULL,NULL,'2016-07-21 07:57:57','2016-07-21 07:57:57'),(106,'Incident créé par Montesinos\n          Jeremy',66,1,NULL,NULL,NULL,'2016-07-20 15:23:14','2016-07-20 15:23:14'),(115,'Incident affecté',66,1,NULL,NULL,NULL,'2016-07-20 15:23:14','2016-07-20 15:23:14'),(116,'Incident affecté',64,1,NULL,NULL,NULL,'2016-07-21 07:57:57','2016-07-21 07:57:57'),(117,'Incident affecté',62,1,NULL,NULL,NULL,'2016-07-21 07:58:06','2016-07-21 07:58:06'),(127,'Cloture de l\'incident : ',66,1,1,'192.168.10.55',NULL,'2016-07-20 15:23:14','2016-07-20 15:23:14'),(130,'Cloture de l\'incident : ',64,1,1,'10.134.2.49',NULL,'2016-07-21 07:57:57','2016-07-21 07:57:57'),(131,'Cloture de l\'incident : ',64,1,1,'10.134.2.49',NULL,'2016-07-21 07:57:57','2016-07-21 07:57:57'),(132,'Cloture de l\'incident : ',62,1,1,'10.134.2.49',NULL,'2016-07-21 07:58:06','2016-07-21 07:58:06'),(133,'Incident créé par Kopf\n          Sandrine',70,11,NULL,NULL,NULL,'2016-07-22 09:58:45','2016-07-22 09:58:45'),(134,'Incident rejeté : ',70,1,NULL,'127.0.0.1',NULL,'2016-07-22 09:58:45','2016-07-22 09:58:45'),(135,'Incident créé par Vguygvbvb\n          Rdgrg',68,16,NULL,NULL,NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(136,'dfedfezsfefsf',68,16,NULL,'192.168.10.55',NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(137,'dfedfezsfefsf',68,16,NULL,'192.168.10.55',NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(138,'dfedfezsfefsf',68,16,NULL,'192.168.10.55',NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(139,'Incident affecté',68,16,NULL,NULL,NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(140,'fsefesfe',68,16,1,'192.168.10.55',NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(141,'Incident rejeté : ',68,1,16,'127.0.0.1',NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(142,'Incident créé par Vguygvbvb\n          Rdgrg',67,16,NULL,NULL,NULL,'2016-07-22 13:17:50','2016-07-22 13:17:50'),(143,'Incident affecté',67,16,NULL,NULL,NULL,'2016-07-22 13:17:50','2016-07-22 13:17:50'),(144,'Incident rejeté : ',67,1,16,'127.0.0.1',NULL,'2016-07-22 13:17:50','2016-07-22 13:17:50'),(145,'Incident créé par Kopf\n          Sandrine',73,11,NULL,NULL,NULL,'2016-07-25 08:00:02','2016-07-25 08:00:02'),(146,'Incident rejeté : dzdzqz',73,1,NULL,'127.0.0.1',NULL,'2016-07-25 08:00:02','2016-07-25 08:00:02'),(147,'Incident créé par Kopf\n          Sandrine',72,11,NULL,NULL,NULL,'2016-07-29 12:17:07','2016-07-29 12:17:07'),(148,'Incident affecté',72,11,NULL,NULL,NULL,'2016-07-29 12:17:07','2016-07-29 12:17:07'),(149,'Incident rejeté : ',72,1,11,'127.0.0.1',NULL,'2016-07-29 12:17:07','2016-07-29 12:17:07'),(150,'Incident créé par Montesinos\n          Jeremy',61,1,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(151,'Incident affecté',61,1,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(152,'ddddd',61,1,1,'10.134.2.49',NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(153,'fesffe',61,1,1,'10.134.2.49',NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(154,'erzrr',61,1,1,'10.134.2.49',NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(155,'sfesfe',61,1,1,'10.134.2.49',NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(156,'dddddd',61,1,1,'10.134.2.49',NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(157,'zzzzz',61,1,1,'10.134.2.49',NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(158,'grgrg',61,1,1,'10.134.2.49',NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(159,'Incident rejeté : ',61,1,1,'127.0.0.1',NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(160,'Incident créé par Montesinos\n          Jeremy',75,1,NULL,NULL,NULL,'2016-08-02 08:20:00','2016-08-02 08:20:00'),(161,'Incident rejeté : ',75,1,NULL,'127.0.0.1',NULL,'2016-08-02 08:20:00','2016-08-02 08:20:00'),(162,'Incident créé par Montesinos\n          Jeremy',76,1,NULL,NULL,NULL,'2016-08-02 08:24:03','2016-08-02 08:24:03'),(163,'sss',76,1,NULL,'127.0.0.1',NULL,'2016-08-02 08:24:03','2016-08-02 08:24:03'),(164,'Incident rejeté : ddddd',76,1,NULL,'127.0.0.1',NULL,'2016-08-02 08:24:03','2016-08-02 08:24:03'),(165,'Incident créé par Montesinos\n            Jeremy',80,11,NULL,NULL,NULL,'2016-08-02 13:14:01','2016-08-02 13:14:01'),(166,'Incident rejeté : BLablabla',80,1,NULL,'127.0.0.1',NULL,'2016-08-02 13:14:01','2016-08-02 13:14:01'),(167,'Incident créé par Montesinos\n            Jeremy',79,11,NULL,NULL,NULL,'2016-08-02 13:15:54','2016-08-02 13:15:54'),(168,'Incident rejeté : BLablabla',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 13:15:54','2016-08-02 13:15:54'),(169,'Incident créé par Montesinos\n            Jeremy',78,11,NULL,NULL,NULL,'2016-08-02 13:31:40','2016-08-02 13:31:40'),(170,'Incident rejeté : BLablabla',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 13:31:40','2016-08-02 13:31:40'),(171,'Incident rejeté : BLablabla',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 13:32:10','2016-08-02 13:32:10'),(172,'Incident créé par Montesinos\n            Jeremy',77,11,NULL,NULL,NULL,'2016-08-02 13:32:30','2016-08-02 13:32:30'),(173,'Incident rejeté : BLablabla',77,1,NULL,'127.0.0.1',NULL,'2016-08-02 13:32:30','2016-08-02 13:32:30');
/*!40000 ALTER TABLE `archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automessages`
--

DROP TABLE IF EXISTS `automessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automessages`
--

LOCK TABLES `automessages` WRITE;
/*!40000 ALTER TABLE `automessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `automessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Net-Expert','2015-12-08 13:40:34','2015-12-08 13:40:34'),(2,'Imprimante/Télécopieur','2015-12-08 13:40:53','2015-12-08 13:40:53'),(3,'Internet/Réseau','2015-12-08 13:41:10','2015-12-08 13:43:08'),(4,'Logiciels','2015-12-08 13:41:25','2016-07-22 13:22:54'),(5,'Matériel','2015-12-08 13:41:33','2015-12-08 13:41:33'),(6,'Mobile','2015-12-08 13:41:48','2015-12-08 13:41:48'),(9,'Autres','2016-01-26 10:48:05','2016-07-22 13:22:42'),(10,'Tests','2016-07-22 12:47:09','2016-07-22 12:47:09'),(19,'Yayaaddddddaaa','2016-08-30 10:32:34','2016-08-30 10:32:34'),(20,'Yayaadddddddddaaa','2016-08-30 10:32:45','2016-08-30 10:32:45'),(21,'fesfef','2016-09-06 07:08:11','2016-09-06 07:08:11');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detentor_types`
--

DROP TABLE IF EXISTS `detentor_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detentor_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detentor_types`
--

LOCK TABLES `detentor_types` WRITE;
/*!40000 ALTER TABLE `detentor_types` DISABLE KEYS */;
INSERT INTO `detentor_types` VALUES (1,'Agence'),(2,'Utilisateur'),(3,'Technicien'),(4,'Réserve');
/*!40000 ALTER TABLE `detentor_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_agencies`
--

DROP TABLE IF EXISTS `field_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_agencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_agencies`
--

LOCK TABLES `field_agencies` WRITE;
/*!40000 ALTER TABLE `field_agencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_agency_agencies`
--

DROP TABLE IF EXISTS `field_agency_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_agency_agencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) DEFAULT NULL,
  `field_agency_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_agency_agencies`
--

LOCK TABLES `field_agency_agencies` WRITE;
/*!40000 ALTER TABLE `field_agency_agencies` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_agency_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_type_user_type_users`
--

DROP TABLE IF EXISTS `field_type_user_type_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_type_user_type_users` (
  `type_user_id` int(11) DEFAULT NULL,
  `field_type_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_type_user_type_users`
--

LOCK TABLES `field_type_user_type_users` WRITE;
/*!40000 ALTER TABLE `field_type_user_type_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_type_user_type_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_type_users`
--

DROP TABLE IF EXISTS `field_type_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_type_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_type_users`
--

LOCK TABLES `field_type_users` WRITE;
/*!40000 ALTER TABLE `field_type_users` DISABLE KEYS */;
INSERT INTO `field_type_users` VALUES (1,'Adresse'),(2,'Code Postal'),(3,'Téléphone Mobile'),(4,'Ville'),(5,'Email perso'),(6,'Email pro');
/*!40000 ALTER TABLE `field_type_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_users`
--

DROP TABLE IF EXISTS `field_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_type_user_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_users`
--

LOCK TABLES `field_users` WRITE;
/*!40000 ALTER TABLE `field_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_seller_sellers`
--

DROP TABLE IF EXISTS `fields_seller_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_seller_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fields_seller_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_seller_sellers`
--

LOCK TABLES `fields_seller_sellers` WRITE;
/*!40000 ALTER TABLE `fields_seller_sellers` DISABLE KEYS */;
INSERT INTO `fields_seller_sellers` VALUES (2,2,1,'Domaine de la tour, Nébian'),(14,2,2,'1569 rue du 14 juillet');
/*!40000 ALTER TABLE `fields_seller_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_sellers`
--

DROP TABLE IF EXISTS `fields_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_sellers`
--

LOCK TABLES `fields_sellers` WRITE;
/*!40000 ALTER TABLE `fields_sellers` DISABLE KEYS */;
INSERT INTO `fields_sellers` VALUES (2,'Adresse'),(3,'Code postal'),(4,'Ville'),(13,'Arrondissement');
/*!40000 ALTER TABLE `fields_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_archives`
--

DROP TABLE IF EXISTS `file_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archive_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_archives`
--

LOCK TABLES `file_archives` WRITE;
/*!40000 ALTER TABLE `file_archives` DISABLE KEYS */;
INSERT INTO `file_archives` VALUES (1,151,'_BD__Le_grand_jeu__Uchronie__-_Int_grale_6_tomes_-_PDF.torrent',20412,'application/x-bittorrent','2016-08-02 08:24:03','2016-08-02 08:24:03'),(2,152,'Nascar_Sprint_Cup_2016_-_Round_21_-_Pocono_-_1_ao_t_-_HD_1080p_x264.torrent',17030,'application/x-bittorrent','2016-08-02 08:24:03','2016-08-02 08:24:03');
/*!40000 ALTER TABLE `file_archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_incidents`
--

DROP TABLE IF EXISTS `file_incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incident_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_incidents`
--

LOCK TABLES `file_incidents` WRITE;
/*!40000 ALTER TABLE `file_incidents` DISABLE KEYS */;
INSERT INTO `file_incidents` VALUES (1,61,'10-mix.mp4',37143013,'video/mp4','2016-07-12 14:17:51','2016-07-12 14:17:51'),(2,75,'2013_-_Cafe__Del_Mar_-_Vol._19__Pt._2.torrent',49353,'application/x-bittorrent','2016-08-02 07:58:42','2016-08-02 07:58:42'),(3,75,'Un_billet_de_train_pour...-_L_Iran_-.mp4.torrent',32506,'application/x-bittorrent','2016-08-02 07:58:42','2016-08-02 07:58:42'),(4,75,'a__4___1_.xml',2387,'text/xml','2016-08-02 07:58:42','2016-08-02 07:58:42'),(5,76,'Superstructures_-_Les_jardins_de_la_baie_de_Singapour_-.mp4.torrent',21405,'application/x-bittorrent','2016-08-02 08:22:09','2016-08-02 08:22:09'),(6,76,'Nascar_Sprint_Cup_2016_-_Round_21_-_Pocono_-_1_ao_t_-_HD_1080p_x264.torrent',17030,'application/x-bittorrent','2016-08-02 08:22:09','2016-08-02 08:22:09'),(7,76,'Jamiroquai_-_At_Paleo_Festival_2010.mkv.torrent',72466,'application/x-bittorrent','2016-08-02 08:22:09','2016-08-02 08:22:09'),(8,76,'_BD__Le_grand_jeu__Uchronie__-_Int_grale_6_tomes_-_PDF.torrent',20412,'application/x-bittorrent','2016-08-02 08:22:09','2016-08-02 08:22:09');
/*!40000 ALTER TABLE `file_incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_procedures`
--

DROP TABLE IF EXISTS `file_procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `procedure_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_procedures`
--

LOCK TABLES `file_procedures` WRITE;
/*!40000 ALTER TABLE `file_procedures` DISABLE KEYS */;
INSERT INTO `file_procedures` VALUES (1,1,'Capture.PNG',33177,'image/png','2016-06-10 14:52:02','2016-06-10 14:52:02'),(2,2,'TickMaster.docx',391621,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2016-06-29 13:01:08','2016-06-29 13:01:08');
/*!40000 ALTER TABLE `file_procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_responses`
--

DROP TABLE IF EXISTS `file_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `response_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_responses`
--

LOCK TABLES `file_responses` WRITE;
/*!40000 ALTER TABLE `file_responses` DISABLE KEYS */;
INSERT INTO `file_responses` VALUES (1,59,'Annexe_CLE.pdf',4640569,'application/pdf','2016-07-12 08:41:10','2016-07-12 08:41:10'),(2,60,'Annexe_CLE.ppt',6297903,'application/vnd.ms-powerpoint','2016-07-12 08:42:14','2016-07-12 08:42:14'),(3,61,'16-applications.mp4',86768138,'video/mp4','2016-07-12 08:42:40','2016-07-12 08:42:40'),(4,100,'01-introduction.mp4',16929435,'video/mp4','2016-07-12 14:16:23','2016-07-12 14:16:23');
/*!40000 ALTER TABLE `file_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_users`
--

DROP TABLE IF EXISTS `file_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_users`
--

LOCK TABLES `file_users` WRITE;
/*!40000 ALTER TABLE `file_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents`
--

DROP TABLE IF EXISTS `incidents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `user_id` smallint(6) DEFAULT NULL,
  `tech_id` smallint(6) DEFAULT NULL,
  `category_id` smallint(6) DEFAULT NULL,
  `sous_category_id` smallint(6) DEFAULT NULL,
  `lvl_urgence_user` tinyint(4) DEFAULT NULL,
  `lvl_urgence_tech` tinyint(4) DEFAULT NULL,
  `cloture_user` tinyint(1) DEFAULT NULL,
  `cloture_tech` tinyint(1) DEFAULT NULL,
  `pc_id` int(11) DEFAULT NULL,
  `ip_adress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `solution` text COLLATE utf8_unicode_ci,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_faq` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incident_state_id_for_user_id` tinyint(4) DEFAULT NULL,
  `incident_state_id_for_tech_id` tinyint(4) DEFAULT NULL,
  `lvl_of_incident` int(11) DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `resolved_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `notify_for_tech` tinyint(1) DEFAULT NULL,
  `notify_for_user` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_incidents_on_pc_id` (`pc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (37,'Panne','<p>Bordel !</p>\r\n',1,NULL,1,14,5,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-06-29 08:04:52','2016-06-29 08:04:52','2016-06-29 08:01:47','2016-06-29 08:04:52',NULL,NULL),(38,'effsfes','<p>fesfesfefesf</p>\r\n',1,6,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-06-29 08:06:45','2016-06-29 10:00:42',NULL,NULL),(39,'sssss','<p>ssssss</p>\r\n',1,1,1,14,5,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 08:38:32','2016-06-29 12:43:56',NULL,NULL),(40,'ddddd','<p>dddd</p>\r\n',1,NULL,1,14,6,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 08:45:14','2016-06-29 08:45:14',NULL,NULL),(41,'dddddd','<p>dddddddddd</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 08:46:04','2016-06-29 08:46:04',NULL,NULL),(42,'efesfes','<p>fesfefesf</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 09:01:49','2016-07-12 14:16:23',1,0),(43,'dddddd','<p>dddd</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 09:29:25','2016-06-29 09:29:25',NULL,NULL),(44,'scscscswcswcwsc','<p>cscscscwsc</p>\r\n',11,1,1,14,1,1,NULL,NULL,NULL,'192.168.10.34',NULL,NULL,NULL,7,7,1,'2016-07-12 09:40:17','2016-07-12 09:40:17','2016-06-29 09:43:09','2016-07-12 09:40:17',0,0),(45,'dzdqsdfe','<p>fefesfsefesfef</p>\r\n',1,1,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-06-29 12:32:06','2016-07-29 08:15:37',NULL,NULL),(46,'fesfsefsef','<p>fefsefesfe</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 12:32:40','2016-07-12 08:34:17',NULL,NULL),(48,'BLABLA','<p>BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLA</p>\r\n',1,1,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-07-11 13:35:45','2016-07-29 08:16:16',NULL,NULL),(49,'blablablabla','<p>gggggg</p>\r\n',1,NULL,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 08:46:46','2016-07-12 09:34:54',0,0),(50,'fff','<p>fff</p>\r\n',11,1,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-12 09:55:39','2016-07-12 09:55:39','2016-07-12 09:41:52','2016-07-12 09:55:39',0,0),(51,'effef','<p>fffff</p>\r\n',11,1,5,16,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,4,5,1,NULL,NULL,'2016-07-12 09:57:16','2016-08-09 08:38:40',0,0),(52,'ee','<p>eee</p>\r\n',11,1,4,6,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-12 10:13:34','2016-07-12 10:13:34','2016-07-12 10:07:16','2016-07-12 10:13:34',0,0),(53,'iii','<p>iii</p>\r\n',1,NULL,3,1,0,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:52:30','2016-07-12 12:52:30',1,0),(54,'oo','<p>ooo</p>\r\n',1,NULL,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:52:52','2016-07-12 12:52:52',1,0),(55,'h','<p>h</p>\r\n',1,NULL,2,31,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:53:16','2016-07-12 12:53:16',1,0),(56,'h','<p>h</p>\r\n',1,NULL,3,1,3,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:53:40','2016-07-12 12:53:40',1,0),(57,'gdg','<p>gdgg</p>\r\n',1,NULL,2,31,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 13:08:48','2016-07-12 13:08:48',1,0),(58,'l','<p>l</p>\r\n',1,NULL,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 13:11:45','2016-07-12 13:11:45',1,0),(59,'rgre','<p>geger</p>\r\n',1,NULL,2,31,4,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 13:20:16','2016-07-12 13:20:16',1,0),(60,'ff','<p>fffff</p>\r\n',1,6,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-07-12 13:20:47','2016-07-29 08:16:50',1,0),(61,'ddd','<p>dddddd</p>\r\n',1,1,1,14,6,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-12 14:17:51','2016-07-29 12:27:30',0,1),(62,'esf','<p>fesfe</p>\r\n',1,1,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-21 07:58:06','2016-07-21 07:58:06','2016-07-12 14:26:26','2016-07-21 07:58:06',0,1),(63,'sefefsefesfe','<p>zfefesfef</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-20 10:07:00','2016-07-20 10:07:00',1,0),(64,'fgdgd','<p>drgdrgr</p>\r\n',1,1,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,7,7,1,'2016-07-21 07:57:57','2016-07-21 07:57:57','2016-07-20 10:07:38','2016-07-21 07:57:57',0,1),(65,'qdz','<p>zdqzdzqd</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-20 10:09:39','2016-07-20 10:09:39',1,0),(66,'hth','<p>tfhtht</p>\r\n',1,1,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,7,7,1,'2016-07-20 15:23:14','2016-07-20 15:23:14','2016-07-20 12:59:35','2016-07-20 15:23:14',0,1),(69,'dzzqdqz','<p>dzqdzqdzqd</p>\r\n',11,1,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,8,9,1,NULL,'2016-07-20 15:23:26','2016-07-20 15:08:09','2016-07-20 15:23:26',0,1),(70,'sef','<p>eee</p>\r\n',11,NULL,1,14,1,1,NULL,NULL,NULL,'10.134.2.49',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-21 07:27:15','2016-07-22 09:58:45',0,0),(71,'ss','<p>sssss</p>\r\n',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-25 07:54:00','2016-07-25 07:54:00',1,0),(72,'ss','<p>sssss</p>\r\n',11,1,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-25 07:59:11','2016-07-29 12:17:07',0,1),(73,'dd','<p>ddddd</p>\r\n',11,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-25 07:59:28','2016-07-25 08:00:02',0,0),(74,'sssss','<p>ssssss</p>\r\n',11,6,3,1,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-26 07:12:59','2016-08-02 13:36:06',1,0),(75,'dddd','<p>ssssss</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-08-02 07:58:42','2016-08-02 08:20:00',0,0),(76,'xxxxx','<p>xxxxx</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-08-02 08:22:09','2016-08-02 08:24:03',0,0),(78,'ss','<p>sssss</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,8,9,1,NULL,'2016-08-02 14:23:52','2016-08-02 12:19:16','2016-08-02 14:23:52',0,0),(79,'ss','<p>sssss</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,8,9,1,NULL,'2016-08-02 14:14:16','2016-08-02 12:19:59','2016-08-02 14:14:16',0,0),(80,'ss','<p>ssssskk</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-02 12:25:43','2016-08-02 13:44:16',1,0),(82,'s','<p>s</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:08:36','2016-08-03 08:08:36',1,0),(83,'dd','<p>ddddd</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:09:52','2016-08-03 08:09:52',1,0),(84,'c','<p>c</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:10:39','2016-08-03 08:10:39',1,0),(85,'dd','<p>dddd</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:11:27','2016-08-03 08:11:27',1,0),(86,'s','<p>s</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:15:45','2016-08-03 08:15:45',1,0),(87,'eee','<p>eeee</p>\r\n',1,NULL,3,1,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:17:54','2016-08-03 08:17:54',1,0),(88,'ee','<p>eee</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:18:54','2016-08-03 08:18:54',1,0),(89,'sss','<p>sssss</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:19:50','2016-08-03 08:19:50',1,0),(91,'ss','<p>sssss</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 09:32:52','2016-08-03 09:32:52',1,0),(92,'d','<p>d</p>\r\n',1,NULL,4,6,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 09:35:35','2016-08-03 09:35:35',1,0),(93,'eeeeeeeeeee','<p>eee</p>\r\n',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-25 13:47:55','2016-08-25 13:49:23',0,0),(94,'rgdrgdrgrdgrdg','<p>drgrgrg</p>\r\n',1,1,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-09-06 08:50:02','2016-10-17 15:12:11',1,0);
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incidents_states`
--

DROP TABLE IF EXISTS `incidents_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidents_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortcut` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents_states`
--

LOCK TABLES `incidents_states` WRITE;
/*!40000 ALTER TABLE `incidents_states` DISABLE KEYS */;
INSERT INTO `incidents_states` VALUES (1,'En attente de prise en charge','En attente PEC'),(2,'Affecté à un technicien','Affecté'),(3,'Pris en charge par un technicien','PEC par technicien'),(4,'Réponse reçue','Rép reçue'),(5,'En attente de réponse du demandeur','En attente'),(6,'En attente de réponse du technicien','En attente'),(7,'Incident cloturé','Cloturé'),(8,'En attente de cloture de la part du demandeur','En attente cloture'),(9,'Demande de cloture envoyée, en attente','En attente cloture'),(10,'Incident rejeté','Rejeté'),(11,'Incident pris en charge par un technicien supérieur','PEC par un technicien sup'),(12,'Incident en attente de réponse pour prise en charge par un technicien supérieur','En attente prise en charge tech sup');
/*!40000 ALTER TABLE `incidents_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_waiting`
--

DROP TABLE IF EXISTS `mails_waiting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_waiting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `date_to_attempt` date DEFAULT NULL,
  `number_of_attempts` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_waiting`
--

LOCK TABLES `mails_waiting` WRITE;
/*!40000 ALTER TABLE `mails_waiting` DISABLE KEYS */;
/*!40000 ALTER TABLE `mails_waiting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_material_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `detentor_type_id` int(11) DEFAULT NULL,
  `detentor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (99,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','Nokia Lumia 750',2,2,1),(100,4,'0000-00-00 00:00:00','0000-00-00 00:00:00','Nokia Lumia 750',2,3,5),(101,1,'2016-10-04 09:40:22','2016-10-04 09:40:22','Nokia Lumia 750',3,4,6);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedures`
--

DROP TABLE IF EXISTS `procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contenu` text COLLATE utf8_unicode_ci,
  `resolution` text COLLATE utf8_unicode_ci,
  `category_id` int(11) DEFAULT NULL,
  `sous_category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures`
--

LOCK TABLES `procedures` WRITE;
/*!40000 ALTER TABLE `procedures` DISABLE KEYS */;
INSERT INTO `procedures` VALUES (1,'Fusion modèle (erreur ...\\MODELES\\0.bcs)','<p>Bonjour,</p>\r\n\r\n<p>La fusion avec l&#39;intervenant ne se fait pas.(1 intervenant sur les 2 demand&eacute;s).</p>\r\n\r\n<p>Message :</p>\r\n\r\n<p>Le filtre graphique ne parvient pas &agrave; convertir le fichier (<a href=\"file://\\\\10.0.171.240\\NEXTPERT\\modeles\\0.bcs\">\\\\10.0.171.240\\NEXTPERT\\modeles\\0.bcs</a>) - Erreur non sp&eacute;cifi&eacute;e</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Merci</p>\r\n','<p>Bonjour,</p>\r\n\r\n<p>C&#39;est le fichier signature qui n&#39;est pas bon, pour le refaire, changer le signataire dans l&#39;onglet g&eacute;n&eacute;ral et remettez ensuite le bon expert, le fichier sera reconstruit et vos documents fusionneront.</p>\r\n',1,38,'2016-06-10 14:52:02','2016-06-10 16:30:37'),(2,'Panne','<p>Bordel !</p>\r\n','<h4><strong><u>Message N&deg; 1 : </u></strong></h4>\r\n\r\n<h4>Incident cr&eacute;&eacute; par Montesinos Jeremy</h4>\r\n\r\n<h4><strong><u>Message N&deg; 2 : </u></strong></h4>\r\n\r\n<h4>Rolala</h4>\r\n\r\n<h4><strong><u>Message N&deg; 3 : </u></strong></h4>\r\n\r\n<h4>Cloture de l&#39;incident : Cloturation !</h4>\r\n',1,14,'2016-06-29 13:01:08','2016-06-29 13:01:08');
/*!40000 ALTER TABLE `procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `incident_id` int(11) DEFAULT NULL,
  `sender_id` smallint(6) DEFAULT NULL,
  `receiver_id` smallint(6) DEFAULT NULL,
  `ip_adress_sender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pc_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_responses_on_incident_id` (`incident_id`),
  KEY `index_responses_on_pc_id` (`pc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
INSERT INTO `responses` VALUES (40,'Incident créé par Montesinos\n          Jeremy',38,1,NULL,NULL,NULL,'2016-06-29 08:06:45','2016-06-29 08:06:45'),(41,'Incident créé par Montesinos\n          Jeremy',39,1,NULL,NULL,NULL,'2016-06-29 08:38:32','2016-06-29 08:38:32'),(42,'Incident créé par Montesinos\n          Jeremy',40,1,NULL,NULL,NULL,'2016-06-29 08:45:14','2016-06-29 08:45:14'),(43,'Incident créé par Montesinos\n          Jeremy',41,1,NULL,NULL,NULL,'2016-06-29 08:46:04','2016-06-29 08:46:04'),(44,'retetet',40,1,NULL,'127.0.0.1',NULL,'2016-06-29 08:47:20','2016-06-29 08:47:20'),(45,'dzaddeq',38,1,NULL,'127.0.0.1',NULL,'2016-06-29 08:47:58','2016-06-29 08:47:58'),(46,'dfsefefesf',40,1,NULL,'127.0.0.1',NULL,'2016-06-29 08:50:04','2016-06-29 08:50:04'),(47,'Incident créé par Montesinos\n          Jeremy',42,1,NULL,NULL,NULL,'2016-06-29 09:01:49','2016-06-29 09:01:49'),(48,'fesfefefesf',42,1,NULL,'127.0.0.1',NULL,'2016-06-29 09:01:58','2016-06-29 09:01:58'),(49,'Incident créé par Montesinos\n          Jeremy',43,1,NULL,NULL,NULL,'2016-06-29 09:29:25','2016-06-29 09:29:25'),(50,'ddddd',43,1,NULL,'127.0.0.1',NULL,'2016-06-29 09:29:39','2016-06-29 09:29:39'),(52,'Incident affecté',38,1,NULL,NULL,NULL,'2016-06-29 10:00:42','2016-06-29 10:00:42'),(53,'Incident créé par Montesinos\n          Jeremy',45,1,NULL,NULL,NULL,'2016-06-29 12:32:06','2016-06-29 12:32:06'),(54,'Incident créé par Montesinos\n          Jeremy',46,1,NULL,NULL,NULL,'2016-06-29 12:32:40','2016-06-29 12:32:40'),(55,'Incident affecté',39,1,NULL,NULL,NULL,'2016-06-29 12:43:21','2016-06-29 12:43:21'),(56,'Demande de réaffectation envoyée : J\'y arrive pas !',39,1,1,'127.0.0.1',NULL,'2016-06-29 12:43:56','2016-06-29 12:43:56'),(57,'Incident créé par Montesinos\n          Jeremy',47,NULL,NULL,NULL,NULL,'2016-07-11 13:34:52','2016-07-11 13:34:52'),(58,'Incident créé par Montesinos\n          Jeremy',48,1,NULL,NULL,NULL,'2016-07-11 13:35:45','2016-07-11 13:35:45'),(59,'s',48,1,NULL,'127.0.0.1',NULL,'2016-07-12 08:41:10','2016-07-12 08:41:10'),(60,'d',48,1,NULL,'127.0.0.1',NULL,'2016-07-12 08:42:14','2016-07-12 08:42:14'),(61,'d',48,1,NULL,'127.0.0.1',NULL,'2016-07-12 08:42:40','2016-07-12 08:42:40'),(62,'Incident créé par Montesinos\n          Jeremy',49,1,NULL,NULL,NULL,'2016-07-12 08:46:46','2016-07-12 08:46:46'),(63,'bla',49,1,NULL,'127.0.0.1',NULL,'2016-07-12 09:25:22','2016-07-12 09:25:22'),(64,'ee',49,1,NULL,'127.0.0.1',NULL,'2016-07-12 09:26:23','2016-07-12 09:26:23'),(65,'d',49,1,NULL,'127.0.0.1',NULL,'2016-07-12 09:27:54','2016-07-12 09:27:54'),(66,'dddd',49,1,NULL,'127.0.0.1',NULL,'2016-07-12 09:28:19','2016-07-12 09:28:19'),(67,'bla',49,1,NULL,'127.0.0.1',NULL,'2016-07-12 09:34:54','2016-07-12 09:34:54'),(83,'Incident créé par Kopf\n          Sandrine',51,11,NULL,NULL,NULL,'2016-07-12 09:57:16','2016-07-12 09:57:16'),(84,'Incident affecté',51,11,NULL,NULL,NULL,'2016-07-12 10:00:19','2016-07-12 10:00:19'),(85,'sefsefesfesf',51,1,11,'127.0.0.1',NULL,'2016-07-12 10:04:57','2016-07-12 10:04:57'),(92,'Incident créé par Montesinos\n          Jeremy',53,1,NULL,NULL,NULL,'2016-07-12 12:52:30','2016-07-12 12:52:30'),(93,'Incident créé par Montesinos\n          Jeremy',54,1,NULL,NULL,NULL,'2016-07-12 12:52:52','2016-07-12 12:52:52'),(94,'Incident créé par Montesinos\n          Jeremy',55,1,NULL,NULL,NULL,'2016-07-12 12:53:16','2016-07-12 12:53:16'),(95,'Incident créé par Montesinos\n          Jeremy',56,1,NULL,NULL,NULL,'2016-07-12 12:53:40','2016-07-12 12:53:40'),(96,'Incident créé par Montesinos\n          Jeremy',57,1,NULL,NULL,NULL,'2016-07-12 13:08:48','2016-07-12 13:08:48'),(97,'Incident créé par Montesinos\n          Jeremy',58,1,NULL,NULL,NULL,'2016-07-12 13:11:45','2016-07-12 13:11:45'),(98,'Incident créé par Montesinos\n          Jeremy',59,1,NULL,NULL,NULL,'2016-07-12 13:20:16','2016-07-12 13:20:16'),(99,'Incident créé par Montesinos\n          Jeremy',60,1,NULL,NULL,NULL,'2016-07-12 13:20:47','2016-07-12 13:20:47'),(100,'deqesf',42,1,NULL,'127.0.0.1',NULL,'2016-07-12 14:16:23','2016-07-12 14:16:23'),(103,'Incident créé par Montesinos\n          Jeremy',63,1,NULL,NULL,NULL,'2016-07-20 10:07:00','2016-07-20 10:07:00'),(105,'Incident créé par Montesinos\n          Jeremy',65,1,NULL,NULL,NULL,'2016-07-20 10:09:39','2016-07-20 10:09:39'),(119,'Incident créé par Kopf\n          Sandrine',69,11,NULL,NULL,NULL,'2016-07-20 15:08:09','2016-07-20 15:08:09'),(120,'Incident affecté',69,11,NULL,NULL,NULL,'2016-07-20 15:08:47','2016-07-20 15:08:47'),(121,'ezesf',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:10:19','2016-07-20 15:10:19'),(122,'esfsef',69,11,1,'192.168.10.55',NULL,'2016-07-20 15:10:46','2016-07-20 15:10:46'),(123,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:20:02','2016-07-20 15:20:02'),(124,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:20:27','2016-07-20 15:20:27'),(125,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:21:12','2016-07-20 15:21:12'),(126,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:21:22','2016-07-20 15:21:22'),(128,'Cloture de l\'incident : ',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:23:26','2016-07-20 15:23:26'),(140,'Incident créé par Kopf\n          Sandrine',71,11,NULL,NULL,NULL,'2016-07-25 07:54:00','2016-07-25 07:54:00'),(142,'Incident créé par Kopf\n          Sandrine',74,11,NULL,NULL,NULL,'2016-07-26 07:12:59','2016-07-26 07:12:59'),(143,'Incident affecté',74,11,NULL,NULL,NULL,'2016-07-26 08:08:44','2016-07-26 08:08:44'),(145,'Incident affecté',45,1,NULL,NULL,NULL,'2016-07-29 08:15:37','2016-07-29 08:15:37'),(146,'Incident affecté',48,1,NULL,NULL,NULL,'2016-07-29 08:16:16','2016-07-29 08:16:16'),(147,'Incident affecté',60,1,NULL,NULL,NULL,'2016-07-29 08:16:50','2016-07-29 08:16:50'),(157,'Incident créé par Montesinos\n            Jeremy',81,11,NULL,NULL,NULL,'2016-08-02 12:25:51','2016-08-02 12:25:51'),(163,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,'2016-08-02 13:36:06','2016-08-02 13:36:06'),(164,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,'2016-08-02 13:42:41','2016-08-02 13:42:41'),(165,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,'2016-08-02 13:43:12','2016-08-02 13:43:12'),(166,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,'2016-08-02 13:43:41','2016-08-02 13:43:41'),(167,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',80,1,NULL,'127.0.0.1',NULL,'2016-08-02 13:44:16','2016-08-02 13:44:16'),(168,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 13:44:55','2016-08-02 13:44:55'),(169,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:11:02','2016-08-02 14:11:02'),(170,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:11:12','2016-08-02 14:11:12'),(171,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:11:38','2016-08-02 14:11:38'),(172,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:14:16','2016-08-02 14:14:16'),(173,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:18:57','2016-08-02 14:18:57'),(174,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:23:24','2016-08-02 14:23:24'),(175,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:23:36','2016-08-02 14:23:36'),(176,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:23:52','2016-08-02 14:23:52'),(177,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:24:06','2016-08-02 14:24:06'),(178,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:25:16','2016-08-02 14:25:16'),(179,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:20:24','2016-08-03 07:20:24'),(180,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:25:47','2016-08-03 07:25:47'),(181,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:26:47','2016-08-03 07:26:47'),(182,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:26:49','2016-08-03 07:26:49'),(183,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:26:51','2016-08-03 07:26:51'),(184,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:27:25','2016-08-03 07:27:25'),(185,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:28:34','2016-08-03 07:28:34'),(186,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:29:48','2016-08-03 07:29:48'),(188,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:32:00','2016-08-03 07:32:00'),(189,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:34:29','2016-08-03 07:34:29'),(191,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:37:26','2016-08-03 07:37:26'),(192,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:37:34','2016-08-03 07:37:34'),(193,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:46:12','2016-08-03 07:46:12'),(194,'Incident créé par Montesinos\n            Jeremy',82,1,NULL,NULL,NULL,'2016-08-03 08:08:36','2016-08-03 08:08:36'),(195,'Incident créé par Montesinos\n            Jeremy',83,1,NULL,NULL,NULL,'2016-08-03 08:09:52','2016-08-03 08:09:52'),(196,'Incident créé par Montesinos\n            Jeremy',84,1,NULL,NULL,NULL,'2016-08-03 08:10:39','2016-08-03 08:10:39'),(197,'Incident créé par Montesinos\n            Jeremy',85,1,NULL,NULL,NULL,'2016-08-03 08:11:27','2016-08-03 08:11:27'),(198,'Incident créé par Montesinos\n            Jeremy',86,1,NULL,NULL,NULL,'2016-08-03 08:15:45','2016-08-03 08:15:45'),(199,'Incident créé par Montesinos\n            Jeremy',87,1,NULL,NULL,NULL,'2016-08-03 08:17:54','2016-08-03 08:17:54'),(200,'Incident créé par Montesinos\n            Jeremy',88,1,NULL,NULL,NULL,'2016-08-03 08:18:54','2016-08-03 08:18:54'),(201,'Incident créé par Montesinos\n            Jeremy',89,1,NULL,NULL,NULL,'2016-08-03 08:19:50','2016-08-03 08:19:50'),(202,'Incident créé par Montesinos\n            Jeremy',90,1,NULL,NULL,NULL,'2016-08-03 09:32:07','2016-08-03 09:32:07'),(203,'Incident créé par Montesinos\n            Jeremy',91,11,NULL,NULL,NULL,'2016-08-03 09:32:52','2016-08-03 09:32:52'),(204,'Incident créé par Montesinos\n            Jeremy',92,1,NULL,NULL,NULL,'2016-08-03 09:35:35','2016-08-03 09:35:35'),(205,'Incident créé par Kopf\n            Sandrine',93,11,NULL,NULL,NULL,'2016-08-25 13:47:55','2016-08-25 13:47:55'),(206,'Cloture de l\'incident : ',93,11,NULL,'127.0.0.1',NULL,'2016-08-25 13:49:23','2016-08-25 13:49:23'),(207,'Cloture de l\'incident : ',93,11,NULL,'127.0.0.1',NULL,'2016-08-25 13:51:30','2016-08-25 13:51:30'),(208,'Cloture de l\'incident : ',93,11,NULL,'127.0.0.1',NULL,'2016-08-25 13:52:14','2016-08-25 13:52:14'),(209,'Cloture de l\'incident : ',93,11,NULL,'127.0.0.1',NULL,'2016-08-25 13:52:20','2016-08-25 13:52:20'),(210,'Cloture de l\'incident : ',93,11,NULL,'127.0.0.1',NULL,'2016-08-25 13:53:08','2016-08-25 13:53:08'),(211,'Incident créé par Montesinos\n            Jeremy',94,1,NULL,NULL,NULL,'2016-09-06 08:50:02','2016-09-06 08:50:02'),(212,'Incident affecté',94,1,NULL,NULL,NULL,'2016-10-17 15:11:01','2016-10-17 15:11:01'),(213,'Incident affecté',94,1,NULL,NULL,NULL,'2016-10-17 15:12:11','2016-10-17 15:12:11');
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (1,'view_index_users','Autorisé à voir la liste des utilisateurs'),(2,'create_new_tech','Autorisé à créer un nouvel utilisateur, tech, supertech, admin'),(3,'create_new_right','Autorisé à créer de nouveaux droits'),(4,'create_new_category','Autorisé à créer de nouvelles catégories'),(5,'view_index_all_of_incidents','Autorisé à voir les incidents de tous les membres'),(6,'create_new_incidents','Autorisé à créer de nouveaux incidents'),(7,'create_new_subcategory','Autorisé à créer de nouvelles sous catégories'),(8,'view_index_categories','Autorisé à voir la liste des catégories'),(9,'view_details_category','Autorisé à voir les détails d\'une catégorie'),(10,'edit_category','Autorisé à éditer une categorie'),(11,'delete_category','Autorisé à supprimer une catégorie'),(12,'view_details_incident_of_other_member','Autorisé à voir les détails d\'un incident d\'un autre membre'),(13,'edit_incidents','Autorisé à éditer un incident d\'un autre membre'),(14,'delete_incident','Autorisé à supprimer un incident'),(15,'edit_subcategories','Autorisé à éditer une sous catégorie'),(16,'view_index_subcategories','Autorisé à voir la liste des sous categories'),(17,'view_details_subcategories','Autorisé à voir le détail d\'une sous catégorie'),(18,'delete_subcategories','Autorisé à supprimer les sous catégories'),(19,'edit_rights','Autorisé à éditer un droit'),(20,'view_index_rights','Autorisé à voir la liste des droits'),(21,'delete_rights','Autorisé à supprimer des droits'),(22,'dispatch_incidents','Autorisé à attribuer les incidents aux techniciens'),(23,'view_index_fonctions','Autorisé à voir la liste des fonctions'),(24,'create_new_fonctions','Autorisé à créer une nouvelle fonction'),(25,'edit_fonctions','Autorisé à éditer une fonction'),(26,'delete_fonctions','Autorisé à supprimer une fonction'),(27,'view_users_pages','Autorisé à voir la page des autres membres'),(28,'reject_incidents','Autorisé à rejeter un incident'),(29,'cloture_incidents','Autorisé à cloturer les incidents ou à faire une demande de cloture'),(30,'view_button_admin','Autorisé à voir le bouton administration'),(31,'view_index_agencies','Autorisé à voir la page d\'index des agences'),(32,'view_agency_details','Autorisé à voir les détails d\'une agence'),(33,'create_new_agency','Autorisé à créer une nouvelle agence'),(34,'edit_agency','Autorisé à editer une agence existante'),(35,'edit_user','Autorisé à éditer ses informations personnelles'),(36,'edit_other_user','Autorisé à editer le profil d\'autres utilisateurs'),(37,'edit_all_user','Autorisé à modifier tous les champs d\'un utilisateur'),(38,'edit_like_a_boss','Autorisé à modifier le type d\'utilisateur'),(39,'view_detail_incident','Autorisé à voir le détail des incidents'),(40,'ask_for_reaffect','Autorisé à demander une réaffectation de l\'incident'),(41,'edit_categories_incidents','Autorisé à modifier la catégorie et sous catégorie d\'un incident'),(42,'edit_lvl_incident','Autorisé à modifier le niveau d\'un incident'),(43,'save_changes_of_edit','Autorisé à enregistrer les modifications d\'un incident'),(44,'treat_incidents','Autorisé à traiter les incidents'),(45,'create_procedure','Autorisé à créer une procedure'),(46,'view_procedures','Autorisé à voir les procedures'),(47,'edit_procedure','Autorisé à modifier les procedures'),(48,'archive_procedure','Autorisé à archiver les procedures'),(49,'delete_procedure','Autorisé à supprimer une procedure'),(50,'ping_agencies','Autorisé à pinger les agences'),(51,'create_sellers','Autorisé à ajouter des vendeurs de matériel'),(52,'modify_sellers','Autorisé à modifier des vendeurs de matériel'),(53,'delete_sellers','Autorisé à supprimer des vendeurs de matériel'),(54,'view_sellers','Autorisé à voir les vendeurs de matériel'),(55,'create_fields_sellers','Autorisé à créer des champs de données pour les vendeurs'),(56,'modify_fields_sellers','Autorisé à modifier des champs de données pour les vendeurs'),(57,'delete_fields_sellers','Autorisé à supprimer des champs de données pour les vendeurs'),(58,'view_fields_sellers','Autorisé à voir les champs de données pour les vendeurs'),(59,'create_detentor_type','Autorisé à créer des types de detenteur de matériel'),(60,'modify_detentor_type','Autorisé à modifier des types de detenteur de matériel'),(61,'delete_detentor_type','Autorisé à supprimer des types de detenteur de matériel'),(62,'view_detentor_type','Autorisé à voir les types de détenteur de matériel'),(63,'create_material','Autorisé à créer des matériels'),(64,'modify_material','Autorisé à modifier des matériels'),(65,'delete_material','Autorisé à supprimer des materiels'),(66,'view_material','Autorisé à voir les matériels'),(67,'create_spec_material','Autorisé à créer des specs pour les matériels'),(68,'modify_spec_material','Autorisé à modifier des specs pour les matériels'),(69,'delete_spec_material','Autorisé à supprimer les specs pour les matériels'),(70,'view_spec_material','Autorisé à voir les spec pour les matériels'),(71,'create_spec_type_material','Autorisé à créer des champs de spec pour les matériels'),(72,'modify_spec_type_material','Autorisé à modifier des champs de spec pour les matériels'),(73,'delete_spec_type_material','Autorisé à supprimer des champs de spec pour les matériels'),(74,'view_spec_type_material','Autorisé à voir les champs de spec pour les matériels'),(75,'create_type_material','Autorisé à créer des types de matériels'),(76,'modify_type_material','Autorisé à modifier des types de matériels'),(77,'delete_type_material','Autorisé à supprimer des types de matériels'),(78,'view_type_material','Autorisé à voir les types de matériels'),(79,'doPing','Autorisé à pinger'),(80,'delete_agency','Autorisé à supprimer une agence'),(81,'delete_user','Autorisé à supprimer un utilisateur'),(82,'create_update','Autorisé à créer une mise à jour'),(83,'modify_update','Autorisé à modifier une mise à jour'),(84,'delete_update','Autorisé à supprimer un mise à jour'),(85,'view_update','Autorisé à voir les mises à jour'),(86,'enable_disable_user','Autorisé à activer ou désactiver un utilisateur'),(87,'view_type_users','Autorisé à voir la liste des types utilisateurs'),(88,'edit_type_users','Autorisé à editer un type utilisateur'),(89,'add_type_users','Autorisé à ajouter un type utilisateur'),(90,'add_field_type_users','Autorisé à ajouter un champ pour un type utilisateur'),(91,'disable_type_users','Autorisé à désactiver un type utilisateur'),(92,'destroy_type_users','Autorisé à supprimer un type utilisateur'),(93,'unassigns_fields_type_user','Autorisé à dé-assigner des champs de type utilisateur'),(94,'create_field_type_user','Autorisé à supprimer un champ de type utilisateur'),(95,'edit_fields_type_user','Autorisé à modifier des champs de type utilisateur');
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150825071155'),('20150825071156'),('20150825071157'),('20150825071158'),('20150825071159'),('20150825071200'),('20150825071837'),('20150826070025'),('20150901065526'),('20150904132424'),('20150910095317'),('20150914075438'),('20150914075509'),('20150914075522'),('20150921082325'),('20151005135925'),('20151005140014'),('20151019081406'),('20160125141130'),('20160502144426'),('20160525075243'),('20160621092116'),('20160711132653'),('20160712084750'),('20160720071521'),('20160729133714'),('20160729133935'),('20160729134015'),('20160729134037'),('20160729134122'),('20160729134215'),('20160729134243'),('20160729140500'),('20160729140616'),('20160729140722'),('20160729141019'),('20160805131815'),('20160805140517'),('20160805143904'),('20160808090901'),('20160808090902'),('20160808090903'),('20160808092715'),('20160808092716'),('20160831095303'),('20160906084500'),('20160907072038'),('20160912094205'),('20160921080122'),('20160921080312'),('20160921080548'),('20161003075536'),('20161003075551'),('20161004095023'),('20161004132047'),('20161004132236'),('20161004133013'),('20161004133042'),('20161011095254'),('20161011145318'),('20161017075322'),('20161017075501'),('20161017080315'),('20161017080445'),('20161017081352'),('20161017081441'),('20161017081544'),('20161017082013'),('20161017083317'),('20161017083610'),('20161017083919'),('20161017084638'),('20161017084732'),('20161017085957'),('20161017090450'),('20161017135241'),('20161017135242'),('20161017135849'),('20161017135900'),('20161019091727'),('20161019092507'),('20161019133210'),('20161019133253'),('20161102160132');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `actif` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,'0000-00-00 00:00:00','Samsung',1),(2,'0000-00-00 00:00:00','Asus',1),(3,'0000-00-00 00:00:00','Microsoft',0);
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sous_categories`
--

DROP TABLE IF EXISTS `sous_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sous_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `lvl_urgence_max` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sous_categories_on_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_categories`
--

LOCK TABLES `sous_categories` WRITE;
/*!40000 ALTER TABLE `sous_categories` DISABLE KEYS */;
INSERT INTO `sous_categories` VALUES (1,'Messagerie',3,10,'2015-12-08 13:43:27','2015-12-08 13:43:27'),(2,'Navigateur internet',3,10,'2015-12-08 13:45:01','2015-12-08 13:45:01'),(3,'VPN',3,10,'2015-12-08 13:45:14','2015-12-08 13:45:14'),(4,'Messages suspects',3,10,'2015-12-08 13:45:28','2015-12-08 13:45:28'),(5,'Routeur',3,10,'2015-12-08 13:45:47','2016-01-14 10:53:28'),(6,'Outlook',4,10,'2015-12-08 13:46:30','2015-12-08 13:46:30'),(7,'Antivirus',4,10,'2015-12-08 13:46:48','2015-12-08 13:46:48'),(8,'Installer/Desinstaller',4,10,'2015-12-08 13:47:13','2015-12-08 13:47:13'),(9,'Lecteur Olympus',4,10,'2015-12-08 13:47:29','2015-12-08 13:47:29'),(10,'Gestion des fichiers',4,10,'2015-12-08 13:48:00','2015-12-08 13:48:00'),(11,'JobList',4,10,'2015-12-08 13:49:00','2015-12-08 13:49:00'),(12,'Word',4,10,'2015-12-08 13:49:16','2015-12-08 13:49:16'),(13,'Excel',4,10,'2015-12-08 13:49:37','2015-12-08 13:49:37'),(14,'Net-Expert DSS',1,10,'2015-12-08 13:50:17','2015-12-08 13:50:17'),(15,'Connectique',5,10,'2015-12-08 14:02:51','2015-12-08 14:02:51'),(16,'Alimentation',5,10,'2015-12-08 14:03:10','2015-12-08 14:03:10'),(17,'Ecran',5,10,'2015-12-08 14:03:27','2015-12-08 14:03:27'),(18,'Son',5,10,'2015-12-08 14:03:36','2015-12-08 14:03:36'),(19,'Stockage',5,10,'2015-12-08 14:03:55','2015-12-08 14:03:55'),(20,'Microphone',5,10,'2015-12-08 14:04:22','2015-12-08 14:04:22'),(21,'Comptes Email',6,10,'2015-12-08 14:05:38','2015-12-08 14:05:38'),(22,'Contacts',6,10,'2015-12-08 14:05:52','2015-12-08 14:05:52'),(23,'Messages',6,10,'2015-12-08 14:06:09','2015-12-08 14:06:09'),(25,'Parametrage',6,10,'2015-12-08 14:06:58','2015-12-08 14:06:58'),(26,'Autre',1,10,'2016-01-13 09:50:56','2016-01-13 09:50:56'),(27,'Jobliste',1,10,'2016-01-14 10:50:02','2016-01-14 10:50:02'),(28,'Intranet',3,10,'2016-01-14 10:54:29','2016-01-14 10:54:29'),(30,'Autre',7,10,'2016-01-26 10:45:05','2016-01-26 10:45:05'),(31,'Autre',2,10,'2016-01-26 10:46:15','2016-01-26 10:46:15'),(32,'Autre',3,10,'2016-01-26 10:46:24','2016-01-26 10:46:24'),(33,'Autre',4,10,'2016-01-26 10:46:33','2016-01-26 10:46:33'),(34,'Autre',5,10,'2016-01-26 10:46:43','2016-01-26 10:46:43'),(35,'Autre',6,10,'2016-01-26 10:46:52','2016-01-26 10:46:52'),(36,'Autre',9,10,'2016-01-26 10:48:05','2016-01-26 10:48:05'),(37,'Autre',10,10,'2016-02-09 09:11:25','2016-02-09 09:11:25'),(38,'NetExpert',1,10,'2016-06-10 16:29:57','2016-06-10 16:29:57'),(39,'Autre',10,10,'2016-07-22 12:47:09','2016-07-22 12:47:09'),(40,'Autre',11,10,'2016-07-22 12:47:21','2016-07-22 12:47:21'),(41,'Bla',NULL,4,'2016-07-22 12:55:44','2016-07-22 12:55:44'),(42,'khuyku',NULL,10,'2016-07-22 12:56:07','2016-07-22 12:56:07'),(43,'hthfthf',NULL,10,'2016-07-22 12:57:42','2016-07-22 12:57:42'),(44,'njunujnjuk',NULL,10,'2016-07-22 12:58:49','2016-07-22 12:58:49'),(45,'tddtf',NULL,10,'2016-07-22 13:01:04','2016-07-22 13:01:04'),(46,'vfvfdgrd',3,10,'2016-07-22 13:02:30','2016-07-22 13:02:30'),(47,'buibihn',3,10,'2016-07-22 13:02:39','2016-07-22 13:02:39'),(48,'Autre',12,10,'2016-07-22 13:22:19','2016-07-22 13:22:19'),(49,'Autre',13,10,'2016-07-22 13:22:25','2016-07-22 13:22:25'),(50,'Autre',14,10,'2016-08-02 09:33:56','2016-08-02 09:33:56'),(51,'Autre',13,10,'2016-08-30 07:56:01','2016-08-30 07:56:01'),(52,'Autre',14,10,'2016-08-30 08:00:24','2016-08-30 08:00:24'),(53,'Autre',15,10,'2016-08-30 08:01:03','2016-08-30 08:01:03'),(54,'Autre',16,10,'2016-08-30 08:01:40','2016-08-30 08:01:40'),(55,'Autre',17,10,'2016-08-30 08:02:06','2016-08-30 08:02:06'),(56,'Autre',18,10,'2016-08-30 08:04:22','2016-08-30 08:04:22'),(58,'Autre',20,10,'2016-08-30 10:32:45','2016-08-30 10:32:45'),(59,'sxcsxcwcswc',NULL,10,'2016-08-31 13:35:07','2016-08-31 13:35:07'),(60,'sxcsxcwcswc',NULL,10,'2016-08-31 13:35:31','2016-08-31 13:35:31'),(61,'Messagerie',3,10,'2016-09-05 08:02:44','2016-09-05 08:02:44'),(106,'Autre',21,10,'2016-09-06 07:08:12','2016-09-06 07:08:12'),(107,'fesffe',21,10,'2016-09-06 07:08:24','2016-09-06 07:08:24'),(108,'fesfsef',21,10,'2016-09-06 07:08:25','2016-09-06 07:08:25'),(109,'fesfesfesf',21,10,'2016-09-06 07:08:26','2016-09-06 07:08:26'),(110,'sefsefsfe',21,10,'2016-09-06 07:08:27','2016-09-06 07:08:27'),(111,'fesfesf',21,10,'2016-09-06 07:08:29','2016-09-06 07:08:29'),(112,'fse',21,10,'2016-09-06 07:08:29','2016-09-06 07:08:29'),(113,'f',21,10,'2016-09-06 07:08:29','2016-09-06 07:08:29'),(114,'esf',21,10,'2016-09-06 07:08:29','2016-09-06 07:08:29'),(115,'se',21,10,'2016-09-06 07:08:30','2016-09-06 07:08:30'),(116,'fes',21,10,'2016-09-06 07:08:30','2016-09-06 07:08:30'),(117,'f',21,10,'2016-09-06 07:08:30','2016-09-06 07:08:30'),(118,'esf',21,10,'2016-09-06 07:08:30','2016-09-06 07:08:30'),(119,'sef',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(120,'es',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(121,'f',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(122,'se',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(123,'f',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(124,'e',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31');
/*!40000 ALTER TABLE `sous_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spec_material_materials`
--

DROP TABLE IF EXISTS `spec_material_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spec_material_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_material_id` int(11) DEFAULT NULL,
  `material_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spec_material_materials`
--

LOCK TABLES `spec_material_materials` WRITE;
/*!40000 ALTER TABLE `spec_material_materials` DISABLE KEYS */;
INSERT INTO `spec_material_materials` VALUES (32,14,99),(33,15,99),(34,14,100),(35,15,100),(36,14,101),(37,15,101);
/*!40000 ALTER TABLE `spec_material_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specs_materials`
--

DROP TABLE IF EXISTS `specs_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specs_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_type_material_id` int(11) DEFAULT NULL,
  `spec_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specs_materials`
--

LOCK TABLES `specs_materials` WRITE;
/*!40000 ALTER TABLE `specs_materials` DISABLE KEYS */;
INSERT INTO `specs_materials` VALUES (14,1,'0151016046041'),(15,8,'Canon'),(16,1,'02625954526'),(17,3,'4Go');
/*!40000 ALTER TABLE `specs_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specs_types_materials`
--

DROP TABLE IF EXISTS `specs_types_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specs_types_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specs_types_materials`
--

LOCK TABLES `specs_types_materials` WRITE;
/*!40000 ALTER TABLE `specs_types_materials` DISABLE KEYS */;
INSERT INTO `specs_types_materials` VALUES (1,'Numéro de série'),(2,'Processeur'),(3,'Mémoire vive'),(4,'Mémoire de stockage'),(5,'Interface réseau'),(6,'Carte mère'),(7,'Carte graphique'),(8,'Marque'),(9,'Modèle'),(10,'Format');
/*!40000 ALTER TABLE `specs_types_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_materials`
--

DROP TABLE IF EXISTS `type_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_materials`
--

LOCK TABLES `type_materials` WRITE;
/*!40000 ALTER TABLE `type_materials` DISABLE KEYS */;
INSERT INTO `type_materials` VALUES (1,'Téléphone Mobile'),(2,'Téléphone fixe'),(3,'Ordinateur Fixe'),(4,'Ordinateur Portable'),(5,'Imprimantes'),(6,'Imprimantess'),(7,'Scanner'),(8,'');
/*!40000 ALTER TABLE `type_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_materials_specs_types_materials`
--

DROP TABLE IF EXISTS `type_materials_specs_types_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_materials_specs_types_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_material_id` int(11) DEFAULT NULL,
  `spec_type_material_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_materials_specs_types_materials`
--

LOCK TABLES `type_materials_specs_types_materials` WRITE;
/*!40000 ALTER TABLE `type_materials_specs_types_materials` DISABLE KEYS */;
INSERT INTO `type_materials_specs_types_materials` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,7),(6,2,3),(7,6,1),(8,6,2),(9,6,3),(10,6,4),(12,6,5),(13,6,6),(14,6,8),(15,6,7),(16,7,1),(17,7,8),(18,7,10),(19,7,9),(20,1,8);
/*!40000 ALTER TABLE `type_materials_specs_types_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_user_rights`
--

DROP TABLE IF EXISTS `type_user_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_user_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `right_id` int(11) DEFAULT NULL,
  `type_user_id` int(11) DEFAULT NULL,
  `value` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4459 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_user_rights`
--

LOCK TABLES `type_user_rights` WRITE;
/*!40000 ALTER TABLE `type_user_rights` DISABLE KEYS */;
INSERT INTO `type_user_rights` VALUES (2274,1,1,1),(2275,1,2,1),(2276,1,3,1),(2277,1,4,1),(2278,1,5,1),(2279,1,6,1),(2280,1,7,1),(2281,1,8,1),(2282,1,9,1),(2283,1,10,1),(2284,1,11,1),(2285,1,12,1),(2286,1,13,1),(2287,1,14,1),(2288,1,15,1),(2289,1,16,1),(2290,1,17,1),(2291,1,18,1),(2292,1,19,1),(2293,1,20,1),(2294,1,21,1),(2295,1,22,1),(2296,1,23,1),(2297,2,1,1),(2298,2,2,1),(2299,2,3,1),(2300,2,4,1),(2301,2,5,1),(2302,2,6,1),(2303,2,7,1),(2304,2,8,1),(2305,2,9,1),(2306,2,10,1),(2307,2,11,1),(2308,2,12,1),(2309,2,13,1),(2310,2,14,1),(2311,2,15,1),(2312,2,16,1),(2313,2,17,1),(2314,2,18,1),(2315,2,19,1),(2316,2,20,1),(2317,2,21,1),(2318,2,22,1),(2319,2,23,0),(2320,3,1,1),(2321,3,2,1),(2322,3,3,1),(2323,3,4,1),(2324,3,5,1),(2325,3,6,1),(2326,3,7,1),(2327,3,8,1),(2328,3,9,1),(2329,3,10,1),(2330,3,11,1),(2331,3,12,1),(2332,3,13,1),(2333,3,14,1),(2334,3,15,1),(2335,3,16,1),(2336,3,17,1),(2337,3,18,1),(2338,3,19,1),(2339,3,20,1),(2340,3,21,1),(2341,3,22,1),(2342,3,23,0),(2343,4,1,1),(2344,4,2,1),(2345,4,3,1),(2346,4,4,1),(2347,4,5,1),(2348,4,6,1),(2349,4,7,1),(2350,4,8,1),(2351,4,9,1),(2352,4,10,1),(2353,4,11,1),(2354,4,12,1),(2355,4,13,1),(2356,4,14,1),(2357,4,15,1),(2358,4,16,1),(2359,4,17,1),(2360,4,18,1),(2361,4,19,1),(2362,4,20,1),(2363,4,21,1),(2364,4,22,1),(2365,4,23,0),(2366,5,1,1),(2367,5,2,1),(2368,5,3,1),(2369,5,4,1),(2370,5,5,1),(2371,5,6,1),(2372,5,7,1),(2373,5,8,1),(2374,5,9,1),(2375,5,10,1),(2376,5,11,1),(2377,5,12,1),(2378,5,13,1),(2379,5,14,1),(2380,5,15,1),(2381,5,16,1),(2382,5,17,1),(2383,5,18,1),(2384,5,19,1),(2385,5,20,1),(2386,5,21,1),(2387,5,22,1),(2388,5,23,0),(2389,6,1,1),(2390,6,2,1),(2391,6,3,1),(2392,6,4,1),(2393,6,5,1),(2394,6,6,1),(2395,6,7,1),(2396,6,8,1),(2397,6,9,1),(2398,6,10,1),(2399,6,11,1),(2400,6,12,1),(2401,6,13,1),(2402,6,14,1),(2403,6,15,1),(2404,6,16,1),(2405,6,17,1),(2406,6,18,1),(2407,6,19,1),(2408,6,20,1),(2409,6,21,1),(2410,6,22,1),(2411,6,23,1),(2412,7,1,1),(2413,7,2,1),(2414,7,3,1),(2415,7,4,1),(2416,7,5,1),(2417,7,6,1),(2418,7,7,1),(2419,7,8,1),(2420,7,9,1),(2421,7,10,1),(2422,7,11,1),(2423,7,12,1),(2424,7,13,1),(2425,7,14,1),(2426,7,15,1),(2427,7,16,1),(2428,7,17,1),(2429,7,18,1),(2430,7,19,1),(2431,7,20,1),(2432,7,21,1),(2433,7,22,1),(2434,7,23,0),(2435,8,1,1),(2436,8,2,1),(2437,8,3,1),(2438,8,4,1),(2439,8,5,1),(2440,8,6,1),(2441,8,7,1),(2442,8,8,1),(2443,8,9,1),(2444,8,10,1),(2445,8,11,1),(2446,8,12,1),(2447,8,13,1),(2448,8,14,1),(2449,8,15,1),(2450,8,16,1),(2451,8,17,1),(2452,8,18,1),(2453,8,19,1),(2454,8,20,1),(2455,8,21,1),(2456,8,22,1),(2457,8,23,0),(2458,9,1,1),(2459,9,2,1),(2460,9,3,1),(2461,9,4,1),(2462,9,5,1),(2463,9,6,1),(2464,9,7,1),(2465,9,8,1),(2466,9,9,1),(2467,9,10,1),(2468,9,11,1),(2469,9,12,1),(2470,9,13,1),(2471,9,14,1),(2472,9,15,1),(2473,9,16,1),(2474,9,17,1),(2475,9,18,1),(2476,9,19,1),(2477,9,20,1),(2478,9,21,1),(2479,9,22,1),(2480,9,23,1),(2481,10,1,1),(2482,10,2,1),(2483,10,3,1),(2484,10,4,1),(2485,10,5,1),(2486,10,6,1),(2487,10,7,1),(2488,10,8,1),(2489,10,9,1),(2490,10,10,1),(2491,10,11,1),(2492,10,12,1),(2493,10,13,1),(2494,10,14,1),(2495,10,15,1),(2496,10,16,1),(2497,10,17,1),(2498,10,18,1),(2499,10,19,1),(2500,10,20,1),(2501,10,21,1),(2502,10,22,1),(2503,10,23,1),(2504,11,1,1),(2505,11,2,1),(2506,11,3,1),(2507,11,4,1),(2508,11,5,1),(2509,11,6,1),(2510,11,7,1),(2511,11,8,1),(2512,11,9,1),(2513,11,10,1),(2514,11,11,1),(2515,11,12,1),(2516,11,13,1),(2517,11,14,1),(2518,11,15,1),(2519,11,16,1),(2520,11,17,1),(2521,11,18,1),(2522,11,19,1),(2523,11,20,1),(2524,11,21,1),(2525,11,22,1),(2526,11,23,1),(2527,12,1,1),(2528,12,2,1),(2529,12,3,1),(2530,12,4,1),(2531,12,5,1),(2532,12,6,1),(2533,12,7,1),(2534,12,8,1),(2535,12,9,1),(2536,12,10,1),(2537,12,11,1),(2538,12,12,1),(2539,12,13,1),(2540,12,14,1),(2541,12,15,1),(2542,12,16,1),(2543,12,17,1),(2544,12,18,1),(2545,12,19,1),(2546,12,20,1),(2547,12,21,1),(2548,12,22,1),(2549,12,23,1),(2550,13,1,1),(2551,13,2,1),(2552,13,3,1),(2553,13,4,1),(2554,13,5,1),(2555,13,6,1),(2556,13,7,1),(2557,13,8,1),(2558,13,9,1),(2559,13,10,1),(2560,13,11,1),(2561,13,12,1),(2562,13,13,1),(2563,13,14,1),(2564,13,15,1),(2565,13,16,1),(2566,13,17,1),(2567,13,18,1),(2568,13,19,1),(2569,13,20,1),(2570,13,21,1),(2571,13,22,1),(2572,13,23,1),(2573,14,1,1),(2574,14,2,1),(2575,14,3,1),(2576,14,4,1),(2577,14,5,1),(2578,14,6,1),(2579,14,7,1),(2580,14,8,1),(2581,14,9,1),(2582,14,10,1),(2583,14,11,1),(2584,14,12,1),(2585,14,13,1),(2586,14,14,1),(2587,14,15,1),(2588,14,16,1),(2589,14,17,1),(2590,14,18,1),(2591,14,19,1),(2592,14,20,1),(2593,14,21,1),(2594,14,22,1),(2595,14,23,1),(2596,15,1,1),(2597,15,2,1),(2598,15,3,1),(2599,15,4,1),(2600,15,5,1),(2601,15,6,1),(2602,15,7,1),(2603,15,8,1),(2604,15,9,1),(2605,15,10,1),(2606,15,11,1),(2607,15,12,1),(2608,15,13,1),(2609,15,14,1),(2610,15,15,1),(2611,15,16,1),(2612,15,17,1),(2613,15,18,1),(2614,15,19,1),(2615,15,20,1),(2616,15,21,1),(2617,15,22,1),(2618,15,23,1),(2619,16,1,1),(2620,16,2,1),(2621,16,3,1),(2622,16,4,1),(2623,16,5,1),(2624,16,6,1),(2625,16,7,1),(2626,16,8,1),(2627,16,9,1),(2628,16,10,1),(2629,16,11,1),(2630,16,12,1),(2631,16,13,1),(2632,16,14,1),(2633,16,15,1),(2634,16,16,1),(2635,16,17,1),(2636,16,18,1),(2637,16,19,1),(2638,16,20,1),(2639,16,21,1),(2640,16,22,1),(2641,16,23,1),(2642,17,1,1),(2643,17,2,1),(2644,17,3,1),(2645,17,4,1),(2646,17,5,1),(2647,17,6,1),(2648,17,7,1),(2649,17,8,1),(2650,17,9,1),(2651,17,10,1),(2652,17,11,1),(2653,17,12,1),(2654,17,13,1),(2655,17,14,1),(2656,17,15,1),(2657,17,16,1),(2658,17,17,1),(2659,17,18,1),(2660,17,19,1),(2661,17,20,1),(2662,17,21,1),(2663,17,22,1),(2664,17,23,1),(2665,18,1,1),(2666,18,2,1),(2667,18,3,1),(2668,18,4,1),(2669,18,5,1),(2670,18,6,1),(2671,18,7,1),(2672,18,8,1),(2673,18,9,1),(2674,18,10,1),(2675,18,11,1),(2676,18,12,1),(2677,18,13,1),(2678,18,14,1),(2679,18,15,1),(2680,18,16,1),(2681,18,17,1),(2682,18,18,1),(2683,18,19,1),(2684,18,20,1),(2685,18,21,1),(2686,18,22,1),(2687,18,23,1),(2688,19,1,1),(2689,19,2,1),(2690,19,3,1),(2691,19,4,1),(2692,19,5,1),(2693,19,6,1),(2694,19,7,1),(2695,19,8,1),(2696,19,9,1),(2697,19,10,1),(2698,19,11,1),(2699,19,12,1),(2700,19,13,1),(2701,19,14,1),(2702,19,15,1),(2703,19,16,1),(2704,19,17,1),(2705,19,18,1),(2706,19,19,1),(2707,19,20,1),(2708,19,21,1),(2709,19,22,1),(2710,19,23,1),(2711,20,1,1),(2712,20,2,1),(2713,20,3,1),(2714,20,4,1),(2715,20,5,1),(2716,20,6,1),(2717,20,7,1),(2718,20,8,1),(2719,20,9,1),(2720,20,10,1),(2721,20,11,1),(2722,20,12,1),(2723,20,13,1),(2724,20,14,1),(2725,20,15,1),(2726,20,16,1),(2727,20,17,1),(2728,20,18,1),(2729,20,19,1),(2730,20,20,1),(2731,20,21,1),(2732,20,22,1),(2733,20,23,1),(2734,21,1,1),(2735,21,2,1),(2736,21,3,1),(2737,21,4,1),(2738,21,5,1),(2739,21,6,1),(2740,21,7,1),(2741,21,8,1),(2742,21,9,1),(2743,21,10,1),(2744,21,11,1),(2745,21,12,1),(2746,21,13,1),(2747,21,14,1),(2748,21,15,1),(2749,21,16,1),(2750,21,17,1),(2751,21,18,1),(2752,21,19,1),(2753,21,20,1),(2754,21,21,1),(2755,21,22,1),(2756,21,23,1),(2757,22,1,1),(2758,22,2,1),(2759,22,3,1),(2760,22,4,1),(2761,22,5,1),(2762,22,6,1),(2763,22,7,1),(2764,22,8,1),(2765,22,9,1),(2766,22,10,1),(2767,22,11,1),(2768,22,12,1),(2769,22,13,1),(2770,22,14,1),(2771,22,15,1),(2772,22,16,1),(2773,22,17,1),(2774,22,18,1),(2775,22,19,1),(2776,22,20,1),(2777,22,21,1),(2778,22,22,1),(2779,22,23,1),(2780,23,1,1),(2781,23,2,1),(2782,23,3,1),(2783,23,4,1),(2784,23,5,1),(2785,23,6,1),(2786,23,7,1),(2787,23,8,1),(2788,23,9,1),(2789,23,10,1),(2790,23,11,1),(2791,23,12,1),(2792,23,13,1),(2793,23,14,1),(2794,23,15,1),(2795,23,16,1),(2796,23,17,1),(2797,23,18,1),(2798,23,19,1),(2799,23,20,1),(2800,23,21,1),(2801,23,22,1),(2802,23,23,0),(2803,24,1,1),(2804,24,2,1),(2805,24,3,1),(2806,24,4,1),(2807,24,5,1),(2808,24,6,1),(2809,24,7,1),(2810,24,8,1),(2811,24,9,1),(2812,24,10,1),(2813,24,11,1),(2814,24,12,1),(2815,24,13,1),(2816,24,14,1),(2817,24,15,1),(2818,24,16,1),(2819,24,17,1),(2820,24,18,1),(2821,24,19,1),(2822,24,20,1),(2823,24,21,1),(2824,24,22,1),(2825,24,23,0),(2826,25,1,1),(2827,25,2,1),(2828,25,3,1),(2829,25,4,1),(2830,25,5,1),(2831,25,6,1),(2832,25,7,1),(2833,25,8,1),(2834,25,9,1),(2835,25,10,1),(2836,25,11,1),(2837,25,12,1),(2838,25,13,1),(2839,25,14,1),(2840,25,15,1),(2841,25,16,1),(2842,25,17,1),(2843,25,18,1),(2844,25,19,1),(2845,25,20,1),(2846,25,21,1),(2847,25,22,1),(2848,25,23,1),(2849,26,1,1),(2850,26,2,1),(2851,26,3,1),(2852,26,4,1),(2853,26,5,1),(2854,26,6,1),(2855,26,7,1),(2856,26,8,1),(2857,26,9,1),(2858,26,10,1),(2859,26,11,1),(2860,26,12,1),(2861,26,13,1),(2862,26,14,1),(2863,26,15,1),(2864,26,16,1),(2865,26,17,1),(2866,26,18,1),(2867,26,19,1),(2868,26,20,1),(2869,26,21,1),(2870,26,22,1),(2871,26,23,1),(2872,27,1,1),(2873,27,2,1),(2874,27,3,1),(2875,27,4,1),(2876,27,5,1),(2877,27,6,1),(2878,27,7,1),(2879,27,8,1),(2880,27,9,1),(2881,27,10,1),(2882,27,11,1),(2883,27,12,1),(2884,27,13,1),(2885,27,14,1),(2886,27,15,1),(2887,27,16,1),(2888,27,17,1),(2889,27,18,1),(2890,27,19,1),(2891,27,20,1),(2892,27,21,1),(2893,27,22,1),(2894,27,23,1),(2895,28,1,1),(2896,28,2,1),(2897,28,3,1),(2898,28,4,1),(2899,28,5,1),(2900,28,6,1),(2901,28,7,1),(2902,28,8,1),(2903,28,9,1),(2904,28,10,1),(2905,28,11,1),(2906,28,12,1),(2907,28,13,1),(2908,28,14,1),(2909,28,15,1),(2910,28,16,1),(2911,28,17,1),(2912,28,18,1),(2913,28,19,1),(2914,28,20,1),(2915,28,21,1),(2916,28,22,1),(2917,28,23,1),(2918,29,1,1),(2919,29,2,1),(2920,29,3,1),(2921,29,4,1),(2922,29,5,1),(2923,29,6,1),(2924,29,7,1),(2925,29,8,1),(2926,29,9,1),(2927,29,10,1),(2928,29,11,1),(2929,29,12,1),(2930,29,13,1),(2931,29,14,1),(2932,29,15,1),(2933,29,16,1),(2934,29,17,1),(2935,29,18,1),(2936,29,19,1),(2937,29,20,1),(2938,29,21,1),(2939,29,22,1),(2940,29,23,1),(2941,30,1,1),(2942,30,2,1),(2943,30,3,1),(2944,30,4,1),(2945,30,5,1),(2946,30,6,1),(2947,30,7,1),(2948,30,8,1),(2949,30,9,1),(2950,30,10,1),(2951,30,11,1),(2952,30,12,1),(2953,30,13,1),(2954,30,14,1),(2955,30,15,1),(2956,30,16,1),(2957,30,17,1),(2958,30,18,1),(2959,30,19,1),(2960,30,20,1),(2961,30,21,1),(2962,30,22,1),(2963,30,23,0),(2964,31,1,1),(2965,31,2,1),(2966,31,3,1),(2967,31,4,1),(2968,31,5,1),(2969,31,6,1),(2970,31,7,1),(2971,31,8,1),(2972,31,9,1),(2973,31,10,1),(2974,31,11,1),(2975,31,12,1),(2976,31,13,1),(2977,31,14,1),(2978,31,15,1),(2979,31,16,1),(2980,31,17,1),(2981,31,18,1),(2982,31,19,1),(2983,31,20,1),(2984,31,21,1),(2985,31,22,1),(2986,31,23,1),(2987,32,1,1),(2988,32,2,1),(2989,32,3,1),(2990,32,4,1),(2991,32,5,1),(2992,32,6,1),(2993,32,7,1),(2994,32,8,1),(2995,32,9,1),(2996,32,10,1),(2997,32,11,1),(2998,32,12,1),(2999,32,13,1),(3000,32,14,1),(3001,32,15,1),(3002,32,16,1),(3003,32,17,1),(3004,32,18,1),(3005,32,19,1),(3006,32,20,1),(3007,32,21,1),(3008,32,22,1),(3009,32,23,1),(3010,33,1,1),(3011,33,2,1),(3012,33,3,1),(3013,33,4,1),(3014,33,5,1),(3015,33,6,1),(3016,33,7,1),(3017,33,8,1),(3018,33,9,1),(3019,33,10,1),(3020,33,11,1),(3021,33,12,1),(3022,33,13,1),(3023,33,14,1),(3024,33,15,1),(3025,33,16,1),(3026,33,17,1),(3027,33,18,1),(3028,33,19,1),(3029,33,20,1),(3030,33,21,1),(3031,33,22,1),(3032,33,23,0),(3033,34,1,1),(3034,34,2,1),(3035,34,3,1),(3036,34,4,1),(3037,34,5,1),(3038,34,6,1),(3039,34,7,1),(3040,34,8,1),(3041,34,9,1),(3042,34,10,1),(3043,34,11,1),(3044,34,12,1),(3045,34,13,1),(3046,34,14,1),(3047,34,15,1),(3048,34,16,1),(3049,34,17,1),(3050,34,18,1),(3051,34,19,1),(3052,34,20,1),(3053,34,21,1),(3054,34,22,1),(3055,34,23,0),(3056,35,1,1),(3057,35,2,1),(3058,35,3,1),(3059,35,4,1),(3060,35,5,1),(3061,35,6,1),(3062,35,7,1),(3063,35,8,1),(3064,35,9,1),(3065,35,10,1),(3066,35,11,1),(3067,35,12,1),(3068,35,13,1),(3069,35,14,1),(3070,35,15,1),(3071,35,16,1),(3072,35,17,1),(3073,35,18,1),(3074,35,19,1),(3075,35,20,1),(3076,35,21,1),(3077,35,22,1),(3078,35,23,1),(3079,36,1,1),(3080,36,2,1),(3081,36,3,1),(3082,36,4,1),(3083,36,5,1),(3084,36,6,1),(3085,36,7,1),(3086,36,8,1),(3087,36,9,1),(3088,36,10,1),(3089,36,11,1),(3090,36,12,1),(3091,36,13,1),(3092,36,14,1),(3093,36,15,1),(3094,36,16,1),(3095,36,17,1),(3096,36,18,1),(3097,36,19,1),(3098,36,20,1),(3099,36,21,1),(3100,36,22,1),(3101,36,23,0),(3102,37,1,1),(3103,37,2,1),(3104,37,3,1),(3105,37,4,1),(3106,37,5,1),(3107,37,6,1),(3108,37,7,1),(3109,37,8,1),(3110,37,9,1),(3111,37,10,1),(3112,37,11,1),(3113,37,12,1),(3114,37,13,1),(3115,37,14,1),(3116,37,15,1),(3117,37,16,1),(3118,37,17,1),(3119,37,18,1),(3120,37,19,1),(3121,37,20,1),(3122,37,21,1),(3123,37,22,1),(3124,37,23,0),(3125,38,1,1),(3126,38,2,1),(3127,38,3,1),(3128,38,4,1),(3129,38,5,1),(3130,38,6,1),(3131,38,7,1),(3132,38,8,1),(3133,38,9,1),(3134,38,10,1),(3135,38,11,1),(3136,38,12,1),(3137,38,13,1),(3138,38,14,1),(3139,38,15,1),(3140,38,16,1),(3141,38,17,1),(3142,38,18,1),(3143,38,19,1),(3144,38,20,1),(3145,38,21,1),(3146,38,22,1),(3147,38,23,0),(3148,39,1,1),(3149,39,2,1),(3150,39,3,1),(3151,39,4,1),(3152,39,5,1),(3153,39,6,1),(3154,39,7,1),(3155,39,8,1),(3156,39,9,1),(3157,39,10,1),(3158,39,11,1),(3159,39,12,1),(3160,39,13,1),(3161,39,14,1),(3162,39,15,1),(3163,39,16,1),(3164,39,17,1),(3165,39,18,1),(3166,39,19,1),(3167,39,20,1),(3168,39,21,1),(3169,39,22,1),(3170,39,23,1),(3171,40,1,1),(3172,40,2,1),(3173,40,3,1),(3174,40,4,1),(3175,40,5,1),(3176,40,6,1),(3177,40,7,1),(3178,40,8,1),(3179,40,9,1),(3180,40,10,1),(3181,40,11,1),(3182,40,12,1),(3183,40,13,1),(3184,40,14,1),(3185,40,15,1),(3186,40,16,1),(3187,40,17,1),(3188,40,18,1),(3189,40,19,1),(3190,40,20,1),(3191,40,21,1),(3192,40,22,1),(3193,40,23,0),(3194,41,1,1),(3195,41,2,1),(3196,41,3,1),(3197,41,4,1),(3198,41,5,1),(3199,41,6,1),(3200,41,7,1),(3201,41,8,1),(3202,41,9,1),(3203,41,10,1),(3204,41,11,1),(3205,41,12,1),(3206,41,13,1),(3207,41,14,1),(3208,41,15,1),(3209,41,16,1),(3210,41,17,1),(3211,41,18,1),(3212,41,19,1),(3213,41,20,1),(3214,41,21,1),(3215,41,22,1),(3216,41,23,0),(3217,42,1,1),(3218,42,2,1),(3219,42,3,1),(3220,42,4,1),(3221,42,5,1),(3222,42,6,1),(3223,42,7,1),(3224,42,8,1),(3225,42,9,1),(3226,42,10,1),(3227,42,11,1),(3228,42,12,1),(3229,42,13,1),(3230,42,14,1),(3231,42,15,1),(3232,42,16,1),(3233,42,17,1),(3234,42,18,1),(3235,42,19,1),(3236,42,20,1),(3237,42,21,1),(3238,42,22,1),(3239,42,23,0),(3240,43,1,1),(3241,43,2,1),(3242,43,3,1),(3243,43,4,1),(3244,43,5,1),(3245,43,6,1),(3246,43,7,1),(3247,43,8,1),(3248,43,9,1),(3249,43,10,1),(3250,43,11,1),(3251,43,12,1),(3252,43,13,1),(3253,43,14,1),(3254,43,15,1),(3255,43,16,1),(3256,43,17,1),(3257,43,18,1),(3258,43,19,1),(3259,43,20,1),(3260,43,21,1),(3261,43,22,1),(3262,43,23,0),(3263,44,1,1),(3264,44,2,1),(3265,44,3,1),(3266,44,4,1),(3267,44,5,1),(3268,44,6,1),(3269,44,7,1),(3270,44,8,1),(3271,44,9,1),(3272,44,10,1),(3273,44,11,1),(3274,44,12,1),(3275,44,13,1),(3276,44,14,1),(3277,44,15,1),(3278,44,16,1),(3279,44,17,1),(3280,44,18,1),(3281,44,19,1),(3282,44,20,1),(3283,44,21,1),(3284,44,22,1),(3285,44,23,0),(3286,45,1,1),(3287,45,2,1),(3288,45,3,1),(3289,45,4,1),(3290,45,5,1),(3291,45,6,1),(3292,45,7,1),(3293,45,8,1),(3294,45,9,1),(3295,45,10,1),(3296,45,11,1),(3297,45,12,1),(3298,45,13,1),(3299,45,14,1),(3300,45,15,1),(3301,45,16,1),(3302,45,17,1),(3303,45,18,1),(3304,45,19,1),(3305,45,20,1),(3306,45,21,1),(3307,45,22,1),(3308,45,23,0),(3309,46,1,1),(3310,46,2,1),(3311,46,3,1),(3312,46,4,1),(3313,46,5,1),(3314,46,6,1),(3315,46,7,1),(3316,46,8,1),(3317,46,9,1),(3318,46,10,1),(3319,46,11,1),(3320,46,12,1),(3321,46,13,1),(3322,46,14,1),(3323,46,15,1),(3324,46,16,1),(3325,46,17,1),(3326,46,18,1),(3327,46,19,1),(3328,46,20,1),(3329,46,21,1),(3330,46,22,1),(3331,46,23,1),(3332,47,1,1),(3333,47,2,1),(3334,47,3,1),(3335,47,4,1),(3336,47,5,1),(3337,47,6,1),(3338,47,7,1),(3339,47,8,1),(3340,47,9,1),(3341,47,10,1),(3342,47,11,1),(3343,47,12,1),(3344,47,13,1),(3345,47,14,1),(3346,47,15,1),(3347,47,16,1),(3348,47,17,1),(3349,47,18,1),(3350,47,19,1),(3351,47,20,1),(3352,47,21,1),(3353,47,22,1),(3354,47,23,0),(3355,48,1,1),(3356,48,2,1),(3357,48,3,1),(3358,48,4,1),(3359,48,5,1),(3360,48,6,1),(3361,48,7,1),(3362,48,8,1),(3363,48,9,1),(3364,48,10,1),(3365,48,11,1),(3366,48,12,1),(3367,48,13,1),(3368,48,14,1),(3369,48,15,1),(3370,48,16,1),(3371,48,17,1),(3372,48,18,1),(3373,48,19,1),(3374,48,20,1),(3375,48,21,1),(3376,48,22,1),(3377,48,23,0),(3378,49,1,1),(3379,49,2,1),(3380,49,3,1),(3381,49,4,1),(3382,49,5,1),(3383,49,6,1),(3384,49,7,1),(3385,49,8,1),(3386,49,9,1),(3387,49,10,1),(3388,49,11,1),(3389,49,12,1),(3390,49,13,1),(3391,49,14,1),(3392,49,15,1),(3393,49,16,1),(3394,49,17,1),(3395,49,18,1),(3396,49,19,1),(3397,49,20,1),(3398,49,21,1),(3399,49,22,1),(3400,49,23,0),(3401,50,1,1),(3402,50,2,1),(3403,50,3,1),(3404,50,4,1),(3405,50,5,1),(3406,50,6,1),(3407,50,7,1),(3408,50,8,1),(3409,50,9,1),(3410,50,10,1),(3411,50,11,1),(3412,50,12,1),(3413,50,13,1),(3414,50,14,1),(3415,50,15,1),(3416,50,16,1),(3417,50,17,1),(3418,50,18,1),(3419,50,19,1),(3420,50,20,1),(3421,50,21,1),(3422,50,22,1),(3423,50,23,0),(3424,51,1,1),(3425,51,2,1),(3426,51,3,1),(3427,51,4,1),(3428,51,5,1),(3429,51,6,1),(3430,51,7,1),(3431,51,8,1),(3432,51,9,1),(3433,51,10,1),(3434,51,11,1),(3435,51,12,1),(3436,51,13,1),(3437,51,14,1),(3438,51,15,1),(3439,51,16,1),(3440,51,17,1),(3441,51,18,1),(3442,51,19,1),(3443,51,20,1),(3444,51,21,1),(3445,51,22,1),(3446,51,23,0),(3447,52,1,1),(3448,52,2,1),(3449,52,3,1),(3450,52,4,1),(3451,52,5,1),(3452,52,6,1),(3453,52,7,1),(3454,52,8,1),(3455,52,9,1),(3456,52,10,1),(3457,52,11,1),(3458,52,12,1),(3459,52,13,1),(3460,52,14,1),(3461,52,15,1),(3462,52,16,1),(3463,52,17,1),(3464,52,18,1),(3465,52,19,1),(3466,52,20,1),(3467,52,21,1),(3468,52,22,1),(3469,52,23,0),(3470,53,1,1),(3471,53,2,1),(3472,53,3,1),(3473,53,4,1),(3474,53,5,1),(3475,53,6,1),(3476,53,7,1),(3477,53,8,1),(3478,53,9,1),(3479,53,10,1),(3480,53,11,1),(3481,53,12,1),(3482,53,13,1),(3483,53,14,1),(3484,53,15,1),(3485,53,16,1),(3486,53,17,1),(3487,53,18,1),(3488,53,19,1),(3489,53,20,1),(3490,53,21,1),(3491,53,22,1),(3492,53,23,0),(3493,54,1,1),(3494,54,2,1),(3495,54,3,1),(3496,54,4,1),(3497,54,5,1),(3498,54,6,1),(3499,54,7,1),(3500,54,8,1),(3501,54,9,1),(3502,54,10,1),(3503,54,11,1),(3504,54,12,1),(3505,54,13,1),(3506,54,14,1),(3507,54,15,1),(3508,54,16,1),(3509,54,17,1),(3510,54,18,1),(3511,54,19,1),(3512,54,20,1),(3513,54,21,1),(3514,54,22,1),(3515,54,23,0),(3516,55,1,1),(3517,55,2,1),(3518,55,3,1),(3519,55,4,1),(3520,55,5,1),(3521,55,6,1),(3522,55,7,1),(3523,55,8,1),(3524,55,9,1),(3525,55,10,1),(3526,55,11,1),(3527,55,12,1),(3528,55,13,1),(3529,55,14,1),(3530,55,15,1),(3531,55,16,1),(3532,55,17,1),(3533,55,18,1),(3534,55,19,1),(3535,55,20,1),(3536,55,21,1),(3537,55,22,1),(3538,55,23,0),(3539,56,1,1),(3540,56,2,1),(3541,56,3,1),(3542,56,4,1),(3543,56,5,1),(3544,56,6,1),(3545,56,7,1),(3546,56,8,1),(3547,56,9,1),(3548,56,10,1),(3549,56,11,1),(3550,56,12,1),(3551,56,13,1),(3552,56,14,1),(3553,56,15,1),(3554,56,16,1),(3555,56,17,1),(3556,56,18,1),(3557,56,19,1),(3558,56,20,1),(3559,56,21,1),(3560,56,22,1),(3561,56,23,0),(3562,57,1,1),(3563,57,2,1),(3564,57,3,1),(3565,57,4,1),(3566,57,5,1),(3567,57,6,1),(3568,57,7,1),(3569,57,8,1),(3570,57,9,1),(3571,57,10,1),(3572,57,11,1),(3573,57,12,1),(3574,57,13,1),(3575,57,14,1),(3576,57,15,1),(3577,57,16,1),(3578,57,17,1),(3579,57,18,1),(3580,57,19,1),(3581,57,20,1),(3582,57,21,1),(3583,57,22,1),(3584,57,23,0),(3585,58,1,1),(3586,58,2,1),(3587,58,3,1),(3588,58,4,1),(3589,58,5,1),(3590,58,6,1),(3591,58,7,1),(3592,58,8,1),(3593,58,9,1),(3594,58,10,1),(3595,58,11,1),(3596,58,12,1),(3597,58,13,1),(3598,58,14,1),(3599,58,15,1),(3600,58,16,1),(3601,58,17,1),(3602,58,18,1),(3603,58,19,1),(3604,58,20,1),(3605,58,21,1),(3606,58,22,1),(3607,58,23,0),(3608,59,1,1),(3609,59,2,1),(3610,59,3,1),(3611,59,4,1),(3612,59,5,1),(3613,59,6,1),(3614,59,7,1),(3615,59,8,1),(3616,59,9,1),(3617,59,10,1),(3618,59,11,1),(3619,59,12,1),(3620,59,13,1),(3621,59,14,1),(3622,59,15,1),(3623,59,16,1),(3624,59,17,1),(3625,59,18,1),(3626,59,19,1),(3627,59,20,1),(3628,59,21,1),(3629,59,22,1),(3630,59,23,0),(3631,60,1,1),(3632,60,2,1),(3633,60,3,1),(3634,60,4,1),(3635,60,5,1),(3636,60,6,1),(3637,60,7,1),(3638,60,8,1),(3639,60,9,1),(3640,60,10,1),(3641,60,11,1),(3642,60,12,1),(3643,60,13,1),(3644,60,14,1),(3645,60,15,1),(3646,60,16,1),(3647,60,17,1),(3648,60,18,1),(3649,60,19,1),(3650,60,20,1),(3651,60,21,1),(3652,60,22,1),(3653,60,23,0),(3654,61,1,1),(3655,61,2,1),(3656,61,3,1),(3657,61,4,1),(3658,61,5,1),(3659,61,6,1),(3660,61,7,1),(3661,61,8,1),(3662,61,9,1),(3663,61,10,1),(3664,61,11,1),(3665,61,12,1),(3666,61,13,1),(3667,61,14,1),(3668,61,15,1),(3669,61,16,1),(3670,61,17,1),(3671,61,18,1),(3672,61,19,1),(3673,61,20,1),(3674,61,21,1),(3675,61,22,1),(3676,61,23,0),(3677,62,1,1),(3678,62,2,1),(3679,62,3,1),(3680,62,4,1),(3681,62,5,1),(3682,62,6,1),(3683,62,7,1),(3684,62,8,1),(3685,62,9,1),(3686,62,10,1),(3687,62,11,1),(3688,62,12,1),(3689,62,13,1),(3690,62,14,1),(3691,62,15,1),(3692,62,16,1),(3693,62,17,1),(3694,62,18,1),(3695,62,19,1),(3696,62,20,1),(3697,62,21,1),(3698,62,22,1),(3699,62,23,0),(3700,63,1,1),(3701,63,2,1),(3702,63,3,1),(3703,63,4,1),(3704,63,5,1),(3705,63,6,1),(3706,63,7,1),(3707,63,8,1),(3708,63,9,1),(3709,63,10,1),(3710,63,11,1),(3711,63,12,1),(3712,63,13,1),(3713,63,14,1),(3714,63,15,1),(3715,63,16,1),(3716,63,17,1),(3717,63,18,1),(3718,63,19,1),(3719,63,20,1),(3720,63,21,1),(3721,63,22,1),(3722,63,23,0),(3723,64,1,1),(3724,64,2,1),(3725,64,3,1),(3726,64,4,1),(3727,64,5,1),(3728,64,6,1),(3729,64,7,1),(3730,64,8,1),(3731,64,9,1),(3732,64,10,1),(3733,64,11,1),(3734,64,12,1),(3735,64,13,1),(3736,64,14,1),(3737,64,15,1),(3738,64,16,1),(3739,64,17,1),(3740,64,18,1),(3741,64,19,1),(3742,64,20,1),(3743,64,21,1),(3744,64,22,1),(3745,64,23,0),(3746,65,1,1),(3747,65,2,1),(3748,65,3,1),(3749,65,4,1),(3750,65,5,1),(3751,65,6,1),(3752,65,7,1),(3753,65,8,1),(3754,65,9,1),(3755,65,10,1),(3756,65,11,1),(3757,65,12,1),(3758,65,13,1),(3759,65,14,1),(3760,65,15,1),(3761,65,16,1),(3762,65,17,1),(3763,65,18,1),(3764,65,19,1),(3765,65,20,1),(3766,65,21,1),(3767,65,22,1),(3768,65,23,0),(3769,66,1,1),(3770,66,2,1),(3771,66,3,1),(3772,66,4,1),(3773,66,5,1),(3774,66,6,1),(3775,66,7,1),(3776,66,8,1),(3777,66,9,1),(3778,66,10,1),(3779,66,11,1),(3780,66,12,1),(3781,66,13,1),(3782,66,14,1),(3783,66,15,1),(3784,66,16,1),(3785,66,17,1),(3786,66,18,1),(3787,66,19,1),(3788,66,20,1),(3789,66,21,1),(3790,66,22,1),(3791,66,23,0),(3792,67,1,1),(3793,67,2,1),(3794,67,3,1),(3795,67,4,1),(3796,67,5,1),(3797,67,6,1),(3798,67,7,1),(3799,67,8,1),(3800,67,9,1),(3801,67,10,1),(3802,67,11,1),(3803,67,12,1),(3804,67,13,1),(3805,67,14,1),(3806,67,15,1),(3807,67,16,1),(3808,67,17,1),(3809,67,18,1),(3810,67,19,1),(3811,67,20,1),(3812,67,21,1),(3813,67,22,1),(3814,67,23,0),(3815,68,1,1),(3816,68,2,1),(3817,68,3,1),(3818,68,4,1),(3819,68,5,1),(3820,68,6,1),(3821,68,7,1),(3822,68,8,1),(3823,68,9,1),(3824,68,10,1),(3825,68,11,1),(3826,68,12,1),(3827,68,13,1),(3828,68,14,1),(3829,68,15,1),(3830,68,16,1),(3831,68,17,1),(3832,68,18,1),(3833,68,19,1),(3834,68,20,1),(3835,68,21,1),(3836,68,22,1),(3837,68,23,0),(3838,69,1,1),(3839,69,2,1),(3840,69,3,1),(3841,69,4,1),(3842,69,5,1),(3843,69,6,1),(3844,69,7,1),(3845,69,8,1),(3846,69,9,1),(3847,69,10,1),(3848,69,11,1),(3849,69,12,1),(3850,69,13,1),(3851,69,14,1),(3852,69,15,1),(3853,69,16,1),(3854,69,17,1),(3855,69,18,1),(3856,69,19,1),(3857,69,20,1),(3858,69,21,1),(3859,69,22,1),(3860,69,23,0),(3861,70,1,1),(3862,70,2,1),(3863,70,3,1),(3864,70,4,1),(3865,70,5,1),(3866,70,6,1),(3867,70,7,1),(3868,70,8,1),(3869,70,9,1),(3870,70,10,1),(3871,70,11,1),(3872,70,12,1),(3873,70,13,1),(3874,70,14,1),(3875,70,15,1),(3876,70,16,1),(3877,70,17,1),(3878,70,18,1),(3879,70,19,1),(3880,70,20,1),(3881,70,21,1),(3882,70,22,1),(3883,70,23,0),(3884,71,1,1),(3885,71,2,1),(3886,71,3,1),(3887,71,4,1),(3888,71,5,1),(3889,71,6,1),(3890,71,7,1),(3891,71,8,1),(3892,71,9,1),(3893,71,10,1),(3894,71,11,1),(3895,71,12,1),(3896,71,13,1),(3897,71,14,1),(3898,71,15,1),(3899,71,16,1),(3900,71,17,1),(3901,71,18,1),(3902,71,19,1),(3903,71,20,1),(3904,71,21,1),(3905,71,22,1),(3906,71,23,0),(3907,72,1,1),(3908,72,2,1),(3909,72,3,1),(3910,72,4,1),(3911,72,5,1),(3912,72,6,1),(3913,72,7,1),(3914,72,8,1),(3915,72,9,1),(3916,72,10,1),(3917,72,11,1),(3918,72,12,1),(3919,72,13,1),(3920,72,14,1),(3921,72,15,1),(3922,72,16,1),(3923,72,17,1),(3924,72,18,1),(3925,72,19,1),(3926,72,20,1),(3927,72,21,1),(3928,72,22,1),(3929,72,23,0),(3930,73,1,1),(3931,73,2,1),(3932,73,3,1),(3933,73,4,1),(3934,73,5,1),(3935,73,6,1),(3936,73,7,1),(3937,73,8,1),(3938,73,9,1),(3939,73,10,1),(3940,73,11,1),(3941,73,12,1),(3942,73,13,1),(3943,73,14,1),(3944,73,15,1),(3945,73,16,1),(3946,73,17,1),(3947,73,18,1),(3948,73,19,1),(3949,73,20,1),(3950,73,21,1),(3951,73,22,1),(3952,73,23,0),(3953,74,1,1),(3954,74,2,1),(3955,74,3,1),(3956,74,4,1),(3957,74,5,1),(3958,74,6,1),(3959,74,7,1),(3960,74,8,1),(3961,74,9,1),(3962,74,10,1),(3963,74,11,1),(3964,74,12,1),(3965,74,13,1),(3966,74,14,1),(3967,74,15,1),(3968,74,16,1),(3969,74,17,1),(3970,74,18,1),(3971,74,19,1),(3972,74,20,1),(3973,74,21,1),(3974,74,22,1),(3975,74,23,0),(3976,75,1,1),(3977,75,2,1),(3978,75,3,1),(3979,75,4,1),(3980,75,5,1),(3981,75,6,1),(3982,75,7,1),(3983,75,8,1),(3984,75,9,1),(3985,75,10,1),(3986,75,11,1),(3987,75,12,1),(3988,75,13,1),(3989,75,14,1),(3990,75,15,1),(3991,75,16,1),(3992,75,17,1),(3993,75,18,1),(3994,75,19,1),(3995,75,20,1),(3996,75,21,1),(3997,75,22,1),(3998,75,23,0),(3999,76,1,1),(4000,76,2,1),(4001,76,3,1),(4002,76,4,1),(4003,76,5,1),(4004,76,6,1),(4005,76,7,1),(4006,76,8,1),(4007,76,9,1),(4008,76,10,1),(4009,76,11,1),(4010,76,12,1),(4011,76,13,1),(4012,76,14,1),(4013,76,15,1),(4014,76,16,1),(4015,76,17,1),(4016,76,18,1),(4017,76,19,1),(4018,76,20,1),(4019,76,21,1),(4020,76,22,1),(4021,76,23,0),(4022,77,1,1),(4023,77,2,1),(4024,77,3,1),(4025,77,4,1),(4026,77,5,1),(4027,77,6,1),(4028,77,7,1),(4029,77,8,1),(4030,77,9,1),(4031,77,10,1),(4032,77,11,1),(4033,77,12,1),(4034,77,13,1),(4035,77,14,1),(4036,77,15,1),(4037,77,16,1),(4038,77,17,1),(4039,77,18,1),(4040,77,19,1),(4041,77,20,1),(4042,77,21,1),(4043,77,22,1),(4044,77,23,0),(4045,78,1,1),(4046,78,2,1),(4047,78,3,1),(4048,78,4,1),(4049,78,5,1),(4050,78,6,1),(4051,78,7,1),(4052,78,8,1),(4053,78,9,1),(4054,78,10,1),(4055,78,11,1),(4056,78,12,1),(4057,78,13,1),(4058,78,14,1),(4059,78,15,1),(4060,78,16,1),(4061,78,17,1),(4062,78,18,1),(4063,78,19,1),(4064,78,20,1),(4065,78,21,1),(4066,78,22,1),(4067,78,23,0),(4068,79,1,1),(4069,79,2,1),(4070,79,3,1),(4071,79,4,1),(4072,79,5,1),(4073,79,6,1),(4074,79,7,1),(4075,79,8,1),(4076,79,9,1),(4077,79,10,1),(4078,79,11,1),(4079,79,12,1),(4080,79,13,1),(4081,79,14,1),(4082,79,15,1),(4083,79,16,1),(4084,79,17,1),(4085,79,18,1),(4086,79,19,1),(4087,79,20,1),(4088,79,21,1),(4089,79,22,1),(4090,79,23,0),(4091,80,1,1),(4092,80,2,1),(4093,80,3,1),(4094,80,4,1),(4095,80,5,1),(4096,80,6,1),(4097,80,7,1),(4098,80,8,1),(4099,80,9,1),(4100,80,10,1),(4101,80,11,1),(4102,80,12,1),(4103,80,13,1),(4104,80,14,1),(4105,80,15,1),(4106,80,16,1),(4107,80,17,1),(4108,80,18,1),(4109,80,19,1),(4110,80,20,1),(4111,80,21,1),(4112,80,22,1),(4113,80,23,0),(4114,81,1,1),(4115,81,2,1),(4116,81,3,1),(4117,81,4,1),(4118,81,5,1),(4119,81,6,1),(4120,81,7,1),(4121,81,8,1),(4122,81,9,1),(4123,81,10,1),(4124,81,11,1),(4125,81,12,1),(4126,81,13,1),(4127,81,14,1),(4128,81,15,1),(4129,81,16,1),(4130,81,17,1),(4131,81,18,1),(4132,81,19,1),(4133,81,20,1),(4134,81,21,1),(4135,81,22,1),(4136,81,23,0),(4137,82,1,1),(4138,82,2,1),(4139,82,3,1),(4140,82,4,1),(4141,82,5,1),(4142,82,6,1),(4143,82,7,1),(4144,82,8,1),(4145,82,9,1),(4146,82,10,1),(4147,82,11,1),(4148,82,12,1),(4149,82,13,1),(4150,82,14,1),(4151,82,15,1),(4152,82,16,1),(4153,82,17,1),(4154,82,18,1),(4155,82,19,1),(4156,82,20,1),(4157,82,21,1),(4158,82,22,1),(4159,82,23,0),(4160,83,1,1),(4161,83,2,1),(4162,83,3,1),(4163,83,4,1),(4164,83,5,1),(4165,83,6,1),(4166,83,7,1),(4167,83,8,1),(4168,83,9,1),(4169,83,10,1),(4170,83,11,1),(4171,83,12,1),(4172,83,13,1),(4173,83,14,1),(4174,83,15,1),(4175,83,16,1),(4176,83,17,1),(4177,83,18,1),(4178,83,19,1),(4179,83,20,1),(4180,83,21,1),(4181,83,22,1),(4182,83,23,0),(4183,84,1,1),(4184,84,2,1),(4185,84,3,1),(4186,84,4,1),(4187,84,5,1),(4188,84,6,1),(4189,84,7,1),(4190,84,8,1),(4191,84,9,1),(4192,84,10,1),(4193,84,11,1),(4194,84,12,1),(4195,84,13,1),(4196,84,14,1),(4197,84,15,1),(4198,84,16,1),(4199,84,17,1),(4200,84,18,1),(4201,84,19,1),(4202,84,20,1),(4203,84,21,1),(4204,84,22,1),(4205,84,23,0),(4206,85,1,1),(4207,85,2,1),(4208,85,3,1),(4209,85,4,1),(4210,85,5,1),(4211,85,6,1),(4212,85,7,1),(4213,85,8,1),(4214,85,9,1),(4215,85,10,1),(4216,85,11,1),(4217,85,12,1),(4218,85,13,1),(4219,85,14,1),(4220,85,15,1),(4221,85,16,1),(4222,85,17,1),(4223,85,18,1),(4224,85,19,1),(4225,85,20,1),(4226,85,21,1),(4227,85,22,1),(4228,85,23,0),(4229,86,1,1),(4230,86,2,1),(4231,86,3,1),(4232,86,4,1),(4233,86,5,1),(4234,86,6,1),(4235,86,7,1),(4236,86,8,1),(4237,86,9,1),(4238,86,10,1),(4239,86,11,1),(4240,86,12,1),(4241,86,13,1),(4242,86,14,1),(4243,86,15,1),(4244,86,16,1),(4245,86,17,1),(4246,86,18,1),(4247,86,19,1),(4248,86,20,1),(4249,86,21,1),(4250,86,22,1),(4251,86,23,0),(4252,87,1,1),(4253,87,2,1),(4254,87,3,1),(4255,87,4,1),(4256,87,5,1),(4257,87,6,1),(4258,87,7,1),(4259,87,8,1),(4260,87,9,1),(4261,87,10,1),(4262,87,11,1),(4263,87,12,1),(4264,87,13,1),(4265,87,14,1),(4266,87,15,1),(4267,87,16,1),(4268,87,17,1),(4269,87,18,1),(4270,87,19,1),(4271,87,20,1),(4272,87,21,1),(4273,87,22,1),(4274,87,23,0),(4275,88,1,1),(4276,88,2,1),(4277,88,3,1),(4278,88,4,1),(4279,88,5,1),(4280,88,6,1),(4281,88,7,1),(4282,88,8,1),(4283,88,9,1),(4284,88,10,1),(4285,88,11,1),(4286,88,12,1),(4287,88,13,1),(4288,88,14,1),(4289,88,15,1),(4290,88,16,1),(4291,88,17,1),(4292,88,18,1),(4293,88,19,1),(4294,88,20,1),(4295,88,21,1),(4296,88,22,1),(4297,88,23,0),(4298,89,1,1),(4299,89,2,1),(4300,89,3,1),(4301,89,4,1),(4302,89,5,1),(4303,89,6,1),(4304,89,7,1),(4305,89,8,1),(4306,89,9,1),(4307,89,10,1),(4308,89,11,1),(4309,89,12,1),(4310,89,13,1),(4311,89,14,1),(4312,89,15,1),(4313,89,16,1),(4314,89,17,1),(4315,89,18,1),(4316,89,19,1),(4317,89,20,1),(4318,89,21,1),(4319,89,22,1),(4320,89,23,0),(4321,90,1,1),(4322,90,2,1),(4323,90,3,1),(4324,90,4,1),(4325,90,5,1),(4326,90,6,1),(4327,90,7,1),(4328,90,8,1),(4329,90,9,1),(4330,90,10,1),(4331,90,11,1),(4332,90,12,1),(4333,90,13,1),(4334,90,14,1),(4335,90,15,1),(4336,90,16,1),(4337,90,17,1),(4338,90,18,1),(4339,90,19,1),(4340,90,20,1),(4341,90,21,1),(4342,90,22,1),(4343,90,23,0),(4344,91,1,1),(4345,91,2,1),(4346,91,3,1),(4347,91,4,1),(4348,91,5,1),(4349,91,6,1),(4350,91,7,1),(4351,91,8,1),(4352,91,9,1),(4353,91,10,1),(4354,91,11,1),(4355,91,12,1),(4356,91,13,1),(4357,91,14,1),(4358,91,15,1),(4359,91,16,1),(4360,91,17,1),(4361,91,18,1),(4362,91,19,1),(4363,91,20,1),(4364,91,21,1),(4365,91,22,1),(4366,91,23,0),(4367,92,1,1),(4368,92,2,1),(4369,92,3,1),(4370,92,4,1),(4371,92,5,1),(4372,92,6,1),(4373,92,7,1),(4374,92,8,1),(4375,92,9,1),(4376,92,10,1),(4377,92,11,1),(4378,92,12,1),(4379,92,13,1),(4380,92,14,1),(4381,92,15,1),(4382,92,16,1),(4383,92,17,1),(4384,92,18,1),(4385,92,19,1),(4386,92,20,1),(4387,92,21,1),(4388,92,22,1),(4389,92,23,0),(4390,93,1,1),(4391,93,2,1),(4392,93,3,1),(4393,93,4,1),(4394,93,5,1),(4395,93,6,1),(4396,93,7,1),(4397,93,8,1),(4398,93,9,1),(4399,93,10,1),(4400,93,11,1),(4401,93,12,1),(4402,93,13,1),(4403,93,14,1),(4404,93,15,1),(4405,93,16,1),(4406,93,17,1),(4407,93,18,1),(4408,93,19,1),(4409,93,20,1),(4410,93,21,1),(4411,93,22,1),(4412,93,23,0),(4413,94,1,1),(4414,94,2,1),(4415,94,3,1),(4416,94,4,1),(4417,94,5,1),(4418,94,6,1),(4419,94,7,1),(4420,94,8,1),(4421,94,9,1),(4422,94,10,1),(4423,94,11,1),(4424,94,12,1),(4425,94,13,1),(4426,94,14,1),(4427,94,15,1),(4428,94,16,1),(4429,94,17,1),(4430,94,18,1),(4431,94,19,1),(4432,94,20,1),(4433,94,21,1),(4434,94,22,1),(4435,94,23,0),(4436,95,1,1),(4437,95,2,1),(4438,95,3,1),(4439,95,4,1),(4440,95,5,1),(4441,95,6,1),(4442,95,7,1),(4443,95,8,1),(4444,95,9,1),(4445,95,10,1),(4446,95,11,1),(4447,95,12,1),(4448,95,13,1),(4449,95,14,1),(4450,95,15,1),(4451,95,16,1),(4452,95,17,1),(4453,95,18,1),(4454,95,19,1),(4455,95,20,1),(4456,95,21,1),(4457,95,22,1),(4458,95,23,0);
/*!40000 ALTER TABLE `type_user_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_users`
--

DROP TABLE IF EXISTS `type_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secure` tinyint(1) DEFAULT NULL,
  `is_tech` tinyint(1) DEFAULT NULL,
  `actif` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_users`
--

LOCK TABLES `type_users` WRITE;
/*!40000 ALTER TABLE `type_users` DISABLE KEYS */;
INSERT INTO `type_users` VALUES (1,'Technicien',1,1,1),(2,'Super Technicien',1,1,1),(3,'Administrateur',1,1,1),(4,'Dispatcheur',1,1,1),(5,'Expert',0,0,1),(6,'Assistant(e)',0,0,1),(7,'Secrétaire',0,0,1),(8,'Chargé de mission',0,0,1),(9,'Gestionnaire Paie',1,0,1),(10,'Aide comptable',1,0,1),(11,'1RAF',0,0,1),(12,'Comptable',1,0,1),(13,'Directeur Général',0,0,1),(14,'Directeur Général Délégué',0,0,1),(15,'Assistant(e) de direction',0,0,1),(16,'Contrat Pro',0,0,1),(17,'Responsable SI',0,0,1),(18,'Coordinateur(trice)',0,0,1),(19,'Femme de ménage',0,0,1),(20,'Assistante Qualité',0,0,1),(21,'Assistant(e) délégation de gestion',0,0,1),(22,'Juriste',0,0,1),(23,'Responsable Zone',0,0,1);
/*!40000 ALTER TABLE `type_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_materials_sellers`
--

DROP TABLE IF EXISTS `types_materials_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_materials_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_material_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_materials_sellers`
--

LOCK TABLES `types_materials_sellers` WRITE;
/*!40000 ALTER TABLE `types_materials_sellers` DISABLE KEYS */;
INSERT INTO `types_materials_sellers` VALUES (30,1,1),(31,2,1),(32,3,1),(33,4,1),(34,5,1),(35,6,1),(36,7,1),(37,1,2),(38,2,2),(39,3,2),(40,4,2),(41,5,2),(42,6,2),(43,7,2),(44,1,3),(45,2,3),(46,3,3),(47,4,3),(48,5,3),(49,6,3);
/*!40000 ALTER TABLE `types_materials_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changesMade` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES (1,'Correction de trucs\r\n','2016-08-05 14:34:41'),(2,'Changements effectués :\r\nCorrection du bug lié à l\'affichage des agences\r\nCorrection du bug lié au lien des utilisateurs\r\nChangement rendu de la page catégories','2016-08-05 14:46:32'),(3,'Changements effectués :\r\nCorrection du bug lié à l\'affichage des agences\r\nCorrection du bug lié au lien des utilisateurs\r\nChangement rendu de la page catégories','2016-08-05 14:46:53'),(4,'<p>Correction de bugs</p>\r\n\r\n<p>Autre correction de bugs !</p>\r\n\r\n<p>Et encore une !!!</p>\r\n','2016-08-05 14:52:18'),(5,'<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n','2016-08-05 14:53:38'),(6,'<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de','2016-08-05 15:02:47'),(12,'<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n','2016-08-08 15:08:13'),(13,'<p>Bla bla bla bla</p>\r\n\r\n<p>Bla bla bla bla</p>\r\n\r\n<p>Bla bla bla bla</p>\r\n\r\n<p>Bla bla bla bla</p>\r\n','2016-08-08 15:09:47'),(14,'<p>H&eacute;h&eacute; !!!</p>\r\n\r\n<p>&nbsp;</p>\r\n','2016-08-08 15:15:09'),(15,'<p>Yay !!!</p>\r\n','2016-08-09 07:19:51'),(16,'<p>azazdaz</p>\r\n','2016-08-24 12:52:15');
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ip_addr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_user_id` int(11) DEFAULT NULL,
  `sys_msg` tinyint(1) DEFAULT NULL,
  `actif` tinyint(1) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jm','jeremy.montesinos@cle-expertises.fr','0788607459','akssm922',NULL,2,'2015-11-23 14:03:05','2016-11-02 10:13:01','192.168.10.48',1,0,1,'Jeremy','Montesinos'),(4,'jerome.guillot','bujghuikhgidshilfhizsefh@yopmail.com','0683039620','sonya88','',2,'2015-12-09 09:47:39','2016-08-05 14:53:38','192.168.10.48',2,0,1,'Jerome','Guillot'),(5,'yvon.partoo','bujghuikhgidshilfhizsefh@yopmail.com','0555555555',' ','',2,'2015-12-16 08:27:43','2016-08-05 14:53:38','',3,0,1,'Yvon','Partoo'),(6,'guy.schwalm','bujghuikhgidshilfhizsefh@yopmail.com','0622634975','Volu348%',NULL,2,'2016-01-08 11:07:30','2016-08-05 14:53:38',NULL,4,0,1,'Guy','Schwalm'),(7,'germaine.tapeautour','bujghuikhgidshilfhizsefh@yopmail.com','0666666666',' ',NULL,2,'2016-02-02 08:50:03','2016-08-24 12:52:15',NULL,5,0,1,'Germaine','Tapeautour'),(8,'carole.naudin','bujghuikhgidshilfhizsefh@yopmail.com','0467998164',' ',NULL,2,'2016-02-08 10:37:23','2016-08-05 14:53:38',NULL,6,0,1,'Carole','Naudin'),(9,'yasmina.eude','bujghuikhgidshilfhizsefh@yopmail.com','0467999067',' ',NULL,2,'2016-02-10 14:04:38','2016-08-05 14:53:38',NULL,7,0,1,'Yasmina','Eude'),(10,'josiane.auclair','bujghuikhgidshilfhizsefh@yopmail.com','0467999067',' ',NULL,2,'2016-02-11 12:30:46','2016-08-05 14:53:38',NULL,8,0,1,'Josiane','Auclair'),(11,'ecureuil','bujghuikhgidshilfhizsefh@yopmail.com','0475580896',' ',NULL,7,'2016-04-28 15:02:42','2016-10-13 09:16:05','192.168.10.48',9,0,1,'Ecureuil','Ecureuil'),(12,'sandie.ferrier','bujghuikhgidshilfhizsefh@yopmail.com','0475580896',' ',NULL,7,'2016-05-27 13:55:36','2016-08-05 14:53:38',NULL,10,0,1,'Sandie','Ferrier'),(13,'dorothee.gerard','bujghuikhgidshilfhizsefh@yopmail.com','0467999067',' ',NULL,2,'2016-06-08 15:23:53','2016-08-05 14:53:38',NULL,11,0,1,'Dorothee','Gerard'),(14,'chantal','bujghuikhgidshilfhizsefh@yopmail.com','0467998161',' ',NULL,2,'2016-06-10 10:39:44','2016-08-08 15:14:16',NULL,12,0,1,'Chantal','Mourand'),(15,'bnjk.bbjhbjh','bujghuikhgidshilfhizsefh@yopmail.com','0161654644',' ',NULL,14,'2016-07-20 14:46:24','2016-08-05 14:53:38',NULL,12,0,1,'esfse','efsef'),(16,'jeromedd.guillot','bujghuikhgidshilfhizsefh@yopmail.com','0683039620','sonya88',NULL,2,'2016-08-04 12:59:51','2016-08-05 14:53:38','192.168.10.48',12,0,1,'fsgfse','guhui'),(17,'efef.efefsef','bujghuikhgidshilfhizsefh@yopmail.com','0496494984',' ','',1,'2016-08-31 07:55:12','2016-08-31 09:25:09','',12,0,1,'vbuybuy','buiiu'),(18,'fdef.fesfefse','bujghuikhgidshilfhizsefh@yopmail.com','0216459894',' ',NULL,3,'2016-08-31 08:02:03','2016-08-31 09:25:09',NULL,12,0,1,'rdgdrg','tfhtf'),(19,'dfd.fdfdfd','bujghuikhgidshilfhizsefh@yopmail.com','0485549595',' ',NULL,27,'2016-08-31 08:03:36','2016-08-31 09:25:09',NULL,12,0,1,'drgdrgdr','fthf'),(20,'e.e','bujghuikhgidshilfhizsefh@yopmail.com','0256565695',' ',NULL,23,'2016-08-31 08:08:51','2016-08-31 09:25:09',NULL,12,0,1,'drgdrgdr','tfhfth'),(21,'d.d','bujghuikhgidshilfhizsefh@yopmail.com','0416544646',' ',NULL,23,'2016-08-31 08:14:10','2016-08-31 09:25:09',NULL,12,0,1,'drgdrgdr','fthfh'),(22,'esfsef','bujghuikhgidshilfhizsefh@yopmail.com','0564084964',' ',NULL,20,'2016-08-31 08:18:34','2016-08-31 09:25:09',NULL,12,0,1,'drgrdgrd','fthft'),(23,'esfsefqdzqdzq','bujghuikhgidshilfhizsefh@yopmail.com','0564084964',' ',NULL,3,'2016-08-31 08:18:49','2016-08-31 09:25:09',NULL,12,0,1,'drgrdgr','fthfth'),(24,'e.eedfsefesfse','bujghuikhgidshilfhizsefh@yopmail.com','0595959494',' ',NULL,1,'2016-08-31 08:23:24','2016-08-31 09:25:09',NULL,12,0,1,'dgrdg','fthfth'),(25,'vygv.uygvuygbu','vygv.uygvuygbu@cle-expertises.fr','0555596654','frghdghr',NULL,33,'2016-10-19 08:15:40','2016-10-24 15:59:28',NULL,10,NULL,1,NULL,NULL),(26,'ub.bujbiub','fbui.bujbiub@cle-expertises.fr','0654646445','ujuygbvuygvivugbuiohbiohj',NULL,13,'2016-10-19 08:25:56','2016-10-24 15:59:28',NULL,9,NULL,1,NULL,NULL),(27,'bhuhuih.uiohuhiuoh','bhuhuih.uiohuhiuoh@cle-expertises.fr','0469654954','esfgsdgdg',NULL,26,'2016-10-19 09:08:00','2016-10-24 15:59:24',NULL,9,NULL,1,NULL,NULL),(28,'yyguyy.guhui','yyguyy.guhui@cle-expertises.fr','0654654445','hughui',NULL,26,'2016-10-19 09:09:30','2016-10-24 15:59:30',NULL,9,NULL,1,NULL,NULL),(29,'ggrdtuhgghiuyv.uuiguiguio','ggrdtuhgghiuyv.uuiguiguio@cle-expertises.fr','0454585454',' ',NULL,35,'2016-10-19 09:10:54','2016-10-24 15:59:26',NULL,6,NULL,1,NULL,NULL),(30,'vhgvuyhvfgy.vyhvguigiu','vhgvuyhvfgy.vyhvguigiu@cle-expertises.fr','0154854445','tyfyfvhfgvygfug',NULL,23,'2016-10-19 09:12:49','2016-10-24 15:59:28',NULL,9,NULL,1,'vyhvguigiu','vhgvuyhvfgy'),(31,'bgubhu.hijhiuoh','bgubhu.hijhiuoh@cle-expertises.fr','0165496469','',NULL,27,'2016-10-24 14:52:43','2016-10-24 15:59:18',NULL,5,NULL,1,'hijhiuoh','bgubhu'),(32,'fesfsefgu.uhiuhuh','fesfsefgu.uhiuhuh@cle-expertises.fr','0559656565','0000',NULL,32,'2016-10-24 15:23:34','2016-11-02 10:13:01',NULL,1,NULL,1,'uhiuhuh','fesfsefgu'),(33,'niuniohjni.hnijhiojio','niuniohjni.hnijhiojio@cle-expertises.fr','0656565464','12165',NULL,27,'2016-10-24 15:26:41','2016-10-24 15:59:27',NULL,2,NULL,1,'hnijhiojio','niuniohjni');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-23 11:44:22
