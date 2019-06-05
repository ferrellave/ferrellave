-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: qlturasur
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `accounts_g_language_id_457eeb317816e41e_fk_geography_language_id` (`language_id`),
  KEY `accounts_genre_2dbcba41` (`slug`),
  CONSTRAINT `accounts_g_language_id_457eeb317816e41e_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_genre`
--

LOCK TABLES `accounts_genre` WRITE;
/*!40000 ALTER TABLE `accounts_genre` DISABLE KEYS */;
INSERT INTO `accounts_genre` VALUES (1,'genero1','red','','','2018-11-24 03:49:03.617422','2018-11-24 03:49:03.630680','genero1',NULL);
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
  `finish` datetime(6) DEFAULT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `subscription_id` int(11),
  PRIMARY KEY (`id`),
  KEY `accounts_membership_2dbcba41` (`slug`),
  KEY `accounts_membership_ef42673f` (`subscription_id`),
  CONSTRAINT `acc_subscription_id_54fae3e8f82475a1_fk_accounts_subscription_id` FOREIGN KEY (`subscription_id`) REFERENCES `accounts_subscription` (`id`)
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `article_id` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_red_article_id_45beb1e16dfb16cb_fk_blog_article_id` (`article_id`),
  KEY `accounts_red_config_id_5e9e62d25e0cf992_fk_blog_config_id` (`config_id`),
  KEY `accounts_red_user_id_317c607ee80e17bd_fk_auth_user_id` (`user_id`),
  KEY `accounts_red_2dbcba41` (`slug`),
  CONSTRAINT `accounts_red_article_id_45beb1e16dfb16cb_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `accounts_red_config_id_5e9e62d25e0cf992_fk_blog_config_id` FOREIGN KEY (`config_id`) REFERENCES `blog_config` (`id`),
  CONSTRAINT `accounts_red_user_id_317c607ee80e17bd_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `accounts_s_language_id_157bf794485c115d_fk_geography_language_id` (`language_id`),
  KEY `accounts_subscription_2dbcba41` (`slug`),
  CONSTRAINT `accounts_s_language_id_157bf794485c115d_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_userconfig_2dbcba41` (`slug`),
  CONSTRAINT `accounts_userconfig_user_id_72e283748b4d223c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `born` datetime(6) DEFAULT NULL,
  `telefono01` varchar(20) NOT NULL,
  `telefono02` varchar(20) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `background` varchar(100) DEFAULT NULL,
  `youtube` longtext NOT NULL,
  `mapa` longtext NOT NULL,
  `live` longtext NOT NULL,
  `multimedia` longtext NOT NULL,
  `archive` varchar(100) DEFAULT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
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
  `color01` varchar(200) NOT NULL,
  `color02` varchar(200) NOT NULL,
  `color03` varchar(200) NOT NULL,
  `color04` varchar(200) NOT NULL,
  `color05` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_use_address_id_5bbe69e710fcd2dc_fk_geography_address_id` (`address_id`),
  KEY `accounts_userpr_category_id_42d883ebfb266d49_fk_blog_category_id` (`category_id`),
  KEY `accounts_userprofi_genre_id_fd5c87a3af23dc3_fk_accounts_genre_id` (`genre_id`),
  KEY `accounts_u_language_id_1636d7089926710d_fk_geography_language_id` (`language_id`),
  KEY `accounts_membership_id_8af2517459c524d_fk_accounts_membership_id` (`membership_id`),
  KEY `accounts_userprof_profile_id_441499a6786ca827_fk_blog_profile_id` (`profile_id`),
  KEY `accounts_userprof_section_id_74ca49bd7cffddad_fk_blog_section_id` (`section_id`),
  KEY `accounts_userprofile_tag_id_3aca8134ffcf2f0_fk_blog_tag_id` (`tag_id`),
  KEY `accounts_userprofile_trend_id_366054ec4c139f93_fk_blog_trend_id` (`trend_id`),
  KEY `accounts_userprofile_2dbcba41` (`slug`),
  CONSTRAINT `accounts_membership_id_8af2517459c524d_fk_accounts_membership_id` FOREIGN KEY (`membership_id`) REFERENCES `accounts_membership` (`id`),
  CONSTRAINT `accounts_u_language_id_1636d7089926710d_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `accounts_use_address_id_5bbe69e710fcd2dc_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`),
  CONSTRAINT `accounts_userpr_category_id_42d883ebfb266d49_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `accounts_userprof_profile_id_441499a6786ca827_fk_blog_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `accounts_userprof_section_id_74ca49bd7cffddad_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `accounts_userprofi_genre_id_fd5c87a3af23dc3_fk_accounts_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `accounts_genre` (`id`),
  CONSTRAINT `accounts_userprofile_tag_id_3aca8134ffcf2f0_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `accounts_userprofile_trend_id_366054ec4c139f93_fk_blog_trend_id` FOREIGN KEY (`trend_id`) REFERENCES `blog_trend` (`id`),
  CONSTRAINT `accounts_userprofile_user_id_3c4c1a3843c1abe_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_userprofile`
--

LOCK TABLES `accounts_userprofile` WRITE;
/*!40000 ALTER TABLE `accounts_userprofile` DISABLE KEYS */;
INSERT INTO `accounts_userprofile` VALUES (1,'almaginet','este es el slogan de almaginet','este es el cuerpo de almaginet','2018-11-24 03:48:47.000000','+(52)0999297531','+(53)0999297532','profiles/avatar/logo.png','profiles/backgrounds/4back00.jpg','este es el youtube','<strong>aqui va el mapa</strong>','<strong>aqui va el live</strong>','<strong>aqui va el multimedia</strong>','articles/archives/marketing.pdf','2018-11-06 05:34:11.141266','2018-11-24 04:32:28.555794','almaginetcom',1,NULL,1,NULL,NULL,1,NULL,NULL,NULL,1,'white','black','rgba(0,0,0,0.6)','orange','green'),(2,'Juan Osorio','soy juan osorio','ofrezco servicios de',NULL,'','','profiles/avatar/2team2.jpg','profiles/backgrounds/back01.jpg','','','','','','2018-11-24 04:46:29.507912','2018-11-24 04:46:29.623127','osorio',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,3,'','','','',''),(3,'Yoga Inbound','Soy Goura Nitay','',NULL,'','','profiles/avatar/logo_bxnsph0.png','profiles/backgrounds/backs.png','','','','','','2018-11-24 04:57:38.236116','2018-11-24 04:57:38.320626','yogainbound',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,4,'orange','','','',''),(4,'LoveQuito','','',NULL,'','','profiles/avatar/onair.gif','profiles/backgrounds/backend.gif','','','','','','2018-11-24 05:45:09.291035','2018-11-24 05:45:09.489051','lovequito',NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,5,'blueviolet','','','','');
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add Suscripción',7,'add_subscription'),(20,'Can change Suscripción',7,'change_subscription'),(21,'Can delete Suscripción',7,'delete_subscription'),(22,'Can add Membership',8,'add_membership'),(23,'Can change Membership',8,'change_membership'),(24,'Can delete Membership',8,'delete_membership'),(25,'Can add Genero',9,'add_genre'),(26,'Can change Genero',9,'change_genre'),(27,'Can delete Genero',9,'delete_genre'),(28,'Can add Red social',10,'add_red'),(29,'Can change Red social',10,'change_red'),(30,'Can delete Red social',10,'delete_red'),(31,'Can add Perfil de usuario',11,'add_userprofile'),(32,'Can change Perfil de usuario',11,'change_userprofile'),(33,'Can delete Perfil de usuario',11,'delete_userprofile'),(34,'Can add Configuracion de usuario',12,'add_userconfig'),(35,'Can change Configuracion de usuario',12,'change_userconfig'),(36,'Can delete Configuracion de usuario',12,'delete_userconfig'),(37,'Can add Configuracion',13,'add_config'),(38,'Can change Configuracion',13,'change_config'),(39,'Can delete Configuracion',13,'delete_config'),(40,'Can add 0-Categoria',14,'add_category'),(41,'Can change 0-Categoria',14,'change_category'),(42,'Can delete 0-Categoria',14,'delete_category'),(43,'Can add 1-Seccion',15,'add_section'),(44,'Can change 1-Seccion',15,'change_section'),(45,'Can delete 1-Seccion',15,'delete_section'),(46,'Can add 2-Tag',16,'add_tag'),(47,'Can change 2-Tag',16,'change_tag'),(48,'Can delete 2-Tag',16,'delete_tag'),(49,'Can add 3-Trend',17,'add_trend'),(50,'Can change 3-Trend',17,'change_trend'),(51,'Can delete 3-Trend',17,'delete_trend'),(52,'Can add 4-Profile',18,'add_profile'),(53,'Can change 4-Profile',18,'change_profile'),(54,'Can delete 4-Profile',18,'delete_profile'),(55,'Can add Publicación',19,'add_article'),(56,'Can change Publicación',19,'change_article'),(57,'Can delete Publicación',19,'delete_article'),(58,'Can add Sección de página',20,'add_pagesection'),(59,'Can change Sección de página',20,'change_pagesection'),(60,'Can delete Sección de página',20,'delete_pagesection'),(61,'Can add Página',21,'add_page'),(62,'Can change Página',21,'change_page'),(63,'Can delete Página',21,'delete_page'),(64,'Can add Idioma',22,'add_language'),(65,'Can change Idioma',22,'change_language'),(66,'Can delete Idioma',22,'delete_language'),(67,'Can add Moneda',23,'add_currency'),(68,'Can change Moneda',23,'change_currency'),(69,'Can delete Moneda',23,'delete_currency'),(70,'Can add Continente',24,'add_continent'),(71,'Can change Continente',24,'change_continent'),(72,'Can delete Continente',24,'delete_continent'),(73,'Can add Pais',25,'add_country'),(74,'Can change Pais',25,'change_country'),(75,'Can delete Pais',25,'delete_country'),(76,'Can add Region',26,'add_region'),(77,'Can change Region',26,'change_region'),(78,'Can delete Region',26,'delete_region'),(79,'Can add Estado',27,'add_state'),(80,'Can change Estado',27,'change_state'),(81,'Can delete Estado',27,'delete_state'),(82,'Can add Ciudad',28,'add_city'),(83,'Can change Ciudad',28,'change_city'),(84,'Can delete Ciudad',28,'delete_city'),(85,'Can add Zona',29,'add_zone'),(86,'Can change Zona',29,'change_zone'),(87,'Can delete Zona',29,'delete_zone'),(88,'Can add Comunidad',30,'add_community'),(89,'Can change Comunidad',30,'change_community'),(90,'Can delete Comunidad',30,'delete_community'),(91,'Can add Locacion',31,'add_location'),(92,'Can change Locacion',31,'change_location'),(93,'Can delete Locacion',31,'delete_location'),(94,'Can add Direccion',32,'add_address'),(95,'Can change Direccion',32,'change_address'),(96,'Can delete Direccion',32,'delete_address'),(97,'Can add Media Categoria',33,'add_mediacategory'),(98,'Can change Media Categoria',33,'change_mediacategory'),(99,'Can delete Media Categoria',33,'delete_mediacategory'),(100,'Can add Media',34,'add_media'),(101,'Can change Media',34,'change_media'),(102,'Can delete Media',34,'delete_media');
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
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$JTyZEQJpbrJe$fIjqbadkyDO+Uwnm3CNgkytmOkSKrR+xSym5H8cFHEw=','2018-11-23 23:02:56.865842',1,'almaginet','','','almaginet@gmail.com',1,1,'2018-11-06 05:13:13.026370'),(2,'pbkdf2_sha256$20000$jTQNqUDs4Rg3$mfOHPhHc+vSO7afaqtdBXtIXgHnrvIBlKZGSha7Cef0=','2018-11-06 05:34:11.592834',0,'almaginet.com','','','',0,1,'2018-11-06 05:34:10.773044'),(3,'pbkdf2_sha256$20000$s31U9CFkbj8l$yjKSZquS6IVoRdG66an8nY9lhI3FhlwO2+1ZiBOS+lg=',NULL,0,'Osorio','','','',0,1,'2018-11-24 04:44:43.779801'),(4,'pbkdf2_sha256$20000$nbACrx4Pdibb$IM5LQbgFYADUj6Qfct5QnJW56KCaVDSusCiR4V/422U=',NULL,0,'YogaInbound','','','',0,1,'2018-11-24 04:55:51.844015'),(5,'pbkdf2_sha256$20000$dNlei28diSUK$/bFNAzpeOovORf1EG/s5TrCbFwuHNLKWU7sRbT4jMjE=',NULL,0,'LoveQuito','','','',0,1,'2018-11-24 05:44:14.167547');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  `start` datetime(6) DEFAULT NULL,
  `finish` datetime(6) DEFAULT NULL,
  `publish` datetime(6) DEFAULT NULL,
  `unpublish` datetime(6) DEFAULT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(144) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `category_id` int(11),
  `category2_id` int(11),
  `category3_id` int(11),
  `language_id` int(11),
  `owner_id` int(11),
  `profile_id` int(11),
  `profile2_id` int(11),
  `profile3_id` int(11),
  `section_id` int(11) NOT NULL,
  `section2_id` int(11),
  `section3_id` int(11),
  `tag_id` int(11),
  `tag2_id` int(11),
  `tag3_id` int(11),
  `trend_id` int(11),
  `trend2_id` int(11),
  `trend3_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `blog_article_address_id_638555db4cfff04e_fk_geography_address_id` (`address_id`),
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
  CONSTRAINT `blog_artic_language_id_1f81ed0d0e9caf17_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_article_address_id_638555db4cfff04e_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`),
  CONSTRAINT `blog_article_category2_id_6058b2b5466af0a_fk_blog_category_id` FOREIGN KEY (`category2_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_category3_id_f3526be27081955_fk_blog_category_id` FOREIGN KEY (`category3_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_category_id_45371416e1252d6d_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_article_owner_id_16c71a9844bb3421_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `blog_article_profile2_id_4a370086826cc806_fk_blog_profile_id` FOREIGN KEY (`profile2_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `blog_article_profile3_id_27f5ab185f63a291_fk_blog_profile_id` FOREIGN KEY (`profile3_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `blog_article_profile_id_69fbf606cbb28503_fk_blog_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `blog_profile` (`id`),
  CONSTRAINT `blog_article_section2_id_5b6e25449b03d7fc_fk_blog_section_id` FOREIGN KEY (`section2_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_article_section3_id_68f4b2a2f3b8dc0f_fk_blog_section_id` FOREIGN KEY (`section3_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_article_section_id_7cc12b26433a2a77_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_article_tag2_id_736b462d64d6bd31_fk_blog_tag_id` FOREIGN KEY (`tag2_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_article_tag3_id_20d8f35c20e96a92_fk_blog_tag_id` FOREIGN KEY (`tag3_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_article_tag_id_3d3d2ebb1586bc4e_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`),
  CONSTRAINT `blog_article_trend2_id_773af884a2f02596_fk_blog_trend_id` FOREIGN KEY (`trend2_id`) REFERENCES `blog_trend` (`id`),
  CONSTRAINT `blog_article_trend3_id_66f50bc2a10ea0e9_fk_blog_trend_id` FOREIGN KEY (`trend3_id`) REFERENCES `blog_trend` (`id`),
  CONSTRAINT `blog_article_trend_id_3875574470b0346f_fk_blog_trend_id` FOREIGN KEY (`trend_id`) REFERENCES `blog_trend` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva\"','Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva, Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva, Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva, Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva, Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva, Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva, Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva, Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva\", Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva','articles/backgrounds/backend.gif','','','','','','','','2018-11-23 23:57:26.000000','2018-11-23 23:57:30.000000','2018-11-06 05:34:53.648998',NULL,'2018-11-06 05:34:53.587794','2018-11-23 23:57:35.320152','2018/11/6/1',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Páginas web en Lima','Desde 360 soles','articles/backgrounds/back03.png','','','','','','','',NULL,NULL,'2018-11-24 04:49:48.163427',NULL,'2018-11-24 04:49:48.078048','2018-11-24 04:49:48.188818','2018/11/24/2',NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Mantra meditación','sesion de mantra','articles/backgrounds/4back00.jpg','','','','','','','',NULL,NULL,'2018-11-24 04:58:51.706389',NULL,'2018-11-24 04:58:51.593563','2018-11-24 04:58:51.715923','2018/11/24/3',NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'sobre quito','sobre quito','articles/backgrounds/15.png','','','','','','','',NULL,NULL,'2018-11-24 05:53:44.126937',NULL,'2018-11-24 05:53:44.005889','2018-11-24 05:53:44.136909','2018/11/24/4',NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_categ_language_id_1f61924267faeeba_fk_geography_language_id` (`language_id`),
  KEY `blog_category_2dbcba41` (`slug`),
  CONSTRAINT `blog_categ_language_id_1f61924267faeeba_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_config_address_id_5e36d6545f9436f7_fk_geography_address_id` (`address_id`),
  KEY `blog_confi_language_id_7d0aa505cf8186ae_fk_geography_language_id` (`language_id`),
  KEY `blog_config_2dbcba41` (`slug`),
  CONSTRAINT `blog_confi_language_id_7d0aa505cf8186ae_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_config_address_id_5e36d6545f9436f7_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_config`
--

LOCK TABLES `blog_config` WRITE;
/*!40000 ALTER TABLE `blog_config` DISABLE KEYS */;
INSERT INTO `blog_config` VALUES (1,'Almaginet Org','Comenzar','almaginet.org','','Explorar Proyectos','Lectura','Mapa (Beta)','Publicar','Salir','Últimas publicaciones en Almaginet Org','No estas listo','Mirar','Nueva publicación','Publicar','text11','mediaBack','mediaAudio','MediaMultimedia','MediaArchivo','MediaMapa','MediaLive','MediaEvento','MediaExp','MediaEmbbed','MediaBody','favicon/logo02.png','Con Almaginet Org es más Facil organizar las presentaciones de tus Proyectos en Internet. Crea un perfil hoy y comienza a publicar ahora mismo','#6d238d','#6d238d','rgba(0,0,0,0.5)','black','','','','config/logo02.png','','','','config/back00.jpg','','','','','','','','','2018-11-06 05:14:50.617236','2018-11-24 06:02:42.399413','qlturasur',NULL,NULL);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `PageSection_id` int(11),
  PRIMARY KEY (`id`),
  KEY `blog_page_2dbcba41` (`slug`),
  KEY `blog_page_f24c1f1f` (`PageSection_id`),
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `section_id` int(11),
  `tag_id` int(11),
  PRIMARY KEY (`id`),
  KEY `blog_profile_category_id_37aae45e3fa67f14_fk_blog_category_id` (`category_id`),
  KEY `blog_profi_language_id_168afd30183aa542_fk_geography_language_id` (`language_id`),
  KEY `blog_profile_2dbcba41` (`slug`),
  KEY `blog_profile_730f6511` (`section_id`),
  KEY `blog_profile_76f094bc` (`tag_id`),
  CONSTRAINT `blog_profi_language_id_168afd30183aa542_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_profile_category_id_37aae45e3fa67f14_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`),
  CONSTRAINT `blog_profile_section_id_2bad5c247c81281e_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`),
  CONSTRAINT `blog_profile_tag_id_54ffe9397fc481f5_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_profile`
--

LOCK TABLES `blog_profile` WRITE;
/*!40000 ALTER TABLE `blog_profile` DISABLE KEYS */;
INSERT INTO `blog_profile` VALUES (1,'Bogotá','','','','','2018-11-06 05:29:51.018263','2018-11-24 05:21:05.628969','personas',NULL,NULL,NULL,NULL),(2,'Quito','','','','','2018-11-06 05:29:57.860881','2018-11-24 05:20:55.510767','empresas',NULL,NULL,NULL,NULL),(3,'Lima','','','','','2018-11-24 04:46:26.037551','2018-11-24 04:46:26.063234','lima',NULL,NULL,NULL,NULL);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_secti_language_id_1c474817e33ba3a0_fk_geography_language_id` (`language_id`),
  KEY `blog_section_2dbcba41` (`slug`),
  CONSTRAINT `blog_secti_language_id_1c474817e33ba3a0_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_section`
--

LOCK TABLES `blog_section` WRITE;
/*!40000 ALTER TABLE `blog_section` DISABLE KEYS */;
INSERT INTO `blog_section` VALUES (1,'#Música','El lugar donde la Escena Musical cobra vida','#333','','','2018-11-06 05:31:05.668706','2018-11-06 05:32:23.103281','musica',NULL),(2,'#Yoga','El Lugar para conectar Cuerpo y Mente','blue','','','2018-11-06 05:31:39.130635','2018-11-06 05:32:43.626027','yoga',NULL),(3,'#ConcienciaAnimal','','#333','','','2018-11-06 05:31:53.511815','2018-11-06 05:31:53.523067','concienciaanimal',NULL),(4,'Negocios','','#333','','','2018-11-24 04:49:39.269023','2018-11-24 04:49:39.274917','negocios',NULL);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `blog_tag_language_id_7b52c23b9242e73b_fk_geography_language_id` (`language_id`),
  KEY `blog_tag_section_id_5aaa20c8004d93db_fk_blog_section_id` (`section_id`),
  KEY `blog_tag_2dbcba41` (`slug`),
  CONSTRAINT `blog_tag_language_id_7b52c23b9242e73b_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_tag_section_id_5aaa20c8004d93db_fk_blog_section_id` FOREIGN KEY (`section_id`) REFERENCES `blog_section` (`id`)
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `language_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_trend_language_id_5b58bf579eecb982_fk_geography_language_id` (`language_id`),
  KEY `blog_trend_tag_id_334d247c7459a087_fk_blog_tag_id` (`tag_id`),
  KEY `blog_trend_2dbcba41` (`slug`),
  CONSTRAINT `blog_trend_language_id_5b58bf579eecb982_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`),
  CONSTRAINT `blog_trend_tag_id_334d247c7459a087_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
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
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-11-06 05:14:50.655024','1','qlturasur',1,'',13,1),(2,'2018-11-06 05:17:27.297350','1','qlturasur',2,'Modificado/a logo.',13,1),(3,'2018-11-06 05:18:20.821493','1','QlturaSur',2,'Modificado/a webName, description, color, color02 y color03.',13,1),(4,'2018-11-06 05:19:36.043961','1','QlturaSur',2,'Modificado/a description, color02, color03 y color04.',13,1),(5,'2018-11-06 05:21:05.647378','1','QlturaSur',2,'Modificado/a color03 y color04.',13,1),(6,'2018-11-06 05:22:10.133343','1','QlturaSur',2,'Modificado/a webSlogan, text01 y text03.',13,1),(7,'2018-11-06 05:25:28.372828','1','QlturaSur',2,'Modificado/a text02, text04, text05, text06, text07, text08, text09, text10, text11, dino01, dino02, dino03, dino04, dino05, dino06, dino07, dino08, dino09 y dino00.',13,1),(8,'2018-11-06 05:26:10.077901','1','QlturaSur',2,'Modificado/a text06.',13,1),(9,'2018-11-06 05:27:44.777702','1','QlturaSur',2,'Modificado/a color02.',13,1),(10,'2018-11-06 05:29:51.044756','1','Personas',1,'',18,1),(11,'2018-11-06 05:29:57.876646','2','Empresas',1,'',18,1),(12,'2018-11-06 05:31:05.691192','1','Música',1,'',15,1),(13,'2018-11-06 05:31:39.151436','2','Yoga',1,'',15,1),(14,'2018-11-06 05:31:53.528533','3','#ConcienciaAnimal',1,'',15,1),(15,'2018-11-06 05:32:23.110744','1','#Música',2,'Modificado/a name y body.',15,1),(16,'2018-11-06 05:32:43.633345','2','#Yoga',2,'Modificado/a name y body.',15,1),(17,'2018-11-23 23:04:36.771780','1','almaginet.com',2,'Modificado/a photo.',11,1),(18,'2018-11-23 23:06:49.320080','1','almaginet',2,'Modificado/a user y name.',11,1),(19,'2018-11-23 23:38:35.219783','1','Almaginet',2,'Modificado/a webName, webUrl, text01, text09, text10, description, color02, color03 y color04.',13,1),(20,'2018-11-23 23:40:13.951017','1','Almaginet',2,'Modificado/a color03 y color04.',13,1),(21,'2018-11-23 23:41:28.140539','1','Almaginet',2,'Modificado/a logo y background.',13,1),(22,'2018-11-23 23:41:55.161233','1','Almaginet',2,'Modificado/a color.',13,1),(23,'2018-11-23 23:43:52.688198','1','Almaginet',2,'Modificado/a color.',13,1),(24,'2018-11-23 23:46:33.706980','1','Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva\"',2,'Modificado/a owner.',19,1),(25,'2018-11-23 23:47:23.790474','1','Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva\"',2,'Modificado/a background.',19,1),(26,'2018-11-23 23:50:53.625180','1','Almaginet',2,'Modificado/a color y color02.',13,1),(27,'2018-11-23 23:52:22.953256','1','Almaginet',2,'Modificado/a favicon y background.',13,1),(28,'2018-11-23 23:57:35.341059','1','Como encontrar restaurantes veganos en el cercado de Lima. \"La guia definitiva\"',2,'Modificado/a start y finish.',19,1),(29,'2018-11-24 00:03:46.483579','1','Almaginet',2,'Modificado/a description.',13,1),(30,'2018-11-24 00:06:07.622735','1','Almaginet',2,'Modificado/a text01.',13,1),(31,'2018-11-24 03:49:03.714022','1','genero1',1,'',9,1),(32,'2018-11-24 03:52:26.092960','1','sur america',1,'',24,1),(33,'2018-11-24 03:52:35.042533','1','español',1,'',22,1),(34,'2018-11-24 03:52:43.297425','1','soles',1,'',23,1),(35,'2018-11-24 03:52:45.772211','1','peru',1,'',25,1),(36,'2018-11-24 03:52:47.926810','1','norte',1,'',26,1),(37,'2018-11-24 03:52:50.145386','1','provincia de lima',1,'',27,1),(38,'2018-11-24 03:52:53.047986','1','lima',1,'',28,1),(39,'2018-11-24 03:52:55.727248','1','sjm',1,'',29,1),(40,'2018-11-24 03:53:16.821632','1','calle ajam',1,'',30,1),(41,'2018-11-24 03:53:21.205673','1','locacion almaginet',1,'',31,1),(42,'2018-11-24 03:53:42.069030','1','24d10d1a-48f8-4af8-913a-2f9dcd0d6481',1,'',32,1),(43,'2018-11-24 03:54:15.662925','1','almaginet',2,'Modificado/a slogan, body, born, genre, telefono01, telefono02, background, youtube, mapa, live, multimedia, archive y address.',11,1),(44,'2018-11-24 04:15:34.303082','1','almaginet',2,'Modificado/a color01, color02, color03, color04 y color05.',11,1),(45,'2018-11-24 04:28:58.818738','1','almaginet',2,'Modificado/a color01.',11,1),(46,'2018-11-24 04:30:33.727802','1','almaginet',2,'Modificado/a color02.',11,1),(47,'2018-11-24 04:32:28.580333','1','almaginet',2,'Modificado/a color03.',11,1),(48,'2018-11-24 04:44:43.953598','3','Osorio',1,'',4,1),(49,'2018-11-24 04:46:26.068691','3','Lima',1,'',18,1),(50,'2018-11-24 04:46:29.627669','2','Osorio',1,'',11,1),(51,'2018-11-24 04:49:39.278457','4','Negocios',1,'',15,1),(52,'2018-11-24 04:49:48.318913','2','Páginas web en Lima',1,'',19,1),(53,'2018-11-24 04:55:51.947112','4','YogaInbound',1,'',4,1),(54,'2018-11-24 04:57:38.328745','3','YogaInbound',1,'',11,1),(55,'2018-11-24 04:58:51.856625','3','Mantra meditación',1,'',19,1),(56,'2018-11-24 05:08:53.815946','1','Almaginet',2,'Modificado/a webSlogan y description.',13,1),(57,'2018-11-24 05:10:44.623610','1','Almaginet ORG',2,'Modificado/a webName y description.',13,1),(58,'2018-11-24 05:11:33.010902','1','Almaginet Org',2,'Modificado/a webName y description.',13,1),(59,'2018-11-24 05:14:16.016469','1','Almaginet Org',2,'Modificado/a text06.',13,1),(60,'2018-11-24 05:20:55.520952','2','Quito',2,'Modificado/a name.',18,1),(61,'2018-11-24 05:21:05.638704','1','Bogotá',2,'Modificado/a name.',18,1),(62,'2018-11-24 05:21:33.338781','4','Caracas',1,'',18,1),(63,'2018-11-24 05:21:43.330650','5','La Paz',1,'',18,1),(64,'2018-11-24 05:34:57.860155','4','Caracas',3,'',18,1),(65,'2018-11-24 05:34:57.958895','5','La Paz',3,'',18,1),(66,'2018-11-24 05:44:14.269204','5','LoveQuito',1,'',4,1),(67,'2018-11-24 05:45:09.503203','4','LoveQuito',1,'',11,1),(68,'2018-11-24 05:53:44.266985','4','sobre quito',1,'',19,1),(69,'2018-11-24 06:02:04.614048','1','Almaginet Org',2,'Modificado/a text01.',13,1),(70,'2018-11-24 06:02:42.436907','1','Almaginet Org',2,'Modificado/a text01.',13,1);
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
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'accounts','genre'),(8,'accounts','membership'),(10,'accounts','red'),(7,'accounts','subscription'),(12,'accounts','userconfig'),(11,'accounts','userprofile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(19,'blog','article'),(14,'blog','category'),(13,'blog','config'),(21,'blog','page'),(20,'blog','pagesection'),(18,'blog','profile'),(15,'blog','section'),(16,'blog','tag'),(17,'blog','trend'),(5,'contenttypes','contenttype'),(32,'geography','address'),(28,'geography','city'),(30,'geography','community'),(24,'geography','continent'),(25,'geography','country'),(23,'geography','currency'),(22,'geography','language'),(31,'geography','location'),(26,'geography','region'),(27,'geography','state'),(29,'geography','zone'),(34,'medias','media'),(33,'medias','mediacategory'),(6,'sessions','session');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'geography','0001_initial','2018-11-06 02:41:31.441966'),(2,'contenttypes','0001_initial','2018-11-06 02:41:32.377360'),(3,'auth','0001_initial','2018-11-06 02:41:43.462284'),(4,'blog','0001_initial','2018-11-06 02:43:22.623337'),(5,'accounts','0001_initial','2018-11-06 02:44:02.375005'),(6,'admin','0001_initial','2018-11-06 02:44:08.179838'),(7,'contenttypes','0002_remove_content_type_name','2018-11-06 02:44:12.281654'),(8,'auth','0002_alter_permission_name_max_length','2018-11-06 02:44:14.527031'),(9,'auth','0003_alter_user_email_max_length','2018-11-06 02:44:16.424940'),(10,'auth','0004_alter_user_username_opts','2018-11-06 02:44:17.099987'),(11,'auth','0005_alter_user_last_login_null','2018-11-06 02:44:18.495456'),(12,'auth','0006_require_contenttypes_0002','2018-11-06 02:44:18.594061'),(13,'medias','0001_initial','2018-11-06 02:44:42.104734'),(14,'sessions','0001_initial','2018-11-06 02:44:43.505973'),(15,'accounts','0002_auto_20181124_0414','2018-11-24 04:14:45.573807');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('wy1g9l7p35icq9kr1ewrssm9zjeufzyy','ODcwNmE1MGU1NTIyNzM5NTBlMDI3ZWJkMWU3ZDY3ZDhmOWQyNWEwMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjdjYTE5MDBiMWNmNWQ0MjRkZmI0MGU2YTI2ZjU5NmY2ZTNiODFiZTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=','2018-11-20 05:34:11.682995');
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `location_id` int(11),
  PRIMARY KEY (`id`),
  KEY `geography_address_2dbcba41` (`slug`),
  KEY `geography_address_e274a5da` (`location_id`),
  CONSTRAINT `geography__location_id_2d2730dd3beb7d77_fk_geography_location_id` FOREIGN KEY (`location_id`) REFERENCES `geography_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_address`
--

LOCK TABLES `geography_address` WRITE;
/*!40000 ALTER TABLE `geography_address` DISABLE KEYS */;
INSERT INTO `geography_address` VALUES (1,'24d10d1a48f84af8913a2f9dcd0d6481','24d10d1a-48f8-4af8-913a-2f9dcd0d6481','calle ajam numero ajam','mapa de googles','-20','+222','2018-11-24 03:53:42.024755','2018-11-24 03:53:42.058572',1);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `state_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_city_2dbcba41` (`slug`),
  KEY `geography_city_d5582625` (`state_id`),
  CONSTRAINT `geography_city_state_id_6b96de3550e8b1de_fk_geography_state_id` FOREIGN KEY (`state_id`) REFERENCES `geography_state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_city`
--

LOCK TABLES `geography_city` WRITE;
/*!40000 ALTER TABLE `geography_city` DISABLE KEYS */;
INSERT INTO `geography_city` VALUES (1,'lima','','lima','2018-11-24 03:52:53.014771','2018-11-24 03:52:53.033871',1);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `zone_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_community_2dbcba41` (`slug`),
  KEY `geography_community_06342dd7` (`zone_id`),
  CONSTRAINT `geography_communit_zone_id_58b456c9d96ce91f_fk_geography_zone_id` FOREIGN KEY (`zone_id`) REFERENCES `geography_zone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_community`
--

LOCK TABLES `geography_community` WRITE;
/*!40000 ALTER TABLE `geography_community` DISABLE KEYS */;
INSERT INTO `geography_community` VALUES (1,'calle ajam','','calle-ajam','2018-11-24 03:53:16.790409','2018-11-24 03:53:16.810452',1);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_continent_2dbcba41` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_continent`
--

LOCK TABLES `geography_continent` WRITE;
/*!40000 ALTER TABLE `geography_continent` DISABLE KEYS */;
INSERT INTO `geography_continent` VALUES (1,'sur america','','sur-america','2018-11-24 03:52:26.079646','2018-11-24 03:52:26.089916');
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `continent_id` int(11) DEFAULT NULL,
  `currency_id` int(11),
  `language_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geograph_continent_id_3d30103f5ac9167f_fk_geography_continent_id` (`continent_id`),
  KEY `geography_country_2dbcba41` (`slug`),
  KEY `geography_country_2c7d5721` (`currency_id`),
  KEY `geography_country_468679bd` (`language_id`),
  CONSTRAINT `geograph_continent_id_3d30103f5ac9167f_fk_geography_continent_id` FOREIGN KEY (`continent_id`) REFERENCES `geography_continent` (`id`),
  CONSTRAINT `geography__currency_id_4c8d156909776d09_fk_geography_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `geography_currency` (`id`),
  CONSTRAINT `geography__language_id_5f889ff709aa3468_fk_geography_language_id` FOREIGN KEY (`language_id`) REFERENCES `geography_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_country`
--

LOCK TABLES `geography_country` WRITE;
/*!40000 ALTER TABLE `geography_country` DISABLE KEYS */;
INSERT INTO `geography_country` VALUES (1,'peru','','peru','2018-11-24 03:52:45.676586','2018-11-24 03:52:45.736718',1,1,1);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_currency_2dbcba41` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_currency`
--

LOCK TABLES `geography_currency` WRITE;
/*!40000 ALTER TABLE `geography_currency` DISABLE KEYS */;
INSERT INTO `geography_currency` VALUES (1,'soles','','2018-11-24 03:52:43.285387','2018-11-24 03:52:43.294394','soles');
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_language_2dbcba41` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_language`
--

LOCK TABLES `geography_language` WRITE;
/*!40000 ALTER TABLE `geography_language` DISABLE KEYS */;
INSERT INTO `geography_language` VALUES (1,'español','','','2018-11-24 03:52:34.964033','2018-11-24 03:52:35.038968','espanol');
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geograph_community_id_70869e2251b935b2_fk_geography_community_id` (`community_id`),
  KEY `geography_location_2dbcba41` (`slug`),
  CONSTRAINT `geograph_community_id_70869e2251b935b2_fk_geography_community_id` FOREIGN KEY (`community_id`) REFERENCES `geography_community` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_location`
--

LOCK TABLES `geography_location` WRITE;
/*!40000 ALTER TABLE `geography_location` DISABLE KEYS */;
INSERT INTO `geography_location` VALUES (1,'locacion almaginet','','locacion-almaginet','2018-11-24 03:53:21.155017','2018-11-24 03:53:21.174317',1);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_re_country_id_40f423ccd049364a_fk_geography_country_id` (`country_id`),
  KEY `geography_region_2dbcba41` (`slug`),
  CONSTRAINT `geography_re_country_id_40f423ccd049364a_fk_geography_country_id` FOREIGN KEY (`country_id`) REFERENCES `geography_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_region`
--

LOCK TABLES `geography_region` WRITE;
/*!40000 ALTER TABLE `geography_region` DISABLE KEYS */;
INSERT INTO `geography_region` VALUES (1,'norte','','norte','2018-11-24 03:52:47.835572','2018-11-24 03:52:47.909738',1);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_stat_region_id_18a02cffb06a10ad_fk_geography_region_id` (`region_id`),
  KEY `geography_state_2dbcba41` (`slug`),
  CONSTRAINT `geography_stat_region_id_18a02cffb06a10ad_fk_geography_region_id` FOREIGN KEY (`region_id`) REFERENCES `geography_region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_state`
--

LOCK TABLES `geography_state` WRITE;
/*!40000 ALTER TABLE `geography_state` DISABLE KEYS */;
INSERT INTO `geography_state` VALUES (1,'provincia de lima','','provincia-de-lima','2018-11-24 03:52:50.064272','2018-11-24 03:52:50.107922',1);
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `geography_zone_city_id_205767e05c420f96_fk_geography_city_id` (`city_id`),
  KEY `geography_zone_2dbcba41` (`slug`),
  CONSTRAINT `geography_zone_city_id_205767e05c420f96_fk_geography_city_id` FOREIGN KEY (`city_id`) REFERENCES `geography_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geography_zone`
--

LOCK TABLES `geography_zone` WRITE;
/*!40000 ALTER TABLE `geography_zone` DISABLE KEYS */;
INSERT INTO `geography_zone` VALUES (1,'sjm','','sjm','2018-11-24 03:52:55.695695','2018-11-24 03:52:55.717750',1);
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
  `start` datetime(6) DEFAULT NULL,
  `finish` datetime(6) DEFAULT NULL,
  `slug` varchar(50) NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `mediaCategory_id` int(11),
  `profile_id` int(11),
  `red_id` int(11),
  `tagArticle_id` int(11),
  `tagProfile_id` int(11),
  PRIMARY KEY (`id`),
  KEY `medias_media_address_id_ac4841124b87883_fk_geography_address_id` (`address_id`),
  KEY `medias_media_article_id_1f56991b7bc89d9_fk_blog_article_id` (`article_id`),
  KEY `medias_media_2dbcba41` (`slug`),
  KEY `medias_media_1c876244` (`mediaCategory_id`),
  KEY `medias_media_83a0eb3f` (`profile_id`),
  KEY `medias_media_223bf4cf` (`red_id`),
  KEY `medias_media_0ec0c337` (`tagArticle_id`),
  KEY `medias_media_ec34f82e` (`tagProfile_id`),
  CONSTRAINT `med_mediaCategory_id_3397c068dae9f0a1_fk_medias_mediacategory_id` FOREIGN KEY (`mediaCategory_id`) REFERENCES `medias_mediacategory` (`id`),
  CONSTRAINT `medias_me_profile_id_3585148dc4ca66c8_fk_accounts_userprofile_id` FOREIGN KEY (`profile_id`) REFERENCES `accounts_userprofile` (`id`),
  CONSTRAINT `medias_media_address_id_ac4841124b87883_fk_geography_address_id` FOREIGN KEY (`address_id`) REFERENCES `geography_address` (`id`),
  CONSTRAINT `medias_media_article_id_1f56991b7bc89d9_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `medias_media_red_id_438ef5de10fde7d6_fk_accounts_red_id` FOREIGN KEY (`red_id`) REFERENCES `accounts_red` (`id`),
  CONSTRAINT `medias_media_tagArticle_id_1a46f71515709058_fk_blog_article_id` FOREIGN KEY (`tagArticle_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `medias_tagProfile_id_4225f1f34dcf8467_fk_accounts_userprofile_id` FOREIGN KEY (`tagProfile_id`) REFERENCES `accounts_userprofile` (`id`)
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
  `create_at` datetime(6) NOT NULL,
  `update_at` datetime(6) NOT NULL,
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

-- Dump completed on 2018-11-27 19:33:23
