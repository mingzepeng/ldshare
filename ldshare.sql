-- MySQL dump 10.13  Distrib 5.1.63, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: ldshare
-- ------------------------------------------------------
-- Server version	5.1.63-0ubuntu0.10.04.1-log

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
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
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_doc_attach`
--

LOCK TABLES `jh_doc_attach` WRITE;
/*!40000 ALTER TABLE `jh_doc_attach` DISABLE KEYS */;
INSERT INTO `jh_doc_attach` VALUES (40,'README.md','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F21%2F1387614768README.md?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:5Jcoi79p27SFX0Xecv%2FaJX4J%2FQI%3D','2013-12-21 08:32:48',4),(41,'test.php','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F21%2F1387615160test.php?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:5oLDiadnk6%2Fn%2B0lXQkBubseK2j0%3D','2013-12-21 08:39:20',16),(42,'三体.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387707959%E4%B8%89%E4%BD%93.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:8%2BMG50EoUF02x1V9WUF6r2ZzI2k%3D','2013-12-22 10:25:59',17),(43,'白先勇：台北人.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387708531%E7%99%BD%E5%85%88%E5%8B%87%EF%BC%9A%E5%8F%B0%E5%8C%97%E4%BA%BA.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:KS7Q1s%2FWDp2SJdczsOA5qSBrdqQ%3D','2013-12-22 10:35:31',18),(44,'丑陋的中国人.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387708716%E4%B8%91%E9%99%8B%E7%9A%84%E4%B8%AD%E5%9B%BD%E4%BA%BA.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:kGoPS4A8DXZmCTlz1D7pw5%2Bx6lY%3D','2013-12-22 10:38:36',19),(45,'女人，天生是尤物.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387708770%E5%A5%B3%E4%BA%BA%EF%BC%8C%E5%A4%A9%E7%94%9F%E6%98%AF%E5%B0%A4%E7%89%A9.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:eUHK2eDv5baMkITsWJhN4e6BNow%3D','2013-12-22 10:39:30',20),(46,'安妮宝贝全集.pdf','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387708954%E5%AE%89%E5%A6%AE%E5%AE%9D%E8%B4%9D%E5%85%A8%E9%9B%86.pdf?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:EK6tHjtj1CvYtd7tptZssAHaFsg%3D','2013-12-22 10:42:34',NULL),(47,'安妮宝贝全集.pdf','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709051%E5%AE%89%E5%A6%AE%E5%AE%9D%E8%B4%9D%E5%85%A8%E9%9B%86.pdf?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:3KmxRTw7lXYWS3EhLO4FmsfOUPo%3D','2013-12-22 10:44:11',NULL),(48,'安妮宝贝全集.pdf','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709263%E5%AE%89%E5%A6%AE%E5%AE%9D%E8%B4%9D%E5%85%A8%E9%9B%86.pdf?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:KVfuOigCMEXr7X3JDiWL%2FLau7PA%3D','2013-12-22 10:47:43',NULL),(49,'我的梦.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709328%E6%88%91%E7%9A%84%E6%A2%A6.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:OLLyS%2BrKCbP%2B7A4mHVpm4ojeSTo%3D','2013-12-22 10:48:48',22),(50,'goagent.zip','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709298goagent.zip?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:IwTLvt9sc9mxKtWyqLNoHitbMLM%3D','2013-12-22 10:48:18',NULL),(51,'恶之花.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709441%E6%81%B6%E4%B9%8B%E8%8A%B1.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:sye%2Fqu9exu1UPCHF2O9yUMZb%2BJY%3D','2013-12-22 10:50:41',23),(52,'goagent.zip','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709413goagent.zip?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:YQIsTzyQB6HMONYlQCEBQodiJcg%3D','2013-12-22 10:50:13',NULL),(53,'记事.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709549%E8%AE%B0%E4%BA%8B.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:DKucZYPrDyHlGtE1Ig7e%2BhrLOFk%3D','2013-12-22 10:52:29',NULL),(54,'记事.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709551%E8%AE%B0%E4%BA%8B.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:Gmh3OsOvoZ%2B9RtFazh1z1r%2B8wI0%3D','2013-12-22 10:52:31',NULL),(55,'镜·龙战（下）.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709553%E9%95%9C%C2%B7%E9%BE%99%E6%88%98%EF%BC%88%E4%B8%8B%EF%BC%89.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:OfOrvezYVpwicBW7W7m4qZcd0OI%3D','2013-12-22 10:52:33',24),(56,'镜·龙战.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709560%E9%95%9C%C2%B7%E9%BE%99%E6%88%98.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:HsJ2SZlzuvdyuqQawBP3GLTrbjc%3D','2013-12-22 10:52:40',24),(57,'镜·破军.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709583%E9%95%9C%C2%B7%E7%A0%B4%E5%86%9B.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:vxB9PXN9M2wWkk%2FWCRWqikCy1Ac%3D','2013-12-22 10:53:03',24),(58,'镜·双城.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709595%E9%95%9C%C2%B7%E5%8F%8C%E5%9F%8E.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:x5Zy2LtjmcqoHnlNOVWw5DP3VwI%3D','2013-12-22 10:53:15',24),(59,'记事.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709613%E8%AE%B0%E4%BA%8B.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:56HmNjaDM9Tg6k%2Bkfq6KKpx6tdE%3D','2013-12-22 10:53:33',NULL),(60,'镜·双世.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709612%E9%95%9C%C2%B7%E5%8F%8C%E4%B8%96.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:pn0F7FiJUJ18s1pWgUgkBgN2jxM%3D','2013-12-22 10:53:32',24),(61,'论文模板.doc','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709651%E8%AE%BA%E6%96%87%E6%A8%A1%E6%9D%BF.doc?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:KAQaShPmJ3e3UCWbbKGGHzEQ004%3D','2013-12-22 10:54:11',NULL),(62,'草房子.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709712%E8%8D%89%E6%88%BF%E5%AD%90.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:NpU9UiWV%2FB65n1eYsrHSbx%2Biufg%3D','2013-12-22 10:55:12',25),(63,'狼与香辛料TXT.zip','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709685%E7%8B%BC%E4%B8%8E%E9%A6%99%E8%BE%9B%E6%96%99TXT.zip?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:CjasRN%2BIVIcPPn6IeB%2Ftwewhe04%3D','2013-12-22 10:54:45',NULL),(64,'生的定义.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709789%E7%94%9F%E7%9A%84%E5%AE%9A%E4%B9%89.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:1uBYsdS3mFuTEjrXmKHU7jy6iOI%3D','2013-12-22 10:56:29',26),(65,'挪威的森林.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709887%E6%8C%AA%E5%A8%81%E7%9A%84%E6%A3%AE%E6%9E%97.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:%2FVgu%2BCD58i%2B5yrtMo1bm7dvMR5U%3D','2013-12-22 10:58:07',27),(66,'狼与香辛料TXT.zip','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387709994%E7%8B%BC%E4%B8%8E%E9%A6%99%E8%BE%9B%E6%96%99TXT.zip?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:vqlxd8DbeL4wEZlWk4%2BuSz2dEck%3D','2013-12-22 10:59:54',28),(67,'且听风吟.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387710405%E4%B8%94%E5%90%AC%E9%A3%8E%E5%90%9F.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:vZh%2F1TIuWwrSzN6bEp0bsM7d8zA%3D','2013-12-22 11:06:45',29),(68,'一个陌生女子的来信.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387710567%E4%B8%80%E4%B8%AA%E9%99%8C%E7%94%9F%E5%A5%B3%E5%AD%90%E7%9A%84%E6%9D%A5%E4%BF%A1.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:hx%2FrcOV8SsaHLaSWXuWOzpoiLQs%3D','2013-12-22 11:09:27',30),(69,'情人.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387710733%E6%83%85%E4%BA%BA.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:LptLmbbcvgowAKbesSaRiwL8Mwg%3D','2013-12-22 11:12:13',31),(77,'昆仑·破城卷.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387712889%E6%98%86%E4%BB%91%C2%B7%E7%A0%B4%E5%9F%8E%E5%8D%B7.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:OL49ewCh4AsJb0pXeu%2FkRYs2Fqk%3D','2013-12-22 11:48:09',33),(75,'中国哲学史.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387712742%E4%B8%AD%E5%9B%BD%E5%93%B2%E5%AD%A6%E5%8F%B2.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:MCc6Ng211eL09nmahAZNeENU%2BQ0%3D','2013-12-22 11:45:42',32),(76,'昆仑·纯阳卷.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387712863%E6%98%86%E4%BB%91%C2%B7%E7%BA%AF%E9%98%B3%E5%8D%B7.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:5vor7VHTRkNEMIbOoNb8S%2B%2FLeCw%3D','2013-12-22 11:47:43',33),(72,'J.K. Rowling - HP 1 - Harry Potter and the Sorcerer&#039;s Stone (1).pdf','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387712335J.K.%20Rowling%20-%20HP%201%20-%20Harry%20Potter%20and%20the%20Sorcerer%26%23039%3Bs%20Stone%20%281%29.pdf?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:caeYObRoxiwTzKKo7fUX3TUh638%3D','2013-12-22 11:38:55',NULL),(73,'J.K. Rowling - HP 2 - Harry Potter and the Chamber of Secrets (1).pdf','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387712468J.K.%20Rowling%20-%20HP%202%20-%20Harry%20Potter%20and%20the%20Chamber%20of%20Secrets%20%281%29.pdf?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:qU0Du9CGKFrHLk2JEgaRhKrzy3g%3D','2013-12-22 11:41:08',NULL),(74,'J.K. Rowling - HP 3 - Harry Potter and the Prisoner of Azkaban (1).pdf','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387712565J.K.%20Rowling%20-%20HP%203%20-%20Harry%20Potter%20and%20the%20Prisoner%20of%20Azkaban%20%281%29.pdf?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:3eqQljBmJRMmcCrtCKC46gXxSaE%3D','2013-12-22 11:42:45',NULL),(81,'烈火如歌.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713025%E7%83%88%E7%81%AB%E5%A6%82%E6%AD%8C.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:ah2YIpfJ3VLoz9IQtssaJvvxqc4%3D','2013-12-22 11:50:25',34),(82,'烈火如歌II.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713047%E7%83%88%E7%81%AB%E5%A6%82%E6%AD%8CII.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:YV0%2BXGbXpgLjK26WoVY9cqfwVSM%3D','2013-12-22 11:50:47',34),(83,'理想丰满.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713089%E7%90%86%E6%83%B3%E4%B8%B0%E6%BB%A1.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:9MATBRStRhhk3NhvwQg8RKjY4Hs%3D','2013-12-22 11:51:29',35),(84,'刘冉的悲剧人生.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713158%E5%88%98%E5%86%89%E7%9A%84%E6%82%B2%E5%89%A7%E4%BA%BA%E7%94%9F.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:SRklhv0u5Wxht7JG1iV4V6oLY7I%3D','2013-12-22 11:52:38',36),(85,'谁来跟我干杯.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713211%E8%B0%81%E6%9D%A5%E8%B7%9F%E6%88%91%E5%B9%B2%E6%9D%AF.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:vhHOcH7Cp6PwyP%2FxM4fi8oO7oMQ%3D','2013-12-22 11:53:31',37),(86,'一座城池.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713260%E4%B8%80%E5%BA%A7%E5%9F%8E%E6%B1%A0.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:SsmfMv48FEubCfmaEGwwp3jQrm0%3D','2013-12-22 11:54:20',38),(87,'长安乱.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713280%E9%95%BF%E5%AE%89%E4%B9%B1.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:ssK6mVyFdrW3NJKiH03vXWs2TB0%3D','2013-12-22 11:54:40',38),(88,'毕业那天我们一起失恋.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713346%E6%AF%95%E4%B8%9A%E9%82%A3%E5%A4%A9%E6%88%91%E4%BB%AC%E4%B8%80%E8%B5%B7%E5%A4%B1%E6%81%8B.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:NlhM6x5bIF3kJ6QHu5%2BGuwwUEEI%3D','2013-12-22 11:55:46',39),(89,'北回归线.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713396%E5%8C%97%E5%9B%9E%E5%BD%92%E7%BA%BF.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:1b6G0aHq2x1sJ9rMPaz%2F9DDUZHI%3D','2013-12-22 11:56:36',40),(90,'牛棚杂忆.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713491%E7%89%9B%E6%A3%9A%E6%9D%82%E5%BF%86.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:7yzh%2BDKxaBKqZGnRyZhTJ2V8%2FCg%3D','2013-12-22 11:58:11',41),(91,'此间的少年.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713551%E6%AD%A4%E9%97%B4%E7%9A%84%E5%B0%91%E5%B9%B4.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:sp5TuLhLQE0%2BWhd0etDRPbEIzB0%3D','2013-12-22 11:59:11',NULL),(92,'此间的少年.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713610%E6%AD%A4%E9%97%B4%E7%9A%84%E5%B0%91%E5%B9%B4.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:PwwsfUsS6upBjYXkSNxlgTQNAU4%3D','2013-12-22 12:00:10',NULL),(93,'[常识]梁文道.txt','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387713661%5B%E5%B8%B8%E8%AF%86%5D%E6%A2%81%E6%96%87%E9%81%93.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:L2UtwX9fS5GSFjPQf0AgXn%2Bcygk%3D','2013-12-22 12:01:01',42),(94,'201309110946239.doc','http://bcs.duapp.com/dxshare/%2F2013%2F12%2F22%2F1387714084201309110946239.doc?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:z3RoQXoqjMHdYlDEoIZkrLVFvPk%3D','2013-12-22 12:08:04',NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_doc_type`
--

LOCK TABLES `jh_doc_type` WRITE;
/*!40000 ALTER TABLE `jh_doc_type` DISABLE KEYS */;
INSERT INTO `jh_doc_type` VALUES (1,'课程'),(3,'大师'),(4,'诗歌'),(5,'网文');
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
  `author` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jh_documents`
--

LOCK TABLES `jh_documents` WRITE;
/*!40000 ALTER TABLE `jh_documents` DISABLE KEYS */;
INSERT INTO `jh_documents` VALUES (17,'三体——刘慈欣',NULL,'给岁月以文明，而不是给文明以岁月。','2013-12-22 10:28:07','2013-12-22 10:41:13',NULL,3,1),(18,'台北人——白先勇',NULL,'我写作是为了表达人类内心无言的忧伤。','2013-12-22 10:37:15','2013-12-22 10:41:24',NULL,3,1),(19,'丑陋的中国人——柏杨',NULL,'我们的丑陋，来自我们不知道自己丑陋。','2013-12-22 10:39:02','2013-12-22 10:41:33',NULL,3,1),(20,'女人，天生是尤物——柏杨',NULL,'原来男人眼里的每个女人都这么有意思。','2013-12-22 10:40:54','2013-12-22 10:41:41',NULL,3,1),(24,'镜——沧月','','地之所载，六合之间，四海之内，有仙洲名云荒。','2013-12-22 10:54:19','2013-12-22 11:33:01',NULL,5,1),(25,'草房子——曹文轩',NULL,'那里的每一粒沙尘，每一个场景，每一个人物都是可以进入到文学世界去的。','2013-12-22 10:55:55','2013-12-22 10:56:09',NULL,3,1),(22,'我的梦——奥巴马',NULL,'你的每一位祖先都在天上保佑着你。','2013-12-22 10:43:10','2013-12-22 10:50:05',NULL,3,1),(23,'恶之花——波德莱尔',NULL,' 恶之为花，其色艳而冷，其香浓而远，其态俏而诡，其格高而幽。','2013-12-22 10:51:33','2013-12-22 10:52:17',NULL,4,1),(26,'生的定义——大江三建郎',NULL,'人生的悖谬、无可逃脱的责任、人的尊严','2013-12-22 10:57:41','2013-12-22 10:57:41',NULL,3,1),(27,'挪威的森林——村上春树',NULL,'这是一部动人心弦的、平缓舒雅的、略带感伤的恋爱小说。','2013-12-22 11:00:09','2013-12-22 11:00:09',NULL,3,1),(28,'狼与香辛料（1～7卷）','','萌狼与旅行商人的冒险故事','2013-12-22 11:01:20','2013-12-22 11:34:37',NULL,5,1),(29,'且听风吟——村上春树',NULL,'村上成名作','2013-12-22 11:07:01','2013-12-22 11:07:09',NULL,3,1),(30,'一个陌生女人的来信——茨威格','茨威格','日記是寫給別人的信，信是寫給自己的日記','2013-12-22 11:10:24','2013-12-22 11:22:23',NULL,3,1),(31,'情人——杜拉斯','','应该原谅什么? 必须原谅什么? 原谅爱的不够 永远不够','2013-12-22 11:22:05','2013-12-22 11:32:51',NULL,3,1),(32,'中国哲学史——冯友兰','冯友兰','今欲求一中国哲学史，能骄傅会之恶习，而具了解之同情者，则冯君此作庶几近之','2013-12-22 11:46:30','2013-12-22 11:47:09',NULL,3,1),(33,'昆仑——凤歌','凤歌','负登天之志，乏兰台之才，虽信天道酬勤，惜乎知易行难，聊以自解而已。','2013-12-22 11:49:54','2013-12-22 11:49:54',NULL,5,1),(34,'烈火如歌——明晓溪','明晓溪','“即使你变成了仙人，也无法左右天命。” “但是我可以保护她。从她一出生，就保护她！”','2013-12-22 11:51:15','2013-12-22 11:51:15',NULL,5,1),(35,'理想丰满——冯仑','冯仑','有钱人是怎么有钱的','2013-12-22 11:52:04','2013-12-22 11:52:04',NULL,1,1),(36,'刘冉的悲剧人生','封号政策','你都知道是个悲剧了','2013-12-22 11:53:03','2013-12-22 11:53:03',NULL,5,1),(37,'谁来跟我干杯——古龙','古龙','牡丹花下死，做鬼也风流','2013-12-22 11:53:55','2013-12-22 11:53:55',NULL,3,1),(38,'韩寒作品','韩寒','以至于一路上我们都在调侃它，最终，却被它调侃了。 ','2013-12-22 11:55:17','2013-12-22 11:55:17',NULL,3,1),(39,'毕业那天我们一起失恋','何员外','恋爱是大学必修课。','2013-12-22 11:56:09','2013-12-22 11:56:09',NULL,5,1),(40,'北回归线——亨利·米勒','亨利·米勒','大概是一个人可以从中求得快感的惟一一本书。即使不能赛过乔伊斯的《尤利西斯》，至少也比弱智的女性伍尔芙写的那种只有二分之一才气的黏糊作品更加是永久性文学的一竞争。','2013-12-22 11:57:16','2013-12-22 11:57:26',NULL,3,1),(41,'牛棚杂记——季羡林','季羡林','不如给岁月以文明，祭奠那段逝去的时光。','2013-12-22 11:58:38','2013-12-22 11:58:38',NULL,3,1),(42,'常识——梁文道','梁文道','这是常识，你不知道吗？','2013-12-22 12:01:43','2013-12-22 12:01:43',NULL,3,1);
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

-- Dump completed on 2014-01-05 12:56:34
