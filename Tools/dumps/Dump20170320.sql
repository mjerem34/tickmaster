CREATE DATABASE  IF NOT EXISTS `Tickets_development` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `Tickets_development`;
-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: Tickets_development
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_agencies`
--

LOCK TABLES `field_agencies` WRITE;
/*!40000 ALTER TABLE `field_agencies` DISABLE KEYS */;
INSERT INTO `field_agencies` VALUES (43,'Numéro de téléphone fixe'),(44,'Numéro de téléphone mobile'),(45,'Nom du responsable'),(46,'Adresse email du responsable'),(47,'Adresse postale'),(48,'Adresse email'),(49,'Code postal'),(50,'Ville'),(51,'Numéro de fax');
/*!40000 ALTER TABLE `field_agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_agency_agencies`
--

DROP TABLE IF EXISTS `field_agency_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_agency_agencies` (
  `agency_id` int(11) NOT NULL DEFAULT '0',
  `field_agency_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`field_agency_id`,`agency_id`)
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
-- Table structure for table `field_seller_sellers`
--

DROP TABLE IF EXISTS `field_seller_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_seller_sellers` (
  `field_seller_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`field_seller_id`,`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_seller_sellers`
--

LOCK TABLES `field_seller_sellers` WRITE;
/*!40000 ALTER TABLE `field_seller_sellers` DISABLE KEYS */;
INSERT INTO `field_seller_sellers` VALUES (2,2,'1569 rue du 14 juillet'),(2,3,'fbdgdrg'),(2,5,''),(2,6,'dgdrgrdg'),(2,7,'vsev'),(3,7,'34000'),(4,5,'dfsfesqf'),(4,7,'Montpellier'),(5,6,'dgdrgrdgrdgdrgd'),(5,7,'vsev'),(7,3,'sgrgrsegsg');
/*!40000 ALTER TABLE `field_seller_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_sellers`
--

DROP TABLE IF EXISTS `field_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_sellers`
--

LOCK TABLES `field_sellers` WRITE;
/*!40000 ALTER TABLE `field_sellers` DISABLE KEYS */;
INSERT INTO `field_sellers` VALUES (2,'Adresse'),(3,'Code postal'),(4,'Ville'),(5,'Téléphone'),(7,'Fax');
/*!40000 ALTER TABLE `field_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_type_user_type_users`
--

DROP TABLE IF EXISTS `field_type_user_type_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_type_user_type_users` (
  `type_user_id` int(11) NOT NULL,
  `field_type_user_id` int(11) NOT NULL,
  PRIMARY KEY (`type_user_id`,`field_type_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_type_user_type_users`
--

LOCK TABLES `field_type_user_type_users` WRITE;
/*!40000 ALTER TABLE `field_type_user_type_users` DISABLE KEYS */;
INSERT INTO `field_type_user_type_users` VALUES (1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_type_users`
--

LOCK TABLES `field_type_users` WRITE;
/*!40000 ALTER TABLE `field_type_users` DISABLE KEYS */;
INSERT INTO `field_type_users` VALUES (1,'Adresses'),(6,'Adressese'),(7,'fs'),(8,'fg');
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (37,'Panne','<p>Bordel !</p>\r\n',1,NULL,1,14,5,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-06-29 08:04:52','2016-06-29 08:04:52','2016-06-29 08:01:47','2016-06-29 08:04:52',NULL,NULL),(38,'effsfes','<p>fesfesfefesf</p>\r\n',1,6,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-06-29 08:06:45','2016-06-29 10:00:42',NULL,NULL),(39,'sssss','<p>ssssss</p>\r\n',1,1,1,14,5,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 08:38:32','2016-06-29 12:43:56',NULL,NULL),(40,'ddddd','<p>dddd</p>\r\n',1,NULL,1,14,6,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 08:45:14','2016-06-29 08:45:14',NULL,NULL),(41,'dddddd','<p>dddddddddd</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 08:46:04','2016-06-29 08:46:04',NULL,NULL),(42,'efesfes','<p>fesfefesf</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 09:01:49','2016-07-12 14:16:23',1,0),(43,'dddddd','<p>dddd</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 09:29:25','2016-06-29 09:29:25',NULL,NULL),(44,'scscscswcswcwsc','<p>cscscscwsc</p>\r\n',11,1,1,14,1,1,NULL,NULL,NULL,'192.168.10.34',NULL,NULL,NULL,7,7,1,'2016-07-12 09:40:17','2016-07-12 09:40:17','2016-06-29 09:43:09','2016-07-12 09:40:17',0,0),(45,'dzdqsdfe','<p>fefesfsefesfef</p>\r\n',1,1,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-06-29 12:32:06','2016-07-29 08:15:37',NULL,NULL),(46,'fesfsefsef','<p>fefsefesfe</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 12:32:40','2016-07-12 08:34:17',NULL,NULL),(48,'BLABLA','<p>BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLA</p>\r\n',1,1,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-07-11 13:35:45','2016-07-29 08:16:16',NULL,NULL),(49,'blablablabla','<p>gggggg</p>\r\n',1,NULL,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 08:46:46','2016-07-12 09:34:54',0,0),(50,'fff','<p>fff</p>\r\n',11,1,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-12 09:55:39','2016-07-12 09:55:39','2016-07-12 09:41:52','2016-07-12 09:55:39',0,0),(51,'effef','<p>fffff</p>\r\n',11,1,5,16,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,4,5,1,NULL,NULL,'2016-07-12 09:57:16','2016-08-09 08:38:40',0,0),(52,'ee','<p>eee</p>\r\n',11,1,4,6,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-12 10:13:34','2016-07-12 10:13:34','2016-07-12 10:07:16','2016-07-12 10:13:34',0,0),(53,'iii','<p>iii</p>\r\n',1,NULL,3,1,0,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:52:30','2016-07-12 12:52:30',1,0),(54,'oo','<p>ooo</p>\r\n',1,NULL,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:52:52','2016-07-12 12:52:52',1,0),(55,'h','<p>h</p>\r\n',1,NULL,2,31,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:53:16','2016-07-12 12:53:16',1,0),(56,'h','<p>h</p>\r\n',1,NULL,3,1,3,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:53:40','2016-07-12 12:53:40',1,0),(57,'gdg','<p>gdgg</p>\r\n',1,NULL,2,31,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 13:08:48','2016-07-12 13:08:48',1,0),(58,'l','<p>l</p>\r\n',1,NULL,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 13:11:45','2016-07-12 13:11:45',1,0),(59,'rgre','<p>geger</p>\r\n',1,NULL,2,31,4,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 13:20:16','2016-07-12 13:20:16',1,0),(60,'ff','<p>fffff</p>\r\n',1,6,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-07-12 13:20:47','2016-07-29 08:16:50',1,0),(61,'ddd','<p>dddddd</p>\r\n',1,1,1,14,6,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-12 14:17:51','2016-07-29 12:27:30',0,1),(62,'esf','<p>fesfe</p>\r\n',1,1,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-21 07:58:06','2016-07-21 07:58:06','2016-07-12 14:26:26','2016-07-21 07:58:06',0,1),(63,'sefefsefesfe','<p>zfefesfef</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-20 10:07:00','2016-07-20 10:07:00',1,0),(64,'fgdgd','<p>drgdrgr</p>\r\n',1,1,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,7,7,1,'2016-07-21 07:57:57','2016-07-21 07:57:57','2016-07-20 10:07:38','2016-07-21 07:57:57',0,1),(65,'qdz','<p>zdqzdzqd</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-20 10:09:39','2016-07-20 10:09:39',1,0),(66,'hth','<p>tfhtht</p>\r\n',1,1,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,7,7,1,'2016-07-20 15:23:14','2016-07-20 15:23:14','2016-07-20 12:59:35','2016-07-20 15:23:14',0,1),(69,'dzzqdqz','<p>dzqdzqdzqd</p>\r\n',11,1,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,8,9,1,NULL,'2016-07-20 15:23:26','2016-07-20 15:08:09','2016-07-20 15:23:26',0,1),(70,'sef','<p>eee</p>\r\n',11,NULL,1,14,1,1,NULL,NULL,NULL,'10.134.2.49',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-21 07:27:15','2016-07-22 09:58:45',0,0),(71,'ss','<p>sssss</p>\r\n',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-25 07:54:00','2016-07-25 07:54:00',1,0),(72,'ss','<p>sssss</p>\r\n',11,1,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-25 07:59:11','2016-07-29 12:17:07',0,1),(73,'dd','<p>ddddd</p>\r\n',11,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-25 07:59:28','2016-07-25 08:00:02',0,0),(74,'sssss','<p>ssssss</p>\r\n',11,6,3,1,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-26 07:12:59','2016-08-02 13:36:06',1,0),(75,'dddd','<p>ssssss</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-08-02 07:58:42','2016-08-02 08:20:00',0,0),(76,'xxxxx','<p>xxxxx</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-08-02 08:22:09','2016-08-02 08:24:03',0,0),(78,'ss','<p>sssss</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,8,9,1,NULL,'2016-08-02 14:23:52','2016-08-02 12:19:16','2016-08-02 14:23:52',0,0),(79,'ss','<p>sssss</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,8,9,1,NULL,'2016-08-02 14:14:16','2016-08-02 12:19:59','2016-08-02 14:14:16',0,0),(80,'ss','<p>ssssskk</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-02 12:25:43','2016-08-02 13:44:16',1,0),(82,'s','<p>s</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:08:36','2016-08-03 08:08:36',1,0),(83,'dd','<p>ddddd</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:09:52','2016-08-03 08:09:52',1,0),(84,'c','<p>c</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:10:39','2016-08-03 08:10:39',1,0),(85,'dd','<p>dddd</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:11:27','2016-08-03 08:11:27',1,0),(86,'s','<p>s</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:15:45','2016-08-03 08:15:45',1,0),(87,'eee','<p>eeee</p>\r\n',1,NULL,3,1,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:17:54','2016-08-03 08:17:54',1,0),(88,'ee','<p>eee</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:18:54','2016-08-03 08:18:54',1,0),(89,'sss','<p>sssss</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:19:50','2016-08-03 08:19:50',1,0),(91,'ss','<p>sssss</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 09:32:52','2016-08-03 09:32:52',1,0),(92,'d','<p>d</p>\r\n',1,NULL,4,6,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 09:35:35','2016-08-03 09:35:35',1,0),(93,'eeeeeeeeeee','<p>eee</p>\r\n',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-25 13:47:55','2016-08-25 13:49:23',0,0),(94,'rgdrgdrgrdgrdg','<p>drgrgrg</p>\r\n',1,1,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-09-06 08:50:02','2016-10-17 15:12:11',1,0),(95,'thh','<p>thfthfthfth</p>\r\n',41,NULL,2,31,3,1,NULL,NULL,NULL,'192.168.10.52',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-12-19 15:06:38','2016-12-19 15:06:38',1,0),(96,'fthfthft','<p>hfthtfhfth</p>\r\n',41,NULL,3,1,1,1,NULL,NULL,NULL,'192.168.10.52',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-12-19 15:09:25','2016-12-19 15:09:25',1,0),(97,'yjgy','<p>jgjygj</p>\r\n',41,NULL,3,1,1,1,NULL,NULL,NULL,'192.168.10.52',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-12-19 15:15:04','2016-12-19 15:15:04',1,0),(98,'rdgdrg','<p>drggrg</p>\r\n',41,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.52',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-12-19 15:15:53','2016-12-19 15:15:53',1,0),(99,'fthf','<p>hfhtfth</p>\r\n',41,NULL,5,15,1,1,NULL,NULL,NULL,'192.168.10.52',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-12-19 15:16:59','2016-12-19 15:16:59',1,0),(100,'drgrdg','<p>drgrdggd</p>\r\n',41,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.52',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-12-19 15:17:41','2016-12-19 15:17:41',1,0),(101,'dezfse','<p>fsfesf</p>\r\n',41,NULL,3,1,1,1,NULL,NULL,NULL,'192.168.10.52',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-12-19 15:44:09','2016-12-19 15:44:09',1,0),(102,'gdrgdrg','<p>rdgrdgrd</p>\r\n',1,NULL,3,1,1,1,NULL,NULL,NULL,'192.168.10.52',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-12-19 16:22:56','2016-12-19 16:22:56',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
INSERT INTO `responses` VALUES (40,'Incident créé par Montesinos\n          Jeremy',38,1,NULL,NULL,NULL,'2016-06-29 08:06:45','2016-06-29 08:06:45'),(41,'Incident créé par Montesinos\n          Jeremy',39,1,NULL,NULL,NULL,'2016-06-29 08:38:32','2016-06-29 08:38:32'),(42,'Incident créé par Montesinos\n          Jeremy',40,1,NULL,NULL,NULL,'2016-06-29 08:45:14','2016-06-29 08:45:14'),(43,'Incident créé par Montesinos\n          Jeremy',41,1,NULL,NULL,NULL,'2016-06-29 08:46:04','2016-06-29 08:46:04'),(44,'retetet',40,1,NULL,'127.0.0.1',NULL,'2016-06-29 08:47:20','2016-06-29 08:47:20'),(45,'dzaddeq',38,1,NULL,'127.0.0.1',NULL,'2016-06-29 08:47:58','2016-06-29 08:47:58'),(46,'dfsefefesf',40,1,NULL,'127.0.0.1',NULL,'2016-06-29 08:50:04','2016-06-29 08:50:04'),(47,'Incident créé par Montesinos\n          Jeremy',42,1,NULL,NULL,NULL,'2016-06-29 09:01:49','2016-06-29 09:01:49'),(48,'fesfefefesf',42,1,NULL,'127.0.0.1',NULL,'2016-06-29 09:01:58','2016-06-29 09:01:58'),(49,'Incident créé par Montesinos\n          Jeremy',43,1,NULL,NULL,NULL,'2016-06-29 09:29:25','2016-06-29 09:29:25'),(50,'ddddd',43,1,NULL,'127.0.0.1',NULL,'2016-06-29 09:29:39','2016-06-29 09:29:39'),(52,'Incident affecté',38,1,NULL,NULL,NULL,'2016-06-29 10:00:42','2016-06-29 10:00:42'),(53,'Incident créé par Montesinos\n          Jeremy',45,1,NULL,NULL,NULL,'2016-06-29 12:32:06','2016-06-29 12:32:06'),(54,'Incident créé par Montesinos\n          Jeremy',46,1,NULL,NULL,NULL,'2016-06-29 12:32:40','2016-06-29 12:32:40'),(55,'Incident affecté',39,1,NULL,NULL,NULL,'2016-06-29 12:43:21','2016-06-29 12:43:21'),(56,'Demande de réaffectation envoyée : J\'y arrive pas !',39,1,1,'127.0.0.1',NULL,'2016-06-29 12:43:56','2016-06-29 12:43:56'),(57,'Incident créé par Montesinos\n          Jeremy',47,NULL,NULL,NULL,NULL,'2016-07-11 13:34:52','2016-07-11 13:34:52'),(58,'Incident créé par Montesinos\n          Jeremy',48,1,NULL,NULL,NULL,'2016-07-11 13:35:45','2016-07-11 13:35:45'),(59,'s',48,1,NULL,'127.0.0.1',NULL,'2016-07-12 08:41:10','2016-07-12 08:41:10'),(60,'d',48,1,NULL,'127.0.0.1',NULL,'2016-07-12 08:42:14','2016-07-12 08:42:14'),(61,'d',48,1,NULL,'127.0.0.1',NULL,'2016-07-12 08:42:40','2016-07-12 08:42:40'),(62,'Incident créé par Montesinos\n          Jeremy',49,1,NULL,NULL,NULL,'2016-07-12 08:46:46','2016-07-12 08:46:46'),(63,'bla',49,1,NULL,'127.0.0.1',NULL,'2016-07-12 09:25:22','2016-07-12 09:25:22'),(64,'ee',49,1,NULL,'127.0.0.1',NULL,'2016-07-12 09:26:23','2016-07-12 09:26:23'),(65,'d',49,1,NULL,'127.0.0.1',NULL,'2016-07-12 09:27:54','2016-07-12 09:27:54'),(66,'dddd',49,1,NULL,'127.0.0.1',NULL,'2016-07-12 09:28:19','2016-07-12 09:28:19'),(67,'bla',49,1,NULL,'127.0.0.1',NULL,'2016-07-12 09:34:54','2016-07-12 09:34:54'),(83,'Incident créé par Kopf\n          Sandrine',51,11,NULL,NULL,NULL,'2016-07-12 09:57:16','2016-07-12 09:57:16'),(84,'Incident affecté',51,11,NULL,NULL,NULL,'2016-07-12 10:00:19','2016-07-12 10:00:19'),(85,'sefsefesfesf',51,1,11,'127.0.0.1',NULL,'2016-07-12 10:04:57','2016-07-12 10:04:57'),(92,'Incident créé par Montesinos\n          Jeremy',53,1,NULL,NULL,NULL,'2016-07-12 12:52:30','2016-07-12 12:52:30'),(93,'Incident créé par Montesinos\n          Jeremy',54,1,NULL,NULL,NULL,'2016-07-12 12:52:52','2016-07-12 12:52:52'),(94,'Incident créé par Montesinos\n          Jeremy',55,1,NULL,NULL,NULL,'2016-07-12 12:53:16','2016-07-12 12:53:16'),(95,'Incident créé par Montesinos\n          Jeremy',56,1,NULL,NULL,NULL,'2016-07-12 12:53:40','2016-07-12 12:53:40'),(96,'Incident créé par Montesinos\n          Jeremy',57,1,NULL,NULL,NULL,'2016-07-12 13:08:48','2016-07-12 13:08:48'),(97,'Incident créé par Montesinos\n          Jeremy',58,1,NULL,NULL,NULL,'2016-07-12 13:11:45','2016-07-12 13:11:45'),(98,'Incident créé par Montesinos\n          Jeremy',59,1,NULL,NULL,NULL,'2016-07-12 13:20:16','2016-07-12 13:20:16'),(99,'Incident créé par Montesinos\n          Jeremy',60,1,NULL,NULL,NULL,'2016-07-12 13:20:47','2016-07-12 13:20:47'),(100,'deqesf',42,1,NULL,'127.0.0.1',NULL,'2016-07-12 14:16:23','2016-07-12 14:16:23'),(103,'Incident créé par Montesinos\n          Jeremy',63,1,NULL,NULL,NULL,'2016-07-20 10:07:00','2016-07-20 10:07:00'),(105,'Incident créé par Montesinos\n          Jeremy',65,1,NULL,NULL,NULL,'2016-07-20 10:09:39','2016-07-20 10:09:39'),(119,'Incident créé par Kopf\n          Sandrine',69,11,NULL,NULL,NULL,'2016-07-20 15:08:09','2016-07-20 15:08:09'),(120,'Incident affecté',69,11,NULL,NULL,NULL,'2016-07-20 15:08:47','2016-07-20 15:08:47'),(121,'ezesf',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:10:19','2016-07-20 15:10:19'),(122,'esfsef',69,11,1,'192.168.10.55',NULL,'2016-07-20 15:10:46','2016-07-20 15:10:46'),(123,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:20:02','2016-07-20 15:20:02'),(124,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:20:27','2016-07-20 15:20:27'),(125,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:21:12','2016-07-20 15:21:12'),(126,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:21:22','2016-07-20 15:21:22'),(128,'Cloture de l\'incident : ',69,1,11,'192.168.10.55',NULL,'2016-07-20 15:23:26','2016-07-20 15:23:26'),(140,'Incident créé par Kopf\n          Sandrine',71,11,NULL,NULL,NULL,'2016-07-25 07:54:00','2016-07-25 07:54:00'),(142,'Incident créé par Kopf\n          Sandrine',74,11,NULL,NULL,NULL,'2016-07-26 07:12:59','2016-07-26 07:12:59'),(143,'Incident affecté',74,11,NULL,NULL,NULL,'2016-07-26 08:08:44','2016-07-26 08:08:44'),(145,'Incident affecté',45,1,NULL,NULL,NULL,'2016-07-29 08:15:37','2016-07-29 08:15:37'),(146,'Incident affecté',48,1,NULL,NULL,NULL,'2016-07-29 08:16:16','2016-07-29 08:16:16'),(147,'Incident affecté',60,1,NULL,NULL,NULL,'2016-07-29 08:16:50','2016-07-29 08:16:50'),(157,'Incident créé par Montesinos\n            Jeremy',81,11,NULL,NULL,NULL,'2016-08-02 12:25:51','2016-08-02 12:25:51'),(163,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,'2016-08-02 13:36:06','2016-08-02 13:36:06'),(164,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,'2016-08-02 13:42:41','2016-08-02 13:42:41'),(165,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,'2016-08-02 13:43:12','2016-08-02 13:43:12'),(166,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,'2016-08-02 13:43:41','2016-08-02 13:43:41'),(167,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',80,1,NULL,'127.0.0.1',NULL,'2016-08-02 13:44:16','2016-08-02 13:44:16'),(168,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 13:44:55','2016-08-02 13:44:55'),(169,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:11:02','2016-08-02 14:11:02'),(170,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:11:12','2016-08-02 14:11:12'),(171,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:11:38','2016-08-02 14:11:38'),(172,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:14:16','2016-08-02 14:14:16'),(173,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:18:57','2016-08-02 14:18:57'),(174,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:23:24','2016-08-02 14:23:24'),(175,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:23:36','2016-08-02 14:23:36'),(176,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:23:52','2016-08-02 14:23:52'),(177,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:24:06','2016-08-02 14:24:06'),(178,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,'2016-08-02 14:25:16','2016-08-02 14:25:16'),(179,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:20:24','2016-08-03 07:20:24'),(180,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:25:47','2016-08-03 07:25:47'),(181,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:26:47','2016-08-03 07:26:47'),(182,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:26:49','2016-08-03 07:26:49'),(183,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:26:51','2016-08-03 07:26:51'),(184,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:27:25','2016-08-03 07:27:25'),(185,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,'2016-08-03 07:28:34','2016-08-03 07:28:34'),(186,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:29:48','2016-08-03 07:29:48'),(188,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:32:00','2016-08-03 07:32:00'),(189,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:34:29','2016-08-03 07:34:29'),(191,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:37:26','2016-08-03 07:37:26'),(192,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:37:34','2016-08-03 07:37:34'),(193,'Incident affecté',77,11,NULL,NULL,NULL,'2016-08-03 07:46:12','2016-08-03 07:46:12'),(194,'Incident créé par Montesinos\n            Jeremy',82,1,NULL,NULL,NULL,'2016-08-03 08:08:36','2016-08-03 08:08:36'),(195,'Incident créé par Montesinos\n            Jeremy',83,1,NULL,NULL,NULL,'2016-08-03 08:09:52','2016-08-03 08:09:52'),(196,'Incident créé par Montesinos\n            Jeremy',84,1,NULL,NULL,NULL,'2016-08-03 08:10:39','2016-08-03 08:10:39'),(197,'Incident créé par Montesinos\n            Jeremy',85,1,NULL,NULL,NULL,'2016-08-03 08:11:27','2016-08-03 08:11:27'),(198,'Incident créé par Montesinos\n            Jeremy',86,1,NULL,NULL,NULL,'2016-08-03 08:15:45','2016-08-03 08:15:45'),(199,'Incident créé par Montesinos\n            Jeremy',87,1,NULL,NULL,NULL,'2016-08-03 08:17:54','2016-08-03 08:17:54'),(200,'Incident créé par Montesinos\n            Jeremy',88,1,NULL,NULL,NULL,'2016-08-03 08:18:54','2016-08-03 08:18:54'),(201,'Incident créé par Montesinos\n            Jeremy',89,1,NULL,NULL,NULL,'2016-08-03 08:19:50','2016-08-03 08:19:50'),(202,'Incident créé par Montesinos\n            Jeremy',90,1,NULL,NULL,NULL,'2016-08-03 09:32:07','2016-08-03 09:32:07'),(203,'Incident créé par Montesinos\n            Jeremy',91,11,NULL,NULL,NULL,'2016-08-03 09:32:52','2016-08-03 09:32:52'),(204,'Incident créé par Montesinos\n            Jeremy',92,1,NULL,NULL,NULL,'2016-08-03 09:35:35','2016-08-03 09:35:35'),(205,'Incident créé par Kopf\n            Sandrine',93,11,NULL,NULL,NULL,'2016-08-25 13:47:55','2016-08-25 13:47:55'),(206,'Cloture de l\'incident : ',93,11,NULL,'127.0.0.1',NULL,'2016-08-25 13:49:23','2016-08-25 13:49:23'),(207,'Cloture de l\'incident : ',93,11,NULL,'127.0.0.1',NULL,'2016-08-25 13:51:30','2016-08-25 13:51:30'),(208,'Cloture de l\'incident : ',93,11,NULL,'127.0.0.1',NULL,'2016-08-25 13:52:14','2016-08-25 13:52:14'),(209,'Cloture de l\'incident : ',93,11,NULL,'127.0.0.1',NULL,'2016-08-25 13:52:20','2016-08-25 13:52:20'),(210,'Cloture de l\'incident : ',93,11,NULL,'127.0.0.1',NULL,'2016-08-25 13:53:08','2016-08-25 13:53:08'),(211,'Incident créé par Montesinos\n            Jeremy',94,1,NULL,NULL,NULL,'2016-09-06 08:50:02','2016-09-06 08:50:02'),(212,'Incident affecté',94,1,NULL,NULL,NULL,'2016-10-17 15:11:01','2016-10-17 15:11:01'),(213,'Incident affecté',94,1,NULL,NULL,NULL,'2016-10-17 15:12:11','2016-10-17 15:12:11'),(214,'Incident créé par jojojo\n            hijj',95,41,NULL,NULL,NULL,'2016-12-19 15:06:38','2016-12-19 15:06:38'),(215,'Incident créé par jojojo\n            hijj',96,41,NULL,NULL,NULL,'2016-12-19 15:09:25','2016-12-19 15:09:25'),(216,'Incident créé par jojojo\n            hijj',97,41,NULL,NULL,NULL,'2016-12-19 15:15:04','2016-12-19 15:15:04'),(217,'Incident créé par jojojo\n            hijj',98,41,NULL,NULL,NULL,'2016-12-19 15:15:53','2016-12-19 15:15:53'),(218,'Incident créé par jojojo\n            hijj',99,41,NULL,NULL,NULL,'2016-12-19 15:16:59','2016-12-19 15:16:59'),(219,'Incident créé par jojojo\n            hijj',100,41,NULL,NULL,NULL,'2016-12-19 15:17:41','2016-12-19 15:17:41'),(220,'Incident créé par jojojo\n            hijj',101,41,NULL,NULL,NULL,'2016-12-19 15:44:09','2016-12-19 15:44:09'),(221,'Incident créé par Jeremy\n            Montesinos',102,1,NULL,NULL,NULL,'2016-12-19 16:22:56','2016-12-19 16:22:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (1,'view_index_users','Autorisé à voir la liste des utilisateurs'),(2,'create_new_tech','Autorisé à créer un nouvel utilisateur, tech, supertech, admin'),(3,'create_new_right','Autorisé à créer de nouveaux droits'),(4,'create_new_category','Autorisé à créer de nouvelles catégories'),(5,'view_index_all_of_incidents','Autorisé à voir les incidents de tous les membres'),(6,'create_new_incidents','Autorisé à créer de nouveaux incidents'),(7,'create_new_subcategory','Autorisé à créer de nouvelles sous catégories'),(8,'view_index_categories','Autorisé à voir la liste des catégories'),(9,'view_details_category','Autorisé à voir les détails d\'une catégorie'),(10,'edit_category','Autorisé à éditer une categorie'),(11,'delete_category','Autorisé à supprimer une catégorie'),(12,'view_details_incident_of_other_member','Autorisé à voir les détails d\'un incident d\'un autre membre'),(13,'edit_incidents','Autorisé à éditer un incident d\'un autre membre'),(14,'delete_incident','Autorisé à supprimer un incident'),(15,'edit_subcategories','Autorisé à éditer une sous catégorie'),(16,'view_index_subcategories','Autorisé à voir la liste des sous categories'),(17,'view_details_subcategories','Autorisé à voir le détail d\'une sous catégorie'),(18,'delete_subcategories','Autorisé à supprimer les sous catégories'),(19,'edit_rights','Autorisé à éditer un droit'),(20,'view_index_rights','Autorisé à voir la liste des droits'),(21,'delete_rights','Autorisé à supprimer des droits'),(22,'dispatch_incidents','Autorisé à attribuer les incidents aux techniciens'),(23,'view_index_fonctions','Autorisé à voir la liste des fonctions'),(24,'create_new_fonctions','Autorisé à créer une nouvelle fonction'),(25,'edit_fonctions','Autorisé à éditer une fonction'),(26,'delete_fonctions','Autorisé à supprimer une fonction'),(27,'view_users_pages','Autorisé à voir la page des autres membres'),(28,'reject_incidents','Autorisé à rejeter un incident'),(29,'cloture_incidents','Autorisé à cloturer les incidents ou à faire une demande de cloture'),(30,'view_button_admin','Autorisé à voir le bouton administration'),(31,'view_index_agencies','Autorisé à voir la page d\'index des agences'),(32,'view_agency_details','Autorisé à voir les détails d\'une agence'),(33,'create_new_agency','Autorisé à créer une nouvelle agence'),(34,'edit_agency','Autorisé à editer une agence existante'),(35,'edit_user','Autorisé à éditer ses informations personnelles'),(36,'edit_other_user','Autorisé à editer le profil d\'autres utilisateurs'),(37,'edit_all_user','Autorisé à modifier tous les champs d\'un utilisateur'),(38,'edit_like_a_boss','Autorisé à modifier le type d\'utilisateur'),(39,'view_detail_incident','Autorisé à voir le détail des incidents'),(40,'ask_for_reaffect','Autorisé à demander une réaffectation de l\'incident'),(41,'edit_categories_incidents','Autorisé à modifier la catégorie et sous catégorie d\'un incident'),(42,'edit_lvl_incident','Autorisé à modifier le niveau d\'un incident'),(43,'save_changes_of_edit','Autorisé à enregistrer les modifications d\'un incident'),(44,'treat_incidents','Autorisé à traiter les incidents'),(45,'create_procedure','Autorisé à créer une procedure'),(46,'view_procedures','Autorisé à voir les procedures'),(47,'edit_procedure','Autorisé à modifier les procedures'),(48,'archive_procedure','Autorisé à archiver les procedures'),(49,'delete_procedure','Autorisé à supprimer une procedure'),(50,'ping_agencies','Autorisé à pinger les agences'),(51,'create_sellers','Autorisé à ajouter des vendeurs de matériel'),(52,'modify_sellers','Autorisé à modifier des vendeurs de matériel'),(53,'delete_sellers','Autorisé à supprimer des vendeurs de matériel'),(54,'view_sellers','Autorisé à voir les vendeurs de matériel'),(55,'create_field_sellers','Autorisé à créer des champs de données pour les vendeurs'),(56,'modify_field_sellers','Autorisé à modifier des champs de données pour les vendeurs'),(57,'delete_field_sellers','Autorisé à supprimer des champs de données pour les vendeurs'),(58,'view_field_sellers','Autorisé à voir les champs de données pour les vendeurs'),(59,'create_detentor_type','Autorisé à créer des types de detenteur de matériel'),(60,'modify_detentor_type','Autorisé à modifier des types de detenteur de matériel'),(61,'delete_detentor_type','Autorisé à supprimer des types de detenteur de matériel'),(62,'view_detentor_type','Autorisé à voir les types de détenteur de matériel'),(63,'create_material','Autorisé à créer des matériels'),(64,'modify_material','Autorisé à modifier des matériels'),(65,'delete_material','Autorisé à supprimer des materiels'),(66,'view_material','Autorisé à voir les matériels'),(67,'create_spec_material','Autorisé à créer des specs pour les matériels'),(68,'modify_spec_material','Autorisé à modifier des specs pour les matériels'),(69,'delete_spec_material','Autorisé à supprimer les specs pour les matériels'),(70,'view_spec_material','Autorisé à voir les spec pour les matériels'),(71,'create_spec_type_material','Autorisé à créer des champs de spec pour les matériels'),(72,'modify_spec_type_material','Autorisé à modifier des champs de spec pour les matériels'),(73,'delete_spec_type_material','Autorisé à supprimer des champs de spec pour les matériels'),(74,'view_spec_type_material','Autorisé à voir les champs de spec pour les matériels'),(75,'create_type_material','Autorisé à créer des types de matériels'),(76,'modify_type_material','Autorisé à modifier des types de matériels'),(77,'delete_type_material','Autorisé à supprimer des types de matériels'),(78,'view_type_material','Autorisé à voir les types de matériels'),(79,'doPing','Autorisé à pinger'),(80,'delete_agency','Autorisé à supprimer une agence'),(81,'delete_user','Autorisé à supprimer un utilisateur'),(82,'create_update','Autorisé à créer une mise à jour'),(83,'modify_update','Autorisé à modifier une mise à jour'),(84,'delete_update','Autorisé à supprimer un mise à jour'),(85,'view_update','Autorisé à voir les mises à jour'),(86,'enable_disable_user','Autorisé à activer ou désactiver un utilisateur'),(87,'view_type_users','Autorisé à voir la liste des types utilisateurs'),(88,'edit_type_users','Autorisé à editer un type utilisateur'),(89,'add_type_users','Autorisé à ajouter un type utilisateur'),(90,'add_field_type_users','Autorisé à ajouter un champ pour un type utilisateur'),(91,'disable_type_users','Autorisé à désactiver un type utilisateur'),(92,'destroy_type_users','Autorisé à supprimer un type utilisateur'),(93,'unassigns_fields_type_user','Autorisé à dé-assigner des champs de type utilisateur'),(94,'delete_field_type_user','Autorisé à supprimer un champ de type utilisateur'),(95,'edit_fields_type_user','Autorisé à modifier des champs de type utilisateur'),(96,'delete_type_material_seller','Autorisé à supprimer les types de materiels que vend un vendeur'),(97,'view_field_type_users','Autorisé à voir les champs types utilisateurs'),(98,'view_field_agencies','Autorisé à voir les champs agences'),(99,'create_field_agencies','Autorisé à créer les champs agences'),(100,'update_field_agencies','Autorisé à editer les champs agences'),(101,'delete_field_agencies','Autorisé à supprimer les champs agences');
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (2,'0000-00-00 00:00:00','Asus',1),(3,'0000-00-00 00:00:00','Microsoft',1),(4,'2016-12-07 15:22:50','Sony',1),(5,'2016-12-07 15:23:55','MSI',1),(6,'2016-12-07 15:25:26','Xiaomi',1),(7,'2016-12-07 15:28:45','D-Link',0),(22,'2016-12-07 15:59:41','SAB',1),(25,'2016-12-15 10:46:30','Wiko',1),(26,'2016-12-20 14:13:33','Casino',1),(27,'2016-12-20 14:15:23','Casinoo',1),(32,'2016-12-20 14:20:27','YOO',1),(33,'2016-12-20 14:22:09','YOOs',1);
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
  `spec_material_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`material_id`,`spec_material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spec_material_materials`
--

LOCK TABLES `spec_material_materials` WRITE;
/*!40000 ALTER TABLE `spec_material_materials` DISABLE KEYS */;
INSERT INTO `spec_material_materials` VALUES (14,99),(14,100),(14,101);
/*!40000 ALTER TABLE `spec_material_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spec_materials`
--

DROP TABLE IF EXISTS `spec_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spec_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_type_material_id` int(11) DEFAULT NULL,
  `spec_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spec_materials`
--

LOCK TABLES `spec_materials` WRITE;
/*!40000 ALTER TABLE `spec_materials` DISABLE KEYS */;
INSERT INTO `spec_materials` VALUES (14,1,'0151016046041'),(19,4,'Seagate 1To'),(20,3,'1Go'),(21,2,'Intel Core i3'),(22,2,'Intel Core i5'),(23,2,'Intel Core i7'),(24,3,'2Go'),(25,3,'3Go'),(26,3,'4Go'),(27,4,'ssd250');
/*!40000 ALTER TABLE `spec_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spec_type_materials`
--

DROP TABLE IF EXISTS `spec_type_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spec_type_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spec_type_materials`
--

LOCK TABLES `spec_type_materials` WRITE;
/*!40000 ALTER TABLE `spec_type_materials` DISABLE KEYS */;
INSERT INTO `spec_type_materials` VALUES (1,'Numéro de série'),(2,'Processeur'),(3,'Mémoire RAM'),(4,'Disque dur'),(5,'Disque SSD'),(6,'Carte mère'),(7,'Carte graphique'),(10,'drghdrghrdh');
/*!40000 ALTER TABLE `spec_type_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_material_sellers`
--

DROP TABLE IF EXISTS `type_material_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_material_sellers` (
  `type_material_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_material_id`,`seller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_material_sellers`
--

LOCK TABLES `type_material_sellers` WRITE;
/*!40000 ALTER TABLE `type_material_sellers` DISABLE KEYS */;
INSERT INTO `type_material_sellers` VALUES (1,1),(1,2),(1,3),(1,5),(3,3),(3,6),(3,22),(5,2),(5,5),(5,6),(6,1),(6,5),(7,5);
/*!40000 ALTER TABLE `type_material_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_material_spec_type_materials`
--

DROP TABLE IF EXISTS `type_material_spec_type_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_material_spec_type_materials` (
  `type_material_id` int(11) NOT NULL,
  `spec_type_material_id` int(11) NOT NULL,
  PRIMARY KEY (`type_material_id`,`spec_type_material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_material_spec_type_materials`
--

LOCK TABLES `type_material_spec_type_materials` WRITE;
/*!40000 ALTER TABLE `type_material_spec_type_materials` DISABLE KEYS */;
INSERT INTO `type_material_spec_type_materials` VALUES (1,1),(1,4),(1,5),(1,6),(1,10),(2,1),(6,1),(7,1),(7,10);
/*!40000 ALTER TABLE `type_material_spec_type_materials` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_materials`
--

LOCK TABLES `type_materials` WRITE;
/*!40000 ALTER TABLE `type_materials` DISABLE KEYS */;
INSERT INTO `type_materials` VALUES (1,'Téléphone Mobile'),(2,'Téléphone fixe'),(3,'Ordinateur Fixe'),(4,'Ordinateur Portable'),(5,'Imprimantes'),(6,'Imprimantess'),(7,'Inconnu'),(9,'Pare-feux');
/*!40000 ALTER TABLE `type_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_user_rights`
--

DROP TABLE IF EXISTS `type_user_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_user_rights` (
  `right_id` int(11) NOT NULL DEFAULT '0',
  `type_user_id` int(11) NOT NULL DEFAULT '0',
  `value` tinyint(1) NOT NULL,
  PRIMARY KEY (`right_id`,`type_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_user_rights`
--

LOCK TABLES `type_user_rights` WRITE;
/*!40000 ALTER TABLE `type_user_rights` DISABLE KEYS */;
INSERT INTO `type_user_rights` VALUES (1,1,1),(1,2,1),(1,3,1),(1,4,1),(1,5,1),(1,6,1),(1,7,1),(1,8,1),(1,9,1),(1,10,1),(1,11,1),(1,12,1),(1,13,1),(1,14,1),(1,15,1),(1,16,1),(1,17,1),(1,18,1),(1,19,1),(1,20,1),(1,21,1),(1,22,1),(1,23,1),(2,1,1),(2,2,1),(2,3,1),(2,4,1),(2,5,1),(2,6,1),(2,7,1),(2,8,1),(2,9,1),(2,10,1),(2,11,1),(2,12,1),(2,13,1),(2,14,1),(2,15,1),(2,16,1),(2,17,1),(2,18,1),(2,19,1),(2,20,1),(2,21,1),(2,22,1),(2,23,0),(3,1,1),(3,2,1),(3,3,1),(3,4,1),(3,5,1),(3,6,1),(3,7,1),(3,8,1),(3,9,1),(3,10,1),(3,11,1),(3,12,1),(3,13,1),(3,14,1),(3,15,1),(3,16,1),(3,17,1),(3,18,1),(3,19,1),(3,20,1),(3,21,1),(3,22,1),(3,23,0),(4,1,1),(4,2,1),(4,3,1),(4,4,1),(4,5,1),(4,6,1),(4,7,1),(4,8,1),(4,9,1),(4,10,1),(4,11,1),(4,12,1),(4,13,1),(4,14,1),(4,15,1),(4,16,1),(4,17,1),(4,18,1),(4,19,1),(4,20,1),(4,21,1),(4,22,1),(4,23,0),(5,1,1),(5,2,1),(5,3,1),(5,4,1),(5,5,1),(5,6,1),(5,7,1),(5,8,1),(5,9,1),(5,10,1),(5,11,1),(5,12,1),(5,13,1),(5,14,1),(5,15,1),(5,16,1),(5,17,1),(5,18,1),(5,19,1),(5,20,1),(5,21,1),(5,22,1),(5,23,0),(6,1,1),(6,2,1),(6,3,1),(6,4,1),(6,5,1),(6,6,1),(6,7,1),(6,8,1),(6,9,1),(6,10,1),(6,11,1),(6,12,1),(6,13,1),(6,14,1),(6,15,1),(6,16,1),(6,17,1),(6,18,1),(6,19,1),(6,20,1),(6,21,1),(6,22,1),(6,23,1),(7,1,1),(7,2,1),(7,3,1),(7,4,1),(7,5,1),(7,6,1),(7,7,1),(7,8,1),(7,9,1),(7,10,1),(7,11,1),(7,12,1),(7,13,1),(7,14,1),(7,15,1),(7,16,1),(7,17,1),(7,18,1),(7,19,1),(7,20,1),(7,21,1),(7,22,1),(7,23,0),(8,1,1),(8,2,1),(8,3,1),(8,4,1),(8,5,1),(8,6,1),(8,7,1),(8,8,1),(8,9,1),(8,10,1),(8,11,1),(8,12,1),(8,13,1),(8,14,1),(8,15,1),(8,16,1),(8,17,1),(8,18,1),(8,19,1),(8,20,1),(8,21,1),(8,22,1),(8,23,0),(9,1,1),(9,2,1),(9,3,1),(9,4,1),(9,5,1),(9,6,1),(9,7,1),(9,8,1),(9,9,1),(9,10,1),(9,11,1),(9,12,1),(9,13,1),(9,14,1),(9,15,1),(9,16,1),(9,17,1),(9,18,1),(9,19,1),(9,20,1),(9,21,1),(9,22,1),(9,23,1),(10,1,1),(10,2,1),(10,3,1),(10,4,1),(10,5,1),(10,6,1),(10,7,1),(10,8,1),(10,9,1),(10,10,1),(10,11,1),(10,12,1),(10,13,1),(10,14,1),(10,15,1),(10,16,1),(10,17,1),(10,18,1),(10,19,1),(10,20,1),(10,21,1),(10,22,1),(10,23,1),(11,1,1),(11,2,1),(11,3,1),(11,4,1),(11,5,1),(11,6,1),(11,7,1),(11,8,1),(11,9,1),(11,10,1),(11,11,1),(11,12,1),(11,13,1),(11,14,1),(11,15,1),(11,16,1),(11,17,1),(11,18,1),(11,19,1),(11,20,1),(11,21,1),(11,22,1),(11,23,1),(12,1,1),(12,2,1),(12,3,1),(12,4,1),(12,5,1),(12,6,1),(12,7,1),(12,8,1),(12,9,1),(12,10,1),(12,11,1),(12,12,1),(12,13,1),(12,14,1),(12,15,1),(12,16,1),(12,17,1),(12,18,1),(12,19,1),(12,20,1),(12,21,1),(12,22,1),(12,23,1),(13,1,1),(13,2,1),(13,3,1),(13,4,1),(13,5,1),(13,6,1),(13,7,1),(13,8,1),(13,9,1),(13,10,1),(13,11,1),(13,12,1),(13,13,1),(13,14,1),(13,15,1),(13,16,1),(13,17,1),(13,18,1),(13,19,1),(13,20,1),(13,21,1),(13,22,1),(13,23,1),(14,1,1),(14,2,1),(14,3,1),(14,4,1),(14,5,1),(14,6,1),(14,7,1),(14,8,1),(14,9,1),(14,10,1),(14,11,1),(14,12,1),(14,13,1),(14,14,1),(14,15,1),(14,16,1),(14,17,1),(14,18,1),(14,19,1),(14,20,1),(14,21,1),(14,22,1),(14,23,1),(15,1,1),(15,2,1),(15,3,1),(15,4,1),(15,5,1),(15,6,1),(15,7,1),(15,8,1),(15,9,1),(15,10,1),(15,11,1),(15,12,1),(15,13,1),(15,14,1),(15,15,1),(15,16,1),(15,17,1),(15,18,1),(15,19,1),(15,20,1),(15,21,1),(15,22,1),(15,23,1),(16,1,1),(16,2,1),(16,3,1),(16,4,1),(16,5,1),(16,6,1),(16,7,1),(16,8,1),(16,9,1),(16,10,1),(16,11,1),(16,12,1),(16,13,1),(16,14,1),(16,15,1),(16,16,1),(16,17,1),(16,18,1),(16,19,1),(16,20,1),(16,21,1),(16,22,1),(16,23,1),(17,1,1),(17,2,1),(17,3,1),(17,4,1),(17,5,1),(17,6,1),(17,7,1),(17,8,1),(17,9,1),(17,10,1),(17,11,1),(17,12,1),(17,13,1),(17,14,1),(17,15,1),(17,16,1),(17,17,1),(17,18,1),(17,19,1),(17,20,1),(17,21,1),(17,22,1),(17,23,1),(18,1,1),(18,2,1),(18,3,1),(18,4,1),(18,5,1),(18,6,1),(18,7,1),(18,8,1),(18,9,1),(18,10,1),(18,11,1),(18,12,1),(18,13,1),(18,14,1),(18,15,1),(18,16,1),(18,17,1),(18,18,1),(18,19,1),(18,20,1),(18,21,1),(18,22,1),(18,23,1),(19,1,1),(19,2,1),(19,3,1),(19,4,1),(19,5,1),(19,6,1),(19,7,1),(19,8,1),(19,9,1),(19,10,1),(19,11,1),(19,12,1),(19,13,1),(19,14,1),(19,15,1),(19,16,1),(19,17,1),(19,18,1),(19,19,1),(19,20,1),(19,21,1),(19,22,1),(19,23,1),(20,1,1),(20,2,1),(20,3,1),(20,4,1),(20,5,1),(20,6,1),(20,7,1),(20,8,1),(20,9,1),(20,10,1),(20,11,1),(20,12,1),(20,13,1),(20,14,1),(20,15,1),(20,16,1),(20,17,1),(20,18,1),(20,19,1),(20,20,1),(20,21,1),(20,22,1),(20,23,1),(21,1,1),(21,2,1),(21,3,1),(21,4,1),(21,5,1),(21,6,1),(21,7,1),(21,8,1),(21,9,1),(21,10,1),(21,11,1),(21,12,1),(21,13,1),(21,14,1),(21,15,1),(21,16,1),(21,17,1),(21,18,1),(21,19,1),(21,20,1),(21,21,1),(21,22,1),(21,23,1),(22,1,1),(22,2,1),(22,3,1),(22,4,1),(22,5,1),(22,6,1),(22,7,1),(22,8,1),(22,9,1),(22,10,1),(22,11,1),(22,12,1),(22,13,1),(22,14,1),(22,15,1),(22,16,1),(22,17,1),(22,18,1),(22,19,1),(22,20,1),(22,21,1),(22,22,1),(22,23,1),(23,1,1),(23,2,1),(23,3,1),(23,4,1),(23,5,1),(23,6,1),(23,7,1),(23,8,1),(23,9,1),(23,10,1),(23,11,1),(23,12,1),(23,13,1),(23,14,1),(23,15,1),(23,16,1),(23,17,1),(23,18,1),(23,19,1),(23,20,1),(23,21,1),(23,22,1),(23,23,0),(24,1,1),(24,2,1),(24,3,1),(24,4,1),(24,5,1),(24,6,1),(24,7,1),(24,8,1),(24,9,1),(24,10,1),(24,11,1),(24,12,1),(24,13,1),(24,14,1),(24,15,1),(24,16,1),(24,17,1),(24,18,1),(24,19,1),(24,20,1),(24,21,1),(24,22,1),(24,23,0),(25,1,1),(25,2,1),(25,3,1),(25,4,1),(25,5,1),(25,6,1),(25,7,1),(25,8,1),(25,9,1),(25,10,1),(25,11,1),(25,12,1),(25,13,1),(25,14,1),(25,15,1),(25,16,1),(25,17,1),(25,18,1),(25,19,1),(25,20,1),(25,21,1),(25,22,1),(25,23,1),(26,1,1),(26,2,1),(26,3,1),(26,4,1),(26,5,1),(26,6,1),(26,7,1),(26,8,1),(26,9,1),(26,10,1),(26,11,1),(26,12,1),(26,13,1),(26,14,1),(26,15,1),(26,16,1),(26,17,1),(26,18,1),(26,19,1),(26,20,1),(26,21,1),(26,22,1),(26,23,1),(27,1,1),(27,2,1),(27,3,1),(27,4,1),(27,5,1),(27,6,1),(27,7,1),(27,8,1),(27,9,1),(27,10,1),(27,11,1),(27,12,1),(27,13,1),(27,14,1),(27,15,1),(27,16,1),(27,17,1),(27,18,1),(27,19,1),(27,20,1),(27,21,1),(27,22,1),(27,23,1),(28,1,1),(28,2,1),(28,3,1),(28,4,1),(28,5,1),(28,6,1),(28,7,1),(28,8,1),(28,9,1),(28,10,1),(28,11,1),(28,12,1),(28,13,1),(28,14,1),(28,15,1),(28,16,1),(28,17,1),(28,18,1),(28,19,1),(28,20,1),(28,21,1),(28,22,1),(28,23,1),(29,1,1),(29,2,1),(29,3,1),(29,4,1),(29,5,1),(29,6,1),(29,7,1),(29,8,1),(29,9,1),(29,10,1),(29,11,1),(29,12,1),(29,13,1),(29,14,1),(29,15,1),(29,16,1),(29,17,1),(29,18,1),(29,19,1),(29,20,1),(29,21,1),(29,22,1),(29,23,1),(30,1,1),(30,2,1),(30,3,1),(30,4,1),(30,5,1),(30,6,1),(30,7,1),(30,8,1),(30,9,1),(30,10,1),(30,11,1),(30,12,1),(30,13,1),(30,14,1),(30,15,1),(30,16,1),(30,17,1),(30,18,1),(30,19,1),(30,20,1),(30,21,1),(30,22,1),(30,23,0),(31,1,1),(31,2,1),(31,3,1),(31,4,1),(31,5,1),(31,6,1),(31,7,1),(31,8,1),(31,9,1),(31,10,1),(31,11,1),(31,12,1),(31,13,1),(31,14,1),(31,15,1),(31,16,1),(31,17,1),(31,18,1),(31,19,1),(31,20,1),(31,21,1),(31,22,1),(31,23,1),(32,1,1),(32,2,1),(32,3,1),(32,4,1),(32,5,1),(32,6,1),(32,7,1),(32,8,1),(32,9,1),(32,10,1),(32,11,1),(32,12,1),(32,13,1),(32,14,1),(32,15,1),(32,16,1),(32,17,1),(32,18,1),(32,19,1),(32,20,1),(32,21,1),(32,22,1),(32,23,1),(33,1,1),(33,2,1),(33,3,1),(33,4,1),(33,5,1),(33,6,1),(33,7,1),(33,8,1),(33,9,1),(33,10,1),(33,11,1),(33,12,1),(33,13,1),(33,14,1),(33,15,1),(33,16,1),(33,17,1),(33,18,1),(33,19,1),(33,20,1),(33,21,1),(33,22,1),(33,23,0),(34,1,1),(34,2,1),(34,3,1),(34,4,1),(34,5,1),(34,6,1),(34,7,1),(34,8,1),(34,9,1),(34,10,1),(34,11,1),(34,12,1),(34,13,1),(34,14,1),(34,15,1),(34,16,1),(34,17,1),(34,18,1),(34,19,1),(34,20,1),(34,21,1),(34,22,1),(34,23,0),(35,1,1),(35,2,1),(35,3,1),(35,4,1),(35,5,1),(35,6,1),(35,7,1),(35,8,1),(35,9,1),(35,10,1),(35,11,1),(35,12,1),(35,13,1),(35,14,1),(35,15,1),(35,16,1),(35,17,1),(35,18,1),(35,19,1),(35,20,1),(35,21,1),(35,22,1),(35,23,1),(36,1,1),(36,2,1),(36,3,1),(36,4,1),(36,5,1),(36,6,1),(36,7,1),(36,8,1),(36,9,1),(36,10,1),(36,11,1),(36,12,1),(36,13,1),(36,14,1),(36,15,1),(36,16,1),(36,17,1),(36,18,1),(36,19,1),(36,20,1),(36,21,1),(36,22,1),(36,23,0),(37,1,1),(37,2,1),(37,3,1),(37,4,1),(37,5,1),(37,6,1),(37,7,1),(37,8,1),(37,9,1),(37,10,1),(37,11,1),(37,12,1),(37,13,1),(37,14,1),(37,15,1),(37,16,1),(37,17,1),(37,18,1),(37,19,1),(37,20,1),(37,21,1),(37,22,1),(37,23,0),(38,1,1),(38,2,1),(38,3,1),(38,4,1),(38,5,1),(38,6,1),(38,7,1),(38,8,1),(38,9,1),(38,10,1),(38,11,1),(38,12,1),(38,13,1),(38,14,1),(38,15,1),(38,16,1),(38,17,1),(38,18,1),(38,19,1),(38,20,1),(38,21,1),(38,22,1),(38,23,0),(39,1,1),(39,2,1),(39,3,1),(39,4,1),(39,5,1),(39,6,1),(39,7,1),(39,8,1),(39,9,1),(39,10,1),(39,11,1),(39,12,1),(39,13,1),(39,14,1),(39,15,1),(39,16,1),(39,17,1),(39,18,1),(39,19,1),(39,20,1),(39,21,1),(39,22,1),(39,23,1),(40,1,1),(40,2,1),(40,3,1),(40,4,1),(40,5,1),(40,6,1),(40,7,1),(40,8,1),(40,9,1),(40,10,1),(40,11,1),(40,12,1),(40,13,1),(40,14,1),(40,15,1),(40,16,1),(40,17,1),(40,18,1),(40,19,1),(40,20,1),(40,21,1),(40,22,1),(40,23,0),(41,1,1),(41,2,1),(41,3,1),(41,4,1),(41,5,1),(41,6,1),(41,7,1),(41,8,1),(41,9,1),(41,10,1),(41,11,1),(41,12,1),(41,13,1),(41,14,1),(41,15,1),(41,16,1),(41,17,1),(41,18,1),(41,19,1),(41,20,1),(41,21,1),(41,22,1),(41,23,0),(42,1,1),(42,2,1),(42,3,1),(42,4,1),(42,5,1),(42,6,1),(42,7,1),(42,8,1),(42,9,1),(42,10,1),(42,11,1),(42,12,1),(42,13,1),(42,14,1),(42,15,1),(42,16,1),(42,17,1),(42,18,1),(42,19,1),(42,20,1),(42,21,1),(42,22,1),(42,23,0),(43,1,1),(43,2,1),(43,3,1),(43,4,1),(43,5,1),(43,6,1),(43,7,1),(43,8,1),(43,9,1),(43,10,1),(43,11,1),(43,12,1),(43,13,1),(43,14,1),(43,15,1),(43,16,1),(43,17,1),(43,18,1),(43,19,1),(43,20,1),(43,21,1),(43,22,1),(43,23,0),(44,1,1),(44,2,1),(44,3,1),(44,4,1),(44,5,1),(44,6,1),(44,7,1),(44,8,1),(44,9,1),(44,10,1),(44,11,1),(44,12,1),(44,13,1),(44,14,1),(44,15,1),(44,16,1),(44,17,1),(44,18,1),(44,19,1),(44,20,1),(44,21,1),(44,22,1),(44,23,0),(45,1,1),(45,2,1),(45,3,1),(45,4,1),(45,5,1),(45,6,1),(45,7,1),(45,8,1),(45,9,1),(45,10,1),(45,11,1),(45,12,1),(45,13,1),(45,14,1),(45,15,1),(45,16,1),(45,17,1),(45,18,1),(45,19,1),(45,20,1),(45,21,1),(45,22,1),(45,23,0),(46,1,1),(46,2,1),(46,3,1),(46,4,1),(46,5,1),(46,6,1),(46,7,1),(46,8,1),(46,9,1),(46,10,1),(46,11,1),(46,12,1),(46,13,1),(46,14,1),(46,15,1),(46,16,1),(46,17,1),(46,18,1),(46,19,1),(46,20,1),(46,21,1),(46,22,1),(46,23,1),(47,1,1),(47,2,1),(47,3,1),(47,4,1),(47,5,1),(47,6,1),(47,7,1),(47,8,1),(47,9,1),(47,10,1),(47,11,1),(47,12,1),(47,13,1),(47,14,1),(47,15,1),(47,16,1),(47,17,1),(47,18,1),(47,19,1),(47,20,1),(47,21,1),(47,22,1),(47,23,0),(48,1,1),(48,2,1),(48,3,1),(48,4,1),(48,5,1),(48,6,1),(48,7,1),(48,8,1),(48,9,1),(48,10,1),(48,11,1),(48,12,1),(48,13,1),(48,14,1),(48,15,1),(48,16,1),(48,17,1),(48,18,1),(48,19,1),(48,20,1),(48,21,1),(48,22,1),(48,23,0),(49,1,1),(49,2,1),(49,3,1),(49,4,1),(49,5,1),(49,6,1),(49,7,1),(49,8,1),(49,9,1),(49,10,1),(49,11,1),(49,12,1),(49,13,1),(49,14,1),(49,15,1),(49,16,1),(49,17,1),(49,18,1),(49,19,1),(49,20,1),(49,21,1),(49,22,1),(49,23,0),(50,1,1),(50,2,1),(50,3,1),(50,4,1),(50,5,1),(50,6,1),(50,7,1),(50,8,1),(50,9,1),(50,10,1),(50,11,1),(50,12,1),(50,13,1),(50,14,1),(50,15,1),(50,16,1),(50,17,1),(50,18,1),(50,19,1),(50,20,1),(50,21,1),(50,22,1),(50,23,0),(51,1,1),(51,2,1),(51,3,1),(51,4,1),(51,5,1),(51,6,1),(51,7,1),(51,8,1),(51,9,1),(51,10,1),(51,11,1),(51,12,1),(51,13,1),(51,14,1),(51,15,1),(51,16,1),(51,17,1),(51,18,1),(51,19,1),(51,20,1),(51,21,1),(51,22,1),(51,23,0),(52,1,1),(52,2,1),(52,3,1),(52,4,1),(52,5,1),(52,6,1),(52,7,1),(52,8,1),(52,9,1),(52,10,1),(52,11,1),(52,12,1),(52,13,1),(52,14,1),(52,15,1),(52,16,1),(52,17,1),(52,18,1),(52,19,1),(52,20,1),(52,21,1),(52,22,1),(52,23,0),(53,1,1),(53,2,1),(53,3,1),(53,4,1),(53,5,1),(53,6,1),(53,7,1),(53,8,1),(53,9,1),(53,10,1),(53,11,1),(53,12,1),(53,13,1),(53,14,1),(53,15,1),(53,16,1),(53,17,1),(53,18,1),(53,19,1),(53,20,1),(53,21,1),(53,22,1),(53,23,0),(54,1,1),(54,2,1),(54,3,1),(54,4,1),(54,5,1),(54,6,1),(54,7,1),(54,8,1),(54,9,1),(54,10,1),(54,11,1),(54,12,1),(54,13,1),(54,14,1),(54,15,1),(54,16,1),(54,17,1),(54,18,1),(54,19,1),(54,20,1),(54,21,1),(54,22,1),(54,23,0),(55,1,1),(55,2,1),(55,3,1),(55,4,1),(55,5,1),(55,6,1),(55,7,1),(55,8,1),(55,9,1),(55,10,1),(55,11,1),(55,12,1),(55,13,1),(55,14,1),(55,15,1),(55,16,1),(55,17,1),(55,18,1),(55,19,1),(55,20,1),(55,21,1),(55,22,1),(55,23,0),(56,1,1),(56,2,1),(56,3,1),(56,4,1),(56,5,1),(56,6,1),(56,7,1),(56,8,1),(56,9,1),(56,10,1),(56,11,1),(56,12,1),(56,13,1),(56,14,1),(56,15,1),(56,16,1),(56,17,1),(56,18,1),(56,19,1),(56,20,1),(56,21,1),(56,22,1),(56,23,0),(57,1,1),(57,2,1),(57,3,1),(57,4,1),(57,5,1),(57,6,1),(57,7,1),(57,8,1),(57,9,1),(57,10,1),(57,11,1),(57,12,1),(57,13,1),(57,14,1),(57,15,1),(57,16,1),(57,17,1),(57,18,1),(57,19,1),(57,20,1),(57,21,1),(57,22,1),(57,23,0),(58,1,1),(58,2,1),(58,3,1),(58,4,1),(58,5,1),(58,6,1),(58,7,1),(58,8,1),(58,9,1),(58,10,1),(58,11,1),(58,12,1),(58,13,1),(58,14,1),(58,15,1),(58,16,1),(58,17,1),(58,18,1),(58,19,1),(58,20,1),(58,21,1),(58,22,1),(58,23,0),(59,1,1),(59,2,1),(59,3,1),(59,4,1),(59,5,1),(59,6,1),(59,7,1),(59,8,1),(59,9,1),(59,10,1),(59,11,1),(59,12,1),(59,13,1),(59,14,1),(59,15,1),(59,16,1),(59,17,1),(59,18,1),(59,19,1),(59,20,1),(59,21,1),(59,22,1),(59,23,0),(60,1,1),(60,2,1),(60,3,1),(60,4,1),(60,5,1),(60,6,1),(60,7,1),(60,8,1),(60,9,1),(60,10,1),(60,11,1),(60,12,1),(60,13,1),(60,14,1),(60,15,1),(60,16,1),(60,17,1),(60,18,1),(60,19,1),(60,20,1),(60,21,1),(60,22,1),(60,23,0),(61,1,1),(61,2,1),(61,3,1),(61,4,1),(61,5,1),(61,6,1),(61,7,1),(61,8,1),(61,9,1),(61,10,1),(61,11,1),(61,12,1),(61,13,1),(61,14,1),(61,15,1),(61,16,1),(61,17,1),(61,18,1),(61,19,1),(61,20,1),(61,21,1),(61,22,1),(61,23,0),(62,1,1),(62,2,1),(62,3,1),(62,4,1),(62,5,1),(62,6,1),(62,7,1),(62,8,1),(62,9,1),(62,10,1),(62,11,1),(62,12,1),(62,13,1),(62,14,1),(62,15,1),(62,16,1),(62,17,1),(62,18,1),(62,19,1),(62,20,1),(62,21,1),(62,22,1),(62,23,0),(63,1,1),(63,2,1),(63,3,1),(63,4,1),(63,5,1),(63,6,1),(63,7,1),(63,8,1),(63,9,1),(63,10,1),(63,11,1),(63,12,1),(63,13,1),(63,14,1),(63,15,1),(63,16,1),(63,17,1),(63,18,1),(63,19,1),(63,20,1),(63,21,1),(63,22,1),(63,23,0),(64,1,1),(64,2,1),(64,3,1),(64,4,1),(64,5,1),(64,6,1),(64,7,1),(64,8,1),(64,9,1),(64,10,1),(64,11,1),(64,12,1),(64,13,1),(64,14,1),(64,15,1),(64,16,1),(64,17,1),(64,18,1),(64,19,1),(64,20,1),(64,21,1),(64,22,1),(64,23,0),(65,1,1),(65,2,1),(65,3,1),(65,4,1),(65,5,1),(65,6,1),(65,7,1),(65,8,1),(65,9,1),(65,10,1),(65,11,1),(65,12,1),(65,13,1),(65,14,1),(65,15,1),(65,16,1),(65,17,1),(65,18,1),(65,19,1),(65,20,1),(65,21,1),(65,22,1),(65,23,0),(66,1,1),(66,2,1),(66,3,1),(66,4,1),(66,5,1),(66,6,1),(66,7,1),(66,8,1),(66,9,1),(66,10,1),(66,11,1),(66,12,1),(66,13,1),(66,14,1),(66,15,1),(66,16,1),(66,17,1),(66,18,1),(66,19,1),(66,20,1),(66,21,1),(66,22,1),(66,23,0),(67,1,1),(67,2,1),(67,3,1),(67,4,1),(67,5,1),(67,6,1),(67,7,1),(67,8,1),(67,9,1),(67,10,1),(67,11,1),(67,12,1),(67,13,1),(67,14,1),(67,15,1),(67,16,1),(67,17,1),(67,18,1),(67,19,1),(67,20,1),(67,21,1),(67,22,1),(67,23,0),(68,1,1),(68,2,1),(68,3,1),(68,4,1),(68,5,1),(68,6,1),(68,7,1),(68,8,1),(68,9,1),(68,10,1),(68,11,1),(68,12,1),(68,13,1),(68,14,1),(68,15,1),(68,16,1),(68,17,1),(68,18,1),(68,19,1),(68,20,1),(68,21,1),(68,22,1),(68,23,0),(69,1,1),(69,2,1),(69,3,1),(69,4,1),(69,5,1),(69,6,1),(69,7,1),(69,8,1),(69,9,1),(69,10,1),(69,11,1),(69,12,1),(69,13,1),(69,14,1),(69,15,1),(69,16,1),(69,17,1),(69,18,1),(69,19,1),(69,20,1),(69,21,1),(69,22,1),(69,23,0),(70,1,1),(70,2,1),(70,3,1),(70,4,1),(70,5,1),(70,6,1),(70,7,1),(70,8,1),(70,9,1),(70,10,1),(70,11,1),(70,12,1),(70,13,1),(70,14,1),(70,15,1),(70,16,1),(70,17,1),(70,18,1),(70,19,1),(70,20,1),(70,21,1),(70,22,1),(70,23,0),(71,1,1),(71,2,1),(71,3,1),(71,4,1),(71,5,1),(71,6,1),(71,7,1),(71,8,1),(71,9,1),(71,10,1),(71,11,1),(71,12,1),(71,13,1),(71,14,1),(71,15,1),(71,16,1),(71,17,1),(71,18,1),(71,19,1),(71,20,1),(71,21,1),(71,22,1),(71,23,0),(72,1,1),(72,2,1),(72,3,1),(72,4,1),(72,5,1),(72,6,1),(72,7,1),(72,8,1),(72,9,1),(72,10,1),(72,11,1),(72,12,1),(72,13,1),(72,14,1),(72,15,1),(72,16,1),(72,17,1),(72,18,1),(72,19,1),(72,20,1),(72,21,1),(72,22,1),(72,23,0),(73,1,1),(73,2,1),(73,3,1),(73,4,1),(73,5,1),(73,6,1),(73,7,1),(73,8,1),(73,9,1),(73,10,1),(73,11,1),(73,12,1),(73,13,1),(73,14,1),(73,15,1),(73,16,1),(73,17,1),(73,18,1),(73,19,1),(73,20,1),(73,21,1),(73,22,1),(73,23,0),(74,1,1),(74,2,1),(74,3,1),(74,4,1),(74,5,1),(74,6,1),(74,7,1),(74,8,1),(74,9,1),(74,10,1),(74,11,1),(74,12,1),(74,13,1),(74,14,1),(74,15,1),(74,16,1),(74,17,1),(74,18,1),(74,19,1),(74,20,1),(74,21,1),(74,22,1),(74,23,0),(75,1,1),(75,2,1),(75,3,1),(75,4,1),(75,5,1),(75,6,1),(75,7,1),(75,8,1),(75,9,1),(75,10,1),(75,11,1),(75,12,1),(75,13,1),(75,14,1),(75,15,1),(75,16,1),(75,17,1),(75,18,1),(75,19,1),(75,20,1),(75,21,1),(75,22,1),(75,23,0),(76,1,1),(76,2,1),(76,3,1),(76,4,1),(76,5,1),(76,6,1),(76,7,1),(76,8,1),(76,9,1),(76,10,1),(76,11,1),(76,12,1),(76,13,1),(76,14,1),(76,15,1),(76,16,1),(76,17,1),(76,18,1),(76,19,1),(76,20,1),(76,21,1),(76,22,1),(76,23,0),(77,1,1),(77,2,1),(77,3,1),(77,4,1),(77,5,1),(77,6,1),(77,7,1),(77,8,1),(77,9,1),(77,10,1),(77,11,1),(77,12,1),(77,13,1),(77,14,1),(77,15,1),(77,16,1),(77,17,1),(77,18,1),(77,19,1),(77,20,1),(77,21,1),(77,22,1),(77,23,0),(78,1,1),(78,2,1),(78,3,1),(78,4,1),(78,5,1),(78,6,1),(78,7,1),(78,8,1),(78,9,1),(78,10,1),(78,11,1),(78,12,1),(78,13,1),(78,14,1),(78,15,1),(78,16,1),(78,17,1),(78,18,1),(78,19,1),(78,20,1),(78,21,1),(78,22,1),(78,23,0),(79,1,1),(79,2,1),(79,3,1),(79,4,1),(79,5,1),(79,6,1),(79,7,1),(79,8,1),(79,9,1),(79,10,1),(79,11,1),(79,12,1),(79,13,1),(79,14,1),(79,15,1),(79,16,1),(79,17,1),(79,18,1),(79,19,1),(79,20,1),(79,21,1),(79,22,1),(79,23,0),(80,1,1),(80,2,1),(80,3,1),(80,4,1),(80,5,1),(80,6,1),(80,7,1),(80,8,1),(80,9,1),(80,10,1),(80,11,1),(80,12,1),(80,13,1),(80,14,1),(80,15,1),(80,16,1),(80,17,1),(80,18,1),(80,19,1),(80,20,1),(80,21,1),(80,22,1),(80,23,0),(81,1,1),(81,2,1),(81,3,1),(81,4,1),(81,5,1),(81,6,1),(81,7,1),(81,8,1),(81,9,1),(81,10,1),(81,11,1),(81,12,1),(81,13,1),(81,14,1),(81,15,1),(81,16,1),(81,17,1),(81,18,1),(81,19,1),(81,20,1),(81,21,1),(81,22,1),(81,23,0),(82,1,1),(82,2,1),(82,3,1),(82,4,1),(82,5,1),(82,6,1),(82,7,1),(82,8,1),(82,9,1),(82,10,1),(82,11,1),(82,12,1),(82,13,1),(82,14,1),(82,15,1),(82,16,1),(82,17,1),(82,18,1),(82,19,1),(82,20,1),(82,21,1),(82,22,1),(82,23,0),(83,1,1),(83,2,1),(83,3,1),(83,4,1),(83,5,1),(83,6,1),(83,7,1),(83,8,1),(83,9,1),(83,10,1),(83,11,1),(83,12,1),(83,13,1),(83,14,1),(83,15,1),(83,16,1),(83,17,1),(83,18,1),(83,19,1),(83,20,1),(83,21,1),(83,22,1),(83,23,0),(84,1,1),(84,2,1),(84,3,1),(84,4,1),(84,5,1),(84,6,1),(84,7,1),(84,8,1),(84,9,1),(84,10,1),(84,11,1),(84,12,1),(84,13,1),(84,14,1),(84,15,1),(84,16,1),(84,17,1),(84,18,1),(84,19,1),(84,20,1),(84,21,1),(84,22,1),(84,23,0),(85,1,1),(85,2,1),(85,3,1),(85,4,1),(85,5,1),(85,6,1),(85,7,1),(85,8,1),(85,9,1),(85,10,1),(85,11,1),(85,12,1),(85,13,1),(85,14,1),(85,15,1),(85,16,1),(85,17,1),(85,18,1),(85,19,1),(85,20,1),(85,21,1),(85,22,1),(85,23,0),(86,1,1),(86,2,1),(86,3,1),(86,4,1),(86,5,1),(86,6,1),(86,7,1),(86,8,1),(86,9,1),(86,10,1),(86,11,1),(86,12,1),(86,13,1),(86,14,1),(86,15,1),(86,16,1),(86,17,1),(86,18,1),(86,19,1),(86,20,1),(86,21,1),(86,22,1),(86,23,0),(87,1,1),(87,2,1),(87,3,1),(87,4,1),(87,5,1),(87,6,1),(87,7,1),(87,8,1),(87,9,1),(87,10,1),(87,11,1),(87,12,1),(87,13,1),(87,14,1),(87,15,1),(87,16,1),(87,17,1),(87,18,1),(87,19,1),(87,20,1),(87,21,1),(87,22,1),(87,23,0),(88,1,1),(88,2,1),(88,3,1),(88,4,1),(88,5,1),(88,6,1),(88,7,1),(88,8,1),(88,9,1),(88,10,1),(88,11,1),(88,12,1),(88,13,1),(88,14,1),(88,15,1),(88,16,1),(88,17,1),(88,18,1),(88,19,1),(88,20,1),(88,21,1),(88,22,1),(88,23,0),(89,1,1),(89,2,1),(89,3,1),(89,4,1),(89,5,1),(89,6,1),(89,7,1),(89,8,1),(89,9,1),(89,10,1),(89,11,1),(89,12,1),(89,13,1),(89,14,1),(89,15,1),(89,16,1),(89,17,1),(89,18,1),(89,19,1),(89,20,1),(89,21,1),(89,22,1),(89,23,0),(90,1,1),(90,2,1),(90,3,1),(90,4,1),(90,5,1),(90,6,1),(90,7,1),(90,8,1),(90,9,1),(90,10,1),(90,11,1),(90,12,1),(90,13,1),(90,14,1),(90,15,1),(90,16,1),(90,17,1),(90,18,1),(90,19,1),(90,20,1),(90,21,1),(90,22,1),(90,23,0),(91,1,1),(91,2,1),(91,3,1),(91,4,1),(91,5,1),(91,6,1),(91,7,1),(91,8,1),(91,9,1),(91,10,1),(91,11,1),(91,12,1),(91,13,1),(91,14,1),(91,15,1),(91,16,1),(91,17,1),(91,18,1),(91,19,1),(91,20,1),(91,21,1),(91,22,1),(91,23,0),(92,1,1),(92,2,1),(92,3,1),(92,4,1),(92,5,1),(92,6,1),(92,7,1),(92,8,1),(92,9,1),(92,10,1),(92,11,1),(92,12,1),(92,13,1),(92,14,1),(92,15,1),(92,16,1),(92,17,1),(92,18,1),(92,19,1),(92,20,1),(92,21,1),(92,22,1),(92,23,0),(93,1,1),(93,2,1),(93,3,1),(93,4,1),(93,5,1),(93,6,1),(93,7,1),(93,8,1),(93,9,1),(93,10,1),(93,11,1),(93,12,1),(93,13,1),(93,14,1),(93,15,1),(93,16,1),(93,17,1),(93,18,1),(93,19,1),(93,20,1),(93,21,1),(93,22,1),(93,23,0),(94,1,1),(94,2,1),(94,3,1),(94,4,1),(94,5,1),(94,6,1),(94,7,1),(94,8,1),(94,9,1),(94,10,1),(94,11,1),(94,12,1),(94,13,1),(94,14,1),(94,15,1),(94,16,1),(94,17,1),(94,18,1),(94,19,1),(94,20,1),(94,21,1),(94,22,1),(94,23,0),(95,1,1),(95,2,1),(95,3,1),(95,4,1),(95,5,1),(95,6,1),(95,7,1),(95,8,1),(95,9,1),(95,10,1),(95,11,1),(95,12,1),(95,13,1),(95,14,1),(95,15,1),(95,16,1),(95,17,1),(95,18,1),(95,19,1),(95,20,1),(95,21,1),(95,22,1),(95,23,0),(96,1,1),(96,2,1),(96,3,1),(96,4,1),(96,5,1),(96,6,1),(96,7,1),(96,8,1),(96,9,1),(96,10,1),(96,11,1),(96,12,1),(96,13,1),(96,14,1),(96,15,1),(96,16,1),(96,17,1),(96,18,1),(96,19,1),(96,20,1),(96,21,1),(96,22,1),(96,23,1),(97,1,1),(97,2,1),(97,3,1),(97,4,1),(97,5,1),(97,6,1),(97,7,1),(97,8,1),(97,9,1),(97,10,1),(97,11,1),(97,12,1),(97,13,1),(97,14,1),(97,15,1),(97,16,1),(97,17,1),(97,18,1),(97,19,1),(97,20,1),(97,21,1),(97,22,1),(97,23,1),(98,1,1),(98,2,1),(98,3,1),(98,4,1),(98,5,1),(98,6,1),(98,7,1),(98,8,1),(98,9,1),(98,10,1),(98,11,1),(98,12,1),(98,13,1),(98,14,1),(98,15,1),(98,16,1),(98,17,1),(98,18,1),(98,19,1),(98,20,1),(98,21,1),(98,22,1),(98,23,1),(99,1,1),(99,2,1),(99,3,1),(99,4,1),(99,5,1),(99,6,1),(99,7,1),(99,8,1),(99,9,1),(99,10,1),(99,11,1),(99,12,1),(99,13,1),(99,14,1),(99,15,1),(99,16,1),(99,17,1),(99,18,1),(99,19,1),(99,20,1),(99,21,1),(99,22,1),(99,23,1),(100,1,1),(100,2,1),(100,3,1),(100,4,1),(100,5,1),(100,6,1),(100,7,1),(100,8,1),(100,9,1),(100,10,1),(100,11,1),(100,12,1),(100,13,1),(100,14,1),(100,15,1),(100,16,1),(100,17,1),(100,18,1),(100,19,1),(100,20,1),(100,21,1),(100,22,1),(100,23,1),(101,1,1),(101,2,1),(101,3,1),(101,4,1),(101,5,1),(101,6,1),(101,7,1),(101,8,1),(101,9,1),(101,10,1),(101,11,1),(101,12,1),(101,13,1),(101,14,1),(101,15,1),(101,16,1),(101,17,1),(101,18,1),(101,19,1),(101,20,1),(101,21,1),(101,22,1),(101,23,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jm','jeremy.montesinos@cle-expertises.fr','0788607459',' ',NULL,2,'2015-11-23 14:03:05','2016-12-19 16:22:08','192.168.10.48',1,0,1,'Jeremy','Montesinos'),(4,'jerome.guillot','bujghuikhgidshilfhizsefh@yopmail.com','0683039620','sonya88','',2,'2015-12-09 09:47:39','2016-08-05 14:53:38','',2,0,1,'Jerome','Guillot'),(5,'yvon.partoo','bujghuikhgidshilfhizsefh@yopmail.com','0555555555',' ','',2,'2015-12-16 08:27:43','2016-08-05 14:53:38','',3,0,1,'Yvon','Partoo'),(6,'guy.schwalm','bujghuikhgidshilfhizsefh@yopmail.com','0622634975','Volu348%',NULL,2,'2016-01-08 11:07:30','2016-08-05 14:53:38',NULL,4,0,1,'Guy','Schwalm'),(7,'germaine.tapeautour','bujghuikhgidshilfhizsefh@yopmail.com','0666666666',' ',NULL,2,'2016-02-02 08:50:03','2016-08-24 12:52:15',NULL,5,0,1,'Germaine','Tapeautour'),(8,'carole.naudin','bujghuikhgidshilfhizsefh@yopmail.com','0467998164',' ',NULL,2,'2016-02-08 10:37:23','2016-08-05 14:53:38',NULL,6,0,1,'Carole','Naudin'),(9,'yasmina.eude','bujghuikhgidshilfhizsefh@yopmail.com','0467999067',' ',NULL,2,'2016-02-10 14:04:38','2016-08-05 14:53:38',NULL,7,0,1,'Yasmina','Eude'),(10,'josiane.auclair','bujghuikhgidshilfhizsefh@yopmail.com','0467999067',' ',NULL,2,'2016-02-11 12:30:46','2016-08-05 14:53:38',NULL,8,0,1,'Josiane','Auclair'),(11,'ecureuil','bujghuikhgidshilfhizsefh@yopmail.com','0475580896',' ',NULL,7,'2016-04-28 15:02:42','2016-10-13 09:16:05','',9,0,1,'Ecureuil','Ecureuil'),(12,'sandie.ferrier','bujghuikhgidshilfhizsefh@yopmail.com','0475580896',' ',NULL,7,'2016-05-27 13:55:36','2016-08-05 14:53:38',NULL,10,0,1,'Sandie','Ferrier'),(13,'dorothee.gerard','bujghuikhgidshilfhizsefh@yopmail.com','0467999067',' ',NULL,2,'2016-06-08 15:23:53','2016-08-05 14:53:38',NULL,11,0,1,'Dorothee','Gerard'),(14,'chantal','bujghuikhgidshilfhizsefh@yopmail.com','0467998161',' ',NULL,2,'2016-06-10 10:39:44','2016-08-08 15:14:16',NULL,12,0,1,'Chantal','Mourand'),(15,'bnjk.bbjhbjh','bujghuikhgidshilfhizsefh@yopmail.com','0161654644',' ',NULL,14,'2016-07-20 14:46:24','2016-08-05 14:53:38',NULL,12,0,1,'esfse','efsef'),(16,'jeromedd.guillot','bujghuikhgidshilfhizsefh@yopmail.com','0683039620','sonya88',NULL,2,'2016-08-04 12:59:51','2016-08-05 14:53:38','',12,0,1,'fsgfse','guhui'),(17,'efef.efefsef','bujghuikhgidshilfhizsefh@yopmail.com','0496494984',' ','',1,'2016-08-31 07:55:12','2016-08-31 09:25:09','',12,0,1,'vbuybuy','buiiu'),(18,'fdef.fesfefse','bujghuikhgidshilfhizsefh@yopmail.com','0216459894',' ',NULL,3,'2016-08-31 08:02:03','2016-08-31 09:25:09',NULL,12,0,1,'rdgdrg','tfhtf'),(19,'dfd.fdfdfd','bujghuikhgidshilfhizsefh@yopmail.com','0485549595',' ',NULL,27,'2016-08-31 08:03:36','2016-08-31 09:25:09',NULL,12,0,1,'drgdrgdr','fthf'),(20,'e.e','bujghuikhgidshilfhizsefh@yopmail.com','0256565695',' ',NULL,23,'2016-08-31 08:08:51','2016-08-31 09:25:09',NULL,12,0,1,'drgdrgdr','tfhfth'),(21,'d.d','bujghuikhgidshilfhizsefh@yopmail.com','0416544646',' ',NULL,23,'2016-08-31 08:14:10','2016-08-31 09:25:09',NULL,12,0,1,'drgdrgdr','fthfh'),(22,'esfsef','bujghuikhgidshilfhizsefh@yopmail.com','0564084964',' ',NULL,20,'2016-08-31 08:18:34','2016-08-31 09:25:09',NULL,12,0,1,'drgrdgrd','fthft'),(23,'esfsefqdzqdzq','bujghuikhgidshilfhizsefh@yopmail.com','0564084964',' ',NULL,3,'2016-08-31 08:18:49','2016-08-31 09:25:09',NULL,12,0,1,'drgrdgr','fthfth'),(24,'e.eedfsefesfse','bujghuikhgidshilfhizsefh@yopmail.com','0595959494',' ',NULL,1,'2016-08-31 08:23:24','2016-08-31 09:25:09',NULL,12,0,1,'dgrdg','fthfth'),(25,'vygv.uygvuygbu','vygv.uygvuygbu@cle-expertises.fr','0555596654','frghdghr',NULL,33,'2016-10-19 08:15:40','2016-10-24 15:59:28',NULL,10,NULL,1,NULL,NULL),(26,'ub.bujbiub','fbui.bujbiub@cle-expertises.fr','0654646445','ujuygbvuygvivugbuiohbiohj',NULL,13,'2016-10-19 08:25:56','2016-10-24 15:59:28',NULL,9,NULL,1,NULL,NULL),(27,'bhuhuih.uiohuhiuoh','bhuhuih.uiohuhiuoh@cle-expertises.fr','0469654954','esfgsdgdg',NULL,26,'2016-10-19 09:08:00','2016-10-24 15:59:24',NULL,9,NULL,1,NULL,NULL),(28,'yyguyy.guhui','yyguyy.guhui@cle-expertises.fr','0654654445','hughui',NULL,26,'2016-10-19 09:09:30','2016-10-24 15:59:30',NULL,9,NULL,1,NULL,NULL),(29,'ggrdtuhgghiuyv.uuiguiguio','ggrdtuhgghiuyv.uuiguiguio@cle-expertises.fr','0454585454',' ',NULL,35,'2016-10-19 09:10:54','2016-10-24 15:59:26',NULL,6,NULL,1,NULL,NULL),(30,'vhgvuyhvfgy.vyhvguigiu','vhgvuyhvfgy.vyhvguigiu@cle-expertises.fr','0154854445','tyfyfvhfgvygfug',NULL,23,'2016-10-19 09:12:49','2016-10-24 15:59:28',NULL,9,NULL,1,'vyhvguigiu','vhgvuyhvfgy'),(31,'bgubhu.hijhiuoh','bgubhu.hijhiuoh@cle-expertises.fr','0165496469','',NULL,27,'2016-10-24 14:52:43','2016-12-07 16:21:11',NULL,5,NULL,0,'hijhiuoh','bgubhu'),(32,'fesfsefgu.uhiuhuh','fesfsefgu.uhiuhuh@cle-expertises.fr','0559656565','0000',NULL,32,'2016-10-24 15:23:34','2016-11-02 10:13:01',NULL,1,NULL,1,'uhiuhuh','fesfsefgu'),(33,'niuniohjni.hnijhiojio','niuniohjni.hnijhiojio@cle-expertises.fr','0656565464','12165',NULL,27,'2016-10-24 15:26:41','2016-10-24 15:59:27',NULL,2,NULL,1,'hnijhiojio','niuniohjni'),(34,'n.nhih','n.nhih@cle-expertises.fr','0645654655','',NULL,35,'2016-12-19 14:54:41','2016-12-19 14:54:41',NULL,5,NULL,NULL,'nhih','n'),(35,'bgjhu.bbuygbuibi','bgjhu.bbuygbuibi@cle-expertises.fr','0509654954','',NULL,35,'2016-12-19 14:58:36','2016-12-19 14:58:36',NULL,5,NULL,NULL,'bbuygbuibi','bgjhu'),(36,'bvuyhgbuybui.uihuih','bvuyhgbuybui.uihuih@cle-expertises.fr','0456456465','',NULL,23,'2016-12-19 14:59:04','2016-12-19 14:59:04',NULL,5,NULL,NULL,'uihuih','bvuyhgbuybui'),(37,'gsdg.yugbu','gsdg.yugbu@cle-expertises.fr','0666665465','',NULL,23,'2016-12-19 15:01:07','2016-12-19 15:01:07',NULL,5,NULL,NULL,'yugbu','gsdg'),(38,'hbuh.hbu','hbuh.hbu@cle-expertises.fr','0565656565','',NULL,23,'2016-12-19 15:01:49','2016-12-19 15:01:49',NULL,6,NULL,NULL,'hbu','hbuh'),(39,'bjuhb.hjkhj','bjuhb.hjkhj@exact-etude.fr','0565656565','',NULL,23,'2016-12-19 15:02:39','2016-12-19 15:02:39',NULL,5,NULL,NULL,'hjkhj','bjuhb'),(40,'hji','bhuh.hh@cle-expertises.fr','0456456465','',NULL,23,'2016-12-19 15:03:51','2016-12-19 15:03:51',NULL,6,NULL,NULL,'hh','bhuh'),(41,'jiojoijo.jojojo','hijj.jojojo@cle-expertises.fr','0145495956','',NULL,23,'2016-12-19 15:06:17','2016-12-19 15:06:17',NULL,5,NULL,NULL,'jojojo','hijj');
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

-- Dump completed on 2017-03-20 16:41:43
