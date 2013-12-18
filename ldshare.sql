/*
Navicat MySQL Data Transfer

Source Server         : 5.5
Source Server Version : 50533
Source Host           : localhost:3306
Source Database       : ldshare

Target Server Type    : MYSQL
Target Server Version : 50533
File Encoding         : 65001

Date: 2013-12-18 19:45:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jh_admins`
-- ----------------------------
DROP TABLE IF EXISTS `jh_admins`;
CREATE TABLE `jh_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `salt` char(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name_UNIQUE` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jh_admins
-- ----------------------------

-- ----------------------------
-- Table structure for `jh_documents`
-- ----------------------------
DROP TABLE IF EXISTS `jh_documents`;
CREATE TABLE `jh_documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `publised` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jh_documents
-- ----------------------------

-- ----------------------------
-- Table structure for `jh_doc_attach`
-- ----------------------------
DROP TABLE IF EXISTS `jh_doc_attach`;
CREATE TABLE `jh_doc_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jh_doc_attach
-- ----------------------------

-- ----------------------------
-- Table structure for `jh_type`
-- ----------------------------
DROP TABLE IF EXISTS `jh_type`;
CREATE TABLE `jh_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jh_type
-- ----------------------------
