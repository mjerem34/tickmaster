CREATE DATABASE  IF NOT EXISTS `Tickets_development` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `Tickets_development`;
-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: 10.0.171.250    Database: Tickets_development
-- ------------------------------------------------------
-- Server version	5.5.49-0+deb8u1

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
-- Table structure for table `agencies`
--

DROP TABLE IF EXISTS `agencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adress` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adress2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adress3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_adress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (1,'CLE NARBONNE','ZA Bonne Source','29 rue Ernest Cognacq','NULL','11100','NARBONNE','narbonne@cle-expertises.fr','04 68 90 68 00','04 68 90 60 16','Aude','10.0.170.240'),(2,'CLE MONTPELLIER','337 rue Charles Nungesser','NULL','NULL','34135','MAUGUIO','montpellier@cle-expertises.fr','04 67 99 90 67','04 67 99 92 34','Hérault','10.0.171.240'),(3,'CLE NÎMES','125 rue de l\'Hostellerie','Immeuble ELLIPSIS','NULL','30900','NÎMES','nimes@cle-expertises.fr','04 66 70 66 33','04 11 94 00 42','Gard','10.0.27.236'),(4,'CLE PROVENCE','Europarc Ste Victoire','Route de Valbrillant','Bâtiment 2','13590','MEYREUIL','provence@cle-expertises.fr','04 42 50 76 85','04 42 26 75 96','Bouches-du-Rhône','10.0.173.240'),(5,'CLE PERPIGNAN','Le Phoenix','840 avenue Argelès sur mer','NULL','66100','PERPIGNAN','perpignan@cle-expertises.fr','04 68 08 24 84','04 68 64 31 53','Pyrénées Orientales','10.0.174.240'),(6,'CLE TOULOUSE','12 avenue José Cabanis','NULL','NULL','31130','QUINT-FONSEGRIVES','toulouse@cle-expertises.fr','05 61 24 26 35','05 61 24 67 62','Haute Garone','10.0.175.240'),(7,'CLE VALENCE','1 rue Jean Bertin','NULL','NULL','26000','VALENCE','valence@cle-expertises.fr','04 75 58 08 96','04 75 57 66 23','Drôme','10.0.176.240'),(8,'CLE RODEZ','Parc Commercial des Moutiers','7 avenue de l\'Entreprise','NULL','12000','RODEZ','rodez@cle-expertises.fr','05 65 60 57 84','05 65 59 78 51','Aveyron','10.0.177.240'),(9,'CLE AVIGNON','17 Boulevard Champ Fleury','NULL','NULL','84000','AVIGNON','avignon@cle-expertises.fr','04 42 50 76 85','04 42 26 75 96','Vaucluse','10.0.173.240'),(10,'CLE ALBI','60 boulevard Soult','NULL','NULL','81000','ALBI','albi@cle-expertises.fr','05 61 24 26 35','05 61 24 67 62','Tarn','10.0.175.240'),(11,'CLE LYON','Les Jardins d\'Entreprises','213 rue de Gerland','Bâtiment B3','69007','LYON','lyon@cle-expertises.fr','04 37 70 61 13','04 37 70 61 14','Rhône','10.0.178.240'),(12,'CLE FREJUS','La Muscadière','1527 via Aurelia','NULL','83600','FREJUS','frejus@cle-expertises.fr','04 94 53 13 59','04 94 40 37 85','Var','10.0.179.240'),(13,'CLE LATTES','337 rue Charles Nungesser','NULL','NULL','34135','MAUGUIO','montpellier@cle-expertises.fr','04 67 99 90 67','04 67 99 92 34','Hérault','10.0.180.240'),(14,'CLE BORDEAUX','!! Nouvelles coordonnées !!','2 Avenue Léonard de Vinci','Europarc','33600','PESSAC','bordeaux@cle-expertises.fr','05 57 92 23 80','05 57 92 23 89','Gironde','10.0.181.240'),(15,'CLE GRENOBLE','8 rue Duployé','NULL','NULL','38000','GRENOBLE','grenoble@cle-expertises.fr','04 76 26 47 14','04 76 26 49 06','Isère','NULL'),(16,'CLE TOULON','224 rue des Découvertes','NULL','NULL','83390','CUERS','toulon@cle-expertises.fr','04 94 08 11 14','04 94 01 98 58','Var','10.0.182.240'),(17,'CLE CARCASSONNE','5 rue de l\'industrie','NULL','NULL','11800','TREBES','carcassonne@cle-expertises.fr','04 68 76 02 52','04 68 90 60 16','Aude','NULL'),(18,'CLE MONTAUBAN','99 faubourg Lacapelle','NULL','NULL','82000','MONTAUBAN','montauban@cle-expertises.fr','05 61 24 26 35','05 61 24 67 62','Tarn-et-garonne','10.0.175.240'),(19,'CLE ILE DE FRANCE','57 boulevard de Picpus','NULL','NULL','75012','PARIS','idf@cle-expertises.fr','01 53 44 71 19','01 40 01 03 60','Paris','10.0.183.240'),(20,'CLE NICE','ESPACE MANDELIEU','154 avenue de Cannes','Bâtiment A','6210','MANDELIEU LA NAPOULE','nice@cle-expertises.fr','04 93 48 15 68','04 93 48 16 47','Alpes maritimes','10.0.184.240'),(21,'CLE TARBES','17 avenue du Maréchal Joffre','NULL','NULL','65000','TARBES','tarbes@cle-expertises.fr','05 61 24 26 35','05 61 24 67 62','Hautes pyrénées','10.0.175.240'),(22,'CLE NANTES','11 rue des frères Lumière','Centre d\'affaire Cap West','Bat A2','44119','TREILLIERES','nantes@cle-expertises.fr','02 40 14 59 80','02 40 14 59 84','Loire atlantique','10.0.188.240'),(23,'CLE BAYONNE','50 route de Maignon','NULL','NULL','64600','ANGLET','bayonne@cle-expertises.fr','05 59 29 22 82','05 59 15 06 70','Pyrénées Atlantiques','10.0.185.240'),(26,'CLE CAEN','3 rue Léonard Gille','NULL','NULL','14320','ST MARTIN DE FONTENAY','caen@cle-expertises.fr','04 67 99 90 67','04 67 99 92 34','Calvados','10.0.171.240'),(27,'CLE CHAMBERY','146 allée des Erables','NULL','NULL','73420','DRUMETTAZ CLARAFOND','chambery@cle-expertises.fr','04 79 52 49 40','04 79 34 54 74','Savoie','10.0.186.240'),(28,'CLE ORLEANS','75 rue des Sables de Sary','NULL','NULL','45770','SARAN','orleans@cle-expertises.fr','04 67 99 90 67','04 67 99 92 34','Loiret','10.0.183.240'),(29,'CLE TROYES','2 place Casimir Perier','NULL','NULL','10000','TROYES','troyes@cle-expertises.fr','04 67 99 90 67','04 67 99 92 34','Aube','NULL'),(30,'CLE DIJON','Le  Broge IV','2-4 rue du Dauphiné','NULL','21121','FONTAINE LES DIJON','dijon@cle-expertises.fr','04 37 70 61 13','04 37 70 61 14','Côte d\'or','10.0.178.240'),(31,'CLE LILLE','Centre Intertransport','Bât F','Port fluvial','59000','LILLE','lille@cle-expertises.fr','04 67 99 90 67','04 67 99 92 34','Nord','10.0.189.240'),(32,'CLE COLMAR','12 place du Capitaine Dreyfus','NULL','NULL','68000','COLMAR','colmar@cle-expertises.fr','03 68 11 00 20','04 67 99 92 34','Haut Rhin','10.0.190.240'),(33,'CLE LIMOGES','54 avenue de Garibaldi','NULL','NULL','87000','LIMOGES','limoges@cle-expertises.fr','05 61 24 26 35','05 61 24 67 62','Haute vienne','10.0.175.240'),(34,'CLE RENNES','4 A rue du Bignon','NULL','NULL','35000','RENNES','rennes@cle-expertises.fr','04 67 99 90 67','04 67 99 92 34','Ille-et-vilaine','10.0.171.240'),(35,'CLE METZ','7 rue André Marie Ampère','NULL','NULL','57000','METZ','metz@cle-expertises.fr','04 67 99 90 67','04 67 99 92 34','Moselle','10.0.171.240'),(36,'CLE TOURS','57 rue Mûrier','NULL','NULL','37540','SAINT CYR SUR LOIRE','tours@cle-expertises.fr','05 61 24 26 35','05 61 24 67 62','Indre et loire','10.0.175.240');
/*!40000 ALTER TABLE `agencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archives`
--

DROP TABLE IF EXISTS `archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `incident_id` int(11) DEFAULT NULL,
  `sender_id` smallint(6) DEFAULT NULL,
  `receiver_id` smallint(6) DEFAULT NULL,
  `ip_adress_sender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pc_id` int(11) DEFAULT NULL,
  `attach_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_file_size` int(11) DEFAULT NULL,
  `attach_updated_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_archives_on_incident_id` (`incident_id`),
  KEY `index_archives_on_pc_id` (`pc_id`),
  KEY `index_archives_on_attachment_id` (`attach_file_name`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archives`
--

LOCK TABLES `archives` WRITE;
/*!40000 ALTER TABLE `archives` DISABLE KEYS */;
INSERT INTO `archives` VALUES (11,'Incident créé par Montesinos\n          Jeremy',28,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-24 06:55:49','2016-05-24 06:55:49'),(12,'Incident affecté',28,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-24 06:55:49','2016-05-24 06:55:49'),(13,'Cloture de l\'incident : ',28,1,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-05-24 06:55:49','2016-05-24 06:55:49'),(17,'Incident créé par Kopf\n          Sandrine',30,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-30 06:41:12','2016-05-30 06:41:12'),(18,'Incident affecté',30,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-30 06:41:12','2016-05-30 06:41:12'),(19,'Incident affecté',30,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-30 06:41:12','2016-05-30 06:41:12'),(20,'Incident affecté',30,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-30 06:41:12','2016-05-30 06:41:12'),(21,'Incident créé par Montesinos\n          Jeremy',25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-02 09:24:16','2016-05-02 09:24:16'),(22,'ddd',25,1,NULL,'192.168.10.49',NULL,NULL,NULL,NULL,NULL,'2016-05-02 09:24:16','2016-05-02 09:24:16'),(23,'Incident affecté',25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-02 09:24:16','2016-05-02 09:24:16'),(24,'Cloture de l\'incident : ',25,1,1,'192.168.10.49',NULL,NULL,NULL,NULL,NULL,'2016-05-02 09:24:16','2016-05-02 09:24:16'),(25,'Incident créé par Kopf\n          Sandrine',26,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-17 15:00:01','2016-05-17 15:00:01'),(26,'Incident affecté',26,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-17 15:00:01','2016-05-17 15:00:01'),(27,'Incident affecté',26,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-17 15:00:01','2016-05-17 15:00:01'),(28,'Cloture de l\'incident : problème réglé par téléphone.',26,4,11,'192.168.10.31',NULL,NULL,NULL,NULL,NULL,'2016-05-17 15:00:01','2016-05-17 15:00:01'),(29,'Cloture de l\'incident : Merci bcp de ton intervention efficace comme chaque fois !',26,11,4,'10.0.176.1',NULL,NULL,NULL,NULL,NULL,'2016-05-17 15:00:01','2016-05-17 15:00:01'),(33,'Incident créé par Naudin\n          Carole',21,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-04-27 13:37:43','2016-04-27 13:37:43'),(34,'Incident affecté',21,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-04-27 13:37:47','2016-04-27 13:37:47'),(35,'Cloture de l\'incident : vu au telephone',21,4,8,'192.168.10.32',NULL,NULL,NULL,NULL,NULL,'2016-04-27 13:37:51','2016-04-27 13:37:51'),(36,'Incident cloturé automatiquement',21,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-04-27 13:37:54','2016-04-27 13:37:54'),(37,'Incident créé par Naudin\n          Carole',22,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-04-27 13:37:57','2016-04-27 13:37:57'),(38,'Incident affecté',22,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-04-27 13:38:02','2016-04-27 13:38:02'),(39,'Cloture de l\'incident : vu au telephone',22,4,8,'192.168.10.32',NULL,NULL,NULL,NULL,NULL,'2016-04-27 13:38:05','2016-04-27 13:38:05'),(40,'Incident cloturé automatiquement',22,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-04-27 13:38:12','2016-04-27 13:38:12'),(41,'Incident créé par Montesinos\n          Jeremy',27,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-18 14:19:30','2016-05-18 14:19:30'),(42,'Incident affecté',27,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-18 14:19:30','2016-05-18 14:19:30'),(43,'Incident rejeté : ',27,1,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-05-18 14:19:30','2016-05-18 14:19:30'),(44,'Incident créé par Partoo\n          Yvon',29,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-24 12:38:15','2016-05-24 12:38:15'),(45,'Incident affecté',29,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-24 12:38:15','2016-05-24 12:38:15'),(46,'Incident rejeté : ',29,1,5,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-05-24 12:38:15','2016-05-24 12:38:15'),(47,'Incident créé par Auclair\n          Josiane',23,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:02','2016-06-11 09:59:02'),(48,'Incident affecté',23,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:06','2016-06-11 09:59:06'),(49,'Bonjour Josiane,\r\nJ\'ai remis tous les docs sur le NAS, tu devais pouvoir les consulter à ta guise.\r\nSi tu veux et si c\'est bon, essais de clôturer ton ticket, merki!\r\n\r\nA bientôt!',23,4,10,'192.168.10.32',NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:08','2016-06-11 09:59:08'),(50,'Cloture de l\'incident : ',23,1,4,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:11','2016-06-11 09:59:11'),(51,'Incident affecté',23,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:18','2016-06-11 09:59:18'),(52,'Cloture de l\'incident : ',23,1,10,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:20','2016-06-11 09:59:20'),(53,'Incident cloturé automatiquement',23,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:38','2016-06-11 09:59:38'),(54,'Incident créé par Ferrier\n          Sandie',31,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:40','2016-06-11 09:59:40'),(55,'Incident affecté',31,12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:42','2016-06-11 09:59:42'),(56,'Cloture de l\'incident : ',31,1,12,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:45','2016-06-11 09:59:45'),(57,'Incident cloturé automatiquement',31,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-11 09:59:47','2016-06-11 09:59:47');
/*!40000 ALTER TABLE `archives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attach_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_file_size` int(11) DEFAULT NULL,
  `attach_updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automessages`
--

DROP TABLE IF EXISTS `automessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automessages`
--

LOCK TABLES `automessages` WRITE;
/*!40000 ALTER TABLE `automessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `automessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Net-Expert','2015-12-08 13:40:34','2015-12-08 13:40:34'),(2,'Imprimante/Télécopieur','2015-12-08 13:40:53','2015-12-08 13:40:53'),(3,'Internet/Réseau','2015-12-08 13:41:10','2015-12-08 13:43:08'),(4,'Logiciel','2015-12-08 13:41:25','2015-12-08 13:41:25'),(5,'Matériel','2015-12-08 13:41:33','2015-12-08 13:41:33'),(6,'Mobile','2015-12-08 13:41:48','2015-12-08 13:41:48'),(9,'Autre','2016-01-26 10:48:05','2016-01-26 10:48:05');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_archives`
--

DROP TABLE IF EXISTS `file_archives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archive_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_archives`
--

LOCK TABLES `file_archives` WRITE;
/*!40000 ALTER TABLE `file_archives` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_archives` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_incidents`
--

LOCK TABLES `file_incidents` WRITE;
/*!40000 ALTER TABLE `file_incidents` DISABLE KEYS */;
INSERT INTO `file_incidents` VALUES (8,20,'RCD825057-007.DOC',216064,'application/msword','2016-02-02 11:03:08','2016-02-02 11:03:08'),(9,25,'puma.conf',2071,'application/octet-stream','2016-05-02 07:24:41','2016-05-02 07:24:41'),(10,27,'mister_auto_cardan.pdf',28346,'application/pdf','2016-05-18 09:09:29','2016-05-18 09:09:29');
/*!40000 ALTER TABLE `file_incidents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_procedures`
--

DROP TABLE IF EXISTS `file_procedures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_procedures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `procedure_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_procedures`
--

LOCK TABLES `file_procedures` WRITE;
/*!40000 ALTER TABLE `file_procedures` DISABLE KEYS */;
INSERT INTO `file_procedures` VALUES (1,1,'Capture.PNG',33177,'image/png','2016-06-10 14:52:02','2016-06-10 14:52:02');
/*!40000 ALTER TABLE `file_procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_responses`
--

DROP TABLE IF EXISTS `file_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `response_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_responses`
--

LOCK TABLES `file_responses` WRITE;
/*!40000 ALTER TABLE `file_responses` DISABLE KEYS */;
INSERT INTO `file_responses` VALUES (1,31,'Capture.PNG',33177,'image/png','2016-06-10 14:49:35','2016-06-10 14:49:35');
/*!40000 ALTER TABLE `file_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_users`
--

DROP TABLE IF EXISTS `file_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_users`
--

LOCK TABLES `file_users` WRITE;
/*!40000 ALTER TABLE `file_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_users` ENABLE KEYS */;
UNLOCK TABLES;

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
  `agency_id` smallint(6) DEFAULT NULL,
  `lvl_urgence_user` tinyint(4) DEFAULT NULL,
  `lvl_urgence_tech` tinyint(4) DEFAULT NULL,
  `cloture_user` tinyint(1) DEFAULT NULL,
  `cloture_tech` tinyint(1) DEFAULT NULL,
  `pc_id` int(11) DEFAULT NULL,
  `ip_adress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `solution` text COLLATE utf8_unicode_ci,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link_faq` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incident_state_id_for_user_id` tinyint(4) DEFAULT NULL,
  `incident_state_id_for_tech_id` tinyint(4) DEFAULT NULL,
  `lvl_of_incident` int(11) DEFAULT NULL,
  `archived_at` datetime DEFAULT NULL,
  `resolved_at` datetime DEFAULT NULL,
  `attach_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_file_size` int(11) DEFAULT NULL,
  `attach_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `incidentscol` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_incidents_on_pc_id` (`pc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (21,'POINT D ENTREE','<p>Bonjour</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Le point d&#39;entr&eacute;e est bloqu&eacute;.</p>\r\n\r\n<p>Au niveau du gestionnaire des t&acirc;ches c&#39;est OUTLOOK.EXE que je dois arr&ecirc;ter ?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Merci bcp</p>\r\n',8,4,9,36,NULL,10,1,NULL,NULL,NULL,'10.0.171.13',NULL,NULL,NULL,7,7,1,NULL,'2016-02-09 15:51:32',NULL,NULL,NULL,NULL,'2016-02-08 10:39:04','2016-04-27 13:37:43',NULL),(22,'POINT D ENTREE','<p>Bonjour</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Le point d&#39;entr&eacute;e est bloqu&eacute;.</p>\r\n\r\n<p>Au niveau du gestionnaire des t&acirc;ches c&#39;est OUTLOOK.EXE que je dois arr&ecirc;ter ?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Merci bcp</p>\r\n',8,4,9,36,NULL,10,1,NULL,NULL,NULL,'10.0.171.13',NULL,NULL,NULL,7,7,1,NULL,'2016-02-09 15:52:06',NULL,NULL,NULL,NULL,'2016-02-08 10:39:12','2016-04-27 13:37:57',NULL),(23,'DOSSIER 800309  - NON ACCES AUX FICHIERS - ANNEE 2008','<p>Merci de me donner l&#39;acc&egrave;s &agrave; tous les fichiers de l&#39;historique NET EXPERT - c&#39;est un dossier qui date de 2008/2009</p>\r\n\r\n<p>AXA&nbsp;SERVICE RECOURS &nbsp;a perdu l&#39;entier dossier et souhaite qu&#39;on leur transmette</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n',10,1,1,27,NULL,1,1,NULL,NULL,NULL,'10.0.171.17',NULL,NULL,NULL,7,7,1,NULL,'2016-06-08 08:18:10',NULL,NULL,NULL,NULL,'2016-02-11 12:35:41','2016-06-11 09:59:02',NULL),(25,'test','<p>test</p>\r\n',1,1,1,14,NULL,0,1,NULL,NULL,NULL,'192.168.10.49',NULL,NULL,NULL,7,7,1,'2016-05-02 09:24:15','2016-05-02 09:24:15',NULL,NULL,NULL,NULL,'2016-05-02 07:24:41','2016-05-02 09:24:15',NULL),(26,'Impossible de générer un Word','<p>Bonjour,</p>\r\n\r\n<p>Il m&#39;est impossible de g&eacute;n&eacute;rer un Word. Un message d&#39;erreur apparait.</p>\r\n\r\n<p>J&#39;ai d&eacute;j&agrave; fait un Crtl Alt Supp et arr&ecirc;t&eacute; le processus Win Word. rien n&#39;y fait.</p>\r\n\r\n<p>J&#39;ai &eacute;galement red&eacute;marrer le PC, aucun r&eacute;sultat.</p>\r\n\r\n<p>Merci d&#39;intervenir je suis bloqu&eacute;e</p>\r\n\r\n<p>Sandrine (Valence)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n',11,4,1,14,NULL,10,1,NULL,NULL,NULL,'10.0.176.1',NULL,NULL,NULL,7,7,1,'2016-05-17 15:00:01','2016-05-17 15:00:01',NULL,NULL,NULL,NULL,'2016-05-17 13:03:31','2016-05-17 15:00:01',NULL),(27,'ddd','<p>dddddd</p>\r\n',1,1,1,14,2,0,1,NULL,NULL,NULL,'192.168.10.125',NULL,NULL,NULL,10,10,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-18 09:09:28','2016-05-18 14:19:30',NULL),(28,'ddd','<p>dddd</p>\r\n',1,1,1,14,2,0,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-05-24 06:55:49','2016-05-24 06:55:49',NULL,NULL,NULL,NULL,'2016-05-23 09:04:18','2016-05-24 06:55:49',NULL),(29,'aaaaaaaaa','<p>cccccc</p>\r\n',5,1,1,14,2,7,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-05-24 08:22:20','2016-05-24 12:38:15',NULL),(30,'dossier 510841','<p>Bonjour,</p>\r\n\r\n<p>Nous devons faire partir un rapport. Lors de la transformation en pdf tout se passe bien pour la LA et la NH mais concernant le rapport voici le message d&#39;erreur (donc impossible de le convertir en pdf, ni l&#39;ouvrir depuis l&#39;historique ou l&#39;onglet document, seulement depuis l&#39;explorateur avec un message d&#39;office qui le bloque par s&eacute;curit&eacute;).</p>\r\n\r\n<p>Probl&egrave;me rencontr&eacute; par Aur&eacute;lie LLADERES mais aussi par moi-m&ecirc;me</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Proc&eacute;dure : System.Runtime.InteropServices.COMException (0x800A1897): Office a d&eacute;tect&eacute; un probl&egrave;me avec ce fichier. Son ouverture a &eacute;t&eacute; bloqu&eacute;e pour prot&eacute;ger votre ordinateur.<br />\r\n&nbsp;(<a href=\"file://\\\\10.0.176.240\\...\\RCD510841-006.DOC\">\\\\10.0.176.240\\...\\RCD510841-006.DOC</a>)<br />\r\n&nbsp;&nbsp; at Word.Documents.Open(Object&amp; FileName, Object&amp; ConfirmConversions, Object&amp; ReadOnly, Object&amp; AddToRecentFiles, Object&amp; PasswordDocument, Object&amp; PasswordTemplate, Object&amp; Revert, Object&amp; WritePasswordDocument, Object&amp; WritePasswordTemplate, Object&amp; Format, Object&amp; Encoding, Object&amp; Visible, Object&amp; OpenAndRepair, Object&amp; DocumentDirection, Object&amp; NoEncodingDialog, Object&amp; XMLTransform)<br />\r\n&nbsp;&nbsp; at Netexpert.WordFunctions.OpenWordFile(String FilePath, Boolean visible, String cheminphoto, Boolean PrintAuto, String DefPrinter, String PDFNAme, Int32 NBEX, Boolean MWORD, Boolean DEJAOUVERT, Boolean Validation)<br />\r\nopenWordfile FLag =4SystemException&nbsp; Statuts :<br />\r\nChemin : <a href=\"file://\\\\10.0.176.240\\netexpert\\dossiers\\510841\\RCD510841-006.DOC\">\\\\10.0.176.240\\netexpert\\dossiers\\510841\\RCD510841-006.DOC</a><br />\r\nVisible : True<br />\r\nChemin photo : <a href=\"file://\\\\10.0.176.240\\netexpert\\dossiers\\510841\\photos\">\\\\10.0.176.240\\netexpert\\dossiers\\510841\\photos</a><br />\r\nImpression Auto: False<br />\r\nImprimante :<br />\r\nPDF :<br />\r\nNB exemplaire : 1<br />\r\nMword : False</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Source de l&#39;erreur : NetExpertMicrosoft Word</p>\r\n\r\n<p>Dossier : 510841<br />\r\nN&deg; de l&#39;erreur : 3</p>\r\n\r\n<p>Description de l&#39;erreur : Office a d&eacute;tect&eacute; un probl&egrave;me avec ce fichier. Son ouverture a &eacute;t&eacute; bloqu&eacute;e pour prot&eacute;ger votre ordinateur.<br />\r\n&nbsp;(<a href=\"file://\\\\10.0.176.240\\...\\RCD510841-006.DOC\">\\\\10.0.176.240\\...\\RCD510841-006.DOC</a>)</p>\r\n\r\n<p>Merci</p>\r\n\r\n<p>L&#39;&eacute;cureuil</p>\r\n\r\n<p>&nbsp;</p>\r\n',11,6,1,14,7,0,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-05-30 06:41:28','2016-05-30 06:41:28',NULL,NULL,NULL,NULL,'2016-05-25 15:42:37','2016-05-30 06:41:28',NULL),(31,'DARVA AXA','<p>Bonjour,</p>\r\n\r\n<p>Lorsqu&#39;on inserre une pi&egrave;ce jointe dans le commentaire DARVA elle s&#39;efface.</p>\r\n\r\n<p>Merci</p>\r\n\r\n<p>Sandie</p>\r\n',12,1,1,26,7,5,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,NULL,'2016-06-08 08:14:12',NULL,NULL,NULL,NULL,'2016-05-27 13:58:16','2016-06-11 09:59:40',NULL),(32,'Fusion modèle','<p>Bonjour,</p>\r\n\r\n<p>Dans le dossier 902326, mod&egrave;le courrier aux constructeurs (CRAC Convoqu&eacute;s) la fusion avec l&#39;intervenant SPIE SCGPM ne se fait pas.(1 intervenant sur les 2 demand&eacute;s).</p>\r\n\r\n<p>Message :</p>\r\n\r\n<p>Le filtre graphique ne parvient pas &agrave; convertir le fichier (<a href=\"file://\\\\10.0.171.240\\NEXTPERT\\modeles\\0.bcs\">\\\\10.0.171.240\\NEXTPERT\\modeles\\0.bcs</a>) - Erreur non sp&eacute;cifi&eacute;e</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Merci</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Chantal</p>\r\n',14,4,1,14,2,5,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,4,5,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-10 10:45:12','2016-06-10 14:49:35',NULL);
/*!40000 ALTER TABLE `incidents` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents_states`
--

LOCK TABLES `incidents_states` WRITE;
/*!40000 ALTER TABLE `incidents_states` DISABLE KEYS */;
INSERT INTO `incidents_states` VALUES (1,'En attente de prise en charge','En attente PEC'),(2,'Affecté à un technicien','AT'),(3,'Pris en charge par un technicien','PEC par technicien'),(4,'Réponse reçue','Rép reçue'),(5,'En attente de réponse du demandeur','En attente'),(6,'En attente de réponse du technicien','En attente'),(7,'Incident cloturé','Cloturé'),(8,'En attente de cloture de la part du demandeur','En attente cloture'),(9,'Demande de cloture envoyée, en attente','En attente cloture'),(10,'Incident rejeté','Rejeté'),(11,'Incident pris en charge par un technicien supérieur','PEC par un technicien sup'),(12,'Incident en attente de réponse pour prise en charge par un technicien supérieur','En attente prise en charge tech sup');
/*!40000 ALTER TABLE `incidents_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails_waiting`
--

DROP TABLE IF EXISTS `mails_waiting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mails_waiting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_mail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `date_to_attempt` date DEFAULT NULL,
  `number_of_attempts` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mails_waiting`
--

LOCK TABLES `mails_waiting` WRITE;
/*!40000 ALTER TABLE `mails_waiting` DISABLE KEYS */;
/*!40000 ALTER TABLE `mails_waiting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pcs`
--

DROP TABLE IF EXISTS `pcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pcs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_adress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mac_adress` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_holder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `buy_date` datetime DEFAULT NULL,
  `warranty_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pcs`
--

LOCK TABLES `pcs` WRITE;
/*!40000 ALTER TABLE `pcs` DISABLE KEYS */;
/*!40000 ALTER TABLE `pcs` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedures`
--

LOCK TABLES `procedures` WRITE;
/*!40000 ALTER TABLE `procedures` DISABLE KEYS */;
INSERT INTO `procedures` VALUES (1,'Fusion modèle (erreur ...\\MODELES\\0.bcs)','<p>Bonjour,</p>\r\n\r\n<p>La fusion avec l&#39;intervenant ne se fait pas.(1 intervenant sur les 2 demand&eacute;s).</p>\r\n\r\n<p>Message :</p>\r\n\r\n<p>Le filtre graphique ne parvient pas &agrave; convertir le fichier (<a href=\"file://\\\\10.0.171.240\\NEXTPERT\\modeles\\0.bcs\">\\\\10.0.171.240\\NEXTPERT\\modeles\\0.bcs</a>) - Erreur non sp&eacute;cifi&eacute;e</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Merci</p>\r\n','<p>Bonjour,</p>\r\n\r\n<p>C&#39;est le fichier signature qui n&#39;est pas bon, pour le refaire, changer le signataire dans l&#39;onglet g&eacute;n&eacute;ral et remettez ensuite le bon expert, le fichier sera reconstruit et vos documents fusionneront.</p>\r\n',1,38,'2016-06-10 14:52:02','2016-06-10 16:30:37');
/*!40000 ALTER TABLE `procedures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responses`
--

DROP TABLE IF EXISTS `responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `incident_id` int(11) DEFAULT NULL,
  `sender_id` smallint(6) DEFAULT NULL,
  `receiver_id` smallint(6) DEFAULT NULL,
  `ip_adress_sender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pc_id` int(11) DEFAULT NULL,
  `attach_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_file_size` int(11) DEFAULT NULL,
  `attach_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_responses_on_incident_id` (`incident_id`),
  KEY `index_responses_on_pc_id` (`pc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
INSERT INTO `responses` VALUES (22,'Cloture de l\'incident : ',30,11,6,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-05-30 06:41:11','2016-05-30 06:41:11'),(23,'Cloture de l\'incident : ',30,11,6,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-05-30 06:41:28','2016-05-30 06:41:28'),(29,'Incident créé par Chantal \n          Chantal mourand',32,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-10 10:45:12','2016-06-10 10:45:12'),(30,'Incident affecté',32,14,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-10 14:46:35','2016-06-10 14:46:35'),(31,'Bonjour Chantal,\r\n\r\nC\'est le fichier signature qui n\'est pas bon, pour le refaire, changer le signataire dans l\'onglet général et remettez ensuite le bon expert, le fichier sera reconstruit et vos documents fusionneront.\r\n\r\nA bientôt!',32,4,14,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-10 14:49:24','2016-06-10 14:49:24');
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

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
  `user` tinyint(1) DEFAULT NULL,
  `tech` tinyint(1) DEFAULT NULL,
  `super_tech` tinyint(1) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `disp` tinyint(1) DEFAULT NULL,
  `assistant` tinyint(1) DEFAULT NULL,
  `expert` tinyint(1) DEFAULT NULL,
  `comptable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (1,'view_index_users','Autorisé à voir la liste des utilisateurs',0,1,1,1,1,0,0,0),(2,'create_new_tech','Autorisé à créer un nouvel utilisateur, tech, supertech, admin',0,0,1,1,1,0,0,0),(3,'create_new_right','Autorisé à créer de nouveaux droits',0,0,0,0,0,0,0,0),(5,'create_new_category','Autorisé à créer de nouvelles catégories',0,1,1,1,1,0,0,0),(6,'view_index_all_of_incidents','Autorisé à voir les incidents de tous les membres',0,0,1,1,1,0,0,0),(7,'create_new_incidents','Autorisé à créer de nouveaux incidents',1,1,1,1,1,1,1,1),(8,'create_new_subcategory','Autorisé à créer de nouvelles sous catégories',0,1,1,1,1,0,0,0),(9,'view_index_categories','Autorisé à voir la liste des catégories',0,1,1,1,1,0,0,0),(10,'view_details_category','Autorisé à voir les détails d\'une catégorie',0,0,1,1,1,0,0,0),(11,'edit_category','Autorisé à éditer une categorie',0,0,1,1,1,0,0,0),(12,'delete_category','Autorisé à supprimer une catégorie',0,0,1,1,1,0,0,0),(13,'view_details_incident_of_other_member','Autorisé à voir les détails d\'un incident d\'un autre membre',0,0,1,1,1,1,0,0),(14,'edit_incidents','Autorisé à éditer un incident d\'un autre membre',0,0,0,0,0,0,0,0),(15,'delete_incident','Autorisé à supprimer un incident',0,0,0,0,0,0,0,0),(16,'edit_subcategories','Autorisé à éditer une sous catégorie',0,0,1,1,1,0,0,0),(17,'view_index_subcategories','Autorisé à voir la liste des sous categories',0,0,1,1,1,0,0,0),(18,'view_details_subcategories','Autorisé à voir le détail d\'une sous catégorie',0,0,1,1,1,0,0,0),(19,'delete_subcategories','Autorisé à supprimer les sous catégories',0,0,0,1,1,0,0,0),(20,'edit_rights','Autorisé à éditer un droit',0,0,1,1,1,0,0,0),(21,'view_index_rights','Autorisé à voir la liste des droits',0,1,1,1,1,0,0,0),(22,'delete_rights','Autorisé à supprimer des droits',0,0,0,0,0,0,0,0),(23,'dispatch_incidents','Autorisé à attribuer les incidents aux techniciens',0,0,0,1,1,0,0,0),(24,'view_index_fonctions','Autorisé à voir la liste des fonctions',0,1,1,1,1,0,0,0),(25,'create_new_fonctions','Autorisé à créer une nouvelle fonction',0,0,1,1,1,0,0,0),(26,'edit_fonctions','Autorisé à éditer une fonction',0,0,0,1,1,0,0,0),(27,'delete_fonctions','Autorisé à supprimer une fonction',0,0,0,0,0,0,0,0),(28,'view_users_pages','Autorisé à voir la page des autres membres',0,0,1,1,1,0,0,0),(29,'reject_incidents','Autorisé à rejeter un incident',0,0,1,1,1,0,0,0),(30,'cloture_incidents','Autorisé à cloturer les incidents ou à faire une demande de cloture',1,1,1,1,1,1,1,1),(31,'view_button_admin','Autorisé à voir le bouton administration',0,1,1,1,1,0,0,0),(32,'view_index_agencies','Autorisé à voir la page d\'index des agences',0,1,1,1,1,0,0,0),(33,'view_agency_details','Autorisé à voir les détails d\'une agence',0,0,1,1,1,0,0,0),(34,'create_new_agency','Autorisé à créer une nouvelle agence',0,0,0,1,1,0,0,0),(35,'edit_agency','Autorisé à editer une agence existante',0,0,0,1,1,0,0,0),(37,'edit_user','Autorisé à éditer ses informations personnelles',1,1,1,1,1,1,1,1),(38,'edit_other_user','Autorisé à editer le profil d\'autres utilisateurs',0,1,1,1,1,0,0,0),(39,'edit_all_user','Autorisé à modifier tous les champs d\'un utilisateur',0,0,1,1,1,0,0,0),(40,'edit_like_a_boss','Autorisé à modifier le type d\'utilisateur',0,0,0,1,1,0,0,0),(41,'view_detail_incident','Autorisé à voir le détail des incidents',1,1,1,1,1,1,1,1),(42,'ask_for_reaffect','Autorisé à demander une réaffectation de l\'incident',0,1,1,1,1,0,0,0),(43,'edit_categories_incidents','Autorisé à modifier la catégorie et sous catégorie d\'un incident',0,0,1,1,1,0,0,0),(44,'edit_lvl_incident','Autorisé à modifier le niveau d\'un incident',0,0,1,1,1,0,0,0),(45,'save_changes_of_edit','Autorisé à enregistrer les modifications d\'un incident',0,1,1,1,1,0,0,0),(46,'treat_incidents','Autorisé à traiter les incidents',0,1,1,1,1,0,0,0),(47,'create_procedure','Autorisé à créer une procedure',0,1,1,1,1,0,0,0),(48,'view_procedures','Autorisé à voir les procedures',1,1,1,1,1,1,1,1),(49,'edit_procedure','Autorisé à modifier les procedures',0,1,1,1,1,0,0,0),(50,'archive_procedure','Autorisé à archiver les procedures',0,1,1,1,1,0,0,0),(51,'delete_procedure','Autorisé à supprimer une procedure',0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150825071155'),('20150825071156'),('20150825071157'),('20150825071158'),('20150825071159'),('20150825071200'),('20150825071837'),('20150826070025'),('20150901065526'),('20150904132424'),('20150910095317'),('20150914075438'),('20150914075509'),('20150914075522'),('20150921082325'),('20151005135925'),('20151005140014'),('20151019081406'),('20160125141130'),('20160502144426'),('20160525075243');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sous_categories`
--

DROP TABLE IF EXISTS `sous_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sous_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `lvl_urgence_max` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sous_categories_on_category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_categories`
--

LOCK TABLES `sous_categories` WRITE;
/*!40000 ALTER TABLE `sous_categories` DISABLE KEYS */;
INSERT INTO `sous_categories` VALUES (1,'Messagerie',3,10,'2015-12-08 13:43:27','2015-12-08 13:43:27'),(2,'Navigateur internet',3,10,'2015-12-08 13:45:01','2015-12-08 13:45:01'),(3,'VPN',3,10,'2015-12-08 13:45:14','2015-12-08 13:45:14'),(4,'Messages suspects',3,10,'2015-12-08 13:45:28','2015-12-08 13:45:28'),(5,'Routeur',3,10,'2015-12-08 13:45:47','2016-01-14 10:53:28'),(6,'Outlook',4,10,'2015-12-08 13:46:30','2015-12-08 13:46:30'),(7,'Antivirus',4,10,'2015-12-08 13:46:48','2015-12-08 13:46:48'),(8,'Installer/Desinstaller',4,10,'2015-12-08 13:47:13','2015-12-08 13:47:13'),(9,'Lecteur Olympus',4,10,'2015-12-08 13:47:29','2015-12-08 13:47:29'),(10,'Gestion des fichiers',4,10,'2015-12-08 13:48:00','2015-12-08 13:48:00'),(11,'JobList',4,10,'2015-12-08 13:49:00','2015-12-08 13:49:00'),(12,'Word',4,10,'2015-12-08 13:49:16','2015-12-08 13:49:16'),(13,'Excel',4,10,'2015-12-08 13:49:37','2015-12-08 13:49:37'),(14,'Net-Expert DSS',1,10,'2015-12-08 13:50:17','2015-12-08 13:50:17'),(15,'Connectique',5,10,'2015-12-08 14:02:51','2015-12-08 14:02:51'),(16,'Alimentation',5,10,'2015-12-08 14:03:10','2015-12-08 14:03:10'),(17,'Ecran',5,10,'2015-12-08 14:03:27','2015-12-08 14:03:27'),(18,'Son',5,10,'2015-12-08 14:03:36','2015-12-08 14:03:36'),(19,'Stockage',5,10,'2015-12-08 14:03:55','2015-12-08 14:03:55'),(20,'Microphone',5,10,'2015-12-08 14:04:22','2015-12-08 14:04:22'),(21,'Comptes Email',6,10,'2015-12-08 14:05:38','2015-12-08 14:05:38'),(22,'Contacts',6,10,'2015-12-08 14:05:52','2015-12-08 14:05:52'),(23,'Messages',6,10,'2015-12-08 14:06:09','2015-12-08 14:06:09'),(25,'Parametrage',6,10,'2015-12-08 14:06:58','2015-12-08 14:06:58'),(26,'Autre',1,10,'2016-01-13 09:50:56','2016-01-13 09:50:56'),(27,'Jobliste',1,10,'2016-01-14 10:50:02','2016-01-14 10:50:02'),(28,'Intranet',3,10,'2016-01-14 10:54:29','2016-01-14 10:54:29'),(30,'Autre',7,10,'2016-01-26 10:45:05','2016-01-26 10:45:05'),(31,'Autre',2,10,'2016-01-26 10:46:15','2016-01-26 10:46:15'),(32,'Autre',3,10,'2016-01-26 10:46:24','2016-01-26 10:46:24'),(33,'Autre',4,10,'2016-01-26 10:46:33','2016-01-26 10:46:33'),(34,'Autre',5,10,'2016-01-26 10:46:43','2016-01-26 10:46:43'),(35,'Autre',6,10,'2016-01-26 10:46:52','2016-01-26 10:46:52'),(36,'Autre',9,10,'2016-01-26 10:48:05','2016-01-26 10:48:05'),(37,'Autre',10,10,'2016-02-09 09:11:25','2016-02-09 09:11:25'),(38,'NetExpert',1,10,'2016-06-10 16:29:57','2016-06-10 16:29:57');
/*!40000 ALTER TABLE `sous_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teches`
--

DROP TABLE IF EXISTS `teches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `afficher` tinyint(1) DEFAULT NULL,
  `simple_user` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teches`
--

LOCK TABLES `teches` WRITE;
/*!40000 ALTER TABLE `teches` DISABLE KEYS */;
INSERT INTO `teches` VALUES (1,'user',0,1,'2015-10-07 09:00:00','2015-10-07 09:00:00'),(2,'tech',0,0,'2015-10-07 09:00:00','2015-10-07 09:00:00'),(3,'super_tech',0,0,'2015-10-07 09:00:00','2015-10-07 09:00:00'),(4,'admin',0,0,'2015-10-07 09:00:00','2015-10-07 09:00:00'),(5,'disp',0,0,'2015-10-07 09:00:00','2015-10-07 09:00:00'),(6,'assistant',1,1,'2015-10-07 09:00:00','2015-10-07 09:00:00'),(7,'expert',1,1,'2015-10-07 09:00:00','2015-10-07 09:00:00'),(8,'comptable',1,1,'2015-10-07 09:00:00','2015-10-07 09:00:00');
/*!40000 ALTER TABLE `teches` ENABLE KEYS */;
UNLOCK TABLES;

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
  `mobile` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tech_id` int(11) DEFAULT NULL,
  `attach_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attach_file_size` int(11) DEFAULT NULL,
  `attach_updated_at` datetime DEFAULT NULL,
  `agency_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_tech_id` (`tech_id`),
  KEY `index_users_on_agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jeremy.montesinos','jeremy.montesinos@cle-expertises.fr','0788607459','','Montesinos','Jeremy','akssm922',NULL,4,NULL,NULL,NULL,NULL,2,'2015-11-23 14:03:05','2016-06-07 14:52:17','Jour'),(4,'jerome.guillot','jerome.guillot@cle-expertises.fr','0683039620','','Guillot','Jérôme','sonya88','',5,'','',0,'0000-00-00 00:00:00',2,'2015-12-09 09:47:39','2016-06-10 16:20:36','Nuit'),(5,'yvon.partoo','yvon.partoo@cle-expertises.fr','0555555555','','Partoo','Yvon',' ',NULL,7,NULL,NULL,NULL,NULL,2,'2015-12-16 08:27:43','2015-12-16 08:27:43','Jour'),(6,'guy.schwalm','guy.schwalm@cle-expertises.fr','0622634975','','Schwalm','Guy','Volu348%',NULL,3,NULL,NULL,NULL,NULL,2,'2016-01-08 11:07:30','2016-01-08 11:07:30','Jour'),(7,'germaine.tapeautour','germaine.tapeautour@cle-expertises.fr','0666666666','','Tapeautour','Germaine',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-02-02 08:50:03','2016-02-02 08:50:03','Jour'),(8,'carole.naudin','carole.naudin@cle-expertises.fr','0467998164','','Naudin','Carole',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-02-08 10:37:23','2016-02-08 10:37:23','Jour'),(9,'yasmina.eude','yasmina.eude@cle-expertises.fr','0467999067','','Eude','Yasmina',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-02-10 14:04:38','2016-02-10 14:04:38','Jour'),(10,'josiane.auclair','josiane.auclair@cle-expertises.fr','0467999067','','Auclair','Josiane',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-02-11 12:30:46','2016-06-08 08:57:39','Jour'),(11,'ecureuil','sandrine.kopf@cle-expertises.fr','0475580896','','Kopf','Sandrine',' ',NULL,6,NULL,NULL,NULL,NULL,7,'2016-04-28 15:02:42','2016-04-28 15:02:42','Jour'),(12,'sandie.ferrier','sandie.ferrier@cle-expertises.fr','0475580896','','Ferrier','Sandie',' ',NULL,6,NULL,NULL,NULL,NULL,7,'2016-05-27 13:55:36','2016-05-27 13:55:36','Jour'),(13,'dorothee.gerard','dorothee.gerard@cle-expertises.fr','0467999067','','Gerard','Dorothée',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-06-08 15:23:53','2016-06-08 15:23:53','Jour'),(14,'chantal','chantal.mourand@cle-expertises.fr','0467998161','0688314643','Chantal ','Chantal mourand',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-06-10 10:39:44','2016-06-10 10:39:44','Jour'),(15,'alexia.olle','alexia.olle@cle-expertises.fr','0475580896','','Olle','Alexia',' ',NULL,6,NULL,NULL,NULL,NULL,7,'2016-06-17 10:58:25','2016-06-17 10:58:25','Jour');
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

-- Dump completed on 2016-06-20 15:51:30
