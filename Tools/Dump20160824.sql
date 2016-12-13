CREATE DATABASE  IF NOT EXISTS `Tickets_production` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `Tickets_production`;
-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: Tickets_development
-- ------------------------------------------------------
-- Server version	5.5.50-0ubuntu0.14.04.1

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
  `department` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_adress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agencies`
--

LOCK TABLES `agencies` WRITE;
/*!40000 ALTER TABLE `agencies` DISABLE KEYS */;
INSERT INTO `agencies` VALUES (1,'CLE NARBONNE','ZA Bonne Source','29 rue Ernest Cognacq','NULL','11100','NARBONNE','narbonne@cle-expertises.fr','0468906800','0468906016','Aude','10.111.1.240'),(2,'CLE MONTPELLIER','337 rue Charles Nungesser','NULL','NULL','34135','MAUGUIO','montpellier@cle-expertises.fr','0467999067','0467999234','Hérault','10.134.2.240'),(3,'CLE NÎMES','125 rue de l\'Hostellerie','Immeuble ELLIPSIS','NULL','30900','NÎMES','nimes@cle-expertises.fr','0466706633','0411940042','Gard','10.130.1.240'),(4,'CLE PROVENCE','Europarc Ste Victoire','Route de Valbrillant','Bâtiment 2','13590','MEYREUIL','provence@cle-expertises.fr','0442507685','0442267596','Bouches-du-Rhône','10.113.2.240'),(5,'CLE PERPIGNAN','Le Phoenix','840 avenue Argelès sur mer','NULL','66100','PERPIGNAN','perpignan@cle-expertises.fr','0468082484','0468643153','Pyrénées Orientales','10.166.1.240'),(6,'CLE TOULOUSE','12 avenue José Cabanis','NULL','NULL','31130','QUINT-FONSEGRIVES','toulouse@cle-expertises.fr','0561242635','0561246762','Haute Garone','10.131.2.240'),(7,'CLE VALENCE','1 rue Jean Bertin','NULL','NULL','26000','VALENCE','valence@cle-expertises.fr','0475580896','0475576623','Drôme','10.126.2.240'),(8,'CLE RODEZ','Parc Commercial des Moutiers','7 avenue de l\'Entreprise','NULL','12000','RODEZ','rodez@cle-expertises.fr','0565605784','0565597851','Aveyron','10.112.1.240'),(11,'CLE LYON','Les Jardins d\'Entreprises','213 rue de Gerland','Bâtiment B3','69007','LYON','lyon@cle-expertises.fr','0437706113','0437706114','Rhône','10.169.3.240'),(12,'CLE FREJUS','La Muscadière','1527 via Aurelia','NULL','83600','FREJUS','frejus@cle-expertises.fr','0494531359','0494403785','Var','10.183.3.240'),(13,'CLE LATTES','337 rue Charles Nungesser','NULL','NULL','34135','MAUGUIO','montpellier@cle-expertises.fr','0467999067','0467999234','Hérault','208.67.220.123'),(14,'CLE BORDEAUX','!! Nouvelles coordonnées !!','2 Avenue Léonard de Vinci','Europarc','33600','PESSAC','bordeaux@cle-expertises.fr','0557922380','0557922389','Gironde','8.8.4.4'),(16,'CLE TOULON','224 rue des Découvertes','NULL','NULL','83390','CUERS','toulon@cle-expertises.fr','0494081114','0494019858','Var','208.67.222.220'),(19,'CLE ILE DE FRANCE','57 boulevard de Picpus','NULL','NULL','75012','PARIS','idf@cle-expertises.fr','0153447119','0140010360','Paris','208.67.220.222'),(20,'CLE NICE','ESPACE MANDELIEU','154 avenue de Cannes','Bâtiment A','6210','MANDELIEU LA NAPOULE','nice@cle-expertises.fr','0493481568','0493481647','Alpes maritimes','208.67.222.123'),(21,'CLE TARBES','17 avenue du Maréchal Joffre','NULL','NULL','65000','TARBES','tarbes@cle-expertises.fr','0561242635','0561246762','Hautes pyrénées','NULL'),(22,'CLE NANTES','11 rue des frères Lumière','Centre d\'affaire Cap West','Bat A2','44119','TREILLIERES','nantes@cle-expertises.fr','0240145980','0240145984','Loire atlantique','10.144.2.240'),(23,'CLE BAYONNE','50 route de Maignon','NULL','NULL','64600','ANGLET','bayonne@cle-expertises.fr','0559292282','0559150670','Pyrénées Atlantiques','8.8.8.8'),(26,'CLE CAEN','3 rue Léonard Gille','NULL','NULL','14320','ST MARTIN DE FONTENAY','caen@cle-expertises.fr','0467999067','0467999234','Calvados','NULL'),(27,'CLE CHAMBERY','146 allée des Erables','NULL','NULL','73420','DRUMETTAZ CLARAFOND','chambery@cle-expertises.fr','0479524940','0479345474','Savoie','NULL'),(29,'CLE TROYES','2 place Casimir Perier','NULL','NULL','10000','TROYES','troyes@cle-expertises.fr','0467999067','0467999234','Aube','NULL'),(30,'CLE DIJON','Le  Broge IV','2-4 rue du Dauphiné','NULL','21121','FONTAINE LES DIJON','dijon@cle-expertises.fr','0437706113','0437706114','Côte d\'or','NULL'),(31,'CLE LILLE','Centre Intertransport','Bât F','Port fluvial','59000','LILLE','lille@cle-expertises.fr','0467999067','0467999234','Nord','NULL'),(32,'CLE COLMAR','12 place du Capitaine Dreyfus','NULL','NULL','68000','COLMAR','colmar@cle-expertises.fr','0368110020','0467999234','Haut Rhin','10.168.1.240'),(33,'CLE LIMOGES','54 avenue de Garibaldi','NULL','NULL','87000','LIMOGES','limoges@cle-expertises.fr','0561242635','0561246762','Haute vienne','NULL'),(34,'CLE RENNES','4 A rue du Bignon','NULL','NULL','35000','RENNES','rennes@cle-expertises.fr','0467999067','0467999234','Ille-et-vilaine','10.135.3.240'),(35,'CLE BAeeeeYeONNE','50 route deeeee Maignon','NULL','NULL','64600','ANGLET','bayonne@cle-expertises.fr','0559292182','0551150670','Pyrénées Atlantiques','8.8.8.8');
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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archives`
--

LOCK TABLES `archives` WRITE;
/*!40000 ALTER TABLE `archives` DISABLE KEYS */;
INSERT INTO `archives` VALUES (37,'Incident créé par Montesinos\n          Jeremy',37,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:04:52','2016-06-29 08:04:52'),(38,'Rolala\r\n',37,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:04:52','2016-06-29 08:04:52'),(39,'Cloture de l\'incident : Cloturation !',37,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:04:52','2016-06-29 08:04:52'),(51,'Incident créé par Kopf\n          Sandrine',44,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:40:17','2016-07-12 09:40:17'),(68,'Incident affecté',44,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:40:17','2016-07-12 09:40:17'),(69,'l',44,1,11,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:40:17','2016-07-12 09:40:17'),(70,'b',44,11,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:40:17','2016-07-12 09:40:17'),(71,'eee',44,1,11,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:40:18','2016-07-12 09:40:18'),(72,'ffff',44,11,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:40:18','2016-07-12 09:40:18'),(73,'Cloture de l\'incident : kk',44,1,11,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:40:18','2016-07-12 09:40:18'),(74,'Cloture de l\'incident : ddddd',44,11,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:40:18','2016-07-12 09:40:18'),(75,'Incident créé par Kopf\n          Sandrine',50,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(76,'Incident affecté',50,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(77,'Incident affecté',50,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(78,'dg',50,11,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(79,'Cloture de l\'incident : gggg',50,1,11,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(80,'dzdazdezqd',50,11,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(81,'Cloture de l\'incident : efzefzef',50,1,11,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(82,'Cloture de l\'incident : eqfzefsef',50,11,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:55:39','2016-07-12 09:55:39'),(86,'Incident créé par Kopf\n          Sandrine',52,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(87,'Incident affecté',52,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(88,'sefsefesf',52,1,11,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(89,'zerserzer',52,11,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(90,'Cloture de l\'incident : xdfefs',52,1,11,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(91,'Cloture de l\'incident : tgdrtgdrgrdgr',52,11,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 10:13:34','2016-07-12 10:13:34'),(102,'Incident créé par Montesinos\n          Jeremy',62,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-21 07:58:06','2016-07-21 07:58:06'),(104,'Incident créé par Montesinos\n          Jeremy',64,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-21 07:57:57','2016-07-21 07:57:57'),(106,'Incident créé par Montesinos\n          Jeremy',66,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:23:14','2016-07-20 15:23:14'),(115,'Incident affecté',66,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:23:14','2016-07-20 15:23:14'),(116,'Incident affecté',64,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-21 07:57:57','2016-07-21 07:57:57'),(117,'Incident affecté',62,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-21 07:58:06','2016-07-21 07:58:06'),(127,'Cloture de l\'incident : ',66,1,1,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:23:14','2016-07-20 15:23:14'),(130,'Cloture de l\'incident : ',64,1,1,'10.134.2.49',NULL,NULL,NULL,NULL,NULL,'2016-07-21 07:57:57','2016-07-21 07:57:57'),(131,'Cloture de l\'incident : ',64,1,1,'10.134.2.49',NULL,NULL,NULL,NULL,NULL,'2016-07-21 07:57:57','2016-07-21 07:57:57'),(132,'Cloture de l\'incident : ',62,1,1,'10.134.2.49',NULL,NULL,NULL,NULL,NULL,'2016-07-21 07:58:06','2016-07-21 07:58:06'),(133,'Incident créé par Kopf\n          Sandrine',70,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-22 09:58:45','2016-07-22 09:58:45'),(134,'Incident rejeté : ',70,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-22 09:58:45','2016-07-22 09:58:45'),(135,'Incident créé par Vguygvbvb\n          Rdgrg',68,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(136,'dfedfezsfefsf',68,16,NULL,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(137,'dfedfezsfefsf',68,16,NULL,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(138,'dfedfezsfefsf',68,16,NULL,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(139,'Incident affecté',68,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(140,'fsefesfe',68,16,1,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(141,'Incident rejeté : ',68,1,16,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-22 13:17:28','2016-07-22 13:17:28'),(142,'Incident créé par Vguygvbvb\n          Rdgrg',67,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-22 13:17:50','2016-07-22 13:17:50'),(143,'Incident affecté',67,16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-22 13:17:50','2016-07-22 13:17:50'),(144,'Incident rejeté : ',67,1,16,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-22 13:17:50','2016-07-22 13:17:50'),(145,'Incident créé par Kopf\n          Sandrine',73,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-25 08:00:02','2016-07-25 08:00:02'),(146,'Incident rejeté : dzdzqz',73,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-25 08:00:02','2016-07-25 08:00:02'),(147,'Incident créé par Kopf\n          Sandrine',72,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:17:07','2016-07-29 12:17:07'),(148,'Incident affecté',72,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:17:07','2016-07-29 12:17:07'),(149,'Incident rejeté : ',72,1,11,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:17:07','2016-07-29 12:17:07'),(150,'Incident créé par Montesinos\n          Jeremy',61,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(151,'Incident affecté',61,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(152,'ddddd',61,1,1,'10.134.2.49',NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(153,'fesffe',61,1,1,'10.134.2.49',NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(154,'erzrr',61,1,1,'10.134.2.49',NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(155,'sfesfe',61,1,1,'10.134.2.49',NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(156,'dddddd',61,1,1,'10.134.2.49',NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(157,'zzzzz',61,1,1,'10.134.2.49',NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(158,'grgrg',61,1,1,'10.134.2.49',NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(159,'Incident rejeté : ',61,1,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-29 12:27:30','2016-07-29 12:27:30'),(160,'Incident créé par Montesinos\n          Jeremy',75,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02 08:20:00','2016-08-02 08:20:00'),(161,'Incident rejeté : ',75,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 08:20:00','2016-08-02 08:20:00'),(162,'Incident créé par Montesinos\n          Jeremy',76,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02 08:24:03','2016-08-02 08:24:03'),(163,'sss',76,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 08:24:03','2016-08-02 08:24:03'),(164,'Incident rejeté : ddddd',76,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 08:24:03','2016-08-02 08:24:03'),(165,'Incident créé par Montesinos\n            Jeremy',80,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:14:01','2016-08-02 13:14:01'),(166,'Incident rejeté : BLablabla',80,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:14:01','2016-08-02 13:14:01'),(167,'Incident créé par Montesinos\n            Jeremy',79,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:15:54','2016-08-02 13:15:54'),(168,'Incident rejeté : BLablabla',79,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:15:54','2016-08-02 13:15:54'),(169,'Incident créé par Montesinos\n            Jeremy',78,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:31:40','2016-08-02 13:31:40'),(170,'Incident rejeté : BLablabla',78,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:31:40','2016-08-02 13:31:40'),(171,'Incident rejeté : BLablabla',78,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:32:10','2016-08-02 13:32:10'),(172,'Incident créé par Montesinos\n            Jeremy',77,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:32:30','2016-08-02 13:32:30'),(173,'Incident rejeté : BLablabla',77,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:32:30','2016-08-02 13:32:30');
/*!40000 ALTER TABLE `archives` ENABLE KEYS */;
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
-- Table structure for table `bootsy_image_galleries`
--

DROP TABLE IF EXISTS `bootsy_image_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bootsy_image_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bootsy_resource_id` int(11) DEFAULT NULL,
  `bootsy_resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bootsy_image_galleries`
--

LOCK TABLES `bootsy_image_galleries` WRITE;
/*!40000 ALTER TABLE `bootsy_image_galleries` DISABLE KEYS */;
/*!40000 ALTER TABLE `bootsy_image_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bootsy_images`
--

DROP TABLE IF EXISTS `bootsy_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bootsy_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_gallery_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bootsy_images`
--

LOCK TABLES `bootsy_images` WRITE;
/*!40000 ALTER TABLE `bootsy_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `bootsy_images` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Net-Expert','2015-12-08 13:40:34','2015-12-08 13:40:34'),(2,'Imprimante/Télécopieur','2015-12-08 13:40:53','2015-12-08 13:40:53'),(3,'Internet/Réseau','2015-12-08 13:41:10','2015-12-08 13:43:08'),(4,'Logiciels','2015-12-08 13:41:25','2016-07-22 13:22:54'),(5,'Matériel','2015-12-08 13:41:33','2015-12-08 13:41:33'),(6,'Mobile','2015-12-08 13:41:48','2015-12-08 13:41:48'),(9,'Autres','2016-01-26 10:48:05','2016-07-22 13:22:42'),(10,'Tests','2016-07-22 12:47:09','2016-07-22 12:47:09'),(12,'ghtf','2016-07-22 13:22:19','2016-07-22 13:22:19');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detentor_types`
--

DROP TABLE IF EXISTS `detentor_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detentor_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detentor_types`
--

LOCK TABLES `detentor_types` WRITE;
/*!40000 ALTER TABLE `detentor_types` DISABLE KEYS */;
INSERT INTO `detentor_types` VALUES (1,'Test','2016-08-01 09:10:48','2016-08-01 09:10:48'),(2,'Testfersfsefesf','2016-08-01 09:11:30','2016-08-01 09:11:30'),(3,'Testfersfsefesf','2016-08-01 09:13:12','2016-08-01 09:13:12');
/*!40000 ALTER TABLE `detentor_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_seller_sellers`
--

DROP TABLE IF EXISTS `fields_seller_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_seller_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_seller_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_seller_sellers`
--

LOCK TABLES `fields_seller_sellers` WRITE;
/*!40000 ALTER TABLE `fields_seller_sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields_seller_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields_sellers`
--

DROP TABLE IF EXISTS `fields_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields_sellers`
--

LOCK TABLES `fields_sellers` WRITE;
/*!40000 ALTER TABLE `fields_sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields_sellers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_archives`
--

LOCK TABLES `file_archives` WRITE;
/*!40000 ALTER TABLE `file_archives` DISABLE KEYS */;
INSERT INTO `file_archives` VALUES (1,151,'_BD__Le_grand_jeu__Uchronie__-_Int_grale_6_tomes_-_PDF.torrent',20412,'application/x-bittorrent','2016-08-02 08:24:03','2016-08-02 08:24:03'),(2,152,'Nascar_Sprint_Cup_2016_-_Round_21_-_Pocono_-_1_ao_t_-_HD_1080p_x264.torrent',17030,'application/x-bittorrent','2016-08-02 08:24:03','2016-08-02 08:24:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_procedures`
--

LOCK TABLES `file_procedures` WRITE;
/*!40000 ALTER TABLE `file_procedures` DISABLE KEYS */;
INSERT INTO `file_procedures` VALUES (1,1,'Capture.PNG',33177,'image/png','2016-06-10 14:52:02','2016-06-10 14:52:02'),(2,2,'TickMaster.docx',391621,'application/vnd.openxmlformats-officedocument.wordprocessingml.document','2016-06-29 13:01:08','2016-06-29 13:01:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_responses`
--

LOCK TABLES `file_responses` WRITE;
/*!40000 ALTER TABLE `file_responses` DISABLE KEYS */;
INSERT INTO `file_responses` VALUES (1,59,'Annexe_CLE.pdf',4640569,'application/pdf','2016-07-12 08:41:10','2016-07-12 08:41:10'),(2,60,'Annexe_CLE.ppt',6297903,'application/vnd.ms-powerpoint','2016-07-12 08:42:14','2016-07-12 08:42:14'),(3,61,'16-applications.mp4',86768138,'video/mp4','2016-07-12 08:42:40','2016-07-12 08:42:40'),(4,100,'01-introduction.mp4',16929435,'video/mp4','2016-07-12 14:16:23','2016-07-12 14:16:23');
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
  `notify_for_tech` tinyint(1) DEFAULT NULL,
  `notify_for_user` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_incidents_on_pc_id` (`pc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incidents`
--

LOCK TABLES `incidents` WRITE;
/*!40000 ALTER TABLE `incidents` DISABLE KEYS */;
INSERT INTO `incidents` VALUES (37,'Panne','<p>Bordel !</p>\r\n',1,NULL,1,14,2,5,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-06-29 08:04:52','2016-06-29 08:04:52',NULL,NULL,NULL,NULL,'2016-06-29 08:01:47','2016-06-29 08:04:52',NULL,NULL),(38,'effsfes','<p>fesfesfefesf</p>\r\n',1,6,1,14,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:06:45','2016-06-29 10:00:42',NULL,NULL),(39,'sssss','<p>ssssss</p>\r\n',1,1,1,14,2,5,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:38:32','2016-06-29 12:43:56',NULL,NULL),(40,'ddddd','<p>dddd</p>\r\n',1,NULL,1,14,2,6,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:45:14','2016-06-29 08:45:14',NULL,NULL),(41,'dddddd','<p>dddddddddd</p>\r\n',1,NULL,2,31,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:46:04','2016-06-29 08:46:04',NULL,NULL),(42,'efesfes','<p>fesfefesf</p>\r\n',1,NULL,1,14,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 09:01:49','2016-07-12 14:16:23',1,0),(43,'dddddd','<p>dddd</p>\r\n',1,NULL,1,14,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 09:29:25','2016-06-29 09:29:25',NULL,NULL),(44,'scscscswcswcwsc','<p>cscscscwsc</p>\r\n',11,1,1,14,7,1,1,NULL,NULL,NULL,'192.168.10.34',NULL,NULL,NULL,7,7,1,'2016-07-12 09:40:17','2016-07-12 09:40:17',NULL,NULL,NULL,NULL,'2016-06-29 09:43:09','2016-07-12 09:40:17',0,0),(45,'dzdqsdfe','<p>fefesfsefesfef</p>\r\n',1,1,1,14,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 12:32:06','2016-07-29 08:15:37',NULL,NULL),(46,'fesfsefsef','<p>fefsefesfe</p>\r\n',1,NULL,1,14,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 12:32:40','2016-07-12 08:34:17',NULL,NULL),(48,'BLABLA','<p>BLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLABLA</p>\r\n',1,1,1,14,2,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-11 13:35:45','2016-07-29 08:16:16',NULL,NULL),(49,'blablablabla','<p>gggggg</p>\r\n',1,NULL,1,14,2,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 08:46:46','2016-07-12 09:34:54',0,0),(50,'fff','<p>fff</p>\r\n',11,1,1,14,7,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-12 09:55:39','2016-07-12 09:55:39',NULL,NULL,NULL,NULL,'2016-07-12 09:41:52','2016-07-12 09:55:39',0,0),(51,'effef','<p>fffff</p>\r\n',11,1,5,16,7,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,4,5,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:57:16','2016-08-09 08:38:40',0,0),(52,'ee','<p>eee</p>\r\n',11,1,4,6,7,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-12 10:13:34','2016-07-12 10:13:34',NULL,NULL,NULL,NULL,'2016-07-12 10:07:16','2016-07-12 10:13:34',0,0),(53,'iii','<p>iii</p>\r\n',1,NULL,3,1,2,0,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 12:52:30','2016-07-12 12:52:30',1,0),(54,'oo','<p>ooo</p>\r\n',1,NULL,1,14,2,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 12:52:52','2016-07-12 12:52:52',1,0),(55,'h','<p>h</p>\r\n',1,NULL,2,31,2,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 12:53:16','2016-07-12 12:53:16',1,0),(56,'h','<p>h</p>\r\n',1,NULL,3,1,2,3,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 12:53:40','2016-07-12 12:53:40',1,0),(57,'gdg','<p>gdgg</p>\r\n',1,NULL,2,31,2,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 13:08:48','2016-07-12 13:08:48',1,0),(58,'l','<p>l</p>\r\n',1,NULL,1,14,2,10,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 13:11:45','2016-07-12 13:11:45',1,0),(59,'rgre','<p>geger</p>\r\n',1,NULL,2,31,2,4,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 13:20:16','2016-07-12 13:20:16',1,0),(60,'ff','<p>fffff</p>\r\n',1,6,2,31,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,2,2,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 13:20:47','2016-07-29 08:16:50',1,0),(61,'ddd','<p>dddddd</p>\r\n',1,1,1,14,2,6,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 14:17:51','2016-07-29 12:27:30',0,1),(62,'esf','<p>fesfe</p>\r\n',1,1,1,14,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,7,7,1,'2016-07-21 07:58:06','2016-07-21 07:58:06',NULL,NULL,NULL,NULL,'2016-07-12 14:26:26','2016-07-21 07:58:06',0,1),(63,'sefefsefesfe','<p>zfefesfef</p>\r\n',1,NULL,1,14,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-20 10:07:00','2016-07-20 10:07:00',1,0),(64,'fgdgd','<p>drgdrgr</p>\r\n',1,1,1,14,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,7,7,1,'2016-07-21 07:57:57','2016-07-21 07:57:57',NULL,NULL,NULL,NULL,'2016-07-20 10:07:38','2016-07-21 07:57:57',0,1),(65,'qdz','<p>zdqzdzqd</p>\r\n',1,NULL,1,14,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-20 10:09:39','2016-07-20 10:09:39',1,0),(66,'hth','<p>tfhtht</p>\r\n',1,1,2,31,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,7,7,1,'2016-07-20 15:23:14','2016-07-20 15:23:14',NULL,NULL,NULL,NULL,'2016-07-20 12:59:35','2016-07-20 15:23:14',0,1),(69,'dzzqdqz','<p>dzqdzqdzqd</p>\r\n',11,1,1,14,7,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,8,9,1,NULL,'2016-07-20 15:23:26',NULL,NULL,NULL,NULL,'2016-07-20 15:08:09','2016-07-20 15:23:26',0,1),(70,'sef','<p>eee</p>\r\n',11,NULL,1,14,7,1,1,NULL,NULL,NULL,'10.134.2.49',NULL,NULL,NULL,10,10,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-21 07:27:15','2016-07-22 09:58:45',0,0),(71,'ss','<p>sssss</p>\r\n',11,NULL,1,14,7,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-25 07:54:00','2016-07-25 07:54:00',1,0),(72,'ss','<p>sssss</p>\r\n',11,1,1,14,7,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-25 07:59:11','2016-07-29 12:17:07',0,1),(73,'dd','<p>ddddd</p>\r\n',11,NULL,2,31,7,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-25 07:59:28','2016-07-25 08:00:02',0,0),(74,'sssss','<p>ssssss</p>\r\n',11,6,3,1,7,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-26 07:12:59','2016-08-02 13:36:06',1,0),(75,'dddd','<p>ssssss</p>\r\n',1,NULL,2,31,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02 07:58:42','2016-08-02 08:20:00',0,0),(76,'xxxxx','<p>xxxxx</p>\r\n',1,NULL,2,31,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,10,10,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02 08:22:09','2016-08-02 08:24:03',0,0),(78,'ss','<p>sssss</p>',11,NULL,1,14,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,8,9,1,NULL,'2016-08-02 14:23:52',NULL,NULL,NULL,NULL,'2016-08-02 12:19:16','2016-08-02 14:23:52',0,0),(79,'ss','<p>sssss</p>',11,NULL,1,14,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,8,9,1,NULL,'2016-08-02 14:14:16',NULL,NULL,NULL,NULL,'2016-08-02 12:19:59','2016-08-02 14:14:16',0,0),(80,'ss','<p>ssssskk</p>',11,NULL,1,14,2,1,1,NULL,NULL,NULL,'127.0.0.1',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02 12:25:43','2016-08-02 13:44:16',1,0),(82,'s','<p>s</p>\r\n',1,NULL,1,14,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:08:36','2016-08-03 08:08:36',1,0),(83,'dd','<p>ddddd</p>\r\n',1,NULL,2,31,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:09:52','2016-08-03 08:09:52',1,0),(84,'c','<p>c</p>\r\n',1,NULL,2,31,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:10:39','2016-08-03 08:10:39',1,0),(85,'dd','<p>dddd</p>\r\n',1,NULL,2,31,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:11:27','2016-08-03 08:11:27',1,0),(86,'s','<p>s</p>\r\n',1,NULL,1,14,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:15:45','2016-08-03 08:15:45',1,0),(87,'eee','<p>eeee</p>\r\n',1,NULL,3,1,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:17:54','2016-08-03 08:17:54',1,0),(88,'ee','<p>eee</p>\r\n',1,NULL,2,31,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:18:54','2016-08-03 08:18:54',1,0),(89,'sss','<p>sssss</p>\r\n',1,NULL,2,31,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:19:50','2016-08-03 08:19:50',1,0),(91,'ss','<p>sssss</p>',11,NULL,1,14,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 09:32:52','2016-08-03 09:32:52',1,0),(92,'d','<p>d</p>\r\n',1,NULL,4,6,2,1,1,NULL,NULL,NULL,'192.168.10.55',NULL,NULL,NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 09:35:35','2016-08-03 09:35:35',1,0);
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
INSERT INTO `incidents_states` VALUES (1,'En attente de prise en charge','En attente PEC'),(2,'Affecté à un technicien','Affecté'),(3,'Pris en charge par un technicien','PEC par technicien'),(4,'Réponse reçue','Rép reçue'),(5,'En attente de réponse du demandeur','En attente'),(6,'En attente de réponse du technicien','En attente'),(7,'Incident cloturé','Cloturé'),(8,'En attente de cloture de la part du demandeur','En attente cloture'),(9,'Demande de cloture envoyée, en attente','En attente cloture'),(10,'Incident rejeté','Rejeté'),(11,'Incident pris en charge par un technicien supérieur','PEC par un technicien sup'),(12,'Incident en attente de réponse pour prise en charge par un technicien supérieur','En attente prise en charge tech sup');
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
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_material_id` int(11) DEFAULT NULL,
  `detentor_type_id` int(11) DEFAULT NULL,
  `detentor_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responses`
--

LOCK TABLES `responses` WRITE;
/*!40000 ALTER TABLE `responses` DISABLE KEYS */;
INSERT INTO `responses` VALUES (40,'Incident créé par Montesinos\n          Jeremy',38,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:06:45','2016-06-29 08:06:45'),(41,'Incident créé par Montesinos\n          Jeremy',39,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:38:32','2016-06-29 08:38:32'),(42,'Incident créé par Montesinos\n          Jeremy',40,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:45:14','2016-06-29 08:45:14'),(43,'Incident créé par Montesinos\n          Jeremy',41,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:46:04','2016-06-29 08:46:04'),(44,'retetet',40,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:47:20','2016-06-29 08:47:20'),(45,'dzaddeq',38,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:47:58','2016-06-29 08:47:58'),(46,'dfsefefesf',40,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-29 08:50:04','2016-06-29 08:50:04'),(47,'Incident créé par Montesinos\n          Jeremy',42,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 09:01:49','2016-06-29 09:01:49'),(48,'fesfefefesf',42,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-29 09:01:58','2016-06-29 09:01:58'),(49,'Incident créé par Montesinos\n          Jeremy',43,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 09:29:25','2016-06-29 09:29:25'),(50,'ddddd',43,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-29 09:29:39','2016-06-29 09:29:39'),(52,'Incident affecté',38,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 10:00:42','2016-06-29 10:00:42'),(53,'Incident créé par Montesinos\n          Jeremy',45,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 12:32:06','2016-06-29 12:32:06'),(54,'Incident créé par Montesinos\n          Jeremy',46,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 12:32:40','2016-06-29 12:32:40'),(55,'Incident affecté',39,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-06-29 12:43:21','2016-06-29 12:43:21'),(56,'Demande de réaffectation envoyée : J\'y arrive pas !',39,1,1,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-06-29 12:43:56','2016-06-29 12:43:56'),(57,'Incident créé par Montesinos\n          Jeremy',47,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-11 13:34:52','2016-07-11 13:34:52'),(58,'Incident créé par Montesinos\n          Jeremy',48,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-11 13:35:45','2016-07-11 13:35:45'),(59,'s',48,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 08:41:10','2016-07-12 08:41:10'),(60,'d',48,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 08:42:14','2016-07-12 08:42:14'),(61,'d',48,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 08:42:40','2016-07-12 08:42:40'),(62,'Incident créé par Montesinos\n          Jeremy',49,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 08:46:46','2016-07-12 08:46:46'),(63,'bla',49,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:25:22','2016-07-12 09:25:22'),(64,'ee',49,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:26:23','2016-07-12 09:26:23'),(65,'d',49,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:27:54','2016-07-12 09:27:54'),(66,'dddd',49,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:28:19','2016-07-12 09:28:19'),(67,'bla',49,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:34:54','2016-07-12 09:34:54'),(83,'Incident créé par Kopf\n          Sandrine',51,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 09:57:16','2016-07-12 09:57:16'),(84,'Incident affecté',51,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 10:00:19','2016-07-12 10:00:19'),(85,'sefsefesfesf',51,1,11,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 10:04:57','2016-07-12 10:04:57'),(92,'Incident créé par Montesinos\n          Jeremy',53,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 12:52:30','2016-07-12 12:52:30'),(93,'Incident créé par Montesinos\n          Jeremy',54,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 12:52:52','2016-07-12 12:52:52'),(94,'Incident créé par Montesinos\n          Jeremy',55,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 12:53:16','2016-07-12 12:53:16'),(95,'Incident créé par Montesinos\n          Jeremy',56,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 12:53:40','2016-07-12 12:53:40'),(96,'Incident créé par Montesinos\n          Jeremy',57,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 13:08:48','2016-07-12 13:08:48'),(97,'Incident créé par Montesinos\n          Jeremy',58,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 13:11:45','2016-07-12 13:11:45'),(98,'Incident créé par Montesinos\n          Jeremy',59,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 13:20:16','2016-07-12 13:20:16'),(99,'Incident créé par Montesinos\n          Jeremy',60,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-12 13:20:47','2016-07-12 13:20:47'),(100,'deqesf',42,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-07-12 14:16:23','2016-07-12 14:16:23'),(103,'Incident créé par Montesinos\n          Jeremy',63,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-20 10:07:00','2016-07-20 10:07:00'),(105,'Incident créé par Montesinos\n          Jeremy',65,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-20 10:09:39','2016-07-20 10:09:39'),(119,'Incident créé par Kopf\n          Sandrine',69,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:08:09','2016-07-20 15:08:09'),(120,'Incident affecté',69,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:08:47','2016-07-20 15:08:47'),(121,'ezesf',69,1,11,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:10:19','2016-07-20 15:10:19'),(122,'esfsef',69,11,1,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:10:46','2016-07-20 15:10:46'),(123,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:20:02','2016-07-20 15:20:02'),(124,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:20:27','2016-07-20 15:20:27'),(125,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:21:12','2016-07-20 15:21:12'),(126,'Cloture de l\'incident : sefesfe',69,1,11,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:21:22','2016-07-20 15:21:22'),(128,'Cloture de l\'incident : ',69,1,11,'192.168.10.55',NULL,NULL,NULL,NULL,NULL,'2016-07-20 15:23:26','2016-07-20 15:23:26'),(140,'Incident créé par Kopf\n          Sandrine',71,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-25 07:54:00','2016-07-25 07:54:00'),(142,'Incident créé par Kopf\n          Sandrine',74,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-26 07:12:59','2016-07-26 07:12:59'),(143,'Incident affecté',74,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-26 08:08:44','2016-07-26 08:08:44'),(145,'Incident affecté',45,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-29 08:15:37','2016-07-29 08:15:37'),(146,'Incident affecté',48,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-29 08:16:16','2016-07-29 08:16:16'),(147,'Incident affecté',60,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-07-29 08:16:50','2016-07-29 08:16:50'),(157,'Incident créé par Montesinos\n            Jeremy',81,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-02 12:25:51','2016-08-02 12:25:51'),(163,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:36:06','2016-08-02 13:36:06'),(164,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:42:41','2016-08-02 13:42:41'),(165,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:43:12','2016-08-02 13:43:12'),(166,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',74,1,6,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:43:41','2016-08-02 13:43:41'),(167,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',80,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:44:16','2016-08-02 13:44:16'),(168,'Demande de réaffectation envoyée : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 13:44:55','2016-08-02 13:44:55'),(169,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 14:11:02','2016-08-02 14:11:02'),(170,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 14:11:12','2016-08-02 14:11:12'),(171,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 14:11:38','2016-08-02 14:11:38'),(172,'Cloture de l\'incident : dsefzsefsfefseefesf',79,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 14:14:16','2016-08-02 14:14:16'),(173,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 14:18:57','2016-08-02 14:18:57'),(174,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 14:23:24','2016-08-02 14:23:24'),(175,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 14:23:36','2016-08-02 14:23:36'),(176,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 14:23:52','2016-08-02 14:23:52'),(177,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 14:24:06','2016-08-02 14:24:06'),(178,'Cloture de l\'incident : dsefzsefsfefseefesf',78,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-02 14:25:16','2016-08-02 14:25:16'),(179,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:20:24','2016-08-03 07:20:24'),(180,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:25:47','2016-08-03 07:25:47'),(181,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:26:47','2016-08-03 07:26:47'),(182,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:26:49','2016-08-03 07:26:49'),(183,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:26:51','2016-08-03 07:26:51'),(184,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:27:25','2016-08-03 07:27:25'),(185,'Cloture de l\'incident : dsefzsefsfefseefesf',77,1,NULL,'127.0.0.1',NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:28:34','2016-08-03 07:28:34'),(186,'Incident affecté',77,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:29:48','2016-08-03 07:29:48'),(188,'Incident affecté',77,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:32:00','2016-08-03 07:32:00'),(189,'Incident affecté',77,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:34:29','2016-08-03 07:34:29'),(191,'Incident affecté',77,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:37:26','2016-08-03 07:37:26'),(192,'Incident affecté',77,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:37:34','2016-08-03 07:37:34'),(193,'Incident affecté',77,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 07:46:12','2016-08-03 07:46:12'),(194,'Incident créé par Montesinos\n            Jeremy',82,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:08:36','2016-08-03 08:08:36'),(195,'Incident créé par Montesinos\n            Jeremy',83,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:09:52','2016-08-03 08:09:52'),(196,'Incident créé par Montesinos\n            Jeremy',84,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:10:39','2016-08-03 08:10:39'),(197,'Incident créé par Montesinos\n            Jeremy',85,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:11:27','2016-08-03 08:11:27'),(198,'Incident créé par Montesinos\n            Jeremy',86,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:15:45','2016-08-03 08:15:45'),(199,'Incident créé par Montesinos\n            Jeremy',87,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:17:54','2016-08-03 08:17:54'),(200,'Incident créé par Montesinos\n            Jeremy',88,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:18:54','2016-08-03 08:18:54'),(201,'Incident créé par Montesinos\n            Jeremy',89,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 08:19:50','2016-08-03 08:19:50'),(202,'Incident créé par Montesinos\n            Jeremy',90,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 09:32:07','2016-08-03 09:32:07'),(203,'Incident créé par Montesinos\n            Jeremy',91,11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 09:32:52','2016-08-03 09:32:52'),(204,'Incident créé par Montesinos\n            Jeremy',92,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-03 09:35:35','2016-08-03 09:35:35');
/*!40000 ALTER TABLE `responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rich_rich_files`
--

DROP TABLE IF EXISTS `rich_rich_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rich_rich_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rich_file_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rich_file_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rich_file_file_size` int(11) DEFAULT NULL,
  `rich_file_updated_at` datetime DEFAULT NULL,
  `owner_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `uri_cache` text COLLATE utf8_unicode_ci,
  `simplified_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'file',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rich_rich_files`
--

LOCK TABLES `rich_rich_files` WRITE;
/*!40000 ALTER TABLE `rich_rich_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `rich_rich_files` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (1,'view_index_users','Autorisé à voir la liste des utilisateurs',0,1,1,1,1,1,1,1),(2,'create_new_tech','Autorisé à créer un nouvel utilisateur, tech, supertech, admin',0,0,1,1,1,0,0,0),(3,'create_new_right','Autorisé à créer de nouveaux droits',0,0,0,0,0,0,0,0),(5,'create_new_category','Autorisé à créer de nouvelles catégories',0,1,1,1,1,0,0,0),(6,'view_index_all_of_incidents','Autorisé à voir les incidents de tous les membres',0,0,1,1,1,0,0,0),(7,'create_new_incidents','Autorisé à créer de nouveaux incidents',0,1,1,1,1,1,1,1),(8,'create_new_subcategory','Autorisé à créer de nouvelles sous catégories',0,1,1,1,1,0,0,0),(9,'view_index_categories','Autorisé à voir la liste des catégories',0,1,1,1,1,0,0,0),(10,'view_details_category','Autorisé à voir les détails d\'une catégorie',0,0,1,1,1,0,0,0),(11,'edit_category','Autorisé à éditer une categorie',0,0,1,1,1,0,0,0),(12,'delete_category','Autorisé à supprimer une catégorie',0,0,1,1,1,0,0,0),(13,'view_details_incident_of_other_member','Autorisé à voir les détails d\'un incident d\'un autre membre',0,0,1,1,1,1,0,0),(14,'edit_incidents','Autorisé à éditer un incident d\'un autre membre',0,0,0,1,0,0,0,0),(15,'delete_incident','Autorisé à supprimer un incident',0,0,0,1,0,0,0,0),(16,'edit_subcategories','Autorisé à éditer une sous catégorie',0,0,1,1,1,0,0,0),(17,'view_index_subcategories','Autorisé à voir la liste des sous categories',0,0,1,1,1,0,0,0),(18,'view_details_subcategories','Autorisé à voir le détail d\'une sous catégorie',0,0,1,1,1,0,0,0),(19,'delete_subcategories','Autorisé à supprimer les sous catégories',0,0,0,1,1,0,0,0),(20,'edit_rights','Autorisé à éditer un droit',0,0,1,1,1,0,0,0),(21,'view_index_rights','Autorisé à voir la liste des droits',0,1,1,1,1,0,0,0),(22,'delete_rights','Autorisé à supprimer des droits',0,0,0,0,0,0,0,0),(23,'dispatch_incidents','Autorisé à attribuer les incidents aux techniciens',0,0,0,1,1,0,0,0),(24,'view_index_fonctions','Autorisé à voir la liste des fonctions',0,1,1,1,1,0,0,0),(25,'create_new_fonctions','Autorisé à créer une nouvelle fonction',0,0,1,1,1,0,0,0),(26,'edit_fonctions','Autorisé à éditer une fonction',0,0,0,1,1,0,0,0),(27,'delete_fonctions','Autorisé à supprimer une fonction',0,0,0,0,0,0,0,0),(28,'view_users_pages','Autorisé à voir la page des autres membres',0,0,1,1,1,0,0,0),(29,'reject_incidents','Autorisé à rejeter un incident',0,0,1,1,1,0,0,0),(30,'cloture_incidents','Autorisé à cloturer les incidents ou à faire une demande de cloture',0,1,1,1,1,1,1,1),(31,'view_button_admin','Autorisé à voir le bouton administration',0,1,1,1,1,0,0,0),(32,'view_index_agencies','Autorisé à voir la page d\'index des agences',0,1,1,1,1,1,1,1),(33,'view_agency_details','Autorisé à voir les détails d\'une agence',0,1,1,1,1,0,0,0),(34,'create_new_agency','Autorisé à créer une nouvelle agence',0,0,0,1,1,0,0,0),(35,'edit_agency','Autorisé à editer une agence existante',0,0,0,1,1,0,0,0),(37,'edit_user','Autorisé à éditer ses informations personnelles',1,1,1,1,1,1,1,1),(38,'edit_other_user','Autorisé à editer le profil d\'autres utilisateurs',0,1,1,1,1,0,0,0),(39,'edit_all_user','Autorisé à modifier tous les champs d\'un utilisateur',0,0,1,1,1,0,0,0),(40,'edit_like_a_boss','Autorisé à modifier le type d\'utilisateur',0,0,0,1,1,0,0,0),(41,'view_detail_incident','Autorisé à voir le détail des incidents',0,1,1,1,1,1,1,1),(42,'ask_for_reaffect','Autorisé à demander une réaffectation de l\'incident',0,1,1,1,1,0,0,0),(43,'edit_categories_incidents','Autorisé à modifier la catégorie et sous catégorie d\'un incident',0,0,1,1,1,0,0,0),(44,'edit_lvl_incident','Autorisé à modifier le niveau d\'un incident',0,0,1,1,1,0,0,0),(45,'save_changes_of_edit','Autorisé à enregistrer les modifications d\'un incident',0,1,1,1,1,0,0,0),(46,'treat_incidents','Autorisé à traiter les incidents',0,1,1,1,1,0,0,0),(47,'create_procedure','Autorisé à créer une procedure',0,1,1,1,1,0,0,0),(48,'view_procedures','Autorisé à voir les procedures',0,1,1,1,1,1,1,1),(49,'edit_procedure','Autorisé à modifier les procedures',0,1,1,1,1,0,0,0),(50,'archive_procedure','Autorisé à archiver les procedures',0,1,1,1,1,0,0,0),(51,'delete_procedure','Autorisé à supprimer une procedure',0,0,0,1,0,0,0,0),(52,'ping_agencies','Autorisé à pinger les agences',0,1,1,1,1,0,0,0),(53,'create_sellers','Autorisé à ajouter des vendeurs de matériel',0,0,1,1,1,0,0,0),(54,'modify_sellers','Autorisé à modifier des vendeurs de matériel',0,0,1,1,1,0,0,0),(55,'delete_sellers','Autorisé à supprimer des vendeurs de matériel',0,0,0,1,1,0,0,0),(56,'view_sellers','Autorisé à voir les vendeurs de matériel',0,1,1,1,1,0,0,0),(57,'create_fields_sellers','Autorisé à créer des champs de données pour les vendeurs',0,0,0,1,1,0,0,0),(58,'modify_fields_sellers','Autorisé à modifier des champs de données pour les vendeurs',0,0,0,1,1,0,0,0),(59,'delete_fields_sellers','Autorisé à supprimer des champs de données pour les vendeurs',0,0,0,1,0,0,0,0),(60,'view_fields_sellers','Autorisé à voir les champs de données pour les vendeurs',0,1,1,1,1,0,0,0),(61,'create_detentor_type','Autorisé à créer des types de detenteur de matériel',0,0,0,1,1,0,0,0),(62,'modify_detentor_type','Autorisé à modifier des types de detenteur de matériel',0,0,0,1,1,0,0,0),(63,'delete_detentor_type','Autorisé à supprimer des types de detenteur de matériel',0,0,0,1,0,0,0,0),(64,'view_detentor_type','Autorisé à voir les types de détenteur de matériel',0,1,1,1,1,0,0,0),(65,'create_material','Autorisé à créer des matériels',0,1,1,1,1,0,0,0),(66,'modify_material','Autorisé à modifier des matériels',0,0,1,1,1,0,0,0),(67,'delete_material','Autorisé à supprimer des materiels',0,0,0,1,0,0,0,0),(68,'view_material','Autorisé à voir les matériels',0,1,1,1,1,0,0,0),(69,'create_spec_material','Autorisé à créer des specs pour les matériels',0,1,1,1,1,0,0,0),(70,'modify_spec_material','Autorisé à modifier des specs pour les matériels',0,0,1,1,1,0,0,0),(71,'delete_spec_material','Autorisé à supprimer les specs pour les matériels',0,0,0,1,0,0,0,0),(72,'view_spec_material','Autorisé à voir les spec pour les matériels',0,1,1,1,1,0,0,0),(73,'create_spec_type_material','Autorisé à créer des champs de spec pour les matériels',0,0,0,1,1,0,0,0),(74,'modify_spec_type_material','Autorisé à modifier des champs de spec pour les matériels',0,0,0,1,1,0,0,0),(75,'delete_spec_type_material','Autorisé à supprimer des champs de spec pour les matériels',0,0,0,1,0,0,0,0),(76,'view_spec_type_material','Autorisé à voir les champs de spec pour les matériels',0,1,1,1,1,0,0,0),(77,'create_type_material','Autorisé à créer des types de matériels',0,0,1,1,1,0,0,0),(78,'modify_type_material','Autorisé à modifier des types de matériels',0,0,0,1,1,0,0,0),(79,'delete_type_material','Autorisé à supprimer des types de matériels',0,0,0,1,0,0,0,0),(80,'view_type_material','Autorisé à voir les types de matériels',0,1,1,1,1,1,1,1),(81,'doPing','Autorisé à pinger',0,1,1,1,1,0,0,0),(82,'delete_agency','Autorisé à supprimer une agence',0,0,0,0,0,0,0,0),(83,'delete_user','Autorisé à supprimer un utilisateur',0,0,0,1,0,0,NULL,NULL),(84,'create_update','Autorisé à créer une mise à jour',0,0,0,1,0,0,0,0),(85,'modify_update','Autorisé à modifier une mise à jour',0,0,0,1,0,0,0,0),(86,'delete_update','Autorisé à supprimer un mise à jour',0,0,0,1,0,0,0,0),(87,'view_update','Autorisé à voir les mises à jour',0,0,0,1,0,0,0,0);
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
INSERT INTO `schema_migrations` VALUES ('20150825071155'),('20150825071156'),('20150825071157'),('20150825071158'),('20150825071159'),('20150825071200'),('20150825071837'),('20150826070025'),('20150901065526'),('20150904132424'),('20150910095317'),('20150914075438'),('20150914075509'),('20150914075522'),('20150921082325'),('20151005135925'),('20151005140014'),('20151019081406'),('20160125141130'),('20160502144426'),('20160525075243'),('20160621092116'),('20160711132653'),('20160712084750'),('20160720071521'),('20160729133714'),('20160729133935'),('20160729134015'),('20160729134037'),('20160729134122'),('20160729134215'),('20160729134243'),('20160729140500'),('20160729140616'),('20160729140722'),('20160729141019'),('20160805131815'),('20160805140517'),('20160805143904'),('20160808090901'),('20160808090902'),('20160808090903'),('20160808092715'),('20160808092716');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sous_categories`
--

LOCK TABLES `sous_categories` WRITE;
/*!40000 ALTER TABLE `sous_categories` DISABLE KEYS */;
INSERT INTO `sous_categories` VALUES (1,'Messagerie',3,10,'2015-12-08 13:43:27','2015-12-08 13:43:27'),(2,'Navigateur internet',3,10,'2015-12-08 13:45:01','2015-12-08 13:45:01'),(3,'VPN',3,10,'2015-12-08 13:45:14','2015-12-08 13:45:14'),(4,'Messages suspects',3,10,'2015-12-08 13:45:28','2015-12-08 13:45:28'),(5,'Routeur',3,10,'2015-12-08 13:45:47','2016-01-14 10:53:28'),(6,'Outlook',4,10,'2015-12-08 13:46:30','2015-12-08 13:46:30'),(7,'Antivirus',4,10,'2015-12-08 13:46:48','2015-12-08 13:46:48'),(8,'Installer/Desinstaller',4,10,'2015-12-08 13:47:13','2015-12-08 13:47:13'),(9,'Lecteur Olympus',4,10,'2015-12-08 13:47:29','2015-12-08 13:47:29'),(10,'Gestion des fichiers',4,10,'2015-12-08 13:48:00','2015-12-08 13:48:00'),(11,'JobList',4,10,'2015-12-08 13:49:00','2015-12-08 13:49:00'),(12,'Word',4,10,'2015-12-08 13:49:16','2015-12-08 13:49:16'),(13,'Excel',4,10,'2015-12-08 13:49:37','2015-12-08 13:49:37'),(14,'Net-Expert DSS',1,10,'2015-12-08 13:50:17','2015-12-08 13:50:17'),(15,'Connectique',5,10,'2015-12-08 14:02:51','2015-12-08 14:02:51'),(16,'Alimentation',5,10,'2015-12-08 14:03:10','2015-12-08 14:03:10'),(17,'Ecran',5,10,'2015-12-08 14:03:27','2015-12-08 14:03:27'),(18,'Son',5,10,'2015-12-08 14:03:36','2015-12-08 14:03:36'),(19,'Stockage',5,10,'2015-12-08 14:03:55','2015-12-08 14:03:55'),(20,'Microphone',5,10,'2015-12-08 14:04:22','2015-12-08 14:04:22'),(21,'Comptes Email',6,10,'2015-12-08 14:05:38','2015-12-08 14:05:38'),(22,'Contacts',6,10,'2015-12-08 14:05:52','2015-12-08 14:05:52'),(23,'Messages',6,10,'2015-12-08 14:06:09','2015-12-08 14:06:09'),(25,'Parametrage',6,10,'2015-12-08 14:06:58','2015-12-08 14:06:58'),(26,'Autre',1,10,'2016-01-13 09:50:56','2016-01-13 09:50:56'),(27,'Jobliste',1,10,'2016-01-14 10:50:02','2016-01-14 10:50:02'),(28,'Intranet',3,10,'2016-01-14 10:54:29','2016-01-14 10:54:29'),(30,'Autre',7,10,'2016-01-26 10:45:05','2016-01-26 10:45:05'),(31,'Autre',2,10,'2016-01-26 10:46:15','2016-01-26 10:46:15'),(32,'Autre',3,10,'2016-01-26 10:46:24','2016-01-26 10:46:24'),(33,'Autre',4,10,'2016-01-26 10:46:33','2016-01-26 10:46:33'),(34,'Autre',5,10,'2016-01-26 10:46:43','2016-01-26 10:46:43'),(35,'Autre',6,10,'2016-01-26 10:46:52','2016-01-26 10:46:52'),(36,'Autre',9,10,'2016-01-26 10:48:05','2016-01-26 10:48:05'),(37,'Autre',10,10,'2016-02-09 09:11:25','2016-02-09 09:11:25'),(38,'NetExpert',1,10,'2016-06-10 16:29:57','2016-06-10 16:29:57'),(39,'Autre',10,10,'2016-07-22 12:47:09','2016-07-22 12:47:09'),(40,'Autre',11,10,'2016-07-22 12:47:21','2016-07-22 12:47:21'),(41,'Bla',NULL,4,'2016-07-22 12:55:44','2016-07-22 12:55:44'),(42,'khuyku',NULL,10,'2016-07-22 12:56:07','2016-07-22 12:56:07'),(43,'hthfthf',NULL,10,'2016-07-22 12:57:42','2016-07-22 12:57:42'),(44,'njunujnjuk',NULL,10,'2016-07-22 12:58:49','2016-07-22 12:58:49'),(45,'tddtf',NULL,10,'2016-07-22 13:01:04','2016-07-22 13:01:04'),(46,'vfvfdgrd',3,10,'2016-07-22 13:02:30','2016-07-22 13:02:30'),(47,'buibihn',3,10,'2016-07-22 13:02:39','2016-07-22 13:02:39'),(48,'Autre',12,10,'2016-07-22 13:22:19','2016-07-22 13:22:19'),(49,'Autre',13,10,'2016-07-22 13:22:25','2016-07-22 13:22:25'),(50,'Autre',14,10,'2016-08-02 09:33:56','2016-08-02 09:33:56');
/*!40000 ALTER TABLE `sous_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spec_material_materials`
--

DROP TABLE IF EXISTS `spec_material_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spec_material_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spec_material_id` int(11) DEFAULT NULL,
  `material_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spec_material_materials`
--

LOCK TABLES `spec_material_materials` WRITE;
/*!40000 ALTER TABLE `spec_material_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `spec_material_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specs_materials`
--

DROP TABLE IF EXISTS `specs_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specs_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specs_types_material_id` int(11) DEFAULT NULL,
  `spec_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specs_materials`
--

LOCK TABLES `specs_materials` WRITE;
/*!40000 ALTER TABLE `specs_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `specs_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specs_types_materials`
--

DROP TABLE IF EXISTS `specs_types_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specs_types_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specs_types_materials`
--

LOCK TABLES `specs_types_materials` WRITE;
/*!40000 ALTER TABLE `specs_types_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `specs_types_materials` ENABLE KEYS */;
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
-- Table structure for table `type_materials`
--

DROP TABLE IF EXISTS `type_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_materials`
--

LOCK TABLES `type_materials` WRITE;
/*!40000 ALTER TABLE `type_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_materials_sellers`
--

DROP TABLE IF EXISTS `types_materials_sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_materials_sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_material_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_materials_sellers`
--

LOCK TABLES `types_materials_sellers` WRITE;
/*!40000 ALTER TABLE `types_materials_sellers` DISABLE KEYS */;
/*!40000 ALTER TABLE `types_materials_sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_materials_spec_materials`
--

DROP TABLE IF EXISTS `types_materials_spec_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types_materials_spec_materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_material_id` int(11) DEFAULT NULL,
  `spec_material_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_materials_spec_materials`
--

LOCK TABLES `types_materials_spec_materials` WRITE;
/*!40000 ALTER TABLE `types_materials_spec_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `types_materials_spec_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changesMade` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES (1,'Correction de trucs\r\n','2016-08-05 14:34:41','2016-08-05 14:37:22'),(2,'Changements effectués :\r\nCorrection du bug lié à l\'affichage des agences\r\nCorrection du bug lié au lien des utilisateurs\r\nChangement rendu de la page catégories','2016-08-05 14:46:32','2016-08-05 14:46:32'),(3,'Changements effectués :\r\nCorrection du bug lié à l\'affichage des agences\r\nCorrection du bug lié au lien des utilisateurs\r\nChangement rendu de la page catégories','2016-08-05 14:46:53','2016-08-05 14:46:53'),(4,'<p>Correction de bugs</p>\r\n\r\n<p>Autre correction de bugs !</p>\r\n\r\n<p>Et encore une !!!</p>\r\n','2016-08-05 14:52:18','2016-08-05 14:52:18'),(5,'<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n','2016-08-05 14:53:38','2016-08-05 14:53:38'),(6,'<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de','2016-08-05 15:02:47','2016-08-05 15:02:47'),(12,'<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage des agences</p>\r\n\r\n<p>Correction du bug li&eacute; au lien des utilisateurs</p>\r\n\r\n<p>Changement rendu de la page cat&eacute;gories</p>\r\n\r\n<p>Correction du bug li&eacute; &agrave; l&#39;affichage de</p>\r\n','2016-08-08 15:08:13','2016-08-08 15:08:13'),(13,'<p>Bla bla bla bla</p>\r\n\r\n<p>Bla bla bla bla</p>\r\n\r\n<p>Bla bla bla bla</p>\r\n\r\n<p>Bla bla bla bla</p>\r\n','2016-08-08 15:09:47','2016-08-08 15:09:47'),(14,'<p>H&eacute;h&eacute; !!!</p>\r\n\r\n<p>&nbsp;</p>\r\n','2016-08-08 15:15:09','2016-08-08 15:15:09'),(15,'<p>Yay !!!</p>\r\n','2016-08-09 07:19:51','2016-08-09 07:19:51');
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
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
  `ip_addr` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maj` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_tech_id` (`tech_id`),
  KEY `index_users_on_agency_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jm','jeremy.montesinos@cle-expertises.fr','0788607459','','Montesinos','Jeremy','',NULL,4,NULL,NULL,NULL,NULL,2,'2015-11-23 14:03:05','2016-08-09 07:19:52','Nuit','192.168.10.48',0),(4,'jerome.guillot','bujghuikhgidshilfhizsefh@yopmail.com','0683039620','','Guillot','Jérôme','sonya88','',5,'','',0,'0000-00-00 00:00:00',2,'2015-12-09 09:47:39','2016-08-05 14:53:38','Nuit','192.168.10.48',1),(5,'yvon.partoo','bujghuikhgidshilfhizsefh@yopmail.com','0555555555','','Partoo','Yvon',' ',NULL,3,NULL,NULL,NULL,NULL,2,'2015-12-16 08:27:43','2016-08-05 14:53:38','Jour',NULL,1),(6,'guy.schwalm','bujghuikhgidshilfhizsefh@yopmail.com','0622634975','','Schwalm','Guy','Volu348%',NULL,3,NULL,NULL,NULL,NULL,2,'2016-01-08 11:07:30','2016-08-05 14:53:38','Jour',NULL,1),(7,'germaine.tapeautour','bujghuikhgidshilfhizsefh@yopmail.com','0666666666','','Tapeautour','Germaine',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-02-02 08:50:03','2016-08-22 15:13:35','Jour',NULL,0),(8,'carole.naudin','bujghuikhgidshilfhizsefh@yopmail.com','0467998164','','Naudin','Carole',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-02-08 10:37:23','2016-08-05 14:53:38','Jour',NULL,1),(9,'yasmina.eude','bujghuikhgidshilfhizsefh@yopmail.com','0467999067','','Eude','Yasmina',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-02-10 14:04:38','2016-08-05 14:53:38','Jour',NULL,1),(10,'josiane.auclair','bujghuikhgidshilfhizsefh@yopmail.com','0467999067','','Auclair','Josiane',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-02-11 12:30:46','2016-08-05 14:53:38','Jour',NULL,1),(11,'ecureuil','bujghuikhgidshilfhizsefh@yopmail.com','0475580896','0658285838','Kopf','Sandrine',' ',NULL,1,NULL,NULL,NULL,NULL,7,'2016-04-28 15:02:42','2016-08-09 08:01:57','Nuit','192.168.10.48',0),(12,'sandie.ferrier','bujghuikhgidshilfhizsefh@yopmail.com','0475580896','','Ferrier','Sandie',' ',NULL,6,NULL,NULL,NULL,NULL,7,'2016-05-27 13:55:36','2016-08-05 14:53:38','Jour',NULL,1),(13,'dorothee.gerard','bujghuikhgidshilfhizsefh@yopmail.com','0467999067','','Gerard','Dorothée',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-06-08 15:23:53','2016-08-05 14:53:38','Jour',NULL,1),(14,'chantal','bujghuikhgidshilfhizsefh@yopmail.com','0467998161','0688314643','Chantal ','Chantal mourand',' ',NULL,6,NULL,NULL,NULL,NULL,2,'2016-06-10 10:39:44','2016-08-08 15:14:16','Jour',NULL,1),(15,'bnjk.bbjhbjh','bnjk.bbjhbjh@cle-expertises.fr','0161654644','','Bbjhbjh','Bnjk',' ',NULL,7,NULL,NULL,NULL,NULL,14,'2016-07-20 14:46:24','2016-08-05 14:53:38','Jour',NULL,1),(16,'jeromedd.guillot','bujghuikhgidshilfhizsefh@yopmail.com','0683039620','','Guillot','Jérôme','sonya88',NULL,5,NULL,NULL,NULL,NULL,2,'2016-08-04 12:59:51','2016-08-05 14:53:38','Jour','192.168.10.48',1);
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

-- Dump completed on 2016-08-24 11:39:52
