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
-- Table structure for table `field_agency_agencies`
--

DROP TABLE IF EXISTS `field_agency_agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_agency_agencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) NOT NULL DEFAULT '0',
  `field_agency_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_agency_agencies`
--

LOCK TABLES `field_agency_agencies` WRITE;
/*!40000 ALTER TABLE `field_agency_agencies` DISABLE KEYS */;
INSERT INTO `field_agency_agencies` VALUES (2,2,43,'0467246820'),(3,2,44,''),(4,2,45,''),(5,2,46,'teub@cle-expertises.fr'),(6,2,47,'fthtfh'),(7,2,48,'montpellier@cle-expertises.fr'),(8,2,49,'fth'),(9,2,50,''),(10,2,51,''),(11,35,43,''),(12,35,44,''),(13,35,45,''),(14,35,46,'teub@cle-expertises.fr'),(15,35,47,''),(16,35,48,'bayone@cle-expertises.fr'),(17,35,49,''),(18,35,50,'Bayone'),(19,35,51,''),(20,26,43,''),(21,26,44,''),(22,26,45,''),(23,26,46,''),(24,26,47,''),(25,26,48,'caen@cle-expertises.fr'),(26,26,49,''),(27,26,50,''),(28,26,51,''),(29,27,43,''),(30,27,44,''),(31,27,45,''),(32,27,46,''),(33,27,47,''),(34,27,48,'chambery@cle-expertises.fr'),(35,27,49,''),(36,27,50,'Chambery'),(37,27,51,''),(38,2,54,'Hérault'),(39,36,43,'0656'),(40,36,44,''),(41,36,45,''),(42,36,46,'01654'),(43,36,47,'6015'),(44,36,48,'165'),(45,36,49,''),(46,36,50,''),(47,36,51,''),(48,36,54,'');
/*!40000 ALTER TABLE `field_agency_agencies` ENABLE KEYS */;
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
