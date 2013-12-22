-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ldshare
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

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
-- Table structure for table `jh_admins`
--

DROP TABLE IF EXISTS `jh_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `salt` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name_UNIQUE` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_admins`
--

LOCK TABLES `jh_admins` WRITE;
/*!40000 ALTER TABLE `jh_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `jh_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_doc_attach`
--

DROP TABLE IF EXISTS `jh_doc_attach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_doc_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_doc_attach`
--

LOCK TABLES `jh_doc_attach` WRITE;
/*!40000 ALTER TABLE `jh_doc_attach` DISABLE KEYS */;
INSERT INTO `jh_doc_attach` VALUES (40,'README.md','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F21%2F1387614768README.md?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:5Jcoi79p27SFX0Xecv%2FaJX4J%2FQI%3D','2013-12-21 08:32:48',4),(41,'test.php','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F21%2F1387615160test.php?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:5oLDiadnk6%2Fn%2B0lXQkBubseK2j0%3D','2013-12-21 08:39:20',16);
/*!40000 ALTER TABLE `jh_doc_attach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_doc_type`
--

DROP TABLE IF EXISTS `jh_doc_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_doc_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_doc_type`
--

LOCK TABLES `jh_doc_type` WRITE;
/*!40000 ALTER TABLE `jh_doc_type` DISABLE KEYS */;
INSERT INTO `jh_doc_type` VALUES (1,'文学'),(3,'小说');
/*!40000 ALTER TABLE `jh_doc_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jh_documents`
--

DROP TABLE IF EXISTS `jh_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jh_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_documents`
--

LOCK TABLES `jh_documents` WRITE;
/*!40000 ALTER TABLE `jh_documents` DISABLE KEYS */;
INSERT INTO `jh_documents` VALUES (4,'中文的','http://example.com/iphone/images/test.png ','2013-12-20 11:34:09','2013-12-21 08:39:14',NULL,3,1),(5,'豆腐干豆腐干',NULL,NULL,NULL,NULL,1,1),(8,'大三大四',NULL,'2013-12-20 08:33:03','2013-12-20 08:33:03',NULL,1,1),(16,'文艺的书','是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发士大夫是打发','2013-12-21 07:16:42','2013-12-22 06:24:09',NULL,3,0);
/*!40000 ALTER TABLE `jh_documents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-22 16:29:55
