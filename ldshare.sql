/*
Navicat MySQL Data Transfer

Source Server         : 5.5
Source Server Version : 50533
Source Host           : localhost:3306
Source Database       : ldshare

Target Server Type    : MYSQL
Target Server Version : 50533
File Encoding         : 65001

Date: 2013-12-21 13:35:34
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
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jh_documents
-- ----------------------------
INSERT INTO `jh_documents` VALUES ('4', '中文的', 'http://example.com/iphone/images/test.png ', '2013-12-20 19:34:09', '2013-12-20 19:34:09', null, '3', '1');
INSERT INTO `jh_documents` VALUES ('5', '豆腐干豆腐干', null, null, null, null, '1', '1');
INSERT INTO `jh_documents` VALUES ('8', '大三大四', null, '2013-12-20 16:33:03', '2013-12-20 16:33:03', null, '1', '1');
INSERT INTO `jh_documents` VALUES ('13', '测试文件上传', null, '2013-12-20 21:37:54', '2013-12-20 21:37:54', null, '3', '1');

-- ----------------------------
-- Table structure for `jh_doc_attach`
-- ----------------------------
DROP TABLE IF EXISTS `jh_doc_attach`;
CREATE TABLE `jh_doc_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `document_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jh_doc_attach
-- ----------------------------
INSERT INTO `jh_doc_attach` VALUES ('1', '使用说明.txt', 'http://bcs.duapp.com/dxshare/%2F1387545681%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:xaqtZ79cyMM2GlQux32TZMaQEBA%3D', '2013-12-20 21:21:21', null);
INSERT INTO `jh_doc_attach` VALUES ('2', '使用说明.txt', 'http://bcs.duapp.com/dxshare/%2F1387545782%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:rNrNA1k5CrUU2qUJyJAKOFvwzGI%3D', '2013-12-20 21:23:02', null);
INSERT INTO `jh_doc_attach` VALUES ('3', '使用说明.txt', 'http://bcs.duapp.com/dxshare/%2F1387545833%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:vYZlwga%2FU2GycnQ5Mmr1ZYP%2FOa0%3D', '2013-12-20 21:23:53', null);
INSERT INTO `jh_doc_attach` VALUES ('4', '使用说明.txt', 'http://bcs.duapp.com/dxshare/%2F1387545865%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:tBH1j4xZvPVPXxySy4bWQ%2BdWPmo%3D', '2013-12-20 21:24:25', null);
INSERT INTO `jh_doc_attach` VALUES ('5', '使用说明.txt', 'http://bcs.duapp.com/dxshare/%2F1387545915%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:wsyx7LcfuymoZyysPxmSm2gw%2FLo%3D', '2013-12-20 21:25:15', null);
INSERT INTO `jh_doc_attach` VALUES ('6', 'ZJUT-书柜.doc', 'http://bcs.duapp.com/dxshare/%2F1387546076ZJUT-%E4%B9%A6%E6%9F%9C.doc?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:B4FDmobw4lqRto7fcFxs8aBoq%2Bk%3D', '2013-12-20 21:27:56', null);
INSERT INTO `jh_doc_attach` VALUES ('7', '使用说明.txt', 'http://bcs.duapp.com/dxshare/%2F1387546133%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:O8O6pLJ9rrPJg5uCGY6IkXkzuOE%3D', '2013-12-20 21:28:53', null);
INSERT INTO `jh_doc_attach` VALUES ('8', '使用说明.txt', 'http://bcs.duapp.com/dxshare/%2F1387546240%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:4T3iuT4%2BUfWd8n93coI%2BAO3pZAI%3D', '2013-12-20 21:30:40', null);
INSERT INTO `jh_doc_attach` VALUES ('9', '使用说明.txt', 'http://bcs.duapp.com/dxshare/%2F1387546612%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:WSQPivWAMPwJaJP3t0w%2BUpxPgqk%3D', '2013-12-20 21:36:52', null);
INSERT INTO `jh_doc_attach` VALUES ('10', '使用说明.txt', 'http://bcs.duapp.com/dxshare/%2F1387546621%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:rlTsSTZ9SvHFHD3T0K2qxmyywYU%3D', '2013-12-20 21:37:01', '13');
INSERT INTO `jh_doc_attach` VALUES ('11', 'install.txt', 'http://bcs.duapp.com/dxshare/%2F1387546626install.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:KN69xBf4SKfVjq3g0hFcvBEc8YE%3D', '2013-12-20 21:37:06', '13');
INSERT INTO `jh_doc_attach` VALUES ('12', 'news.txt', 'http://bcs.duapp.com/dxshare/%2F1387548437news.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:jTCizDEa8YBArZ2a4r7znlzKQUk%3D', '2013-12-20 22:07:17', null);
INSERT INTO `jh_doc_attach` VALUES ('13', 'news.txt', 'http://bcs.duapp.com/dxshare/%2F1387548484news.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:s5oLa6zzkCDYoHiCsqVOTnn1OJk%3D', '2013-12-20 22:08:04', null);
INSERT INTO `jh_doc_attach` VALUES ('14', 'news.txt', 'http://bcs.duapp.com/dxshare/%2F1387548556news.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:IvsH0kwYVwqJnu50%2BdM91emHfPY%3D', '2013-12-20 22:09:16', null);
INSERT INTO `jh_doc_attach` VALUES ('15', 'license.txt', 'http://bcs.duapp.com/dxshare/%2F1387548589license.txt?sign=MBO:3C6wefc3LtpFadgfRHn6dfMw:613ZfEsbLj46ZgkASgSpD4nhGO4%3D', '2013-12-20 22:09:49', null);

-- ----------------------------
-- Table structure for `jh_doc_type`
-- ----------------------------
DROP TABLE IF EXISTS `jh_doc_type`;
CREATE TABLE `jh_doc_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jh_doc_type
-- ----------------------------
INSERT INTO `jh_doc_type` VALUES ('1', '文学');
INSERT INTO `jh_doc_type` VALUES ('3', '小说');
