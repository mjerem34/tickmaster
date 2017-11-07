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
  `ip_address_sender` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-12  9:54:52
