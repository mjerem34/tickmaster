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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (1,'index_users','Autorisé à voir la liste des utilisateurs'),(2,'create_new_tech','Autorisé à créer un nouvel utilisateur, tech, supertech, admin'),(3,'create_new_right','Autorisé à créer de nouveaux droits'),(4,'create_categories','Autorisé à créer de nouvelles catégories'),(5,'index_incidents','Autorisé à voir les incidents de tous les membres'),(6,'new_incidents','Autorisé à créer de nouveaux incidents'),(7,'new_sous_categories','Autorisé à créer de nouvelles sous catégories'),(8,'index_categories','Autorisé à voir la liste des catégories'),(9,'show_categories','Autorisé à voir les détails d\'une catégorie'),(10,'edit_categories','Autorisé à éditer une categorie'),(11,'destroy_categories','Autorisé à supprimer une catégorie'),(12,'view_details_incident_of_other_member','Autorisé à voir les détails d\'un incident d\'un autre membre'),(13,'edit_incidents','Autorisé à éditer un incident d\'un autre membre'),(14,'delete_incident','Autorisé à supprimer un incident'),(15,'edit_sous_categories','Autorisé à éditer une sous catégorie'),(16,'index_sous_categories','Autorisé à voir la liste des sous categories'),(17,'show_sous_categories','Autorisé à voir le détail d\'une sous catégorie'),(18,'destroy_sous_categories','Autorisé à supprimer les sous catégories'),(19,'edit_rights','Autorisé à éditer un droit'),(20,'view_index_rights','Autorisé à voir la liste des droits'),(21,'delete_rights','Autorisé à supprimer des droits'),(22,'without_tech_incidents','Autorisé à attribuer les incidents aux techniciens'),(23,'view_index_fonctions','Autorisé à voir la liste des fonctions'),(24,'create_new_fonctions','Autorisé à créer une nouvelle fonction'),(25,'edit_fonctions','Autorisé à éditer une fonction'),(26,'delete_fonctions','Autorisé à supprimer une fonction'),(27,'view_users_pages','Autorisé à voir la page des autres membres'),(28,'reject_incidents','Autorisé à rejeter un incident'),(29,'cloture_incidents','Autorisé à cloturer les incidents ou à faire une demande de cloture'),(30,'view_button_admin','Autorisé à voir le bouton administration'),(31,'index_agencies','Autorisé à voir la page d\'index des agences'),(32,'show_agencies','Autorisé à voir les détails d\'une agence'),(33,'new_agency','Autorisé à créer une nouvelle agence'),(34,'edit_agencies','Autorisé à editer une agence existante'),(35,'edit_user','Autorisé à éditer ses informations personnelles'),(36,'edit_other_user','Autorisé à editer le profil d\'autres utilisateurs'),(37,'edit_all_user','Autorisé à modifier tous les champs d\'un utilisateur'),(38,'edit_like_a_boss','Autorisé à modifier le type d\'utilisateur'),(39,'view_detail_incident','Autorisé à voir le détail des incidents'),(40,'ask_for_reaffect','Autorisé à demander une réaffectation de l\'incident'),(41,'edit_categories_incidents','Autorisé à modifier la catégorie et sous catégorie d\'un incident'),(42,'edit_lvl_incident','Autorisé à modifier le niveau d\'un incident'),(43,'save_changes_of_edit','Autorisé à enregistrer les modifications d\'un incident'),(44,'treat_incidents','Autorisé à traiter les incidents'),(45,'create_procedure','Autorisé à créer une procedure'),(46,'view_procedures','Autorisé à voir les procedures'),(47,'edit_procedure','Autorisé à modifier les procedures'),(48,'archive_procedure','Autorisé à archiver les procedures'),(49,'delete_procedure','Autorisé à supprimer une procedure'),(50,'ping_agencies','Autorisé à pinger les agences'),(51,'create_sellers','Autorisé à ajouter des vendeurs de matériel'),(52,'modify_sellers','Autorisé à modifier des vendeurs de matériel'),(53,'delete_sellers','Autorisé à supprimer des vendeurs de matériel'),(54,'view_sellers','Autorisé à voir les vendeurs de matériel'),(55,'create_field_sellers','Autorisé à créer des champs de données pour les vendeurs'),(56,'update_field_sellers','Autorisé à modifier des champs de données pour les vendeurs'),(57,'destroy_field_sellers','Autorisé à supprimer des champs de données pour les vendeurs'),(58,'index_field_sellers','Autorisé à voir les champs de données pour les vendeurs'),(59,'create_detentor_type','Autorisé à créer des types de detenteur de matériel'),(60,'modify_detentor_type','Autorisé à modifier des types de detenteur de matériel'),(61,'delete_detentor_type','Autorisé à supprimer des types de detenteur de matériel'),(62,'index_detentor_types','Autorisé à voir les types de détenteur de matériel'),(63,'create_material','Autorisé à créer des matériels'),(64,'modify_material','Autorisé à modifier des matériels'),(65,'delete_material','Autorisé à supprimer des materiels'),(66,'view_material','Autorisé à voir les matériels'),(67,'create_spec_material','Autorisé à créer des specs pour les matériels'),(68,'modify_spec_material','Autorisé à modifier des specs pour les matériels'),(69,'delete_spec_material','Autorisé à supprimer les specs pour les matériels'),(70,'view_spec_material','Autorisé à voir les spec pour les matériels'),(71,'create_spec_type_material','Autorisé à créer des champs de spec pour les matériels'),(72,'modify_spec_type_material','Autorisé à modifier des champs de spec pour les matériels'),(73,'delete_spec_type_material','Autorisé à supprimer des champs de spec pour les matériels'),(74,'view_spec_type_material','Autorisé à voir les champs de spec pour les matériels'),(75,'create_type_material','Autorisé à créer des types de matériels'),(76,'modify_type_material','Autorisé à modifier des types de matériels'),(77,'delete_type_material','Autorisé à supprimer des types de matériels'),(78,'view_type_material','Autorisé à voir les types de matériels'),(79,'doPing','Autorisé à pinger'),(80,'destroy_agencies','Autorisé à supprimer une agence'),(81,'delete_user','Autorisé à supprimer un utilisateur'),(82,'create_update','Autorisé à créer une mise à jour'),(83,'modify_update','Autorisé à modifier une mise à jour'),(84,'delete_update','Autorisé à supprimer un mise à jour'),(85,'view_update','Autorisé à voir les mises à jour'),(86,'enable_disable_user','Autorisé à activer ou désactiver un utilisateur'),(87,'view_type_users','Autorisé à voir la liste des types utilisateurs'),(88,'edit_type_users','Autorisé à editer un type utilisateur'),(89,'add_type_users','Autorisé à ajouter un type utilisateur'),(90,'create_field_type_users','Autorisé à ajouter un champ pour un type utilisateur'),(91,'disable_type_users','Autorisé à désactiver un type utilisateur'),(92,'destroy_type_users','Autorisé à supprimer un type utilisateur'),(93,'unbind_field_type_users','Autorisé à dé-assigner des champs de type utilisateur'),(94,'destroy_field_type_users','Autorisé à supprimer un champ de type utilisateur'),(95,'update_field_type_users','Autorisé à modifier des champs de type utilisateur'),(96,'delete_type_material_seller','Autorisé à supprimer les types de materiels que vend un vendeur'),(97,'index_field_type_users','Autorisé à voir les champs types utilisateurs'),(98,'index_field_agencies','Autorisé à voir les champs agences'),(99,'create_field_agencies','Autorisé à créer les champs agences'),(100,'update_field_agencies','Autorisé à editer les champs agences'),(101,'destroy_field_agencies','Autorisé à supprimer les champs agences');
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

-- Dump completed on 2017-03-21 14:17:23
