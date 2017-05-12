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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-21 14:17:23
