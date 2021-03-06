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
  `ip_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
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
INSERT INTO `incidents` VALUES (37,'Panne','<p>Bordel !</p>\r\n',1,NULL,1,14,5,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-06-29 08:04:52','2016-06-29 08:04:52','2016-06-29 08:01:47','2016-06-29 08:04:52',NULL,NULL),(38,'effsfes','<p>fesfesfefesf</p>\r\n',1,6,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-06-29 08:06:45','2016-06-29 10:00:42',NULL,NULL),(39,'sssss','<p>ssssss</p>\r\n',1,1,1,14,5,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 08:38:32','2016-06-29 12:43:56',NULL,NULL),(40,'ddddd','<p>dddd</p>\r\n',1,NULL,1,14,6,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 08:45:14','2016-06-29 08:45:14',NULL,NULL),(41,'dddddd','<p>dddddddddd</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 08:46:04','2016-06-29 08:46:04',NULL,NULL),(42,'efesfes','<p>fesfefesf</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 09:01:49','2016-07-12 14:16:23',1,0),(43,'dddddd','<p>dddd</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 09:29:25','2016-06-29 09:29:25',NULL,NULL),(44,'scscscswcswcwsc','<p>cscscscwsc</p>\r\n',11,1,1,14,1,1,NULL,NULL,NULL,'192.168.10.34',NULL,NULL,NULL,7,7,1,'2016-07-12 09:40:17','2016-07-12 09:40:17','2016-06-29 09:43:09','2016-07-12 09:40:17',0,0),(45,'dzdqsdfe','<p>fefesfsefesfef</p>\r\n',1,1,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-06-29 12:32:06','2016-07-29 08:15:37',NULL,NULL),(46,'fesfsefsef','<p>fefsefesfe</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-06-29 12:32:40','2016-07-12 08:34:17',NULL,NULL),(48,'BLABLA','<p>BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLA</p>\r\n',1,1,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-07-11 13:35:45','2016-07-29 08:16:16',NULL,NULL),(49,'blablablabla','<p>gggggg</p>\r\n',1,NULL,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 08:46:46','2016-07-12 09:34:54',0,0),(50,'fff','<p>fff</p>\r\n',11,1,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-12 09:55:39','2016-07-12 09:55:39','2016-07-12 09:41:52','2016-07-12 09:55:39',0,0),(51,'effef','<p>fffff</p>\r\n',11,1,5,16,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,4,5,1,NULL,NULL,'2016-07-12 09:57:16','2016-08-09 08:38:40',0,0),(52,'ee','<p>eee</p>\r\n',11,1,4,6,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-12 10:13:34','2016-07-12 10:13:34','2016-07-12 10:07:16','2016-07-12 10:13:34',0,0),(53,'iii','<p>iii</p>\r\n',1,NULL,3,1,0,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:52:30','2016-07-12 12:52:30',1,0),(54,'oo','<p>ooo</p>\r\n',1,NULL,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:52:52','2016-07-12 12:52:52',1,0),(55,'h','<p>h</p>\r\n',1,NULL,2,31,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:53:16','2016-07-12 12:53:16',1,0),(56,'h','<p>h</p>\r\n',1,NULL,3,1,3,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 12:53:40','2016-07-12 12:53:40',1,0),(57,'gdg','<p>gdgg</p>\r\n',1,NULL,2,31,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 13:08:48','2016-07-12 13:08:48',1,0),(58,'l','<p>l</p>\r\n',1,NULL,1,14,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 13:11:45','2016-07-12 13:11:45',1,0),(59,'rgre','<p>geger</p>\r\n',1,NULL,2,31,4,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-12 13:20:16','2016-07-12 13:20:16',1,0),(60,'ff','<p>fffff</p>\r\n',1,6,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-07-12 13:20:47','2016-07-29 08:16:50',1,0),(61,'ddd','<p>dddddd</p>\r\n',1,1,1,14,6,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-12 14:17:51','2016-07-29 12:27:30',0,1),(62,'esf','<p>fesfe</p>\r\n',1,1,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-21 07:58:06','2016-07-21 07:58:06','2016-07-12 14:26:26','2016-07-21 07:58:06',0,1),(63,'sefefsefesfe','<p>zfefesfef</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-20 10:07:00','2016-07-20 10:07:00',1,0),(64,'fgdgd','<p>drgdrgr</p>\r\n',1,1,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,7,7,1,'2016-07-21 07:57:57','2016-07-21 07:57:57','2016-07-20 10:07:38','2016-07-21 07:57:57',0,1),(65,'qdz','<p>zdqzdzqd</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-20 10:09:39','2016-07-20 10:09:39',1,0),(66,'hth','<p>tfhtht</p>\r\n',1,1,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,7,7,1,'2016-07-20 15:23:14','2016-07-20 15:23:14','2016-07-20 12:59:35','2016-07-20 15:23:14',0,1),(69,'dzzqdqz','<p>dzqdzqdzqd</p>\r\n',11,1,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,8,9,1,NULL,'2016-07-20 15:23:26','2016-07-20 15:08:09','2016-07-20 15:23:26',0,1),(70,'sef','<p>eee</p>\r\n',11,NULL,1,14,1,1,NULL,NULL,NULL,'10.134.2.49',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-21 07:27:15','2016-07-22 09:58:45',0,0),(71,'ss','<p>sssss</p>\r\n',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-25 07:54:00','2016-07-25 07:54:00',1,0),(72,'ss','<p>sssss</p>\r\n',11,1,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-25 07:59:11','2016-07-29 12:17:07',0,1),(73,'dd','<p>ddddd</p>\r\n',11,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-07-25 07:59:28','2016-07-25 08:00:02',0,0),(74,'sssss','<p>ssssss</p>\r\n',11,6,3,1,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-07-26 07:12:59','2016-08-02 13:36:06',1,0),(75,'dddd','<p>ssssss</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-08-02 07:58:42','2016-08-02 08:20:00',0,0),(76,'xxxxx','<p>xxxxx</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,'2016-08-02 08:22:09','2016-08-02 08:24:03',0,0),(78,'ss','<p>sssss</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,8,9,1,NULL,'2016-08-02 14:23:52','2016-08-02 12:19:16','2016-08-02 14:23:52',0,0),(79,'ss','<p>sssss</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,8,9,1,NULL,'2016-08-02 14:14:16','2016-08-02 12:19:59','2016-08-02 14:14:16',0,0),(80,'ss','<p>ssssskk</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-02 12:25:43','2016-08-02 13:44:16',1,0),(82,'s','<p>s</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:08:36','2016-08-03 08:08:36',1,0),(83,'dd','<p>ddddd</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:09:52','2016-08-03 08:09:52',1,0),(84,'c','<p>c</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:10:39','2016-08-03 08:10:39',1,0),(85,'dd','<p>dddd</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:11:27','2016-08-03 08:11:27',1,0),(86,'s','<p>s</p>\r\n',1,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:15:45','2016-08-03 08:15:45',1,0),(87,'eee','<p>eeee</p>\r\n',1,NULL,3,1,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:17:54','2016-08-03 08:17:54',1,0),(88,'ee','<p>eee</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:18:54','2016-08-03 08:18:54',1,0),(89,'sss','<p>sssss</p>\r\n',1,NULL,2,31,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 08:19:50','2016-08-03 08:19:50',1,0),(91,'ss','<p>sssss</p>',11,NULL,1,14,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 09:32:52','2016-08-03 09:32:52',1,0),(92,'d','<p>d</p>\r\n',1,NULL,4,6,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-03 09:35:35','2016-08-03 09:35:35',1,0),(93,'eeeeeeeeeee','<p>eee</p>\r\n',11,NULL,1,14,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-08-25 13:47:55','2016-08-25 13:49:23',0,0),(94,'rgdrgdrgrdgrdg','<p>drgrgrg</p>\r\n',1,1,2,31,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,'2016-09-06 08:50:02','2016-10-17 15:12:11',1,0),(102,'gdrgdrg','<p>rdgrdgrd</p>\r\n',1,NULL,3,1,1,1,NULL,NULL,NULL,'192.168.10.52',NULL,NULL,NULL,1,1,1,NULL,NULL,'2016-12-19 16:22:56','2016-12-19 16:22:56',1,0);
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
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
