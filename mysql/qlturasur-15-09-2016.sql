-- MySQL dump 10.13  Distrib 5.5.50, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: qlturasur
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
-- Table structure for table `accounts_genre`
--

DROP TABLE IF EXISTS `accounts_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color` varchar(200) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `accounts_genre_language_id_efcf8c79_fk_geography_language_id` (`language_id`),
  KEY `accounts_genre_2dbcba41` (`slug`),
  CONSTRAINT `accounts_genre_language_id_efcf8c79_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_genre`
--

LOCK TABLES `accounts_genre` WRITE;
/*!40000 ALTER TABLE `accounts_genre` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_membership`
--

DROP TABLE IF EXISTS `accounts_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `finish` datetime DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_membership_2dbcba41` (`slug`),
  KEY `accounts_membership_ef42673f` (`subscription_id`),
  CONSTRAINT `accounts_me_subscription_id_57fd4cda_fk_accounts_subscription_id` FOREIGN KEY (`subscription_id`) REFERENCES `accounts_subscription` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_membership`
--

LOCK TABLES `accounts_membership` WRITE;
/*!40000 ALTER TABLE `accounts_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_red`
--

DROP TABLE IF EXISTS `accounts_red`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_red` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` char(32) NOT NULL,
  `name` varchar(300) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `url` varchar(300) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_red_article_id_c0658647_fk_blog_article_id` (`article_id`),
  KEY `accounts_red_config_id_2b135f67_fk_blog_config_id` (`config_id`),
  KEY `accounts_red_user_id_23226b9b_fk_auth_user_id` (`user_id`),
  KEY `accounts_red_2dbcba41` (`slug`),
  CONSTRAINT `accounts_red_article_id_c0658647_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `accounts_red_config_id_2b135f67_fk_blog_config_id` FOREIGN KEY (`config_id`) REFERENCES `blog_config` (`id`),
  CONSTRAINT `accounts_red_user_id_23226b9b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_red`
--

LOCK TABLES `accounts_red` WRITE;
/*!40000 ALTER TABLE `accounts_red` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_red` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_subscription`
--

DROP TABLE IF EXISTS `accounts_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `duracion` int(11) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `accounts_subscript_language_id_01a79b51_fk_geography_language_id` (`language_id`),
  KEY `accounts_subscription_2dbcba41` (`slug`),
  CONSTRAINT `accounts_subscript_language_id_01a79b51_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_subscription`
--

LOCK TABLES `accounts_subscription` WRITE;
/*!40000 ALTER TABLE `accounts_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_userconfig`
--

DROP TABLE IF EXISTS `accounts_userconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` longtext,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_userconfig_2dbcba41` (`slug`),
  CONSTRAINT `accounts_userconfig_user_id_9941dffb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userconfig`
--

LOCK TABLES `accounts_userconfig` WRITE;
/*!40000 ALTER TABLE `accounts_userconfig` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_userconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_userprofile`
--

DROP TABLE IF EXISTS `accounts_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `slogan` longtext,
  `body` longtext,
  `born` datetime DEFAULT NULL,
  `telefono01` varchar(20) NOT NULL,
  `telefono02` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `youtube` longtext NOT NULL,
  `mapa` longtext NOT NULL,
  `live` longtext NOT NULL,
  `multimedia` longtext NOT NULL,
  `archive` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `membership_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `trend_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_userprofile_address_id_1e385580_fk_geography_address_id` (`address_id`),
  KEY `accounts_userprofile_category_id_e3a7d8f8_fk_blog_category_id` (`category_id`),
  KEY `accounts_userprofile_genre_id_cc74ce83_fk_accounts_genre_id` (`genre_id`),
  KEY `accounts_userprofi_language_id_a6dea094_fk_geography_language_id` (`language_id`),
  KEY `accounts_userpr_membership_id_2a53909a_fk_accounts_membership_id` (`membership_id`),
  KEY `accounts_userprofile_profile_id_19df22a6_fk_blog_profile_id` (`profile_id`),
  KEY `accounts_userprofile_section_id_a6b4f951_fk_blog_section_id` (`section_id`),
  KEY `accounts_userprofile_tag_id_f692befe_fk_blog_tag_id` (`tag_id`),
  KEY `accounts_userprofile_trend_id_a1741db9_fk_blog_trend_id` (`trend_id`),
  KEY `accounts_userprofile_2dbcba41` (`slug`),
  CONSTRAINT `accounts_userprofile_address_id_1e385580_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`),
  CONSTRAINT `accounts_userprofile_category_id_e3a7d8f8_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `accounts_userprofile_genre_id_cc74ce83_fk_accounts_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `accounts_genre` (`id`),
  CONSTRAINT `accounts_userprofile_profile_id_19df22a6_fk_blog_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `accounts_userprofile_section_id_a6b4f951_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `accounts_userprofile_tag_id_f692befe_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `accounts_userprofile_trend_id_a1741db9_fk_blog_trend_id` FOREIGN KEY (`trend_id`) REFERENCES `blog_trend` (`id`),
  CONSTRAINT `accounts_userprofile_user_id_92240672_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `accounts_userprofi_language_id_a6dea094_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `accounts_userpr_membership_id_2a53909a_fk_accounts_membership_id` FOREIGN KEY (`membership_id`) REFERENCES `accounts_membership` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Suscripción',7,'add_subscription'),(20,'Can change Suscripción',7,'change_subscription'),(21,'Can delete Suscripción',7,'delete_subscription'),(22,'Can add Membership',8,'add_membership'),(23,'Can change Membership',8,'change_membership'),(24,'Can delete Membership',8,'delete_membership'),(25,'Can add Genero',9,'add_genre'),(26,'Can change Genero',9,'change_genre'),(27,'Can delete Genero',9,'delete_genre'),(28,'Can add Red social',10,'add_red'),(29,'Can change Red social',10,'change_red'),(30,'Can delete Red social',10,'delete_red'),(31,'Can add Perfil de usuario',11,'add_userprofile'),(32,'Can change Perfil de usuario',11,'change_userprofile'),(33,'Can delete Perfil de usuario',11,'delete_userprofile'),(34,'Can add Configuracion de usuario',12,'add_userconfig'),(35,'Can change Configuracion de usuario',12,'change_userconfig'),(36,'Can delete Configuracion de usuario',12,'delete_userconfig'),(37,'Can add Configuracion',13,'add_config'),(38,'Can change Configuracion',13,'change_config'),(39,'Can delete Configuracion',13,'delete_config'),(40,'Can add 0-Categoria',14,'add_category'),(41,'Can change 0-Categoria',14,'change_category'),(42,'Can delete 0-Categoria',14,'delete_category'),(43,'Can add 1-Seccion',15,'add_section'),(44,'Can change 1-Seccion',15,'change_section'),(45,'Can delete 1-Seccion',15,'delete_section'),(46,'Can add 2-Tag',16,'add_tag'),(47,'Can change 2-Tag',16,'change_tag'),(48,'Can delete 2-Tag',16,'delete_tag'),(49,'Can add 3-Trend',17,'add_trend'),(50,'Can change 3-Trend',17,'change_trend'),(51,'Can delete 3-Trend',17,'delete_trend'),(52,'Can add 4-Profile',18,'add_profile'),(53,'Can change 4-Profile',18,'change_profile'),(54,'Can delete 4-Profile',18,'delete_profile'),(55,'Can add Publicación',19,'add_article'),(56,'Can change Publicación',19,'change_article'),(57,'Can delete Publicación',19,'delete_article'),(58,'Can add Idioma',20,'add_language'),(59,'Can change Idioma',20,'change_language'),(60,'Can delete Idioma',20,'delete_language'),(61,'Can add Moneda',21,'add_currency'),(62,'Can change Moneda',21,'change_currency'),(63,'Can delete Moneda',21,'delete_currency'),(64,'Can add Continente',22,'add_continent'),(65,'Can change Continente',22,'change_continent'),(66,'Can delete Continente',22,'delete_continent'),(67,'Can add Pais',23,'add_country'),(68,'Can change Pais',23,'change_country'),(69,'Can delete Pais',23,'delete_country'),(70,'Can add Region',24,'add_region'),(71,'Can change Region',24,'change_region'),(72,'Can delete Region',24,'delete_region'),(73,'Can add Estado',25,'add_state'),(74,'Can change Estado',25,'change_state'),(75,'Can delete Estado',25,'delete_state'),(76,'Can add Ciudad',26,'add_city'),(77,'Can change Ciudad',26,'change_city'),(78,'Can delete Ciudad',26,'delete_city'),(79,'Can add Zona',27,'add_zone'),(80,'Can change Zona',27,'change_zone'),(81,'Can delete Zona',27,'delete_zone'),(82,'Can add Comunidad',28,'add_community'),(83,'Can change Comunidad',28,'change_community'),(84,'Can delete Comunidad',28,'delete_community'),(85,'Can add Locacion',29,'add_location'),(86,'Can change Locacion',29,'change_location'),(87,'Can delete Locacion',29,'delete_location'),(88,'Can add Direccion',30,'add_address'),(89,'Can change Direccion',30,'change_address'),(90,'Can delete Direccion',30,'delete_address'),(91,'Can add Media Categoria',31,'add_mediacategory'),(92,'Can change Media Categoria',31,'change_mediacategory'),(93,'Can delete Media Categoria',31,'delete_mediacategory'),(94,'Can add Media',32,'add_media'),(95,'Can change Media',32,'change_media'),(96,'Can delete Media',32,'delete_media'),(97,'Can add Sección de página',33,'add_pagesection'),(98,'Can change Sección de página',33,'change_pagesection'),(99,'Can delete Sección de página',33,'delete_pagesection'),(100,'Can add Página',34,'add_page'),(101,'Can change Página',34,'change_page'),(102,'Can delete Página',34,'delete_page');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'4258237portishead1','2016-07-05 14:54:41',1,'qlturasur','','','qlturasur@gmail.com',1,1,'2016-05-31 17:42:02'),(2,'pbkdf2_sha256$24000$RjuDa7mChuoZ$kcxwyu7tJicsIWwrq790qd4T1ivNSpEbunHdFMrrM4k=','2016-06-01 15:19:59',0,'Fundarte','','','',0,1,'2016-06-01 15:19:58'),(3,'pbkdf2_sha256$24000$7ljLqa58EVWg$k6NKIG+6aHCkxkEL64EAURlKTyryxkn3/CUnq0juXf8=','2016-06-01 15:54:24',0,'KikeMendez','','','',0,1,'2016-06-01 15:54:23'),(4,'pbkdf2_sha256$24000$8AHRDROngIlI$wcRiAL0ko1VgRCyWyP/QsL398GVpe8Pc5pX6OS3JtEQ=','2016-06-01 16:37:53',0,'PoesiaNomada','','','',0,1,'2016-06-01 16:37:53'),(5,'pbkdf2_sha256$24000$qdszwr8JHh3p$evvkxxo7JGvi0pmWv2Mp5zsWkdcS/TfKp6l27dCae04=','2016-06-14 17:11:50',0,'Raúl Acosta','','','',0,1,'2016-06-14 17:11:50'),(10,'pbkdf2_sha256$24000$RAjksd3qSjAx$YeIhmsVIVXZc/LvdXTLpNr8nFN1pX0aOFbpIXiIhedw=','2016-06-19 01:37:36',0,'RottenInLife','','','',0,1,'2016-06-19 01:37:35'),(11,'pbkdf2_sha256$24000$YexmYrachCh1$K3ia3RF+DF2Nr1rrcft/Q+PcrSitFDzuw7DFG8UghyE=','2016-06-19 01:57:48',0,'DustinDolly','','','',0,1,'2016-06-19 01:57:47'),(12,'pbkdf2_sha256$24000$f5lujTCq9cmK$BzCeXL+Ri7v6urWC6ji5QJe2KHjgKCI5VGw+5kfFHkE=','2016-07-25 12:13:36',0,'humaArte','','','',0,1,'2016-07-25 12:13:36'),(13,'pbkdf2_sha256$20000$fnXNBoxiIpyj$K+5f4nLg2yOUWZQD5yfFdd2AsoKomSGwlfp1Be4SjQs=','2016-09-15 06:11:11',1,'almaginet','','','almaginet@gmail.com',1,1,'2016-07-25 11:17:24'),(14,'pbkdf2_sha256$24000$OLWkDvLK1Q5b$rQBC1AkqR/yH2BnBKcsW3FFX8AqUmWWv2YsFzpZrQ2o=','2016-07-25 11:23:23',0,'RadioSensaciones','','','',0,1,'2016-07-25 11:23:22'),(15,'pbkdf2_sha256$20000$imE21DjaBDvI$pmuq1/mB6roOuUr9mYqJke6C034WMwAeBXAtQ1C1dAI=','2016-08-03 20:39:35',0,'MamboCafe','','','',0,1,'2016-08-03 20:39:35'),(16,'pbkdf2_sha256$20000$Fyd0WTUijerI$ddueEphYJHyrdFY7FfDIU+WGVT050eUuMhYWIxocSxc=','2016-08-08 18:29:07',0,'Bonso','','','',0,1,'2016-08-03 21:21:18'),(17,'pbkdf2_sha256$20000$8HhgJn3V8CQl$Zti/TAEzEf6ng6UDfHV/14s85P0MOdxuouNfO2NRweQ=','2016-08-03 21:23:45',0,'RetosDeVida','','','',0,1,'2016-08-03 21:23:44'),(18,'pbkdf2_sha256$20000$2s82YZPOAnpg$UN/FnhS3GcYs37oW/AwgGsA7nSj93sgNIpPxHNlBQmc=','2016-08-03 21:29:14',0,'CurubaCafeBar','','','',0,1,'2016-08-03 21:29:14'),(19,'pbkdf2_sha256$20000$d7pmKA0V3Vf9$Q7NWfUIhefxDQzpwRi9zz2gxPSY5OUJzkKsiQltg5wQ=','2016-08-06 16:50:31',0,'FundacionCulturalJebeNegro','','','',0,1,'2016-08-06 16:50:31'),(20,'pbkdf2_sha256$20000$E2DGFbEQuSSx$R7Sh4X8tZsOg1yEjSeL1JOUgOkjYhIuAh/5s4+F2z8g=','2016-09-01 01:03:14',0,'kreab','','','',0,1,'2016-09-01 01:03:14');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `background` varchar(100) DEFAULT NULL,
  `youtube` longtext NOT NULL,
  `mapa` longtext NOT NULL,
  `live` longtext NOT NULL,
  `multimedia` longtext NOT NULL,
  `video` varchar(100) DEFAULT NULL,
  `audio` varchar(100) DEFAULT NULL,
  `archive` varchar(100) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `finish` datetime DEFAULT NULL,
  `publish` datetime DEFAULT NULL,
  `unpublish` datetime DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(144) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category2_id` int(11) DEFAULT NULL,
  `category3_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `profile2_id` int(11) DEFAULT NULL,
  `profile3_id` int(11) DEFAULT NULL,
  `section_id` int(11) NOT NULL,
  `section2_id` int(11) DEFAULT NULL,
  `section3_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `tag2_id` int(11) DEFAULT NULL,
  `tag3_id` int(11) DEFAULT NULL,
  `trend_id` int(11) DEFAULT NULL,
  `trend2_id` int(11) DEFAULT NULL,
  `trend3_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `blog_article_address_id_05d1ae54_fk_geography_address_id` (`address_id`),
  KEY `blog_article_2dbcba41` (`slug`),
  KEY `blog_article_b583a629` (`category_id`),
  KEY `blog_article_c6024334` (`category2_id`),
  KEY `blog_article_cb1082d1` (`category3_id`),
  KEY `blog_article_468679bd` (`language_id`),
  KEY `blog_article_5e7b1936` (`owner_id`),
  KEY `blog_article_83a0eb3f` (`profile_id`),
  KEY `blog_article_4186ab98` (`profile2_id`),
  KEY `blog_article_b9d6531f` (`profile3_id`),
  KEY `blog_article_730f6511` (`section_id`),
  KEY `blog_article_6be5d109` (`section2_id`),
  KEY `blog_article_849293a9` (`section3_id`),
  KEY `blog_article_76f094bc` (`tag_id`),
  KEY `blog_article_b8791fee` (`tag2_id`),
  KEY `blog_article_c950c2b7` (`tag3_id`),
  KEY `blog_article_e881e49b` (`trend_id`),
  KEY `blog_article_24e1819d` (`trend2_id`),
  KEY `blog_article_ea245fcb` (`trend3_id`),
  CONSTRAINT `blog_article_address_id_05d1ae54_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`),
  CONSTRAINT `blog_article_category2_id_1adc8a7a_fk_blog_category_id` FOREIGN KEY (`category2_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_category3_id_0f49217e_fk_blog_category_id` FOREIGN KEY (`category3_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_language_id_8692f4a9_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_article_owner_id_5cc237cd_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_article_profile2_id_a7fc0b6f_fk_blog_profile_id` FOREIGN KEY (`profile2_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `blog_article_profile3_id_24118711_fk_blog_profile_id` FOREIGN KEY (`profile3_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `blog_article_profile_id_b13eeb5e_fk_blog_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `blog_article_section2_id_a99a1cda_fk_blog_section_id` FOREIGN KEY (`section2_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_article_section3_id_4d0c2153_fk_blog_section_id` FOREIGN KEY (`section3_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_article_section_id_2cfa4ebe_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_article_tag2_id_c277d515_fk_blog_tag_id` FOREIGN KEY (`tag2_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_article_tag3_id_54729695_fk_blog_tag_id` FOREIGN KEY (`tag3_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_article_tag_id_4c94be52_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_article_trend2_id_e360ecaf_fk_blog_trend_id` FOREIGN KEY (`trend2_id`) REFERENCES `blog_trend` (`id`),
  CONSTRAINT `blog_article_trend3_id_a9b72795_fk_blog_trend_id` FOREIGN KEY (`trend3_id`) REFERENCES `blog_trend` (`id`),
  CONSTRAINT `blog_article_trend_id_fd464ff7_fk_blog_trend_id` FOREIGN KEY (`trend_id`) REFERENCES `blog_trend` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `body` longtext NOT NULL,
  `color` longtext NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_category_language_id_ba7cfa29_fk_geography_language_id` (`language_id`),
  KEY `blog_category_2dbcba41` (`slug`),
  CONSTRAINT `blog_category_language_id_ba7cfa29_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_config`
--

DROP TABLE IF EXISTS `blog_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webName` varchar(300) NOT NULL,
  `webSlogan` varchar(300) NOT NULL,
  `webUrl` varchar(300) NOT NULL,
  `addons` longtext NOT NULL,
  `text01` varchar(300) DEFAULT NULL,
  `text02` varchar(300) DEFAULT NULL,
  `text03` varchar(300) DEFAULT NULL,
  `text04` varchar(300) DEFAULT NULL,
  `text05` varchar(300) DEFAULT NULL,
  `text06` varchar(300) DEFAULT NULL,
  `text07` varchar(300) DEFAULT NULL,
  `text08` varchar(300) DEFAULT NULL,
  `text09` varchar(300) DEFAULT NULL,
  `text10` varchar(300) DEFAULT NULL,
  `text11` varchar(300) DEFAULT NULL,
  `dino01` varchar(300) DEFAULT NULL,
  `dino02` varchar(300) DEFAULT NULL,
  `dino03` varchar(300) DEFAULT NULL,
  `dino04` varchar(300) DEFAULT NULL,
  `dino05` varchar(300) DEFAULT NULL,
  `dino06` varchar(300) DEFAULT NULL,
  `dino07` varchar(300) DEFAULT NULL,
  `dino08` varchar(300) DEFAULT NULL,
  `dino09` varchar(300) DEFAULT NULL,
  `dino00` varchar(300) DEFAULT NULL,
  `favicon` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `color` longtext NOT NULL,
  `color02` longtext NOT NULL,
  `color03` longtext NOT NULL,
  `color04` longtext NOT NULL,
  `telefono01` varchar(20) NOT NULL,
  `telefono02` varchar(20) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `videoMp4` varchar(100) DEFAULT NULL,
  `videoOgv` varchar(100) DEFAULT NULL,
  `videoWebm` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `categoryBackground` varchar(100) DEFAULT NULL,
  `sectionBackground` varchar(100) DEFAULT NULL,
  `trendBackground` varchar(100) DEFAULT NULL,
  `profileBackground` varchar(100) DEFAULT NULL,
  `articleBackground` varchar(100) DEFAULT NULL,
  `categoryLogo` varchar(100) DEFAULT NULL,
  `sectionLogo` varchar(100) DEFAULT NULL,
  `trendLogo` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_config_address_id_fd3cb07f_fk_geography_address_id` (`address_id`),
  KEY `blog_config_language_id_2d1b35bb_fk_geography_language_id` (`language_id`),
  KEY `blog_config_2dbcba41` (`slug`),
  CONSTRAINT `blog_config_address_id_fd3cb07f_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`),
  CONSTRAINT `blog_config_language_id_2d1b35bb_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_config`
--

LOCK TABLES `blog_config` WRITE;
/*!40000 ALTER TABLE `blog_config` DISABLE KEYS */;
INSERT INTO `blog_config` VALUES (1,'#AlQuitoLoSalvaSuGente','Expresa tu sentimiento','www.qlturasur.org','<script>\r\n  (function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,\'script\',\'https://www.google-analytics.com/analytics.js\',\'ga\');\r\n\r\n  ga(\'create\', \'UA-75283313-1\', \'auto\');\r\n  ga(\'send\', \'pageview\');\r\n\r\n</script>\r\n\r\n<style>\r\n.face h2{\r\n	font-family: roboto!important;\r\n	padding: 20px!important;\r\n	font-size: 18px!important;\r\n	line-height: 1.5!important;\r\n}\r\n</style>\r\n\r\n<style>\r\n.heavenEast{\r\nbackground: #1e5799;\r\nbackground: -moz-linear-gradient(left,  #1e5799 0%, #ff0000 100%);\r\nbackground: -webkit-linear-gradient(left,  #1e5799 0%,#ff0000 100%);\r\nbackground: linear-gradient(to right,  #1e5799 0%,#ff0000 100%);\r\nfilter: progid:DXImageTransform.Microsoft.gradient( startColorstr=\'#1e5799\', endColorstr=\'#ff0000\',GradientType=1 );\r\n\r\n}\r\n</style>','explorar','Inicio','Mapa Cultural','Publicar','Salir','Sentimientos que trascienden','¿No estas listo para publicar?','Encuentra más experiencias','Pública','Publicar','Otro','Imágenes','Audios','Videos','Archivos','Ubicación','Transmision','Fechas','Involúcrate','Más','Información','favicon/buhosouth.png','Hoy 15 de Septiembre, Siempre Fieles Hinchas de esta Ciudad, Esta Plaza y Este Campo, sufrimos en nuestros corazones un dolor, una lucha. Quito levanta su canto sobre las fronteras del mundo y este día con orgullo, clamamos un aliento de esperanza, un sentimiento encontrado, para que nuestro Equipo amado no muera sin dar la cancha. Queremos verles la cara a ustedes, Vidas del Futbol, Ayúdanos a retomar el rumbo, Respondamos al poder: ¿Por que jamás van a poder arrancarnos este amor? Responde desde tu corazón, y que el Equipo nunca caiga. Que sientan la fuerza de nuestra causa, que ningún equipo debe desaparecer sin luchar y entregar los pies y la voz, sobre el tablón. “¡PERO SI EL QUITO MUERE, LO HAREMOS JUGANDO, VESTIDOS DE AZULGRANA, Y SERÁ DE PIE!”','rgba(137, 85, 0, 0.36)','red','rgba(44, 19, 92, 0.4)','black','','','2016/6/1/1','config/alquitolosalvasugente_j9YEDpH.png','','','','config/10858006_779944005406721_5645024855684556303_n.jpg','','','','','','','','','2016-05-31 19:40:05','2016-09-15 08:15:59','qlturasur',NULL,NULL);
/*!40000 ALTER TABLE `blog_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_page`
--

DROP TABLE IF EXISTS `blog_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `PageSection_id` int(11) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_page_PageSection_id_60a21751914c86a0_fk_blog_pagesection_id` (`PageSection_id`),
  KEY `blog_page_2dbcba41` (`slug`),
  CONSTRAINT `blog_page_PageSection_id_60a21751914c86a0_fk_blog_pagesection_id` FOREIGN KEY (`PageSection_id`) REFERENCES `blog_pagesection` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_page`
--

LOCK TABLES `blog_page` WRITE;
/*!40000 ALTER TABLE `blog_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_pagesection`
--

DROP TABLE IF EXISTS `blog_pagesection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_pagesection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_pagesection_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_pagesection`
--

LOCK TABLES `blog_pagesection` WRITE;
/*!40000 ALTER TABLE `blog_pagesection` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_pagesection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_profile`
--

DROP TABLE IF EXISTS `blog_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_profile_category_id_dc133fd0_fk_blog_category_id` (`category_id`),
  KEY `blog_profile_language_id_414e0a80_fk_geography_language_id` (`language_id`),
  KEY `blog_profile_2dbcba41` (`slug`),
  KEY `blog_profile_730f6511` (`section_id`),
  KEY `blog_profile_76f094bc` (`tag_id`),
  CONSTRAINT `blog_profile_category_id_dc133fd0_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_profile_language_id_414e0a80_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_profile_section_id_93814983_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_profile_tag_id_83eb905d_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_profile`
--

LOCK TABLES `blog_profile` WRITE;
/*!40000 ALTER TABLE `blog_profile` DISABLE KEYS */;
INSERT INTO `blog_profile` VALUES (4,'Azulgrana','','blue','trends/logos/quito_BwCuxAx.png','','2016-09-15 06:29:21','2016-09-15 06:43:15','barras-azulgrana',NULL,NULL,NULL,NULL),(5,'Ecuador','','red','trends/logos/170.png','','2016-09-15 06:29:38','2016-09-15 06:43:22','barras-ecuatorianas',NULL,NULL,NULL,NULL),(6,'Barras Sur','','red','trends/logos/86.png','','2016-09-15 06:29:57','2016-09-15 06:42:16','barras-sur-americanas',NULL,NULL,NULL,NULL),(7,'Mundo Entero','','blue','trends/logos/95.png','','2016-09-15 06:30:19','2016-09-15 06:44:22','barras-del-mundo',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `blog_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_section`
--

DROP TABLE IF EXISTS `blog_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_section_language_id_bf908c21_fk_geography_language_id` (`language_id`),
  KEY `blog_section_2dbcba41` (`slug`),
  CONSTRAINT `blog_section_language_id_bf908c21_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_section`
--

LOCK TABLES `blog_section` WRITE;
/*!40000 ALTER TABLE `blog_section` DISABLE KEYS */;
INSERT INTO `blog_section` VALUES (4,'Solidaridad','','#333','','','2016-09-15 06:47:28','2016-09-15 06:47:28','solidaridad',NULL),(5,'Amor','','#333','','','2016-09-15 06:47:38','2016-09-15 06:52:01','lealtad',NULL),(6,'Lealtad','','#333','','','2016-09-15 06:51:01','2016-09-15 06:51:52','conviccion',NULL);
/*!40000 ALTER TABLE `blog_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `blog_tag_language_id_b599e302_fk_geography_language_id` (`language_id`),
  KEY `blog_tag_section_id_f4ee52f8_fk_blog_section_id` (`section_id`),
  KEY `blog_tag_2dbcba41` (`slug`),
  CONSTRAINT `blog_tag_language_id_b599e302_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_tag_section_id_f4ee52f8_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_trend`
--

DROP TABLE IF EXISTS `blog_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_trend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `body` longtext NOT NULL,
  `color` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_trend_language_id_ba7b3940_fk_geography_language_id` (`language_id`),
  KEY `blog_trend_tag_id_36dd18d3_fk_blog_tag_id` (`tag_id`),
  KEY `blog_trend_2dbcba41` (`slug`),
  CONSTRAINT `blog_trend_language_id_ba7b3940_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_trend_tag_id_36dd18d3_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_trend`
--

LOCK TABLES `blog_trend` WRITE;
/*!40000 ALTER TABLE `blog_trend` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_trend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-05-31 19:40:05','1','Qlturasur',1,'Added.',13,1),(2,'2016-05-31 19:40:47','1','Qlturasur',2,'Changed background.',13,1),(3,'2016-05-31 19:46:46','1','Arte',1,'Added.',15,1),(4,'2016-05-31 19:47:52','1','Arte',2,'Changed photo.',15,1),(5,'2016-05-31 19:49:42','2','Ciudad',1,'Added.',15,1),(6,'2016-05-31 19:51:43','3','Educación',1,'Added.',15,1),(7,'2016-05-31 20:07:35','1','Cultores',1,'Added.',18,1),(8,'2016-05-31 20:08:43','2','Comunidades',1,'Added.',18,1),(9,'2016-05-31 20:10:56','3','Instituciones',1,'Added.',18,1),(10,'2016-05-31 20:11:55','2','Comunidades',2,'Changed photo.',18,1),(11,'2016-06-01 15:32:55','1','Festival de Teatro de Caracas 2016',2,'Changed background, youtube and live.',19,1),(12,'2016-06-01 15:34:20','1','Festival de Teatro de Caracas 2016',2,'Changed start and finish.',19,1),(13,'2016-06-01 15:37:46','1','Fundarte',2,'Changed name, slogan, body, photo, background and youtube.',11,1),(14,'2016-06-01 15:39:59','1','Fundarte',2,'Changed slogan.',11,1),(15,'2016-06-01 15:44:18','1','Qlturasur',2,'Changed categoria.',13,1),(16,'2016-06-01 15:44:37','1','Qlturasur',2,'Changed categoria.',13,1),(17,'2016-06-01 21:07:55','1','Qlturasur',2,'Changed addons.',13,1),(18,'2016-07-05 14:55:47','4','Grupo de hackers hackea contraseñas de todas las páginas web del mundo en un solo algoritmo',3,'',19,1),(19,'2016-07-05 14:55:47','5','Gobierno de Siria desmantela banda militar de Nu metal.',3,'',19,1),(20,'2016-07-05 14:55:47','6','Bar Japones 乳房',3,'',19,1),(21,'2016-07-05 14:55:47','7','Venezuela - Italia',3,'',19,1),(22,'2016-07-05 14:55:47','8','Maestros venezolanos se hacen doctores en USA',3,'',19,1),(23,'2016-07-05 14:55:47','9','Lucha por los derechos homosexuales de los bailarines de salsa',3,'',19,1),(24,'2016-07-05 14:55:47','11','Sintonia es el nuevo programa de aprhensión Animal en el estado Unido de Islandia',3,'',19,1),(25,'2016-07-05 14:55:47','12','Lista de conciertos Ciudad de Taiwan 2018',3,'',19,1),(26,'2016-07-05 14:55:47','14','Sensaciones Online Presente en el Quinto evento de Golondrinas Azules de la ciudad de Japón.',3,'',19,1),(27,'2016-07-05 14:55:47','15','Capturan a Luis Raúl Castellano en Rueda de Prensa de La Semifinal Europea de Moscú',3,'',19,1),(28,'2016-07-05 14:55:47','16','DESCARGAR DISCO DE BLUES',3,'',19,1),(29,'2016-07-05 14:55:47','17','RESPUESTA DE BARAK BONAPARTE A PRESIDENTE DE LONDRES SEÑOR MINISTRO DE LA REPUBLICA 08',3,'',19,1),(30,'2016-07-05 14:55:47','18','SEÑOR PRESIDENTE',3,'',19,1),(31,'2016-07-05 14:55:47','19','Alberto peñalosa Jimenéz duda de la existencia Orbitaria de la quinta Negación del Ser. Detalles',3,'',19,1),(32,'2016-07-05 14:55:47','20','Metódo de inserción de una imagen digital en redes sociales hacia un servicio html',3,'',19,1),(33,'2016-07-05 14:55:47','21','#TWITTER',3,'',19,1),(34,'2016-07-05 14:55:47','22','Carniceria Humana 2010',3,'',19,1),(35,'2016-07-05 14:55:47','23','Entrevista a mortem rotten',3,'',19,1),(36,'2016-07-05 14:55:47','25','1990',3,'',19,1),(37,'2016-07-05 14:55:47','27','Org',3,'',19,1),(38,'2016-07-05 14:56:18','26','México 0 - 7 Chile | Copa América Centenario 2016 | Claudio Palma',3,'',19,1),(39,'2016-07-05 14:56:36','13','RadioSensacionesOnline',3,'',19,1),(40,'2016-07-05 14:56:59','10','Fundación arte en movimiento',3,'',19,1),(41,'2016-07-05 14:58:58','8','BlackSabbath',3,'',4,1),(42,'2016-07-05 14:58:58','13','EstadodeMX',3,'',4,1),(43,'2016-07-05 14:58:58','12','FireHouse',3,'',4,1),(44,'2016-07-05 14:58:58','6','GrupoDeHackers',3,'',4,1),(45,'2016-07-05 14:58:58','7','kikito',3,'',4,1),(46,'2016-07-05 14:58:58','9','Sarai',3,'',4,1),(47,'2016-07-05 15:12:27','1','Qlturasur',2,'Modificado/a description.',13,1),(48,'2016-07-25 11:18:30','1','Venezuela',2,'Modificado/a name.',18,13),(49,'2016-07-25 11:18:40','2','Colombia',2,'Modificado/a name.',18,13),(50,'2016-07-25 11:18:51','3','Ecuador',2,'Modificado/a name.',18,13),(51,'2016-07-25 11:20:17','1','Venezuela',2,'Modificado/a photo.',18,13),(52,'2016-07-25 11:20:31','2','Colombia',2,'Modificado/a photo.',18,13),(53,'2016-07-25 11:20:45','3','Ecuador',2,'Modificado/a photo.',18,13),(54,'2016-07-25 11:23:04','1','Qlturasur',2,'Modificado/a text02.',13,13),(55,'2016-07-25 11:45:02','1','Qlturasur',2,'Modificado/a description.',13,13),(56,'2016-07-25 11:54:02','1','Qlturasur',2,'Modificado/a background.',13,13),(57,'2016-07-25 12:00:27','1','Qlturasur',2,'Modificado/a color03.',13,13),(58,'2016-07-25 12:01:17','1','Qlturasur',2,'Modificado/a description.',13,13),(59,'2016-07-25 12:03:32','1','Qlturasur',2,'Modificado/a text06.',13,13),(60,'2016-07-25 11:20:01','1','Qlturasur',2,'Modificado/a color.',13,13),(61,'2016-07-25 11:22:13','1','Qlturasur',2,'Modificado/a color02.',13,13),(62,'2016-07-25 11:24:48','1','Qlturasur',2,'Modificado/a background.',13,13),(63,'2016-07-25 11:26:33','1','Qlturasur',2,'Modificado/a background.',13,13),(64,'2016-07-25 11:32:44','11','humaArte',3,'',11,13),(65,'2016-07-25 11:32:44','10','DustinDolly',3,'',11,13),(66,'2016-07-25 11:32:44','9','RottenInLife',3,'',11,13),(67,'2016-07-25 11:32:44','3','PoesiaNomada',3,'',11,13),(68,'2016-07-25 11:32:44','2','KikeMendez',3,'',11,13),(69,'2016-07-25 11:33:40','2','Fundación Asonic Lucha contra el cancer infantil',3,'',19,13),(70,'2016-07-25 11:33:40','3','Reconstrucción historica de la escritura Ecuatoriana',3,'',19,13),(71,'2016-07-25 11:33:41','24','#DustinDollyVideos',3,'',19,13),(72,'2016-07-25 11:33:41','25','hola',3,'',19,13),(73,'2016-07-25 12:08:25','1','Qlturasur',2,'Modificado/a color04.',13,13),(74,'2016-07-25 12:10:19','1','Qlturasur',2,'Modificado/a color04.',13,13),(75,'2016-08-03 20:49:00','26','Este Viernes es el Lanzamiento del Mambo Café Quito',2,'Modificado/a body, mapa, live y multimedia.',19,13),(76,'2016-08-03 20:50:27','26','Este Viernes es el Lanzamiento del Mambo Café Quito',2,'Modificado/a body, background y start.',19,13),(77,'2016-08-03 21:03:17','1','56a0dc56-e6cc-4373-a7d7-f57c2726118d',1,'',30,13),(78,'2016-08-03 21:03:33','13','MamboCafe',2,'Modificado/a name, slogan, body, born, photo, background, multimedia y address.',11,13),(79,'2016-08-03 21:04:35','26','Este Viernes es el Lanzamiento del Mambo Café Quito',2,'Modificado/a mapa y multimedia.',19,13),(80,'2016-08-03 21:04:50','26','Este Viernes es el Lanzamiento del Mambo Café Quito',2,'No ha cambiado ningún campo.',19,13),(81,'2016-08-03 21:06:04','13','MamboCafe',2,'Modificado/a youtube, mapa y live.',11,13),(82,'2016-08-03 21:07:48','1','Fundarte',2,'Modificado/a profile.',11,13),(83,'2016-08-11 14:35:49','30','Maderas con identidad',2,'Modificado/a title.',19,13),(84,'2016-08-30 15:51:06','14','Bonso',2,'Modificado/a photo.',11,13),(85,'2016-08-30 15:54:10','14','Bonso',2,'Modificado/a background.',11,13),(86,'2016-09-01 01:09:04','31','lanzamiento de Ecuador. Inmediato ',2,'Modificado/a background.',19,13),(87,'2016-09-15 06:06:20','1','Qlturasur',2,'Modificado/a background.',13,13),(88,'2016-09-15 06:11:37','1','Qlturasur',2,'Modificado/a addons.',13,13),(89,'2016-09-15 06:15:13','1','Qlturasur',2,'Modificado/a logo.',13,13),(90,'2016-09-15 06:15:42','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a webName.',13,13),(91,'2016-09-15 06:18:19','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a description.',13,13),(92,'2016-09-15 06:23:58','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a color04.',13,13),(93,'2016-09-15 06:26:35','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a text06.',13,13),(94,'2016-09-15 06:28:54','1','Venezuela',3,'',18,13),(95,'2016-09-15 06:28:54','2','Colombia',3,'',18,13),(96,'2016-09-15 06:28:54','3','Ecuador',3,'',18,13),(97,'2016-09-15 06:29:21','4','Barras Azulgrana',1,'',18,13),(98,'2016-09-15 06:29:39','5','Barras Ecuatorianas',1,'',18,13),(99,'2016-09-15 06:29:57','6','Barras Sur Americanas',1,'',18,13),(100,'2016-09-15 06:30:19','7','Barras del mundo',1,'',18,13),(101,'2016-09-15 06:31:52','6','Barras Sur',2,'Modificado/a name.',18,13),(102,'2016-09-15 06:32:13','7','Todo el mundo',2,'Modificado/a name.',18,13),(103,'2016-09-15 06:33:28','6','Barras Sur',2,'Modificado/a photo.',18,13),(104,'2016-09-15 06:33:54','5','Barras Ecuador',2,'Modificado/a name y photo.',18,13),(105,'2016-09-15 06:35:18','4','Barras Azulgrana',2,'Modificado/a photo.',18,13),(106,'2016-09-15 06:36:08','7','Todo el mundo',2,'Modificado/a photo.',18,13),(107,'2016-09-15 06:39:08','4','Barras Azulgrana',2,'Modificado/a photo.',18,13),(108,'2016-09-15 06:40:34','4','Barras Azulgrana',2,'Modificado/a photo.',18,13),(109,'2016-09-15 06:42:03','4','Barras Azulgrana',2,'Modificado/a color.',18,13),(110,'2016-09-15 06:42:09','5','Barras Ecuador',2,'Modificado/a color.',18,13),(111,'2016-09-15 06:42:16','6','Barras Sur',2,'Modificado/a color.',18,13),(112,'2016-09-15 06:42:24','7','Todo el mundo',2,'Modificado/a color.',18,13),(113,'2016-09-15 06:43:15','4','Azulgrana',2,'Modificado/a name.',18,13),(114,'2016-09-15 06:43:22','5','Ecuador',2,'Modificado/a name.',18,13),(115,'2016-09-15 06:43:46','7','Todo el Mundo',2,'Modificado/a name.',18,13),(116,'2016-09-15 06:44:22','7','Mundo Entero',2,'Modificado/a name.',18,13),(117,'2016-09-15 06:47:18','1','Arte',3,'',15,13),(118,'2016-09-15 06:47:18','2','Ciudad',3,'',15,13),(119,'2016-09-15 06:47:18','3','Educación',3,'',15,13),(120,'2016-09-15 06:47:28','4','Solidaridad',1,'',15,13),(121,'2016-09-15 06:47:38','5','Lealtad',1,'',15,13),(122,'2016-09-15 06:51:01','6','Conviccion',1,'',15,13),(123,'2016-09-15 06:51:13','6','Amor',2,'Modificado/a name.',15,13),(124,'2016-09-15 06:51:52','6','Lealtad',2,'Modificado/a name.',15,13),(125,'2016-09-15 06:52:01','5','Amor',2,'Modificado/a name.',15,13),(126,'2016-09-15 06:53:04','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a webSlogan y text06.',13,13),(127,'2016-09-15 07:23:57','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a description.',13,13),(128,'2016-09-15 07:57:11','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a color04.',13,13),(129,'2016-09-15 07:59:03','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a color03.',13,13),(130,'2016-09-15 07:59:48','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a background.',13,13),(131,'2016-09-15 08:02:20','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a color03.',13,13),(132,'2016-09-15 08:03:03','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a background.',13,13),(133,'2016-09-15 08:04:49','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a color03.',13,13),(134,'2016-09-15 08:07:17','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a logo.',13,13),(135,'2016-09-15 08:10:29','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a color.',13,13),(136,'2016-09-15 08:13:14','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a description.',13,13),(137,'2016-09-15 08:15:59','1','#AlQuitoLoSalvaSuGente',2,'Modificado/a addons.',13,13);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'accounts','genre'),(8,'accounts','membership'),(10,'accounts','red'),(7,'accounts','subscription'),(12,'accounts','userconfig'),(11,'accounts','userprofile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(19,'blog','article'),(14,'blog','category'),(13,'blog','config'),(34,'blog','page'),(33,'blog','pagesection'),(18,'blog','profile'),(15,'blog','section'),(16,'blog','tag'),(17,'blog','trend'),(5,'contenttypes','contenttype'),(30,'geography','address'),(26,'geography','city'),(28,'geography','community'),(22,'geography','continent'),(23,'geography','country'),(21,'geography','currency'),(20,'geography','language'),(29,'geography','location'),(24,'geography','region'),(25,'geography','state'),(27,'geography','zone'),(32,'medias','media'),(31,'medias','mediacategory'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-05-31 17:27:39'),(2,'auth','0001_initial','2016-05-31 17:27:39'),(3,'admin','0001_initial','2016-05-31 17:27:39'),(4,'admin','0002_logentry_remove_auto_add','2016-05-31 17:27:39'),(5,'contenttypes','0002_remove_content_type_name','2016-05-31 17:27:39'),(6,'auth','0002_alter_permission_name_max_length','2016-05-31 17:27:39'),(7,'auth','0003_alter_user_email_max_length','2016-05-31 17:27:39'),(8,'auth','0004_alter_user_username_opts','2016-05-31 17:27:39'),(9,'auth','0005_alter_user_last_login_null','2016-05-31 17:27:39'),(10,'auth','0006_require_contenttypes_0002','2016-05-31 17:27:39'),(11,'auth','0007_alter_validators_add_error_messages','2016-05-31 17:27:39'),(12,'sessions','0001_initial','2016-05-31 17:27:39'),(13,'geography','0001_initial','2016-05-31 17:28:53'),(14,'blog','0001_initial','2016-05-31 17:28:56'),(15,'accounts','0001_initial','2016-05-31 17:28:57'),(16,'medias','0001_initial','2016-06-01 15:28:02');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('18icovhzwb6w7in8hyybnaodqviby9mq','NTY0MGQzMzcyMGJkYTE1Y2U0YWNiZDQ5MWNlZWVjNzA3YThiZmZiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1ZjM3MTAzNmYyYWNiOGJjOTYzMDliNzgyOGRkYTM0OWY1MTk1ZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2016-09-13 15:50:38'),('37f2qj98bwotxwrf2komxmje741fo5u8','NDYyYTYxNmY2MjRjN2RmMmZiMWFjNDk0YzllNjM5ZjZjM2IwYTQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhOGM2ZGRiZTg2NDI3ZGYwN2JlNmMyYWRiMGNjY2RlNzBmYTQxZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-07-19 14:54:41'),('7pzws53dkgvp7urabargfsuxe6fec8t5','NTY0MGQzMzcyMGJkYTE1Y2U0YWNiZDQ5MWNlZWVjNzA3YThiZmZiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1ZjM3MTAzNmYyYWNiOGJjOTYzMDliNzgyOGRkYTM0OWY1MTk1ZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2016-08-25 14:34:31'),('8ecufdmiwli8beqfsbk15z51l2z2qyy3','NTY0MGQzMzcyMGJkYTE1Y2U0YWNiZDQ5MWNlZWVjNzA3YThiZmZiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1ZjM3MTAzNmYyYWNiOGJjOTYzMDliNzgyOGRkYTM0OWY1MTk1ZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2016-08-22 20:31:55'),('8j5cidx91mi7gjajvk3intgman5du8jl','NTY0MGQzMzcyMGJkYTE1Y2U0YWNiZDQ5MWNlZWVjNzA3YThiZmZiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1ZjM3MTAzNmYyYWNiOGJjOTYzMDliNzgyOGRkYTM0OWY1MTk1ZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2016-09-15 01:07:48'),('awp3p1xye0fs2wks2qc53a94j81n83bz','ZGI1ZGY4NjFlYzI0YzVlNDRlZmI1ZmJjZThmZWE5ZjgyYTBlYWM0ZDp7Il9hdXRoX3VzZXJfaGFzaCI6IjE4MDhhOWIxMzdhMGExNzJjY2E5MGQ0YzQwNTcxNmEyNTkxYjQ0YTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOSJ9','2016-08-20 16:50:31'),('dc1mp9grigl8h5zw88dmb4cerz9lgtif','NTY0MGQzMzcyMGJkYTE1Y2U0YWNiZDQ5MWNlZWVjNzA3YThiZmZiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1ZjM3MTAzNmYyYWNiOGJjOTYzMDliNzgyOGRkYTM0OWY1MTk1ZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2016-09-29 04:08:05'),('h7g2n4siel9j2nrp77usrbpow49y3pe8','NDYyYTYxNmY2MjRjN2RmMmZiMWFjNDk0YzllNjM5ZjZjM2IwYTQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhOGM2ZGRiZTg2NDI3ZGYwN2JlNmMyYWRiMGNjY2RlNzBmYTQxZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-06-15 21:07:19'),('khpcvbr5jbzzlmku1172v9wv1t84xcwc','NTY0MGQzMzcyMGJkYTE1Y2U0YWNiZDQ5MWNlZWVjNzA3YThiZmZiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1ZjM3MTAzNmYyYWNiOGJjOTYzMDliNzgyOGRkYTM0OWY1MTk1ZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2016-09-29 06:11:11'),('l037eyoja3rge968a94pslloyonnm537','OWUyMzZiMTQ2OWQyNTQ3YzIwODIwODYyYWM1NDQyMjk5MGFjMzdjMDp7Il9hdXRoX3VzZXJfaGFzaCI6ImZlMTdkYjY0NWZjNzMwZmRmOGI2MmFmMzMzN2RmMzVjZWJlMGE2ZjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2016-07-03 22:00:20'),('nyt75jktxvoiw3lq4zogb31ciax4fqfv','NDYyYTYxNmY2MjRjN2RmMmZiMWFjNDk0YzllNjM5ZjZjM2IwYTQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImNhOGM2ZGRiZTg2NDI3ZGYwN2JlNmMyYWRiMGNjY2RlNzBmYTQxZGEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-06-14 19:31:31'),('rkfwhoj399kguwkezr4w5tg9ua0ghrjy','NGIzYWI0YjViMTE2NzhjZDRhMzM2NmZhMzc4YjliM2FlMGVkNWJjODp7Il9hdXRoX3VzZXJfaGFzaCI6ImYwOGZmNWQwZTMxNjU0NWExOGExZjY5ODU4ODdiMzg0MjczYjdmMGIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxOCJ9','2016-08-17 21:29:14'),('wnhww496gkwb275t0fm4eax7cxusbzzb','MDk1NTAzOGUyNDQ4OTE4MTBiNTVkZjRhNTY0YWI0NmJjN2Q0ZDBjNDp7Il9hdXRoX3VzZXJfaGFzaCI6IjYwNTkwMTI5ZDA4NWVmMDI3ZTMzMTUxMmQxNTc4ZGI2YWYzNjZkYjAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=','2016-06-28 17:11:50'),('zj2llzwwwsumc75taj70pjuh7gdqaksu','NTY0MGQzMzcyMGJkYTE1Y2U0YWNiZDQ5MWNlZWVjNzA3YThiZmZiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImI1ZjM3MTAzNmYyYWNiOGJjOTYzMDliNzgyOGRkYTM0OWY1MTk1ZTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxMyJ9','2016-08-17 20:47:03');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_address`
--

DROP TABLE IF EXISTS `geography_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `body` longtext NOT NULL,
  `mapa` longtext NOT NULL,
  `lat` varchar(100) NOT NULL,
  `lng` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `geography_address_2dbcba41` (`slug`),
  KEY `geography_address_e274a5da` (`location_id`),
  CONSTRAINT `geography_address_location_id_951b5b45_fk_geography_location_id` FOREIGN KEY (`location_id`) REFERENCES `geography_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_address`
--

LOCK TABLES `geography_address` WRITE;
/*!40000 ALTER TABLE `geography_address` DISABLE KEYS */;
INSERT INTO `geography_address` VALUES (1,'56a0dc56e6cc4373a7d7f57c2726118d','56a0dc56-e6cc-4373-a7d7-f57c2726118d','','','-0.2005053','-78.4923879','2016-08-03 21:03:17','2016-08-03 21:03:17',NULL);
/*!40000 ALTER TABLE `geography_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_city`
--

DROP TABLE IF EXISTS `geography_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_city_2dbcba41` (`slug`),
  KEY `geography_city_d5582625` (`state_id`),
  CONSTRAINT `geography_city_state_id_76440657_fk_geography_state_id` FOREIGN KEY (`state_id`) REFERENCES `geography_state` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_city`
--

LOCK TABLES `geography_city` WRITE;
/*!40000 ALTER TABLE `geography_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_community`
--

DROP TABLE IF EXISTS `geography_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_community_2dbcba41` (`slug`),
  KEY `geography_community_06342dd7` (`zone_id`),
  CONSTRAINT `geography_community_zone_id_d267aa23_fk_geography_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `geography_zone` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_community`
--

LOCK TABLES `geography_community` WRITE;
/*!40000 ALTER TABLE `geography_community` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_continent`
--

DROP TABLE IF EXISTS `geography_continent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_continent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_continent_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_continent`
--

LOCK TABLES `geography_continent` WRITE;
/*!40000 ALTER TABLE `geography_continent` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_continent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_country`
--

DROP TABLE IF EXISTS `geography_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `continent_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_countr_continent_id_0755ea09_fk_geography_continent_id` (`continent_id`),
  KEY `geography_country_2dbcba41` (`slug`),
  KEY `geography_country_2c7d5721` (`currency_id`),
  KEY `geography_country_468679bd` (`language_id`),
  CONSTRAINT `geography_country_currency_id_6b7c5a11_fk_geography_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `geography_currency` (`id`),
  CONSTRAINT `geography_country_language_id_9eee34ab_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `geography_countr_continent_id_0755ea09_fk_geography_continent_id` FOREIGN KEY (`continent_id`) REFERENCES `geography_continent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_country`
--

LOCK TABLES `geography_country` WRITE;
/*!40000 ALTER TABLE `geography_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_currency`
--

DROP TABLE IF EXISTS `geography_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `symbol` varchar(300) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_currency_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_currency`
--

LOCK TABLES `geography_currency` WRITE;
/*!40000 ALTER TABLE `geography_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_language`
--

DROP TABLE IF EXISTS `geography_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_language_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_language`
--

LOCK TABLES `geography_language` WRITE;
/*!40000 ALTER TABLE `geography_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_location`
--

DROP TABLE IF EXISTS `geography_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_locati_community_id_32c0e97a_fk_geography_community_id` (`community_id`),
  KEY `geography_location_2dbcba41` (`slug`),
  CONSTRAINT `geography_locati_community_id_32c0e97a_fk_geography_community_id` FOREIGN KEY (`community_id`) REFERENCES `geography_community` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_location`
--

LOCK TABLES `geography_location` WRITE;
/*!40000 ALTER TABLE `geography_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_region`
--

DROP TABLE IF EXISTS `geography_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_region_country_id_7b89c739_fk_geography_country_id` (`country_id`),
  KEY `geography_region_2dbcba41` (`slug`),
  CONSTRAINT `geography_region_country_id_7b89c739_fk_geography_country_id` FOREIGN KEY (`country_id`) REFERENCES `geography_country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_region`
--

LOCK TABLES `geography_region` WRITE;
/*!40000 ALTER TABLE `geography_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_state`
--

DROP TABLE IF EXISTS `geography_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_state_region_id_99424c7d_fk_geography_region_id` (`region_id`),
  KEY `geography_state_2dbcba41` (`slug`),
  CONSTRAINT `geography_state_region_id_99424c7d_fk_geography_region_id` FOREIGN KEY (`region_id`) REFERENCES `geography_region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_state`
--

LOCK TABLES `geography_state` WRITE;
/*!40000 ALTER TABLE `geography_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geography_zone`
--

DROP TABLE IF EXISTS `geography_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geography_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `flag` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_zone_city_id_49ee0420_fk_geography_city_id` (`city_id`),
  KEY `geography_zone_2dbcba41` (`slug`),
  CONSTRAINT `geography_zone_city_id_49ee0420_fk_geography_city_id` FOREIGN KEY (`city_id`) REFERENCES `geography_city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_zone`
--

LOCK TABLES `geography_zone` WRITE;
/*!40000 ALTER TABLE `geography_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `geography_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medias_media`
--

DROP TABLE IF EXISTS `medias_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medias_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(32) NOT NULL,
  `description` longtext NOT NULL,
  `html` longtext NOT NULL,
  `archive` varchar(100) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `finish` datetime DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `mediaCategory_id` int(11) DEFAULT NULL,
  `profile_id` int(11) DEFAULT NULL,
  `red_id` int(11) DEFAULT NULL,
  `tagArticle_id` int(11) DEFAULT NULL,
  `tagProfile_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medias_media_address_id_21bd8ba1_fk_geography_address_id` (`address_id`),
  KEY `medias_media_article_id_168af554_fk_blog_article_id` (`article_id`),
  KEY `medias_media_2dbcba41` (`slug`),
  KEY `medias_media_1c876244` (`mediaCategory_id`),
  KEY `medias_media_83a0eb3f` (`profile_id`),
  KEY `medias_media_223bf4cf` (`red_id`),
  KEY `medias_media_0ec0c337` (`tagArticle_id`),
  KEY `medias_media_ec34f82e` (`tagProfile_id`),
  CONSTRAINT `medias_media_address_id_21bd8ba1_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`),
  CONSTRAINT `medias_media_article_id_168af554_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `medias_media_profile_id_a6d8e009_fk_accounts_userprofile_id` FOREIGN KEY (`profile_id`) REFERENCES `accounts_userprofile` (`id`),
  CONSTRAINT `medias_media_red_id_8b364994_fk_accounts_red_id` FOREIGN KEY (`red_id`) REFERENCES `accounts_red` (`id`),
  CONSTRAINT `medias_media_tagArticle_id_d49a13ec_fk_blog_article_id` FOREIGN KEY (`tagArticle_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `medias_media_tagProfile_id_2920835b_fk_accounts_userprofile_id` FOREIGN KEY (`tagProfile_id`) REFERENCES `accounts_userprofile` (`id`),
  CONSTRAINT `medias_medi_mediaCategory_id_4e284a72_fk_medias_mediacategory_id` FOREIGN KEY (`mediaCategory_id`) REFERENCES `medias_mediacategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias_media`
--

LOCK TABLES `medias_media` WRITE;
/*!40000 ALTER TABLE `medias_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `medias_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medias_mediacategory`
--

DROP TABLE IF EXISTS `medias_mediacategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medias_mediacategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `medias_mediacategory_2dbcba41` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias_mediacategory`
--

LOCK TABLES `medias_mediacategory` WRITE;
/*!40000 ALTER TABLE `medias_mediacategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `medias_mediacategory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-15  4:21:39
