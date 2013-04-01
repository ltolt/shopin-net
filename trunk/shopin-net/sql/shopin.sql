/*
Navicat MySQL Data Transfer

Source Server         : study
Source Server Version : 50139
Source Host           : localhost:3306
Source Database       : shopin

Target Server Type    : MYSQL
Target Server Version : 50139
File Encoding         : 65001

Date: 2013-03-11 17:59:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `brand`
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `SID` int(10) NOT NULL AUTO_INCREMENT,
  `BRAND_NAME` varchar(20) DEFAULT NULL,
  `BRAND_NAME_SECOND` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brand
-- ----------------------------
INSERT INTO `brand` VALUES ('1', 'nike', 'nike');
INSERT INTO `brand` VALUES ('2', 'adi', 'adi');
INSERT INTO `brand` VALUES ('3', 'ss', 'ss');

-- ----------------------------
-- Table structure for `product_list`
-- ----------------------------
DROP TABLE IF EXISTS `product_list`;
CREATE TABLE `product_list` (
  `SID` bigint(15) NOT NULL AUTO_INCREMENT,
  `BRAND_SID` bigint(15) NOT NULL,
  `PRO_SKU` varchar(20) NOT NULL,
  `PRO_DESC` varchar(255) DEFAULT NULL,
  `PRO_ACTIVE_BIT` int(1) NOT NULL,
  `PRO_SELLING` int(1) NOT NULL,
  `PRO_TYPE` int(1) NOT NULL,
  `PRODUCT_NAME` varchar(20) DEFAULT NULL,
  `PRO_SELLING_TIME` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`SID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_list
-- ----------------------------
INSERT INTO `product_list` VALUES ('1', '1', 'skusku', 'test', '1', '1', '1', 'test', '2013-03-08 10:15:03');
INSERT INTO `product_list` VALUES ('2', '2', 'sfsf', 'sfsf', '1', '1', '1', '1', '2013-03-08 10:15:03');
INSERT INTO `product_list` VALUES ('3', '2', 'ee', 'eee', '1', '1', '3', 'eee', '2013-03-08 10:15:03');

-- ----------------------------
-- Table structure for `pro_class_dict`
-- ----------------------------
DROP TABLE IF EXISTS `pro_class_dict`;
CREATE TABLE `pro_class_dict` (
  `SID` int(11) NOT NULL,
  `PRO_CLASS_NUM` varchar(255) DEFAULT NULL,
  `PRO_CLASS_DESC` varchar(255) DEFAULT NULL,
  `CLASS_MASTER_SID` int(11) NOT NULL,
  `PRO_BIT` int(11) DEFAULT NULL,
  `PRO_LEVEL` int(11) DEFAULT NULL,
  `CLASS_MASTER_NUM` varchar(255) DEFAULT NULL,
  `PRO_CLASS_BIT` int(11) DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_class_dict
-- ----------------------------
INSERT INTO `pro_class_dict` VALUES ('1', '0', '所有分类', '0', '1', '0', null, '1');
INSERT INTO `pro_class_dict` VALUES ('2', '11', '服装', '1', '1', '1', '2', '1');

-- ----------------------------
-- Table structure for `pro_color_dict`
-- ----------------------------
DROP TABLE IF EXISTS `pro_color_dict`;
CREATE TABLE `pro_color_dict` (
  `SID` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_COLOR` varchar(255) NOT NULL,
  `PRO_COLOR_DESC` varchar(255) NOT NULL,
  `PRO_COLOR_BIT` int(11) NOT NULL,
  `BRAND_SID` bigint(20) NOT NULL,
  PRIMARY KEY (`SID`,`BRAND_SID`),
  KEY `FK_CLOR_BRAND` (`BRAND_SID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_color_dict
-- ----------------------------
INSERT INTO `pro_color_dict` VALUES ('1', '灰色', 'bluegrey', '1', '1');
INSERT INTO `pro_color_dict` VALUES ('2', '灰色', 'bluegrey', '1', '1');

-- ----------------------------
-- Table structure for `pro_detail`
-- ----------------------------
DROP TABLE IF EXISTS `pro_detail`;
CREATE TABLE `pro_detail` (
  `SID` bigint(20) NOT NULL,
  `PRODUCT_SID` bigint(20) DEFAULT NULL,
  `PRO_STAN_SID` bigint(20) DEFAULT NULL,
  `PRO_COLOR_SID` bigint(20) DEFAULT NULL,
  `MEMO` varchar(255) DEFAULT NULL,
  `PRO_ACTIVE_BIT` smallint(1) NOT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_detail
-- ----------------------------
INSERT INTO `pro_detail` VALUES ('1', '1', '1', '1', 'test', '1');
INSERT INTO `pro_detail` VALUES ('2', '1', '1', '2', 'test', '1');

-- ----------------------------
-- Table structure for `pro_stan_dict`
-- ----------------------------
DROP TABLE IF EXISTS `pro_stan_dict`;
CREATE TABLE `pro_stan_dict` (
  `SID` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_CLASS_DICT_SID` int(11) NOT NULL,
  `PRO_STAN_NAME` varchar(255) NOT NULL,
  `BRAND_SID` int(11) DEFAULT NULL,
  `PRO_STAN_BIT` int(11) NOT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pro_stan_dict
-- ----------------------------
INSERT INTO `pro_stan_dict` VALUES ('1', '2', '40', '1', '1');
