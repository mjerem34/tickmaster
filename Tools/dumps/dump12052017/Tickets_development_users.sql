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
  `actif` tinyint(1) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jm','jeremy.montesinos@cle-expertises.fr','0788607459','pass',NULL,2,'2015-11-23 14:03:05','2016-12-19 16:22:08','192.168.10.48',1,1,'Jeremy','Montesinos'),(4,'jerome.guillot','bujghuikhgidshilfhizsefh@yopmail.com','0683039620','sonya88','',2,'2015-12-09 09:47:39','2016-08-05 14:53:38','',2,1,'Jerome','Guillot'),(5,'yvon.partoo','bujghuikhgidshilfhizsefh@yopmail.com','0555555555',' ','',2,'2015-12-16 08:27:43','2016-08-05 14:53:38','',3,1,'Yvon','Partoo'),(6,'guy.schwalm','bujghuikhgidshilfhizsefh@yopmail.com','0622634975','Volu348%',NULL,2,'2016-01-08 11:07:30','2016-08-05 14:53:38',NULL,4,1,'Guy','Schwalm'),(7,'germaine.tapeautour','bujghuikhgidshilfhizsefh@yopmail.com','0666666666',' ',NULL,2,'2016-02-02 08:50:03','2016-08-24 12:52:15',NULL,5,1,'Germaine','Tapeautour'),(8,'carole.naudin','bujghuikhgidshilfhizsefh@yopmail.com','0467998164',' ',NULL,2,'2016-02-08 10:37:23','2016-08-05 14:53:38',NULL,6,1,'Carole','Naudin'),(9,'yasmina.eude','bujghuikhgidshilfhizsefh@yopmail.com','0467999067',' ',NULL,2,'2016-02-10 14:04:38','2016-08-05 14:53:38',NULL,7,1,'Yasmina','Eude'),(10,'josiane.auclair','bujghuikhgidshilfhizsefh@yopmail.com','0467999067',' ',NULL,2,'2016-02-11 12:30:46','2016-08-05 14:53:38',NULL,8,1,'Josiane','Auclair'),(11,'ecureuil','bujghuikhgidshilfhizsefh@yopmail.com','0475580896',' ',NULL,7,'2016-04-28 15:02:42','2016-10-13 09:16:05','',9,1,'Ecureuil','Ecureuil'),(12,'sandie.ferrier','bujghuikhgidshilfhizsefh@yopmail.com','0475580896',' ',NULL,7,'2016-05-27 13:55:36','2016-08-05 14:53:38',NULL,10,1,'Sandie','Ferrier'),(13,'dorothee.gerard','bujghuikhgidshilfhizsefh@yopmail.com','0467999067',' ',NULL,2,'2016-06-08 15:23:53','2016-08-05 14:53:38',NULL,11,1,'Dorothee','Gerard'),(14,'chantal','bujghuikhgidshilfhizsefh@yopmail.com','0467998161',' ',NULL,2,'2016-06-10 10:39:44','2016-08-08 15:14:16',NULL,12,1,'Chantal','Mourand'),(15,'jean.paul','jean.paul@cle-expertises.fr','0648954646',' ',NULL,26,'2017-03-27 09:23:42','2017-03-27 09:23:42',NULL,9,1,'Paul','Jean'),(16,'fefsef.efsefesf','fefsef.efsefesf@efsf.ef','0565498989',' ',NULL,20,'2017-03-27 09:38:20','2017-03-27 09:38:20',NULL,13,1,'efsefesf','fefsef'),(17,'jhyjygj','hkluilii@crfdr.rf','0265466462',' ',NULL,22,'2017-03-27 13:22:48','2017-03-27 13:22:48',NULL,17,1,'tfhfthfth','thhtfh'),(18,'thhtfhtfhft.tfhfthfthtfhhfh','thhtfhtfhft.tfhfthfthtfhhfh@ezdse.fe','0265466462',' ',NULL,22,'2017-03-27 13:23:54','2017-03-27 13:23:54',NULL,17,1,'tfhfthfthtfhhfh','thhtfhtfhft'),(19,'rgd.hujhuj','rgd.hujhuj@esf.ef','0654595965',' ',NULL,35,'2017-03-27 13:24:49','2017-03-27 13:24:49',NULL,5,1,'hujhuj','rgd'),(20,'iij','fgh.jhijhij@esf.fe','0262562665',' ',NULL,5,'2017-03-27 13:28:10','2017-03-27 13:28:10',NULL,18,1,'jhijhij','fgh'),(21,'fsedfdddd.efesfd','fsedfdddd.efesfd@fef.ff','0415648464',' ',NULL,3,'2017-03-27 14:26:11','2017-03-27 14:26:11',NULL,22,1,'efesfd','fsedfdddd'),(22,'jeromedd.guillot','bujghuikhgidshilfhizsefh@yopmail.com','0683039620','sonya88',NULL,2,'2017-03-29 09:49:28','2017-03-29 09:49:28','192.168.10.48',5,NULL,'Guillot','Jérôme'),(23,'iuhiuhh','ghuh.huih@efesf.ef','0546456464',' ',NULL,23,'2017-03-29 09:50:02','2017-03-29 09:50:02',NULL,20,NULL,'huih','ghuh'),(24,'iuhiuhhgrg','ghuh.huih@efesf.ef','0546456464',' ',NULL,23,'2017-03-29 09:50:40','2017-03-29 09:50:40',NULL,20,NULL,'huih','ghuh'),(25,'iuhiuhhgrgfgdgf','ghuh.huih@efesf.ef','0546456464',' ',NULL,23,'2017-03-29 09:50:57','2017-03-29 09:50:57',NULL,20,NULL,'huih','ghuh'),(26,'iuhiuhhgrgfgdgfyjy','ghuh.huih@efesf.ef','0546456464',' ',NULL,23,'2017-03-29 09:52:57','2017-03-29 09:52:57',NULL,20,1,'huih','ghuh'),(27,'ghhh','ghuh.huih@efesf.ef','0546456464',' ',NULL,23,'2017-03-29 09:54:06','2017-03-29 09:54:06',NULL,20,1,'huih','ghuh'),(28,'grdeg.grgrd','grdeg.grgrd@rd.rg','0165165646',' ','8e03b7b7218c32b3b4d6b3ccb64c1134b86eabdeb9ed24363e800562d0673f447d7504d1e0a8c80d8436d3d426653fb13b9d3dc6711020f4d6cb35417119ed3d',20,'2017-03-29 09:56:03','2017-03-29 09:56:03',NULL,20,1,'grgrd','grdeg'),(31,'jerokmedd.guillot','bujghuikhgidshilfhizsefh@yopmail.com','0683039620','sonya88','5eb7b587c3a89e4f542559bbedababede05f72d884f94e4c586557b547d9a5008b978c33886cd2cbd66bd540d37ca653deed19f45b96be42dfa87a7ea29b4485',2,'2017-03-29 10:22:39','2017-03-29 10:22:39','192.168.10.48',5,1,'Guillot','Jérôme');
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

-- Dump completed on 2017-05-12  9:54:53
