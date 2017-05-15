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
  `ip_address_sender` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-12  9:54:53
