-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: Tickets_test
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
  `name` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (1,'index_agencies','Autorisé à voir les agences'),(2,'ping_agencies','Autorisé à voir la page pour pinger les agences'),(3,'do_ping_agencies','Autorisé à pinger les agences'),(4,'show_agencies','Autorisé à voir les détails d\'une agence'),(5,'new_agencies','Autorisé à voir la page de nouvelle agence'),(6,'edit_agencies','Autorisé à voir la page editer une agence'),(7,'create_agencies','Autorisé à créer une agence'),(8,'update_agencies','Autorisé à editer une agence'),(9,'destroy_agencies','Autorisé à supprimer une agence'),(10,'index_field_agencies','Autorisé à voir les champs agences'),(11,'create_field_agencies','Autorisé à créer les champs agences'),(12,'update_field_agencies','Autorisé à editer les champs agences'),(13,'destroy_field_agencies','Autorisé à supprimer les champs agences'),(14,'index_categories','Autorisé à voir la liste des catégories'),(15,'show_categories','Autorisé à voir les détails d\'une catégorie'),(16,'edit_categories','Autorisé à éditer une categorie'),(17,'create_categories','Autorisé à créer de nouvelles catégories'),(18,'update_categories','Autorisé à éditer une categorie'),(19,'destroy_categories','Autorisé à supprimer une catégorie'),(20,'index_sous_categories','Autorisé à voir la liste des sous categories'),(21,'show_sous_categories','Autorisé à voir le détail d\'une sous catégorie'),(22,'new_sous_categories','Autorisé à créer de nouvelles sous catégories'),(23,'edit_sous_categories','Autorisé à éditer une sous catégorie'),(24,'create_sous_categories','Autorisé à créer de nouvelles sous catégories'),(25,'update_sous_categories','Autorisé à éditer une sous catégorie'),(26,'destroy_sous_categories','Autorisé à supprimer les sous catégories'),(27,'index_detentor_types','Autorisé à voir les types de détenteur de matériel'),(28,'index_field_sellers','Autorisé à voir les champs de données pour les vendeurs'),(29,'create_field_sellers','Autorisé à créer des champs de données pour les vendeurs'),(30,'update_field_sellers','Autorisé à éditer des champs de données pour les vendeurs'),(31,'destroy_field_sellers','Autorisé à supprimer des champs de données pour les vendeurs'),(32,'index_field_type_users','Autorisé à voir les champs types utilisateurs'),(33,'create_field_type_users','Autorisé à ajouter un champ pour un type utilisateur'),(34,'update_field_type_users','Autorisé à éditer des champs de type utilisateur'),(35,'destroy_field_type_users','Autorisé à supprimer un champ de type utilisateur'),(36,'unassigns_field_type_users','Autorisé à dé-assigner des champs de type utilisateur'),(37,'force_destroy_field_type_users','Autorisé à supprimer un champ de type utilisateur même si un utilisateur l\'a déjà renseigné'),(38,'index_incidents','Autorisé à voir tous les incidents'),(39,'without_tech_incidents','Autorisé à voir les incidents non attribués'),(40,'show_incidents','Autorisé à éditer ses incidents'),(41,'new_incidents','Autorisé à voir la page pour créer un incident'),(42,'edit_incidents','Autorisé à éditer un incident d\'un autre membre'),(43,'create_incidents','Autorisé à créer de nouveaux incidents'),(44,'update_incidents','Autorisé à éditer un incident'),(45,'destroy_incidents','Autorisé à supprimer un incident'),(46,'reject_incidents','Autorisé à rejeter un incident'),(47,'cloture_incidents','Autorisé à cloturer les incidents ou à faire une demande de cloture'),(48,'index_materials','Autorisé à voir les matériels'),(49,'show_materials','Autorisé à voir les détails du matériel'),(50,'new_materials','Autorisé à voir la page de creation des matériels'),(51,'edit_materials','Autorisé à voir la page d\'edition des matériels'),(52,'create_materials','Autorisé à créer des matériels'),(53,'update_materials','Autorisé à éditer des matériels'),(54,'destroy_materials','Autorisé à supprimer des materiels'),(55,'index_procedures','Autorisé à voir les procedures'),(56,'show_procedures','Autorisé à voir le détail d\'une procedure'),(57,'new_procedures','Autorisé à voir la page créer une procedure'),(58,'edit_procedures','Autorisé à voir la page éditer les procedures'),(59,'create_procedures','Autorisé à créer une procedure'),(60,'update_procedures','Autorisé à créer une procedure'),(61,'destroy_procedures','Autorisé à supprimer une procedure'),(62,'index_rights','Autorisé à voir la liste des droits'),(63,'show_rights','Autorisé à voir le détail du droit'),(64,'index_sellers','Autorisé à voir les vendeurs de matériel'),(65,'show_sellers','Autorisé à voir le détail du vendeur de matériel'),(66,'create_sellers','Autorisé à créer des vendeurs de matériel'),(67,'update_sellers','Autorisé à éditer des vendeurs de matériel'),(68,'destroy_sellers','Autorisé à supprimer des vendeurs de matériel'),(69,'disable_sellers','Autorisé à désactiver des vendeurs de matériel'),(70,'index_spec_materials','Autorisé à voir les spec pour les matériels'),(71,'create_spec_materials','Autorisé à créer des specs pour les matériels'),(72,'update_spec_materials','Autorisé à éditer des specs pour les matériels'),(73,'destroy_spec_materials','Autorisé à supprimer les specs pour les matériels'),(74,'index_spec_type_materials','Autorisé à voir les champs de spec pour les matériels'),(75,'create_spec_type_materials','Autorisé à créer des champs de spec pour les matériels'),(76,'update_spec_type_materials','Autorisé à éditer des champs de spec pour les matériels'),(77,'destroy_spec_type_materials','Autorisé à supprimer des champs de spec pour les matériels'),(78,'index_type_materials','Autorisé à voir les types de matériels'),(79,'create_type_materials','Autorisé à créer des types de matériels'),(80,'edit_type_materials','Autorisé à éditer des types de matériels'),(81,'destroy_type_materials','Autorisé à supprimer des types de matériels'),(82,'index_type_users','Autorisé à voir la liste des types utilisateurs'),(83,'update_type_users','Autorisé à editer un type utilisateur'),(84,'create_type_users','Autorisé à ajouter un type utilisateur'),(85,'disable_type_users','Autorisé à désactiver un type utilisateur'),(86,'destroy_type_users','Autorisé à supprimer un type utilisateur'),(87,'index_updates','Autorisé à voir les mises à jour'),(88,'show_updates','Autorisé à voir les détails d\'une mise à jour'),(89,'new_updates','Autorisé à voir la page créer une mise à jour'),(90,'edit_updates','Autorisé à voir la page éditer une mise à jour'),(91,'create_updates','Autorisé à créer une mise à jour'),(92,'update_updates','Autorisé à éditer une mise à jour'),(93,'destroy_updates','Autorisé à supprimer un mise à jour'),(94,'index_users','Autorisé à voir la liste des utilisateurs'),(95,'enable_disable_users','Autorisé à désactiver/activer un utilisateur'),(96,'edit_users','Autorisé à éditer ses informations personnelles'),(97,'edit_other_users','Autorisé à editer le profil d\'autres utilisateurs'),(98,'full_edit_users','Autorisé à éditer tous les champs d\'un utilisateur'),(99,'create_users','Autorisé à créer un admin'),(100,'update_users','Autorisé à editer son profil'),(101,'destroy_users','Autorisé à supprimer un utilisateur');
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

-- Dump completed on 2017-05-12  9:54:54
