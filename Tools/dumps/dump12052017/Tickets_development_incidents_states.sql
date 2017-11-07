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
-- Table structure for table `incidents_states`
--

DROP TABLE IF EXISTS `incidents_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incidents_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shortcut` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_color` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'success',
  `tech_color` varchar(45) COLLATE utf8_unicode_ci DEFAULT 'success',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents_states`
--

LOCK TABLES `incidents_states` WRITE;
/*!40000 ALTER TABLE `incidents_states` DISABLE KEYS */;
INSERT INTO `incidents_states` VALUES (1,'En attente de prise en charge','En attente PEC','success','warning'),(2,'Affecté à un technicien','Affecté','success','warning'),(3,'Pris en charge par un technicien','PEC par technicien','success','warning'),(4,'Réponse reçue','Rép reçue','warning','warning'),(5,'En attente de réponse du demandeur','En attente','warning','success'),(6,'En attente de réponse du technicien','En attente','success','warning'),(7,'Incident cloturé','Cloturé','danger','danger'),(8,'En attente de cloture de la part du demandeur','En attente cloture','warning','info'),(9,'Demande de cloture envoyée, en attente','En attente cloture','warning','info'),(10,'Incident rejeté','Rejeté','danger','danger'),(11,'Incident pris en charge par un technicien supérieur','PEC par un technicien sup','success','warning'),(12,'Incident en attente de réponse pour prise en charge par un technicien supérieur','En attente prise en charge tech sup','success','warning');
/*!40000 ALTER TABLE `incidents_states` ENABLE KEYS */;
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
