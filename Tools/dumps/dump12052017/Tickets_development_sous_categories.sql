-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: Tickets_development
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_categories`
--

LOCK TABLES `sous_categories` WRITE;
/*!40000 ALTER TABLE `sous_categories` DISABLE KEYS */;
INSERT INTO `sous_categories` VALUES (1,'Messagerie',3,10,'2015-12-08 13:43:27','2015-12-08 13:43:27'),(2,'Navigateur internet',3,10,'2015-12-08 13:45:01','2015-12-08 13:45:01'),(3,'VPN',3,10,'2015-12-08 13:45:14','2015-12-08 13:45:14'),(4,'Messages suspects',3,10,'2015-12-08 13:45:28','2015-12-08 13:45:28'),(5,'Routeur',3,10,'2015-12-08 13:45:47','2016-01-14 10:53:28'),(6,'Outlook',4,10,'2015-12-08 13:46:30','2015-12-08 13:46:30'),(7,'Antivirus',4,10,'2015-12-08 13:46:48','2015-12-08 13:46:48'),(8,'Installer/Desinstaller',4,10,'2015-12-08 13:47:13','2015-12-08 13:47:13'),(9,'Lecteur Olympus',4,10,'2015-12-08 13:47:29','2015-12-08 13:47:29'),(10,'Gestion des fichiers',4,10,'2015-12-08 13:48:00','2015-12-08 13:48:00'),(11,'JobList',4,10,'2015-12-08 13:49:00','2015-12-08 13:49:00'),(12,'Word',4,10,'2015-12-08 13:49:16','2015-12-08 13:49:16'),(13,'Excel',4,10,'2015-12-08 13:49:37','2015-12-08 13:49:37'),(14,'Net-Expert DSS',1,10,'2015-12-08 13:50:17','2015-12-08 13:50:17'),(15,'Connectique',5,10,'2015-12-08 14:02:51','2015-12-08 14:02:51'),(16,'Alimentation',5,10,'2015-12-08 14:03:10','2015-12-08 14:03:10'),(17,'Ecran',5,10,'2015-12-08 14:03:27','2015-12-08 14:03:27'),(18,'Son',5,10,'2015-12-08 14:03:36','2015-12-08 14:03:36'),(19,'Stockage',5,10,'2015-12-08 14:03:55','2015-12-08 14:03:55'),(20,'Microphone',5,10,'2015-12-08 14:04:22','2015-12-08 14:04:22'),(21,'Comptes Email',6,10,'2015-12-08 14:05:38','2015-12-08 14:05:38'),(22,'Contacts',6,10,'2015-12-08 14:05:52','2015-12-08 14:05:52'),(23,'Messages',6,10,'2015-12-08 14:06:09','2015-12-08 14:06:09'),(25,'Parametrage',6,10,'2015-12-08 14:06:58','2015-12-08 14:06:58'),(26,'Autre',1,10,'2016-01-13 09:50:56','2016-01-13 09:50:56'),(27,'Jobliste',1,10,'2016-01-14 10:50:02','2016-01-14 10:50:02'),(28,'Intranet',3,10,'2016-01-14 10:54:29','2016-01-14 10:54:29'),(30,'Autre',7,10,'2016-01-26 10:45:05','2016-01-26 10:45:05'),(31,'Autre',2,10,'2016-01-26 10:46:15','2016-01-26 10:46:15'),(32,'Autre',3,10,'2016-01-26 10:46:24','2016-01-26 10:46:24'),(33,'Autre',4,10,'2016-01-26 10:46:33','2016-01-26 10:46:33'),(34,'Autre',5,10,'2016-01-26 10:46:43','2016-01-26 10:46:43'),(35,'Autre',6,10,'2016-01-26 10:46:52','2016-01-26 10:46:52'),(36,'Autre',9,10,'2016-01-26 10:48:05','2016-01-26 10:48:05'),(37,'Autre',10,10,'2016-02-09 09:11:25','2016-02-09 09:11:25'),(38,'NetExpert',1,10,'2016-06-10 16:29:57','2016-06-10 16:29:57'),(39,'Autre',10,10,'2016-07-22 12:47:09','2016-07-22 12:47:09'),(40,'Autre',11,10,'2016-07-22 12:47:21','2016-07-22 12:47:21'),(41,'Bla',NULL,4,'2016-07-22 12:55:44','2016-07-22 12:55:44'),(42,'khuyku',NULL,10,'2016-07-22 12:56:07','2016-07-22 12:56:07'),(43,'hthfthf',NULL,10,'2016-07-22 12:57:42','2016-07-22 12:57:42'),(44,'njunujnjuk',NULL,10,'2016-07-22 12:58:49','2016-07-22 12:58:49'),(45,'tddtf',NULL,10,'2016-07-22 13:01:04','2016-07-22 13:01:04'),(46,'vfvfdgrd',3,10,'2016-07-22 13:02:30','2016-07-22 13:02:30'),(47,'buibihn',3,10,'2016-07-22 13:02:39','2016-07-22 13:02:39'),(48,'Autre',12,10,'2016-07-22 13:22:19','2016-07-22 13:22:19'),(49,'Autre',13,10,'2016-07-22 13:22:25','2016-07-22 13:22:25'),(50,'Autre',14,10,'2016-08-02 09:33:56','2016-08-02 09:33:56'),(51,'Autre',13,10,'2016-08-30 07:56:01','2016-08-30 07:56:01'),(52,'Autre',14,10,'2016-08-30 08:00:24','2016-08-30 08:00:24'),(53,'Autre',15,10,'2016-08-30 08:01:03','2016-08-30 08:01:03'),(54,'Autre',16,10,'2016-08-30 08:01:40','2016-08-30 08:01:40'),(55,'Autre',17,10,'2016-08-30 08:02:06','2016-08-30 08:02:06'),(56,'Autre',18,10,'2016-08-30 08:04:22','2016-08-30 08:04:22'),(58,'Autre',20,10,'2016-08-30 10:32:45','2016-08-30 10:32:45'),(59,'sxcsxcwcswc',NULL,10,'2016-08-31 13:35:07','2016-08-31 13:35:07'),(60,'sxcsxcwcswc',NULL,10,'2016-08-31 13:35:31','2016-08-31 13:35:31'),(61,'Messagerie',3,10,'2016-09-05 08:02:44','2016-09-05 08:02:44'),(106,'Autre',21,10,'2016-09-06 07:08:12','2016-09-06 07:08:12'),(107,'fesffe',21,10,'2016-09-06 07:08:24','2016-09-06 07:08:24'),(108,'fesfsef',21,10,'2016-09-06 07:08:25','2016-09-06 07:08:25'),(109,'fesfesfesf',21,10,'2016-09-06 07:08:26','2016-09-06 07:08:26'),(110,'sefsefsfe',21,10,'2016-09-06 07:08:27','2016-09-06 07:08:27'),(111,'fesfesf',21,10,'2016-09-06 07:08:29','2016-09-06 07:08:29'),(112,'fse',21,10,'2016-09-06 07:08:29','2016-09-06 07:08:29'),(113,'f',21,10,'2016-09-06 07:08:29','2016-09-06 07:08:29'),(114,'esf',21,10,'2016-09-06 07:08:29','2016-09-06 07:08:29'),(115,'se',21,10,'2016-09-06 07:08:30','2016-09-06 07:08:30'),(116,'fes',21,10,'2016-09-06 07:08:30','2016-09-06 07:08:30'),(117,'f',21,10,'2016-09-06 07:08:30','2016-09-06 07:08:30'),(118,'esf',21,10,'2016-09-06 07:08:30','2016-09-06 07:08:30'),(119,'sef',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(120,'es',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(121,'f',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(122,'se',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(123,'f',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(124,'e',21,10,'2016-09-06 07:08:31','2016-09-06 07:08:31'),(125,'jijijoi',1,10,'2017-04-07 20:37:26','2017-04-07 20:37:26');
/*!40000 ALTER TABLE `sous_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-12  9:54:53
