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
-- Table structure for table `field_type_user_type_users`
--

DROP TABLE IF EXISTS `field_type_user_type_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_type_user_type_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_user_id` int(11) DEFAULT NULL,
  `field_type_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_type_user_type_users`
--

LOCK TABLES `field_type_user_type_users` WRITE;
/*!40000 ALTER TABLE `field_type_user_type_users` DISABLE KEYS */;
INSERT INTO `field_type_user_type_users` VALUES (1,1,1),(2,1,9),(3,1,11),(4,2,9),(5,2,11),(6,3,9),(7,3,11),(8,4,9),(9,4,11),(10,5,9),(11,5,11),(12,6,9),(13,6,11),(14,7,9),(15,7,11),(16,8,9),(17,8,11),(18,9,1),(19,9,9),(20,9,11),(21,10,9),(22,10,11),(23,11,9),(24,11,11),(25,12,9),(26,12,11),(27,13,9),(28,13,11),(29,14,9),(30,14,11),(31,15,9),(32,15,11),(33,16,9),(34,16,11),(35,17,9),(36,17,11),(37,18,9),(38,18,11),(39,19,9),(40,19,11),(41,20,9),(42,20,11),(43,21,9),(44,21,11),(45,22,9),(46,22,11),(47,23,9),(48,23,11);
/*!40000 ALTER TABLE `field_type_user_type_users` ENABLE KEYS */;
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
