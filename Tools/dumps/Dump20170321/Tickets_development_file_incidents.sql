CREATE DATABASE  IF NOT EXISTS `Tickets_development` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `Tickets_development`;
-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Tickets_development
-- ------------------------------------------------------
-- Server version	5.5.54-0+deb8u1

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-21 14:17:23
