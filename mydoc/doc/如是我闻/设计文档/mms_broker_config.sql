/*
Navicat MySQL Data Transfer

Source Server         : 172.16.200.236!Caution mms_config
Source Server Version : 50521
Source Host           : 172.16.200.236:3306
Source Database       : mms_config

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2013-04-25 14:24:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mms_broker_config`
-- ----------------------------
DROP TABLE IF EXISTS `mms_broker_config`;
CREATE TABLE `mms_broker_config` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `broker_name` varchar(30) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `master_url` varchar(100) DEFAULT NULL,
  `jmx_port` varchar(100) DEFAULT NULL,
  `jmx_username` varchar(100) DEFAULT NULL,
  `jmx_password` varchar(100) DEFAULT NULL,
  `active_flg` bigint(20) DEFAULT NULL,
  `health_level` int(20) DEFAULT '1' COMMENT '1:健康(0~50） 2:一般 （50~200）3:压力大（200~800） 4:阻塞（800以上）',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `mms_broker_group_ref`
-- ----------------------------
DROP TABLE IF EXISTS `mms_broker_group_ref`;
CREATE TABLE `mms_broker_group_ref` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `broker_sid` bigint(20) DEFAULT NULL,
  `queue_group_sid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for `mms_health_monitor_config`
-- ----------------------------
DROP TABLE IF EXISTS `mms_health_monitor_config`;
CREATE TABLE `mms_health_monitor_config` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile_nums` varchar(255) DEFAULT NULL,
  `pending_threshold_values` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mms_health_monitor_config
-- ----------------------------
INSERT INTO `mms_health_monitor_config` VALUES ('1', '18911105035', '5000');

-- ----------------------------
-- Table structure for `mms_mq_recode`
-- ----------------------------
DROP TABLE IF EXISTS `mms_mq_recode`;
CREATE TABLE `mms_mq_recode` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `out_uuid` varchar(200) DEFAULT NULL,
  `broker_config_sid` bigint(20) DEFAULT NULL,
  `queue_config_sid` bigint(20) DEFAULT NULL COMMENT '队列配置文件SID',
  `queue_message_name` varchar(200) DEFAULT NULL COMMENT '队列名称',
  `queue_message_content` varchar(2000) DEFAULT NULL COMMENT '消息内容',
  `queue_backurl` varchar(200) DEFAULT NULL COMMENT '回调URL',
  `call_method` varchar(20) DEFAULT NULL COMMENT '回调方式 post /get',
  `encoded` varchar(20) DEFAULT NULL COMMENT '编码格式 默认utf8',
  `send_start_status` int(11) DEFAULT NULL COMMENT '开始发送状态',
  `send_start_time` datetime DEFAULT NULL COMMENT '开始发送时间',
  `send_end_status` int(11) DEFAULT NULL COMMENT '结束发送状态',
  `send_end_time` datetime DEFAULT NULL COMMENT '结束发送时间',
  `deal_start_status` int(11) DEFAULT NULL COMMENT '开始处理状态',
  `deal_start_time` datetime DEFAULT NULL COMMENT '开始处理时间',
  `deal_end_status` int(11) DEFAULT NULL COMMENT '处理结束状态',
  `deal_end_time` datetime DEFAULT NULL COMMENT '处理结束时间',
  `ip` varchar(20) DEFAULT NULL COMMENT '消息发送发IP地址',
  `last_opt_date` datetime DEFAULT NULL COMMENT '最后操作时间',
  `opt_desc` varchar(2000) DEFAULT NULL COMMENT '操作描述信息',
  `compens_flag` int(11) DEFAULT NULL COMMENT '//补偿标志 0 表示正常消息，1 表示未接受的消息，但是已经做了补偿，不再处理，2 表示对未处理消息做的补偿的消息',
  `notify_url` varchar(1000) DEFAULT NULL COMMENT '发送端回调方法',
  `message_source` varchar(200) DEFAULT NULL COMMENT '消息来源',
  `sub_type` varchar(200) DEFAULT NULL COMMENT '消息子类型',
  PRIMARY KEY (`sid`),
  KEY `idx_mq_record_last_opt_date` (`last_opt_date`) USING BTREE,
  KEY `idx_mq_record_send_time` (`send_start_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30521 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `mms_queue_config`
-- ----------------------------
DROP TABLE IF EXISTS `mms_queue_config`;
CREATE TABLE `mms_queue_config` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `queue_name` varchar(200) DEFAULT NULL,
  `queue_type_sid` bigint(20) DEFAULT NULL,
  `queue_type` varchar(10) DEFAULT NULL,
  `queue_group_sid` bigint(20) DEFAULT NULL,
  `queue_group` varchar(10) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `queue_flag` int(11) DEFAULT '1',
  `isneed_compens_flag` int(11) DEFAULT '0' COMMENT '是否需要补偿 0 不需要 1 需要',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `mms_queue_group_dict`
-- ----------------------------
DROP TABLE IF EXISTS `mms_queue_group_dict`;
CREATE TABLE `mms_queue_group_dict` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `queue_group` varchar(10) DEFAULT NULL,
  `queue_group_desc` varchar(255) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mms_queue_group_dict
-- ----------------------------
INSERT INTO `mms_queue_group_dict` VALUES ('1', 'high', '高优先级队列', '2013-04-02 14:49:23');
INSERT INTO `mms_queue_group_dict` VALUES ('11', 'low', '低优先级队列', '2013-04-02 14:49:30');
INSERT INTO `mms_queue_group_dict` VALUES ('12', 'order', '订单队列', '2013-04-02 14:49:54');
INSERT INTO `mms_queue_group_dict` VALUES ('13', 'ssd', 'ssd队列', '2013-04-09 11:20:05');

-- ----------------------------
-- Table structure for `mms_queue_node_ref`
-- ----------------------------
DROP TABLE IF EXISTS `mms_queue_node_ref`;
CREATE TABLE `mms_queue_node_ref` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `queue_config_sid` bigint(20) DEFAULT NULL,
  `server_node_config_sid` bigint(20) DEFAULT NULL,
  `ref_type` bigint(20) DEFAULT NULL COMMENT '1代表consumer 2 代表producer',
  `concurrent_num` int(11) DEFAULT NULL COMMENT '监听并发数量',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `mms_queue_type_dict`
-- ----------------------------
DROP TABLE IF EXISTS `mms_queue_type_dict`;
CREATE TABLE `mms_queue_type_dict` (
  `sid` bigint(20) NOT NULL,
  `queue_type` varchar(10) DEFAULT NULL,
  `queue_type_desc` varchar(255) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mms_queue_type_dict
-- ----------------------------
INSERT INTO `mms_queue_type_dict` VALUES ('1', 'queue', '队列类型', '2013-04-02 14:50:17');

-- ----------------------------
-- Table structure for `mms_server_node_config`
-- ----------------------------
DROP TABLE IF EXISTS `mms_server_node_config`;
CREATE TABLE `mms_server_node_config` (
  `sid` bigint(20) NOT NULL AUTO_INCREMENT,
  `node_name` varchar(255) DEFAULT NULL,
  `ip_address` varchar(30) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `context_path` varchar(255) DEFAULT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active_status` int(11) DEFAULT NULL COMMENT '0为非活动状态，1为活动状态',
  `node_type` int(11) DEFAULT NULL COMMENT '0:消费者 1:生产者',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `mms_subscribe_config`
-- ----------------------------
DROP TABLE IF EXISTS `mms_subscribe_config`;
CREATE TABLE `mms_subscribe_config` (
  `sid` bigint(20) NOT NULL DEFAULT '0',
  `subscriber_name` varchar(100) DEFAULT NULL,
  `queue_sid` bigint(20) DEFAULT NULL,
  `call_back_url` varchar(255) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mms_subscribe_config
-- ----------------------------
