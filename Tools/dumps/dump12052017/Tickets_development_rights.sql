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
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (1,'index_agencies','Autorisé à voir la page d\'index des agences'),(2,'ping_agencies','Autorisé à voir la page pour pinger les agences'),(3,'do_ping_agencies','Autorisé à pinger les agences'),(4,'show_agencies','Autorisé à voir les détails d\'une agence'),(5,'new_agencies','Autorisé à voir la page de nouvelle agence'),(6,'edit_agencies','Autorisé à voir la page editer une agence'),(7,'create_agencies','Autorisé à créer une agence'),(8,'update_agencies','Autorisé à editer une agence'),(9,'destroy_agencies','Autorisé à supprimer une agence'),(10,'index_field_agencies','Autorisé à voir les champs agences'),(11,'create_field_agencies','Autorisé à créer les champs agences'),(12,'update_field_agencies','Autorisé à editer les champs agences'),(13,'destroy_field_agencies','Autorisé à supprimer les champs agences'),(14,'index_categories','Autorisé à voir la liste des catégories'),(15,'show_categories','Autorisé à voir les détails d\'une catégorie'),(16,'edit_categories','Autorisé à éditer une categorie'),(17,'create_categories','Autorisé à créer de nouvelles catégories'),(18,'update_categories','Autorisé à éditer une categorie'),(19,'destroy_categories','Autorisé à supprimer une catégorie'),(20,'index_sous_categories','Autorisé à voir la liste des sous categories'),(21,'show_sous_categories','Autorisé à voir le détail d\'une sous catégorie'),(22,'new_sous_categories','Autorisé à créer de nouvelles sous catégories'),(23,'edit_sous_categories','Autorisé à éditer une sous catégorie'),(24,'create_sous_categories','Autorisé à créer de nouvelles sous catégories'),(25,'update_sous_categories','Autorisé à éditer une sous catégorie'),(26,'destroy_sous_categories','Autorisé à supprimer les sous catégories'),(27,'index_detentor_types','Autorisé à voir les types de détenteur de matériel'),(28,'index_field_sellers','Autorisé à voir les champs de données pour les vendeurs'),(29,'create_field_sellers','Autorisé à créer des champs de données pour les vendeurs'),(30,'update_field_sellers','Autorisé à modifier des champs de données pour les vendeurs'),(31,'destroy_field_sellers','Autorisé à supprimer des champs de données pour les vendeurs'),(32,'index_field_type_users','Autorisé à voir les champs types utilisateurs'),(33,'create_field_type_users','Autorisé à ajouter un champ pour un type utilisateur'),(34,'update_field_type_users','Autorisé à modifier des champs de type utilisateur'),(35,'destroy_field_type_users','Autorisé à supprimer un champ de type utilisateur'),(36,'unassigns_field_type_users','Autorisé à dé-assigner des champs de type utilisateur'),(37,'index_incidents','Autorisé à voir les incidents de tous les membres'),(38,'without_tech_incidents','Autorisé à attribuer les incidents aux techniciens'),(39,'show_incidents','Autorisé à voir ses incidents'),(40,'new_incidents','Autorisé à créer de nouveaux incidents'),(41,'edit_incidents','Autorisé à éditer un incident d\'un autre membre');
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
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
