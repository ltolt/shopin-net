/*
Navicat MySQL Data Transfer

Source Server         : 172.16.200.236_3306 mmsadmin
Source Server Version : 50521
Source Host           : 172.16.200.236:3306
Source Database       : mmsadmin

Target Server Type    : MYSQL
Target Server Version : 50521
File Encoding         : 65001

Date: 2013-04-25 16:45:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `app_function`
-- ----------------------------
DROP TABLE IF EXISTS `app_function`;
CREATE TABLE `app_function` (
  `functionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `funKey` varchar(64) NOT NULL COMMENT '权限Key',
  `funName` varchar(128) NOT NULL COMMENT '权限名称',
  PRIMARY KEY (`functionId`),
  UNIQUE KEY `AK_UQ_RSKEY` (`funKey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of app_function
-- ----------------------------
INSERT INTO `app_function` VALUES ('1', '_AppUserQuery', '查看员工');
INSERT INTO `app_function` VALUES ('2', '_AppUserAdd', '添加员工');
INSERT INTO `app_function` VALUES ('3', '_AppUserEdit', '编辑员工');
INSERT INTO `app_function` VALUES ('4', '_AppUserDel', '删除员工');
INSERT INTO `app_function` VALUES ('5', '_AppRoleList', '查看角色');
INSERT INTO `app_function` VALUES ('6', '_AppRoleAdd', '添加角色');
INSERT INTO `app_function` VALUES ('7', '_AppRoleEdit', '编辑角色');
INSERT INTO `app_function` VALUES ('8', '_AppRoleDel', '删除角色');
INSERT INTO `app_function` VALUES ('9', '_AppRoleGrant', '授权角色');
INSERT INTO `app_function` VALUES ('10', '_DepartmentQuery', '查看部门');
INSERT INTO `app_function` VALUES ('11', '_DepartmentAdd', '新建部门');
INSERT INTO `app_function` VALUES ('12', '_DepartmentEdit', '修改部门');
INSERT INTO `app_function` VALUES ('13', '_DepartmentDel', '删除部门');
INSERT INTO `app_function` VALUES ('14', '_FileAttachQuery', '查看附件');
INSERT INTO `app_function` VALUES ('15', '_FileAttachEdit', '编辑附件');
INSERT INTO `app_function` VALUES ('16', '_FileAttachDel', '删除附件');
INSERT INTO `app_function` VALUES ('17', '_CompanyEdit', '公司信息修改');
INSERT INTO `app_function` VALUES ('18', '_FlowQuery', '查看流程');
INSERT INTO `app_function` VALUES ('19', '_ProTypeManage', '流程类型');
INSERT INTO `app_function` VALUES ('20', '_FlowAdd', '发布流程');
INSERT INTO `app_function` VALUES ('21', '_FlowEdit', '编辑流程');
INSERT INTO `app_function` VALUES ('22', '_FlowDel', '删除流程');
INSERT INTO `app_function` VALUES ('23', '_FlowCheck', '查看');
INSERT INTO `app_function` VALUES ('24', '_FlowSetting', '人员设置');
INSERT INTO `app_function` VALUES ('25', '_DocFolderSharedManage', '公共文件夹管理');
INSERT INTO `app_function` VALUES ('26', '_DocPrivilegeQuery', '查看权限');
INSERT INTO `app_function` VALUES ('27', '_DocPrivilegeAdd', '添加权限');
INSERT INTO `app_function` VALUES ('28', '_DocPrivilegeEdit', '编辑权限');
INSERT INTO `app_function` VALUES ('29', '_DocPrivilegeDel', '删除权限');
INSERT INTO `app_function` VALUES ('35', '_NewsQuery', '查看新闻');
INSERT INTO `app_function` VALUES ('36', '_NewsAdd', '添加新闻');
INSERT INTO `app_function` VALUES ('38', '_NewsDel', '删除新闻');
INSERT INTO `app_function` VALUES ('39', '_NewsCommentQuery', '查看评论');
INSERT INTO `app_function` VALUES ('40', '_NewsCommentDel', '删除评论');
INSERT INTO `app_function` VALUES ('41', '_NewsTypeQuery', '查看新闻类型');
INSERT INTO `app_function` VALUES ('42', '_NewsTypeAdd', '添加新闻类型');
INSERT INTO `app_function` VALUES ('43', '_NewsTypeEdit', '修改新闻类型');
INSERT INTO `app_function` VALUES ('44', '_NewsTypeDel', '删除新闻类型');
INSERT INTO `app_function` VALUES ('45', '_NoticeQuery', '查看公告');
INSERT INTO `app_function` VALUES ('48', '_NoticeDel321', '删除公告13456');
INSERT INTO `app_function` VALUES ('56', '111', '12345');
INSERT INTO `app_function` VALUES ('57', '123456', '123456');
INSERT INTO `app_function` VALUES ('58', '', '');

-- ----------------------------
-- Table structure for `app_role`
-- ----------------------------
DROP TABLE IF EXISTS `app_role`;
CREATE TABLE `app_role` (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(128) NOT NULL COMMENT '角色名称',
  `roleDesc` varchar(128) DEFAULT NULL COMMENT '角色描述',
  `status` smallint(6) NOT NULL COMMENT '状态',
  `rights` text,
  `isDefaultIn` smallint(6) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of app_role
-- ----------------------------
INSERT INTO `app_role` VALUES ('-1', '超级管理员', '超级管理员,具有所有权限', '1', '__ALL', '0');
INSERT INTO `app_role` VALUES ('6', '一般用户', '一般用户', '1', 'MyDesktop,ProfileForm,BandPoor,ScoreManage,ScoreManageView,_ScoreManageAdd,_ScoreManageDel,_ScoreManageEdit,_ScoreManageImport', '0');
INSERT INTO `app_role` VALUES ('11', '中级权限', '中级权限', '1', null, '0');
INSERT INTO `app_role` VALUES ('12', '节点管理者', '', '1', 'mms,MMS_NodeListView,MMS_QueueListView,MyDesktop,ProfileForm', '0');

-- ----------------------------
-- Table structure for `app_tips`
-- ----------------------------
DROP TABLE IF EXISTS `app_tips`;
CREATE TABLE `app_tips` (
  `tipsId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `tipsName` varchar(128) DEFAULT NULL,
  `content` varchar(2048) DEFAULT NULL,
  `disheight` int(11) DEFAULT NULL,
  `diswidth` int(11) DEFAULT NULL,
  `disleft` int(11) DEFAULT NULL,
  `distop` int(11) DEFAULT NULL,
  `dislevel` int(11) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`tipsId`),
  KEY `FK_AT_R_AP` (`userId`) USING BTREE,
  CONSTRAINT `app_tips_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `app_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='用户便签';

-- ----------------------------
-- Records of app_tips
-- ----------------------------
INSERT INTO `app_tips` VALUES ('11', '1', 'tips130109143640673', 'hello', '90', '199', '135', '92', '1', '2013-01-09 14:36:40');

-- ----------------------------
-- Table structure for `app_user`
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `title` smallint(6) NOT NULL DEFAULT '1' COMMENT '1=先生\r\n            0=女士\r\n            小姐',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `email` varchar(128) NOT NULL COMMENT '邮件',
  `depId` bigint(20) DEFAULT NULL COMMENT '所属部门',
  `position` varchar(32) DEFAULT NULL COMMENT '职位',
  `phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机',
  `fax` varchar(32) DEFAULT NULL COMMENT '传真',
  `address` varchar(64) DEFAULT NULL COMMENT '地址',
  `zip` varchar(32) DEFAULT NULL COMMENT '邮编',
  `photo` varchar(128) DEFAULT NULL COMMENT '相片',
  `accessionTime` datetime DEFAULT NULL COMMENT '入职时间',
  `status` smallint(6) DEFAULT NULL COMMENT '状态\r\n            1=激活\r\n            0=禁用\r\n            2=离职\r\n            ',
  `education` varchar(64) DEFAULT NULL,
  `fullname` varchar(50) NOT NULL,
  `delFlag` smallint(6) DEFAULT NULL COMMENT '0=未删除\r\n            1=删除',
  PRIMARY KEY (`userId`),
  KEY `FK_AU_R_DPT` (`depId`) USING BTREE,
  CONSTRAINT `app_user_ibfk_1` FOREIGN KEY (`depId`) REFERENCES `department` (`depId`)
) ENGINE=InnoDB AUTO_INCREMENT=712 DEFAULT CHARSET=utf8 COMMENT='app_user\r\n用户表';

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES ('-1', 'system', '1', '0', 'choupihao@163.com', null, null, null, null, null, null, null, null, '2009-12-18 00:00:00', '1', '', '系统', '1');
INSERT INTO `app_user` VALUES ('1', 'admin', '0', 'a4ayc/80/OGda4BO/1o/V0etpOqiLx1JwB5S3beHW0s=', 'zhangpeng@shopin.cn', '46', null, '', '18601031200', '', '', '', '', '2009-12-18 00:00:00', '1', '未分配部门', '管理员', '0');
INSERT INTO `app_user` VALUES ('2', 'csx', '1', 'a4ayc/80/OGda4BO/1o/V0etpOqiLx1JwB5S3beHW0s=', 'choupihao@163.com', null, '工程师', '888888', '888888', '', '', '', '', '2010-05-03 00:00:00', '1', '', 'cwx', '1');
INSERT INTO `app_user` VALUES ('3', 'hr', '1', 'a4ayc/80/OGda4BO/1o/V0etpOqiLx1JwB5S3beHW0s=', 'choupihao@163.com', null, '', '', '', '', '', '', '', '2011-08-16 00:00:00', '1', '', '人事经理', '1');
INSERT INTO `app_user` VALUES ('4', 'liyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liyan@shopin.cn', '50', '总裁', null, null, null, null, null, null, '2012-03-06 14:07:29', '1', null, '李炎', '0');
INSERT INTO `app_user` VALUES ('5', 'yinsong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yinsong@shopin.cn', '50', '高级副总裁', null, null, null, null, null, null, '2012-03-06 14:07:29', '1', null, '尹松', '0');
INSERT INTO `app_user` VALUES ('6', 'liuhong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuhong@shopin.cn', '50', '高级副总裁兼商品经营中心总经理', null, null, null, null, null, null, '2003-06-30 00:00:00', '1', null, '刘宏', '0');
INSERT INTO `app_user` VALUES ('7', 'mahui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mahui@shopin.cn', '50', '高级副总裁兼门店运营中心总经理', null, null, null, null, null, null, '2011-11-28 00:00:00', '1', null, '马慧', '0');
INSERT INTO `app_user` VALUES ('8', 'wangtao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangtao@shopin.cn', '50', '副总裁', null, null, null, null, null, null, '2012-03-06 14:07:29', '1', null, '王涛', '0');
INSERT INTO `app_user` VALUES ('9', 'lvyansha', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lvyansha@shopin.cn', '50', '副总裁', null, null, null, null, null, null, '2008-05-16 00:00:00', '1', null, '吕燕沙', '0');
INSERT INTO `app_user` VALUES ('10', 'lujian', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lujian@shopin.cn', '50', '总裁助理', null, null, null, null, null, null, '2011-06-09 00:00:00', '1', null, '芦剑', '0');
INSERT INTO `app_user` VALUES ('11', 'yuyongli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yuyongli@shopin.cn', '50', 'CIO', null, null, null, null, null, null, '2010-10-27 00:00:00', '1', null, '于永利', '0');
INSERT INTO `app_user` VALUES ('12', 'wangchun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangchun@shopin.cn', '1', '总裁办主任', null, null, null, null, null, null, '2005-08-10 00:00:00', '1', null, '王纯', '0');
INSERT INTO `app_user` VALUES ('13', 'malingyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'malingyan@shopin.cn', '1', '公共关系专员', null, null, null, null, null, null, '2009-01-20 00:00:00', '1', null, '马凌燕', '0');
INSERT INTO `app_user` VALUES ('14', 'xuyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xuyi@shopin.cn', '1', '文秘-证照', null, null, null, null, null, null, '2000-09-15 00:00:00', '1', null, '徐漪', '0');
INSERT INTO `app_user` VALUES ('15', 'guohongya', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guohongya@shopin.cn', '1', '文秘-会议', null, null, null, null, null, null, '2008-07-25 00:00:00', '1', null, '郭宏雅', '0');
INSERT INTO `app_user` VALUES ('16', 'yaofang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yaofang@shopin.cn', '1', '司机', null, null, null, null, null, null, '2003-06-13 00:00:00', '1', null, '姚放', '0');
INSERT INTO `app_user` VALUES ('17', 'jiangwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jiangwei@shopin.cn', '1', '办公室安全专员', null, null, null, null, null, null, '2010-06-23 00:00:00', '1', null, '姜威', '0');
INSERT INTO `app_user` VALUES ('18', 'wanglinfang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanglinfang@shopin.cn', '1', '行政文员', null, null, null, null, null, null, '2011-03-30 00:00:00', '1', null, '王林芳', '0');
INSERT INTO `app_user` VALUES ('19', 'wangshuzhong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangshuzhong@shopin.cn', '1', '夜值', null, null, null, null, null, null, '2011-04-01 00:00:00', '1', null, '王书忠', '0');
INSERT INTO `app_user` VALUES ('20', 'mengxianglong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mengxianglong@shopin.cn', '1', '总裁司机', null, null, null, null, null, null, '2011-10-13 00:00:00', '1', null, '孟祥龙', '0');
INSERT INTO `app_user` VALUES ('21', 'niufei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'niufei@shopin.cn', '1', '前台文员', null, null, null, null, null, null, '2011-11-09 00:00:00', '1', null, '牛菲', '0');
INSERT INTO `app_user` VALUES ('22', 'gaoyuwen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gaoyuwen@shopin.cn', '1', '前台文员', null, null, null, null, null, null, '2011-12-16 00:00:00', '1', null, '高钰雯', '0');
INSERT INTO `app_user` VALUES ('23', 'yangxiujie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangxiujie@shopin.cn', '1', '保洁', null, null, null, null, null, null, '2011-11-16 00:00:00', '1', null, '杨秀杰', '0');
INSERT INTO `app_user` VALUES ('24', 'zhangyu002', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyu002@shopin.cn', '1', '夜值', null, null, null, null, null, null, '2012-01-04 00:00:00', '1', null, '张瑜', '0');
INSERT INTO `app_user` VALUES ('25', 'chenxiuying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenxiuying@shopin.cn', '1', '保洁', null, null, null, null, null, null, '2012-01-05 00:00:00', '1', null, '陈秀英', '0');
INSERT INTO `app_user` VALUES ('26', 'huangzhenying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huangzhenying@shopin.cn', '2', '门店运营中心总经理', '', '', '', '', '', '', '2002-12-05 00:00:00', '1', null, '黄振英', '0');
INSERT INTO `app_user` VALUES ('27', 'zhouqi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhouqi@shopin.cn', '37', '总监', '', '', '', '', '', '', '2005-08-16 00:00:00', '1', null, '周圻', '0');
INSERT INTO `app_user` VALUES ('28', 'huyanfang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huyanfang@shopin.cn', '37', '高级外联经理', null, null, null, null, null, null, '2001-07-01 00:00:00', '1', null, '胡艳芳', '0');
INSERT INTO `app_user` VALUES ('29', 'liuzhonghua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuzhonghua@shopin.cn', '66', '品价经理', '', '', '', '', '', '', '2006-02-22 00:00:00', '1', null, '刘忠华', '0');
INSERT INTO `app_user` VALUES ('30', 'zhaoxiuyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaoxiuyan@shopin.cn', '37', '客服经理', null, null, null, null, null, null, '2011-03-23 00:00:00', '1', null, '赵秀艳', '0');
INSERT INTO `app_user` VALUES ('31', 'sunlihui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunlihui@shopin.cn', '51', '经理', null, null, null, null, null, null, '2007-08-10 00:00:00', '1', null, '孙黎晖', '0');
INSERT INTO `app_user` VALUES ('32', 'sunpei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunpei@shopin.cn', '66', '品价专员', '', '', '', '', '', '', '2008-11-27 00:00:00', '1', null, '孙蓓', '0');
INSERT INTO `app_user` VALUES ('33', 'dongjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dongjing@shopin.cn', '66', '品价专员', '', '', '', '', '', '', '2007-05-17 00:00:00', '1', null, '董晶', '0');
INSERT INTO `app_user` VALUES ('34', 'qinfei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qinfei@shopin.cn', '37', '运营专员', null, null, null, null, null, null, '2009-02-25 00:00:00', '1', null, '秦飞', '0');
INSERT INTO `app_user` VALUES ('35', 'yujing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yujing@shopin.cn', '37', '运营专员', null, null, null, null, null, null, '2010-09-21 00:00:00', '1', null, '于静', '0');
INSERT INTO `app_user` VALUES ('36', 'maqiumei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'maqiumei@shopin.cn', '37', '客服专员', null, null, null, null, null, null, '2011-05-16 00:00:00', '1', null, '马秋梅', '0');
INSERT INTO `app_user` VALUES ('37', 'houwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'houwei@shopin.cn', '38', '防损专员', null, null, null, null, null, null, '2005-09-05 00:00:00', '1', null, '侯伟', '0');
INSERT INTO `app_user` VALUES ('38', 'wangyonghong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangyonghong@shopin.cn', '38', '防损专员', null, null, null, null, null, null, '2010-05-19 00:00:00', '1', null, '王永红', '0');
INSERT INTO `app_user` VALUES ('39', 'zhanghuiyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhanghuiyuan@shopin.cn', '39', '第一负责人', null, null, null, null, null, null, '2009-08-20 00:00:00', '1', null, '张会元', '0');
INSERT INTO `app_user` VALUES ('40', 'lijun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijun@shopin.cn', '39', '土木工程师', null, null, null, null, null, null, '2011-11-09 00:00:00', '1', null, '李军', '0');
INSERT INTO `app_user` VALUES ('41', 'zhangmingxin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangmingxin@shopin.cn', '39', '电气工程师', null, null, null, null, null, null, '2008-09-24 00:00:00', '1', null, '张明新', '0');
INSERT INTO `app_user` VALUES ('42', '__zhuna', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhuna@shopin.cn', '37', '初级文员', null, null, null, null, null, null, '2010-10-09 00:00:00', '0', null, '朱娜', '1');
INSERT INTO `app_user` VALUES ('43', 'mayaxin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mayaxin@shopin.cn', '37', '高级文员', null, null, null, null, null, null, '2011-03-08 00:00:00', '1', null, '马雅新', '0');
INSERT INTO `app_user` VALUES ('44', 'shijie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shijie@shopin.cn', '19', '经理', null, null, null, null, null, null, '2006-04-24 00:00:00', '1', null, '石洁', '0');
INSERT INTO `app_user` VALUES ('45', 'lishuo', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lishuo@shopin.cn', '19', '高级行政专员', null, null, null, null, null, null, '2005-07-27 00:00:00', '1', null, '李硕', '0');
INSERT INTO `app_user` VALUES ('46', 'zhangjingyun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjingyun@shopin.cn', '19', '中级行政专员', null, null, null, null, null, null, '2007-05-23 00:00:00', '1', null, '张静云', '0');
INSERT INTO `app_user` VALUES ('47', 'xurui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xurui@shopin.cn', '19', '初级行政专员', null, null, null, null, null, null, '2010-03-08 00:00:00', '1', null, '徐睿', '0');
INSERT INTO `app_user` VALUES ('48', 'xiaohua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xiaohua@shopin.cn', '19', '初级行政专员', null, null, null, null, null, null, '2008-08-01 00:00:00', '1', null, '肖华', '0');
INSERT INTO `app_user` VALUES ('49', 'kouchuntai', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'kouchuntai@shopin.cn', '19', '初级行政专员', null, null, null, null, null, null, '2011-11-09 00:00:00', '1', null, '寇春泰', '0');
INSERT INTO `app_user` VALUES ('50', 'xingyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xingyan@shopin.cn', '10', '高级经理', null, null, null, null, null, null, '2002-12-09 00:00:00', '1', null, '邢燕', '0');
INSERT INTO `app_user` VALUES ('51', 'yuanxiaofei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yuanxiaofei@shopin.cn', '10', '合同管理主管', null, null, null, null, null, null, '2006-04-12 00:00:00', '1', null, '袁晓霏', '0');
INSERT INTO `app_user` VALUES ('52', 'guona', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guona@shopin.cn', '10', '法务审核助理', null, null, null, null, null, null, '2010-05-19 00:00:00', '1', null, '郭娜', '0');
INSERT INTO `app_user` VALUES ('53', 'liboxin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liboxin@shopin.cn', '10', '合同审核助理', null, null, null, null, null, null, '2010-05-19 00:00:00', '1', null, '李博馨', '0');
INSERT INTO `app_user` VALUES ('54', 'zhanglan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhanglan@shopin.cn', '10', '商务审核助理', null, null, null, null, null, null, '2010-07-21 00:00:00', '1', null, '张兰', '0');
INSERT INTO `app_user` VALUES ('55', 'yangjinli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangjinli@shopin.cn', '10', '法务审核主管', null, null, null, null, null, null, '2010-07-21 00:00:00', '1', null, '杨金丽', '0');
INSERT INTO `app_user` VALUES ('56', 'heying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'heying@shopin.cn', '10', '合同审核助理', null, null, null, null, null, null, '2010-10-09 00:00:00', '1', null, '贺颖', '0');
INSERT INTO `app_user` VALUES ('57', 'dengling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dengling@shopin.cn', '10', '合同审核助理', null, null, null, null, null, null, '2011-07-21 00:00:00', '1', null, '邓玲', '0');
INSERT INTO `app_user` VALUES ('58', 'liujia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liujia@shopin.cn', '10', '合同审核助理', null, null, null, null, null, null, '2011-08-03 00:00:00', '1', null, '刘佳', '0');
INSERT INTO `app_user` VALUES ('59', 'lufang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lufang@shopin.cn', '10', '合同审核助理', null, null, null, null, null, null, '2011-10-12 00:00:00', '1', null, '路芳', '0');
INSERT INTO `app_user` VALUES ('60', 'chenxiu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenxiu@shopin.cn', '10', '商务管理主管', null, null, null, null, null, null, '2011-10-19 00:00:00', '1', null, '陈秀', '0');
INSERT INTO `app_user` VALUES ('61', 'liying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liying@shopin.cn', '57', '总监', null, null, null, null, null, null, '2000-10-01 00:00:00', '1', null, '李颖', '0');
INSERT INTO `app_user` VALUES ('62', 'yangpei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangpei@shopin.cn', '57', '商品组织经理', null, null, null, null, null, null, '2007-05-18 00:00:00', '1', null, '杨培', '0');
INSERT INTO `app_user` VALUES ('63', 'yangwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangwei@shopin.cn', '57', '商品组织经理', null, null, null, null, null, null, '2006-08-28 00:00:00', '1', null, '杨微', '0');
INSERT INTO `app_user` VALUES ('64', 'suntingting', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'suntingting@shopin.cn', '57', '商品组织专员', null, null, null, null, null, null, '2006-04-24 00:00:00', '1', null, '孙婷婷', '0');
INSERT INTO `app_user` VALUES ('65', 'yanshujuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yanshujuan@shopin.cn', '57', '租赁经理', null, null, null, null, null, null, '2011-07-21 00:00:00', '1', null, '阎淑娟', '0');
INSERT INTO `app_user` VALUES ('66', 'lvyou', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lvyou@shopin.cn', '57', '高级租赁业务专员', null, null, null, null, null, null, '2009-12-09 00:00:00', '1', null, '吕尤', '0');
INSERT INTO `app_user` VALUES ('67', 'binwangbin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'binwangbin@shopin.cn', '57', '商品组织专员', null, null, null, null, null, null, '2010-03-08 00:00:00', '1', null, '宾王彬', '0');
INSERT INTO `app_user` VALUES ('68', 'wuruixia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wuruixia@shopin.cn', '57', '商品组织专员', null, null, null, null, null, null, '2010-07-21 00:00:00', '1', null, '吴睿霞', '0');
INSERT INTO `app_user` VALUES ('69', 'zhangna', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangna@shopin.cn', '57', '招商助理', null, null, null, null, null, null, '2011-01-06 00:00:00', '1', null, '张娜', '0');
INSERT INTO `app_user` VALUES ('70', 'baixuefeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'baixuefeng@shopin.cn', '51', '总监', null, null, null, null, null, null, '2005-04-25 00:00:00', '1', null, '白雪峰', '0');
INSERT INTO `app_user` VALUES ('71', 'hesixin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hesixin@shopin.cn', '58', '商品组织经理', null, null, null, null, null, null, '2004-07-26 00:00:00', '1', null, '何思欣', '0');
INSERT INTO `app_user` VALUES ('72', 'lining1', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lining1@shopin.cn', '58', '商品组织经理', null, null, null, null, null, null, '2010-11-24 00:00:00', '1', null, '李宁', '0');
INSERT INTO `app_user` VALUES ('73', 'zhaomin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaomin@shopin.cn', '58', '采购部经理', null, null, null, null, null, null, '2011-03-01 00:00:00', '1', null, '赵敏', '0');
INSERT INTO `app_user` VALUES ('74', 'maowenli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'maowenli@shopin.cn', '58', '采购经理', null, null, null, null, null, null, '2011-12-14 00:00:00', '1', null, '毛文莉', '0');
INSERT INTO `app_user` VALUES ('75', 'zhaohua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaohua@shopin.cn', '58', '商品组织经理', null, null, null, null, null, null, '2006-07-12 00:00:00', '1', null, '赵化', '0');
INSERT INTO `app_user` VALUES ('76', 'hanxiubin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hanxiubin@shopin.cn', '58', '商品组织专员', null, null, null, null, null, null, '2010-03-01 00:00:00', '1', null, '韩秀宾', '0');
INSERT INTO `app_user` VALUES ('77', 'lixiaoyu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lixiaoyu@shopin.cn', '58', '商品组织专员', null, null, null, null, null, null, '2009-10-15 00:00:00', '1', null, '李晓玉', '0');
INSERT INTO `app_user` VALUES ('78', 'jialiru', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jialiru@shopin.cn', '58', '商品组织专员', null, null, null, null, null, null, '2010-07-21 00:00:00', '1', null, '贾利如', '0');
INSERT INTO `app_user` VALUES ('79', 'fushenshen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fushenshen@shopin.cn', '58', '高级商品专员', null, null, null, null, null, null, '2010-03-01 00:00:00', '1', null, '付棽棽', '0');
INSERT INTO `app_user` VALUES ('80', 'tianfanghua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tianfanghua@shopin.cn', '58', '商品助理', null, null, null, null, null, null, '2010-12-15 00:00:00', '1', null, '田方华', '0');
INSERT INTO `app_user` VALUES ('81', 'sunlili', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunlili@shopin.cn', '58', '商品组织专员', null, null, null, null, null, null, '2011-05-04 00:00:00', '1', null, '孙莉莉', '0');
INSERT INTO `app_user` VALUES ('82', 'sulina', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sulina@shopin.cn', '58', '商品专员', null, null, null, null, null, null, '2011-11-09 00:00:00', '1', null, '苏丽娜', '0');
INSERT INTO `app_user` VALUES ('83', 'tangzhihe', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tangzhihe@shopin.cn', '43', '总监', null, null, null, null, null, null, '2009-08-24 00:00:00', '1', null, '唐志和', '0');
INSERT INTO `app_user` VALUES ('84', 'weiyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'weiyan@shopin.cn', '43', '高级商品规划师', null, null, null, null, null, null, '2007-02-03 00:00:00', '1', null, '魏岩', '0');
INSERT INTO `app_user` VALUES ('85', 'shanyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shanyan@shopin.cn', '43', '高级商品规划师', '', '', '', '', '', '', '2007-11-01 00:00:00', '1', null, '山岩', '0');
INSERT INTO `app_user` VALUES ('86', 'majunzhi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'majunzhi@shopin.cn', '43', '商品规划专员', null, null, null, null, null, null, '2006-04-27 00:00:00', '1', null, '马俊芝', '0');
INSERT INTO `app_user` VALUES ('87', 'qile', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qile@shopin.cn', '43', '商品规划专员', null, null, null, null, null, null, '2010-04-14 00:00:00', '1', null, '齐乐', '0');
INSERT INTO `app_user` VALUES ('88', 'nieyunfeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'nieyunfeng@shopin.cn', '43', '商品规划专员', null, null, null, null, null, null, '2007-03-14 00:00:00', '1', null, '聂云凤', '0');
INSERT INTO `app_user` VALUES ('89', 'wangmeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangmeng@shopin.cn', '43', '商品规划专员', null, null, null, null, null, null, '2011-10-26 00:00:00', '1', null, '王萌', '0');
INSERT INTO `app_user` VALUES ('90', 'zhangshasha', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangshasha@shopin.cn', '43', '商品规划专员', null, null, null, null, null, null, '2011-12-07 00:00:00', '1', null, '张沙沙', '0');
INSERT INTO `app_user` VALUES ('91', 'liushaolong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liushaolong@shopin.cn', '43', '商品规划专员', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '刘少龙', '0');
INSERT INTO `app_user` VALUES ('92', 'lirongping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lirongping@shopin.cn', '59', '数据支持小组助理', null, null, null, null, null, null, '2010-12-15 00:00:00', '1', null, '李容萍', '0');
INSERT INTO `app_user` VALUES ('93', 'piyingjie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'piyingjie@shopin.cn', '59', '数据支持小组组长', '', '', '', '', '', '', '2007-09-12 00:00:00', '1', null, '皮英杰', '0');
INSERT INTO `app_user` VALUES ('94', 'weina', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'weina@shopin.cn', '59', '数据支持小组助理', null, null, null, null, null, null, '2011-11-16 00:00:00', '1', null, '韦娜', '0');
INSERT INTO `app_user` VALUES ('95', 'lina01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lina01@shopin.cn', '59', '数据支持小组助理', null, null, null, null, null, null, '2011-12-28 00:00:00', '1', null, '李娜', '0');
INSERT INTO `app_user` VALUES ('96', 'chenyue', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenyue@shopin.cn', '42', '总监', '', '', '', '', '', '', '2004-12-20 00:00:00', '1', null, '陈悦', '0');
INSERT INTO `app_user` VALUES ('97', 'shimeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shimeng@shopin.cn', '42', '媒介经理', '', '', '', '', '', '', '2011-03-23 00:00:00', '1', null, '时萌', '0');
INSERT INTO `app_user` VALUES ('98', 'antingxuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'antingxuan@shopin.cn', '42', '营销策划师', null, null, null, null, null, null, '2010-03-15 00:00:00', '1', null, '安庭萱', '0');
INSERT INTO `app_user` VALUES ('99', 'wanglingling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanglingling@shopin.cn', '42', '营销策划师', '', '', '', '', '', '', '2007-11-11 00:00:00', '1', null, '王玲玲', '0');
INSERT INTO `app_user` VALUES ('100', 'zhangyanqing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyanqing@shopin.cn', '42', '设计主管', null, null, null, null, null, null, '2008-03-19 00:00:00', '1', null, '张延庆', '0');
INSERT INTO `app_user` VALUES ('101', 'yangfan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangfan@shopin.cn', '42', '设计专员', null, null, null, null, null, null, '2010-05-12 00:00:00', '1', null, '杨帆', '0');
INSERT INTO `app_user` VALUES ('102', 'scyxyangjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'scyxyangjing@shopin.cn', '42', '设计专员', null, null, null, null, null, null, '2010-05-13 00:00:00', '1', null, '杨静', '0');
INSERT INTO `app_user` VALUES ('103', 'mayan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mayan@shopin.cn', '42', '设计专员', null, null, null, null, null, null, '2010-09-10 00:00:00', '1', null, '马艳', '0');
INSERT INTO `app_user` VALUES ('104', 'fuxiao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fuxiao@shopin.cn', '42', '媒介专员', '', '', '', '', '', '', '2009-01-20 00:00:00', '1', null, '付笑', '0');
INSERT INTO `app_user` VALUES ('105', 'liubo', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liubo@shopin.cn', '42', '营销策划师', null, null, null, null, null, null, '2011-06-07 00:00:00', '1', null, '刘波', '0');
INSERT INTO `app_user` VALUES ('106', 'zhangjun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjun@shopin.cn', '42', '媒介助理', null, null, null, null, null, null, '2010-10-27 00:00:00', '1', null, '张珺', '0');
INSERT INTO `app_user` VALUES ('107', 'huwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huwei@shopin.cn', '42', '营销策划师', '', '', '', '', '', '', '2011-08-24 00:00:00', '1', null, '胡巍', '0');
INSERT INTO `app_user` VALUES ('108', 'wutingting', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wutingting@shopin.cn', '42', '设计专员', null, null, null, null, null, null, '2011-08-29 00:00:00', '1', null, '吴婷婷', '0');
INSERT INTO `app_user` VALUES ('109', 'huowenjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huowenjing@shopin.cn', '42', '媒介助理', null, null, null, null, null, null, '2011-09-21 00:00:00', '1', null, '霍文静', '0');
INSERT INTO `app_user` VALUES ('110', 'hedongzi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hedongzi@shopin.cn', '42', '营销策划师', null, null, null, null, null, null, '2011-10-19 00:00:00', '1', null, '何东子', '0');
INSERT INTO `app_user` VALUES ('111', 'xuyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xuyuan@shopin.cn', '40', '高级财务经理', null, null, null, null, null, null, '2011-10-19 00:00:00', '1', null, '徐源', '0');
INSERT INTO `app_user` VALUES ('112', 'machunmei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'machunmei@shopin.cn', '40', '结算主管', null, null, null, null, null, null, '2005-02-03 00:00:00', '1', null, '马春梅', '0');
INSERT INTO `app_user` VALUES ('113', 'zhaomeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaomeng@shopin.cn', '40', '网络审核主管', null, null, null, null, null, null, '2002-12-23 00:00:00', '1', null, '赵萌', '0');
INSERT INTO `app_user` VALUES ('114', 'xiongmiaozhen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xiongmiaozhen@shopin.cn', '40', '会计主管', null, null, null, null, null, null, '2008-04-21 00:00:00', '1', null, '熊淼珍', '0');
INSERT INTO `app_user` VALUES ('115', 'yuheting', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yuheting@shopin.cn', '40', '会计', null, null, null, null, null, null, '2009-08-12 00:00:00', '1', null, '于贺婷', '0');
INSERT INTO `app_user` VALUES ('116', 'xujingjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xujingjing@shopin.cn', '40', '结算专员', null, null, null, null, null, null, '2010-07-14 00:00:00', '1', null, '徐晶晶', '0');
INSERT INTO `app_user` VALUES ('117', 'chenpengchao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenpengchao@shopin.cn', '40', '结算助理', null, null, null, null, null, null, '2011-02-11 00:00:00', '1', null, '陈鹏超', '0');
INSERT INTO `app_user` VALUES ('118', 'lining', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lining@shopin.cn', '40', '出纳', null, null, null, null, null, null, '2011-03-23 00:00:00', '1', null, '李宁', '0');
INSERT INTO `app_user` VALUES ('119', 'sujianyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sujianyuan@shopin.cn', '40', '会计助理', null, null, null, null, null, null, '2010-03-01 00:00:00', '1', null, '苏建元', '0');
INSERT INTO `app_user` VALUES ('120', 'jiangyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jiangyan@shopin.cn', '40', '结算专员', null, null, null, null, null, null, '2010-08-06 00:00:00', '1', null, '蒋燕', '0');
INSERT INTO `app_user` VALUES ('121', 'zhanglidong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhanglidong@shopin.cn', '40', '结算助理', null, null, null, null, null, null, '2008-10-11 00:00:00', '1', null, '张立冬', '0');
INSERT INTO `app_user` VALUES ('122', 'wulipingcw', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wulipingcw@shopin.cn', '40', '网络审核助理', null, null, null, null, null, null, '2011-03-30 00:00:00', '1', null, '吴丽苹', '0');
INSERT INTO `app_user` VALUES ('123', 'zhaoxiaoman', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaoxiaoman@shopin.cn', '40', '网络审核助理', null, null, null, null, null, null, '2011-04-27 00:00:00', '1', null, '赵晓曼', '0');
INSERT INTO `app_user` VALUES ('124', 'jiyali', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jiyali@shopin.cn', '40', '网络审核助理', null, null, null, null, null, null, '2006-10-10 00:00:00', '1', null, '季雅丽', '0');
INSERT INTO `app_user` VALUES ('125', 'zhangwenlong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangwenlong@shopin.cn', '40', '网络审核助理', null, null, null, null, null, null, '2010-12-15 00:00:00', '1', null, '张文龙', '0');
INSERT INTO `app_user` VALUES ('126', 'baiping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'baiping@shopin.cn', '41', '高级财务经理', null, null, null, null, null, null, '2001-12-25 00:00:00', '1', null, '白萍', '0');
INSERT INTO `app_user` VALUES ('127', 'wuliping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wuliping@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2010-06-12 00:00:00', '1', null, '吴丽萍', '0');
INSERT INTO `app_user` VALUES ('128', 'zhangjingli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjingli@shopin.cn', '41', '驻店财务', '', '', '', '', '', '', '2005-08-22 00:00:00', '1', null, '张景丽', '0');
INSERT INTO `app_user` VALUES ('129', 'zhangjianqin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjianqin@shopin.cn', '41', '驻店财务', null, null, null, null, null, null, '2002-12-26 00:00:00', '1', null, '张建勤', '0');
INSERT INTO `app_user` VALUES ('130', 'wangyanan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangyanan@shopin.cn', '41', '驻店财务', null, null, null, null, null, null, '2008-03-22 00:00:00', '1', null, '王亚楠', '0');
INSERT INTO `app_user` VALUES ('131', 'hanjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hanjing@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2007-09-24 00:00:00', '1', null, '韩晶', '0');
INSERT INTO `app_user` VALUES ('132', 'yangjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangjing@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2008-12-27 00:00:00', '1', null, '杨静', '0');
INSERT INTO `app_user` VALUES ('133', 'panlu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'panlu@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2011-06-22 00:00:00', '1', null, '潘璐', '0');
INSERT INTO `app_user` VALUES ('134', 'chenjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenjing@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2007-06-11 00:00:00', '1', null, '陈静', '0');
INSERT INTO `app_user` VALUES ('135', 'huayunqiu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huayunqiu@shopin.cn', '41', '驻店财务', null, null, null, null, null, null, '2002-01-01 00:00:00', '1', null, '华云秋', '0');
INSERT INTO `app_user` VALUES ('136', 'renjia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'renjia@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2008-12-25 00:00:00', '1', null, '任佳', '0');
INSERT INTO `app_user` VALUES ('137', 'luyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'luyuan@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2009-06-03 00:00:00', '1', null, '路媛', '0');
INSERT INTO `app_user` VALUES ('138', 'zhuangyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhuangyi@shopin.cn', '41', '驻店财务', null, null, null, null, null, null, '2003-12-26 00:00:00', '1', null, '庄怡', '0');
INSERT INTO `app_user` VALUES ('139', 'wangxia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangxia@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2008-12-10 00:00:00', '1', null, '王霞', '0');
INSERT INTO `app_user` VALUES ('140', 'zhangshaokun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangshaokun@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2003-09-10 00:00:00', '1', null, '张少琨', '0');
INSERT INTO `app_user` VALUES ('141', 'hanxu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hanxu@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2010-09-28 00:00:00', '1', null, '韩旭', '0');
INSERT INTO `app_user` VALUES ('142', 'tanlu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tanlu@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2012-01-11 00:00:00', '1', null, '谭璐', '0');
INSERT INTO `app_user` VALUES ('143', 'cuilin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'cuilin@shopin.cn', '41', '驻店财务', null, null, null, null, null, null, '2006-03-24 00:00:00', '1', null, '崔琳', '0');
INSERT INTO `app_user` VALUES ('144', 'guanmingjie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guanmingjie@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2010-04-01 00:00:00', '1', null, '关铭杰', '0');
INSERT INTO `app_user` VALUES ('145', 'duchunhua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'duchunhua@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2007-12-28 00:00:00', '1', null, '杜春花', '0');
INSERT INTO `app_user` VALUES ('146', 'wangjinghong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangjinghong@shopin.cn', '41', '驻店财务', null, null, null, null, null, null, '2005-09-05 00:00:00', '1', null, '王京红', '0');
INSERT INTO `app_user` VALUES ('147', 'zhaojingjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaojingjing@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2007-04-21 00:00:00', '1', null, '赵晶晶', '0');
INSERT INTO `app_user` VALUES ('148', 'sunfei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunfei@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2008-07-22 00:00:00', '1', null, '孙菲', '0');
INSERT INTO `app_user` VALUES ('149', 'sunchunling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunchunling@shopin.cn', '41', '驻店财务', null, null, null, null, null, null, '2002-12-18 00:00:00', '1', null, '孙春玲', '0');
INSERT INTO `app_user` VALUES ('150', 'lixiaocai', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lixiaocai@shopin.cn', '41', '驻店财务', null, null, null, null, null, null, '2005-10-12 00:00:00', '1', null, '李小彩', '0');
INSERT INTO `app_user` VALUES ('151', 'maxiuli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'maxiuli@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2005-08-25 00:00:00', '1', null, '马秀丽', '0');
INSERT INTO `app_user` VALUES ('152', 'zhoujingying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhoujingying@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2010-12-01 00:00:00', '1', null, '周京盈', '0');
INSERT INTO `app_user` VALUES ('153', 'lilindan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lilindan@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2011-07-06 00:00:00', '1', null, '李林丹', '0');
INSERT INTO `app_user` VALUES ('154', 'jiashuqin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jiashuqin@shopin.cn', '41', '驻店财务', null, null, null, null, null, null, '2011-11-23 00:00:00', '1', null, '贾淑芹', '0');
INSERT INTO `app_user` VALUES ('155', 'zhouhonglin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhouhonglin@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2011-09-07 00:00:00', '1', null, '周宏琳', '0');
INSERT INTO `app_user` VALUES ('156', 'ouyangqiongxing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'ouyangqiongxing@shopin.cn', '11', '总监', null, null, null, null, null, null, '2008-12-22 00:00:00', '1', null, '欧阳琼星', '0');
INSERT INTO `app_user` VALUES ('157', 'liuhui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuhui@shopin.cn', '11', '组织与发展经理', '', '', '', '', '', '', '2008-03-14 00:00:00', '1', null, '刘辉', '0');
INSERT INTO `app_user` VALUES ('158', 'liuliyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuliyan@shopin.cn', '11', '招聘与员工管理经理', '', '', '', '', '', '', '2008-03-25 00:00:00', '1', null, '刘丽艳', '0');
INSERT INTO `app_user` VALUES ('159', 'lijing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijing@shopin.cn', '11', '组织与发展专员', '', '', '', '', '', '', '2010-07-01 00:00:00', '1', null, '李静', '0');
INSERT INTO `app_user` VALUES ('160', 'lijinghr', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijinghr@shopin.cn', '11', '薪酬绩效主管', '', '', '', '', '', '', '2011-03-08 00:00:00', '1', null, '李静', '0');
INSERT INTO `app_user` VALUES ('161', 'mengqingnan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mengqingnan@shopin.cn', '11', '高级招聘专员', '', '', '', '', '', '', '2011-09-01 00:00:00', '1', null, '孟庆男', '0');
INSERT INTO `app_user` VALUES ('162', 'liuyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuyang@shopin.cn', '11', '招聘助理', '', '', '', '', '', '', '2010-04-28 00:00:00', '1', null, '刘洋', '0');
INSERT INTO `app_user` VALUES ('163', 'bianlijuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'bianlijuan@shopin.cn', '11', '薪酬绩效经理', '', '', '', '', '', '', '2010-06-09 00:00:00', '1', null, '卞莉娟', '0');
INSERT INTO `app_user` VALUES ('164', 'wangyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangyan@shopin.cn', '11', '培训助理', '', '', '', '', '', '', '2010-11-10 00:00:00', '1', null, '王燕', '0');
INSERT INTO `app_user` VALUES ('165', 'gujianhua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gujianhua@shopin.cn', '58', '总监', null, null, null, null, null, null, '2009-02-23 00:00:00', '1', null, '顾建华', '0');
INSERT INTO `app_user` VALUES ('166', 'liuzhiyong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuzhiyong@shopin.cn', '4', '项目拓展经理', null, null, null, null, null, null, '2011-07-06 00:00:00', '1', null, '刘志勇', '0');
INSERT INTO `app_user` VALUES ('167', 'haoweiwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'haoweiwei@shopin.cn', '4', '高级拓展专员', null, null, null, null, null, null, '2008-07-21 00:00:00', '1', null, '郝维维', '0');
INSERT INTO `app_user` VALUES ('168', 'lizhijie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lizhijie@shopin.cn', '28', '第一负责人', null, null, null, null, null, null, '2009-08-26 00:00:00', '1', null, '李志杰', '0');
INSERT INTO `app_user` VALUES ('169', 'panchengjian', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'panchengjian@shopin.cn', '48', '物流经理（第一负责人）', null, null, null, null, null, null, '2010-12-22 00:00:00', '1', null, '潘承剑', '0');
INSERT INTO `app_user` VALUES ('170', 'zhangzhihua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangzhihua@shopin.cn', '48', '高级仓储现场管理主管', null, null, null, null, null, null, '2009-12-23 00:00:00', '1', null, '张志华', '0');
INSERT INTO `app_user` VALUES ('171', 'gaozhiyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gaozhiyi@shopin.cn', '48', '驻店物流主管', null, null, null, null, null, null, '2008-03-07 00:00:00', '1', null, '高知亦', '0');
INSERT INTO `app_user` VALUES ('172', 'xingtao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xingtao@shopin.cn', '48', '高级生产线主管', null, null, null, null, null, null, '2010-06-18 00:00:00', '1', null, '邢涛', '0');
INSERT INTO `app_user` VALUES ('173', 'mengfeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mengfeng@shopin.cn', '48', '驻店物流主管', null, null, null, null, null, null, '2010-07-07 00:00:00', '1', null, '孟丰', '0');
INSERT INTO `app_user` VALUES ('174', 'jiangxuemin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jiangxuemin@shopin.cn', '48', '驻店物流主管', null, null, null, null, null, null, '2005-11-07 00:00:00', '1', null, '蒋学民', '0');
INSERT INTO `app_user` VALUES ('175', 'zhangjie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjie@shopin.cn', '48', '驻店物流主管', null, null, null, null, null, null, '2008-09-18 00:00:00', '1', null, '张洁', '0');
INSERT INTO `app_user` VALUES ('176', 'liufu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liufu@shopin.cn', '48', '仓储店物流员', null, null, null, null, null, null, '2010-05-25 00:00:00', '1', null, '刘富', '0');
INSERT INTO `app_user` VALUES ('177', 'houhongxue', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'houhongxue@shopin.cn', '48', '驻店物流主管', null, null, null, null, null, null, '2010-06-12 00:00:00', '1', null, '侯洪学', '0');
INSERT INTO `app_user` VALUES ('178', 'zhangxu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangxu@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2010-06-12 00:00:00', '1', null, '张旭', '0');
INSERT INTO `app_user` VALUES ('179', 'guoshuo', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guoshuo@shopin.cn', '48', '中关村店物流员', null, null, null, null, null, null, '2010-06-25 00:00:00', '1', null, '郭硕', '0');
INSERT INTO `app_user` VALUES ('180', 'xujin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xujin@shopin.cn', '48', '中关村店物流员', null, null, null, null, null, null, '2010-07-01 00:00:00', '1', null, '徐进', '0');
INSERT INTO `app_user` VALUES ('181', 'chenhanchong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenhanchong@shopin.cn', '48', '中关村店物流员', null, null, null, null, null, null, '2010-07-07 00:00:00', '1', null, '陈汉冲', '0');
INSERT INTO `app_user` VALUES ('182', 'baijieshi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'baijieshi@shopin.cn', '48', '亚店物流员', null, null, null, null, null, null, '2010-09-08 00:00:00', '1', null, '白洁石', '0');
INSERT INTO `app_user` VALUES ('183', 'shaofang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shaofang@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2010-09-28 00:00:00', '1', null, '邵方', '0');
INSERT INTO `app_user` VALUES ('184', 'hanming', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hanming@shopin.cn', '48', '来广营店物流员', null, null, null, null, null, null, '2010-11-03 00:00:00', '1', null, '韩明', '0');
INSERT INTO `app_user` VALUES ('185', 'fujinghong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fujinghong@shopin.cn', '48', '五棵松店物流员', null, null, null, null, null, null, '2010-11-11 00:00:00', '1', null, '付景红', '0');
INSERT INTO `app_user` VALUES ('186', 'chengxiaohong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chengxiaohong@shopin.cn', '48', '五棵松店物流员', null, null, null, null, null, null, '2010-12-08 00:00:00', '1', null, '程小红', '0');
INSERT INTO `app_user` VALUES ('187', 'zhangguixia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangguixia@shopin.cn', '48', '五棵松店物流员', null, null, null, null, null, null, '2010-12-15 00:00:00', '1', null, '张桂霞', '0');
INSERT INTO `app_user` VALUES ('188', 'xiamengqi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xiamengqi@shopin.cn', '48', '退货主管', null, null, null, null, null, null, '2010-12-29 00:00:00', '1', null, '夏梦祺', '0');
INSERT INTO `app_user` VALUES ('189', 'zhaoyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaoyi@shopin.cn', '48', '来广营店物流员', null, null, null, null, null, null, '2010-12-31 00:00:00', '1', null, '赵毅', '0');
INSERT INTO `app_user` VALUES ('190', 'liquan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liquan@shopin.cn', '48', '中关村店物流员', null, null, null, null, null, null, '2010-12-31 00:00:00', '1', null, '李泉', '0');
INSERT INTO `app_user` VALUES ('191', 'wenliyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wenliyuan@shopin.cn', '48', '三里河店物流员', null, null, null, null, null, null, '2010-12-31 00:00:00', '1', null, '温丽媛', '0');
INSERT INTO `app_user` VALUES ('192', 'zhaojie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaojie@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2011-01-12 00:00:00', '1', null, '赵杰', '0');
INSERT INTO `app_user` VALUES ('193', 'yinxuejiao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yinxuejiao@shopin.cn', '48', '亚店物流员', null, null, null, null, null, null, '2010-09-01 00:00:00', '1', null, '尹雪姣', '0');
INSERT INTO `app_user` VALUES ('194', 'zhangxun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangxun@shopin.cn', '48', '五棵松店物流员', null, null, null, null, null, null, '2010-11-24 00:00:00', '1', null, '张珣', '0');
INSERT INTO `app_user` VALUES ('195', 'lixuming', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lixuming@shopin.cn', '48', '亚店物流员', null, null, null, null, null, null, '2011-03-16 00:00:00', '1', null, '李旭明', '0');
INSERT INTO `app_user` VALUES ('196', 'zhengweiguo', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhengweiguo@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2011-03-23 00:00:00', '1', null, '郑伟国', '0');
INSERT INTO `app_user` VALUES ('197', 'zhaoyaling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaoyaling@shopin.cn', '48', '仓储现场管理助理', null, null, null, null, null, null, '2011-04-27 00:00:00', '1', null, '赵亚玲', '0');
INSERT INTO `app_user` VALUES ('198', 'hanlei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hanlei@shopin.cn', '48', '仓储店物流员', null, null, null, null, null, null, '2011-05-18 00:00:00', '1', null, '韩雷', '0');
INSERT INTO `app_user` VALUES ('199', 'cuihuihai', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'cuihuihai@shopin.cn', '48', '来广营店物流员', null, null, null, null, null, null, '2011-05-25 00:00:00', '1', null, '崔慧海', '0');
INSERT INTO `app_user` VALUES ('200', 'jiangyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jiangyang@shopin.cn', '48', '仓储店物流员', null, null, null, null, null, null, '2011-04-27 00:00:00', '1', null, '江洋', '0');
INSERT INTO `app_user` VALUES ('201', 'limeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'limeng@shopin.cn', '48', '来广营店物流员', null, null, null, null, null, null, '2011-06-01 00:00:00', '1', null, '李萌', '0');
INSERT INTO `app_user` VALUES ('202', 'liwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liwei@shopin.cn', '48', '自采商品库房仓储助理', null, null, null, null, null, null, '2011-06-01 00:00:00', '1', null, '李伟', '0');
INSERT INTO `app_user` VALUES ('203', 'songguangda', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'songguangda@shopin.cn', '48', '中关村店物流员', null, null, null, null, null, null, '2011-06-01 00:00:00', '1', null, '宋广大', '0');
INSERT INTO `app_user` VALUES ('204', 'fanhaowei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fanhaowei@shopin.cn', '48', '亚店物流员', null, null, null, null, null, null, '2011-06-15 00:00:00', '1', null, '樊昊威', '0');
INSERT INTO `app_user` VALUES ('205', 'yangying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangying@shopin.cn', '48', '亚店物流员', null, null, null, null, null, null, '2008-09-23 00:00:00', '1', null, '杨迎', '0');
INSERT INTO `app_user` VALUES ('206', 'liuming', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuming@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2011-07-06 00:00:00', '1', null, '刘明', '0');
INSERT INTO `app_user` VALUES ('207', 'chengwen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chengwen@shopin.cn', '48', '仓储店物流员', null, null, null, null, null, null, '2011-07-13 00:00:00', '1', null, '程文', '0');
INSERT INTO `app_user` VALUES ('208', 'liqiangqiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liqiangqiang@shopin.cn', '48', '三里河店物流员', null, null, null, null, null, null, '2011-07-21 00:00:00', '1', null, '李强强', '0');
INSERT INTO `app_user` VALUES ('209', 'zhangheng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangheng@shopin.cn', '48', '仓储现场管理助理', null, null, null, null, null, null, '2011-07-27 00:00:00', '1', null, '张恒', '0');
INSERT INTO `app_user` VALUES ('210', 'liuchangde', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuchangde@shopin.cn', '48', '三里河店物流员', null, null, null, null, null, null, '2011-09-23 00:00:00', '1', null, '刘长德', '0');
INSERT INTO `app_user` VALUES ('211', 'liuwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuwei@shopin.cn', '48', '来广营店物流员', null, null, null, null, null, null, '2011-09-23 00:00:00', '1', null, '刘威', '0');
INSERT INTO `app_user` VALUES ('212', 'wanglei001', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanglei001@shopin.cn', '48', '五棵松店物流员', null, null, null, null, null, null, '2011-09-28 00:00:00', '1', null, '王蕾', '0');
INSERT INTO `app_user` VALUES ('213', 'xiexinxin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xiexinxin@shopin.cn', '48', '三里河店物流员', null, null, null, null, null, null, '2011-10-19 00:00:00', '1', null, '谢心心', '0');
INSERT INTO `app_user` VALUES ('214', 'xiewenbin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xiewenbin@shopin.cn', '48', '亚店物流员', null, null, null, null, null, null, '2011-10-24 00:00:00', '1', null, '谢文斌', '0');
INSERT INTO `app_user` VALUES ('215', 'liuyingying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuyingying@shopin.cn', '48', '仓储店物流员', null, null, null, null, null, null, '2011-10-24 00:00:00', '1', null, '刘影影', '0');
INSERT INTO `app_user` VALUES ('216', 'wujianmei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wujianmei@shopin.cn', '48', '退货专员', null, null, null, null, null, null, '2011-11-09 00:00:00', '1', null, '武建美', '0');
INSERT INTO `app_user` VALUES ('217', 'wangman', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangman@shopin.cn', '48', '信息主管', null, null, null, null, null, null, '2011-11-09 00:00:00', '1', null, '王漫', '0');
INSERT INTO `app_user` VALUES ('218', 'jiafengying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jiafengying@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2011-11-09 00:00:00', '1', null, '贾凤英', '0');
INSERT INTO `app_user` VALUES ('219', 'yangliyong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangliyong@shopin.cn', '48', '自采商品库房主管', null, null, null, null, null, null, '2011-11-16 00:00:00', '1', null, '杨立永', '0');
INSERT INTO `app_user` VALUES ('220', 'longyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'longyan@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2011-11-23 00:00:00', '1', null, '龙艳', '0');
INSERT INTO `app_user` VALUES ('221', 'wangqiushi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangqiushi@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2011-11-23 00:00:00', '1', null, '王秋实', '0');
INSERT INTO `app_user` VALUES ('222', 'zhangyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyang@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2011-12-14 00:00:00', '1', null, '张洋', '0');
INSERT INTO `app_user` VALUES ('223', 'guoxuejing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guoxuejing@shopin.cn', '48', '五棵松店物流员', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '果雪静', '0');
INSERT INTO `app_user` VALUES ('224', 'yepeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yepeng@shopin.cn', '48', '自采商品库房仓储助理', null, null, null, null, null, null, '2011-12-21 00:00:00', '1', null, '叶芃', '0');
INSERT INTO `app_user` VALUES ('225', 'qiqi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qiqi@shopin.cn', '48', '自采商品库房仓储助理', null, null, null, null, null, null, '2011-12-21 00:00:00', '1', null, '齐琦', '0');
INSERT INTO `app_user` VALUES ('226', 'gaokuijian', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gaokuijian@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2012-01-06 00:00:00', '1', null, '高奎建', '0');
INSERT INTO `app_user` VALUES ('227', 'fengbin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fengbin@shopin.cn', '48', '生产线操作工', null, null, null, null, null, null, '2012-01-13 00:00:00', '1', null, '封斌', '0');
INSERT INTO `app_user` VALUES ('228', 'tianyina', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tianyina@shopin.cn', '47', '高级经理（第一负责人）', null, null, null, null, null, null, '2007-07-11 00:00:00', '1', null, '田怡娜', '0');
INSERT INTO `app_user` VALUES ('229', 'yuanyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yuanyuan@shopin.cn', '47', '商品规划运营主管', null, null, null, null, null, null, '2010-03-26 00:00:00', '1', null, '袁源', '0');
INSERT INTO `app_user` VALUES ('230', 'zhangxin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangxin@shopin.cn', '47', '商品规划运营专员', null, null, null, null, null, null, '2010-10-28 00:00:00', '1', null, '张鑫', '0');
INSERT INTO `app_user` VALUES ('231', 'wangshuai', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangshuai@shopin.cn', '47', '商品规划运营专员', null, null, null, null, null, null, '2011-04-13 00:00:00', '1', null, '王帅', '0');
INSERT INTO `app_user` VALUES ('232', 'sunhongying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunhongying@shopin.cn', '47', '商品规划运营主管', null, null, null, null, null, null, '2009-08-31 00:00:00', '1', null, '孙洪英', '0');
INSERT INTO `app_user` VALUES ('233', 'pengye', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'pengye@shopin.cn', '47', '商品规划运营专员', null, null, null, null, null, null, '2011-03-23 00:00:00', '1', null, '彭烨', '0');
INSERT INTO `app_user` VALUES ('234', 'huangxin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huangxin@shopin.cn', '47', '商品规划运营专员', null, null, null, null, null, null, '2011-08-03 00:00:00', '1', null, '黄鑫', '0');
INSERT INTO `app_user` VALUES ('235', 'lichenyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lichenyang@shopin.cn', '47', '商品组织专员', null, null, null, null, null, null, '2011-08-29 00:00:00', '1', null, '李晨阳', '0');
INSERT INTO `app_user` VALUES ('236', 'liyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liyuan@shopin.cn', '47', '商品规划运营专员', null, null, null, null, null, null, '2010-04-23 00:00:00', '1', null, '李媛', '0');
INSERT INTO `app_user` VALUES ('237', 'tanfang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tanfang@shopin.cn', '47', '商品组织专员', null, null, null, null, null, null, '2011-10-26 00:00:00', '1', null, '谭芳', '0');
INSERT INTO `app_user` VALUES ('238', 'zhoujie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhoujie@shopin.cn', '47', '商品规划运营专员', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '周婕', '0');
INSERT INTO `app_user` VALUES ('239', 'wangyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangyang@shopin.cn', '61', '拍照部经理', null, null, null, null, null, null, '2009-06-03 00:00:00', '1', null, '王洋', '0');
INSERT INTO `app_user` VALUES ('240', 'wangyananpz', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangyananpz@shopin.cn', '61', '摄影编辑主管', null, null, null, null, null, null, '2010-01-01 00:00:00', '1', null, '王亚男', '0');
INSERT INTO `app_user` VALUES ('241', 'zhangmeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangmeng@shopin.cn', '61', '摄影编辑主管', null, null, null, null, null, null, '2009-12-01 00:00:00', '1', null, '张萌', '0');
INSERT INTO `app_user` VALUES ('242', 'liuhongjuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuhongjuan@shopin.cn', '61', '摄影编辑主管', null, null, null, null, null, null, '2010-01-01 00:00:00', '1', null, '刘红娟', '0');
INSERT INTO `app_user` VALUES ('243', 'wangjiajia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangjiajia@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2010-09-01 00:00:00', '1', null, '王佳佳', '0');
INSERT INTO `app_user` VALUES ('244', 'wangxinshuang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangxinshuang@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2011-01-19 00:00:00', '1', null, '王新爽', '0');
INSERT INTO `app_user` VALUES ('245', 'zhangge', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangge@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2011-04-27 00:00:00', '1', null, '张鸽', '0');
INSERT INTO `app_user` VALUES ('246', 'shangdi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shangdi@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2011-07-21 00:00:00', '1', null, '商迪', '0');
INSERT INTO `app_user` VALUES ('247', 'zhangtanmei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangtanmei@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2011-09-21 00:00:00', '1', null, '张谭美', '0');
INSERT INTO `app_user` VALUES ('248', 'matianjun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'matianjun@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2011-09-21 00:00:00', '1', null, '马天俊', '0');
INSERT INTO `app_user` VALUES ('249', 'wanghui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanghui@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2011-10-09 00:00:00', '1', null, '王辉', '0');
INSERT INTO `app_user` VALUES ('250', 'xulina', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xulina@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2011-11-16 00:00:00', '1', null, '徐丽娜', '0');
INSERT INTO `app_user` VALUES ('251', 'fengbo', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fengbo@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2011-12-28 00:00:00', '1', null, '冯博', '0');
INSERT INTO `app_user` VALUES ('252', 'laixiaoyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'laixiaoyi@shopin.cn', '62', '总监', null, null, null, null, null, null, '2011-09-19 00:00:00', '1', null, '赖晓毅', '0');
INSERT INTO `app_user` VALUES ('253', 'lichao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lichao@shopin.cn', '62', '联盟拓展主管', null, null, null, null, null, null, '2009-12-23 00:00:00', '1', null, '李超', '0');
INSERT INTO `app_user` VALUES ('254', 'weiting', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'weiting@shopin.cn', '62', '搜索优化师', null, null, null, null, null, null, '2010-01-04 00:00:00', '1', null, '魏婷', '0');
INSERT INTO `app_user` VALUES ('255', 'liting', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liting@shopin.cn', '62', '口碑营销助理', null, null, null, null, null, null, '2009-05-13 00:00:00', '1', null, '李婷', '0');
INSERT INTO `app_user` VALUES ('256', 'ningjun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'ningjun@shopin.cn', '63', '高级经理（第一负责人）', null, null, null, null, null, null, '2009-12-16 00:00:00', '1', null, '宁军', '0');
INSERT INTO `app_user` VALUES ('257', 'yinningning', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yinningning@shopin.cn', '63', '在线销售及初级客服代表', null, null, null, null, null, null, '2009-08-05 00:00:00', '1', null, '尹宁宁', '0');
INSERT INTO `app_user` VALUES ('258', 'chenjianfang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenjianfang@shopin.cn', '63', '在线销售及初级客服代表', null, null, null, null, null, null, '2011-07-27 00:00:00', '1', null, '陈建芳', '0');
INSERT INTO `app_user` VALUES ('259', 'dongzhuoran', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dongzhuoran@shopin.cn', '63', '在线销售及初级客服代表', null, null, null, null, null, null, '2011-12-28 00:00:00', '1', null, '董卓然', '0');
INSERT INTO `app_user` VALUES ('260', 'xuehuayan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xuehuayan@shopin.cn', '63', '在线销售及初级客服代表', null, null, null, null, null, null, '2012-01-04 00:00:00', '1', null, '薛花艳', '0');
INSERT INTO `app_user` VALUES ('261', 'liuchenli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuchenli@shopin.cn', '63', '店铺营销主管', null, null, null, null, null, null, '2011-08-29 00:00:00', '1', null, '刘辰力', '0');
INSERT INTO `app_user` VALUES ('262', 'yanxiaoxiao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yanxiaoxiao@shopin.cn', '63', '在线销售及初级客服代表', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '闫笑笑', '0');
INSERT INTO `app_user` VALUES ('263', 'yangwenhui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangwenhui@shopin.cn', '64', '数据分析员', null, null, null, null, null, null, '2011-07-21 00:00:00', '1', null, '杨文慧', '0');
INSERT INTO `app_user` VALUES ('264', 'liuxiaoling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuxiaoling@shopin.cn', '64', '美工', null, null, null, null, null, null, '2011-07-06 00:00:00', '1', null, '刘晓玲', '0');
INSERT INTO `app_user` VALUES ('265', 'yangxin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangxin@shopin.cn', '64', '网页设计师', null, null, null, null, null, null, '2009-09-07 00:00:00', '1', null, '杨鑫', '0');
INSERT INTO `app_user` VALUES ('266', 'liuanbao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuanbao@shopin.cn', '64', '高级网页设计师', null, null, null, null, null, null, '2009-12-30 00:00:00', '1', null, '刘安宝', '0');
INSERT INTO `app_user` VALUES ('267', 'wangchao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangchao@shopin.cn', '64', '美工', null, null, null, null, null, null, '2011-11-23 00:00:00', '1', null, '王超', '0');
INSERT INTO `app_user` VALUES ('268', 'wanghongyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanghongyan@shopin.cn', '49', '客服经理', null, null, null, null, null, null, '2010-06-23 00:00:00', '1', null, '王红艳', '0');
INSERT INTO `app_user` VALUES ('269', 'andongling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'andongling@shopin.cn', '49', '客服主管', null, null, null, null, null, null, '2007-06-18 00:00:00', '1', null, '安冬玲', '0');
INSERT INTO `app_user` VALUES ('270', 'hanfei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hanfei@shopin.cn', '49', '客服主管', null, null, null, null, null, null, '2010-07-21 00:00:00', '1', null, '韩菲', '0');
INSERT INTO `app_user` VALUES ('271', 'luyixin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'luyixin@shopin.cn', '49', '客服组长', null, null, null, null, null, null, '2008-09-22 00:00:00', '1', null, '卢一新', '0');
INSERT INTO `app_user` VALUES ('272', 'liuxiaojie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuxiaojie@shopin.cn', '49', '初级客服代表-邮件留言专员', null, null, null, null, null, null, '2010-03-01 00:00:00', '1', null, '刘晓杰', '0');
INSERT INTO `app_user` VALUES ('273', 'zhaojiale', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaojiale@shopin.cn', '49', '初级客服代表-电话专员', null, null, null, null, null, null, '2010-03-01 00:00:00', '1', null, '赵佳乐', '0');
INSERT INTO `app_user` VALUES ('274', 'zhangwenjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangwenjing@shopin.cn', '49', '客服组长', '', '', '', '', '', '', '2010-03-08 00:00:00', '1', null, '张文静', '0');
INSERT INTO `app_user` VALUES ('275', 'caozhiling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'caozhiling@shopin.cn', '49', '初级客服代表', null, null, null, null, null, null, '2010-04-01 00:00:00', '1', null, '曹志玲', '0');
INSERT INTO `app_user` VALUES ('276', 'zhangmiaomiao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangmiaomiao@shopin.cn', '49', '客服组长', '', '', '', '', '', '', '2010-07-21 00:00:00', '1', null, '张苗苗', '0');
INSERT INTO `app_user` VALUES ('277', 'huanglina', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huanglina@shopin.cn', '49', '客服助理', null, null, null, null, null, null, '2010-10-27 00:00:00', '1', null, '黄丽娜', '0');
INSERT INTO `app_user` VALUES ('278', 'wangbing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangbing@shopin.cn', '49', '初级客服代表-电话专员', null, null, null, null, null, null, '2010-11-18 00:00:00', '1', null, '王冰', '0');
INSERT INTO `app_user` VALUES ('279', 'guchen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guchen@shopin.cn', '49', '初级客服代表-催款专员', null, null, null, null, null, null, '2011-01-19 00:00:00', '1', null, '顾晨', '0');
INSERT INTO `app_user` VALUES ('280', 'zhanglin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhanglin@shopin.cn', '49', '初级客服代表-投诉专员', null, null, null, null, null, null, '2011-04-27 00:00:00', '1', null, '张琳', '0');
INSERT INTO `app_user` VALUES ('281', 'yewen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yewen@shopin.cn', '49', '客服助理', null, null, null, null, null, null, '2011-05-25 00:00:00', '1', null, '叶文', '0');
INSERT INTO `app_user` VALUES ('282', 'hujing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hujing@shopin.cn', '49', '初级客服代表-邮件留言专员', null, null, null, null, null, null, '2011-06-07 00:00:00', '1', null, '胡静', '0');
INSERT INTO `app_user` VALUES ('283', 'zuoxinai', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', '左xinai@shopin.cn', '49', '客服助理', null, null, null, null, null, null, '2011-09-01 00:00:00', '1', null, '左心爱', '0');
INSERT INTO `app_user` VALUES ('284', 'gongpeisha', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gongpeisha@shopin.cn', '49', '客服助理', null, null, null, null, null, null, '2011-10-12 00:00:00', '1', null, '宫佩莎', '0');
INSERT INTO `app_user` VALUES ('285', 'liuranran', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuranran@shopin.cn', '49', '客服助理', null, null, null, null, null, null, '2011-10-26 00:00:00', '1', null, '刘冉冉', '0');
INSERT INTO `app_user` VALUES ('286', 'zhaoshuai', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaoshuai@shopin.cn', '49', '客服助理', null, null, null, null, null, null, '2011-11-02 00:00:00', '1', null, '赵帅', '0');
INSERT INTO `app_user` VALUES ('287', 'zhengjindan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhengjindan@shopin.cn', '49', '客服助理', null, null, null, null, null, null, '2011-11-16 00:00:00', '1', null, '郑金丹', '0');
INSERT INTO `app_user` VALUES ('288', 'xiaoxue', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xiaoxue@shopin.cn', '49', '初级客服代表', null, null, null, null, null, null, '2011-12-07 00:00:00', '1', null, '肖雪', '0');
INSERT INTO `app_user` VALUES ('289', 'jianghanfeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jianghanfeng@shopin.cn', '49', '初级客服代表', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '姜翰峰', '0');
INSERT INTO `app_user` VALUES ('290', 'zhangyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyan@shopin.cn', '52', '流程专员', null, null, null, null, null, null, '2008-04-07 00:00:00', '1', null, '张艳', '0');
INSERT INTO `app_user` VALUES ('291', 'yangjunhui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangjunhui@shopin.cn', '53', '高级ERP经理', null, null, null, null, null, null, '2011-02-28 00:00:00', '1', null, '杨君慧', '0');
INSERT INTO `app_user` VALUES ('292', 'yangqi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangqi@shopin.cn', '54', 'IT运维经理', null, null, null, null, null, null, '2009-12-16 00:00:00', '1', null, '杨琦', '0');
INSERT INTO `app_user` VALUES ('293', 'kangruijiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'kangruijiang@shopin.cn', '54', 'IT运维主管', null, null, null, null, null, null, '2008-09-22 00:00:00', '1', null, '亢瑞江', '0');
INSERT INTO `app_user` VALUES ('294', 'jiabofu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jiabofu@shopin.cn', '54', '运维工程师', null, null, null, null, null, null, '2007-01-15 00:00:00', '1', null, '贾伯福', '0');
INSERT INTO `app_user` VALUES ('295', 'huangtaiping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huangtaiping@shopin.cn', '55', '高级软件工程师', null, null, null, null, null, null, '2009-03-02 00:00:00', '1', null, '黄太平', '0');
INSERT INTO `app_user` VALUES ('296', 'liuqingwen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuqingwen@shopin.cn', '55', '高级软件工程师', null, null, null, null, null, null, '2009-03-02 00:00:00', '1', null, '刘庆文', '0');
INSERT INTO `app_user` VALUES ('297', 'lijinghua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijinghua@shopin.cn', '55', '高级软件工程师', null, null, null, null, null, null, '2010-12-08 00:00:00', '1', null, '李竟华', '0');
INSERT INTO `app_user` VALUES ('298', 'minxiaorong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'minxiaorong@shopin.cn', '55', '高级软件工程师', null, null, null, null, null, null, '2011-01-06 00:00:00', '1', null, '闵晓荣', '0');
INSERT INTO `app_user` VALUES ('299', 'mayong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mayong@shopin.cn', '55', '软件工程师', null, null, null, null, null, null, '2011-03-08 00:00:00', '1', null, '马勇', '0');
INSERT INTO `app_user` VALUES ('300', 'baijianyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'baijianyi@shopin.cn', '54', '高级系统工程师', null, null, null, null, null, null, '2011-03-08 00:00:00', '1', null, '白健毅', '0');
INSERT INTO `app_user` VALUES ('301', 'zhangpeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangpeng@shopin.cn', '55', '高级技术经理', null, null, null, null, null, null, '2011-05-04 00:00:00', '1', null, '张鹏', '0');
INSERT INTO `app_user` VALUES ('302', 'luxiangxing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'luxiangxing@shopin.cn', '55', '资深架构工程师（管理职）', null, null, null, null, null, null, '2011-05-04 00:00:00', '1', null, '陆湘星', '0');
INSERT INTO `app_user` VALUES ('303', 'haowenchao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'haowenchao@shopin.cn', '55', '高级软件工程师', null, null, null, null, null, null, '2011-05-04 00:00:00', '1', null, '郝文超', '0');
INSERT INTO `app_user` VALUES ('304', 'tongjunpeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tongjunpeng@shopin.cn', '55', '高级软件工程师', '', '', '', '', '', '', '2011-05-04 00:00:00', '1', null, '童俊彭', '0');
INSERT INTO `app_user` VALUES ('305', 'huangchunmei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huangchunmei@shopin.cn', '56', '高级产品经理', null, null, null, null, null, null, '2011-06-01 00:00:00', '1', null, '黄春梅', '0');
INSERT INTO `app_user` VALUES ('306', 'gaoxingang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gaoxingang@shopin.cn', '55', '高级数据库架构师', null, null, null, null, null, null, '2011-06-15 00:00:00', '1', null, '高新刚', '0');
INSERT INTO `app_user` VALUES ('307', 'lizhengbin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lizhengbin@shopin.cn', '54', '运维工程师', null, null, null, null, null, null, '2011-07-11 00:00:00', '1', null, '李正斌', '0');
INSERT INTO `app_user` VALUES ('308', 'quzhe', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'quzhe@shopin.cn', '54', '运维工程师', null, null, null, null, null, null, '2011-07-06 00:00:00', '1', null, '曲喆', '0');
INSERT INTO `app_user` VALUES ('309', 'wuyunwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wuyunwei@shopin.cn', '55', '高级PHP开发经理', null, null, null, null, null, null, '2011-07-13 00:00:00', '1', null, '吴韵卫', '0');
INSERT INTO `app_user` VALUES ('310', 'wudejun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wudejun@shopin.cn', '52', '高级流程经理', null, null, null, null, null, null, '2011-07-13 00:00:00', '1', null, '吴德俊', '0');
INSERT INTO `app_user` VALUES ('311', 'guanshiqiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guanshiqiang@shopin.cn', '55', '高级软件工程师', '', '', '', '', '', '', '2011-08-03 00:00:00', '1', null, '关世强', '0');
INSERT INTO `app_user` VALUES ('312', 'zhangyana', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyana@shopin.cn', '55', '数据库架构师', null, null, null, null, null, null, '2011-08-03 00:00:00', '1', null, '张亚娜', '0');
INSERT INTO `app_user` VALUES ('313', 'zhujianhua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhujianhua@shopin.cn', '54', '高级网络工程师', null, null, null, null, null, null, '2011-09-01 00:00:00', '1', null, '朱建华', '0');
INSERT INTO `app_user` VALUES ('314', 'lichun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lichun@shopin.cn', '54', '高级运维工程师', null, null, null, null, null, null, '2011-10-09 00:00:00', '1', null, '李春', '0');
INSERT INTO `app_user` VALUES ('315', 'liangmingjuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liangmingjuan@shopin.cn', '55', '高级软件工程师', null, null, null, null, null, null, '2011-10-11 00:00:00', '1', null, '梁明娟', '0');
INSERT INTO `app_user` VALUES ('316', 'kanglei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'kanglei@shopin.cn', '55', '高级架构工程师', null, null, null, null, null, null, '2011-11-23 00:00:00', '1', null, '亢磊', '0');
INSERT INTO `app_user` VALUES ('317', 'wanglong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanglong@shopin.cn', '55', '高级软件工程师', null, null, null, null, null, null, '2011-11-23 00:00:00', '1', null, '王龙', '0');
INSERT INTO `app_user` VALUES ('318', 'chikejie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chikejie@shopin.cn', '54', '运维工程师', null, null, null, null, null, null, '2011-12-07 00:00:00', '1', null, '迟克杰', '0');
INSERT INTO `app_user` VALUES ('319', 'caizhe', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'caizhe@shopin.cn', '53', 'ERP业务顾问', null, null, null, null, null, null, '2011-12-21 00:00:00', '1', null, '蔡哲', '0');
INSERT INTO `app_user` VALUES ('320', 'shulongfei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shulongfei@shopin.cn', '56', '前端开发工程师', null, null, null, null, null, null, '2011-12-28 00:00:00', '1', null, '舒龙飞', '0');
INSERT INTO `app_user` VALUES ('321', 'wangmeng01', '0', 'a4ayc/80/OGda4BO/1o/V0etpOqiLx1JwB5S3beHW0s=', 'wangmeng01@shopin.cn', '55', '资深架构工程师（管理职）', '', '', '', '', '', '', '2012-01-11 00:00:00', '1', null, '王檬', '0');
INSERT INTO `app_user` VALUES ('322', 'shijia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shijia@shopin.cn', '31', '店长', null, null, null, null, null, null, '2005-08-27 00:00:00', '1', null, '史佳', '0');
INSERT INTO `app_user` VALUES ('323', 'hujianhua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hujianhua@shopin.cn', '54', '运维工程师', '', '', '', '', '', '', '2010-09-21 00:00:00', '1', null, '胡建华', '0');
INSERT INTO `app_user` VALUES ('324', 'hualing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hualing@shopin.cn', '31', '卖场主管', null, null, null, null, null, null, '2010-11-03 00:00:00', '1', null, '华玲', '0');
INSERT INTO `app_user` VALUES ('325', 'helihong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'helihong@shopin.cn', '31', '高级卖场主管', null, null, null, null, null, null, '2011-10-19 00:00:00', '1', null, '何丽红', '0');
INSERT INTO `app_user` VALUES ('326', 'liuxiaoshuang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuxiaoshuang@shopin.cn', '31', '卖场主管', null, null, null, null, null, null, '2011-12-07 00:00:00', '1', null, '刘晓双', '0');
INSERT INTO `app_user` VALUES ('327', 'luwenhui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'luwenhui@shopin.cn', '31', '卖场主管', null, null, null, null, null, null, '2009-11-11 00:00:00', '1', null, '芦文辉', '0');
INSERT INTO `app_user` VALUES ('328', 'zhangqiuling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangqiuling@shopin.cn', '31', '初级库管', null, null, null, null, null, null, '2011-01-26 00:00:00', '1', null, '张秋菱', '0');
INSERT INTO `app_user` VALUES ('329', 'liujiansong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liujiansong@shopin.cn', '31', '初级库管', null, null, null, null, null, null, '2011-04-27 00:00:00', '1', null, '刘剑松', '0');
INSERT INTO `app_user` VALUES ('330', 'huhuilai', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huhuilai@shopin.cn', '31', '客服主管', null, null, null, null, null, null, '2001-01-28 00:00:00', '1', null, '胡惠来', '0');
INSERT INTO `app_user` VALUES ('331', 'yangyanfeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangyanfeng@shopin.cn', '31', '收银领班', null, null, null, null, null, null, '2008-11-19 00:00:00', '1', null, '杨艳凤', '0');
INSERT INTO `app_user` VALUES ('332', 'wanghuifang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanghuifang@shopin.cn', '31', '收银领班', null, null, null, null, null, null, '2011-10-09 00:00:00', '1', null, '王惠芳', '0');
INSERT INTO `app_user` VALUES ('333', 'lijingxia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijingxia@shopin.cn', '31', '中级收银员', null, null, null, null, null, null, '2005-07-04 00:00:00', '1', null, '李景霞', '0');
INSERT INTO `app_user` VALUES ('334', 'fangjianying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fangjianying@shopin.cn', '31', '中级收银员', null, null, null, null, null, null, '2003-12-26 00:00:00', '1', null, '房建英', '0');
INSERT INTO `app_user` VALUES ('335', 'weilize', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'weilize@shopin.cn', '31', '中级收银员', null, null, null, null, null, null, '2006-04-04 00:00:00', '1', null, '魏立泽', '0');
INSERT INTO `app_user` VALUES ('336', 'wangjuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangjuan@shopin.cn', '31', '中级收银员', null, null, null, null, null, null, '2009-06-03 00:00:00', '1', null, '王娟', '0');
INSERT INTO `app_user` VALUES ('337', 'wanghong01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanghong01@shopin.cn', '31', '中级收银员', null, null, null, null, null, null, '2010-05-19 00:00:00', '1', null, '王红', '0');
INSERT INTO `app_user` VALUES ('338', 'mengbin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mengbin@shopin.cn', '31', '中级收银员', null, null, null, null, null, null, '2010-11-03 00:00:00', '1', null, '孟斌', '0');
INSERT INTO `app_user` VALUES ('339', 'zhangsu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangsu@shopin.cn', '31', '初级收银员', null, null, null, null, null, null, '2011-04-02 00:00:00', '1', null, '张苏', '0');
INSERT INTO `app_user` VALUES ('340', 'xiongyina', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xiongyina@shopin.cn', '31', '客服文员', null, null, null, null, null, null, '2008-01-24 00:00:00', '1', null, '熊怡娜', '0');
INSERT INTO `app_user` VALUES ('341', 'dongyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dongyan@shopin.cn', '31', '客服文员', null, null, null, null, null, null, '2009-05-13 00:00:00', '1', null, '董艳', '0');
INSERT INTO `app_user` VALUES ('342', 'kangmeijiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'kangmeijiang@shopin.cn', '31', '客服文员', null, null, null, null, null, null, '2007-11-01 00:00:00', '1', null, '康美姜', '0');
INSERT INTO `app_user` VALUES ('343', 'cuiying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'cuiying@shopin.cn', '31', '客服文员', null, null, null, null, null, null, '2010-06-12 00:00:00', '1', null, '崔颖', '0');
INSERT INTO `app_user` VALUES ('344', 'qianyuanyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qianyuanyuan@shopin.cn', '29', '高级店长', null, null, null, null, null, null, '2005-08-05 00:00:00', '1', null, '钱媛媛', '0');
INSERT INTO `app_user` VALUES ('345', 'chentao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chentao@shopin.cn', '29', '店长助理', null, null, null, null, null, null, '2011-03-08 00:00:00', '1', null, '陈涛', '0');
INSERT INTO `app_user` VALUES ('346', 'renshougang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'renshougang@shopin.cn', '29', '高级卖场主管', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '任守钢', '0');
INSERT INTO `app_user` VALUES ('347', 'panjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'panjing@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2010-12-01 00:00:00', '1', null, '潘晶', '0');
INSERT INTO `app_user` VALUES ('348', 'limingyu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'limingyu@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2009-06-03 00:00:00', '1', null, '李明煜', '0');
INSERT INTO `app_user` VALUES ('349', 'zouran', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zouran@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2008-11-19 00:00:00', '1', null, '邹然', '0');
INSERT INTO `app_user` VALUES ('350', 'sunliping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunliping@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2008-11-25 00:00:00', '1', null, '孙丽苹', '0');
INSERT INTO `app_user` VALUES ('351', 'panyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'panyan@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2010-11-24 00:00:00', '1', null, '潘岩', '0');
INSERT INTO `app_user` VALUES ('352', 'hanqiyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hanqiyang@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2010-12-29 00:00:00', '1', null, '韩启阳', '0');
INSERT INTO `app_user` VALUES ('353', 'xiaoxiao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xiaoxiao@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2010-08-11 00:00:00', '1', null, '肖潇', '0');
INSERT INTO `app_user` VALUES ('354', 'liufang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liufang@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2010-11-10 00:00:00', '1', null, '刘芳', '0');
INSERT INTO `app_user` VALUES ('355', 'zhangyanlgy', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyanlgy@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2010-11-17 00:00:00', '1', null, '张艳', '0');
INSERT INTO `app_user` VALUES ('356', 'yaoxiaoqin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yaoxiaoqin@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2011-07-21 00:00:00', '1', null, '姚小芹', '0');
INSERT INTO `app_user` VALUES ('357', 'wangshuming', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangshuming@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2011-08-03 00:00:00', '1', null, '王淑明', '0');
INSERT INTO `app_user` VALUES ('358', 'wangyina', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangyina@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2008-07-24 00:00:00', '1', null, '王依娜', '0');
INSERT INTO `app_user` VALUES ('359', 'zongzhifang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zongzhifang@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2011-09-01 00:00:00', '1', null, '宗志芳', '0');
INSERT INTO `app_user` VALUES ('360', 'yuming', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yuming@shopin.cn', '66', '标准化训练专员', '', '', '', '', '', '', '2009-01-22 00:00:00', '1', null, '于明', '0');
INSERT INTO `app_user` VALUES ('361', 'wufei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wufei@shopin.cn', '29', '卖场主管', null, null, null, null, null, null, '2007-08-02 00:00:00', '1', null, '吴非', '0');
INSERT INTO `app_user` VALUES ('362', 'lifeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lifeng@shopin.cn', '29', '高级卖场主管', null, null, null, null, null, null, '2012-01-11 00:00:00', '1', null, '李峰', '0');
INSERT INTO `app_user` VALUES ('363', 'meixinmin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'meixinmin@shopin.cn', '29', '中级库管', null, null, null, null, null, null, '2004-07-07 00:00:00', '1', null, '梅新民', '0');
INSERT INTO `app_user` VALUES ('364', 'sunbingning', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunbingning@shopin.cn', '29', '初级库管', null, null, null, null, null, null, '2007-09-18 00:00:00', '1', null, '孙丙宁', '0');
INSERT INTO `app_user` VALUES ('365', 'tanweiming', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tanweiming@shopin.cn', '29', '美工', null, null, null, null, null, null, '2005-05-16 00:00:00', '1', null, '谭伟明', '0');
INSERT INTO `app_user` VALUES ('366', 'sunwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunwei@shopin.cn', '29', '客服主管', null, null, null, null, null, null, '2007-04-05 00:00:00', '1', null, '孙炜', '0');
INSERT INTO `app_user` VALUES ('367', 'zhangyu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyu@shopin.cn', '29', '收银领班', null, null, null, null, null, null, '2010-08-18 00:00:00', '1', null, '张宇', '0');
INSERT INTO `app_user` VALUES ('368', 'liuchengcai', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuchengcai@shopin.cn', '29', '收银领班', null, null, null, null, null, null, '2008-10-08 00:00:00', '1', null, '刘成彩', '0');
INSERT INTO `app_user` VALUES ('369', 'zhangqiuxia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangqiuxia@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2006-10-13 00:00:00', '1', null, '张秋霞', '0');
INSERT INTO `app_user` VALUES ('370', 'dengluyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dengluyan@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2008-05-23 00:00:00', '1', null, '邓路艳', '0');
INSERT INTO `app_user` VALUES ('371', 'zhuyanchen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhuyanchen@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2010-04-07 00:00:00', '1', null, '朱彦臣', '0');
INSERT INTO `app_user` VALUES ('372', 'wangling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangling@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2010-05-15 00:00:00', '1', null, '王玲', '0');
INSERT INTO `app_user` VALUES ('373', 'zhangling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangling@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2010-05-29 00:00:00', '1', null, '张玲', '0');
INSERT INTO `app_user` VALUES ('374', 'wanghuimin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanghuimin@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2010-07-21 00:00:00', '1', null, '王慧敏', '0');
INSERT INTO `app_user` VALUES ('375', 'wujuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wujuan@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2010-10-20 00:00:00', '1', null, '吴娟', '0');
INSERT INTO `app_user` VALUES ('376', 'caona', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'caona@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2010-12-22 00:00:00', '1', null, '曹娜', '0');
INSERT INTO `app_user` VALUES ('377', 'zhanghongyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhanghongyan@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2010-12-24 00:00:00', '1', null, '张红岩', '0');
INSERT INTO `app_user` VALUES ('378', 'zhangxia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangxia@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-03-30 00:00:00', '1', null, '张霞', '0');
INSERT INTO `app_user` VALUES ('379', 'macaixia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'macaixia@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-04-13 00:00:00', '1', null, '马彩霞', '0');
INSERT INTO `app_user` VALUES ('380', 'jiaxiaofang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jiaxiaofang@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-04-20 00:00:00', '1', null, '贾小芳', '0');
INSERT INTO `app_user` VALUES ('381', 'liuyuanyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuyuanyuan@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2010-09-01 00:00:00', '1', null, '刘媛媛', '0');
INSERT INTO `app_user` VALUES ('382', 'zhangaiqing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangaiqing@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-06-07 00:00:00', '1', null, '张爱清', '0');
INSERT INTO `app_user` VALUES ('383', 'cuijinying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'cuijinying@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-06-15 00:00:00', '1', null, '崔金颖', '0');
INSERT INTO `app_user` VALUES ('384', 'chenjianhong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenjianhong@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-07-21 00:00:00', '1', null, '陈剑虹', '0');
INSERT INTO `app_user` VALUES ('385', 'yangdongying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangdongying@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-08-17 00:00:00', '1', null, '杨冬颖', '0');
INSERT INTO `app_user` VALUES ('386', 'liudan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liudan@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-10-24 00:00:00', '1', null, '刘丹', '0');
INSERT INTO `app_user` VALUES ('387', 'zhengyonglan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhengyonglan@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-10-13 00:00:00', '1', null, '郑永兰', '0');
INSERT INTO `app_user` VALUES ('388', 'yuyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yuyan@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-10-26 00:00:00', '1', null, '于岩', '0');
INSERT INTO `app_user` VALUES ('389', 'liudongyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liudongyan@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-10-26 00:00:00', '1', null, '刘冬艳', '0');
INSERT INTO `app_user` VALUES ('390', 'weifei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'weifei@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-10-28 00:00:00', '1', null, '魏霏', '0');
INSERT INTO `app_user` VALUES ('391', 'guoxuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guoxuan@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-10-28 00:00:00', '1', null, '郭轩', '0');
INSERT INTO `app_user` VALUES ('392', 'lihua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lihua@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-11-16 00:00:00', '1', null, '李华', '0');
INSERT INTO `app_user` VALUES ('393', 'liying01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liying01@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-11-16 00:00:00', '1', null, '李颖', '0');
INSERT INTO `app_user` VALUES ('394', 'wangfang01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangfang@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2011-11-23 00:00:00', '1', null, '王芳', '0');
INSERT INTO `app_user` VALUES ('395', 'lina', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lina@shopin.cn', '29', '客服文员', null, null, null, null, null, null, '2011-04-20 00:00:00', '1', null, '李娜', '0');
INSERT INTO `app_user` VALUES ('396', 'chenjing02', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenjing02@shopin.cn', '29', '客服文员', null, null, null, null, null, null, '2011-05-25 00:00:00', '1', null, '陈敬', '0');
INSERT INTO `app_user` VALUES ('397', 'zhangli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangli@shopin.cn', '29', '客服文员', null, null, null, null, null, null, '2011-07-13 00:00:00', '1', null, '张丽', '0');
INSERT INTO `app_user` VALUES ('398', 'fangbing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fangbing@shopin.cn', '29', '防损主管', null, null, null, null, null, null, '2004-02-19 00:00:00', '1', null, '房兵', '0');
INSERT INTO `app_user` VALUES ('399', 'zhanshengyun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhanshengyun@shopin.cn', '29', '防损领班', null, null, null, null, null, null, '2004-12-22 00:00:00', '1', null, '战胜云', '0');
INSERT INTO `app_user` VALUES ('400', 'bisixi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'bisixi@shopin.cn', '29', '防损领班', null, null, null, null, null, null, '2007-09-21 00:00:00', '1', null, '毕四喜', '0');
INSERT INTO `app_user` VALUES ('401', 'xudongbin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xudongbin@shopin.cn', '29', '安保员', null, null, null, null, null, null, '2004-04-27 00:00:00', '1', null, '许东彬', '0');
INSERT INTO `app_user` VALUES ('402', 'zhangzhengwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangzhengwei@shopin.cn', '39', '电工', null, null, null, null, null, null, '2007-07-27 00:00:00', '1', null, '张正伟', '0');
INSERT INTO `app_user` VALUES ('403', 'zhuguozhu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhuguozhu@shopin.cn', '29', '残疾人', null, null, null, null, null, null, '2012-03-06 14:07:36', '1', null, '朱国柱', '0');
INSERT INTO `app_user` VALUES ('404', 'tankun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tankun@shopin.cn', '29', '残疾人', null, null, null, null, null, null, '2012-03-06 14:07:36', '1', null, '檀坤', '0');
INSERT INTO `app_user` VALUES ('405', 'dongfulong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dongfulong@shopin.cn', '29', '残疾人', null, null, null, null, null, null, '2012-03-06 14:07:36', '1', null, '董福龙', '0');
INSERT INTO `app_user` VALUES ('406', 'zhangxin01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangxin01@shopin.cn', '29', '残疾人', null, null, null, null, null, null, '2012-03-06 14:07:36', '1', null, '张昕', '0');
INSERT INTO `app_user` VALUES ('407', 'dingjun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dingjun@shopin.cn', '30', '店长', null, null, null, null, null, null, '2010-09-21 00:00:00', '1', null, '丁军', '0');
INSERT INTO `app_user` VALUES ('408', 'sunjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunjing@shopin.cn', '30', '卖场主管', null, null, null, null, null, null, '2011-04-27 00:00:00', '1', null, '孙静', '0');
INSERT INTO `app_user` VALUES ('409', 'lijing001', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijing001@shopin.cn', '30', '卖场主管', null, null, null, null, null, null, '2010-08-11 00:00:00', '1', null, '李京', '0');
INSERT INTO `app_user` VALUES ('410', 'kongzhen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'kongzhen@shopin.cn', '30', '卖场主管', null, null, null, null, null, null, '2010-10-20 00:00:00', '1', null, '孔振', '0');
INSERT INTO `app_user` VALUES ('411', 'lijing002', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijing002@shopin.cn', '30', '卖场主管', null, null, null, null, null, null, '2008-10-10 00:00:00', '1', null, '李静', '0');
INSERT INTO `app_user` VALUES ('412', 'ansong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'ansong@shopin.cn', '30', '卖场主管', null, null, null, null, null, null, '2010-12-08 00:00:00', '1', null, '安松', '0');
INSERT INTO `app_user` VALUES ('413', 'luoying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'luoying@shopin.cn', '30', '卖场主管', null, null, null, null, null, null, '2011-11-16 00:00:00', '1', null, '骆颖', '0');
INSERT INTO `app_user` VALUES ('414', 'hehui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hehui@shopin.cn', '30', '卖场主管', null, null, null, null, null, null, '2011-11-23 00:00:00', '1', null, '贺辉', '0');
INSERT INTO `app_user` VALUES ('415', 'lijia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijia@shopin.cn', '30', '初级库管', null, null, null, null, null, null, '2010-10-09 00:00:00', '1', null, '李佳', '0');
INSERT INTO `app_user` VALUES ('416', 'liyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liyang@shopin.cn', '30', '初级库管', null, null, null, null, null, null, '2011-09-21 00:00:00', '1', null, '李阳', '0');
INSERT INTO `app_user` VALUES ('417', 'zhangxiaoling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangxiaoling@shopin.cn', '30', '客服主管', null, null, null, null, null, null, '2005-09-15 00:00:00', '1', null, '张晓铃', '0');
INSERT INTO `app_user` VALUES ('418', 'guoxiaoying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guoxiaoying@shopin.cn', '30', '收银领班', null, null, null, null, null, null, '2009-08-26 00:00:00', '1', null, '郭晓莹', '0');
INSERT INTO `app_user` VALUES ('419', 'bufengjuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'bufengjuan@shopin.cn', '30', '中级收银员', null, null, null, null, null, null, '2009-06-17 00:00:00', '1', null, '卜凤娟', '0');
INSERT INTO `app_user` VALUES ('420', 'wangying01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangying@shopin.cn', '30', '中级收银员', null, null, null, null, null, null, '2009-07-29 00:00:00', '1', null, '王颖', '0');
INSERT INTO `app_user` VALUES ('421', 'wangpeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangpeng@shopin.cn', '30', '初级收银员', null, null, null, null, null, null, '2010-09-08 00:00:00', '1', null, '王鹏', '0');
INSERT INTO `app_user` VALUES ('422', 'zhanghanyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhanghanyi@shopin.cn', '30', '初级收银员', null, null, null, null, null, null, '2010-09-08 00:00:00', '1', null, '张晗一', '0');
INSERT INTO `app_user` VALUES ('423', 'weidong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'weidong@shopin.cn', '30', '初级收银员', null, null, null, null, null, null, '2010-09-08 00:00:00', '1', null, '魏栋', '0');
INSERT INTO `app_user` VALUES ('424', 'zhangxiaobing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangxiaobing@shopin.cn', '30', '初级收银员', null, null, null, null, null, null, '2010-12-29 00:00:00', '1', null, '张小兵', '0');
INSERT INTO `app_user` VALUES ('425', 'zhangyu001', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyu001@shopin.cn', '30', '初级收银员', null, null, null, null, null, null, '2011-04-13 00:00:00', '1', null, '张愉', '0');
INSERT INTO `app_user` VALUES ('426', 'qinzhaohong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qinzhaohong@shopin.cn', '30', '初级收银员', null, null, null, null, null, null, '2011-12-14 00:00:00', '1', null, '秦赵红', '0');
INSERT INTO `app_user` VALUES ('427', 'caoliyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'caoliyang@shopin.cn', '30', '客服文员', null, null, null, null, null, null, '2008-07-23 00:00:00', '1', null, '曹丽洋', '0');
INSERT INTO `app_user` VALUES ('428', 'zhoujing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhoujing@shopin.cn', '30', '客服文员', null, null, null, null, null, null, '2010-03-18 00:00:00', '1', null, '周晶', '0');
INSERT INTO `app_user` VALUES ('429', 'kanghongli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'kanghongli@shopin.cn', '30', '客服文员', null, null, null, null, null, null, '2008-10-23 00:00:00', '1', null, '康宏历', '0');
INSERT INTO `app_user` VALUES ('430', 'zhangyuanyue', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyuanyue@shopin.cn', '30', '防损主管', null, null, null, null, null, null, '2011-01-05 00:00:00', '1', null, '张圆玥', '0');
INSERT INTO `app_user` VALUES ('431', 'shaodapeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shaodapeng@shopin.cn', '30', '防损领班', null, null, null, null, null, null, '2011-03-23 00:00:00', '1', null, '邵大朋', '0');
INSERT INTO `app_user` VALUES ('432', 'shenzhiyong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shenzhiyong@shopin.cn', '34', '店长', null, null, null, null, null, null, '2007-03-29 00:00:00', '1', null, '申智勇', '0');
INSERT INTO `app_user` VALUES ('433', 'zhangyuqin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyuqin@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2003-03-04 00:00:00', '1', null, '张玉芹', '0');
INSERT INTO `app_user` VALUES ('434', 'wanghe', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanghe@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2010-03-15 00:00:00', '1', null, '王赫', '0');
INSERT INTO `app_user` VALUES ('435', 'zhengnian', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhengnian@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2009-04-01 00:00:00', '1', null, '郑念', '0');
INSERT INTO `app_user` VALUES ('436', 'lixiujuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lixiujuan@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2010-10-20 00:00:00', '1', null, '李秀娟', '0');
INSERT INTO `app_user` VALUES ('437', 'wangwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangwei@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2010-07-28 00:00:00', '1', null, '王伟', '0');
INSERT INTO `app_user` VALUES ('438', 'songlei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'songlei@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2010-10-20 00:00:00', '1', null, '宋磊', '0');
INSERT INTO `app_user` VALUES ('439', 'ganxiaoyu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'ganxiaoyu@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2010-10-27 00:00:00', '1', null, '甘小玉', '0');
INSERT INTO `app_user` VALUES ('440', 'yaohu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yaohu@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2010-03-24 00:00:00', '1', null, '姚胡', '0');
INSERT INTO `app_user` VALUES ('441', 'liuyujie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuyujie@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2010-07-01 00:00:00', '1', null, '刘宇婕', '0');
INSERT INTO `app_user` VALUES ('442', 'chenquan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenquan@shopin.cn', '34', '初级库管', null, null, null, null, null, null, '2010-03-08 00:00:00', '1', null, '陈全', '0');
INSERT INTO `app_user` VALUES ('443', 'yanyongze', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yanyongze@shopin.cn', '34', '初级库管', null, null, null, null, null, null, '2011-09-28 00:00:00', '1', null, '闫永泽', '0');
INSERT INTO `app_user` VALUES ('444', 'wangjiali', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangjiali@shopin.cn', '34', '客服主管', null, null, null, null, null, null, '2009-02-10 00:00:00', '1', null, '王佳丽', '0');
INSERT INTO `app_user` VALUES ('445', 'zhaoyajie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaoyajie@shopin.cn', '34', '收银领班', null, null, null, null, null, null, '2009-02-17 00:00:00', '1', null, '赵雅洁', '0');
INSERT INTO `app_user` VALUES ('446', 'zhangjunying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjunying@shopin.cn', '34', '收银领班', null, null, null, null, null, null, '2008-06-26 00:00:00', '1', null, '张俊英', '0');
INSERT INTO `app_user` VALUES ('447', 'liuyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuyan@shopin.cn', '34', '中级收银员', null, null, null, null, null, null, '2009-01-21 00:00:00', '1', null, '刘燕', '0');
INSERT INTO `app_user` VALUES ('448', 'lili', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lili@shopin.cn', '34', '中级收银员', null, null, null, null, null, null, '2009-01-21 00:00:00', '1', null, '李莉', '0');
INSERT INTO `app_user` VALUES ('449', 'hanguihua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hanguihua@shopin.cn', '34', '中级收银员', null, null, null, null, null, null, '2009-02-10 00:00:00', '1', null, '韩桂华', '0');
INSERT INTO `app_user` VALUES ('450', 'kongdehui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'kongdehui@shopin.cn', '34', '初级收银员', null, null, null, null, null, null, '2010-08-25 00:00:00', '1', null, '孔德会', '0');
INSERT INTO `app_user` VALUES ('451', 'yanweili', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yanweili@shopin.cn', '34', '初级收银员', null, null, null, null, null, null, '2010-11-24 00:00:00', '1', null, '严伟立', '0');
INSERT INTO `app_user` VALUES ('452', 'jinyumei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jinyumei@shopin.cn', '34', '初级收银员', null, null, null, null, null, null, '2010-12-08 00:00:00', '1', null, '金玉梅', '0');
INSERT INTO `app_user` VALUES ('453', 'wuxiuhua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wuxiuhua@shopin.cn', '34', '初级收银员', null, null, null, null, null, null, '2011-06-15 00:00:00', '1', null, '吴秀华', '0');
INSERT INTO `app_user` VALUES ('454', 'gehui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gehui@shopin.cn', '34', '客服文员', null, null, null, null, null, null, '2009-11-11 00:00:00', '1', null, '葛慧', '0');
INSERT INTO `app_user` VALUES ('455', 'yangwei2', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangwei2@shopin.cn', '34', '客服文员', null, null, null, null, null, null, '2011-05-11 00:00:00', '1', null, '杨维', '0');
INSERT INTO `app_user` VALUES ('456', 'tongliansheng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tongliansheng@shopin.cn', '34', '防损主管', null, null, null, null, null, null, '2007-09-03 00:00:00', '1', null, '佟连生', '0');
INSERT INTO `app_user` VALUES ('457', 'lilinjiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lilinjiang@shopin.cn', '34', '防损领班', null, null, null, null, null, null, '2008-09-17 00:00:00', '1', null, '李林江', '0');
INSERT INTO `app_user` VALUES ('458', 'meixiaofeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'meixiaofeng@shopin.cn', '34', '防损领班', null, null, null, null, null, null, '2011-12-21 00:00:00', '1', null, '梅晓峰', '0');
INSERT INTO `app_user` VALUES ('459', 'dongdeliang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dongdeliang@shopin.cn', '39', '电工', null, null, null, null, null, null, '2010-11-17 00:00:00', '1', null, '董德亮', '0');
INSERT INTO `app_user` VALUES ('460', 'wangna', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangna@shopin.cn', '32', '店长', null, null, null, null, null, null, '2004-11-09 00:00:00', '1', null, '王娜', '0');
INSERT INTO `app_user` VALUES ('461', 'lijian', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijian@shopin.cn', '32', '高级卖场主管', null, null, null, null, null, null, '2012-01-04 00:00:00', '1', null, '李剑', '0');
INSERT INTO `app_user` VALUES ('462', 'lixiaohong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lixiaohong@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2006-09-29 00:00:00', '1', null, '李晓红', '0');
INSERT INTO `app_user` VALUES ('463', 'hanyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hanyan@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2007-09-27 00:00:00', '1', null, '韩艳', '0');
INSERT INTO `app_user` VALUES ('464', 'renxin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'renxin@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2006-12-30 00:00:00', '1', null, '任鑫', '0');
INSERT INTO `app_user` VALUES ('465', 'haomeifang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'haomeifang@shopin.cn', '32', '高级卖场主管', null, null, null, null, null, null, '2008-08-27 00:00:00', '1', null, '郝美芳', '0');
INSERT INTO `app_user` VALUES ('466', 'cuipeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'cuipeng@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2011-04-27 00:00:00', '1', null, '崔鹏', '0');
INSERT INTO `app_user` VALUES ('467', 'lvguangyu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lvguangyu@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2011-04-20 00:00:00', '1', null, '吕广宇', '0');
INSERT INTO `app_user` VALUES ('468', 'zhanghaili', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhanghaili@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2009-12-16 00:00:00', '1', null, '张海丽', '0');
INSERT INTO `app_user` VALUES ('469', 'zhangjunmei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjunmei@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2006-08-26 00:00:00', '1', null, '张俊梅', '0');
INSERT INTO `app_user` VALUES ('470', 'yangxi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangxi@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2008-11-26 00:00:00', '1', null, '杨曦', '0');
INSERT INTO `app_user` VALUES ('471', 'caohuimin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'caohuimin@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2011-08-17 00:00:00', '1', null, '曹会敏', '0');
INSERT INTO `app_user` VALUES ('472', 'hemeiying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hemeiying@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2011-03-16 00:00:00', '1', null, '何美英', '0');
INSERT INTO `app_user` VALUES ('473', 'guohao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guohao@shopin.cn', '32', '高级卖场主管', null, null, null, null, null, null, '2011-10-19 00:00:00', '1', null, '郭浩', '0');
INSERT INTO `app_user` VALUES ('474', 'huangliang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huangliang@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2011-10-09 00:00:00', '1', null, '黄亮', '0');
INSERT INTO `app_user` VALUES ('475', 'zuoweiwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zuoweiwei@shopin.cn', '32', '卖场主管', null, null, null, null, null, null, '2011-10-26 00:00:00', '1', null, '左威威', '0');
INSERT INTO `app_user` VALUES ('476', 'liubaohai', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liubaohai@shopin.cn', '32', '中级库管', null, null, null, null, null, null, '2006-06-12 00:00:00', '1', null, '刘宝海', '0');
INSERT INTO `app_user` VALUES ('477', 'lizhongwen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lizhongwen@shopin.cn', '32', '初级库管', null, null, null, null, null, null, '2011-08-24 00:00:00', '1', null, '李仲文', '0');
INSERT INTO `app_user` VALUES ('478', 'lvli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lvli@shopin.cn', '32', '客服主管', null, null, null, null, null, null, '2005-08-25 00:00:00', '1', null, '吕莉', '0');
INSERT INTO `app_user` VALUES ('479', 'zhangyanhong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyanhong@shopin.cn', '32', '收银领班', null, null, null, null, null, null, '2005-08-01 00:00:00', '1', null, '张燕红', '0');
INSERT INTO `app_user` VALUES ('480', 'dujiaying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dujiaying@shopin.cn', '32', '收银领班', null, null, null, null, null, null, '2011-09-14 00:00:00', '1', null, '杜佳莹', '0');
INSERT INTO `app_user` VALUES ('481', 'xudantong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xudantong@shopin.cn', '32', '中级收银员', null, null, null, null, null, null, '2007-11-09 00:00:00', '1', null, '徐丹彤', '0');
INSERT INTO `app_user` VALUES ('482', 'fuxinyue', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fuxinyue@shopin.cn', '32', '中级收银员', null, null, null, null, null, null, '2005-10-28 00:00:00', '1', null, '付欣岳', '0');
INSERT INTO `app_user` VALUES ('483', 'lina001', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lina001@shopin.cn', '32', '中级收银员', null, null, null, null, null, null, '2008-02-20 00:00:00', '1', null, '李娜', '0');
INSERT INTO `app_user` VALUES ('484', 'quhong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'quhong@shopin.cn', '32', '中级收银员', null, null, null, null, null, null, '2009-02-19 00:00:00', '1', null, '屈红', '0');
INSERT INTO `app_user` VALUES ('485', 'liyuqi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liyuqi@shopin.cn', '32', '中级收银员', null, null, null, null, null, null, '2009-10-22 00:00:00', '1', null, '李玉琪', '0');
INSERT INTO `app_user` VALUES ('486', 'shishujuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shishujuan@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2010-06-02 00:00:00', '1', null, '石书娟', '0');
INSERT INTO `app_user` VALUES ('487', 'donghongying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'donghongying@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2010-07-07 00:00:00', '1', null, '董红英', '0');
INSERT INTO `app_user` VALUES ('488', 'shige', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shige@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2010-07-28 00:00:00', '1', null, '时葛', '0');
INSERT INTO `app_user` VALUES ('489', 'zhangrui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangrui@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2010-11-03 00:00:00', '1', null, '张蕊', '0');
INSERT INTO `app_user` VALUES ('490', 'renyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'renyan@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2011-03-23 00:00:00', '1', null, '任燕', '0');
INSERT INTO `app_user` VALUES ('491', 'wangdan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangdan@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2011-06-01 00:00:00', '1', null, '王丹', '0');
INSERT INTO `app_user` VALUES ('492', 'dongbin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dongbin@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2011-09-01 00:00:00', '1', null, '董彬', '0');
INSERT INTO `app_user` VALUES ('493', 'zhongfangyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhongfangyi@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2011-09-07 00:00:00', '1', null, '钟方毅', '0');
INSERT INTO `app_user` VALUES ('494', 'qiuliming', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qiuliming@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2011-09-23 00:00:00', '1', null, '邱丽明', '0');
INSERT INTO `app_user` VALUES ('495', 'xieyingpeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xieyingpeng@shopin.cn', '32', '初级收银员', '', '', '', '', '', '', '2011-09-26 00:00:00', '1', null, '解英鹏', '0');
INSERT INTO `app_user` VALUES ('496', 'sunyanchao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunyanchao@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2011-09-28 00:00:00', '1', null, '孙艳超', '0');
INSERT INTO `app_user` VALUES ('497', 'tongmingyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tongmingyuan@shopin.cn', '32', '客服文员', '', '', '', '', '', '', '2011-10-19 00:00:00', '1', null, '佟明媛', '0');
INSERT INTO `app_user` VALUES ('498', 'liuchangjun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuchangjun@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2011-10-12 00:00:00', '1', null, '刘长俊', '0');
INSERT INTO `app_user` VALUES ('499', 'caoqiannan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'caoqiannan@shopin.cn', '32', '客服文员', null, null, null, null, null, null, '2008-08-23 00:00:00', '1', null, '曹倩楠', '0');
INSERT INTO `app_user` VALUES ('500', 'libing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'libing@shopin.cn', '32', '客服文员', null, null, null, null, null, null, '2009-06-10 00:00:00', '1', null, '李兵', '0');
INSERT INTO `app_user` VALUES ('501', 'lijing01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijing01@shopin.cn', '32', '客服文员', null, null, null, null, null, null, '2007-10-10 00:00:00', '1', null, '李静', '0');
INSERT INTO `app_user` VALUES ('502', 'rongjishuang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'rongjishuang@shopin.cn', '32', '客服文员', null, null, null, null, null, null, '2009-12-09 00:00:00', '1', null, '荣济爽', '0');
INSERT INTO `app_user` VALUES ('503', 'mushuhui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mushuhui@shopin.cn', '32', '客服文员', null, null, null, null, null, null, '2010-07-14 00:00:00', '1', null, '穆淑惠', '0');
INSERT INTO `app_user` VALUES ('504', 'yangdongping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangdongping@shopin.cn', '32', '防损主管', null, null, null, null, null, null, '2005-10-08 00:00:00', '1', null, '杨东平', '0');
INSERT INTO `app_user` VALUES ('505', 'liuwankai', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuwankai@shopin.cn', '32', '防损领班', null, null, null, null, null, null, '2006-07-04 00:00:00', '1', null, '刘万凯', '0');
INSERT INTO `app_user` VALUES ('506', 'zhangjiande', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjiande@shopin.cn', '32', '防损领班', null, null, null, null, null, null, '2007-08-07 00:00:00', '1', null, '张俭德', '0');
INSERT INTO `app_user` VALUES ('507', 'liuzhihong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuzhihong@shopin.cn', '32', '安保员', null, null, null, null, null, null, '2008-09-25 00:00:00', '1', null, '刘志鸿', '0');
INSERT INTO `app_user` VALUES ('508', 'chengshaohua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chengshaohua@shopin.cn', '32', '安保员', null, null, null, null, null, null, '2005-10-25 00:00:00', '1', null, '程绍华', '0');
INSERT INTO `app_user` VALUES ('509', 'gexin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gexin@shopin.cn', '32', '安保员', null, null, null, null, null, null, '2006-06-03 00:00:00', '1', null, '葛新', '0');
INSERT INTO `app_user` VALUES ('510', 'wanghui1', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanghui1@shopin.cn', '32', '安保员', null, null, null, null, null, null, '2007-06-14 00:00:00', '1', null, '王辉', '0');
INSERT INTO `app_user` VALUES ('511', 'heminyun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'heminyun@shopin.cn', '32', '安保员', null, null, null, null, null, null, '2007-01-13 00:00:00', '1', null, '何敏云', '0');
INSERT INTO `app_user` VALUES ('512', 'wangfeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangfeng@shopin.cn', '32', '安保员', null, null, null, null, null, null, '2006-09-30 00:00:00', '1', null, '王丰', '0');
INSERT INTO `app_user` VALUES ('513', 'yandong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yandong@shopin.cn', '32', '安保员', null, null, null, null, null, null, '2007-05-18 00:00:00', '1', null, '闫东', '0');
INSERT INTO `app_user` VALUES ('514', 'tianxin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tianxin@shopin.cn', '32', '安保员', null, null, null, null, null, null, '2007-09-10 00:00:00', '1', null, '田鑫', '0');
INSERT INTO `app_user` VALUES ('515', 'pujian', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'pujian@shopin.cn', '32', '安保员', null, null, null, null, null, null, '2008-02-22 00:00:00', '1', null, '浦健', '0');
INSERT INTO `app_user` VALUES ('516', 'zhangjun01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjun01@shopin.cn', '32', '安保员', null, null, null, null, null, null, '2010-02-10 00:00:00', '1', null, '张军', '0');
INSERT INTO `app_user` VALUES ('517', 'libin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'libin@shopin.cn', '39', '电工', null, null, null, null, null, null, '2008-02-18 00:00:00', '1', null, '李斌', '0');
INSERT INTO `app_user` VALUES ('518', 'zhaoyanhong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaoyanhong@shopin.cn', '33', '店长', null, null, null, null, null, null, '2006-09-01 00:00:00', '1', null, '赵艳红', '0');
INSERT INTO `app_user` VALUES ('519', 'qizongwen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qizongwen@shopin.cn', '33', '高级卖场主管', null, null, null, null, null, null, '2007-09-19 00:00:00', '1', null, '綦宗文', '0');
INSERT INTO `app_user` VALUES ('520', 'lipeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lipeng@shopin.cn', '33', '卖场主管', null, null, null, null, null, null, '2008-04-16 00:00:00', '1', null, '李鹏', '0');
INSERT INTO `app_user` VALUES ('521', 'wangrongrong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangrongrong@shopin.cn', '33', '卖场主管', null, null, null, null, null, null, '2010-04-01 00:00:00', '1', null, '王荣荣', '0');
INSERT INTO `app_user` VALUES ('522', 'zhangjing01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjing@shopin.cn', '33', '卖场主管', null, null, null, null, null, null, '2010-09-01 00:00:00', '1', null, '张静', '0');
INSERT INTO `app_user` VALUES ('523', 'dingjia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dingjia@shopin.cn', '33', '卖场主管', null, null, null, null, null, null, '2010-10-09 00:00:00', '1', null, '丁佳', '0');
INSERT INTO `app_user` VALUES ('524', 'luxueyong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'luxueyong@shopin.cn', '33', '卖场主管', null, null, null, null, null, null, '2010-10-27 00:00:00', '1', null, '路雪勇', '0');
INSERT INTO `app_user` VALUES ('525', 'quyuetao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'quyuetao@shopin.cn', '33', '卖场主管', null, null, null, null, null, null, '2010-10-29 00:00:00', '1', null, '屈跃涛', '0');
INSERT INTO `app_user` VALUES ('526', 'wangying1', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangying1@shopin.cn', '33', '卖场主管', null, null, null, null, null, null, '2011-06-15 00:00:00', '1', null, '王颖', '0');
INSERT INTO `app_user` VALUES ('527', 'malihong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'malihong@shopin.cn', '33', '卖场主管', null, null, null, null, null, null, '2010-07-07 00:00:00', '1', null, '马丽红', '0');
INSERT INTO `app_user` VALUES ('528', 'changjiwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'changjiwei@shopin.cn', '33', '中级库管', null, null, null, null, null, null, '2007-10-25 00:00:00', '1', null, '常继尾', '0');
INSERT INTO `app_user` VALUES ('529', 'zhangxiaolin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangxiaolin@shopin.cn', '33', '初级库管', null, null, null, null, null, null, '2010-12-15 00:00:00', '1', null, '仉晓霖', '0');
INSERT INTO `app_user` VALUES ('530', 'xuwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xuwei@shopin.cn', '33', '收银领班', null, null, null, null, null, null, '2009-12-23 00:00:00', '1', null, '徐伟', '0');
INSERT INTO `app_user` VALUES ('531', 'heying01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'heying01@shopin.cn', '33', '中级收银员', null, null, null, null, null, null, '2010-10-29 00:00:00', '1', null, '何英', '0');
INSERT INTO `app_user` VALUES ('532', 'jinlizhu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jinlizhu@shopin.cn', '33', '中级收银员', null, null, null, null, null, null, '2007-06-25 00:00:00', '1', null, '金利珠', '0');
INSERT INTO `app_user` VALUES ('533', 'zhangyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyi@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2007-07-11 00:00:00', '1', null, '张怡', '0');
INSERT INTO `app_user` VALUES ('534', 'guoyue', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guoyue@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2010-11-25 00:00:00', '1', null, '郭月', '0');
INSERT INTO `app_user` VALUES ('535', 'yingxuxia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yingxuxia@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2011-04-13 00:00:00', '1', null, '英旭霞', '0');
INSERT INTO `app_user` VALUES ('536', 'zhutianmei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhutianmei@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2011-05-21 00:00:00', '1', null, '朱田妹', '0');
INSERT INTO `app_user` VALUES ('537', 'sunyuhong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunyuhong@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2011-06-07 00:00:00', '1', null, '孙玉红', '0');
INSERT INTO `app_user` VALUES ('538', 'liumian', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liumian@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2011-07-21 00:00:00', '1', null, '刘勉', '0');
INSERT INTO `app_user` VALUES ('539', 'dingwenjuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dingwenjuan@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2011-09-28 00:00:00', '1', null, '丁文娟', '0');
INSERT INTO `app_user` VALUES ('540', 'sunxiaochun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunxiaochun@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-01-13 00:00:00', '1', null, '孙小春', '0');
INSERT INTO `app_user` VALUES ('541', 'wangqin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangqin@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-01-13 00:00:00', '1', null, '王秦', '0');
INSERT INTO `app_user` VALUES ('542', 'lanchen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lanchen@shopin.cn', '33', '客服文员', null, null, null, null, null, null, '2009-08-12 00:00:00', '1', null, '兰晨', '0');
INSERT INTO `app_user` VALUES ('543', 'niehongyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'niehongyan@shopin.cn', '33', '客服文员', null, null, null, null, null, null, '2009-05-27 00:00:00', '1', null, '聂红燕', '0');
INSERT INTO `app_user` VALUES ('544', 'yangshuhui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangshuhui@shopin.cn', '33', '客服文员', null, null, null, null, null, null, '2008-07-03 00:00:00', '1', null, '杨淑慧', '0');
INSERT INTO `app_user` VALUES ('545', 'xinghongcui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xinghongcui@shopin.cn', '33', '客服文员', null, null, null, null, null, null, '2010-08-04 00:00:00', '1', null, '邢红翠', '0');
INSERT INTO `app_user` VALUES ('546', 'wangzhigang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangzhigang@shopin.cn', '33', '防损主管', null, null, null, null, null, null, '2009-08-12 00:00:00', '1', null, '王志刚', '0');
INSERT INTO `app_user` VALUES ('547', 'zhangjianjun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjianjun@shopin.cn', '33', '防损领班', null, null, null, null, null, null, '2011-12-07 00:00:00', '1', null, '张建军', '0');
INSERT INTO `app_user` VALUES ('548', 'qujunxiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qujunxiang@shopin.cn', '33', '安保员', null, null, null, null, null, null, '2005-11-15 00:00:00', '1', null, '屈俊祥', '0');
INSERT INTO `app_user` VALUES ('549', 'guoxianrong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guoxianrong@shopin.cn', '33', '安保员', null, null, null, null, null, null, '2008-08-19 00:00:00', '1', null, '郭宪荣', '0');
INSERT INTO `app_user` VALUES ('550', 'wangzhifeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangzhifeng@shopin.cn', '39', '电工', null, null, null, null, null, null, '2009-02-18 00:00:00', '1', null, '王志锋', '0');
INSERT INTO `app_user` VALUES ('551', 'huangqingyu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huangqingyu@shopin.cn', '33', '安保员', null, null, null, null, null, null, '2010-03-24 00:00:00', '1', null, '黄庆禹', '0');
INSERT INTO `app_user` VALUES ('552', 'zhangyanhong1', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyanhong1@shopin.cn', '33', '安保员', null, null, null, null, null, null, '2010-09-21 00:00:00', '1', null, '张燕鸿', '0');
INSERT INTO `app_user` VALUES ('553', 'qianyinghong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qianyinghong@shopin.cn', '35', '店长', null, null, null, null, null, null, '2008-11-10 00:00:00', '1', null, '钱颖洪', '0');
INSERT INTO `app_user` VALUES ('554', 'xionglei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xionglei@shopin.cn', '35', '高级卖场主管', null, null, null, null, null, null, '2010-03-24 00:00:00', '1', null, '熊蕾', '0');
INSERT INTO `app_user` VALUES ('555', 'liyu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liyu@shopin.cn', '35', '卖场主管', null, null, null, null, null, null, '2011-03-30 00:00:00', '1', null, '李豫', '0');
INSERT INTO `app_user` VALUES ('556', 'herongquan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'herongquan@shopin.cn', '35', '卖场主管', null, null, null, null, null, null, '2010-09-21 00:00:00', '1', null, '何荣权', '0');
INSERT INTO `app_user` VALUES ('557', 'liangfang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liangfang@shopin.cn', '35', '卖场主管', null, null, null, null, null, null, '2011-04-06 00:00:00', '1', null, '梁芳', '0');
INSERT INTO `app_user` VALUES ('558', 'liyan-cym', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liyan-cym@shopin.cn', '35', '卖场主管', null, null, null, null, null, null, '2010-04-01 00:00:00', '1', null, '李妍', '0');
INSERT INTO `app_user` VALUES ('559', 'fuaihua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fuaihua@shopin.cn', '35', '卖场主管', null, null, null, null, null, null, '2007-06-27 00:00:00', '1', null, '付爱华', '0');
INSERT INTO `app_user` VALUES ('560', 'lihonglian', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lihonglian@shopin.cn', '35', '卖场主管', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '李红莲', '0');
INSERT INTO `app_user` VALUES ('561', 'wangdong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangdong@shopin.cn', '35', '中级库管', null, null, null, null, null, null, '2010-08-11 00:00:00', '1', null, '王东', '0');
INSERT INTO `app_user` VALUES ('562', 'guowei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guowei@shopin.cn', '35', '初级库管', null, null, null, null, null, null, '2011-10-12 00:00:00', '1', null, '郭伟', '0');
INSERT INTO `app_user` VALUES ('563', 'majiying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'majiying@shopin.cn', '35', '客服主管', null, null, null, null, null, null, '2007-05-23 00:00:00', '1', null, '马继英', '0');
INSERT INTO `app_user` VALUES ('564', 'dongchunxia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dongchunxia@shopin.cn', '35', '收银领班', null, null, null, null, null, null, '2011-04-20 00:00:00', '1', null, '杜春霞', '0');
INSERT INTO `app_user` VALUES ('565', 'haojianxun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'haojianxun@shopin.cn', '35', '中级收银员', null, null, null, null, null, null, '2009-06-17 00:00:00', '1', null, '郝建勋', '0');
INSERT INTO `app_user` VALUES ('566', 'liuxiuzhen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuxiuzhen@shopin.cn', '35', '初级收银员', null, null, null, null, null, null, '2010-04-07 00:00:00', '1', null, '刘秀珍', '0');
INSERT INTO `app_user` VALUES ('567', 'shiboyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'shiboyuan@shopin.cn', '35', '初级收银员', null, null, null, null, null, null, '2010-04-07 00:00:00', '1', null, '施博源', '0');
INSERT INTO `app_user` VALUES ('568', 'chenghongying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenghongying@shopin.cn', '35', '初级收银员', null, null, null, null, null, null, '2010-04-16 00:00:00', '1', null, '程洪英', '0');
INSERT INTO `app_user` VALUES ('569', 'wangjixin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangjixin@shopin.cn', '35', '初级收银员', null, null, null, null, null, null, '2011-05-18 00:00:00', '1', null, '王吉新', '0');
INSERT INTO `app_user` VALUES ('570', 'mengqiutong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mengqiutong@shopin.cn', '35', '初级收银员', null, null, null, null, null, null, '2011-08-04 00:00:00', '1', null, '孟秋彤', '0');
INSERT INTO `app_user` VALUES ('571', 'gonghuiyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gonghuiyi@shopin.cn', '35', '初级收银员', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '巩慧一', '0');
INSERT INTO `app_user` VALUES ('572', 'mayun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mayun@shopin.cn', '35', '初级收银员', null, null, null, null, null, null, '2011-12-07 00:00:00', '1', null, '马云', '0');
INSERT INTO `app_user` VALUES ('573', 'fansong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fansong@shopin.cn', '35', '客服文员', null, null, null, null, null, null, '2008-02-18 00:00:00', '1', null, '樊松', '0');
INSERT INTO `app_user` VALUES ('574', 'yanjin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yanjin@shopin.cn', '35', '客服文员', null, null, null, null, null, null, '2011-12-21 00:00:00', '1', null, '闫瑾', '0');
INSERT INTO `app_user` VALUES ('575', 'dengxiao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dengxiao@shopin.cn', '34', '防损主管', '', '', '', '', '', '', '2011-08-24 00:00:00', '1', null, '邓晓', '0');
INSERT INTO `app_user` VALUES ('576', 'yangmiao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangmiao@shopin.cn', '35', '防损领班', null, null, null, null, null, null, '2011-11-23 00:00:00', '1', null, '杨淼', '0');
INSERT INTO `app_user` VALUES ('577', 'yanxu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yanxu@shopin.cn', '35', '防损领班', null, null, null, null, null, null, '2011-09-01 00:00:00', '1', null, '阎旭', '0');
INSERT INTO `app_user` VALUES ('578', 'wanglei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanglei@shopin.cn', '66', '总监', '', '', '', '', '', '', '2008-04-11 00:00:00', '1', null, '王磊', '0');
INSERT INTO `app_user` VALUES ('579', 'zhangqiuli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangqiuli@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2011-02-25 00:00:00', '1', null, '张秋立', '0');
INSERT INTO `app_user` VALUES ('580', 'xusa', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xusa@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2010-11-24 00:00:00', '1', null, '徐飒', '0');
INSERT INTO `app_user` VALUES ('581', 'liziwen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liziwen@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2010-10-20 00:00:00', '1', null, '李孜文', '0');
INSERT INTO `app_user` VALUES ('582', 'wangdongying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangdongying@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2010-10-20 00:00:00', '1', null, '王东颖', '0');
INSERT INTO `app_user` VALUES ('583', 'dengbo', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'dengbo@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2010-11-10 00:00:00', '1', null, '邓博', '0');
INSERT INTO `app_user` VALUES ('584', 'lixiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lixiang@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2010-07-07 00:00:00', '1', null, '李翔', '0');
INSERT INTO `app_user` VALUES ('585', 'chenqi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenqi@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2011-03-02 00:00:00', '1', null, '陈琦', '0');
INSERT INTO `app_user` VALUES ('586', 'wuyunfeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wuyunfeng@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2011-01-19 00:00:00', '1', null, '吴云峰', '0');
INSERT INTO `app_user` VALUES ('587', 'wanghong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanghong@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2011-07-13 00:00:00', '1', null, '王宏', '0');
INSERT INTO `app_user` VALUES ('588', 'yuhui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yuhui@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2010-12-15 00:00:00', '1', null, '于慧', '0');
INSERT INTO `app_user` VALUES ('589', 'nitingting', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'nitingting@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2011-11-09 00:00:00', '1', null, '倪婷婷', '0');
INSERT INTO `app_user` VALUES ('590', 'qianweisheng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qianweisheng@shopin.cn', '36', '中级库管', null, null, null, null, null, null, '2007-03-05 00:00:00', '1', null, '钱为胜', '0');
INSERT INTO `app_user` VALUES ('591', 'zhenyongqiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhenyongqiang@shopin.cn', '36', '初级库管', null, null, null, null, null, null, '2011-03-23 00:00:00', '1', null, '甄永强', '0');
INSERT INTO `app_user` VALUES ('592', 'yanghongliang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yanghongliang@shopin.cn', '36', '初级库管', null, null, null, null, null, null, '2011-07-21 00:00:00', '1', null, '杨洪亮', '0');
INSERT INTO `app_user` VALUES ('593', 'wangshuying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangshuying@shopin.cn', '36', '客服主管', null, null, null, null, null, null, '2010-11-03 00:00:00', '1', null, '王淑英', '0');
INSERT INTO `app_user` VALUES ('594', 'liuyang01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuyang01@shopin.cn', '36', '收银领班', null, null, null, null, null, null, '2010-12-01 00:00:00', '1', null, '刘杨', '0');
INSERT INTO `app_user` VALUES ('595', 'guojun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guojun@shopin.cn', '36', '收银领班', null, null, null, null, null, null, '2010-12-03 00:00:00', '1', null, '郭军', '0');
INSERT INTO `app_user` VALUES ('596', 'mawenru', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mawenru@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2010-12-01 00:00:00', '1', null, '马文茹', '0');
INSERT INTO `app_user` VALUES ('597', 'majunhua', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'majunhua@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2010-12-03 00:00:00', '1', null, '马俊华', '0');
INSERT INTO `app_user` VALUES ('598', 'lichunyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lichunyan@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-03-08 00:00:00', '1', null, '李春燕', '0');
INSERT INTO `app_user` VALUES ('599', 'liunana', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liunana@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-03-16 00:00:00', '1', null, '刘娜娜', '0');
INSERT INTO `app_user` VALUES ('600', 'zhangwei01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangwei@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-04-20 00:00:00', '1', null, '张威', '0');
INSERT INTO `app_user` VALUES ('601', 'wangshaokun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangshaokun@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-05-18 00:00:00', '1', null, '王少坤', '0');
INSERT INTO `app_user` VALUES ('602', 'lixiaohui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lixiaohui@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-06-15 00:00:00', '1', null, '李小惠', '0');
INSERT INTO `app_user` VALUES ('603', 'luyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'luyan@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-06-15 00:00:00', '1', null, '路燕', '0');
INSERT INTO `app_user` VALUES ('604', 'qiaoanyue', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qiaoanyue@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-06-15 00:00:00', '1', null, '乔安岳', '0');
INSERT INTO `app_user` VALUES ('605', 'zhangningxia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangningxia@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-10-12 00:00:00', '1', null, '张宁霞', '0');
INSERT INTO `app_user` VALUES ('606', 'majie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'majie@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '马杰', '0');
INSERT INTO `app_user` VALUES ('607', 'wangluyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangluyang@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '王陆扬', '0');
INSERT INTO `app_user` VALUES ('608', 'zhaoxinmei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaoxinmei@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2011-12-28 00:00:00', '1', null, '赵新妹', '0');
INSERT INTO `app_user` VALUES ('609', 'liuhongyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuhongyan@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2012-01-11 00:00:00', '1', null, '刘红艳', '0');
INSERT INTO `app_user` VALUES ('610', 'liyajing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liyajing@shopin.cn', '36', '客服文员', null, null, null, null, null, null, '2010-12-08 00:00:00', '1', null, '李亚敬', '0');
INSERT INTO `app_user` VALUES ('611', 'wuruning', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wuruning@shopin.cn', '36', '客服文员', null, null, null, null, null, null, '2010-10-20 00:00:00', '1', null, '伍汝宁', '0');
INSERT INTO `app_user` VALUES ('612', 'gaoping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gaoping@shopin.cn', '36', '客服文员', null, null, null, null, null, null, '2010-12-10 00:00:00', '1', null, '高苹', '0');
INSERT INTO `app_user` VALUES ('613', 'lianhongrong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lianhongrong@shopin.cn', '36', '客服文员', null, null, null, null, null, null, '2010-12-01 00:00:00', '1', null, '廉红荣', '0');
INSERT INTO `app_user` VALUES ('614', 'wangxien', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangxien@shopin.cn', '36', '防损主管', null, null, null, null, null, null, '2009-06-25 00:00:00', '1', null, '王锡恩', '0');
INSERT INTO `app_user` VALUES ('615', 'suxiaojie', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'suxiaojie@shopin.cn', '36', '防损领班', null, null, null, null, null, null, '2011-04-20 00:00:00', '1', null, '苏小杰', '0');
INSERT INTO `app_user` VALUES ('616', 'liangjingchao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liangjingchao@shopin.cn', '36', '防损领班', null, null, null, null, null, null, '2011-12-14 00:00:00', '1', null, '梁景朝', '0');
INSERT INTO `app_user` VALUES ('617', 'hanjun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hanjun@shopin.cn', '36', '安保员', null, null, null, null, null, null, '2011-12-01 00:00:00', '1', null, '韩军', '0');
INSERT INTO `app_user` VALUES ('618', 'chenqingzhu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenqingzhu@shopin.cn', '39', '电工', null, null, null, null, null, null, '2010-09-21 00:00:00', '1', null, '陈庆柱', '0');
INSERT INTO `app_user` VALUES ('619', 'zhangyupei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangyupei@shopin.cn', '29', '客服文员', null, null, null, null, null, null, '2012-02-01 00:00:00', '1', null, '张玉佩', '0');
INSERT INTO `app_user` VALUES ('620', 'zhangtingting', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangtingting@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2012-02-01 00:00:00', '1', null, '张婷婷', '0');
INSERT INTO `app_user` VALUES ('621', 'wudi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wudi@shopin.cn', '49', '客服助理', null, null, null, null, null, null, '2012-02-01 00:00:00', '1', null, '吴迪', '0');
INSERT INTO `app_user` VALUES ('622', 'lijiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lijiang@shopin.cn', '56', '高级产品设计师', null, null, null, null, null, null, '2012-02-01 00:00:00', '1', null, '李江', '0');
INSERT INTO `app_user` VALUES ('623', 'liuyuxia', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuyuxia@shopin.cn', '32', '初级收银员', null, null, null, null, null, null, '2012-02-04 00:00:00', '1', null, '刘玉霞', '0');
INSERT INTO `app_user` VALUES ('624', 'wanghuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanghuan@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-02-04 00:00:00', '1', null, '王欢', '0');
INSERT INTO `app_user` VALUES ('625', 'lihongyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lihongyan@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2012-02-04 00:00:00', '1', null, '李洪艳', '0');
INSERT INTO `app_user` VALUES ('626', 'liuxiaomei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuxiaomei@shopin.cn', '30', '初级收银员', null, null, null, null, null, null, '2012-02-04 00:00:00', '1', null, '刘晓妹', '0');
INSERT INTO `app_user` VALUES ('627', 'wanghaiyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wanghaiyan@shopin.cn', '30', '初级收银员', null, null, null, null, null, null, '2012-02-04 00:00:00', '1', null, '王海艳', '0');
INSERT INTO `app_user` VALUES ('628', 'chenxuechun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenxuechun@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '陈雪春', '0');
INSERT INTO `app_user` VALUES ('629', 'lianglijuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lianglijuan@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '梁立娟', '0');
INSERT INTO `app_user` VALUES ('630', 'liuping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuping@shopin.cn', '35', '卖场主管', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '刘萍', '0');
INSERT INTO `app_user` VALUES ('631', 'lishunli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lishunli@shopin.cn', '36', '卖场主管', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '李顺利', '0');
INSERT INTO `app_user` VALUES ('632', 'jisha', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jisha@shopin.cn', '33', '卖场主管', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '纪莎', '0');
INSERT INTO `app_user` VALUES ('633', 'liqiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liqiang@shopin.cn', '38', '高级防损经理', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '李强', '0');
INSERT INTO `app_user` VALUES ('634', 'chenyanping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenyanping@shopin.cn', '49', '初级客服代表-电话专员', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '陈彦萍', '0');
INSERT INTO `app_user` VALUES ('635', 'mengxiaoyu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'mengxiaoyu@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '孟小钰', '0');
INSERT INTO `app_user` VALUES ('636', 'yuelin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yuelin@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '岳林', '0');
INSERT INTO `app_user` VALUES ('637', 'xiayong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xiayong@shopin.cn', '35', '客服文员', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '夏永', '0');
INSERT INTO `app_user` VALUES ('638', 'libaoying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'libaoying@shopin.cn', '48', '退货专员', null, null, null, null, null, null, '2012-02-08 00:00:00', '1', null, '李保迎', '0');
INSERT INTO `app_user` VALUES ('639', 'lvjiameng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lvjiameng@shopin.cn', '35', '初级收银员', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '吕家萌', '0');
INSERT INTO `app_user` VALUES ('640', 'zhaoweixing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaoweixing@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '赵卫星', '0');
INSERT INTO `app_user` VALUES ('641', 'jiawanling', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jiawanling@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '贾婉玲', '0');
INSERT INTO `app_user` VALUES ('642', 'xiongke', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'xiongke@shopin.cn', '34', '初级收银员', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '熊珂', '0');
INSERT INTO `app_user` VALUES ('643', 'yangfan01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yangfan01@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '杨帆', '0');
INSERT INTO `app_user` VALUES ('644', 'lixiuyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lixiuyan@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '李秀艳', '0');
INSERT INTO `app_user` VALUES ('645', 'gaohongyun', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gaohongyun@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '高红云', '0');
INSERT INTO `app_user` VALUES ('646', 'wangying', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangying@shopin.cn', '31', '卖场主管', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '王颖', '0');
INSERT INTO `app_user` VALUES ('647', 'fenghaiyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fenghaiyan@shopin.cn', '39', '土木工程师', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '冯海岩', '0');
INSERT INTO `app_user` VALUES ('649', 'menghao', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'menghao@shopin.cn', '48', '生产线操作员', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '孟昊', '0');
INSERT INTO `app_user` VALUES ('650', 'liujuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liujuan@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '刘娟', '0');
INSERT INTO `app_user` VALUES ('652', 'yulixiu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yulixiu@shopin.cn', '4', '项目拓展经理', null, null, null, null, null, null, '2012-02-15 00:00:00', '1', null, '于丽秀', '0');
INSERT INTO `app_user` VALUES ('653', 'lichenguang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lichenguang@shopin.cn', '61', '摄影编辑', null, null, null, null, null, null, '2012-02-16 00:00:00', '1', null, '李辰光', '0');
INSERT INTO `app_user` VALUES ('654', 'zhangtingting02', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangtingting02@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-02-17 00:00:00', '1', null, '张婷婷', '0');
INSERT INTO `app_user` VALUES ('655', 'tianjinyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tianjinyan@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-02-17 00:00:00', '1', null, '田金燕', '0');
INSERT INTO `app_user` VALUES ('656', 'quanxinran', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'quanxinran@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-02-17 00:00:00', '1', null, '全欣然', '0');
INSERT INTO `app_user` VALUES ('657', 'liuyangcym', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuyangcym@shopin.cn', '34', '卖场主管', null, null, null, null, null, null, '2012-02-22 00:00:00', '1', null, '刘洋', '0');
INSERT INTO `app_user` VALUES ('658', 'fuyingrui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fuyingrui@shopin.cn', '31', '卖场主管', null, null, null, null, null, null, '2012-02-22 00:00:00', '1', null, '傅瀛锐', '0');
INSERT INTO `app_user` VALUES ('659', 'suyi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'suyi@shopin.cn', '39', '工程经理', null, null, null, null, null, null, '2012-02-22 00:00:00', '1', null, '苏毅', '0');
INSERT INTO `app_user` VALUES ('660', 'wangfang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangfang@shopin.cn', '41', '驻店金库', null, null, null, null, null, null, '2012-02-22 00:00:00', '1', null, '王芳', '0');
INSERT INTO `app_user` VALUES ('661', 'chengyingna', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chengyingna@shopin.cn', '31', '初级收银员', null, null, null, null, null, null, '2012-02-22 00:00:00', '1', null, '程英纳', '0');
INSERT INTO `app_user` VALUES ('662', 'weiyue', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'weiyue@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2012-02-22 00:00:00', '1', null, '未月', '0');
INSERT INTO `app_user` VALUES ('663', 'wangxiaocui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangxiaocui@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2012-02-22 00:00:00', '1', null, '王小翠', '0');
INSERT INTO `app_user` VALUES ('664', 'liuxiaoyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuxiaoyuan@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-02-24 00:00:00', '1', null, '刘小媛', '0');
INSERT INTO `app_user` VALUES ('665', 'weiruiqing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'weiruiqing@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-02-24 00:00:00', '1', null, '未瑞清', '0');
INSERT INTO `app_user` VALUES ('666', 'wangchuansheng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangchuansheng@shopin.cn', '33', '安保员', null, null, null, null, null, null, '2012-02-24 00:00:00', '1', null, '王传生', '0');
INSERT INTO `app_user` VALUES ('667', 'chenfang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'chenfang@shopin.cn', '37', '初级文员', null, null, null, null, null, null, '2012-02-27 00:00:00', '1', null, '陈芳', '0');
INSERT INTO `app_user` VALUES ('668', 'sunli', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'sunli@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '孙丽', '0');
INSERT INTO `app_user` VALUES ('669', 'linyucheng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'linyucheng@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '林宇骋', '0');
INSERT INTO `app_user` VALUES ('670', 'yuguiyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yuguiyan@shopin.cn', '31', '初级收银员', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '于桂燕', '0');
INSERT INTO `app_user` VALUES ('671', 'zhangxia01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangxia01@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '张霞', '0');
INSERT INTO `app_user` VALUES ('672', 'wangxingran', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangxingran@shopin.cn', '48', '生产线操作员', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '王兴苒', '0');
INSERT INTO `app_user` VALUES ('673', 'gengpengyu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'gengpengyu@shopin.cn', '48', '生产线操作员', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '耿鹏宇', '0');
INSERT INTO `app_user` VALUES ('674', 'baiyushuo', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'baiyushuo@shopin.cn', '10', '合同审核助理', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '白玉硕', '0');
INSERT INTO `app_user` VALUES ('675', 'qixiaochen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'qixiaochen@shopin.cn', '48', '驻店配送员', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '祁晓晨', '0');
INSERT INTO `app_user` VALUES ('676', 'lixin', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'lixin@shopin.cn', '31', '卖场主管', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '李欣', '0');
INSERT INTO `app_user` VALUES ('677', 'wuyingnan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wuyingnan@shopin.cn', '31', '客服主管', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '吴英男', '0');
INSERT INTO `app_user` VALUES ('678', 'guoluman', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guoluman@shopin.cn', '47', '商品规划运营专员', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '郭鲁曼', '0');
INSERT INTO `app_user` VALUES ('679', 'wujing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wujing@shopin.cn', '29', '客服文员', null, null, null, null, null, null, '2012-03-01 00:00:00', '1', null, '吴静', '0');
INSERT INTO `app_user` VALUES ('680', 'songjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'songjing@shopin.cn', '49', '初级客服代表-电话专员', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '宋菁', '0');
INSERT INTO `app_user` VALUES ('681', 'zhangsiqing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangsiqing@shopin.cn', '49', '初级客服代表-电话专员', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '张丝清', '0');
INSERT INTO `app_user` VALUES ('682', 'zhangjing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangjing@shopin.cn', '49', '初级客服代表-电话专员', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '张婧', '0');
INSERT INTO `app_user` VALUES ('683', 'wangxuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangxuan@shopin.cn', '59', '数据支持小组助理', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '王璇', '0');
INSERT INTO `app_user` VALUES ('684', 'fangyangyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fangyangyang@shopin.cn', '10', '合同审核助理', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '方羊羊', '0');
INSERT INTO `app_user` VALUES ('685', 'zhangwei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangwei@shopin.cn', '31', '客服文员', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '张伟', '0');
INSERT INTO `app_user` VALUES ('686', 'fuqiang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'fuqiang@shopin.cn', '33', '初级收银员', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '付嫱', '0');
INSERT INTO `app_user` VALUES ('687', 'tianchunyang', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'tianchunyang@shopin.cn', '54', '运维工程师', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '田春阳', '0');
INSERT INTO `app_user` VALUES ('688', 'guozhixing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guozhixing@shopin.cn', '54', '运维工程师', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '郭志兴', '0');
INSERT INTO `app_user` VALUES ('689', 'liangyingzhi', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liangyingzhi@shopin.cn', '63', '在线销售及初级客服代表', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '梁英芝', '0');
INSERT INTO `app_user` VALUES ('690', 'huyongdong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huyongdong@shopin.cn', '48', '生产线操作员', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '胡永东', '0');
INSERT INTO `app_user` VALUES ('691', 'caixingdong', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'caixingdong@shopin.cn', '48', '生产线操作员', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '蔡兴东', '0');
INSERT INTO `app_user` VALUES ('692', 'wangdaohui', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangdaohui@shopin.cn', '48', '驻店配送员', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '王道晖', '0');
INSERT INTO `app_user` VALUES ('693', 'weiyuanyuan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'weiyuanyuan@shopin.cn', '48', '驻店配送员', null, null, null, null, null, null, '2012-03-07 00:00:00', '1', null, '韦媛媛', '0');
INSERT INTO `app_user` VALUES ('694', 'zhouyongping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhouyongping@shopin.cn', '48', '驻店配送员', null, null, null, null, null, null, '2012-03-08 00:00:00', '1', null, '周永平', '0');
INSERT INTO `app_user` VALUES ('695', 'liuyang02', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuyang02@shopin.cn', '48', '生产线操作员', null, null, null, null, null, null, '2012-03-14 00:00:00', '1', null, '刘洋', '0');
INSERT INTO `app_user` VALUES ('696', 'yanglinfeng', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'yanglinfeng@shopin.cn', '48', '生产线操作员', null, null, null, null, null, null, '2012-03-14 00:00:00', '1', null, '杨林峰', '0');
INSERT INTO `app_user` VALUES ('697', 'zhaowei', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhaowei@shopin.cn', '48', '生产线操作员', null, null, null, null, null, null, '2012-03-14 00:00:00', '1', null, '赵伟', '0');
INSERT INTO `app_user` VALUES ('698', 'jinshaochen', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'jinshaochen@shopin.cn', '36', '初级库管', null, null, null, null, null, null, '2012-03-14 00:00:00', '1', null, '金少臣', '0');
INSERT INTO `app_user` VALUES ('699', 'zhangxiaolan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'zhangxiaolan@shopin.cn', '47', '商品规划运营专员', null, null, null, null, null, null, '2012-03-14 00:00:00', '1', null, '张晓兰', '0');
INSERT INTO `app_user` VALUES ('700', 'hongyan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'hongyan@shopin.cn', '10', '合同审核助理', null, null, null, null, null, null, '2012-03-14 00:00:00', '1', null, '洪燕', '0');
INSERT INTO `app_user` VALUES ('701', 'manian', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'manian@shopin.cn', '63', '商品经营专员', null, null, null, null, null, null, '2012-03-14 00:00:00', '1', null, '马年', '0');
INSERT INTO `app_user` VALUES ('702', 'liuyan01', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liuyan01@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2012-03-14 00:00:00', '1', null, '刘艳', '0');
INSERT INTO `app_user` VALUES ('703', 'liubing', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'liubing@shopin.cn', '36', '初级收银员', null, null, null, null, null, null, '2012-03-14 00:00:00', '1', null, '刘冰', '0');
INSERT INTO `app_user` VALUES ('704', 'huanglili', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'huanglili@shopin.cn', '29', '初级收银员', null, null, null, null, null, null, '2012-03-14 00:00:00', '1', null, '黄丽丽', '0');
INSERT INTO `app_user` VALUES ('705', 'wangping', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'wangping@shopin.cn', '33', '客服主管', null, null, null, null, null, null, '2012-03-15 00:00:00', '1', null, '王苹', '0');
INSERT INTO `app_user` VALUES ('707', 'caolulu', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'caolulu@shopin.cn', '53', 'ERP业务顾问', '', '', '', '', '', '', '2012-02-15 00:00:00', '1', null, '曹鹭鹭', '0');
INSERT INTO `app_user` VALUES ('711', 'guanyinan', '0', 'kbTRQoI/fSDF8I32kSLeQ/NfBXqYjZYZ9tMThIXJogM=', 'guanyinan@shopin.cn', '42', '', '', '', '', '', '', '', '2012-05-01 00:00:00', '1', null, '关轶楠', '0');

-- ----------------------------
-- Table structure for `appointment`
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment` (
  `appointId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '主键',
  `subject` varchar(128) NOT NULL COMMENT '主题',
  `startTime` datetime NOT NULL COMMENT '开始时间',
  `endTime` datetime NOT NULL COMMENT '结束时间',
  `content` text NOT NULL COMMENT '约会内容',
  `notes` varchar(1000) DEFAULT NULL COMMENT '备注',
  `location` varchar(150) NOT NULL COMMENT '地点',
  `inviteEmails` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`appointId`),
  KEY `FK_AP_R_AU` (`userId`) USING BTREE,
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `app_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='约会管理';

-- ----------------------------
-- Records of appointment
-- ----------------------------

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `companyId` bigint(20) NOT NULL AUTO_INCREMENT,
  `companyNo` varchar(128) DEFAULT NULL,
  `companyName` varchar(128) NOT NULL,
  `companyDesc` varchar(4000) DEFAULT NULL,
  `legalPerson` varchar(32) DEFAULT NULL,
  `setup` datetime DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `site` varchar(128) DEFAULT NULL,
  `logo` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='公司信息';

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '', '上品折扣', '<br>​', '', '2011-11-29 00:00:00', '', '', '', '');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `depId` bigint(20) NOT NULL AUTO_INCREMENT,
  `depName` varchar(128) NOT NULL COMMENT '部门名称',
  `depDesc` varchar(256) DEFAULT NULL COMMENT '部门描述',
  `depLevel` int(11) NOT NULL COMMENT '层次',
  `parentId` bigint(20) DEFAULT NULL,
  `path` varchar(128) DEFAULT NULL COMMENT '路径',
  `phone` varchar(64) DEFAULT NULL,
  `fax` varchar(64) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`depId`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '总裁办公室', '总裁办公室', '3', '5', '0.5.5.1.', null, null, '2');
INSERT INTO `department` VALUES ('2', '门店运营中心', '办公室', '3', '5', '0.5.5.2.', null, null, '3');
INSERT INTO `department` VALUES ('3', '财务部', '财务部', '3', '5', '0.5.5.3.', null, null, '4');
INSERT INTO `department` VALUES ('4', '企业发展部', '企业发展部', '3', '5', '0.5.5.4.', null, null, '5');
INSERT INTO `department` VALUES ('5', '上品公司', '上品公司', '2', '0', '0.5.5.', null, null, null);
INSERT INTO `department` VALUES ('10', '合同管理部', '合同管理部', '3', '5', '0.5.5.10.', null, null, '6');
INSERT INTO `department` VALUES ('11', '人力资源部', '人力资源部', '3', '5', '0.5.5.11.', null, null, '7');
INSERT INTO `department` VALUES ('19', '行政部', '行政部', '3', '5', '0.5.5.19.', null, null, '8');
INSERT INTO `department` VALUES ('26', '信息系统部', '信息系统部', '3', '5', '0.5.5.26.', null, null, '9');
INSERT INTO `department` VALUES ('27', '商品经营中心', '商品经营中心', '3', '5', '0.5.5.27.', null, null, '10');
INSERT INTO `department` VALUES ('28', '电子商务经营中心', '电子商务经营中心', '3', '5', '0.5.5.28.', null, null, '11');
INSERT INTO `department` VALUES ('29', '亚运村店', '亚运村店', '4', '2', '0.5.2.29.', null, null, '1');
INSERT INTO `department` VALUES ('30', '首体店', '首体', '4', '2', '0.5.2.30.', null, null, '2');
INSERT INTO `department` VALUES ('31', '王府井店', '王府井店', '4', '2', '0.5.2.31.', null, null, '3');
INSERT INTO `department` VALUES ('32', '五棵松店', '五棵松店', '4', '2', '0.5.2.32.', null, null, '4');
INSERT INTO `department` VALUES ('33', '中关村店', '中关村店', '4', '2', '0.5.2.33.', null, null, '5');
INSERT INTO `department` VALUES ('34', '朝阳门店', '朝阳门店', '4', '2', '0.5.2.34.', null, null, '6');
INSERT INTO `department` VALUES ('35', '三里河店', '三里河店', '4', '2', '0.5.2.35.', null, null, '7');
INSERT INTO `department` VALUES ('36', '来广营店', '来广营店', '4', '2', '0.5.2.36.', null, null, '8');
INSERT INTO `department` VALUES ('37', '运营支持部', '运营支持部', '4', '2', '0.5.5.2.37.', null, null, '11');
INSERT INTO `department` VALUES ('38', '防损部', '防损部', '4', '2', '0.5.2.38.', null, null, '9');
INSERT INTO `department` VALUES ('39', '工程部', '工程部', '4', '2', '0.5.2.39.', null, null, '10');
INSERT INTO `department` VALUES ('40', '财务部（总部）', '财务部（门店）', '4', '3', '0.5.3.40.', null, null, '1');
INSERT INTO `department` VALUES ('41', '财务部（门店）', '财务部（门店）', '4', '3', '0.5.3.41.', null, null, '2');
INSERT INTO `department` VALUES ('42', '市场营销部', '市场营销部', '4', '27', '0.5.5.27.42.', null, null, '5');
INSERT INTO `department` VALUES ('43', '商品规划部', '商品规划部', '4', '27', '0.5.5.27.43.', null, null, '3');
INSERT INTO `department` VALUES ('44', '商品组织部', '商品组织部', '4', '27', '0.5.27.44.', null, null, null);
INSERT INTO `department` VALUES ('45', '商品经营中心数据服务支持小组', '商品经营中心数据服务支持小组', '4', '27', '0.5.27.45.', null, null, null);
INSERT INTO `department` VALUES ('46', '未分配部门', '未分配部门', '3', '5', '0.5.5.46.', null, null, '13');
INSERT INTO `department` VALUES ('47', '商品运营部', '商品运营部', '4', '28', '0.5.5.28.47.', null, null, '3');
INSERT INTO `department` VALUES ('48', '物流部', '物流部', '4', '28', '0.5.5.28.48.', null, null, '2');
INSERT INTO `department` VALUES ('49', '客服部', '客服部', '4', '28', '0.5.5.28.49.', null, null, '8');
INSERT INTO `department` VALUES ('50', '公司领导', '公司领导', '3', '5', '0.5.5.50.', null, null, '1');
INSERT INTO `department` VALUES ('51', '中关村示范店建设项目部', '中关村示范店建设项目部', '3', '5', '0.5.5.51.', null, null, '12');
INSERT INTO `department` VALUES ('52', '流程管理部', '流程管理部', '4', '26', '0.5.5.26.52.', null, null, '1');
INSERT INTO `department` VALUES ('53', '单品管理部', '单品管理部', '4', '26', '0.5.5.26.53.', null, null, '2');
INSERT INTO `department` VALUES ('54', '运维部', '运维部', '4', '26', '0.5.5.26.54.', null, null, '3');
INSERT INTO `department` VALUES ('55', '技术部', '技术部', '4', '26', '0.5.5.26.55.', null, null, '4');
INSERT INTO `department` VALUES ('56', '产品部', '产品部', '4', '26', '0.5.5.26.56.', null, null, '5');
INSERT INTO `department` VALUES ('57', '商品组织部一部', '商品组织部一部', '4', '27', '0.5.5.27.57.', null, null, '1');
INSERT INTO `department` VALUES ('58', '商品组织部二部', '商品组织部二部', '4', '27', '0.5.5.27.58.', null, null, '2');
INSERT INTO `department` VALUES ('59', '服务支持组', '富足支持组', '4', '27', '0.5.5.27.59.', null, null, '4');
INSERT INTO `department` VALUES ('60', '电子商务经营中心', '电子商务经营中心', '4', '28', '0.5.5.28.60.', null, null, '1');
INSERT INTO `department` VALUES ('61', '拍照部', '拍照部', '4', '28', '0.5.5.28.61.', null, null, '4');
INSERT INTO `department` VALUES ('62', '市场营销部', '市场营销部', '4', '28', '0.5.5.28.62.', null, null, '5');
INSERT INTO `department` VALUES ('63', '网络连锁项目部', '网络连锁项目部', '4', '28', '0.5.5.28.63.', null, null, '6');
INSERT INTO `department` VALUES ('64', '运营支持组', '运营支持组', '4', '28', '0.5.5.28.64.', null, null, '7');
INSERT INTO `department` VALUES ('66', '运营管理部', '运营管理部', '4', '2', '0.5.5.2.66.', null, null, '12');

-- ----------------------------
-- Table structure for `diary`
-- ----------------------------
DROP TABLE IF EXISTS `diary`;
CREATE TABLE `diary` (
  `diaryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL COMMENT '主键',
  `dayTime` date NOT NULL,
  `content` text NOT NULL,
  `diaryType` smallint(6) NOT NULL COMMENT '1=工作日志\r\n            0=个人日志',
  PRIMARY KEY (`diaryId`),
  KEY `FK_DY_R_AU` (`userId`) USING BTREE,
  CONSTRAINT `diary_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `app_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diary
-- ----------------------------
INSERT INTO `diary` VALUES ('1', '1', '2011-11-29', 'dfgdfg', '0');

-- ----------------------------
-- Table structure for `dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `dicId` bigint(20) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(64) NOT NULL,
  `itemValue` varchar(128) NOT NULL,
  `descp` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`dicId`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 COMMENT='数据字典';

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('1', '宗教信仰', '佛教', null);
INSERT INTO `dictionary` VALUES ('2', '宗教信仰', '道教', null);
INSERT INTO `dictionary` VALUES ('3', '宗教信仰', '基督宗教', null);
INSERT INTO `dictionary` VALUES ('4', '宗教信仰', '天主教', null);
INSERT INTO `dictionary` VALUES ('5', '宗教信仰', '伊斯兰教', null);
INSERT INTO `dictionary` VALUES ('6', '宗教信仰', '犹太教', null);
INSERT INTO `dictionary` VALUES ('7', '宗教信仰', '孔教', null);
INSERT INTO `dictionary` VALUES ('8', '宗教信仰', '神道教', null);
INSERT INTO `dictionary` VALUES ('9', '宗教信仰', '耆那教', null);
INSERT INTO `dictionary` VALUES ('10', '宗教信仰', '印度教', null);
INSERT INTO `dictionary` VALUES ('11', '宗教信仰', '东正教', null);
INSERT INTO `dictionary` VALUES ('12', '宗教信仰', '新教', null);
INSERT INTO `dictionary` VALUES ('13', '宗教信仰', '锡克教', null);
INSERT INTO `dictionary` VALUES ('14', '宗教信仰', '琐罗亚斯德教', null);
INSERT INTO `dictionary` VALUES ('15', '宗教信仰', '巴哈伊教', null);
INSERT INTO `dictionary` VALUES ('16', '宗教信仰', '其它', null);
INSERT INTO `dictionary` VALUES ('17', '民族', '汉族', null);
INSERT INTO `dictionary` VALUES ('18', '民族', '阿昌族', null);
INSERT INTO `dictionary` VALUES ('19', '民族', '白族', null);
INSERT INTO `dictionary` VALUES ('20', '民族', '保安族', null);
INSERT INTO `dictionary` VALUES ('21', '民族', '布朗族', null);
INSERT INTO `dictionary` VALUES ('22', '民族', '布依族', null);
INSERT INTO `dictionary` VALUES ('23', '民族', '朝鲜族', null);
INSERT INTO `dictionary` VALUES ('24', '民族', '达斡族', null);
INSERT INTO `dictionary` VALUES ('25', '民族', '傣族', null);
INSERT INTO `dictionary` VALUES ('26', '民族', '德昂族', null);
INSERT INTO `dictionary` VALUES ('27', '民族', '侗族', null);
INSERT INTO `dictionary` VALUES ('28', '民族', '东乡族', null);
INSERT INTO `dictionary` VALUES ('29', '民族', '独龙族', null);
INSERT INTO `dictionary` VALUES ('30', '民族', '鄂伦春族', null);
INSERT INTO `dictionary` VALUES ('31', '民族', '俄罗斯族', null);
INSERT INTO `dictionary` VALUES ('32', '民族', '鄂温克族', null);
INSERT INTO `dictionary` VALUES ('33', '民族', '高山族', null);
INSERT INTO `dictionary` VALUES ('34', '民族', '仡佬族', null);
INSERT INTO `dictionary` VALUES ('35', '民族', '哈尼族', null);
INSERT INTO `dictionary` VALUES ('36', '民族', '啥萨克族', null);
INSERT INTO `dictionary` VALUES ('37', '民族', '赫哲族', null);
INSERT INTO `dictionary` VALUES ('38', '民族', '回族', null);
INSERT INTO `dictionary` VALUES ('39', '民族', '基诺族', null);
INSERT INTO `dictionary` VALUES ('40', '民族', '京族', null);
INSERT INTO `dictionary` VALUES ('41', '民族', '景颇族', null);
INSERT INTO `dictionary` VALUES ('42', '民族', '柯尔克孜族', null);
INSERT INTO `dictionary` VALUES ('43', '民族', '拉祜族', null);
INSERT INTO `dictionary` VALUES ('44', '民族', '黎族', null);
INSERT INTO `dictionary` VALUES ('45', '民族', '僳僳族', null);
INSERT INTO `dictionary` VALUES ('46', '民族', '珞巴族', null);
INSERT INTO `dictionary` VALUES ('47', '民族', '满族', null);
INSERT INTO `dictionary` VALUES ('48', '民族', '毛南族', null);
INSERT INTO `dictionary` VALUES ('49', '民族', '门巴族', null);
INSERT INTO `dictionary` VALUES ('50', '民族', '蒙古族', null);
INSERT INTO `dictionary` VALUES ('51', '民族', '苗族', null);
INSERT INTO `dictionary` VALUES ('52', '民族', '仫佬族', null);
INSERT INTO `dictionary` VALUES ('53', '民族', '纳西族', null);
INSERT INTO `dictionary` VALUES ('54', '民族', '怒族', null);
INSERT INTO `dictionary` VALUES ('55', '民族', '普米族', null);
INSERT INTO `dictionary` VALUES ('56', '民族', '羌族', null);
INSERT INTO `dictionary` VALUES ('57', '民族', '撒拉族', null);
INSERT INTO `dictionary` VALUES ('58', '民族', '畲族', null);
INSERT INTO `dictionary` VALUES ('59', '民族', '水族', null);
INSERT INTO `dictionary` VALUES ('60', '民族', '塔吉克族', null);
INSERT INTO `dictionary` VALUES ('61', '民族', '塔塔尔族', null);
INSERT INTO `dictionary` VALUES ('62', '民族', '土族', null);
INSERT INTO `dictionary` VALUES ('63', '民族', '土家族', null);
INSERT INTO `dictionary` VALUES ('64', '民族', '佤族', null);
INSERT INTO `dictionary` VALUES ('65', '民族', '维吾尔族', null);
INSERT INTO `dictionary` VALUES ('66', '民族', '乌孜别克族', null);
INSERT INTO `dictionary` VALUES ('67', '民族', '锡伯族', null);
INSERT INTO `dictionary` VALUES ('68', '民族', '瑶族', null);
INSERT INTO `dictionary` VALUES ('69', '民族', '彝族', null);
INSERT INTO `dictionary` VALUES ('70', '民族', '藏族', null);
INSERT INTO `dictionary` VALUES ('71', '民族', '壮族', null);
INSERT INTO `dictionary` VALUES ('72', '学历', '博士', null);
INSERT INTO `dictionary` VALUES ('73', '学历', '研究生', null);
INSERT INTO `dictionary` VALUES ('74', '学历', '本科', null);
INSERT INTO `dictionary` VALUES ('75', '学历', '大专', null);
INSERT INTO `dictionary` VALUES ('76', '学历', '中专', null);
INSERT INTO `dictionary` VALUES ('77', '学历', '初中', null);
INSERT INTO `dictionary` VALUES ('78', '学历', '小学', null);
INSERT INTO `dictionary` VALUES ('79', '学历', '其它', null);
INSERT INTO `dictionary` VALUES ('80', '政治面貌', '群众', null);
INSERT INTO `dictionary` VALUES ('81', '政治面貌', '共青团员', null);
INSERT INTO `dictionary` VALUES ('82', '政治面貌', '中共党员', null);
INSERT INTO `dictionary` VALUES ('83', '国籍', '中华人民共和国', null);
INSERT INTO `dictionary` VALUES ('84', '国籍', '美国', null);
INSERT INTO `dictionary` VALUES ('85', '国籍', '俄罗斯', null);
INSERT INTO `dictionary` VALUES ('86', '国籍', '日本', null);
INSERT INTO `dictionary` VALUES ('87', '国籍', '韩国', null);
INSERT INTO `dictionary` VALUES ('88', '国籍', '新加波', null);
INSERT INTO `dictionary` VALUES ('89', '国籍', '马来西亚', null);
INSERT INTO `dictionary` VALUES ('90', '国籍', '英国', null);
INSERT INTO `dictionary` VALUES ('91', '国籍', '德国', null);
INSERT INTO `dictionary` VALUES ('92', '国籍', '意大利', null);
INSERT INTO `dictionary` VALUES ('93', '国籍', '澳大利亚', null);
INSERT INTO `dictionary` VALUES ('94', '国籍', '巴西', null);
INSERT INTO `dictionary` VALUES ('95', '专业', '管理科学', null);
INSERT INTO `dictionary` VALUES ('96', '专业', '信息管理和信息系统', null);
INSERT INTO `dictionary` VALUES ('97', '专业', '工业工程', null);
INSERT INTO `dictionary` VALUES ('98', '专业', '工程管理', null);
INSERT INTO `dictionary` VALUES ('99', '专业', '农业经理管理', null);
INSERT INTO `dictionary` VALUES ('100', '专业', '工商管理', null);
INSERT INTO `dictionary` VALUES ('101', '专业', '市场营销', null);
INSERT INTO `dictionary` VALUES ('102', '专业', '会计学', null);
INSERT INTO `dictionary` VALUES ('103', '专业', '涉外会计', null);
INSERT INTO `dictionary` VALUES ('104', '专业', '会计电算化', null);
INSERT INTO `dictionary` VALUES ('105', '专业', '财政金融', null);
INSERT INTO `dictionary` VALUES ('106', '专业', '财务管理', null);
INSERT INTO `dictionary` VALUES ('107', '专业', '技术经济', null);
INSERT INTO `dictionary` VALUES ('108', '专业', '文秘', null);
INSERT INTO `dictionary` VALUES ('109', '专业', '国际商务', null);
INSERT INTO `dictionary` VALUES ('110', '专业', '物流管理', null);
INSERT INTO `dictionary` VALUES ('111', '专业', '行政管理', null);
INSERT INTO `dictionary` VALUES ('112', '专业', '公共事业管理', null);
INSERT INTO `dictionary` VALUES ('113', '专业', '旅游管理', null);
INSERT INTO `dictionary` VALUES ('114', '专业', '宾馆/酒店管理', null);
INSERT INTO `dictionary` VALUES ('115', '专业', '人力资源管理', null);
INSERT INTO `dictionary` VALUES ('116', '专业', '公共关系学', null);
INSERT INTO `dictionary` VALUES ('117', '专业', '物业管理', null);
INSERT INTO `dictionary` VALUES ('118', '专业', '房地产经营管理', null);
INSERT INTO `dictionary` VALUES ('119', '专业', '劳动与社会保障', null);
INSERT INTO `dictionary` VALUES ('120', '专业', '土地资源管理', null);
INSERT INTO `dictionary` VALUES ('121', '专业', '图书档案学', null);
INSERT INTO `dictionary` VALUES ('122', '专业', '计算机科学与技术', null);
INSERT INTO `dictionary` VALUES ('123', '专业', '计算机应用', null);
INSERT INTO `dictionary` VALUES ('124', '专业', '计算机信息管理', null);
INSERT INTO `dictionary` VALUES ('125', '专业', '计算机网络', null);
INSERT INTO `dictionary` VALUES ('126', '专业', '电子商务', null);
INSERT INTO `dictionary` VALUES ('127', '专业', '通信工程', null);
INSERT INTO `dictionary` VALUES ('128', '专业', '电气工程及其自动化', null);
INSERT INTO `dictionary` VALUES ('129', '专业', '软件工程', null);
INSERT INTO `dictionary` VALUES ('130', '专业', '自动化', null);
INSERT INTO `dictionary` VALUES ('131', '专业', '电子信息工程', null);
INSERT INTO `dictionary` VALUES ('132', '专业', '电子科学与技术', null);
INSERT INTO `dictionary` VALUES ('133', '专业', '电子信息科学与技术', null);
INSERT INTO `dictionary` VALUES ('134', '专业', '微电子学', null);
INSERT INTO `dictionary` VALUES ('135', '专业', '光信息科学与技术', null);
INSERT INTO `dictionary` VALUES ('136', '专业', '机械设计制造及其自动化', null);
INSERT INTO `dictionary` VALUES ('137', '专业', '材料成型及控制工程', null);
INSERT INTO `dictionary` VALUES ('138', '专业', '工业设计', null);
INSERT INTO `dictionary` VALUES ('139', '专业', '过程装备与控制工程', null);
INSERT INTO `dictionary` VALUES ('140', '专业', '机械电子工程/机电一体化', null);
INSERT INTO `dictionary` VALUES ('141', '专业', '模具设计与制造', null);
INSERT INTO `dictionary` VALUES ('142', '专业', '机械制造工艺与设备', null);
INSERT INTO `dictionary` VALUES ('143', '专业', '测控技术与仪器', null);
INSERT INTO `dictionary` VALUES ('144', '专业', '热能与动力工程', null);
INSERT INTO `dictionary` VALUES ('145', '专业', '核工程与核技术', null);
INSERT INTO `dictionary` VALUES ('146', '专业', '电力系统及自动化', null);
INSERT INTO `dictionary` VALUES ('147', '专业', '制冷与低温技术', null);
INSERT INTO `dictionary` VALUES ('148', '专业', '冶金工程', null);
INSERT INTO `dictionary` VALUES ('149', '专业', '金属材料工程', null);
INSERT INTO `dictionary` VALUES ('150', '专业', '无机非金属料工程', null);
INSERT INTO `dictionary` VALUES ('151', '专业', '高分子材料与工程', null);
INSERT INTO `dictionary` VALUES ('152', '专业', '材料物理', null);
INSERT INTO `dictionary` VALUES ('153', '专业', '材料化学', null);
INSERT INTO `dictionary` VALUES ('154', '专业', '材料科学与工程', null);
INSERT INTO `dictionary` VALUES ('155', '专业', '食品科学与工程', null);
INSERT INTO `dictionary` VALUES ('156', '专业', '轻化工程', null);
INSERT INTO `dictionary` VALUES ('157', '专业', '包装工程', null);
INSERT INTO `dictionary` VALUES ('158', '专业', '印刷工程', null);
INSERT INTO `dictionary` VALUES ('159', '专业', '纺织工程', null);
INSERT INTO `dictionary` VALUES ('160', '专业', '服装设计与工程', null);
INSERT INTO `dictionary` VALUES ('161', '专业', '建筑学', null);
INSERT INTO `dictionary` VALUES ('162', '专业', '城市规划', null);
INSERT INTO `dictionary` VALUES ('163', '专业', '园林规划与设计', null);
INSERT INTO `dictionary` VALUES ('164', '专业', '土木工程', null);
INSERT INTO `dictionary` VALUES ('165', '专业', '道路与桥梁', null);
INSERT INTO `dictionary` VALUES ('166', '专业', '建设环境与设备工程', null);
INSERT INTO `dictionary` VALUES ('167', '专业', '给水排水工程', null);
INSERT INTO `dictionary` VALUES ('168', '专业', '供热通风与空调工程', null);
INSERT INTO `dictionary` VALUES ('169', '专业', '工业与民用建筑', null);
INSERT INTO `dictionary` VALUES ('170', '专业', '室内装潢设计', null);
INSERT INTO `dictionary` VALUES ('171', '专业', '建筑工程', null);
INSERT INTO `dictionary` VALUES ('172', '专业', '工程造价管理', null);
INSERT INTO `dictionary` VALUES ('173', '专业', '力学', null);
INSERT INTO `dictionary` VALUES ('174', '专业', '应用力学', null);
INSERT INTO `dictionary` VALUES ('175', '专业', '环境科学', null);
INSERT INTO `dictionary` VALUES ('176', '专业', '生态学', null);
INSERT INTO `dictionary` VALUES ('177', '专业', '环境工程', null);
INSERT INTO `dictionary` VALUES ('178', '专业', '安全工程', null);
INSERT INTO `dictionary` VALUES ('179', '专业', '制药工程', null);
INSERT INTO `dictionary` VALUES ('180', '专业', '交通运输', null);
INSERT INTO `dictionary` VALUES ('181', '专业', '交通工程', null);
INSERT INTO `dictionary` VALUES ('182', '专业', '油气储运工程', null);
INSERT INTO `dictionary` VALUES ('183', '专业', '飞行技术', null);
INSERT INTO `dictionary` VALUES ('184', '专业', '航海技术', null);
INSERT INTO `dictionary` VALUES ('185', '专业', '轮机工程', null);
INSERT INTO `dictionary` VALUES ('186', '专业', '汽车工程', null);
INSERT INTO `dictionary` VALUES ('187', '专业', '飞行器设计与工程', null);
INSERT INTO `dictionary` VALUES ('188', '专业', '飞行器动力工程', null);
INSERT INTO `dictionary` VALUES ('189', '专业', '飞行器制造工程', null);
INSERT INTO `dictionary` VALUES ('190', '专业', '飞行器环境与生命保障工程', null);
INSERT INTO `dictionary` VALUES ('191', '专业', '船舶与海洋工程', null);
INSERT INTO `dictionary` VALUES ('192', '专业', '水利水电工程', null);
INSERT INTO `dictionary` VALUES ('193', '专业', '水文与水资源工程', null);
INSERT INTO `dictionary` VALUES ('194', '专业', '港口航道与海岸工程', null);
INSERT INTO `dictionary` VALUES ('195', '专业', '测绘工程', null);
INSERT INTO `dictionary` VALUES ('196', '专业', '公安技术', null);
INSERT INTO `dictionary` VALUES ('197', '专业', '武器系统与发射工程', null);
INSERT INTO `dictionary` VALUES ('198', '专业', '探测制导与控制技术', null);
INSERT INTO `dictionary` VALUES ('199', '专业', '弹药工程与爆炸技术', null);
INSERT INTO `dictionary` VALUES ('200', '专业', '数学与应用数学', null);
INSERT INTO `dictionary` VALUES ('201', '专业', '信息与计算科学', null);
INSERT INTO `dictionary` VALUES ('202', '专业', '物理学', null);
INSERT INTO `dictionary` VALUES ('203', '专业', '应用物理学', null);
INSERT INTO `dictionary` VALUES ('204', '专业', '化学', null);
INSERT INTO `dictionary` VALUES ('205', '专业', '应用化学', null);
INSERT INTO `dictionary` VALUES ('206', '专业', '化学工程与工艺', null);
INSERT INTO `dictionary` VALUES ('207', '专业', '精细化工', null);
INSERT INTO `dictionary` VALUES ('208', '专业', '化工设备与机械', null);
INSERT INTO `dictionary` VALUES ('209', '专业', '生物工程', null);
INSERT INTO `dictionary` VALUES ('210', '专业', '生物医学工程', null);
INSERT INTO `dictionary` VALUES ('211', '专业', '生物科学,技术', null);
INSERT INTO `dictionary` VALUES ('212', '专业', '天文学', null);
INSERT INTO `dictionary` VALUES ('213', '专业', '地质学', null);
INSERT INTO `dictionary` VALUES ('214', '专业', '宝石鉴定与加工', null);
INSERT INTO `dictionary` VALUES ('215', '专业', '地理科学', null);
INSERT INTO `dictionary` VALUES ('216', '专业', '地球物理学', null);
INSERT INTO `dictionary` VALUES ('217', '专业', '大气科学', null);
INSERT INTO `dictionary` VALUES ('218', '专业', '海洋科学', null);
INSERT INTO `dictionary` VALUES ('219', '专业', '地矿', null);
INSERT INTO `dictionary` VALUES ('220', '专业', '石油工程', null);
INSERT INTO `dictionary` VALUES ('221', '专业', '经济学', null);
INSERT INTO `dictionary` VALUES ('222', '专业', '国际经济与贸易', null);
INSERT INTO `dictionary` VALUES ('223', '专业', '财政学', null);
INSERT INTO `dictionary` VALUES ('224', '专业', '金融学', null);
INSERT INTO `dictionary` VALUES ('225', '专业', '经济管理', null);
INSERT INTO `dictionary` VALUES ('226', '专业', '经济信息管理', null);
INSERT INTO `dictionary` VALUES ('227', '专业', '工业外贸', null);
INSERT INTO `dictionary` VALUES ('228', '专业', '国际金融', null);
INSERT INTO `dictionary` VALUES ('229', '专业', '投资经济管理', null);
INSERT INTO `dictionary` VALUES ('230', '专业', '统计学', null);
INSERT INTO `dictionary` VALUES ('231', '专业', '审计学', null);
INSERT INTO `dictionary` VALUES ('232', '专业', '中国语言文学', null);
INSERT INTO `dictionary` VALUES ('233', '专业', '英语', null);
INSERT INTO `dictionary` VALUES ('234', '专业', '俄语', null);
INSERT INTO `dictionary` VALUES ('235', '专业', '德语', null);
INSERT INTO `dictionary` VALUES ('236', '专业', '法语', null);
INSERT INTO `dictionary` VALUES ('237', '专业', '日语', null);
INSERT INTO `dictionary` VALUES ('238', '专业', '西班牙语', null);
INSERT INTO `dictionary` VALUES ('239', '专业', '阿拉伯语', null);
INSERT INTO `dictionary` VALUES ('240', '专业', '朝鲜语', null);
INSERT INTO `dictionary` VALUES ('241', '专业', '其它外语', null);
INSERT INTO `dictionary` VALUES ('242', '专业', '新闻学', null);
INSERT INTO `dictionary` VALUES ('243', '专业', '广播电视新闻', null);
INSERT INTO `dictionary` VALUES ('244', '专业', '广告学', null);
INSERT INTO `dictionary` VALUES ('245', '专业', '编辑出版学', null);
INSERT INTO `dictionary` VALUES ('246', '专业', '外贸英语', null);
INSERT INTO `dictionary` VALUES ('247', '专业', '商务英语', null);
INSERT INTO `dictionary` VALUES ('248', '专业', '音乐,舞蹈,作曲', null);
INSERT INTO `dictionary` VALUES ('249', '专业', '绘画,艺术设计', null);
INSERT INTO `dictionary` VALUES ('250', '专业', '戏剧,表演', null);
INSERT INTO `dictionary` VALUES ('251', '专业', '导演,广播电视编导', null);
INSERT INTO `dictionary` VALUES ('252', '专业', '戏剧影视文学', null);
INSERT INTO `dictionary` VALUES ('253', '专业', '戏剧影视美术设计', null);
INSERT INTO `dictionary` VALUES ('254', '专业', '摄影,动画', null);
INSERT INTO `dictionary` VALUES ('255', '专业', '播音,主持,录音', null);
INSERT INTO `dictionary` VALUES ('256', '专业', '服装设计', null);
INSERT INTO `dictionary` VALUES ('257', '专业', '法学', null);
INSERT INTO `dictionary` VALUES ('258', '专业', '马克思主义理论', null);
INSERT INTO `dictionary` VALUES ('259', '专业', '社会学', null);
INSERT INTO `dictionary` VALUES ('260', '专业', '政治学与行政学', null);
INSERT INTO `dictionary` VALUES ('261', '专业', '国际政治', null);
INSERT INTO `dictionary` VALUES ('262', '专业', '外交学', null);
INSERT INTO `dictionary` VALUES ('263', '专业', '思想政治教育', null);
INSERT INTO `dictionary` VALUES ('264', '专业', '公安学', null);
INSERT INTO `dictionary` VALUES ('265', '专业', '经济法', null);
INSERT INTO `dictionary` VALUES ('266', '专业', '国际经济法', null);
INSERT INTO `dictionary` VALUES ('267', '专业', '哲学', null);
INSERT INTO `dictionary` VALUES ('268', '专业', '逻辑学', null);
INSERT INTO `dictionary` VALUES ('269', '专业', '宗教学', null);
INSERT INTO `dictionary` VALUES ('270', '专业', '教育学', null);
INSERT INTO `dictionary` VALUES ('271', '专业', '学前教育', null);
INSERT INTO `dictionary` VALUES ('272', '专业', '体育学', null);
INSERT INTO `dictionary` VALUES ('273', '专业', '基础医学', null);
INSERT INTO `dictionary` VALUES ('274', '专业', '预防医学', null);
INSERT INTO `dictionary` VALUES ('275', '专业', '临床医学与医学技术', null);
INSERT INTO `dictionary` VALUES ('276', '专业', '口腔医学', null);
INSERT INTO `dictionary` VALUES ('277', '专业', '中医学', null);
INSERT INTO `dictionary` VALUES ('278', '专业', '法医学', null);
INSERT INTO `dictionary` VALUES ('279', '专业', '护理学', null);
INSERT INTO `dictionary` VALUES ('280', '专业', '药学', '');
INSERT INTO `dictionary` VALUES ('281', '专业', '心理学', null);
INSERT INTO `dictionary` VALUES ('282', '专业', '医学检验', null);
INSERT INTO `dictionary` VALUES ('283', '专业', '植物生产', null);
INSERT INTO `dictionary` VALUES ('284', '专业', '农学', null);
INSERT INTO `dictionary` VALUES ('285', '专业', '园艺', null);
INSERT INTO `dictionary` VALUES ('286', '专业', '植物保护学', null);
INSERT INTO `dictionary` VALUES ('287', '专业', '茶学', '');
INSERT INTO `dictionary` VALUES ('288', '专业', '草业科学', null);
INSERT INTO `dictionary` VALUES ('289', '专业', '森林资源', '');
INSERT INTO `dictionary` VALUES ('290', '专业', '环境生态', null);
INSERT INTO `dictionary` VALUES ('291', '专业', '园林', null);
INSERT INTO `dictionary` VALUES ('292', '专业', '动物生产', null);
INSERT INTO `dictionary` VALUES ('293', '专业', '动物医学', null);
INSERT INTO `dictionary` VALUES ('294', '专业', '水产类', null);
INSERT INTO `dictionary` VALUES ('295', '专业', '农业工程', null);
INSERT INTO `dictionary` VALUES ('296', '专业', '林业工程', null);
INSERT INTO `dictionary` VALUES ('297', '专业', '历史学', null);
INSERT INTO `dictionary` VALUES ('298', '专业', '考古学', null);
INSERT INTO `dictionary` VALUES ('299', '专业', '博物馆学', null);
INSERT INTO `dictionary` VALUES ('300', '奖惩类型', '奖励', '');
INSERT INTO `dictionary` VALUES ('301', '奖惩类型', '惩罚', '');

-- ----------------------------
-- Table structure for `file_attach`
-- ----------------------------
DROP TABLE IF EXISTS `file_attach`;
CREATE TABLE `file_attach` (
  `fileId` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(128) NOT NULL COMMENT '文件名',
  `filePath` varchar(128) NOT NULL COMMENT '文件路径',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `ext` varchar(32) DEFAULT NULL COMMENT '扩展名',
  `fileType` varchar(32) NOT NULL COMMENT '附件类型\r\n            如：邮件附件',
  `note` varchar(1024) DEFAULT NULL COMMENT '说明',
  `creator` varchar(32) NOT NULL COMMENT '上传者',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB AUTO_INCREMENT=4022 DEFAULT CHARSET=utf8 COMMENT='附件';

-- ----------------------------
-- Records of file_attach
-- ----------------------------
INSERT INTO `file_attach` VALUES ('24', '263EM_ScreenShot.jpg', '/attachFiles/system/company/201112/2ddbb0bd69dd4fc8a1aa0fe12c93a509.jpg', '2011-12-07 15:28:24', 'jpg', 'system/company', '14324 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('25', '263EM_ScreenShot.jpg', '/attachFiles/system/company/201112/17fca3e2bc194ca58ede38fb0a90bd72.jpg', '2011-12-07 15:55:50', 'jpg', 'system/company', '14324 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('26', '捕获1.png', '/attachFiles/system/company/201112/27edeccdc252460885739c93d39f83a8.png', '2011-12-07 16:19:00', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('27', '263EM_ScreenShot.jpg', '/attachFiles/system/company/201112/4ebc01ecee554c1fb136db94bfcbea25.jpg', '2011-12-07 16:25:14', 'jpg', 'system/company', '14324 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('28', '捕获1.png', '/attachFiles/system/company/201112/ac11529abfa44f6d82c030805e14298a.png', '2011-12-07 16:28:59', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('29', '捕获1.png', '/attachFiles/system/company/201112/2fdd0d71f8794bb49f91a3c65c6d27d1.png', '2011-12-07 16:29:35', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('30', '263EM_ScreenShot.jpg', '/attachFiles/system/company/201112/43714cc5e9c743f9b0c2e852102eafec.jpg', '2011-12-07 16:29:35', 'jpg', 'system/company', '14324 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('31', '263EM_ScreenShot.jpg', '/attachFiles/system/company/201112/a9b1db97fcf4400488ec4b66365dcc6c.jpg', '2011-12-07 16:55:24', 'jpg', 'system/company', '14324 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('32', '263EM_ScreenShot.jpg', '/attachFiles/system/company/201112/3ce0aefcb2ab4a2da78aa90d10fc793d.jpg', '2011-12-07 16:56:32', 'jpg', 'system/company', '14324 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('33', 'bandTemplate.xls', '/attachFiles/uploadData/201112/aab358b3820c464b9cb72e3fe4e4cc70.xls', '2011-12-12 09:45:56', 'xls', 'uploadData', '24064 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('34', '捕获1.png', '/attachFiles/system/company/201112/51c604e064b04ecaaeb9d0b168ea30f7.png', '2011-12-13 15:55:00', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('35', '捕获1.png', '/attachFiles/system/company/201112/b8a0b958f72b43b882a0e63b57a4c01b.png', '2011-12-13 16:23:34', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('36', '捕获1.png', '/attachFiles/system/company/201112/ca110a72b50a4d81917e8725f1812f79.png', '2011-12-13 16:25:25', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('37', '捕获1.png', '/attachFiles/system/company/201112/223e5d397c744e8fb6a181925ae212cd.png', '2011-12-13 16:27:59', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('38', '捕获1.png', '/attachFiles/system/company/201112/ac1d2316f137476ba39f0e5d919ac347.png', '2011-12-13 16:29:27', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('39', '捕获1.png', '/attachFiles/system/company/201112/a0eca669f3d442cca3f58bac5979aa46.png', '2011-12-13 16:30:16', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('40', '捕获1.png', '/attachFiles/system/company/201112/f3087912b0334115a979b574a6a18c0a.png', '2011-12-13 16:31:08', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('41', '捕获1.png', '/attachFiles/system/company/201112/57374995b11241c087aa6620912f7310.png', '2011-12-13 16:50:58', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('42', '捕获1.png', '/attachFiles/system/company/201112/79380ff616b64c1e8060119ef43f95be.png', '2011-12-13 16:52:41', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('43', '捕获1.png', '/attachFiles/system/company/201112/82decceca41b49c0b5c02e8b5f5cf16c.png', '2011-12-13 16:54:35', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('44', '捕获1.png', '/attachFiles/system/company/201112/0f1c7f7acb5945b1b12cf38eb3d90139.png', '2011-12-13 16:55:05', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('45', '捕获1.png', '/attachFiles/system/company/201112/8958d57991aa44379d75866367a432bc.png', '2011-12-13 16:56:30', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('46', '263EM_ScreenShot.jpg', '/attachFiles/system/company/201112/0879ce1705ef42a2865c50897f16f43e.jpg', '2011-12-13 16:56:56', 'jpg', 'system/company', '14324 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('47', '捕获1.png', '/attachFiles/system/company/201112/a2ba3ec546c745988b170364fd5d1c8e.png', '2011-12-13 16:56:56', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('48', '捕获1.png', '/attachFiles/system/company/201112/bee063d7ad7c479ba3298ba4bff08d0d.png', '2011-12-14 15:43:49', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('49', '定向采集表1122.xls', '/attachFiles/uploadData/201112/20d1b75c8370486db5a76882e726f324.xls', '2011-12-15 12:32:16', 'xls', 'uploadData', '58880 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('50', '定向采集表1122.xls', '/attachFiles/uploadData/201112/5d9884efbb6745c1a6f81a37404b2a7f.xls', '2011-12-15 12:33:30', 'xls', 'uploadData', '58880 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('51', '定向采集表1122.xls', '/attachFiles/uploadData/201112/0507b888f04d4525a61616cd90b2a9e5.xls', '2011-12-15 13:56:47', 'xls', 'uploadData', '58880 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('52', '定向采集表1122.xls', '/attachFiles/uploadData/201112/55216a7e05f7457f8cc11e4d2cd4989e.xls', '2011-12-15 14:00:13', 'xls', 'uploadData', '58880 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('53', '定向采集表1122.xls', '/attachFiles/uploadData/201112/0caff32d938f4517905a25818cf18fbf.xls', '2011-12-15 14:01:19', 'xls', 'uploadData', '58880 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('54', '新建 Microsoft Excel 工作表.xlsx', '/attachFiles/uploadData/201112/736bdec4a04e4fb6a028efa40eb9dfdf.xlsx', '2011-12-15 14:07:34', 'xlsx', 'uploadData', '10601 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('55', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/e9629d38e12049d590e1d00c356fc849.xls', '2011-12-15 14:08:51', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('56', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/942d5316cb6f4902a983947aae10ad14.xls', '2011-12-15 14:10:57', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('57', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/d68090fbed57404b922a189595370f9e.xls', '2011-12-15 15:10:46', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('58', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/e6ea01a1a3694175b3b1a551c022a5fd.xls', '2011-12-15 15:11:59', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('59', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/50417dc6ea7541baa0b0b88f4d90e670.xls', '2011-12-15 15:12:53', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('60', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/e1fd16135e2f48dd901ccc0d4893e568.xls', '2011-12-15 15:13:55', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('61', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/9865b02274da49c4a2195ffff993531f.xls', '2011-12-15 15:14:44', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('62', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/d37d44c399984cbd90bc8253b946e39a.xls', '2011-12-15 15:15:48', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('63', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/988d0a14510345e585749651738f11e6.xls', '2011-12-15 15:19:05', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('64', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/9d43370944b146dba04808bddf62f270.xls', '2011-12-15 15:19:49', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('65', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/6d5e925c116d4e80b03cd8d31f3d07c4.xls', '2011-12-15 15:20:25', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('66', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/63dea955234a40ed8140423fcd3b43e4.xls', '2011-12-15 15:28:52', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('67', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/795f2ffe5a404fd6b4fdfa03c2551819.xls', '2011-12-15 15:30:34', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('68', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/15cdfdc176824be88fb23f2e8b40cf39.xls', '2011-12-15 15:31:32', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('69', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/eedbd866cb0943eeb64b6f3b93791c5c.xls', '2011-12-15 15:33:14', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('70', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/81f2d2d5cb2b437b9b9d85e356e58fe2.xls', '2011-12-15 15:34:49', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('71', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/35b25d0075b24ff28e718fd26b4057c9.xls', '2011-12-16 09:55:59', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('72', '新建 Microsoft Excel 工作表.xls', '/attachFiles/uploadData/201112/258f8e974f6746eda0d67900dc5de969.xls', '2011-12-16 09:57:06', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('73', 'infopool.xls', '/attachFiles/uploadData/201112/aa567a280d9747dc96c94382708e13c3.xls', '2011-12-16 11:24:17', 'xls', 'uploadData', '25600 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('74', '捕获1.png', '/attachFiles/system/company/201112/f1d8a3b1f898476db9cdef2e5c6d164d.png', '2011-12-19 13:31:04', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('75', '263EM_ScreenShot.jpg', '/attachFiles/system/company/201112/0b19d0cc1c01421db90e57e08e59c73a.jpg', '2011-12-19 14:06:00', 'jpg', 'system/company', '14324 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('76', '捕获1.png', '/attachFiles/system/company/201112/60f3e4f094414128bfb6555b382508af.png', '2011-12-19 14:09:28', 'png', 'system/company', '15742 bytes', '超级管理员');
INSERT INTO `file_attach` VALUES ('77', '捕获1.png', '/attachFiles/system/company/201112/03a41f2fd34143249d2683264b65ee25.png', '2011-12-19 14:16:50', 'png', 'system/company', '15742 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('78', '捕获1.png', '/attachFiles/system/company/201112/ad771c9705f34db799413c6dd934597e.png', '2011-12-19 14:17:43', 'png', 'system/company', '15742 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('81', 'floorTemplate.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/28b72338631f4dcfbd0471243fef4bde.xls', '2012-05-16 16:43:46', 'xls', 'uploadData', '23552 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('91', 'floorTemplate.xls', '/attachFiles/uploadData/201205/c962eed22b8f416eb48eef724620803c.xls', '2012-05-16 16:51:33', 'xls', 'uploadData', '29184 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('101', 'floorTemplate.xls', '/attachFiles/uploadData/201205/8762cdbd276f4f6b89e2044f4bb81e30.xls', '2012-05-16 16:52:29', 'xls', 'uploadData', '29184 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('111', 'floorTemplate.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/c4a3b62cdb234e9ab355494458e53925.xls', '2012-05-16 16:54:40', 'xls', 'uploadData', '29184 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('121', 'bandTemplate.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/26bd9df842cb42bfa3411cf462046b1d.xls', '2012-05-16 17:04:09', 'xls', 'uploadData', '470528 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('131', 'bandTemplate.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/a10d0c467ce04a1fad50179efbf5d18b.xls', '2012-05-16 17:05:23', 'xls', 'uploadData', '470528 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('141', 'bandTemplate.xls', '/attachFiles/uploadData/201205/667fe00bdc754c0396e31f7398176f32.xls', '2012-05-16 17:15:04', 'xls', 'uploadData', '470528 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('151', 'bandTemplate.xls', '/attachFiles/uploadData/201205/9516f913124d4cfcbfbe3d4b5f04fbcc.xls', '2012-05-16 17:18:50', 'xls', 'uploadData', '470528 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('161', 'bandTemplate.xls', '/attachFiles/uploadData/201205/6b7b7610ff9f46daab8a91a0e74c1430.xls', '2012-05-16 17:22:21', 'xls', 'uploadData', '470528 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('171', 'bandTemplate.xls', '/attachFiles/uploadData/201205/26ed72fc2dd24d23aedb1cb9f8d39023.xls', '2012-05-16 17:25:26', 'xls', 'uploadData', '237568 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('181', 'bandTemplate - 副本.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/0f8885d73e1b44f984f8e9d4eb021def.xls', '2012-05-16 17:26:59', 'xls', 'uploadData', '263680 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('191', 'bandTemplate - 副本.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/0da02e0b8d0e486c9f44a5942290bb55.xls', '2012-05-16 17:30:18', 'xls', 'uploadData', '263680 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('201', 'bandTemplate - 副本.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/d31775a6c46e4567abff672810cf0b91.xls', '2012-05-16 17:36:28', 'xls', 'uploadData', '263680 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('211', 'bandTemplate - 副本.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/907ff32ce5f44305b6ca6eeb52918983.xls', '2012-05-16 17:41:14', 'xls', 'uploadData', '262656 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('221', 'bandTemplate - 副本.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/506c4c7e43824bc682d0be5150039aff.xls', '2012-05-16 17:42:28', 'xls', 'uploadData', '262656 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('231', 'bandTemplate - 副本.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/b7a88fac29f64e86b02da589cf2c91b1.xls', '2012-05-16 17:44:38', 'xls', 'uploadData', '262656 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('241', 'bandTemplate - 副本.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/d6ffdd3a7265452b8b7b96284a11c571.xls', '2012-05-16 17:45:56', 'xls', 'uploadData', '262656 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('251', 'bandTemplate - 副本.xls', '/attachFiles/uploadData/201205/c955618ae1fd47eeb3cb7baf4f124575.xls', '2012-05-16 17:50:27', 'xls', 'uploadData', '262656 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('261', 'bandTemplate - 副本.xls', '/attachFiles/uploadData/201205/590e1ac8d53740bb900cb811b6cabb67.xls', '2012-05-17 12:41:28', 'xls', 'uploadData', '262656 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('271', 'bandTemplate - 副本.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/e2a2c111118245349dc7e2a64de6827f.xls', '2012-05-17 12:39:34', 'xls', 'uploadData', '262656 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('281', 'bandTemplate - 副本.xls', '/attachFiles/uploadData/201205/e969198869ca4c6c8f55068e82a2c6b8.xls', '2012-05-17 12:43:50', 'xls', 'uploadData', '262656 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('291', 'bandTemplate - 副本.xls', '/attachFiles/uploadData/201205/85fd69aa12c447c2aa5b70f7972ddf65.xls', '2012-05-17 12:59:46', 'xls', 'uploadData', '262656 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('301', 'bandTemplate - 副本.xls', '/attachFiles/uploadData/201205/598697b1914c4c78adcd3fa0a80cb7b6.xls', '2012-05-17 13:01:47', 'xls', 'uploadData', '262144 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('311', 'bandTemplate - 副本.xls', '/attachFiles/uploadData/201205/3278324119d84dbf8deb8dce89d2832c.xls', '2012-05-17 13:03:19', 'xls', 'uploadData', '262144 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('321', 'bandTemplate - 副本.xls', '/attachFiles/uploadData/201205/07a27fe223ae4a669bd26f1cb8051371.xls', '2012-05-17 13:07:05', 'xls', 'uploadData', '262144 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('331', 'bandTemplate - 副本.xls', '/attachFiles/uploadData/201205/26a6f5bddee84f0fba05d9da78eeed9a.xls', '2012-05-17 13:09:21', 'xls', 'uploadData', '262144 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('341', 'bandTemplate - 副本.xls', '/attachFiles/uploadData/201205/571f015079894672be39996887c310bd.xls', '2012-05-17 13:10:21', 'xls', 'uploadData', '262144 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('351', 'bandTemplate - 副本.xls', '/attachFiles/uploadData/201205/7795488abb674359b85ebc2315f45c63.xls', '2012-05-17 13:12:15', 'xls', 'uploadData', '262144 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('361', '商场Template.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/0cf6b55fec0a47dea3768492f687eac9.xls', '2012-05-21 10:08:42', 'xls', 'uploadData', '50176 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('371', '商场Template.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/34e8d4289f244ef4b9cc668af1aec2c6.xls', '2012-05-21 10:09:43', 'xls', 'uploadData', '51200 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('381', 'SOGO.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/fa74f96256ba437b89ac371a1652f616.xls', '2012-05-21 10:22:50', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('391', 'SOGO.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/179d973d3aca456fa645f0ed4aa932fd.xls', '2012-05-21 10:26:06', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('401', 'SOGO.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/5dddc5abafcc4ed082019631b73e84b7.xls', '2012-05-21 10:28:34', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('411', 'SOGO.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/20436b88a0d24b17a08cc3897e69106b.xls', '2012-05-21 10:31:32', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('421', '品牌风格Template.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/c60ca3bfd7364c86acc78514a9a6b3f1.xls', '2012-05-21 10:37:22', 'xls', 'uploadData', '30208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('431', 'SOGO.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/bdb8392cf3924f55835ddb7964c61183.xls', '2012-05-21 10:38:15', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('441', 'SOGO.xls', '/attachFiles/uploadData/201205/30db681895fb40338ebb7ac2f8f0c3e4.xls', '2012-05-21 11:04:04', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('451', 'SOGO.xls', '/attachFiles/uploadData/201205/ea879d31a9244f2c82008a97fcbf68eb.xls', '2012-05-21 11:08:17', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('461', 'SOGO.xls', '/attachFiles/uploadData/201205/32fe47659936416baf420d7d201aa01d.xls', '2012-05-21 11:26:33', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('471', 'SOGO.xls', '/attachFiles/uploadData/201205/e9a51735d36443d7a2a567cc26205b53.xls', '2012-05-21 11:26:54', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('481', 'SOGO.xls', '/attachFiles/uploadData/201205/d3a863d5f69241bba7337009569c42d4.xls', '2012-05-21 11:41:25', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('491', 'SOGO.xls', '/attachFiles/uploadData/201205/8c739ee7ef1642aeb5e40162009b569c.xls', '2012-05-21 13:20:06', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('501', 'SOGO.xls', '/attachFiles/uploadData/201205/a145239d56844eed9dfb6cf9693bce65.xls', '2012-05-21 15:44:56', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('511', 'SOGO.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/c12536337b1044fd8c8dfd287c502d1e.xls', '2012-05-21 15:46:30', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('521', 'SOGO.xls', '/attachFiles/uploadData/201205/47e2fd0a11fa45c38f987504249390a5.xls', '2012-05-21 15:50:25', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('531', 'SOGO.xls', '/attachFiles/uploadData/201205/a672856df5d2470ab04a7bbcddcdb448.xls', '2012-05-21 16:02:45', 'xls', 'uploadData', '106496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('541', '商业区Template.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/a8ee766e666641dabe9ac1dd140deada.xls', '2012-05-21 16:57:12', 'xls', 'uploadData', '18432 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('551', '商场Template（商圈）2012.5.21.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/af4f8d5370f44bd4a041c8a2bcf19659.xls', '2012-05-21 16:58:54', 'xls', 'uploadData', '52224 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('561', '华堂商场大羊坊店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/53d113593206446e9a5ed7ecfbd824bd.xls', '2012-05-22 14:21:57', 'xls', 'uploadData', '58368 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('571', '华堂商场大羊坊店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/35deff8b0a3c4396b3e6868d9a0b0d8d.xls', '2012-05-22 14:22:37', 'xls', 'uploadData', '58368 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('581', '华堂商场大羊坊店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/15ec62dbd64841ab8119d28fdf7f7ac6.xls', '2012-05-22 14:23:24', 'xls', 'uploadData', '58368 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('591', '华堂商场大羊坊店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/7b29652442694b3d9d28833fffc78ffc.xls', '2012-05-22 14:23:59', 'xls', 'uploadData', '58368 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('601', '华堂商场大羊坊店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/075ed4383f544405a6e899b0840c71bd.xls', '2012-05-22 14:24:41', 'xls', 'uploadData', '58368 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('611', '华堂商场大羊坊店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/70b7f91d6c99484b9819f8952d7b3566.xls', '2012-05-22 14:25:36', 'xls', 'uploadData', '58368 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('621', '华堂商场大羊坊店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/87e6f03fb23f41c9979add26a530d559.xls', '2012-05-22 14:27:18', 'xls', 'uploadData', '58368 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('631', '华联集团 安贞店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/6df91529e320400a9a30da2e49efbafb.xls', '2012-05-23 09:04:59', 'xls', 'uploadData', '68608 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('641', '华联集团 安贞店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/a14bba2caee44aaf8e078aee6fe52765.xls', '2012-05-23 09:07:40', 'xls', 'uploadData', '68608 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('651', '华联集团 安贞店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/7f5504d446e844f380641aa3945dc56a.xls', '2012-05-23 09:08:20', 'xls', 'uploadData', '68608 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('661', '华联集团 安贞店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/d4c73cbe9b6940ba941ffb868b5f9728.xls', '2012-05-23 09:08:53', 'xls', 'uploadData', '68608 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('671', '华联集团 安贞店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/5e2cb348f4af4e94bfc6b2e841d72621.xls', '2012-05-23 09:09:37', 'xls', 'uploadData', '68608 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('681', '翠微集团龙德店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/5765486d9d394636b1c34df47376c142.xls', '2012-05-23 09:12:31', 'xls', 'uploadData', '78336 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('691', '翠微集团龙德店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/8033902b3ba243b58a0bc7fae6a70631.xls', '2012-05-23 09:13:03', 'xls', 'uploadData', '78336 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('701', '翠微集团龙德店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/9cede1f293ee4afbaa57cb3401c9394a.xls', '2012-05-23 09:14:46', 'xls', 'uploadData', '78336 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('711', '华堂商场亚运村店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/8e8084991812439cbc28ea835d5938d2.xls', '2012-05-23 09:20:34', 'xls', 'uploadData', '62464 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('721', '华堂商场亚运村店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/372edb2ac6d24900834a2082d3742fab.xls', '2012-05-23 09:21:19', 'xls', 'uploadData', '62464 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('731', '华堂商场丰台店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/fc5687f80fe846fb925ad75ad510f891.xls', '2012-05-24 16:22:03', 'xls', 'uploadData', '47104 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('741', '华堂商场丰台店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/70d3bfe1de8c4ab0a988f01f8e0f6799.xls', '2012-05-24 16:22:46', 'xls', 'uploadData', '47104 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('751', '当代商城鼎城店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/8ddd87d1966b4446b694a155494ab9d4.xls', '2012-05-25 11:16:30', 'xls', 'uploadData', '73728 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('761', '当代商城鼎城店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/3857674a933e479895a5e2709922736f.xls', '2012-05-25 11:17:28', 'xls', 'uploadData', '73728 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('771', '燕莎金源店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/786f94ac371846cd83d069a7b0573765.xls', '2012-05-31 15:05:20', 'xls', 'uploadData', '88064 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('781', '燕莎金源店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/f1407347f59d4140a09ec7933ddaf780.xls', '2012-05-31 15:06:12', 'xls', 'uploadData', '88064 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('791', '燕莎金源店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/247274e2b1f64b1b844bb180b0c3e0be.xls', '2012-05-31 15:07:22', 'xls', 'uploadData', '88064 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('801', '长安商场.xlsx', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/612fddd6adc0449487054210ed8f58f8.xlsx', '2012-05-31 15:50:31', 'xlsx', 'uploadData', '20500 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('811', '长安商场.xlsx', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/f46a0373c67846f783fd55c9d6a586a1.xlsx', '2012-05-31 15:52:12', 'xlsx', 'uploadData', '20500 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('821', '长安商场.xlsx', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/a393bbfdaa4947b790b4686a58a605f2.xlsx', '2012-05-31 16:05:38', 'xlsx', 'uploadData', '20500 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('831', '长安商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/386c449738da41faa02121130ec986d3.xls', '2012-05-31 16:19:07', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('841', '长安商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/110dec12cac449159f6c41023079980c.xls', '2012-05-31 16:26:37', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('851', '长安商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/958014b1b0b04a0b8021caf587747901.xls', '2012-05-31 16:27:58', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('861', '长安商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/416ff3beb0af475ab281e1092fda0771.xls', '2012-05-31 16:40:48', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('871', '长安商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/811acd035dff4058b2f9c55d4921ba60.xls', '2012-05-31 16:43:05', 'xls', 'uploadData', '53248 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('881', '丰联广场-2003.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/6934461cf45d495b9d78aba3afbd4bde.xls', '2012-05-31 16:46:53', 'xls', 'uploadData', '29184 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('891', '长安商场.xls', '/attachFiles/uploadData/201205/b8d993d24527480dbf18ecdf3228131a.xls', '2012-05-31 16:50:09', 'xls', 'uploadData', '53248 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('901', '枫蓝国际.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/46d25263528e41beb7e135d8904b09ec.xls', '2012-05-31 16:48:04', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('911', '长安商场.xls', '/attachFiles/uploadData/201205/3a8cc3a2f8a049c1bb60ffe4eb303480.xls', '2012-05-31 16:51:57', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('921', '枫蓝国际.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/d70f4a4b01ee4659bc4bb067d94d0455.xls', '2012-05-31 16:50:33', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('931', '西单商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/af50aae818904097839d9be89d02ab8b.xls', '2012-05-31 16:50:49', 'xls', 'uploadData', '80896 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('941', '长安商场.xls', '/attachFiles/uploadData/201205/5c0d9f76248144f3aadbfadc32c9eadb.xls', '2012-05-31 16:54:21', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('951', '长安商场.xls', '/attachFiles/uploadData/201205/ecd59366046941d1ae82b506a5eea5aa.xls', '2012-05-31 16:54:59', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('961', '西单商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/998254f65ee446ee920867f9d1c4423c.xls', '2012-05-31 16:52:08', 'xls', 'uploadData', '80896 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('971', '枫蓝国际.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/877250d5797d4df5963083efed531694.xls', '2012-05-31 16:52:35', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('981', '长安商场.xls', '/attachFiles/uploadData/201205/9e97835bf08a4f608d703f03eb9f1d0e.xls', '2012-05-31 16:56:06', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('991', '西单商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/943f3fdb66cb4deeabbb4607f779982d.xls', '2012-05-31 16:53:56', 'xls', 'uploadData', '80896 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1001', '枫蓝国际.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/15dfb781e9b84ff2846d2eed924447aa.xls', '2012-05-31 16:54:51', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1011', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/2f93741cd8624326a366e16732961d3a.xls', '2012-05-31 16:55:04', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1021', '枫蓝国际.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/70972659dfbc4a488c8f80554d5173d0.xls', '2012-05-31 16:55:38', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1031', '长安商场.xls', '/attachFiles/uploadData/201205/7c6f42fc4d06438cb7f8577185eeec16.xls', '2012-05-31 16:59:34', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1041', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/9cbbb634e27f4bbd836860d490542691.xls', '2012-05-31 16:56:45', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1051', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/78e4411e9e834ad8a03371e5b0cefb90.xls', '2012-05-31 16:57:40', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1061', '长安商场.xls', '/attachFiles/uploadData/201205/02a3cec47f83486597d5d2c726c6808d.xls', '2012-05-31 17:01:20', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1071', '长安商场.xls', '/attachFiles/uploadData/201205/d1d0d43ffa654cc598d6c1076b7f3a20.xls', '2012-05-31 17:03:47', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1081', '枫蓝国际.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/22f62c5e19b54229aebabcedcd69a0c6.xls', '2012-05-31 17:01:01', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1091', '长安商场.xls', '/attachFiles/uploadData/201205/d837e8c3e218491cb5c53667695f1b07.xls', '2012-05-31 17:04:50', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1101', '长安商场.xls', '/attachFiles/uploadData/201205/fc22274c751247c18ad4834a9b7d1fe5.xls', '2012-05-31 17:06:00', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1111', '枫蓝国际.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/019809fdacf84f32b26b53f54e5d6c76.xls', '2012-05-31 17:03:03', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1121', '长安商场.xls', '/attachFiles/uploadData/201205/2649a4ef848b4b84a9a106f18ab58e6e.xls', '2012-05-31 17:09:09', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1131', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/36679f10cacf4b8590280f1a250c3b2c.xls', '2012-05-31 17:06:12', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1141', '枫蓝国际.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/c18435bcacc34418addd7df6399fb546.xls', '2012-05-31 17:08:01', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1151', '枫蓝国际.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/281480d9d45d4c29adda1ad03ebe157e.xls', '2012-05-31 17:08:56', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1161', '枫蓝国际.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/3bda2245cdd0462dbdcf859fcd040936.xls', '2012-05-31 17:10:43', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1171', '复兴商业城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/e34518ca3c1a42ed8f85f2d28a9e6d45.xls', '2012-05-31 17:11:16', 'xls', 'uploadData', '79360 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1181', '长安商场.xls', '/attachFiles/uploadData/201205/18b790e01c51410fb3583635187ae2c6.xls', '2012-05-31 17:14:46', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1191', '复兴商业城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/2c5fa5715db64fb48470fbbf07d6c6da.xls', '2012-05-31 17:12:05', 'xls', 'uploadData', '79360 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1201', '复兴商业城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/081d9003b41546d48e51a797ac60b59b.xls', '2012-05-31 17:13:07', 'xls', 'uploadData', '79360 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1211', '复兴商业城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/d65e7f93ffbd45058ab248c9902c1e9c.xls', '2012-05-31 17:13:51', 'xls', 'uploadData', '79360 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1221', '复兴商业城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/cf0396a112e542c89ef94436c06a1af3.xls', '2012-05-31 17:14:22', 'xls', 'uploadData', '79360 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1231', '复兴商业城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/2faf3291d91841ed845327554af7a406.xls', '2012-05-31 17:15:05', 'xls', 'uploadData', '79360 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1241', '富力广场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/68c61595e9634004a7e966d39625b96a.xls', '2012-05-31 17:15:38', 'xls', 'uploadData', '36864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1251', '富力广场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/2a8decc3bc314d3a904e0c0c58d8b75a.xls', '2012-05-31 17:16:24', 'xls', 'uploadData', '36352 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1261', '新华百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/22a097c881344d4796d617bf98b5c2fa.xls', '2012-05-31 17:16:35', 'xls', 'uploadData', '41472 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1271', '富力广场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/26ba16d8a7ab4ff9b340daa86cc5669d.xls', '2012-05-31 17:16:49', 'xls', 'uploadData', '36352 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1281', '甘家口大厦.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/286177af33214cdc94ea44bbd0d0238a.xls', '2012-05-31 17:17:19', 'xls', 'uploadData', '67072 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1291', '新华百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/fdbe036cc4434301b3a827805c6313c7.xls', '2012-05-31 17:17:46', 'xls', 'uploadData', '41472 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1301', '甘家口大厦.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/b247a06ae6da4e7ba215596f72648b48.xls', '2012-05-31 17:17:51', 'xls', 'uploadData', '67072 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1311', '甘家口大厦.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/1de89a61b44b4052ad2cc145722e2cf0.xls', '2012-05-31 17:19:10', 'xls', 'uploadData', '67072 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1321', '长安商场.xls', '/attachFiles/uploadData/201205/e2f2cfc3146947fdb8dfbf72db345529.xls', '2012-05-31 17:22:39', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1331', '新华百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/f218afeee4474d9e93579c55f1418662.xls', '2012-05-31 17:19:38', 'xls', 'uploadData', '41472 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1341', '贵友大厦永安里.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/c4e11ca51984418d97702ba616761cd4.xls', '2012-05-31 17:19:40', 'xls', 'uploadData', '43008 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1351', '贵友大厦永安里.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/00ec700ce3834f36ac59fcc357f39d8a.xls', '2012-05-31 17:20:07', 'xls', 'uploadData', '43008 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1361', '贵友大厦永安里.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/a4d17d989e1b415aa21548dc10ebad9d.xls', '2012-05-31 17:21:04', 'xls', 'uploadData', '43008 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1371', '新世界百货二期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/c0dcdeccec3d4ef1895b55066de170b0.xls', '2012-05-31 17:21:30', 'xls', 'uploadData', '62976 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1381', '国贸商城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/5ceaf25b3bb546fcacf68bf9456dbd72.xls', '2012-05-31 17:22:37', 'xls', 'uploadData', '52736 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1391', '长安商场.xls', '/attachFiles/uploadData/201205/28569272bdf745ac81ae92edb61370e5.xls', '2012-05-31 17:26:16', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1401', '国贸商城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/ad8e951e51be4e7c96031cc494189c7b.xls', '2012-05-31 17:23:13', 'xls', 'uploadData', '53248 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1411', '国贸商城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/802a92ae43764f6e97bc8241087359f8.xls', '2012-05-31 17:23:35', 'xls', 'uploadData', '53248 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1421', '国瑞购物中心.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/66c0da023b274bcb9cda66fb5ebfdc7a.xls', '2012-05-31 17:24:30', 'xls', 'uploadData', '38400 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1431', '华联集团-阜成门店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/741ec4a0b5244b2c9baf98eeeddb50f7.xls', '2012-05-31 17:25:47', 'xls', 'uploadData', '57856 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1441', '华联集团五道口店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/4b6fe2f5035446dfadac41d9517ae9d5.xls', '2012-05-31 17:27:18', 'xls', 'uploadData', '62464 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1451', '长安商场.xls', '/attachFiles/uploadData/201205/0a39b7e1299145fa8cc1e63d09d5e06f.xls', '2012-05-31 17:31:25', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1461', '华联望京店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/0e6a55c8c0fd4b6ebdf2bc4b16fc126a.xls', '2012-05-31 17:28:19', 'xls', 'uploadData', '55296 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1471', '华联望京店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/f3c9b654fd4c47ae8e026495daa36c05.xls', '2012-05-31 17:29:19', 'xls', 'uploadData', '55296 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1481', '华联望京店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/fa166bdf86d14064a76fda6a4a5d6030.xls', '2012-05-31 17:29:48', 'xls', 'uploadData', '55296 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1491', '华联望京店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/0f7119f4974c4150b95bae0fc8290792.xls', '2012-05-31 17:30:13', 'xls', 'uploadData', '55296 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1501', '华堂商场西外店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/33f5fe25b1ed44baa5eaa991d6f65047.xls', '2012-05-31 17:31:33', 'xls', 'uploadData', '56832 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1511', '华堂商城望京店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/3419df38a8714e2c9422d68012c4941a.xls', '2012-05-31 17:32:38', 'xls', 'uploadData', '54272 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1521', '长安商场.xls', '/attachFiles/uploadData/201205/1f1fa88e2dd046e4bc06ba8d6126ad3d.xls', '2012-05-31 17:36:45', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1531', '活力东方.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/c3f86c46361949d7b19a854f312da9e4.xls', '2012-05-31 17:33:45', 'xls', 'uploadData', '68608 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1541', '新世界百货二期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/92581c96de1e435fa2e85634398abb42.xls', '2012-05-31 17:34:28', 'xls', 'uploadData', '62976 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1551', '活力东方.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/0e1f94a4da60411da9bd996511646298.xls', '2012-05-31 17:34:42', 'xls', 'uploadData', '68608 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1561', '活力东方.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/ec19cf184912429a873f73d40c96afc1.xls', '2012-05-31 17:35:11', 'xls', 'uploadData', '68608 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1571', '新世界百货二期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/efd68c4dcbd04fdab7da3b558b1cfdc7.xls', '2012-05-31 17:35:30', 'xls', 'uploadData', '62976 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1581', '长安商场.xls', '/attachFiles/uploadData/201205/b25af771df6e450e91b01a03b315b3d4.xls', '2012-05-31 17:39:16', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1591', '新世界百货二期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/5f081421c6a84aa48c234df5199d7c85.xls', '2012-05-31 17:36:18', 'xls', 'uploadData', '62976 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1601', '嘉茂中心望京店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/870fd259703847949462df3f4868c67e.xls', '2012-05-31 17:36:20', 'xls', 'uploadData', '43520 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1611', '嘉茂中心望京店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/860785a6ba5145e584d0ca52fd0d782b.xls', '2012-05-31 17:36:47', 'xls', 'uploadData', '43520 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1621', '新世界百货二期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/80814343252941899d1e260b46c14113.xls', '2012-05-31 17:36:59', 'xls', 'uploadData', '62976 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1631', '新世界百货一期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/efc3ac78271b482a9eafbbee118cc29e.xls', '2012-05-31 17:37:42', 'xls', 'uploadData', '113664 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1641', '嘉茂中心西直门店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/4cb9c607df07403d9f320e43231bb5eb.xls', '2012-05-31 17:37:54', 'xls', 'uploadData', '40960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1651', '新世界百货一期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/e092108aca4140c1a0974a8d8e01cd7d.xls', '2012-05-31 17:38:30', 'xls', 'uploadData', '113664 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1661', '燕莎奥特莱斯.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/26e55cc611974982a6a7993136e4be48.xls', '2012-05-31 17:39:46', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1671', '长安商场.xls', '/attachFiles/uploadData/201205/4c7581c93610482fadf79654e98df00a.xls', '2012-05-31 17:43:44', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1681', '新世界百货一期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/a90027d86b6749d18487b1c2e0dfa93c.xls', '2012-05-31 17:40:43', 'xls', 'uploadData', '113664 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1691', '燕莎奥特莱斯.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/8285bacc834a4ffbae4cc445e5708256.xls', '2012-05-31 17:41:10', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1701', '长安商场.xls', '/attachFiles/uploadData/201205/f4849f7e096f4990baa51309ba28d803.xls', '2012-05-31 17:44:47', 'xls', 'uploadData', '53760 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1711', '燕莎奥特莱斯.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/dd1f02886691451083518acfa2876292.xls', '2012-05-31 17:41:41', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1721', '新世界百货一期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/d314613995394426b13c46e020a59c21.xls', '2012-05-31 17:41:48', 'xls', 'uploadData', '113664 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1731', '燕莎奥特莱斯.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/764950a805f3427dbf0f913c1095c72e.xls', '2012-05-31 17:42:12', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1741', '燕莎奥特莱斯.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/d1c6871a01fd4a56bbfa67260b75e8f0.xls', '2012-05-31 17:42:48', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1751', '新世界百货一期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/df1fc10d2df449d3afac723ad7fe0ebd.xls', '2012-05-31 17:43:25', 'xls', 'uploadData', '113664 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1761', '燕莎奥特莱斯.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/96b69d1fa6ff47bca1e7acb8de00050b.xls', '2012-05-31 17:43:43', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1771', '新世界百货一期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/4439402283cb443883a4b86cfc17b57c.xls', '2012-05-31 17:44:18', 'xls', 'uploadData', '113664 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1781', '新世界百货一期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/5656e580883e486b9a3a2883e64e8c1f.xls', '2012-05-31 17:45:24', 'xls', 'uploadData', '113664 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1791', '新世界百货一期.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/65e9b300e1b146f0aaab1d9c31311001.xls', '2012-05-31 17:46:47', 'xls', 'uploadData', '113664 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1801', '新世界彩旋百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/208d8afbfc4e4e6ea8a439f0c366ccf3.xls', '2012-05-31 17:48:22', 'xls', 'uploadData', '47104 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1811', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/ae02965e7446464ba4b1b4facd9712c8.xls', '2012-05-31 17:51:03', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1821', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/4fb71dd3a6334ca4851dd15a1ec1f9e5.xls', '2012-05-31 17:53:35', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1831', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/b909a8eea36a4b6b8cdae550174a88ee.xls', '2012-05-31 17:54:30', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1841', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/e09ca70329ec4e4881ddb00c7109a063.xls', '2012-05-31 17:56:06', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1851', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/1e59b995584a4419a8127db0ef6a2085.xls', '2012-05-31 17:56:20', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1861', '金融街购物中心.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/4b30c7a8b7794120b0952f88b1f86454.xls', '2012-05-31 17:56:45', 'xls', 'uploadData', '49664 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1871', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/51405bad8fe74476834a5db7a4116e02.xls', '2012-05-31 17:57:42', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1881', '金融街购物中心.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/c6309f5f055e429693b3ad50a88750f1.xls', '2012-05-31 17:58:53', 'xls', 'uploadData', '39424 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1891', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/d8e0e4146dad418bbee34b676d2fa4d9.xls', '2012-05-31 17:59:38', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1901', '金融街购物中心.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/c68f562d39834387b2a9a1c14b2d5771.xls', '2012-05-31 18:00:32', 'xls', 'uploadData', '39424 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1911', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/de057d0e868747498b3179e59315c3c1.xls', '2012-05-31 18:01:12', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1921', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/d3d2fbfe81214842a071756d3fa3f047.xls', '2012-05-31 18:01:44', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1931', '金融街购物中心.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/a907e21d4e1449c5915e6be49467af09.xls', '2012-05-31 18:01:50', 'xls', 'uploadData', '39936 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1941', '金源MALL.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201205/d58c6eb0640849239fab1c45ff0de7bc.xls', '2012-05-31 18:03:13', 'xls', 'uploadData', '96768 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1951', '金融街购物中心.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/bfd90ac4af254ac4bab67242549c8584.xls', '2012-06-01 09:55:41', 'xls', 'uploadData', '39936 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1961', '金源MALL.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/aa87eef1e0854b929779da53468eba7f.xls', '2012-06-01 09:56:17', 'xls', 'uploadData', '96768 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1971', '金源MALL.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/24f09c2e151549b28f65bc4f992dfc76.xls', '2012-06-01 09:58:11', 'xls', 'uploadData', '87040 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1981', '金源MALL.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/2a96c1a760a94dc59a40f43b3d9fc3ab.xls', '2012-06-01 09:59:32', 'xls', 'uploadData', '87040 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('1991', '金源MALL.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/414cc7ab7a84462b8136713f8e343dc0.xls', '2012-06-01 10:01:12', 'xls', 'uploadData', '87040 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2001', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/96328105d08b4765a5d116e56ac793ae.xls', '2012-06-01 10:01:56', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2011', '金源MALL.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/b6ffa4330eb647ba83175ac355c17423.xls', '2012-06-01 10:02:35', 'xls', 'uploadData', '87040 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2021', '新世界彩旋百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/ab1f7ec64d0a4a2ca52b50142bf766f2.xls', '2012-06-01 10:02:44', 'xls', 'uploadData', '47104 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2031', '新世界利莹百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/04c7022f6f9746a3ba0afc1f4bffe5f6.xls', '2012-06-01 10:03:19', 'xls', 'uploadData', '66048 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2041', '新世界利莹百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/1e8530061454423e8cc44ee8c6d09615.xls', '2012-06-01 10:04:11', 'xls', 'uploadData', '66048 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2051', '新世界利莹百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/403e1da61c604acd84bbfd3ac0e25777.xls', '2012-06-01 10:04:56', 'xls', 'uploadData', '67072 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2061', '新世界利莹百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/69f5581d29824b7bb41b6e9ae165375f.xls', '2012-06-01 10:05:32', 'xls', 'uploadData', '67072 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2071', '金源MALL.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/4d9f715c14d04a62afa79cb32e28069a.xls', '2012-06-01 10:05:53', 'xls', 'uploadData', '87040 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2081', '燕莎金源店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/d3d128ed06914e658f21774ce2930c07.xls', '2012-06-01 10:06:12', 'xls', 'uploadData', '89088 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2091', '燕莎金源店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/90faa731732945c1b3f1197d42d03e20.xls', '2012-06-01 10:07:36', 'xls', 'uploadData', '89088 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2101', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/0429a4cc9af942919daacc581c88d5c6.xls', '2012-06-01 10:11:56', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2111', '金源MALL.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/91b0b952d05f4840ba7935d44b5f4072.xls', '2012-06-01 10:12:17', 'xls', 'uploadData', '87040 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2121', '金源MALL.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/effba44b303643fd9b8f302eb999baa3.xls', '2012-06-01 10:13:34', 'xls', 'uploadData', '87040 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2131', '久隆百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/d1e8597125f143028953ba4fc51b6b55.xls', '2012-06-01 10:14:26', 'xls', 'uploadData', '80384 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2141', '银座MALL.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/adafcb94eefb4455b7ff6a062f30e057.xls', '2012-06-01 10:15:33', 'xls', 'uploadData', '31232 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2151', '悠唐.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/aaad4aa10f994cc997d5a2c9a79478c6.xls', '2012-06-01 10:15:48', 'xls', 'uploadData', '34816 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2161', '久隆百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/8ad701357f6143af9b0f4533a7225edc.xls', '2012-06-01 10:16:42', 'xls', 'uploadData', '70656 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2171', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/b78c3c187d4041a29f97d12102c793cf.xls', '2012-06-01 10:17:34', 'xls', 'uploadData', '110592 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2181', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/432870a6219a41e9a06a8db1dd25da79.xls', '2012-06-01 10:18:40', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2191', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/f22610ad32034995a0f4c09ab8a6d612.xls', '2012-06-01 10:19:41', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2201', '中友百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/47c7618072f640cb87cbcb81ada1700a.xls', '2012-06-01 10:19:56', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2211', '中友百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/719a55f694b94dac8588e0e7a5092046.xls', '2012-06-01 10:22:03', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2221', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/564d60914d4f469c884c93fb3a3b1f2d.xls', '2012-06-01 10:22:15', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2231', '中友百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/a36d05da4e134f0bb50b28c9406e3bb0.xls', '2012-06-01 10:23:50', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2241', '中友百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/2ddfa12fdce9498e95c004d35bbfc445.xls', '2012-06-01 10:25:29', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2251', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/9aa134f6967d409a9fa67dbd5a5739d1.xls', '2012-06-01 10:26:01', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2261', '资和信百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/cf054ae8cb094c36adb45a5a1fd3a09a.xls', '2012-06-01 10:26:23', 'xls', 'uploadData', '74752 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2271', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/55dd781015a541b18736c249f50c2255.xls', '2012-06-01 10:28:02', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2281', '资和信百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/14507e4a97934e6d923dedc7a99c9ef4.xls', '2012-06-01 10:28:25', 'xls', 'uploadData', '74752 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2291', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/1072db794fac4a8d841f16753026ba3a.xls', '2012-06-01 10:29:46', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2301', '新光天地.xls', '/attachFiles/uploadData/201206/7106f0612b4d40b1b3f946d466b25718.xls', '2012-06-01 10:33:26', 'xls', 'uploadData', '136192 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2311', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/46753ae9680e4bd7883cd5faf6713e97.xls', '2012-06-01 10:31:20', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2321', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/6ed0f054de6e46c4bf94197de7ab767f.xls', '2012-06-01 10:32:20', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2331', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/3023abb93c754cd8b0b240a482b22480.xls', '2012-06-01 10:34:45', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2341', '新光天地.xls', '/attachFiles/uploadData/201206/67c5134a0795455486645c0b742cd583.xls', '2012-06-01 10:37:55', 'xls', 'uploadData', '87040 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2351', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/dd2a49a099434c37a5836a11fba1bfb1.xls', '2012-06-01 10:35:40', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2361', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/a025d04d8dd14f4285a20a10e8940cc2.xls', '2012-06-01 10:36:42', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2371', '来福士.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/bad8e4970c994a4aac9494ac4db61ba1.xls', '2012-06-01 10:38:01', 'xls', 'uploadData', '37888 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2381', '新光天地.xls', '/attachFiles/uploadData/201206/792b67a9ffa24fe0b59de8d733e0600d.xls', '2012-06-01 10:41:55', 'xls', 'uploadData', '87040 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2391', '蓝岛大厦.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/db451ae4bcf24ead91e4be1584dd7ee9.xls', '2012-06-01 10:39:49', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2401', '蓝岛大厦.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/21d05edd91ba42ddac770a8aaf78d4d2.xls', '2012-06-01 10:40:42', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2411', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/341425ae27324900b0dd33667f727793.xls', '2012-06-01 10:41:30', 'xls', 'uploadData', '87040 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2421', '乐天银泰百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/940efca2b2ea4aefb243541150a1310a.xls', '2012-06-01 10:42:46', 'xls', 'uploadData', '31232 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2431', '赛特奥莱.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/3153bc3735374c409cd91d3266907c42.xls', '2012-06-01 10:43:08', 'xls', 'uploadData', '64000 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2441', '赛特奥莱.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/988892063d624c3c87fd0176545b8fd7.xls', '2012-06-01 10:44:42', 'xls', 'uploadData', '54272 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2451', '新光天地.xls', '/attachFiles/uploadData/201206/7254fd66564b4abfb61afe91fc73dbd0.xls', '2012-06-01 10:47:53', 'xls', 'uploadData', '54784 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2461', '赛特购物中心.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/dc4a35814e094b6e9a9a3ad1fc287686.xls', '2012-06-01 10:45:10', 'xls', 'uploadData', '67584 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2471', '三里屯VILLAGE.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/e80bb867e5fb44f7bddb0452784cf6e6.xls', '2012-06-01 10:45:39', 'xls', 'uploadData', '47616 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2481', '三里屯VILLAGE.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/82ef4168a18e4647a1b983aa378693e4.xls', '2012-06-01 10:46:13', 'xls', 'uploadData', '37888 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2491', '世贸天街.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/9705f0d6e7a0423f98d483f3b5de9e7b.xls', '2012-06-01 10:46:36', 'xls', 'uploadData', '37376 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2501', '新光天地.xls', '/attachFiles/uploadData/201206/144b67427edc411d8832fdea6bf61316.xls', '2012-06-01 10:50:10', 'xls', 'uploadData', '54784 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2511', '世贸天街.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/0b92395061a745078e25d9bff9f0efa4.xls', '2012-06-01 10:47:22', 'xls', 'uploadData', '36352 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2521', '首地大峡谷.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/7fa786f260fc42ec8904a4c81bc0eb0c.xls', '2012-06-01 10:48:11', 'xls', 'uploadData', '42496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2531', '首地大峡谷.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/bdbd221051aa406686a52c49b73d3d56.xls', '2012-06-01 10:48:39', 'xls', 'uploadData', '41472 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2541', '新光天地.xls', '/attachFiles/uploadData/201206/5c53505b139b434a941c626c79cf2042.xls', '2012-06-01 10:51:53', 'xls', 'uploadData', '48640 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2551', '首地大峡谷.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/53a1f0775b114080984faf71bcc6c95f.xls', '2012-06-01 10:49:34', 'xls', 'uploadData', '41472 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2561', '双安商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/87a9bd2df9824a51bb3df83cf21f9bf9.xls', '2012-06-01 10:49:57', 'xls', 'uploadData', '64512 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2571', '新光天地.xls', '/attachFiles/uploadData/201206/fe3e0bdd1806456cb36db35e17bd347d.xls', '2012-06-01 10:53:25', 'xls', 'uploadData', '89088 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2581', '新光天地.xls', '/attachFiles/uploadData/201206/799b16468ffc46a787c1f7d2e01580c2.xls', '2012-06-01 10:54:20', 'xls', 'uploadData', '89088 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2591', '双安商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/82559f77a1f5449c86a46089e8d4b31e.xls', '2012-06-01 10:51:30', 'xls', 'uploadData', '54272 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2601', '双安商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/46366b5e7b4d496c8adefdd74e676e5f.xls', '2012-06-01 10:52:07', 'xls', 'uploadData', '54272 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2611', '新光天地.xls', '/attachFiles/uploadData/201206/768c1bf64d7d4f429da423d2d8d1d25d.xls', '2012-06-01 10:56:04', 'xls', 'uploadData', '89088 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2621', '双安商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/b208d1efceeb4abbac871977144ef89d.xls', '2012-06-01 10:53:35', 'xls', 'uploadData', '54272 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2631', '双安商场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/d9f7786c0d074fa5a1020781cabdd981.xls', '2012-06-01 10:54:11', 'xls', 'uploadData', '54272 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2641', '新光天地.xls', '/attachFiles/uploadData/201206/5a8ac7c5b4834af582f6b1af86f4d637.xls', '2012-06-01 10:59:48', 'xls', 'uploadData', '89088 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2651', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/53705796945240f1a6de298b6e23c5ce.xls', '2012-06-01 10:57:24', 'xls', 'uploadData', '89088 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2661', '燕莎奥特莱斯.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/376580d880fe462e9f8c679a0064f980.xls', '2012-06-01 10:58:07', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2671', '燕莎奥特莱斯.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/b4168bf197e84df18a5f3aa6cd699478.xls', '2012-06-01 10:58:47', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2681', '燕莎奥特莱斯.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/c018c0bbd44342c18e5e82a652b1628a.xls', '2012-06-01 10:59:43', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2691', '新光天地.xls', '/attachFiles/uploadData/201206/25492f79123c469683402606fbd2108d.xls', '2012-06-01 11:08:11', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2701', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/d578299d78f54b6a879c4a58e39b7ab0.xls', '2012-06-01 11:06:11', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2711', '新光天地.xls', '/attachFiles/uploadData/201206/681bf8b92acd49a0a2253c2dd0303467.xls', '2012-06-01 11:11:03', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2721', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/52bf5ca6a0674240b46f17958ea4916f.xls', '2012-06-01 11:11:00', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2731', '新光天地.xls', '/attachFiles/uploadData/201206/df6c90a819f54d86a27c6170fa66f7f9.xls', '2012-06-01 11:15:23', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2741', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/72d746439314429c8f10e90adb43d4d9.xls', '2012-06-01 11:13:21', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2751', '新光天地.xls', '/attachFiles/uploadData/201206/47b2cd40d5c340788d53804d1a5a0892.xls', '2012-06-01 11:16:48', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2761', '新光天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/213a62a20cba41ffadafb3523679518f.xls', '2012-06-01 11:15:33', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2771', '新光天地.xls', '/attachFiles/uploadData/201206/e366413606684af6b7a206e08563409a.xls', '2012-06-01 11:20:24', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2781', '新光天地.xls', '/attachFiles/uploadData/201206/7ee0598b8e234c8b8b0adfb35536d5b5.xls', '2012-06-01 11:21:14', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2791', '新光天地.xls', '/attachFiles/uploadData/201206/e2021d4c0a604d7483454c696abba850.xls', '2012-06-01 11:26:31', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2801', '新光天地.xls', '/attachFiles/uploadData/201206/1d70a23a0c3b496d8cb599ed0c4a8a01.xls', '2012-06-01 11:28:02', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2811', '新光天地.xls', '/attachFiles/uploadData/201206/d716479d33f5467e9acdb54b3032e4e2.xls', '2012-06-01 11:28:59', 'xls', 'uploadData', '49152 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2821', '新光天地.xls', '/attachFiles/uploadData/201206/ff7d22dcb0fd4201b84097c99f04536f.xls', '2012-06-01 11:31:04', 'xls', 'uploadData', '25600 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2831', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/4071282a631f4b34b5baec80635bd882.xls', '2012-06-01 11:34:46', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2841', '天虹百货国展店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/2e8bf22cad0a46ccbba088005bce62b7.xls', '2012-06-01 11:33:14', 'xls', 'uploadData', '73728 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2851', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/6a5cd83ddc4145799cb86c696e7f4834.xls', '2012-06-01 11:37:42', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2861', '天虹百货国展店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/e00709e2ecdd477b93174d772a4a10c6.xls', '2012-06-01 11:35:54', 'xls', 'uploadData', '63488 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2871', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/452868468d2344319d573732b0cb09d1.xls', '2012-06-01 11:39:33', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2881', '天虹百货国展店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/7a8f680b9e724d7e942f46862dc5f07e.xls', '2012-06-01 11:36:42', 'xls', 'uploadData', '63488 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2891', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/d047ee00dfb44ff8b97f23189a268a19.xls', '2012-06-01 11:40:39', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2901', '天虹百货国展店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/a4d494c6d3dd407ab52cada5238df2bd.xls', '2012-06-01 11:37:39', 'xls', 'uploadData', '63488 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2911', '万千百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/d4f1aa187b88410a97cf1274b5c096f0.xls', '2012-06-01 11:38:17', 'xls', 'uploadData', '85504 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2921', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/054a3f68b57f45df953aa323f187c439.xls', '2012-06-01 11:41:47', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2931', '万千百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/d8b562ba6b3e45c5b87e67043668a9ba.xls', '2012-06-01 11:39:00', 'xls', 'uploadData', '75776 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2941', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/f854ddc3a34c4f64b9f827b2942d3483.xls', '2012-06-01 11:42:36', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2951', '万千百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/217740acf96b43aa9de006bde116f82b.xls', '2012-06-01 11:40:19', 'xls', 'uploadData', '75776 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2961', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/05a67cc8401c43b79350db18fc13c81e.xls', '2012-06-01 11:43:39', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2971', '西单大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/4aef048b84204f0c8106792a57d5ccde.xls', '2012-06-01 11:40:45', 'xls', 'uploadData', '72704 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2981', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/5d2968cacc144889ab3b2f47fe4d79a3.xls', '2012-06-01 11:44:49', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('2991', '西单大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/02fd3f7ab3a341bc9d199bedd6df3b9e.xls', '2012-06-01 11:42:22', 'xls', 'uploadData', '71680 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3001', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/19cb6fbe42ca42988202c0697ec330f5.xls', '2012-06-01 11:46:08', 'xls', 'uploadData', '60928 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3011', '西单大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/729de5da4c124eb1b43fcadda8f0a522.xls', '2012-06-01 11:44:35', 'xls', 'uploadData', '71680 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3021', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/9b7df25450d546a69d5f4783a799d149.xls', '2012-06-01 11:47:54', 'xls', 'uploadData', '58880 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3031', '西单大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/298baf9104b4468d9b3746981f361791.xls', '2012-06-01 11:45:20', 'xls', 'uploadData', '71680 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3041', '西单大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/aad1b26bd8b346babeaf52ab806ea2f2.xls', '2012-06-01 11:45:57', 'xls', 'uploadData', '71680 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3051', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/de9f1836b2de46f698029fe32458e832.xls', '2012-06-01 11:49:45', 'xls', 'uploadData', '58880 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3061', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/a97cb6aad69e45bf8d3aa52b1c2b13a0.xls', '2012-06-01 11:46:38', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3071', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/95b1f5f000344412831504b52f6ebc77.xls', '2012-06-01 11:50:55', 'xls', 'uploadData', '58880 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3081', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/27ca651694cd43f8bace78260f5788ab.xls', '2012-06-01 11:52:39', 'xls', 'uploadData', '58880 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3091', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/358fc8601f0d43d799de0aff5954d030.xls', '2012-06-01 11:55:09', 'xls', 'uploadData', '57344 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3101', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/830fcabd39a54fce98236306ee59f4a3.xls', '2012-06-01 11:58:38', 'xls', 'uploadData', '57344 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3111', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/f7858bdc304f4b9e8296385eee94ed07.xls', '2012-06-01 11:59:37', 'xls', 'uploadData', '56832 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3121', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/d5f52857121044ed84a97ac9d0c49f1a.xls', '2012-06-01 12:04:12', 'xls', 'uploadData', '27136 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3131', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/35c01fd5b10b4af991ad67089c01c802.xls', '2012-06-01 12:05:11', 'xls', 'uploadData', '27136 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3141', '翠微集团翠微广场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/18b6d025ffa04b2cbb1f81f805b07f68.xls', '2012-06-01 12:18:13', 'xls', 'uploadData', '40448 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3151', '翠微集团翠微广场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/ca95d9e9e8014605b923e9905a86d304.xls', '2012-06-01 12:18:46', 'xls', 'uploadData', '40448 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3161', '翠微集团翠微广场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/acaf2320944c4c85bc7ad6df3cc8ee3e.xls', '2012-06-01 12:19:14', 'xls', 'uploadData', '40960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3171', '翠微集团牡丹园店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/a86980b3b6694d869c9da1e6f272828d.xls', '2012-06-01 12:20:54', 'xls', 'uploadData', '77312 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3181', '翠微集团牡丹园店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/cc86ccd48ee84a01b9d6c89a8ca63c82.xls', '2012-06-01 12:21:24', 'xls', 'uploadData', '77312 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3191', '翠微集团牡丹园店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/28b7fc513ed44703af4fd82f582d8cf1.xls', '2012-06-01 12:22:55', 'xls', 'uploadData', '77312 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3201', '翠微集团牡丹园店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/531de8dd47e94aff82cc8328dfaead33.xls', '2012-06-01 12:24:23', 'xls', 'uploadData', '77824 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3211', '翠微集团牡丹园店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/fccbd61218054f13902c1e80ea0e5129.xls', '2012-06-01 12:24:52', 'xls', 'uploadData', '77824 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3221', '翠微集团牡丹园店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/4fdecc9c65204ef085d665e4fc07a4d1.xls', '2012-06-01 12:25:20', 'xls', 'uploadData', '77824 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3231', '当代商城鼎城店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/119551d4ec1d47609cd8ccad5db7414b.xls', '2012-06-01 12:27:03', 'xls', 'uploadData', '74240 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3241', '当代商城鼎城店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/f16e4a0313ca4c7e964059672258a609.xls', '2012-06-01 12:28:03', 'xls', 'uploadData', '74240 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3251', '当代商城鼎城店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/7b248dfc5aca427fa64ca79ca1df7e82.xls', '2012-06-01 12:28:55', 'xls', 'uploadData', '74240 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3261', '当代商城鼎城店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/b9645c3e8c67450290f88eac2e003bcf.xls', '2012-06-01 12:30:08', 'xls', 'uploadData', '74240 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3271', '当代商城人大店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/310a3fbbb7bb4ab5973c18633a60c321.xls', '2012-06-01 12:31:46', 'xls', 'uploadData', '69120 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3281', '当代商城人大店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/aab9dbc1172c48798e37727a8b9697de.xls', '2012-06-01 12:32:34', 'xls', 'uploadData', '69120 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3291', '东安市场.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/1673eb31ab494ef99f400915d63018c0.xls', '2012-06-01 12:34:08', 'xls', 'uploadData', '35328 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3301', '东方新天地.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/18964b2e8df84a39bfc0c14b376fd5a7.xls', '2012-06-01 12:35:31', 'xls', 'uploadData', '46080 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3311', '法雅体育工厂店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/952d6ac6126b4e46b0751ac7e7800af9.xls', '2012-06-01 12:36:34', 'xls', 'uploadData', '40960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3321', '方恒购物中心.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/8ca4c211fedf4b2cb553e13301b54430.xls', '2012-06-01 12:40:01', 'xls', 'uploadData', '33280 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3331', '当代商城鼎城店-？.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/dcc6089d637c46e1a254e07b88e34090.xls', '2012-06-01 12:41:49', 'xls', 'uploadData', '74240 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3341', '燕莎奥特莱斯.xls', '/attachFiles/uploadData/201206/33751f1484814f4b80ebe3ceb54d29d3.xls', '2012-06-01 13:19:12', 'xls', 'uploadData', '27136 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3351', '燕莎奥特莱斯.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/81e04a42519248a19382beaffae91d98.xls', '2012-06-01 13:19:07', 'xls', 'uploadData', '27136 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3361', '君太百货.xls', '/attachFiles/uploadData/201206/6a68de9aca174b4da8613298c278ded1.xls', '2012-06-01 13:34:07', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3371', '君太百货.xls', '/attachFiles/uploadData/201206/8e840d8e921a4f469a7b248378158b81.xls', '2012-06-01 13:35:19', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3381', '君太百货.xls', '/attachFiles/uploadData/201206/8633fae456784e6ebd122ee74e3b77ca.xls', '2012-06-01 13:36:51', 'xls', 'uploadData', '100864 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3391', '君太百货.xls', '/attachFiles/uploadData/201206/5a4a9422a10b4454ac025887515b5b37.xls', '2012-06-01 13:38:40', 'xls', 'uploadData', '71168 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3401', '君太百货.xls', '/attachFiles/uploadData/201206/cbcdb6750ce741ff8b4e253d23e9b067.xls', '2012-06-01 13:40:23', 'xls', 'uploadData', '55296 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3411', '君太百货.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/1309be6af327492382e95cb90da0b0e8.xls', '2012-06-01 13:38:14', 'xls', 'uploadData', '55296 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3421', '蓝岛大厦.xls', '/attachFiles/uploadData/201206/d77c855773484e8090f94c80afbb8bb2.xls', '2012-06-01 13:43:14', 'xls', 'uploadData', '94208 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3431', '蓝岛大厦.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/9df80a5dbe49488a9467985bd15493ea.xls', '2012-06-01 13:42:50', 'xls', 'uploadData', '83968 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3441', '蓝岛大厦.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/d212b50c9e1d443b884f90743a519908.xls', '2012-06-01 13:43:55', 'xls', 'uploadData', '83968 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3451', '蓝岛大厦.xls', '/attachFiles/uploadData/201206/4e6973f6c6af46d1b8a73c77edf217b0.xls', '2012-06-01 13:48:03', 'xls', 'uploadData', '83968 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3461', '蓝岛大厦.xls', '/attachFiles/uploadData/201206/144bade1926846bbbe5d24a49b809b1b.xls', '2012-06-01 13:49:06', 'xls', 'uploadData', '42496 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3471', '蓝岛大厦.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/3a2fce4080324dd485b838b641399194.xls', '2012-06-01 13:47:09', 'xls', 'uploadData', '67072 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3481', '蓝岛大厦.xls', '/attachFiles/uploadData/201206/d324b3280418429baf87c7d2b723b585.xls', '2012-06-01 13:51:03', 'xls', 'uploadData', '67072 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3491', '蓝岛大厦.xls', '/attachFiles/uploadData/201206/1313e204de3644a08996a5bfcf6b472e.xls', '2012-06-01 13:51:34', 'xls', 'uploadData', '67072 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3501', '蓝岛大厦.xls', '/attachFiles/uploadData/201206/05b1e595985e44c9a3c825bd2b4a94f5.xls', '2012-06-01 13:51:56', 'xls', 'uploadData', '67072 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3511', '蓝岛大厦.xls', '/attachFiles/uploadData/201206/a942ef7640714129bb6915f3e9e8d55d.xls', '2012-06-01 13:52:42', 'xls', 'uploadData', '67072 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3521', '蓝岛大厦.xls', '/attachFiles/uploadData/201206/07d49c27084e418e8fd3afc569318f23.xls', '2012-06-01 13:53:53', 'xls', 'uploadData', '66048 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3531', '蓝岛大厦.xls', '/attachFiles/uploadData/201206/278d1aed8141451ab86a872fa3bdb66d.xls', '2012-06-01 13:56:01', 'xls', 'uploadData', '25088 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3541', '蓝岛大厦.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/9bad7d76437343ab9956db86d01bead6.xls', '2012-06-01 13:53:13', 'xls', 'uploadData', '25088 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3551', '天虹百货国展店.xls', '/attachFiles/uploadData/201206/a503c724933f4991b4884243be0f3f7c.xls', '2012-06-01 13:57:23', 'xls', 'uploadData', '63488 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3561', '天虹百货国展店.xls', '/attachFiles/uploadData/201206/3764c3d5a0c34f34ac9a022ca8f22c65.xls', '2012-06-01 13:58:17', 'xls', 'uploadData', '62976 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3571', '天虹百货国展店.xls', '/attachFiles/uploadData/201206/62bf4e3f925a4a02b9d02a57a503f2bb.xls', '2012-06-01 13:59:22', 'xls', 'uploadData', '62976 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3581', '天虹百货国展店.xls', '/attachFiles/uploadData/201206/f34b68b8c1c449659433152f27f33765.xls', '2012-06-01 14:00:05', 'xls', 'uploadData', '62976 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3591', '天虹百货国展店.xls', '/attachFiles/uploadData/201206/91d210ead47440ca95ae2c4d5f1e2795.xls', '2012-06-01 14:01:21', 'xls', 'uploadData', '62976 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3601', '天虹百货国展店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/ff440739740c43658a28bce0a4446497.xls', '2012-06-01 13:59:23', 'xls', 'uploadData', '25088 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3611', 'APM.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/5fb9f6a2afa74e22b0b9d402148fd11f.xls', '2012-06-01 18:59:56', 'xls', 'uploadData', '38400 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3621', '百货大楼.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/6464abd5af6d4f33ae5596d72c41ee30.xls', '2012-06-01 19:14:34', 'xls', 'uploadData', '48640 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3631', '百货大楼.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/f3a0be8cff1a47fbae607d9a0d07adc7.xls', '2012-06-01 19:17:06', 'xls', 'uploadData', '55808 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3641', '百货大楼.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/f03fb61d5f0f46db892174b8904e5806.xls', '2012-06-01 19:18:05', 'xls', 'uploadData', '55808 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3651', '百货大楼.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/72da30e99f224556958b0625f69649ff.xls', '2012-06-01 19:18:49', 'xls', 'uploadData', '55808 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3661', '百货大楼.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/c354f774a25d47b39296bc2ad9008dd3.xls', '2012-06-01 19:19:43', 'xls', 'uploadData', '55808 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3671', '百盛复兴门店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/f64bf9825cb24096a8f9fd01f7359a3a.xls', '2012-06-01 19:21:06', 'xls', 'uploadData', '68096 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3681', '百盛复兴门店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/e3e497ddde034ca88d5431707a5be5f9.xls', '2012-06-01 19:25:53', 'xls', 'uploadData', '68096 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3691', '百盛复兴门店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/ab37638e547a4e67a4b7d715e76f2f00.xls', '2012-06-01 19:27:14', 'xls', 'uploadData', '68096 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3701', '北辰购物中心安立路店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/173e85f2031d412aa8e4feb24fafe58e.xls', '2012-06-01 19:28:00', 'xls', 'uploadData', '69632 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3711', '北辰购物中心安立路店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/6c8f95f14afe462bbe0f7d1acc4dd53f.xls', '2012-06-01 19:30:00', 'xls', 'uploadData', '69632 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3721', '北辰购物中心安立路店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/c661d0fa825146e88f1cc1b2450b9b03.xls', '2012-06-01 19:31:05', 'xls', 'uploadData', '69632 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3731', '北辰购物中心安立路店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/c0af8d9dc0944b3799936b4c8c6abe6c.xls', '2012-06-01 19:32:40', 'xls', 'uploadData', '69632 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3741', '北辰购物中心安立路店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/a43199427c2d4bb09f58636254806fcc.xls', '2012-06-01 19:33:56', 'xls', 'uploadData', '69632 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3751', '朝阳大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/0904459440ad44b7a2fdeda2790a4e00.xls', '2012-06-01 19:34:28', 'xls', 'uploadData', '50688 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3761', '朝阳大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/b3d1b26b7fa64c7bae12d7609e7be5a7.xls', '2012-06-01 19:35:48', 'xls', 'uploadData', '50688 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3771', '朝阳大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/d171ce6b41f0429ba0213f8ceb438f38.xls', '2012-06-01 19:37:06', 'xls', 'uploadData', '50688 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3781', '朝阳大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/d331a312add741d08049b5ed19510cac.xls', '2012-06-01 19:37:48', 'xls', 'uploadData', '50688 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3791', '朝阳大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/979b3e2eedae4a028bfe2128a1918869.xls', '2012-06-01 19:38:39', 'xls', 'uploadData', '50688 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3801', '朝阳大悦城.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/d46a0b36bd0644ed9bc7bf89ab676f31.xls', '2012-06-01 19:39:44', 'xls', 'uploadData', '51200 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3811', '晨曦百货新天地店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/c0a8b5c4769946e5bea0383c643de62b.xls', '2012-06-01 19:40:12', 'xls', 'uploadData', '35840 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3821', '城乡华懋.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/3bd676ceadbc44e49304f0d1dc13de11.xls', '2012-06-01 19:42:15', 'xls', 'uploadData', '79872 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3831', '城乡华懋.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/19ea3d7850f64a20ab5ef9bdfcb14892.xls', '2012-06-01 19:43:16', 'xls', 'uploadData', '79872 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3841', '城乡华懋.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/0a172daee50747b8a26f494d4ca04670.xls', '2012-06-01 19:43:46', 'xls', 'uploadData', '79872 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3851', '城乡华懋.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/6fa7b6cd2040400cba00c8d7ed995b79.xls', '2012-06-01 19:44:20', 'xls', 'uploadData', '79872 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3861', '城乡华懋.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/f43c9ae9a27e42fcb162421590303c69.xls', '2012-06-01 19:45:02', 'xls', 'uploadData', '79872 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3871', '翠微集团翠微店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/52250af24f5c4d5e92ff73b202c93690.xls', '2012-06-01 19:45:55', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3881', '翠微集团翠微店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/5c8926e90aec4289a5bdeeed5864b259.xls', '2012-06-01 19:47:43', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3891', '翠微集团翠微店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/1ac92ebcccc840489807bfd34d75976d.xls', '2012-06-01 19:48:32', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3901', '翠微集团翠微店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/455a85d4da5044279dd56c24f9615cec.xls', '2012-06-01 19:49:00', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3911', '翠微集团翠微店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/360c2d2ba6d94caabc7882851e0fe9ed.xls', '2012-06-01 19:49:43', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3921', '翠微集团翠微店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/e78eb69a30af4c70b0bcdfef22f13661.xls', '2012-06-01 19:50:22', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3931', '翠微集团翠微店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/6e98185f09fb4d4ebd99879fc56fb904.xls', '2012-06-01 19:51:24', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3941', '翠微集团翠微店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/0fb12c9e56a747e8803dc1950194f584.xls', '2012-06-01 19:52:31', 'xls', 'uploadData', '104960 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3951', 'APM.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/1c42d1fa5ee84e398513a4dcfd5a4a92.xls', '2012-06-01 19:53:06', 'xls', 'uploadData', '38400 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3961', 'APM.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/1a75bde2f1274baa86f83fb04f967253.xls', '2012-06-01 19:54:14', 'xls', 'uploadData', '38400 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3971', 'APM.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/975d6a7a897e44bb923e1eb117dda15b.xls', '2012-06-01 19:55:05', 'xls', 'uploadData', '38400 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3981', '当代商城鼎城店.xlsx', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/92659f1999cd41afb86ecc7e469fda04.xlsx', '2012-06-05 09:36:06', 'xlsx', 'uploadData', '26567 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('3991', '当代商城鼎城店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/2722912f12fc4e438f0f4331dd68168b.xls', '2012-06-05 09:36:47', 'xls', 'uploadData', '74240 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('4001', '当代商城鼎城店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/5113f452cc1d4c12a41794edf6acf40f.xls', '2012-06-05 09:37:36', 'xls', 'uploadData', '74240 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('4011', '当代商城鼎城店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/ba731f8eafea48109b5403944115e629.xls', '2012-06-05 09:38:18', 'xls', 'uploadData', '74240 bytes', 'UNKown');
INSERT INTO `file_attach` VALUES ('4021', '当代商城鼎城店.xls', '//usr/local/apache-tomcat-brandpool/webapps/brandpool/attachFiles/uploadData/201206/92da62b5e918439393849c37afe2ca7c.xls', '2012-06-05 09:38:50', 'xls', 'uploadData', '74240 bytes', 'UNKown');

-- ----------------------------
-- Table structure for `form_data`
-- ----------------------------
DROP TABLE IF EXISTS `form_data`;
CREATE TABLE `form_data` (
  `dataId` bigint(20) NOT NULL AUTO_INCREMENT,
  `formId` bigint(20) NOT NULL COMMENT '所属表单',
  `fieldLabel` varchar(128) NOT NULL COMMENT '字段标签',
  `fieldName` varchar(64) NOT NULL COMMENT '字段名称',
  `intValue` int(11) DEFAULT NULL COMMENT '整数值',
  `longValue` bigint(20) DEFAULT NULL COMMENT '长整值',
  `decValue` decimal(18,4) DEFAULT NULL COMMENT '精度值',
  `dateValue` datetime DEFAULT NULL COMMENT '日期值',
  `strValue` varchar(4000) DEFAULT NULL COMMENT '字符值',
  `boolValue` smallint(6) DEFAULT NULL COMMENT '布尔值',
  `blobValue` blob COMMENT '对象值',
  `isShowed` smallint(6) NOT NULL COMMENT '是否显示\r\n            1=显示\r\n            0=不显示',
  `textValue` text,
  `fieldType` varchar(32) NOT NULL,
  PRIMARY KEY (`dataId`),
  KEY `FK_FD_R_PF` (`formId`) USING BTREE,
  CONSTRAINT `form_data_ibfk_1` FOREIGN KEY (`formId`) REFERENCES `process_form` (`formId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_data
-- ----------------------------

-- ----------------------------
-- Table structure for `form_def`
-- ----------------------------
DROP TABLE IF EXISTS `form_def`;
CREATE TABLE `form_def` (
  `formDefId` bigint(20) NOT NULL AUTO_INCREMENT,
  `formName` varchar(128) NOT NULL COMMENT '表单名称',
  `columns` int(11) NOT NULL COMMENT '总列数',
  `isEnabled` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否可用',
  `activityName` varchar(128) NOT NULL COMMENT '节点名称',
  `deployId` varchar(128) NOT NULL COMMENT 'Jbpm流程发布ID',
  `extDef` text COMMENT '表单定义',
  `formView` varchar(128) DEFAULT NULL COMMENT '流程定义View',
  PRIMARY KEY (`formDefId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of form_def
-- ----------------------------
INSERT INTO `form_def` VALUES ('1', '申请-表单', '1', '1', '申请', '7', null, null);
INSERT INTO `form_def` VALUES ('2', '部门领导审阅-表单', '1', '1', '部门领导审阅', '7', null, null);
INSERT INTO `form_def` VALUES ('3', '分管领导盖章-表单', '1', '1', '分管领导盖章', '7', null, null);
INSERT INTO `form_def` VALUES ('4', '打印-表单', '1', '1', '打印', '7', null, null);
INSERT INTO `form_def` VALUES ('5', '财务处-表单', '1', '1', '财务处', '7', null, null);
INSERT INTO `form_def` VALUES ('6', '开始-表单', '1', '1', '开始', '8', null, null);
INSERT INTO `form_def` VALUES ('7', '上级审批-表单', '1', '1', '上级审批', '8', null, null);
INSERT INTO `form_def` VALUES ('8', '开始-表单', '1', '1', '开始', '5', null, null);
INSERT INTO `form_def` VALUES ('9', '登记拟办-表单', '1', '1', '登记拟办', '5', null, null);
INSERT INTO `form_def` VALUES ('10', '领导批示-表单', '1', '1', '领导批示', '5', null, null);
INSERT INTO `form_def` VALUES ('11', '公文分发-表单', '1', '1', '公文分发', '5', null, null);
INSERT INTO `form_def` VALUES ('12', '承办传阅-表单', '1', '1', '承办传阅', '5', null, null);
INSERT INTO `form_def` VALUES ('13', '开始-表单', '1', '1', '开始', '4', null, null);
INSERT INTO `form_def` VALUES ('14', '发文核稿-表单', '1', '1', '发文核稿', '4', null, null);
INSERT INTO `form_def` VALUES ('15', '科室审核-表单', '1', '1', '科室审核', '4', null, null);
INSERT INTO `form_def` VALUES ('16', '主管领导审批-表单', '1', '1', '主管领导审批', '4', null, null);
INSERT INTO `form_def` VALUES ('17', '发文分发-表单', '1', '1', '发文分发', '4', null, null);
INSERT INTO `form_def` VALUES ('18', '发文校对-表单', '1', '1', '发文校对', '4', null, null);
INSERT INTO `form_def` VALUES ('19', '分管领导签发-表单', '1', '1', '分管领导签发', '4', null, null);
INSERT INTO `form_def` VALUES ('20', '科室负责人核稿-表单', '1', '1', '科室负责人核稿', '12', null, null);
INSERT INTO `form_def` VALUES ('21', '分管或局领导签发-表单', '1', '1', '分管或局领导签发', '12', null, null);
INSERT INTO `form_def` VALUES ('22', '办公室主任承办-表单', '1', '1', '办公室主任承办', '12', null, null);
INSERT INTO `form_def` VALUES ('23', '编号盖章分发-表单', '1', '1', '编号盖章分发', '12', null, null);
INSERT INTO `form_def` VALUES ('24', '开始-表单', '1', '1', '开始', '12', null, null);
INSERT INTO `form_def` VALUES ('25', '开始-表单', '1', '1', '开始', '13', null, null);
INSERT INTO `form_def` VALUES ('26', '部门负责人审批-表单', '1', '1', '部门负责人审批', '13', null, null);
INSERT INTO `form_def` VALUES ('27', '人事登记-表单', '1', '1', '人事登记', '13', null, null);
INSERT INTO `form_def` VALUES ('28', '开始-表单', '1', '1', '开始', '15', null, null);
INSERT INTO `form_def` VALUES ('29', '部门负责人审批-表单', '1', '1', '部门负责人审批', '15', null, null);
INSERT INTO `form_def` VALUES ('30', '局长审批-表单', '1', '1', '局长审批', '15', null, null);
INSERT INTO `form_def` VALUES ('31', '人事登记-表单', '1', '1', '人事登记', '15', null, null);
INSERT INTO `form_def` VALUES ('32', '开始-表单', '1', '1', '开始', '14', null, null);
INSERT INTO `form_def` VALUES ('33', '部门负责人审批-表单', '1', '1', '部门负责人审批', '14', null, null);
INSERT INTO `form_def` VALUES ('34', '分管局长审批-表单', '1', '1', '分管局长审批', '14', null, null);
INSERT INTO `form_def` VALUES ('35', '局长审批-表单', '1', '1', '局长审批', '14', null, null);
INSERT INTO `form_def` VALUES ('36', '人事登记-表单', '1', '1', '人事登记', '14', null, null);
INSERT INTO `form_def` VALUES ('37', '开始-表单', '1', '1', '开始', '17', null, null);
INSERT INTO `form_def` VALUES ('38', '上报审批-表单', '1', '1', '上报审批', '17', null, null);
INSERT INTO `form_def` VALUES ('39', '人力资源核实并确认-表单', '1', '1', '人力资源核实并确认', '17', null, null);
INSERT INTO `form_def` VALUES ('40', '目标设定与面谈-表单', '1', '1', '目标设定与面谈', '17', null, null);
INSERT INTO `form_def` VALUES ('41', '考核期评估-表单', '1', '1', '考核期评估', '17', null, null);
INSERT INTO `form_def` VALUES ('42', '领导批准-表单', '1', '1', '领导批准', '17', null, null);
INSERT INTO `form_def` VALUES ('43', '人力资源确认-表单', '1', '1', '人力资源确认', '17', null, null);
INSERT INTO `form_def` VALUES ('44', '晋升面谈-表单', '1', '1', '晋升面谈', '17', null, null);
INSERT INTO `form_def` VALUES ('45', '任命发文-表单', '1', '1', '任命发文', '17', null, null);
INSERT INTO `form_def` VALUES ('46', '开始-表单', '1', '1', '开始', '18', null, null);
INSERT INTO `form_def` VALUES ('47', '人力资源复核确认-表单', '1', '1', '人力资源复核确认', '18', null, null);
INSERT INTO `form_def` VALUES ('48', '开始-表单', '1', '1', '开始', '20', null, null);
INSERT INTO `form_def` VALUES ('49', '直线经理审核-表单', '1', '1', '直线经理审核', '20', null, null);
INSERT INTO `form_def` VALUES ('50', '人力资源复核-表单', '1', '1', '人力资源复核', '20', null, null);
INSERT INTO `form_def` VALUES ('51', '分管副总裁确认-表单', '1', '1', '分管副总裁确认', '20', null, null);

-- ----------------------------
-- Table structure for `fun_url`
-- ----------------------------
DROP TABLE IF EXISTS `fun_url`;
CREATE TABLE `fun_url` (
  `urlId` bigint(20) NOT NULL AUTO_INCREMENT,
  `functionId` bigint(20) NOT NULL,
  `urlPath` varchar(128) NOT NULL,
  PRIMARY KEY (`urlId`),
  KEY `FK_FU_R_AFN` (`functionId`) USING BTREE,
  CONSTRAINT `fun_url_ibfk_1` FOREIGN KEY (`functionId`) REFERENCES `app_function` (`functionId`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fun_url
-- ----------------------------
INSERT INTO `fun_url` VALUES ('1', '1', '/system/listAppUser.do');
INSERT INTO `fun_url` VALUES ('2', '2', '/system/listAppUser.do');
INSERT INTO `fun_url` VALUES ('3', '2', '/system/chooseRolesAppUser.do');
INSERT INTO `fun_url` VALUES ('4', '2', '/system/selectedRolesAppUser.do');
INSERT INTO `fun_url` VALUES ('5', '2', '/system/listDepartment.do');
INSERT INTO `fun_url` VALUES ('6', '3', '/system/listAppUser.do');
INSERT INTO `fun_url` VALUES ('7', '3', '/system/chooseRolesAppUser.do');
INSERT INTO `fun_url` VALUES ('8', '3', '/system/selectedRolesAppUser.do');
INSERT INTO `fun_url` VALUES ('9', '3', '/system/listDepartment.do');
INSERT INTO `fun_url` VALUES ('10', '4', '/system/listAppUser.do');
INSERT INTO `fun_url` VALUES ('11', '4', '/system/multiDelAppUser.do');
INSERT INTO `fun_url` VALUES ('12', '5', '/system/listAppRole.do');
INSERT INTO `fun_url` VALUES ('13', '6', '/system/listAppRole.do');
INSERT INTO `fun_url` VALUES ('14', '6', '/system/saveAppRole.do');
INSERT INTO `fun_url` VALUES ('15', '7', '/system/listAppRole.do');
INSERT INTO `fun_url` VALUES ('16', '7', '/system/saveAppRole.do');
INSERT INTO `fun_url` VALUES ('17', '7', '/system/getAppRole.do');
INSERT INTO `fun_url` VALUES ('18', '8', '/system/listAppRole.do');
INSERT INTO `fun_url` VALUES ('19', '8', '/system/mulDelAppRole.do');
INSERT INTO `fun_url` VALUES ('20', '9', '/system/listAppRole.do');
INSERT INTO `fun_url` VALUES ('21', '9', '/system/grantXmlAppRole.do');
INSERT INTO `fun_url` VALUES ('22', '9', '/system/getAppRole.do');
INSERT INTO `fun_url` VALUES ('23', '9', '/system/grantAppRole.do');
INSERT INTO `fun_url` VALUES ('24', '10', '/system/listDepartment.do');
INSERT INTO `fun_url` VALUES ('25', '10', '/system/selectAppUser.do');
INSERT INTO `fun_url` VALUES ('26', '11', '/system/listDepartment.do');
INSERT INTO `fun_url` VALUES ('27', '11', '/system/addDepartment.do');
INSERT INTO `fun_url` VALUES ('28', '11', '/system/selectAppUser.do');
INSERT INTO `fun_url` VALUES ('29', '11', '/system/saveAppUser.do');
INSERT INTO `fun_url` VALUES ('30', '12', '/system/listDepartment.do');
INSERT INTO `fun_url` VALUES ('31', '12', '/system/addDepartment.do');
INSERT INTO `fun_url` VALUES ('32', '12', '/system/detailDepartment.do');
INSERT INTO `fun_url` VALUES ('33', '12', '/system/selectAppUser.do');
INSERT INTO `fun_url` VALUES ('34', '12', '/system/saveAppUser.do');
INSERT INTO `fun_url` VALUES ('35', '13', '/system/listDepartment.do');
INSERT INTO `fun_url` VALUES ('36', '13', '/system/removeDepartment.do');
INSERT INTO `fun_url` VALUES ('37', '13', '/system/selectAppUser.do');
INSERT INTO `fun_url` VALUES ('38', '13', '/system/saveAppUser.do');
INSERT INTO `fun_url` VALUES ('39', '14', '/system/listFileAttach.do');
INSERT INTO `fun_url` VALUES ('40', '15', '/system/saveFileAttach.do');
INSERT INTO `fun_url` VALUES ('41', '15', '/system/listFileAttach.do');
INSERT INTO `fun_url` VALUES ('42', '15', '/system/getFileAttach.do');
INSERT INTO `fun_url` VALUES ('43', '16', '/system/listFileAttach.do');
INSERT INTO `fun_url` VALUES ('44', '16', '/system/multiDelFileAttach.do');
INSERT INTO `fun_url` VALUES ('45', '17', '/system/listCompany.do');
INSERT INTO `fun_url` VALUES ('46', '17', '/system/addCompany.do');
INSERT INTO `fun_url` VALUES ('47', '18', '/flow/rootProType.do');
INSERT INTO `fun_url` VALUES ('48', '18', '/flow/listProDefinition.do');
INSERT INTO `fun_url` VALUES ('49', '18', '/flow/processDetail.do');
INSERT INTO `fun_url` VALUES ('50', '19', '/flow/rootProType.do');
INSERT INTO `fun_url` VALUES ('51', '19', '/flow/saveProType.do');
INSERT INTO `fun_url` VALUES ('52', '19', '/flow/removeProType.do');
INSERT INTO `fun_url` VALUES ('53', '19', '/flow/getProType.do');
INSERT INTO `fun_url` VALUES ('54', '20', '/flow/rootProType.do');
INSERT INTO `fun_url` VALUES ('55', '20', '/flow/listProDefinition.do');
INSERT INTO `fun_url` VALUES ('56', '20', '/flow/saveProDefinition.do');
INSERT INTO `fun_url` VALUES ('57', '20', '/flow/listProType.do');
INSERT INTO `fun_url` VALUES ('58', '20', '/flow/getProDefinition.do');
INSERT INTO `fun_url` VALUES ('59', '21', '/flow/rootProType.do');
INSERT INTO `fun_url` VALUES ('60', '21', '/flow/listProDefinition.do');
INSERT INTO `fun_url` VALUES ('61', '21', '/flow/saveProDefinition.do');
INSERT INTO `fun_url` VALUES ('62', '21', '/flow/listProType.do');
INSERT INTO `fun_url` VALUES ('63', '21', '/flow/getProDefinition.do');
INSERT INTO `fun_url` VALUES ('64', '22', '/flow/rootProType.do');
INSERT INTO `fun_url` VALUES ('65', '22', '/flow/listProDefinition.do');
INSERT INTO `fun_url` VALUES ('66', '22', '/flow/multiDelProDefinition.do');
INSERT INTO `fun_url` VALUES ('67', '23', '/flow/processDetail.do');
INSERT INTO `fun_url` VALUES ('68', '24', '/flow/saveProUserAssign.do');
INSERT INTO `fun_url` VALUES ('69', '24', '/flow/listProUserAssign.do');
INSERT INTO `fun_url` VALUES ('70', '25', '/document/saveDocFolder.do');
INSERT INTO `fun_url` VALUES ('71', '25', '/document/getDocFolder.do');
INSERT INTO `fun_url` VALUES ('72', '25', '/document/removeDocFolder.do');
INSERT INTO `fun_url` VALUES ('73', '26', '/document/listDocPrivilege.do');
INSERT INTO `fun_url` VALUES ('74', '27', '/document/listDocPrivilege.do');
INSERT INTO `fun_url` VALUES ('75', '27', '/document/addDocPrivilege.do');
INSERT INTO `fun_url` VALUES ('76', '28', '/document/listDocPrivilege.do');
INSERT INTO `fun_url` VALUES ('77', '28', '/document/changeDocPrivilege.do');
INSERT INTO `fun_url` VALUES ('78', '29', '/document/listDocPrivilege.do');
INSERT INTO `fun_url` VALUES ('79', '29', '/document/multiDelDocPrivilege.do');
INSERT INTO `fun_url` VALUES ('88', '35', '/info/categoryNews.do');
INSERT INTO `fun_url` VALUES ('89', '35', '/info/treeNewsType.do');
INSERT INTO `fun_url` VALUES ('90', '36', '/info/categoryNews.do');
INSERT INTO `fun_url` VALUES ('91', '36', '/info/treeNewsType.do');
INSERT INTO `fun_url` VALUES ('92', '36', '/info/saveNews.do');
INSERT INTO `fun_url` VALUES ('96', '38', '/info/categoryNews.do');
INSERT INTO `fun_url` VALUES ('97', '38', '/info/treeNewsType.do');
INSERT INTO `fun_url` VALUES ('98', '38', '/info/multiDelNews.do');
INSERT INTO `fun_url` VALUES ('99', '40', '/info/multiDelNewsComment.do');
INSERT INTO `fun_url` VALUES ('100', '41', '/info/listNewsType.do');
INSERT INTO `fun_url` VALUES ('101', '42', '/info/listNewsType.do');
INSERT INTO `fun_url` VALUES ('102', '42', '/info/addNewsType.do');
INSERT INTO `fun_url` VALUES ('103', '43', '/info/listNewsType.do');
INSERT INTO `fun_url` VALUES ('104', '43', '/info/addNewsType.do');
INSERT INTO `fun_url` VALUES ('105', '43', '/info/detailNewsType.do');
INSERT INTO `fun_url` VALUES ('106', '43', '/info/sortNewsType.do');
INSERT INTO `fun_url` VALUES ('114', '44', '/info/listNewsType.do');
INSERT INTO `fun_url` VALUES ('115', '44', '/info/removeNewsType.do');
INSERT INTO `fun_url` VALUES ('127', '48', '');
INSERT INTO `fun_url` VALUES ('130', '57', 'http://sina.com.cn');
INSERT INTO `fun_url` VALUES ('131', '57', 'http://yahoo.com.cn');

-- ----------------------------
-- Table structure for `hr_task_scheduler`
-- ----------------------------
DROP TABLE IF EXISTS `hr_task_scheduler`;
CREATE TABLE `hr_task_scheduler` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `taskname` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `runtime` varchar(255) DEFAULT NULL COMMENT '运行周期',
  `cronTrigger` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hr_task_scheduler
-- ----------------------------
INSERT INTO `hr_task_scheduler` VALUES ('1', '订单拆分失败定时任务', '0 0 0 ? 12 6L 2055', 'dealFailSplitOrderTrigger', '取消执行任务');
INSERT INTO `hr_task_scheduler` VALUES ('2', '订单拆分未接受消息任务', '0 0 0 ? 12 6L 2055', 'dealUnReceiveSplitOrderTrigger', '取消执行任务');
INSERT INTO `hr_task_scheduler` VALUES ('3', '订单修改信息失败定时任务', '0 0 0 ? 12 6L 2055', 'dealFailOrderModifyMsgTrigger', '取消执行任务');
INSERT INTO `hr_task_scheduler` VALUES ('4', '订单修改信息未接受消息任务', '0 0 0 ? 12 6L 2055', 'dealUnReceiveOrderModifyMsgTrigger', '取消执行任务');

-- ----------------------------
-- Table structure for `in_message`
-- ----------------------------
DROP TABLE IF EXISTS `in_message`;
CREATE TABLE `in_message` (
  `receiveId` bigint(20) NOT NULL AUTO_INCREMENT,
  `messageId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL COMMENT '主键',
  `readFlag` smallint(6) NOT NULL COMMENT '1=has red\r\n            0=unread',
  `delFlag` smallint(6) NOT NULL,
  `userFullname` varchar(32) NOT NULL,
  PRIMARY KEY (`receiveId`),
  KEY `FK_IM_R_AU` (`userId`) USING BTREE,
  KEY `FK_IM_R_SM` (`messageId`) USING BTREE,
  CONSTRAINT `in_message_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `app_user` (`userId`),
  CONSTRAINT `in_message_ibfk_2` FOREIGN KEY (`messageId`) REFERENCES `short_message` (`messageId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of in_message
-- ----------------------------
INSERT INTO `in_message` VALUES ('1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for `index_display`
-- ----------------------------
DROP TABLE IF EXISTS `index_display`;
CREATE TABLE `index_display` (
  `indexId` bigint(20) NOT NULL AUTO_INCREMENT,
  `portalId` varchar(64) NOT NULL COMMENT 'Portal ID',
  `userId` bigint(20) NOT NULL COMMENT '用户ID',
  `colNum` int(11) NOT NULL COMMENT '列号',
  `rowNum` int(11) NOT NULL COMMENT '行号',
  PRIMARY KEY (`indexId`),
  KEY `FK_ID_R_AU` (`userId`) USING BTREE,
  CONSTRAINT `index_display_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `app_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='每个员工可以设置自己的显示方式';

-- ----------------------------
-- Records of index_display
-- ----------------------------
INSERT INTO `index_display` VALUES ('8', 'NewsPanelView', '1', '0', '0');
INSERT INTO `index_display` VALUES ('9', 'NoticePanelView', '1', '0', '1');
INSERT INTO `index_display` VALUES ('10', 'MessagePanelView', '1', '1', '0');

-- ----------------------------
-- Table structure for `jbpm4_deployment`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_deployment`;
CREATE TABLE `jbpm4_deployment` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME_` longtext,
  `TIMESTAMP_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_deployprop`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_deployprop`;
CREATE TABLE `jbpm4_deployprop` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `OBJNAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `STRINGVAL_` varchar(255) DEFAULT NULL,
  `LONGVAL_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_DEPLPROP_DEPL` (`DEPLOYMENT_`) USING BTREE,
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`) USING BTREE,
  CONSTRAINT `jbpm4_deployprop_ibfk_1` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_deployprop
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_execution`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_execution`;
CREATE TABLE `jbpm4_execution` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ACTIVITYNAME_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `HISACTINST_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `INSTANCE_` bigint(20) DEFAULT NULL,
  `SUPEREXEC_` bigint(20) DEFAULT NULL,
  `SUBPROCINST_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  UNIQUE KEY `ID_` (`ID_`) USING BTREE,
  KEY `IDX_EXEC_SUPEREXEC` (`SUPEREXEC_`) USING BTREE,
  KEY `IDX_EXEC_INSTANCE` (`INSTANCE_`) USING BTREE,
  KEY `IDX_EXEC_SUBPI` (`SUBPROCINST_`) USING BTREE,
  KEY `IDX_EXEC_PARENT` (`PARENT_`) USING BTREE,
  KEY `FK_EXEC_PARENT` (`PARENT_`) USING BTREE,
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`) USING BTREE,
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`) USING BTREE,
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`) USING BTREE,
  CONSTRAINT `jbpm4_execution_ibfk_1` FOREIGN KEY (`INSTANCE_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `jbpm4_execution_ibfk_2` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `jbpm4_execution_ibfk_3` FOREIGN KEY (`SUBPROCINST_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `jbpm4_execution_ibfk_4` FOREIGN KEY (`SUPEREXEC_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_execution
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_actinst`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_actinst`;
CREATE TABLE `jbpm4_hist_actinst` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSITION_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HACTI_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `IDX_HTI_HTASK` (`HTASK_`) USING BTREE,
  KEY `FK_HACTI_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `FK_HTI_HTASK` (`HTASK_`) USING BTREE,
  CONSTRAINT `jbpm4_hist_actinst_ibfk_1` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `jbpm4_hist_actinst_ibfk_2` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_detail`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_detail`;
CREATE TABLE `jbpm4_hist_detail` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HPROCIIDX_` int(11) DEFAULT NULL,
  `HACTI_` bigint(20) DEFAULT NULL,
  `HACTIIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  `HTASKIDX_` int(11) DEFAULT NULL,
  `HVAR_` bigint(20) DEFAULT NULL,
  `HVARIDX_` int(11) DEFAULT NULL,
  `MESSAGE_` longtext,
  `OLD_INT_` int(11) DEFAULT NULL,
  `NEW_INT_` int(11) DEFAULT NULL,
  `OLD_STR_` varchar(255) DEFAULT NULL,
  `NEW_STR_` varchar(255) DEFAULT NULL,
  `OLD_TIME_` datetime DEFAULT NULL,
  `NEW_TIME_` datetime DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HDET_HACTI` (`HACTI_`) USING BTREE,
  KEY `IDX_HDET_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `IDX_HDETAIL_HACTI` (`HACTI_`) USING BTREE,
  KEY `IDX_HDETAIL_HVAR` (`HVAR_`) USING BTREE,
  KEY `IDX_HDETAIL_HTASK` (`HTASK_`) USING BTREE,
  KEY `IDX_HDETAIL_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `IDX_HDET_HVAR` (`HVAR_`) USING BTREE,
  KEY `IDX_HDET_HTASK` (`HTASK_`) USING BTREE,
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `FK_HDETAIL_HACTI` (`HACTI_`) USING BTREE,
  KEY `FK_HDETAIL_HTASK` (`HTASK_`) USING BTREE,
  KEY `FK_HDETAIL_HVAR` (`HVAR_`) USING BTREE,
  CONSTRAINT `jbpm4_hist_detail_ibfk_1` FOREIGN KEY (`HACTI_`) REFERENCES `jbpm4_hist_actinst` (`DBID_`),
  CONSTRAINT `jbpm4_hist_detail_ibfk_2` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `jbpm4_hist_detail_ibfk_3` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`),
  CONSTRAINT `jbpm4_hist_detail_ibfk_4` FOREIGN KEY (`HVAR_`) REFERENCES `jbpm4_hist_var` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_procinst`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_procinst`;
CREATE TABLE `jbpm4_hist_procinst` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ENDACTIVITY_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_task`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_task`;
CREATE TABLE `jbpm4_hist_task` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `OUTCOME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`) USING BTREE,
  CONSTRAINT `jbpm4_hist_task_ibfk_1` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_task
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_hist_var`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_var`;
CREATE TABLE `jbpm4_hist_var` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `PROCINSTID_` varchar(255) DEFAULT NULL,
  `EXECUTIONID_` varchar(255) DEFAULT NULL,
  `VARNAME_` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_HVAR_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `IDX_HVAR_HTASK` (`HTASK_`) USING BTREE,
  KEY `FK_HVAR_HPROCI` (`HPROCI_`) USING BTREE,
  KEY `FK_HVAR_HTASK` (`HTASK_`) USING BTREE,
  CONSTRAINT `jbpm4_hist_var_ibfk_1` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `jbpm4_hist_var_ibfk_2` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_var
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_id_group`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_group`;
CREATE TABLE `jbpm4_id_group` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_GROUP_PARENT` (`PARENT_`) USING BTREE,
  KEY `FK_GROUP_PARENT` (`PARENT_`) USING BTREE,
  CONSTRAINT `jbpm4_id_group_ibfk_1` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_id_group` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_id_membership`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_membership`;
CREATE TABLE `jbpm4_id_membership` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `DBVERSION_` int(11) NOT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_MEM_USER` (`USER_`) USING BTREE,
  KEY `IDX_MEM_GROUP` (`GROUP_`) USING BTREE,
  KEY `FK_MEM_GROUP` (`GROUP_`) USING BTREE,
  KEY `FK_MEM_USER` (`USER_`) USING BTREE,
  CONSTRAINT `jbpm4_id_membership_ibfk_1` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm4_id_group` (`DBID_`),
  CONSTRAINT `jbpm4_id_membership_ibfk_2` FOREIGN KEY (`USER_`) REFERENCES `jbpm4_id_user` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_id_user`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_user`;
CREATE TABLE `jbpm4_id_user` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  `GIVENNAME_` varchar(255) DEFAULT NULL,
  `FAMILYNAME_` varchar(255) DEFAULT NULL,
  `BUSINESSEMAIL_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_job`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_job`;
CREATE TABLE `jbpm4_job` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKEXPTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` longtext,
  `RETRIES_` int(11) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `CFG_` bigint(20) DEFAULT NULL,
  `SIGNAL_` varchar(255) DEFAULT NULL,
  `EVENT_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_JOBRETRIES` (`RETRIES_`) USING BTREE,
  KEY `IDX_JOB_CFG` (`CFG_`) USING BTREE,
  KEY `IDX_JOB_PRINST` (`PROCESSINSTANCE_`) USING BTREE,
  KEY `IDX_JOB_EXE` (`EXECUTION_`) USING BTREE,
  KEY `IDX_JOBLOCKEXP` (`LOCKEXPTIME_`) USING BTREE,
  KEY `IDX_JOBDUEDATE` (`DUEDATE_`) USING BTREE,
  KEY `FK_JOB_CFG` (`CFG_`) USING BTREE,
  CONSTRAINT `jbpm4_job_ibfk_1` FOREIGN KEY (`CFG_`) REFERENCES `jbpm4_lob` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_job
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_lob`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_lob`;
CREATE TABLE `jbpm4_lob` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `DBVERSION_` int(11) NOT NULL,
  `BLOB_VALUE_` longblob,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `NAME_` longtext,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_LOB_DEPLOYMENT` (`DEPLOYMENT_`) USING BTREE,
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`) USING BTREE,
  CONSTRAINT `jbpm4_lob_ibfk_1` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_lob
-- ----------------------------
INSERT INTO `jbpm4_lob` VALUES ('18', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657200000000000000010200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000012859BEDC0078000000007400007372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000CE7BBB4E68AA4E7B3BBE7BB9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00130000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00130000000274000CE4BFA1E681AFE983A8E997A87371007E00180000000000000000740004302E312E7074000F31313140686F746D61696C2E636F6D74000074000363777874000074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D740000740000740000737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E002C7870FFFFFFFF00017371007E0018000000000000000271007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E002AFFFFFFFF00007371007E0018FFFFFFFFFFFFFFFF71007E003474002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E002AFFFFFFFF000071007E003671007E003474002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001200007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003674000FE8B685E7BAA7E7AEA1E79086E591987371007E0012000171007E0034787371007E0027770C000000103F4000000000000171007E0034787371007E001200017371007E0012000171007E002F740003637378740000, null, null);
INSERT INTO `jbpm4_lob` VALUES ('19', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657200000000000000010200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000CE7BBB4E68AA4E7B3BBE7BB9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000CE4BFA1E681AFE983A8E997A87371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('20', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657200000000000000010200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000CE7BBB4E68AA4E7B3BBE7BB9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000CE4BFA1E681AFE983A8E997A87371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('34', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657200000000000000010200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000CE7BBB4E68AA4E7B3BBE7BB9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000CE4BFA1E681AFE983A8E997A87371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('63', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657200000000000000010200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000CE7BBB4E68AA4E7B3BBE7BB9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000CE4BFA1E681AFE983A8E997A87371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('69', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657200000000000000010200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000CE7BBB4E68AA4E7B3BBE7BB9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000CE4BFA1E681AFE983A8E997A87371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('71', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657200000000000000010200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000012859BEDC0078000000007400007372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000CE7BBB4E68AA4E7B3BBE7BB9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00130000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00130000000274000CE4BFA1E681AFE983A8E997A87371007E00180000000000000000740004302E312E7074000F31313140686F746D61696C2E636F6D74000074000363777874000638383838383874002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D740006383838383838740000740009E5B7A5E7A88BE5B888737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E002C7870FFFFFFFF00017371007E0018000000000000000271007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E002AFFFFFFFF00007371007E0018FFFFFFFFFFFFFFFF71007E003474002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E002AFFFFFFFF000071007E003671007E003474002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001200007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003674000FE8B685E7BAA7E7AEA1E79086E591987371007E0012000171007E0034787371007E0027770C000000103F4000000000000171007E0034787371007E001200017371007E0012000171007E002F740003637378740000, null, null);
INSERT INTO `jbpm4_lob` VALUES ('72', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000CE7BBB4E68AA4E7B3BBE7BB9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000CE4BFA1E681AFE983A8E997A87371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('76', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657200000000000000010200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000CE7BBB4E68AA4E7B3BBE7BB9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000CE4BFA1E681AFE983A8E997A87371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('77', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000CE7BBB4E68AA4E7B3BBE7BB9F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000CE4BFA1E681AFE983A8E997A87371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('81', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('82', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('83', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('84', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('85', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('86', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('87', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('88', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('89', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('90', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000012859BEDC0078000000007400007372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00130000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00130000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00180000000000000000740004302E312E7074000F31313140686F746D61696C2E636F6D74000074000363777874000638383838383874002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D740006383838383838740000740009E5B7A5E7A88BE5B888737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E002C7870FFFFFFFF00017371007E0018000000000000000271007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E002AFFFFFFFF00007371007E0018FFFFFFFFFFFFFFFF71007E003474002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E002AFFFFFFFF000071007E003671007E003474002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001200007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003674000FE8B685E7BAA7E7AEA1E79086E591987371007E0012000171007E0034787371007E0027770C000000103F4000000000000171007E0034787371007E001200017371007E0012000171007E002F740003637378740000, null, null);
INSERT INTO `jbpm4_lob` VALUES ('91', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('92', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('94', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('95', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('97', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('98', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('101', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('104', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('105', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('106', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('107', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('108', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074000F637378406A65652D736F66742E636E7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('127', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001323F77AC0078000000007400007372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE5B882E59CBAE890A5E99480E983A87372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E0013000000000000002A737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00130000000374000FE5B882E59CBAE890A5E99480E983A87371007E0018000000000000001B740008302E32372E34322E7074001163686F75706968616F403136332E636F6D740000740006E58898E585AD74000074002C6B625452516F492F66534446384933326B534C65512F4E66425871596A5A595A39744D546849584A6F674D3D740000740000740012E585ACE585B3E5AA92E4BB8BE4B893E59198737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000002003F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E002C7870FFFFFFFF00017371007E0018000000000000000871007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000273720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E002AFFFFFFFF00007371007E0018000000000000000671007E003474002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E002AFFFFFFFF000071007E003671007E003474002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001200007413FF417263686976652C41726368466C6F77436F6E66566965772C5F41726368466C6F77436F6E66456469742C4172636869766549737375652C417263686976655479706554656D70566965772C5F417263686976655479706554656D7051756572792C5F4172636869766573547970654164642C5F417263686976657354797065456469742C5F41726368697665735479706544656C2C5F417263686976657354656D704164642C5F417263686976657354656D70456469742C5F417263687669657354656D7044656C2C41726368697665734472616674566965772C5F41636869766573447261664164642C417263686976657344726166744D616E6167652C5F4172636869766573447261666D51756572792C5F4172636869766573447261666D456469742C5F4172636869766573447261666D44656C2C4172636869766573497373756541756469742C5F4172636869766573497373756551756572792C5F41726368697665734973737565456469742C417263686976657349737375654C6561642C5F417263686976657349737375654C65616451756572792C5F417263686976657349737375654C656164456469742C417263686976657349737375654368617267652C5F4172636869766573497373756543686172676551756572792C5F41726368697665734973737565436861726765456469742C4172636869766573497373756550726F6F662C5F4172636869766573497373756550726F6F6651756572792C5F4172636869766573497373756550726F6F66456469742C4172636869766573446F63756D656E742C5F4172636869766573446F63756D656E7451756572792C417263686976657349737375654D6F6E69746F722C5F417263686976657349737375654D6F6E69746F7251756572792C5F4172636869766573497373756548617374656E2C417263686976657349737375654D616E6167652C5F417263686976657349737375654D616E61676551756572792C417263686976657349737375655365617263682C5F4172636869766573497373756553656172636851756572792C446F63486973746F7279566965772C5F446F63486973746F727951756572792C5F446F63486973746F727944656C2C41726368697665526563656976652C41726368697665735369676E566965772C5F41726368697665735369676E51756572792C5F41726368697665735369676E55702C4172636869766573526563566965772C5F417263686976657352656351756572792C5F41726368697665735265634164642C5F4172636869766573526563456469742C5F417263686976657352656344656C2C417263686976657348616E646C65566965772C5F417263686976657348616E646C6551756572792C4C656164657252656164566965772C5F4C65616465725265616451756572792C417263684469737061746368566965772C5F41726368446973706174636851756572792C41726368556E64657274616B65566965772C5F41726368556E64657274616B6551756572792C41726368697665735265634374726C566965772C5F41726368697665735265634374726C51756572792C5F417263686976657352656348617374656E2C4172636852656164566965772C5F417263685265616451756572792C4172636852656354797065566965772C5F417263685265635479706551756572792C5F41726368526563547970654164642C5F4172636852656354797065456469742C5F417263685265635479706544656C2C53797374656D53657474696E672C41707055736572566965772C5F4170705573657251756572792C5F417070557365724164642C5F41707055736572456469742C5F4170705573657244656C2C417070526F6C65566965772C5F417070526F6C654C6973742C5F417070526F6C654164642C5F417070526F6C65456469742C5F417070526F6C6544656C2C5F417070526F6C654772616E742C4465706172746D656E74566965772C5F4465706172746D656E7451756572792C5F4465706172746D656E744164642C5F4465706172746D656E74456469742C5F4465706172746D656E7444656C2C46696C65417474616368566965772C5F46696C6541747461636851756572792C5F46696C65417474616368456469742C5F46696C6541747461636844656C2C436F6D70616E79566965772C5F436F6D70616E79456469742C466C6F774D616E61676572566965772C5F466C6F7751756572792C5F50726F547970654D616E6167652C5F466C6F774164642C5F466C6F77456469742C5F466C6F7744656C2C5F466C6F77436865636B2C5F466C6F7753657474696E672C5075626C6963446F63756D656E742C4E65775075626C6963446F63756D656E74466F726D2C446F63466F6C646572536861726564566965772C5F446F63466F6C6465725368617265644D616E6167652C5F446F6350726976696C65676551756572792C5F446F6350726976696C6567654164642C5F446F6350726976696C656765456469742C5F446F6350726976696C65676544656C2C5461736B2C506C616E54797065566965772C5F506C616E5479706551756572792C5F506C616E547970654164642C5F506C616E54797065456469742C5F506C616E5479706544656C2C4E6577576F726B506C616E466F726D2C5F4E6577446570506C616E2C44696374696F6E617279566965772C5F44696374696F6E61727951756572792C5F44696374696F6E6172794164642C5F44696374696F6E617279456469742C5F44696374696F6E61727944656C2C496E666F2C4E657773566965772C5F4E65777351756572792C5F4E6577734164642C5F4E657773456469742C5F4E65777344656C2C4E657773436F6D6D656E74566965772C5F4E657773436F6D6D656E7451756572792C5F4E657773436F6D6D656E7444656C2C4E65777354797065566965772C5F4E6577735479706551756572792C5F4E657773547970654164642C5F4E65777354797065456469742C5F4E6577735479706544656C2C4E6F74696365566965772C5F4E6F7469636551756572792C5F4E6F746963654164642C5F4E6F74696365456469742C5F4E6F7469636544656C2C506572736F6E616C2C506572736F6E616C447574792C5369676E496E4F6666566965772C457272616E64735265676973746572566965772C457272616E647352656769737465724F7574566965772C447574794D616E616765722C447574792C486F6C696461795265636F7264566965772C5F486F6C696461795265636F726451756572792C5F486F6C696461795265636F72644164642C5F486F6C696461795265636F7264456469742C5F486F6C696461795265636F726444656C2C4475747953656374696F6E566965772C5F44757479536563746F6E51756572792C5F44757479536563746F6E4164642C5F44757479536563746F6E456469742C5F44757479536563746F6E44656C2C4475747953797374656D566965772C5F4475747953797374656D51756572792C5F4475747953797374656D4164642C5F4475747953797374656D456469742C5F4475747953797374656D44656C2C44757479566965772C5F4475747951756572792C5F447574794164642C5F44757479456469742C5F4475747944656C2C447574795265676973746572566965772C5F44757479526567697374657251756572792C5F4475747952656769737465724164642C5F44757479526567697374657244656C2C637573746F6D65722C437573746F6D6572566965772C5F437573746F6D657251756572792C5F437573746F6D65724164642C5F437573746F6D6572456469742C5F437573746F6D657244656C2C5F437573746F6D657253656E644D61696C2C4375734C696E6B6D616E566965772C5F4375734C696E6B6D616E51756572792C5F4375734C696E6B6D616E4164642C5F4375734C696E6B6D616E456469742C5F4375734C696E6B6D616E44656C2C437573436F6E6E656374696F6E566965772C5F437573436F6E6E656374696F6E51756572792C5F437573436F6E6E656374696F6E4164642C5F437573436F6E6E656374696F6E456469742C5F437573436F6E6E656374696F6E44656C2C50726F6A656374566965772C5F50726F6A65637451756572792C5F50726F6A6563744164642C5F50726F6A656374456469742C5F50726F6A65637444656C2C436F6E7472616374566965772C5F436F6E747261637451756572792C5F436F6E74726163744164642C5F436F6E7472616374456469742C5F436F6E747261637444656C2C50726F64756374566965772C5F50726F6475637451756572792C5F50726F647563744164642C5F50726F64756374456469742C5F50726F6475637444656C2C50726F7669646572566965772C5F50726F766964657251756572792C5F50726F76696465724164642C5F50726F7669646572456469742C5F50726F766964657244656C2C41646D696E6973747261746F722C476F6F644D616E656765722C4F6666696365476F6F64734D616E616765566965772C5F4F6666696365476F6F647351756572792C5F4F6666696365476F6F6473547970654D616E6167652C5F4F6666696365476F6F64734164642C5F4F6666696365476F6F6473456469742C5F4F6666696365476F6F647344656C2C496E53746F636B566965772C5F496E53746F636B51756572792C5F496E53746F636B4164642C5F496E53746F636B456469742C5F496E53746F636B44656C2C476F6F64734170706C79566965772C5F476F6F64734170706C7951756572792C5F476F6F64734170706C794164642C5F476F6F64734170706C79456469742C5F476F6F64734170706C7944656C2C4361724D616E656765722C436172566965772C5F43617251756572792C5F4361724164642C5F436172456469742C5F43617244656C2C43617274526570616972566965772C5F43617252657061697251756572792C5F4361725265706169724164642C5F436172526570616972456469742C5F43617252657061697244656C2C4361724170706C79566965772C5F4361724170706C7951756572792C5F4361724170706C794164642C5F4361724170706C79456469742C5F4361724170706C7944656C2C46697865644173736574734D616E6167652C446570726554797065566965772C5F44657072655479706551756572792C5F4465707265547970654164642C5F446570726554797065456469742C5F44657072655479706544656C2C46697865644173736574734D616E616765566965772C5F466978656441737365747351756572792C5F417373657473547970654D616E6167652C5F46697865644173736574734164642C5F4669786564417373657473456469742C5F466978656441737365747344656C2C5F446570726563696174652C44657072655265636F7264566965772C5F44657072655265636F726451756572792C426F6F6B4D616E616765722C426F6F6B54797065566965772C5F426F6F6B5479706551756572792C5F426F6F6B547970654164642C5F426F6F6B54797065456469742C5F426F6F6B5479706544656C2C426F6F6B4D616E616765566965772C5F426F6F6B51756572792C5F426F6F6B4164642C5F426F6F6B456469742C5F426F6F6B44656C2C426F6F6B426F72726F77566965772C5F426F6F6B426F72726F7751756572792C5F426F6F6B426F72726F774164642C5F426F6F6B426F72726F77456469742C5F426F6F6B52657475726E2C5F426F6F6B426F72726F7744656C2C426F6F6B52657475726E566965772C5F426F6F6B52657475726E51756572792C5F426F6F6B52657475726E4164642C5F426F6F6B52657475726E456469742C5F426F6F6B52657475726E44656C2C48726D2C48726D4D616E6167652C4A6F62566965772C5F4A6F6251756572792C5F4A6F624164642C5F4A6F62456469742C5F4A6F6244656C2C5F4A6F625265632C456D7050726F66696C65466F726D2C5F456D7050726F66696C655265672C456D7050726F66696C65566965772C5F456D7050726F66696C6551756572792C5F456D7050726F66696C654164642C5F456D7050726F66696C65456469742C5F456D7050726F66696C6544656C2C5F456D7050726F66696C65436865636B2C5F456D7050726F66696C655265632C53616C6172794D616E6167652C53616C6172794974656D566965772C5F53616C6172794974656D51756572792C5F53616C6172794974656D4164642C5F53616C6172794974656D456469742C5F53616C6172794974656D44656C2C5374616E6453616C617279466F726D2C5F5374616E6453616C6172795265672C5374616E6453616C617279566965772C5F5374616E6453616C61727951756572792C5F5374616E6453616C6172794164642C5F5374616E6453616C617279456469742C5F5374616E6453616C61727944656C2C5F5374616E6453616C617279436865636B2C53616C6172795061796F6666466F726D2C5F53616C6172795061796F66665265672C53616C6172795061796F6666566965772C5F53616C6172795061796F666651756572792C5F53616C6172795061796F66664164642C5F53616C6172795061796F6666456469742C5F53616C6172795061796F666644656C2C5F53616C6172795061796F6666436865636B2C4A6F624368616E67652C4A6F624368616E6765466F726D2C5F4A6F624368616E67655265672C4A6F624368616E6765566965772C5F4A6F624368616E676551756572792C5F4A6F624368616E67654164642C5F4A6F624368616E6765456469742C5F4A6F624368616E676544656C2C5F4A6F624368616E6765436865636B2C486972654973737565566965772C5F48697265497373756551756572792C5F4869726549737375654164642C5F486972654973737565456469742C5F48697265497373756544656C2C5F486972654973737565436865636B2C526573756D65566965772C5F526573756D6551756572792C5F526573756D654164642C5F526573756D65456469742C5F526573756D6544656C74000CE4B880E888ACE794A8E688B771007E003674000CE4B880E888ACE794A8E688B77371007E0012000171007E00347371007E003371007E000C707371007E002AFFFFFFFF00007371007E0018FFFFFFFFFFFFFFFF71007E003F71007E003770707371007E002AFFFFFFFF000071007E004171007E003F71007E003970707371007E001200007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E004174000FE8B685E7BAA7E7AEA1E79086E591987371007E0012000171007E003F787371007E0027770C000000103F4000000000000271007E003471007E003F787371007E001200017371007E0012000171007E002F7400066C69756C6975740000, null, null);
INSERT INTO `jbpm4_lob` VALUES ('168', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074001163686F75706968616F403136332E636F6D7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('172', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074001163686F75706968616F403136332E636F6D7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('173', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657228ACFDE82AD5D2380200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074001163686F75706968616F403136332E636F6D7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);
INSERT INTO `jbpm4_lob` VALUES ('174', '0', 0xACED000573720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365724390B5A70186AB150200144C000D616363657373696F6E54696D657400104C6A6176612F7574696C2F446174653B4C0007616464726573737400124C6A6176612F6C616E672F537472696E673B4C000764656C466C61677400114C6A6176612F6C616E672F53686F72743B4C000A6465706172746D656E747400274C636F6D2F7870736F66742F6F612F6D6F64656C2F73797374656D2F4465706172746D656E743B4C0009656475636174696F6E71007E00024C0005656D61696C71007E00024C000366617871007E00024C000866756C6C6E616D6571007E00024C00066D6F62696C6571007E00024C000870617373776F726471007E00024C000570686F6E6571007E00024C000570686F746F71007E00024C0008706F736974696F6E71007E00024C000672696768747374000F4C6A6176612F7574696C2F5365743B4C0005726F6C657371007E00054C000673746174757371007E00034C00057469746C6571007E00034C00067573657249647400104C6A6176612F6C616E672F4C6F6E673B4C0008757365726E616D6571007E00024C00037A697071007E00027872001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656CE28ABC6276FC1B300200024C00066C6F676765727400204C6F72672F6170616368652F636F6D6D6F6E732F6C6F6767696E672F4C6F673B4C000776657273696F6E7400134C6A6176612F6C616E672F496E74656765723B78707372002B6F72672E6170616368652E636F6D6D6F6E732E6C6F6767696E672E696D706C2E4C6F67344A4C6F6767657200000000000000010200014C00046E616D6571007E0002787074001F636F6D2E7870736F66742E636F72652E6D6F64656C2E426173654D6F64656C70737200126A6176612E73716C2E54696D657374616D702618D5C80153BF650200014900056E616E6F737872000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001259D5DFC007800000000707372000F6A6176612E6C616E672E53686F7274684D37133460DA5202000153000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000073720025636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E4465706172746D656E74A8DB6D3F366D66AC0200064C00076465704465736371007E00024C0005646570496471007E00064C00086465704C6576656C71007E00094C00076465704E616D6571007E00024C0008706172656E74496471007E00064C00047061746871007E00027871007E000771007E000C7074000FE680BBE8A381E58A9EE585ACE5AEA47372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C75657871007E00120000000000000001737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E00120000000274000FE680BBE8A381E58A9EE585ACE5AEA47371007E00170000000000000000740004302E312E7074001163686F75706968616F403136332E636F6D7074000FE8B685E7BAA7E7AEA1E79086E591987074002C61346179632F38302F4F47646134424F2F316F2F56306574704F71694C78314A77423553336265485730733D707070737200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F400000000000017400055F5F414C4C78737200266F72672E68696265726E6174652E636F6C6C656374696F6E2E50657273697374656E745365743770507425ED70B00200014C000373657471007E0005787200356F72672E68696265726E6174652E636F6C6C656374696F6E2E416273747261637450657273697374656E74436F6C6C656374696F6EB09154394BE626B302000749000A63616368656453697A655A000564697274795A000B696E697469616C697A65644C00036B65797400164C6A6176612F696F2F53657269616C697A61626C653B4C00056F776E65727400124C6A6176612F6C616E672F4F626A6563743B4C0004726F6C6571007E00024C000E73746F726564536E617073686F7471007E00267870FFFFFFFF00017371007E0017000000000000000171007E000A740028636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070557365722E726F6C6573737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000017708000000020000000173720022636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C65212634B47083A23F0200084C0008617070557365727371007E00054C000966756E6374696F6E7371007E00054C000B697344656661756C74496E71007E00034C000672696768747371007E00024C0008726F6C654465736371007E00024C0006726F6C65496471007E00064C0008726F6C654E616D6571007E00024C000673746174757371007E00037871007E000771007E000C707371007E0024FFFFFFFF00007371007E0017FFFFFFFFFFFFFFFF71007E002E74002B636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E617070557365727370707371007E0024FFFFFFFF000071007E003071007E002E74002C636F6D2E7870736F66742E6F612E6D6F64656C2E73797374656D2E417070526F6C652E66756E6374696F6E7370707371007E001100007400055F5F414C4C740022E8B685E7BAA7E7AEA1E79086E591982CE585B7E69C89E68980E69C89E69D83E9999071007E003074000FE8B685E7BAA7E7AEA1E79086E591987371007E0011000171007E002E787371007E0021770C000000103F4000000000000171007E002E787371007E001100017371007E0011000171007E002974000561646D696E70, null, null);

-- ----------------------------
-- Table structure for `jbpm4_participation`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_participation`;
CREATE TABLE `jbpm4_participation` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `DBVERSION_` int(11) NOT NULL,
  `GROUPID_` varchar(255) DEFAULT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_PART_TASK` (`TASK_`) USING BTREE,
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`) USING BTREE,
  KEY `FK_PART_TASK` (`TASK_`) USING BTREE,
  CONSTRAINT `jbpm4_participation_ibfk_1` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`),
  CONSTRAINT `jbpm4_participation_ibfk_2` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_participation
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_swimlane`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_swimlane`;
CREATE TABLE `jbpm4_swimlane` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_SWIMLANE_EXEC` (`EXECUTION_`) USING BTREE,
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`) USING BTREE,
  CONSTRAINT `jbpm4_swimlane_ibfk_1` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_swimlane
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_task`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_task`;
CREATE TABLE `jbpm4_task` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` char(1) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCR_` longtext,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `FORM_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROGRESS_` int(11) DEFAULT NULL,
  `SIGNALLING_` bit(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKDEFNAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_TASK_SUPERTASK` (`SUPERTASK_`) USING BTREE,
  KEY `FK_TASK_SWIML` (`SWIMLANE_`) USING BTREE,
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`) USING BTREE,
  CONSTRAINT `jbpm4_task_ibfk_1` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_task` (`DBID_`),
  CONSTRAINT `jbpm4_task_ibfk_2` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_task
-- ----------------------------

-- ----------------------------
-- Table structure for `jbpm4_variable`
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_variable`;
CREATE TABLE `jbpm4_variable` (
  `DBID_` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CONVERTER_` varchar(255) DEFAULT NULL,
  `HIST_` bit(1) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `DATE_VALUE_` datetime DEFAULT NULL,
  `DOUBLE_VALUE_` double DEFAULT NULL,
  `LONG_VALUE_` bigint(20) DEFAULT NULL,
  `STRING_VALUE_` varchar(255) DEFAULT NULL,
  `TEXT_VALUE_` longtext,
  `LOB_` bigint(20) DEFAULT NULL,
  `EXESYS_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `IDX_VAR_EXESYS` (`EXESYS_`) USING BTREE,
  KEY `IDX_VAR_TASK` (`TASK_`) USING BTREE,
  KEY `IDX_VAR_EXECUTION` (`EXECUTION_`) USING BTREE,
  KEY `IDX_VAR_LOB` (`LOB_`) USING BTREE,
  KEY `FK_VAR_LOB` (`LOB_`) USING BTREE,
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`) USING BTREE,
  KEY `FK_VAR_EXESYS` (`EXESYS_`) USING BTREE,
  KEY `FK_VAR_TASK` (`TASK_`) USING BTREE,
  CONSTRAINT `jbpm4_variable_ibfk_1` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `jbpm4_variable_ibfk_2` FOREIGN KEY (`EXESYS_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `jbpm4_variable_ibfk_3` FOREIGN KEY (`LOB_`) REFERENCES `jbpm4_lob` (`DBID_`),
  CONSTRAINT `jbpm4_variable_ibfk_4` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_variable
-- ----------------------------

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `jobId` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobName` varchar(128) NOT NULL COMMENT '职位名称',
  `depId` bigint(20) NOT NULL COMMENT '所属部门',
  `memo` varchar(512) DEFAULT NULL COMMENT '备注',
  `delFlag` smallint(6) NOT NULL DEFAULT '0' COMMENT '0=未删除\r\n            1=删除',
  `band` bigint(20) DEFAULT NULL COMMENT 'band',
  `seq` bigint(20) DEFAULT NULL COMMENT '序列',
  `race` bigint(20) DEFAULT NULL COMMENT '族群',
  PRIMARY KEY (`jobId`),
  KEY `FK_JB_R_DPT` (`depId`) USING BTREE,
  CONSTRAINT `job_ibfk_1` FOREIGN KEY (`depId`) REFERENCES `department` (`depId`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', '总裁', '50', null, '0', '38', '22', '21');
INSERT INTO `job` VALUES ('2', '高级副总裁', '50', null, '0', '38', '22', '21');
INSERT INTO `job` VALUES ('3', '副总裁', '50', null, '0', '37', '22', '21');
INSERT INTO `job` VALUES ('4', '总裁助理', '50', null, '0', '37', '22', '21');
INSERT INTO `job` VALUES ('5', 'CIO', '50', null, '0', '37', '22', '21');
INSERT INTO `job` VALUES ('6', '商品经营中心总经理', '27', null, '0', '37', '22', '21');
INSERT INTO `job` VALUES ('7', '数据支持小组组长', '59', null, '0', '33', '68', '45');
INSERT INTO `job` VALUES ('8', '数据支持小组助理', '59', null, '0', '31', '68', '45');
INSERT INTO `job` VALUES ('9', '总监', '42', null, '0', '36', '22', '21');
INSERT INTO `job` VALUES ('10', '高级营销策划经理', '42', null, '0', '35', '22', '27');
INSERT INTO `job` VALUES ('11', '高级营销策划师', '42', null, '0', '34', '49', '27');
INSERT INTO `job` VALUES ('12', '营销策划师', '42', null, '0', '33', '49', '27');
INSERT INTO `job` VALUES ('13', '设计主管', '42', null, '0', '33', '22', '27');
INSERT INTO `job` VALUES ('14', '设计专员', '42', null, '0', '32', '49', '27');
INSERT INTO `job` VALUES ('15', '媒介经理', '42', null, '0', '34', '22', '27');
INSERT INTO `job` VALUES ('16', '媒介专员', '42', null, '0', '32', '49', '27');
INSERT INTO `job` VALUES ('17', '媒介助理', '42', null, '0', '31', '49', '27');
INSERT INTO `job` VALUES ('18', '总监', '57', null, '0', '36', '22', '21');
INSERT INTO `job` VALUES ('19', '商品组织经理', '57', null, '0', '34', '55', '40');
INSERT INTO `job` VALUES ('20', '商品组织主管', '57', null, '0', '33', '55', '40');
INSERT INTO `job` VALUES ('21', '商品组织专员', '57', null, '0', '32', '55', '40');
INSERT INTO `job` VALUES ('22', '商品组织助理', '57', null, '0', '31', '55', '40');
INSERT INTO `job` VALUES ('23', '租赁经理', '57', null, '0', '34', '55', '40');
INSERT INTO `job` VALUES ('24', '高级租赁业务专员', '57', null, '0', '32', '55', '40');
INSERT INTO `job` VALUES ('25', '总监', '58', null, '0', '36', '22', '21');
INSERT INTO `job` VALUES ('26', '商品组织经理', '58', null, '0', '34', '55', '40');
INSERT INTO `job` VALUES ('27', '商品组织主管', '58', null, '0', '33', '55', '40');
INSERT INTO `job` VALUES ('28', '商品组织专员', '58', null, '0', '32', '55', '40');
INSERT INTO `job` VALUES ('29', '商品组织助理', '58', null, '0', '31', '55', '40');
INSERT INTO `job` VALUES ('30', '采购部经理', '58', null, '0', '34', '56', '40');
INSERT INTO `job` VALUES ('31', '采购经理', '58', null, '0', '34', '56', '40');
INSERT INTO `job` VALUES ('32', '高级商品专员', '58', null, '0', '33', '56', '40');
INSERT INTO `job` VALUES ('33', '商品专员', '58', null, '0', '32', '56', '40');
INSERT INTO `job` VALUES ('34', '商品助理', '58', null, '0', '31', '56', '40');
INSERT INTO `job` VALUES ('35', '总监', '43', null, '0', '36', '22', '21');
INSERT INTO `job` VALUES ('36', '高级商品规划师', '43', null, '0', '34', '53', '28');
INSERT INTO `job` VALUES ('37', '商品规划师', '43', null, '0', '33', '53', '28');
INSERT INTO `job` VALUES ('38', '商品规划专员', '43', null, '0', '32', '53', '28');
INSERT INTO `job` VALUES ('39', '总经理（第一负责人）', '28', null, '0', '37', '22', '21');
INSERT INTO `job` VALUES ('40', '数据分析员', '64', null, '0', '31', '68', '45');
INSERT INTO `job` VALUES ('41', '高级网页设计师', '64', null, '0', '33', '63', '42');
INSERT INTO `job` VALUES ('42', '网页设计师', '64', null, '0', '32', '63', '42');
INSERT INTO `job` VALUES ('43', '美工', '64', null, '0', '31', '63', '42');
INSERT INTO `job` VALUES ('44', '总监', '47', null, '0', '36', '62', '42');
INSERT INTO `job` VALUES ('45', '高级经理（第一负责人）', '47', null, '0', '35', '62', '42');
INSERT INTO `job` VALUES ('46', '商品规划运营经理', '47', null, '0', '34', '62', '42');
INSERT INTO `job` VALUES ('47', '商品规划运营主管', '47', null, '0', '33', '62', '42');
INSERT INTO `job` VALUES ('48', '商品规划运营专员', '47', null, '0', '32', '62', '42');
INSERT INTO `job` VALUES ('49', '商品组织经理', '47', null, '0', '34', '55', '40');
INSERT INTO `job` VALUES ('50', '商品组织专员', '47', null, '0', '32', '55', '40');
INSERT INTO `job` VALUES ('51', '商品总规划师', '47', null, '0', '34', '53', '28');
INSERT INTO `job` VALUES ('52', '拍照部经理', '61', null, '0', '34', '62', '42');
INSERT INTO `job` VALUES ('53', '摄影编辑主管', '61', null, '0', '31', '62', '42');
INSERT INTO `job` VALUES ('54', '摄影编辑', '61', null, '0', '30', '62', '42');
INSERT INTO `job` VALUES ('55', '文字编辑', '61', null, '0', '31', '62', '42');
INSERT INTO `job` VALUES ('56', '高级经理（第一负责人）', '63', null, '0', '35', null, '42');
INSERT INTO `job` VALUES ('57', '店铺营销主管', '63', null, '0', '32', '22', '27');
INSERT INTO `job` VALUES ('58', '网店店长', '63', null, '0', '33', null, '42');
INSERT INTO `job` VALUES ('59', '平台推广专员', '63', null, '0', '31', '49', '27');
INSERT INTO `job` VALUES ('60', '商品经营专员', '63', null, '0', '31', '62', '42');
INSERT INTO `job` VALUES ('61', '店铺运营维护小二', '63', null, '0', '31', '66', '44');
INSERT INTO `job` VALUES ('62', '在线销售及初级客服代表', '63', null, '0', '30', '66', '44');
INSERT INTO `job` VALUES ('63', '在线销售及客服助理', '63', null, '0', '26', '66', '44');
INSERT INTO `job` VALUES ('64', '总监', '62', null, '0', '36', '22', '21');
INSERT INTO `job` VALUES ('65', '市场营销经理', '62', null, '0', '34', '22', '27');
INSERT INTO `job` VALUES ('66', '市场营销策划助理', '62', null, '0', '31', '49', '27');
INSERT INTO `job` VALUES ('67', 'BD拓展兼会员发展主管', '62', null, '0', '33', '22', '27');
INSERT INTO `job` VALUES ('68', '会员拓展主管', '62', null, '0', '33', '22', '27');
INSERT INTO `job` VALUES ('69', 'BD拓展主管', '62', null, '0', '33', '49', '27');
INSERT INTO `job` VALUES ('70', 'BD拓展兼媒介专员', '62', null, '0', '32', '49', '27');
INSERT INTO `job` VALUES ('71', '口碑营销及文案策划主管', '62', null, '0', '33', '22', '27');
INSERT INTO `job` VALUES ('72', '口碑营销助理', '62', null, '0', '31', '49', '27');
INSERT INTO `job` VALUES ('73', '联盟拓展主管', '62', null, '0', '33', '22', '27');
INSERT INTO `job` VALUES ('74', '联盟拓展专员', '62', null, '0', '32', '49', '27');
INSERT INTO `job` VALUES ('75', '搜索优化师', '62', null, '0', '33', '49', '27');
INSERT INTO `job` VALUES ('76', '搜索优化专员', '62', null, '0', '32', '49', '27');
INSERT INTO `job` VALUES ('77', '高级经理（第一负责人）', '48', null, '0', '35', '22', '43');
INSERT INTO `job` VALUES ('78', '经理（第一负责人）', '48', null, '0', '34', '22', '43');
INSERT INTO `job` VALUES ('79', '高级生产线主管', '48', null, '0', '32', '22', '43');
INSERT INTO `job` VALUES ('80', '生产线主管', '48', null, '0', '31', '22', '43');
INSERT INTO `job` VALUES ('81', '生产线领班', '48', null, '0', '30', '64', '43');
INSERT INTO `job` VALUES ('82', '生产线操作员', '48', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('83', '高级仓储现场管理主管', '48', null, '0', '32', '22', '43');
INSERT INTO `job` VALUES ('84', '仓储现场管理主管', '48', null, '0', '31', '22', '43');
INSERT INTO `job` VALUES ('85', '仓储现场管理助理', '48', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('86', '自采商品库房主管', '48', null, '0', '31', '22', '43');
INSERT INTO `job` VALUES ('87', '自采商品库房领班', '48', null, '0', '30', '64', '43');
INSERT INTO `job` VALUES ('88', '自采商品库房助理', '48', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('89', '退货主管', '48', null, '0', '31', '22', '43');
INSERT INTO `job` VALUES ('90', '退货专员', '48', null, '0', '26', '65', '43');
INSERT INTO `job` VALUES ('91', '驻店物流主管', '48', null, '0', '31', '22', '43');
INSERT INTO `job` VALUES ('92', '驻店配送员', '48', null, '0', '26', '65', '43');
INSERT INTO `job` VALUES ('93', '物流服务商管理主管', '48', null, '0', '31', '22', '43');
INSERT INTO `job` VALUES ('94', '物流服务商管理专员', '48', null, '0', '26', '65', '43');
INSERT INTO `job` VALUES ('95', '物流信息主管', '48', null, '0', '31', '22', '43');
INSERT INTO `job` VALUES ('96', '物流信息专员', '48', null, '0', '26', '65', '43');
INSERT INTO `job` VALUES ('97', '客服经理', '49', null, '0', '34', '22', '44');
INSERT INTO `job` VALUES ('98', '客服主管', '49', null, '0', '32', '22', '44');
INSERT INTO `job` VALUES ('99', '客服助理', '49', null, '0', '26', '66', '44');
INSERT INTO `job` VALUES ('100', '客服组长', '49', null, '0', '31', '66', '44');
INSERT INTO `job` VALUES ('101', '初级客服代表-电话专员', '49', null, '0', '30', '66', '44');
INSERT INTO `job` VALUES ('102', '初级客服代表-邮件留言专员', '49', null, '0', '30', '66', '44');
INSERT INTO `job` VALUES ('103', '初级客服代表-款项专员', '49', null, '0', '30', '66', '44');
INSERT INTO `job` VALUES ('104', '初级客服代表-投诉专员', '49', null, '0', '30', '66', '44');
INSERT INTO `job` VALUES ('105', '初级客服代表-物流专员', '49', null, '0', '30', '66', '44');
INSERT INTO `job` VALUES ('106', '初级客服代表-催款专员', '49', null, '0', '30', '66', '44');
INSERT INTO `job` VALUES ('107', '门店运营中心总经理', '2', null, '0', '37', '22', '21');
INSERT INTO `job` VALUES ('108', '运营总监', '37', null, '0', '36', '22', '21');
INSERT INTO `job` VALUES ('109', '高级运营经理', '37', null, '0', '35', '22', '41');
INSERT INTO `job` VALUES ('110', '运营专员', '37', null, '0', '32', '61', '41');
INSERT INTO `job` VALUES ('111', '高级品价经理', '37', null, '0', '35', '59', '41');
INSERT INTO `job` VALUES ('112', '品价专员', '37', null, '0', '33', '59', '41');
INSERT INTO `job` VALUES ('113', '客服经理', '37', null, '0', '34', '22', '44');
INSERT INTO `job` VALUES ('114', '客服专员', '37', null, '0', '32', '66', '44');
INSERT INTO `job` VALUES ('115', '标准化训练经理', '37', null, '0', '34', '70', '45');
INSERT INTO `job` VALUES ('116', '标准化训练专员', '37', null, '0', '32', '70', '45');
INSERT INTO `job` VALUES ('117', '高级文员', '37', null, '0', '32', '68', '45');
INSERT INTO `job` VALUES ('118', '初级文员', '37', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('119', '高级防损经理', '38', null, '0', '35', '60', '41');
INSERT INTO `job` VALUES ('120', '防损专员', '38', null, '0', '32', '60', '41');
INSERT INTO `job` VALUES ('121', '工程经理', '39', null, '0', '34', '71', '45');
INSERT INTO `job` VALUES ('122', '电气工程师', '39', null, '0', '33', '71', '45');
INSERT INTO `job` VALUES ('123', '土木工程师', '39', null, '0', '33', '71', '45');
INSERT INTO `job` VALUES ('124', '暖通工程师', '39', null, '0', '33', '71', '45');
INSERT INTO `job` VALUES ('125', '门店工程人员', '39', null, '0', '26', '60', '41');
INSERT INTO `job` VALUES ('126', '高级店长', '29', null, '0', '35', '61', '41');
INSERT INTO `job` VALUES ('127', '店长', '29', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('128', '店长助理', '29', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('129', '高级卖场主管', '29', null, '0', '32', '61', '41');
INSERT INTO `job` VALUES ('130', '卖场主管', '29', null, '0', '31', '61', '41');
INSERT INTO `job` VALUES ('131', '客服主管', '29', null, '0', '31', '22', '44');
INSERT INTO `job` VALUES ('132', '收银领班', '29', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('133', '中级收银员', '29', null, '0', '26', '75', '46');
INSERT INTO `job` VALUES ('134', '初级收银员', '29', null, '0', '25', '75', '46');
INSERT INTO `job` VALUES ('135', '客服文员', '29', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('136', '美工', '29', null, '0', '26', '61', '41');
INSERT INTO `job` VALUES ('137', '中级库管', '29', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('138', '初级库管', '29', null, '0', '25', '64', '43');
INSERT INTO `job` VALUES ('139', '防损主管', '29', null, '0', '31', '60', '41');
INSERT INTO `job` VALUES ('140', '防损领班', '29', null, '0', '30', '60', '41');
INSERT INTO `job` VALUES ('141', '安保员', '29', null, '0', '25', '60', '41');
INSERT INTO `job` VALUES ('142', '高级店长', '32', null, '0', '35', '61', '41');
INSERT INTO `job` VALUES ('143', '店长', '32', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('144', '店长助理', '32', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('145', '高级卖场主管', '32', null, '0', '32', '61', '41');
INSERT INTO `job` VALUES ('146', '卖场主管', '32', null, '0', '31', '61', '41');
INSERT INTO `job` VALUES ('147', '客服主管', '32', null, '0', '31', '22', '44');
INSERT INTO `job` VALUES ('148', '收银领班', '32', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('149', '中级收银员', '32', null, '0', '26', '75', '46');
INSERT INTO `job` VALUES ('150', '初级收银员', '32', null, '0', '25', '75', '46');
INSERT INTO `job` VALUES ('151', '客服文员', '32', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('152', '美工', '32', null, '0', '26', '61', '41');
INSERT INTO `job` VALUES ('153', '中级库管', '32', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('154', '初级库管', '32', null, '0', '25', '64', '43');
INSERT INTO `job` VALUES ('155', '防损主管', '32', null, '0', '31', '60', '41');
INSERT INTO `job` VALUES ('156', '防损领班', '32', null, '0', '30', '60', '41');
INSERT INTO `job` VALUES ('157', '安保员', '32', null, '0', '25', '60', '41');
INSERT INTO `job` VALUES ('158', '高级店长', '33', null, '0', '35', '61', '41');
INSERT INTO `job` VALUES ('159', '店长', '33', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('160', '店长助理', '33', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('161', '高级卖场主管', '33', null, '0', '32', '61', '41');
INSERT INTO `job` VALUES ('162', '卖场主管', '33', null, '0', '31', '61', '41');
INSERT INTO `job` VALUES ('163', '客服主管', '33', null, '0', '31', '22', '44');
INSERT INTO `job` VALUES ('164', '收银领班', '33', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('165', '中级收银员', '33', null, '0', '26', '75', '46');
INSERT INTO `job` VALUES ('166', '初级收银员', '33', null, '0', '25', '75', '46');
INSERT INTO `job` VALUES ('167', '客服文员', '33', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('168', '美工', '33', null, '0', '26', '61', '41');
INSERT INTO `job` VALUES ('169', '中级库管', '33', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('170', '初级库管', '33', null, '0', '25', '64', '43');
INSERT INTO `job` VALUES ('171', '防损主管', '33', null, '0', '31', '60', '41');
INSERT INTO `job` VALUES ('172', '防损领班', '33', null, '0', '30', '60', '41');
INSERT INTO `job` VALUES ('173', '安保员', '33', null, '0', '25', '60', '41');
INSERT INTO `job` VALUES ('174', '高级店长', '35', null, '0', '35', '61', '41');
INSERT INTO `job` VALUES ('175', '店长', '35', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('176', '店长助理', '35', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('177', '高级卖场主管', '35', null, '0', '32', '61', '41');
INSERT INTO `job` VALUES ('178', '卖场主管', '35', null, '0', '31', '61', '41');
INSERT INTO `job` VALUES ('179', '客服主管', '35', null, '0', '31', '22', '44');
INSERT INTO `job` VALUES ('180', '收银领班', '35', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('181', '中级收银员', '35', null, '0', '26', '75', '46');
INSERT INTO `job` VALUES ('182', '初级收银员', '35', null, '0', '25', '75', '46');
INSERT INTO `job` VALUES ('183', '客服文员', '35', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('184', '美工', '35', null, '0', '26', '61', '41');
INSERT INTO `job` VALUES ('185', '中级库管', '35', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('186', '初级库管', '35', null, '0', '25', '64', '43');
INSERT INTO `job` VALUES ('187', '防损主管', '35', null, '0', '31', '60', '41');
INSERT INTO `job` VALUES ('188', '防损领班', '35', null, '0', '30', '60', '41');
INSERT INTO `job` VALUES ('189', '安保员', '35', null, '0', '25', '60', '41');
INSERT INTO `job` VALUES ('190', '高级店长', '30', null, '0', '35', '61', '41');
INSERT INTO `job` VALUES ('191', '店长', '30', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('192', '店长助理', '30', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('193', '高级卖场主管', '30', null, '0', '32', '61', '41');
INSERT INTO `job` VALUES ('194', '卖场主管', '30', null, '0', '31', '61', '41');
INSERT INTO `job` VALUES ('195', '客服主管', '30', null, '0', '31', '22', '44');
INSERT INTO `job` VALUES ('196', '收银领班', '30', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('197', '中级收银员', '30', null, '0', '26', '75', '46');
INSERT INTO `job` VALUES ('198', '初级收银员', '30', null, '0', '25', '75', '46');
INSERT INTO `job` VALUES ('199', '客服文员', '30', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('200', '美工', '30', null, '0', '26', '61', '41');
INSERT INTO `job` VALUES ('201', '中级库管', '30', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('202', '初级库管', '30', null, '0', '25', '64', '43');
INSERT INTO `job` VALUES ('203', '防损主管', '30', null, '0', '31', '60', '41');
INSERT INTO `job` VALUES ('204', '防损领班', '30', null, '0', '30', '60', '41');
INSERT INTO `job` VALUES ('205', '安保员', '30', null, '0', '25', '60', '41');
INSERT INTO `job` VALUES ('206', '高级店长', '34', null, '0', '35', '61', '41');
INSERT INTO `job` VALUES ('207', '店长', '34', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('208', '店长助理', '34', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('209', '高级卖场主管', '34', null, '0', '32', '61', '41');
INSERT INTO `job` VALUES ('210', '卖场主管', '34', null, '0', '31', '61', '41');
INSERT INTO `job` VALUES ('211', '客服主管', '34', null, '0', '31', '22', '44');
INSERT INTO `job` VALUES ('212', '收银领班', '34', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('213', '中级收银员', '34', null, '0', '26', '75', '46');
INSERT INTO `job` VALUES ('214', '初级收银员', '34', null, '0', '25', '75', '46');
INSERT INTO `job` VALUES ('215', '客服文员', '34', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('216', '美工', '34', null, '0', '26', '61', '41');
INSERT INTO `job` VALUES ('217', '中级库管', '34', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('218', '初级库管', '34', null, '0', '25', '64', '43');
INSERT INTO `job` VALUES ('219', '防损主管', '34', null, '0', '31', '60', '41');
INSERT INTO `job` VALUES ('220', '防损领班', '34', null, '0', '30', '60', '41');
INSERT INTO `job` VALUES ('221', '安保员', '34', null, '0', '25', '60', '41');
INSERT INTO `job` VALUES ('222', '高级店长', '36', null, '0', '35', '61', '41');
INSERT INTO `job` VALUES ('223', '店长', '36', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('224', '店长助理', '36', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('225', '高级卖场主管', '36', null, '0', '32', '61', '41');
INSERT INTO `job` VALUES ('226', '卖场主管', '36', null, '0', '31', '61', '41');
INSERT INTO `job` VALUES ('227', '客服主管', '36', null, '0', '31', '22', '44');
INSERT INTO `job` VALUES ('228', '收银领班', '36', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('229', '中级收银员', '36', null, '0', '26', '75', '46');
INSERT INTO `job` VALUES ('230', '初级收银员', '36', null, '0', '25', '75', '46');
INSERT INTO `job` VALUES ('231', '客服文员', '36', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('232', '美工', '36', null, '0', '26', '61', '41');
INSERT INTO `job` VALUES ('233', '中级库管', '36', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('234', '初级库管', '36', null, '0', '25', '64', '43');
INSERT INTO `job` VALUES ('235', '防损主管', '36', null, '0', '31', '60', '41');
INSERT INTO `job` VALUES ('236', '防损领班', '36', null, '0', '30', '60', '41');
INSERT INTO `job` VALUES ('237', '安保员', '36', null, '0', '25', '60', '41');
INSERT INTO `job` VALUES ('238', '高级店长', '31', null, '0', '35', '61', '41');
INSERT INTO `job` VALUES ('239', '店长', '31', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('240', '店长助理', '31', null, '0', '34', '61', '41');
INSERT INTO `job` VALUES ('241', '高级卖场主管', '31', null, '0', '32', '61', '41');
INSERT INTO `job` VALUES ('242', '卖场主管', '31', null, '0', '31', '61', '41');
INSERT INTO `job` VALUES ('243', '客服主管', '31', null, '0', '31', '22', '44');
INSERT INTO `job` VALUES ('244', '收银领班', '31', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('245', '中级收银员', '31', null, '0', '26', '75', '46');
INSERT INTO `job` VALUES ('246', '初级收银员', '31', null, '0', '25', '75', '46');
INSERT INTO `job` VALUES ('247', '客服文员', '31', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('248', '美工', '31', null, '0', '26', '61', '41');
INSERT INTO `job` VALUES ('249', '中级库管', '31', null, '0', '26', '64', '43');
INSERT INTO `job` VALUES ('250', '初级库管', '31', null, '0', '25', '64', '43');
INSERT INTO `job` VALUES ('251', '防损主管', '31', null, '0', '31', '60', '41');
INSERT INTO `job` VALUES ('252', '防损领班', '31', null, '0', '30', '60', '41');
INSERT INTO `job` VALUES ('253', '安保员', '31', null, '0', '25', '60', '41');
INSERT INTO `job` VALUES ('254', 'IT运维经理', '54', null, '0', '34', '22', '48');
INSERT INTO `job` VALUES ('255', 'IT运维主管', '54', null, '0', '33', '22', '48');
INSERT INTO `job` VALUES ('256', '高级运维工程师', '54', null, '0', '33', '81', '48');
INSERT INTO `job` VALUES ('257', '运维工程师', '54', null, '0', '31', '81', '48');
INSERT INTO `job` VALUES ('258', '高级网络工程师', '54', null, '0', '33', '81', '48');
INSERT INTO `job` VALUES ('259', '网络工程师', '54', null, '0', '33', '81', '48');
INSERT INTO `job` VALUES ('260', '高级系统工程师', '54', null, '0', '33', '81', '48');
INSERT INTO `job` VALUES ('261', '高级ERP经理', '53', null, '0', '35', '22', '48');
INSERT INTO `job` VALUES ('262', '中级ERP业务顾问', '53', null, '0', '33', '22', '48');
INSERT INTO `job` VALUES ('263', 'ERP业务顾问', '53', null, '0', '32', '22', '48');
INSERT INTO `job` VALUES ('264', '高级技术经理', '55', null, '0', '35', '22', '48');
INSERT INTO `job` VALUES ('265', '高级软件工程师', '55', null, '0', '33', '80', '48');
INSERT INTO `job` VALUES ('266', '软件工程师', '55', null, '0', '32', '80', '48');
INSERT INTO `job` VALUES ('267', '高级数据库架构师', '55', null, '0', '34', '79', '48');
INSERT INTO `job` VALUES ('268', '数据库架构师', '55', null, '0', '33', '79', '48');
INSERT INTO `job` VALUES ('269', '资深架构工程师（管理职）', '55', null, '0', '35', '79', '48');
INSERT INTO `job` VALUES ('270', '高级架构工程师', '55', null, '0', '34', '79', '48');
INSERT INTO `job` VALUES ('271', '高级PHP开发经理', '55', null, '0', '35', '22', '48');
INSERT INTO `job` VALUES ('272', '高级产品经理', '56', null, '0', '35', '22', '48');
INSERT INTO `job` VALUES ('273', '高级产品设计师', '56', null, '0', '34', '81', '48');
INSERT INTO `job` VALUES ('274', '前端开发工程师', '56', null, '0', '33', '79', '48');
INSERT INTO `job` VALUES ('275', '高级流程经理', '52', null, '0', '35', '70', '45');
INSERT INTO `job` VALUES ('276', '流程专员', '52', null, '0', '32', '70', '45');
INSERT INTO `job` VALUES ('277', '经理', '19', null, '0', '34', '68', '45');
INSERT INTO `job` VALUES ('278', '高级行政专员', '19', null, '0', '33', '68', '45');
INSERT INTO `job` VALUES ('279', '中级行政专员', '19', null, '0', '32', '68', '45');
INSERT INTO `job` VALUES ('280', '初级行政专员', '19', null, '0', '31', '68', '45');
INSERT INTO `job` VALUES ('281', '总监', '11', null, '0', '36', '22', '21');
INSERT INTO `job` VALUES ('282', '组织与发展经理', '11', null, '0', '34', '78', '47');
INSERT INTO `job` VALUES ('283', '培训助理', '11', null, '0', '31', '78', '47');
INSERT INTO `job` VALUES ('284', '招聘与员工管理经理', '11', null, '0', '34', '76', '47');
INSERT INTO `job` VALUES ('285', '高级招聘专员', '11', null, '0', '33', '76', '47');
INSERT INTO `job` VALUES ('286', '招聘助理', '11', null, '0', '31', '76', '47');
INSERT INTO `job` VALUES ('287', '薪酬绩效经理', '11', null, '0', '34', '77', '47');
INSERT INTO `job` VALUES ('288', '薪酬绩效主管', '11', null, '0', '33', '77', '47');
INSERT INTO `job` VALUES ('289', '薪酬助理', '11', null, '0', '31', '77', '47');
INSERT INTO `job` VALUES ('290', '总监', '3', null, '0', '36', '22', '21');
INSERT INTO `job` VALUES ('291', '高级财务经理', '40', null, '0', '35', '22', '46');
INSERT INTO `job` VALUES ('292', '会计主管', '40', null, '0', '33', '74', '46');
INSERT INTO `job` VALUES ('293', '核算主管', '40', null, '0', '33', '74', '46');
INSERT INTO `job` VALUES ('294', '核算专员', '40', null, '0', '33', '74', '46');
INSERT INTO `job` VALUES ('295', '结算主管', '40', null, '0', '33', '75', '46');
INSERT INTO `job` VALUES ('296', '结算专员', '40', null, '0', '31', '75', '46');
INSERT INTO `job` VALUES ('297', '结算助理', '40', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('298', '网络审核主管', '40', null, '0', '33', '74', '46');
INSERT INTO `job` VALUES ('299', '网络审核助理', '40', null, '0', '30', '74', '46');
INSERT INTO `job` VALUES ('300', '会计', '40', null, '0', '32', '74', '46');
INSERT INTO `job` VALUES ('301', '会计助理', '40', null, '0', '30', '74', '46');
INSERT INTO `job` VALUES ('302', '出纳', '40', null, '0', '30', '74', '46');
INSERT INTO `job` VALUES ('303', '网络结算专员（对账）', '40', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('304', '网络结算专员（退货1）', '40', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('305', '网络结算专员（退货2）', '40', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('306', '高级财务经理', '41', null, '0', '35', '22', '46');
INSERT INTO `job` VALUES ('307', '区域主管', '41', null, '0', '33', '75', '46');
INSERT INTO `job` VALUES ('308', '驻店财务', '41', null, '0', '31', '75', '46');
INSERT INTO `job` VALUES ('309', '驻店金库', '41', null, '0', '30', '75', '46');
INSERT INTO `job` VALUES ('310', '总监', '4', null, '0', '36', '22', '21');
INSERT INTO `job` VALUES ('311', '高级项目拓展经理', '4', null, '0', '35', '58', '40');
INSERT INTO `job` VALUES ('312', '项目拓展经理', '4', null, '0', '34', '58', '40');
INSERT INTO `job` VALUES ('313', '高级拓展专员', '4', null, '0', '33', '58', '40');
INSERT INTO `job` VALUES ('314', '总裁办主任', '1', null, '0', '35', '69', '45');
INSERT INTO `job` VALUES ('315', '行政主管', '1', null, '0', '33', '68', '45');
INSERT INTO `job` VALUES ('316', '办公室安全专员', '1', null, '0', '31', '68', '45');
INSERT INTO `job` VALUES ('317', '公共关系专员', '1', null, '0', '32', '69', '45');
INSERT INTO `job` VALUES ('318', '行政文员', '1', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('319', '前台文员', '1', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('320', '文秘-会议', '1', null, '0', '30', '68', '45');
INSERT INTO `job` VALUES ('321', '文秘-证照', '1', null, '0', '30', '68', '45');
INSERT INTO `job` VALUES ('322', '总裁司机', '1', null, '0', '30', '68', '45');
INSERT INTO `job` VALUES ('323', '司机', '1', null, '0', '26', '68', '45');
INSERT INTO `job` VALUES ('324', '保洁', '1', null, '0', '25', '68', '45');
INSERT INTO `job` VALUES ('325', '夜值', '1', null, '0', '25', '68', '45');
INSERT INTO `job` VALUES ('326', '高级经理', '10', null, '0', '35', '72', '45');
INSERT INTO `job` VALUES ('327', '合同管理主管', '10', null, '0', '33', '72', '45');
INSERT INTO `job` VALUES ('328', '合同审核助理', '10', null, '0', '31', '72', '45');
INSERT INTO `job` VALUES ('329', '商务管理主管', '10', null, '0', '33', '72', '45');
INSERT INTO `job` VALUES ('330', '商务审核助理', '10', null, '0', '31', '72', '45');
INSERT INTO `job` VALUES ('331', '法务审核主管', '10', null, '0', '33', '72', '45');
INSERT INTO `job` VALUES ('332', '法务审核助理', '10', null, '0', '31', '72', '45');
INSERT INTO `job` VALUES ('333', '法务审核专员', '10', null, '0', '32', '72', '45');
INSERT INTO `job` VALUES ('334', '总监', '51', null, '0', '36', null, null);
INSERT INTO `job` VALUES ('335', '经理', '51', null, '0', '34', null, null);

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `typeId` bigint(20) NOT NULL,
  `subjectIcon` varchar(128) DEFAULT NULL,
  `subject` varchar(128) NOT NULL COMMENT '新闻标题',
  `author` varchar(32) NOT NULL COMMENT '作者',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `replyCounts` int(11) DEFAULT NULL,
  `viewCounts` int(11) DEFAULT NULL COMMENT '浏览数',
  `issuer` varchar(32) NOT NULL,
  `content` text NOT NULL COMMENT '内容',
  `updateTime` datetime NOT NULL,
  `status` smallint(6) NOT NULL COMMENT '\r\n            0=待审核\r\n            1=审核通过',
  `isDeskImage` smallint(6) DEFAULT NULL COMMENT '是否为图片新闻',
  PRIMARY KEY (`newsId`),
  KEY `FK_NS_R_NT` (`typeId`) USING BTREE,
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `news_type` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻';

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for `news_comment`
-- ----------------------------
DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE `news_comment` (
  `commentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `newsId` bigint(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `createtime` datetime NOT NULL,
  `fullname` varchar(32) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `FK_NC_R_AU` (`userId`) USING BTREE,
  KEY `FK_NC_R_NS` (`newsId`) USING BTREE,
  CONSTRAINT `news_comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `app_user` (`userId`),
  CONSTRAINT `news_comment_ibfk_2` FOREIGN KEY (`newsId`) REFERENCES `news` (`newsId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `news_type`
-- ----------------------------
DROP TABLE IF EXISTS `news_type`;
CREATE TABLE `news_type` (
  `typeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(128) NOT NULL,
  `sn` int(11) NOT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻类型';

-- ----------------------------
-- Records of news_type
-- ----------------------------

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `noticeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `postName` varchar(128) NOT NULL,
  `noticeTitle` varchar(128) NOT NULL,
  `noticeContent` varchar(3000) DEFAULT NULL,
  `effectiveDate` date DEFAULT NULL,
  `expirationDate` date DEFAULT NULL,
  `state` smallint(6) NOT NULL,
  PRIMARY KEY (`noticeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公告';

-- ----------------------------
-- Records of notice
-- ----------------------------

-- ----------------------------
-- Table structure for `notice_news`
-- ----------------------------
DROP TABLE IF EXISTS `notice_news`;
CREATE TABLE `notice_news` (
  `newsId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `typeId` bigint(20) NOT NULL,
  `subjectIcon` varchar(128) DEFAULT NULL,
  `subject` varchar(128) NOT NULL COMMENT '新闻标题',
  `author` varchar(32) NOT NULL COMMENT '作者',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `replyCounts` int(11) DEFAULT NULL,
  `viewCounts` int(11) DEFAULT NULL COMMENT '浏览数',
  `issuer` varchar(32) NOT NULL,
  `content` text NOT NULL COMMENT '内容',
  `updateTime` datetime NOT NULL,
  `status` smallint(6) NOT NULL COMMENT '\r\n            0=待审核\r\n            1=审核通过',
  `isDeskImage` smallint(6) DEFAULT NULL COMMENT '是否为图片新闻',
  `isAll` smallint(6) DEFAULT '0' COMMENT '0非全部，1全部人员',
  `authorId` bigint(20) NOT NULL,
  `deptId` bigint(20) NOT NULL,
  PRIMARY KEY (`newsId`),
  KEY `FK_NS_R_NT` (`typeId`) USING BTREE,
  CONSTRAINT `notice_news_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `notice_news_type` (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='通知（新）';

-- ----------------------------
-- Records of notice_news
-- ----------------------------
INSERT INTO `notice_news` VALUES ('1', '1', 'info/noticeNews/201107/43d7fa4b20a94cd2b82544770e981cd2.jpg', '测试通知', '超级管理员', '2011-07-27 11:49:29', '3', '100', '超级管理员', '<p>你好啊，美女<a href=\"http:///userfiles/file/%E5%9F%BA%E4%BA%8E%E8%A7%92%E8%89%B2%E8%AE%BF%E9%97%AE%E6%8E%A7%E5%88%B6%E7%9A%84%E7%90%86%E8%AE%BA%E4%B8%8E%E5%BA%94%E7%94%A8%E7%A0%94%E7%A9%B6.pdf\">/userfiles/file/%E5%9F%BA%E4%BA%8E%E8%A7%92%E8%89%B2%E8%AE%BF%E9%97%AE%E6%8E%A7%E5%88%B6%E7%9A%84%E7%90%86%E8%AE%BA%E4%B8%8E%E5%BA%94%E7%94%A8%E7%A0%94%E7%A9%B6.pdf</a></p>', '2011-07-29 15:01:14', '1', '1', '1', '1', '1');
INSERT INTO `notice_news` VALUES ('2', '2', '', '你好啊', '超级管理员', '2011-08-01 14:05:14', '0', '2', '超级管理员', '<p>啊沙发沙发</p>', '2011-08-01 14:05:14', '1', '0', '1', '1', '1');
INSERT INTO `notice_news` VALUES ('3', '1', '', '你好', '超级管理员', '2011-08-02 13:48:36', '0', '1', '超级管理员', '', '2011-08-02 13:48:36', '1', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for `notice_news_comment`
-- ----------------------------
DROP TABLE IF EXISTS `notice_news_comment`;
CREATE TABLE `notice_news_comment` (
  `commentId` bigint(20) NOT NULL AUTO_INCREMENT,
  `newsId` bigint(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `createtime` datetime NOT NULL,
  `fullname` varchar(32) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `flag` smallint(6) NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `FK_NC_R_AU` (`userId`) USING BTREE,
  KEY `FK_NC_R_NS` (`newsId`) USING BTREE,
  CONSTRAINT `notice_news_comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `app_user` (`userId`),
  CONSTRAINT `notice_news_comment_ibfk_2` FOREIGN KEY (`newsId`) REFERENCES `notice_news` (`newsId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_news_comment
-- ----------------------------
INSERT INTO `notice_news_comment` VALUES ('17', '1', 'nihao ', '2011-07-29 16:58:45', '超级管理员', '1', '1');
INSERT INTO `notice_news_comment` VALUES ('20', '1', '1', '2011-07-29 17:49:27', '超级管理员', '1', '2');
INSERT INTO `notice_news_comment` VALUES ('21', '2', '1', '2011-08-01 14:06:24', '超级管理员', '1', '2');
INSERT INTO `notice_news_comment` VALUES ('22', '3', '1', '2011-08-02 13:48:36', '超级管理员', '1', '2');

-- ----------------------------
-- Table structure for `notice_news_type`
-- ----------------------------
DROP TABLE IF EXISTS `notice_news_type`;
CREATE TABLE `notice_news_type` (
  `typeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(128) NOT NULL,
  `sn` int(11) NOT NULL,
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知（新）类型';

-- ----------------------------
-- Records of notice_news_type
-- ----------------------------
INSERT INTO `notice_news_type` VALUES ('1', '测试类别', '1');
INSERT INTO `notice_news_type` VALUES ('2', '测试类别2', '2');

-- ----------------------------
-- Table structure for `noticenews_doc`
-- ----------------------------
DROP TABLE IF EXISTS `noticenews_doc`;
CREATE TABLE `noticenews_doc` (
  `docId` bigint(20) NOT NULL AUTO_INCREMENT,
  `fileId` bigint(20) DEFAULT NULL,
  `noticeNewsId` bigint(20) DEFAULT NULL,
  `creator` varchar(64) DEFAULT NULL COMMENT '拟稿人',
  `creatorId` bigint(20) DEFAULT NULL COMMENT '拟稿人ID',
  `docName` varchar(128) NOT NULL COMMENT '文档名称',
  `docPath` varchar(128) NOT NULL COMMENT '文档路径',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `updatetime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`docId`),
  KEY `FK_NNSC_R_FA` (`fileId`) USING BTREE,
  KEY `FK_NNSD_R_NNS` (`noticeNewsId`) USING BTREE,
  CONSTRAINT `noticenews_doc_ibfk_1` FOREIGN KEY (`fileId`) REFERENCES `file_attach` (`fileId`),
  CONSTRAINT `noticenews_doc_ibfk_2` FOREIGN KEY (`noticeNewsId`) REFERENCES `notice_news` (`newsId`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of noticenews_doc
-- ----------------------------
INSERT INTO `noticenews_doc` VALUES ('30', '26', '1', null, null, 'HibernateNote.txt', 'noticenew/201107/85cd51ee8db74d6f93968ff543a7f27e.txt', '2011-07-29 15:01:14', '2011-07-29 15:01:14');
INSERT INTO `noticenews_doc` VALUES ('31', '31', '2', null, null, 'HibernateNote.txt', 'noticenew/201108/8ffb052592fd4b2d8a1a9b8d0d597663.txt', '2011-08-01 14:05:14', '2011-08-01 14:05:14');
INSERT INTO `noticenews_doc` VALUES ('32', '36', '3', null, null, 'leave_type.sql', 'noticenew/201108/cfd4aecc365c465a8717ce86a9cf22c5.sql', '2011-08-02 13:48:36', '2011-08-02 13:48:36');

-- ----------------------------
-- Table structure for `pb_temp`
-- ----------------------------
DROP TABLE IF EXISTS `pb_temp`;
CREATE TABLE `pb_temp` (
  `id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pb_temp
-- ----------------------------
INSERT INTO `pb_temp` VALUES ('3081');
INSERT INTO `pb_temp` VALUES ('4191');
INSERT INTO `pb_temp` VALUES ('4901');
INSERT INTO `pb_temp` VALUES ('5301');
INSERT INTO `pb_temp` VALUES ('6051');
INSERT INTO `pb_temp` VALUES ('6141');
INSERT INTO `pb_temp` VALUES ('6941');
INSERT INTO `pb_temp` VALUES ('8961');
INSERT INTO `pb_temp` VALUES ('9021');
INSERT INTO `pb_temp` VALUES ('10661');
INSERT INTO `pb_temp` VALUES ('11511');
INSERT INTO `pb_temp` VALUES ('11611');
INSERT INTO `pb_temp` VALUES ('12111');
INSERT INTO `pb_temp` VALUES ('12721');
INSERT INTO `pb_temp` VALUES ('15001');
INSERT INTO `pb_temp` VALUES ('21601');
INSERT INTO `pb_temp` VALUES ('23771');
INSERT INTO `pb_temp` VALUES ('24611');
INSERT INTO `pb_temp` VALUES ('24751');
INSERT INTO `pb_temp` VALUES ('25381');
INSERT INTO `pb_temp` VALUES ('25401');
INSERT INTO `pb_temp` VALUES ('25521');
INSERT INTO `pb_temp` VALUES ('25561');
INSERT INTO `pb_temp` VALUES ('25741');
INSERT INTO `pb_temp` VALUES ('26081');
INSERT INTO `pb_temp` VALUES ('26731');
INSERT INTO `pb_temp` VALUES ('27271');
INSERT INTO `pb_temp` VALUES ('28691');
INSERT INTO `pb_temp` VALUES ('29481');
INSERT INTO `pb_temp` VALUES ('29591');
INSERT INTO `pb_temp` VALUES ('30201');
INSERT INTO `pb_temp` VALUES ('30821');
INSERT INTO `pb_temp` VALUES ('31071');
INSERT INTO `pb_temp` VALUES ('31151');
INSERT INTO `pb_temp` VALUES ('31381');
INSERT INTO `pb_temp` VALUES ('31561');
INSERT INTO `pb_temp` VALUES ('33651');
INSERT INTO `pb_temp` VALUES ('34741');
INSERT INTO `pb_temp` VALUES ('35241');
INSERT INTO `pb_temp` VALUES ('35571');
INSERT INTO `pb_temp` VALUES ('35591');
INSERT INTO `pb_temp` VALUES ('35611');
INSERT INTO `pb_temp` VALUES ('35661');
INSERT INTO `pb_temp` VALUES ('35801');
INSERT INTO `pb_temp` VALUES ('36141');
INSERT INTO `pb_temp` VALUES ('38911');
INSERT INTO `pb_temp` VALUES ('39931');
INSERT INTO `pb_temp` VALUES ('40881');
INSERT INTO `pb_temp` VALUES ('42321');
INSERT INTO `pb_temp` VALUES ('42341');
INSERT INTO `pb_temp` VALUES ('42561');
INSERT INTO `pb_temp` VALUES ('42931');

-- ----------------------------
-- Table structure for `pro_definition`
-- ----------------------------
DROP TABLE IF EXISTS `pro_definition`;
CREATE TABLE `pro_definition` (
  `defId` bigint(20) NOT NULL AUTO_INCREMENT,
  `typeId` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `name` varchar(256) NOT NULL COMMENT '流程的名称',
  `description` varchar(1024) DEFAULT NULL COMMENT '描述',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `deployId` varchar(64) NOT NULL COMMENT 'Jbpm 工作流id',
  `defXml` text COMMENT '流程定义XML',
  `drawDefXml` text,
  `isDefault` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否缺省\r\n            1=是\r\n            0=否',
  PRIMARY KEY (`defId`),
  KEY `FK_PD_R_PT` (`typeId`) USING BTREE,
  CONSTRAINT `pro_definition_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `pro_type` (`typeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程定义';

-- ----------------------------
-- Records of pro_definition
-- ----------------------------

-- ----------------------------
-- Table structure for `pro_type`
-- ----------------------------
DROP TABLE IF EXISTS `pro_type`;
CREATE TABLE `pro_type` (
  `typeId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类别ID',
  `typeName` varchar(128) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`typeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='流程分类';

-- ----------------------------
-- Records of pro_type
-- ----------------------------
INSERT INTO `pro_type` VALUES ('1', '公文');
INSERT INTO `pro_type` VALUES ('2', '行政');
INSERT INTO `pro_type` VALUES ('3', '日常');
INSERT INTO `pro_type` VALUES ('4', '人力');

-- ----------------------------
-- Table structure for `pro_user_assign`
-- ----------------------------
DROP TABLE IF EXISTS `pro_user_assign`;
CREATE TABLE `pro_user_assign` (
  `assignId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '授权ID',
  `deployId` varchar(128) NOT NULL COMMENT 'jbpm流程定义的id',
  `activityName` varchar(128) NOT NULL COMMENT '流程节点名称',
  `roleId` varchar(128) DEFAULT NULL COMMENT '角色Id',
  `roleName` varchar(256) DEFAULT NULL,
  `userId` varchar(128) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(256) DEFAULT NULL,
  `isSigned` smallint(6) DEFAULT '0' COMMENT '1=是会签任务\r\n            0=非会签任务\r\n            \r\n            若为会签任务，则需要为该会签添加会签的决策方式的设置\r\n            ',
  PRIMARY KEY (`assignId`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='流程过程中各个任务节点及启动流程时的角色';

-- ----------------------------
-- Records of pro_user_assign
-- ----------------------------
INSERT INTO `pro_user_assign` VALUES ('1', '4', '发文核稿', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('2', '4', '科室审核', '', '', '__super', '[上级]', null);
INSERT INTO `pro_user_assign` VALUES ('3', '4', '主管领导审批', '8', '副局长', '', '', null);
INSERT INTO `pro_user_assign` VALUES ('4', '4', '发文分发', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('5', '4', '发文校对', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('6', '4', '分管领导签发', '7', '局长', '', '', null);
INSERT INTO `pro_user_assign` VALUES ('7', '5', '登记拟办', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('8', '5', '领导批示', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('9', '5', '公文分发', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('10', '5', '承办传阅', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('11', '12', '科室负责人核稿', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('12', '12', '分管或局领导签发', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('13', '12', '办公室主任承办', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('14', '12', '编号盖章分发', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('15', '13', '部门负责人审批', '', '', '', '', null);
INSERT INTO `pro_user_assign` VALUES ('16', '13', '人事登记', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('17', '14', '部门负责人审批', '', '', '', '', null);
INSERT INTO `pro_user_assign` VALUES ('18', '14', '分管局长审批', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('19', '14', '局长审批', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('20', '14', '人事登记', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('21', '15', '部门负责人审批', '', '', '', '', null);
INSERT INTO `pro_user_assign` VALUES ('22', '15', '局长审批', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('23', '15', '人事登记', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('24', '17', '上报审批', '', '', '', '', null);
INSERT INTO `pro_user_assign` VALUES ('25', '17', '人力资源核实并确认', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('26', '17', '目标设定与面谈', '', '', '__start', '[发起人]', null);
INSERT INTO `pro_user_assign` VALUES ('27', '17', '考核期评估', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('28', '17', '领导批准', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('29', '17', '人力资源确认', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('30', '17', '晋升面谈', '', '', '__start', '[发起人]', null);
INSERT INTO `pro_user_assign` VALUES ('31', '17', '任命发文', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('32', '20', '直线经理审核', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('33', '20', '人力资源复核', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('34', '20', '分管副总裁确认', '', '', '1', '超级管理员', null);
INSERT INTO `pro_user_assign` VALUES ('35', '18', '人力资源复核确认', '', '', '1,2,3', '超级管理员,cwx,人事经理', null);

-- ----------------------------
-- Table structure for `process_form`
-- ----------------------------
DROP TABLE IF EXISTS `process_form`;
CREATE TABLE `process_form` (
  `formId` bigint(20) NOT NULL AUTO_INCREMENT,
  `runId` bigint(20) NOT NULL COMMENT '所属运行流程',
  `activityName` varchar(128) NOT NULL COMMENT '活动或任务名称',
  `sn` int(11) NOT NULL DEFAULT '1' COMMENT '表单序号代表该流程任务执行经过的次数,如第一次经过时为1,第二次再次经过时变为2,\r\n            主要用于标识某一任务在流程中可能被不断回退.',
  `createtime` datetime NOT NULL,
  `creatorId` bigint(20) NOT NULL,
  `creatorName` varchar(64) NOT NULL,
  PRIMARY KEY (`formId`),
  KEY `FK_PF_R_PR` (`runId`) USING BTREE,
  CONSTRAINT `process_form_ibfk_1` FOREIGN KEY (`runId`) REFERENCES `process_run` (`runId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程表单\r\n存储保存在运行中的流程表单数据';

-- ----------------------------
-- Records of process_form
-- ----------------------------

-- ----------------------------
-- Table structure for `process_run`
-- ----------------------------
DROP TABLE IF EXISTS `process_run`;
CREATE TABLE `process_run` (
  `runId` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(256) NOT NULL COMMENT '标题\r\n            一般为流程名称＋格式化的时间',
  `creator` varchar(128) DEFAULT NULL COMMENT '创建人',
  `userId` bigint(20) NOT NULL COMMENT '所属用户',
  `defId` bigint(20) NOT NULL COMMENT '所属流程定义',
  `piId` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `runStatus` smallint(6) NOT NULL COMMENT '0=尚未启动\r\n            1=已经启动流程\r\n            2=运行结束',
  PRIMARY KEY (`runId`),
  KEY `FK_PR_R_AU` (`userId`) USING BTREE,
  KEY `FK_PR_R_PD` (`defId`) USING BTREE,
  CONSTRAINT `process_run_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `app_user` (`userId`),
  CONSTRAINT `process_run_ibfk_2` FOREIGN KEY (`defId`) REFERENCES `pro_definition` (`defId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运行中的流程';

-- ----------------------------
-- Records of process_run
-- ----------------------------

-- ----------------------------
-- Table structure for `region`
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `regionId` bigint(20) NOT NULL AUTO_INCREMENT,
  `regionName` varchar(128) NOT NULL COMMENT '地区名称',
  `regionType` smallint(6) NOT NULL COMMENT '地区类型\r\n            1=省份\r\n            2=市',
  `parentId` bigint(20) DEFAULT NULL COMMENT '上级地区',
  PRIMARY KEY (`regionId`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8 COMMENT='地区管理';

-- ----------------------------
-- Records of region
-- ----------------------------
INSERT INTO `region` VALUES ('1', '北京', '2', '0');
INSERT INTO `region` VALUES ('2', '上海', '2', '0');
INSERT INTO `region` VALUES ('3', '天津', '2', '0');
INSERT INTO `region` VALUES ('4', '重庆', '2', '0');
INSERT INTO `region` VALUES ('5', '河北', '1', '0');
INSERT INTO `region` VALUES ('6', '山西', '1', '0');
INSERT INTO `region` VALUES ('7', '内蒙古', '1', '0');
INSERT INTO `region` VALUES ('8', '辽宁', '1', '0');
INSERT INTO `region` VALUES ('9', '吉林', '1', '0');
INSERT INTO `region` VALUES ('10', '黑龙江', '1', '0');
INSERT INTO `region` VALUES ('11', '江苏', '1', '0');
INSERT INTO `region` VALUES ('12', '浙江', '1', '0');
INSERT INTO `region` VALUES ('13', '安徽', '1', '0');
INSERT INTO `region` VALUES ('14', '福建', '1', '0');
INSERT INTO `region` VALUES ('15', '江西', '1', '0');
INSERT INTO `region` VALUES ('16', '山东', '1', '0');
INSERT INTO `region` VALUES ('17', '河南', '1', '0');
INSERT INTO `region` VALUES ('18', '湖北', '1', '0');
INSERT INTO `region` VALUES ('19', '湖南', '1', '0');
INSERT INTO `region` VALUES ('20', '广东', '1', '0');
INSERT INTO `region` VALUES ('21', '广西', '1', '0');
INSERT INTO `region` VALUES ('22', '海南', '1', '0');
INSERT INTO `region` VALUES ('23', '四川', '1', '0');
INSERT INTO `region` VALUES ('24', '贵州', '1', '0');
INSERT INTO `region` VALUES ('25', '云南', '1', '0');
INSERT INTO `region` VALUES ('26', '西藏', '1', '0');
INSERT INTO `region` VALUES ('27', '陕西', '1', '0');
INSERT INTO `region` VALUES ('28', '甘肃', '1', '0');
INSERT INTO `region` VALUES ('29', '青海', '1', '0');
INSERT INTO `region` VALUES ('30', '宁夏', '1', '0');
INSERT INTO `region` VALUES ('31', '新疆', '1', '0');
INSERT INTO `region` VALUES ('32', '台湾', '1', '0');
INSERT INTO `region` VALUES ('33', '港澳', '1', '0');
INSERT INTO `region` VALUES ('34', '石家庄', '2', '5');
INSERT INTO `region` VALUES ('35', '唐山', '2', '5');
INSERT INTO `region` VALUES ('36', '秦皇岛', '2', '5');
INSERT INTO `region` VALUES ('37', '邯郸', '2', '5');
INSERT INTO `region` VALUES ('38', '邢台', '2', '5');
INSERT INTO `region` VALUES ('39', '保定', '2', '5');
INSERT INTO `region` VALUES ('40', '张家口', '2', '5');
INSERT INTO `region` VALUES ('41', '承德', '2', '5');
INSERT INTO `region` VALUES ('42', '沧州', '2', '5');
INSERT INTO `region` VALUES ('43', '廊坊', '2', '5');
INSERT INTO `region` VALUES ('44', '衡水', '2', '5');
INSERT INTO `region` VALUES ('45', '太原', '2', '6');
INSERT INTO `region` VALUES ('46', '大同', '2', '6');
INSERT INTO `region` VALUES ('47', '阳泉', '2', '6');
INSERT INTO `region` VALUES ('48', '长治', '2', '6');
INSERT INTO `region` VALUES ('49', '晋城', '2', '6');
INSERT INTO `region` VALUES ('50', '朔州', '2', '6');
INSERT INTO `region` VALUES ('51', '晋中', '2', '6');
INSERT INTO `region` VALUES ('52', '运城', '2', '6');
INSERT INTO `region` VALUES ('53', '忻州', '2', '6');
INSERT INTO `region` VALUES ('54', '临汾', '2', '6');
INSERT INTO `region` VALUES ('55', '吕梁', '2', '6');
INSERT INTO `region` VALUES ('56', '呼和浩特', '2', '7');
INSERT INTO `region` VALUES ('57', '包头', '2', '7');
INSERT INTO `region` VALUES ('58', '乌海', '2', '7');
INSERT INTO `region` VALUES ('59', '赤峰', '2', '7');
INSERT INTO `region` VALUES ('60', '通辽', '2', '7');
INSERT INTO `region` VALUES ('61', '鄂尔多斯', '2', '7');
INSERT INTO `region` VALUES ('62', '呼伦贝尔', '2', '7');
INSERT INTO `region` VALUES ('63', '巴彦淖尔', '2', '7');
INSERT INTO `region` VALUES ('64', '乌兰察布', '2', '7');
INSERT INTO `region` VALUES ('65', '兴安', '2', '7');
INSERT INTO `region` VALUES ('66', '锡林郭勒', '2', '7');
INSERT INTO `region` VALUES ('67', '阿拉善', '2', '7');
INSERT INTO `region` VALUES ('68', '沈阳', '2', '8');
INSERT INTO `region` VALUES ('69', '大连', '2', '8');
INSERT INTO `region` VALUES ('70', '鞍山', '2', '8');
INSERT INTO `region` VALUES ('71', '抚顺', '2', '8');
INSERT INTO `region` VALUES ('72', '本溪', '2', '8');
INSERT INTO `region` VALUES ('73', '丹东', '2', '8');
INSERT INTO `region` VALUES ('74', '锦州', '2', '8');
INSERT INTO `region` VALUES ('75', '营口', '2', '8');
INSERT INTO `region` VALUES ('76', '阜新', '2', '8');
INSERT INTO `region` VALUES ('77', '辽阳', '2', '8');
INSERT INTO `region` VALUES ('78', '盘锦', '2', '8');
INSERT INTO `region` VALUES ('79', '铁岭', '2', '8');
INSERT INTO `region` VALUES ('80', '朝阳', '2', '8');
INSERT INTO `region` VALUES ('81', '葫芦岛', '2', '8');
INSERT INTO `region` VALUES ('82', '长春', '2', '9');
INSERT INTO `region` VALUES ('83', '吉林', '2', '9');
INSERT INTO `region` VALUES ('84', '四平', '2', '9');
INSERT INTO `region` VALUES ('85', '辽源', '2', '9');
INSERT INTO `region` VALUES ('86', '通化', '2', '9');
INSERT INTO `region` VALUES ('87', '白山', '2', '9');
INSERT INTO `region` VALUES ('88', '松原', '2', '9');
INSERT INTO `region` VALUES ('89', '白城', '2', '9');
INSERT INTO `region` VALUES ('90', '延边', '2', '9');
INSERT INTO `region` VALUES ('91', '哈尔滨', '2', '10');
INSERT INTO `region` VALUES ('92', '齐齐哈尔', '2', '10');
INSERT INTO `region` VALUES ('93', '鸡西', '2', '10');
INSERT INTO `region` VALUES ('94', '鹤岗', '2', '10');
INSERT INTO `region` VALUES ('95', '双鸭山', '2', '10');
INSERT INTO `region` VALUES ('96', '大庆', '2', '10');
INSERT INTO `region` VALUES ('97', '伊春', '2', '10');
INSERT INTO `region` VALUES ('98', '佳木斯', '2', '10');
INSERT INTO `region` VALUES ('99', '七台河', '2', '10');
INSERT INTO `region` VALUES ('100', '牡丹江', '2', '10');
INSERT INTO `region` VALUES ('101', '黑河', '2', '10');
INSERT INTO `region` VALUES ('102', '绥化', '2', '10');
INSERT INTO `region` VALUES ('103', '大兴安岭', '2', '10');
INSERT INTO `region` VALUES ('104', '南京', '2', '11');
INSERT INTO `region` VALUES ('105', '无锡', '2', '11');
INSERT INTO `region` VALUES ('106', '徐州', '2', '11');
INSERT INTO `region` VALUES ('107', '常州', '2', '11');
INSERT INTO `region` VALUES ('108', '苏州', '2', '11');
INSERT INTO `region` VALUES ('109', '南通', '2', '11');
INSERT INTO `region` VALUES ('110', '连云港', '2', '11');
INSERT INTO `region` VALUES ('111', '淮安', '2', '11');
INSERT INTO `region` VALUES ('112', '盐城', '2', '11');
INSERT INTO `region` VALUES ('113', '扬州', '2', '11');
INSERT INTO `region` VALUES ('114', '镇江', '2', '11');
INSERT INTO `region` VALUES ('115', '泰州', '2', '11');
INSERT INTO `region` VALUES ('116', '宿迁', '2', '11');
INSERT INTO `region` VALUES ('117', '杭州', '2', '12');
INSERT INTO `region` VALUES ('118', '宁波', '2', '12');
INSERT INTO `region` VALUES ('119', '温州', '2', '12');
INSERT INTO `region` VALUES ('120', '嘉兴', '2', '12');
INSERT INTO `region` VALUES ('121', '湖州', '2', '12');
INSERT INTO `region` VALUES ('122', '绍兴', '2', '12');
INSERT INTO `region` VALUES ('123', '金华', '2', '12');
INSERT INTO `region` VALUES ('124', '衢州', '2', '12');
INSERT INTO `region` VALUES ('125', '舟山', '2', '12');
INSERT INTO `region` VALUES ('126', '台州', '2', '12');
INSERT INTO `region` VALUES ('127', '丽水', '2', '12');
INSERT INTO `region` VALUES ('128', '合肥', '2', '13');
INSERT INTO `region` VALUES ('129', '芜湖', '2', '13');
INSERT INTO `region` VALUES ('130', '蚌埠', '2', '13');
INSERT INTO `region` VALUES ('131', '淮南', '2', '13');
INSERT INTO `region` VALUES ('132', '马鞍山', '2', '13');
INSERT INTO `region` VALUES ('133', '淮北', '2', '13');
INSERT INTO `region` VALUES ('134', '铜陵', '2', '13');
INSERT INTO `region` VALUES ('135', '安庆', '2', '13');
INSERT INTO `region` VALUES ('136', '黄山', '2', '13');
INSERT INTO `region` VALUES ('137', '滁州', '2', '13');
INSERT INTO `region` VALUES ('138', '阜阳', '2', '13');
INSERT INTO `region` VALUES ('139', '宿州', '2', '13');
INSERT INTO `region` VALUES ('140', '巢湖', '2', '13');
INSERT INTO `region` VALUES ('141', '六安', '2', '13');
INSERT INTO `region` VALUES ('142', '亳州', '2', '13');
INSERT INTO `region` VALUES ('143', '池州', '2', '13');
INSERT INTO `region` VALUES ('144', '宣城', '2', '13');
INSERT INTO `region` VALUES ('145', '福州', '2', '14');
INSERT INTO `region` VALUES ('146', '厦门', '2', '14');
INSERT INTO `region` VALUES ('147', '莆田', '2', '14');
INSERT INTO `region` VALUES ('148', '三明', '2', '14');
INSERT INTO `region` VALUES ('149', '泉州', '2', '14');
INSERT INTO `region` VALUES ('150', '漳州', '2', '14');
INSERT INTO `region` VALUES ('151', '南平', '2', '14');
INSERT INTO `region` VALUES ('152', '龙岩', '2', '14');
INSERT INTO `region` VALUES ('153', '宁德', '2', '14');
INSERT INTO `region` VALUES ('154', '南昌', '2', '15');
INSERT INTO `region` VALUES ('155', '景德镇', '2', '15');
INSERT INTO `region` VALUES ('156', '萍乡', '2', '15');
INSERT INTO `region` VALUES ('157', '九江', '2', '15');
INSERT INTO `region` VALUES ('158', '新余', '2', '15');
INSERT INTO `region` VALUES ('159', '鹰潭', '2', '15');
INSERT INTO `region` VALUES ('160', '赣州', '2', '15');
INSERT INTO `region` VALUES ('161', '吉安', '2', '15');
INSERT INTO `region` VALUES ('162', '宜春', '2', '15');
INSERT INTO `region` VALUES ('163', '抚州', '2', '15');
INSERT INTO `region` VALUES ('164', '上饶', '2', '15');
INSERT INTO `region` VALUES ('165', '济南', '2', '16');
INSERT INTO `region` VALUES ('166', '青岛', '2', '16');
INSERT INTO `region` VALUES ('167', '淄博', '2', '16');
INSERT INTO `region` VALUES ('168', '枣庄', '2', '16');
INSERT INTO `region` VALUES ('169', '东营', '2', '16');
INSERT INTO `region` VALUES ('170', '烟台', '2', '16');
INSERT INTO `region` VALUES ('171', '潍坊', '2', '16');
INSERT INTO `region` VALUES ('172', '济宁', '2', '16');
INSERT INTO `region` VALUES ('173', '泰安', '2', '16');
INSERT INTO `region` VALUES ('174', '日照', '2', '16');
INSERT INTO `region` VALUES ('175', '莱芜', '2', '16');
INSERT INTO `region` VALUES ('176', '临沂', '2', '16');
INSERT INTO `region` VALUES ('177', '德州', '2', '16');
INSERT INTO `region` VALUES ('178', '聊城', '2', '16');
INSERT INTO `region` VALUES ('179', '滨州', '2', '16');
INSERT INTO `region` VALUES ('180', '菏泽', '2', '16');
INSERT INTO `region` VALUES ('181', '郑州', '2', '17');
INSERT INTO `region` VALUES ('182', '开封', '2', '17');
INSERT INTO `region` VALUES ('183', '洛阳', '2', '17');
INSERT INTO `region` VALUES ('184', '平顶山', '2', '17');
INSERT INTO `region` VALUES ('185', '焦作', '2', '17');
INSERT INTO `region` VALUES ('186', '鹤壁', '2', '17');
INSERT INTO `region` VALUES ('187', '新乡', '2', '17');
INSERT INTO `region` VALUES ('188', '安阳', '2', '17');
INSERT INTO `region` VALUES ('189', '濮阳', '2', '17');
INSERT INTO `region` VALUES ('190', '许昌', '2', '17');
INSERT INTO `region` VALUES ('191', '渭河', '2', '17');
INSERT INTO `region` VALUES ('192', '三门峡', '2', '17');
INSERT INTO `region` VALUES ('193', '南阳', '2', '17');
INSERT INTO `region` VALUES ('194', '商丘', '2', '17');
INSERT INTO `region` VALUES ('195', '信阳', '2', '17');
INSERT INTO `region` VALUES ('196', '周口', '2', '17');
INSERT INTO `region` VALUES ('197', '驻马店', '2', '17');
INSERT INTO `region` VALUES ('198', '武汉', '2', '18');
INSERT INTO `region` VALUES ('199', '黄石', '2', '18');
INSERT INTO `region` VALUES ('200', '襄樊', '2', '18');
INSERT INTO `region` VALUES ('201', '十堰', '2', '18');
INSERT INTO `region` VALUES ('202', '荆州', '2', '18');
INSERT INTO `region` VALUES ('203', '宜昌', '2', '18');
INSERT INTO `region` VALUES ('204', '荆门', '2', '18');
INSERT INTO `region` VALUES ('205', '鄂州', '2', '18');
INSERT INTO `region` VALUES ('206', '孝感', '2', '18');
INSERT INTO `region` VALUES ('207', '黄冈', '2', '18');
INSERT INTO `region` VALUES ('208', '咸宁', '2', '18');
INSERT INTO `region` VALUES ('209', '随州', '2', '18');
INSERT INTO `region` VALUES ('210', '恩施', '2', '18');
INSERT INTO `region` VALUES ('211', '长沙', '2', '19');
INSERT INTO `region` VALUES ('212', '株洲', '2', '19');
INSERT INTO `region` VALUES ('213', '湘潭', '2', '19');
INSERT INTO `region` VALUES ('214', '衡阳', '2', '19');
INSERT INTO `region` VALUES ('215', '邵阳', '2', '19');
INSERT INTO `region` VALUES ('216', '岳阳', '2', '19');
INSERT INTO `region` VALUES ('217', '常德', '2', '19');
INSERT INTO `region` VALUES ('218', '张家界', '2', '19');
INSERT INTO `region` VALUES ('219', '溢阳', '2', '19');
INSERT INTO `region` VALUES ('220', '郴州', '2', '19');
INSERT INTO `region` VALUES ('221', '永州', '2', '19');
INSERT INTO `region` VALUES ('222', '怀化', '2', '19');
INSERT INTO `region` VALUES ('223', '娄底', '2', '19');
INSERT INTO `region` VALUES ('224', '湘西', '2', '19');
INSERT INTO `region` VALUES ('225', '广州', '2', '20');
INSERT INTO `region` VALUES ('226', '深圳', '2', '20');
INSERT INTO `region` VALUES ('227', '珠海', '2', '20');
INSERT INTO `region` VALUES ('228', '汕头', '2', '20');
INSERT INTO `region` VALUES ('229', '韶关', '2', '20');
INSERT INTO `region` VALUES ('230', '佛山', '2', '20');
INSERT INTO `region` VALUES ('231', '江门', '2', '20');
INSERT INTO `region` VALUES ('232', '湛江', '2', '20');
INSERT INTO `region` VALUES ('233', '茂名', '2', '20');
INSERT INTO `region` VALUES ('234', '肇庆', '2', '20');
INSERT INTO `region` VALUES ('235', '惠州', '2', '20');
INSERT INTO `region` VALUES ('236', '梅州', '2', '20');
INSERT INTO `region` VALUES ('237', '汕尾', '2', '20');
INSERT INTO `region` VALUES ('238', '河源', '2', '20');
INSERT INTO `region` VALUES ('239', '阳江', '2', '20');
INSERT INTO `region` VALUES ('240', '清远', '2', '20');
INSERT INTO `region` VALUES ('241', '东莞', '2', '20');
INSERT INTO `region` VALUES ('242', '中山', '2', '20');
INSERT INTO `region` VALUES ('243', '潮州', '2', '20');
INSERT INTO `region` VALUES ('244', '揭阳', '2', '20');
INSERT INTO `region` VALUES ('245', '云浮', '2', '20');
INSERT INTO `region` VALUES ('246', '南宁', '2', '21');
INSERT INTO `region` VALUES ('247', '柳州', '2', '21');
INSERT INTO `region` VALUES ('248', '桂林', '2', '21');
INSERT INTO `region` VALUES ('249', '梧州', '2', '21');
INSERT INTO `region` VALUES ('250', '北海', '2', '21');
INSERT INTO `region` VALUES ('251', '防城港', '2', '21');
INSERT INTO `region` VALUES ('252', '钦州', '2', '21');
INSERT INTO `region` VALUES ('253', '贵港', '2', '21');
INSERT INTO `region` VALUES ('254', '玉林', '2', '21');
INSERT INTO `region` VALUES ('255', '百色', '2', '21');
INSERT INTO `region` VALUES ('256', '贺州', '2', '21');
INSERT INTO `region` VALUES ('257', '河池', '2', '21');
INSERT INTO `region` VALUES ('258', '来宾', '2', '21');
INSERT INTO `region` VALUES ('259', '崇左', '2', '21');
INSERT INTO `region` VALUES ('260', '白沙黎族自治县', '2', '22');
INSERT INTO `region` VALUES ('261', '西沙群岛', '2', '22');
INSERT INTO `region` VALUES ('262', '儋州', '2', '22');
INSERT INTO `region` VALUES ('263', '屯昌县', '2', '22');
INSERT INTO `region` VALUES ('264', '安定县', '2', '22');
INSERT INTO `region` VALUES ('265', '琼中黎族苗族自治县', '2', '22');
INSERT INTO `region` VALUES ('266', '昌江黎族自治县', '2', '22');
INSERT INTO `region` VALUES ('267', '东方', '2', '22');
INSERT INTO `region` VALUES ('268', '三亚', '2', '22');
INSERT INTO `region` VALUES ('269', '中沙群岛的岛礁及其海域', '2', '22');
INSERT INTO `region` VALUES ('270', '琼海', '2', '22');
INSERT INTO `region` VALUES ('271', '澄迈县', '2', '22');
INSERT INTO `region` VALUES ('272', '五指山', '2', '22');
INSERT INTO `region` VALUES ('273', '海口', '2', '22');
INSERT INTO `region` VALUES ('274', '文昌', '2', '22');
INSERT INTO `region` VALUES ('275', '陵水黎族自治县', '2', '22');
INSERT INTO `region` VALUES ('276', '保亭黎族苗族自治县', '2', '22');
INSERT INTO `region` VALUES ('277', '南沙群岛', '2', '22');
INSERT INTO `region` VALUES ('278', '乐东黎族自治县', '2', '22');
INSERT INTO `region` VALUES ('279', '临高县', '2', '22');
INSERT INTO `region` VALUES ('280', '万宁', '2', '22');
INSERT INTO `region` VALUES ('281', '成都', '2', '23');
INSERT INTO `region` VALUES ('282', '自贡', '2', '23');
INSERT INTO `region` VALUES ('283', '攀枝花', '2', '23');
INSERT INTO `region` VALUES ('284', '泸州', '2', '23');
INSERT INTO `region` VALUES ('285', '德阳', '2', '23');
INSERT INTO `region` VALUES ('286', '绵阳', '2', '23');
INSERT INTO `region` VALUES ('287', '广元', '2', '23');
INSERT INTO `region` VALUES ('288', '遂宁', '2', '23');
INSERT INTO `region` VALUES ('289', '内江', '2', '23');
INSERT INTO `region` VALUES ('290', '乐山', '2', '23');
INSERT INTO `region` VALUES ('291', '南充', '2', '23');
INSERT INTO `region` VALUES ('292', '宜宾', '2', '23');
INSERT INTO `region` VALUES ('293', '广安', '2', '23');
INSERT INTO `region` VALUES ('294', '达州', '2', '23');
INSERT INTO `region` VALUES ('295', '眉山', '2', '23');
INSERT INTO `region` VALUES ('296', '雅安', '2', '23');
INSERT INTO `region` VALUES ('297', '巴中', '2', '23');
INSERT INTO `region` VALUES ('298', '资阳', '2', '23');
INSERT INTO `region` VALUES ('299', '阿坝', '2', '23');
INSERT INTO `region` VALUES ('300', '甘孜', '2', '23');
INSERT INTO `region` VALUES ('301', '凉山', '2', '23');
INSERT INTO `region` VALUES ('302', '贵阳', '2', '24');
INSERT INTO `region` VALUES ('303', '六盘水', '2', '24');
INSERT INTO `region` VALUES ('304', '遵义', '2', '24');
INSERT INTO `region` VALUES ('305', '安顺', '2', '24');
INSERT INTO `region` VALUES ('306', '铜仁', '2', '24');
INSERT INTO `region` VALUES ('307', '毕节', '2', '24');
INSERT INTO `region` VALUES ('308', '黔西南', '2', '24');
INSERT INTO `region` VALUES ('309', '黔东南', '2', '24');
INSERT INTO `region` VALUES ('310', '黔南', '2', '24');
INSERT INTO `region` VALUES ('311', '昆明', '2', '25');
INSERT INTO `region` VALUES ('312', '曲靖', '2', '25');
INSERT INTO `region` VALUES ('313', '玉溪', '2', '25');
INSERT INTO `region` VALUES ('314', '保山', '2', '25');
INSERT INTO `region` VALUES ('315', '昭通', '2', '25');
INSERT INTO `region` VALUES ('316', '丽江', '2', '25');
INSERT INTO `region` VALUES ('317', '普洱', '2', '25');
INSERT INTO `region` VALUES ('318', '临沧', '2', '25');
INSERT INTO `region` VALUES ('319', '文山', '2', '25');
INSERT INTO `region` VALUES ('320', '红河', '2', '25');
INSERT INTO `region` VALUES ('321', '西双版纳', '2', '25');
INSERT INTO `region` VALUES ('322', '楚雄', '2', '25');
INSERT INTO `region` VALUES ('323', '大理', '2', '25');
INSERT INTO `region` VALUES ('324', '德宏', '2', '25');
INSERT INTO `region` VALUES ('325', '怒江', '2', '25');
INSERT INTO `region` VALUES ('326', '迪庆', '2', '25');
INSERT INTO `region` VALUES ('327', '拉萨', '2', '26');
INSERT INTO `region` VALUES ('328', '昌都', '2', '26');
INSERT INTO `region` VALUES ('329', '山南', '2', '26');
INSERT INTO `region` VALUES ('330', '日喀则', '2', '26');
INSERT INTO `region` VALUES ('331', '那曲', '2', '26');
INSERT INTO `region` VALUES ('332', '阿里', '2', '26');
INSERT INTO `region` VALUES ('333', '林芝', '2', '26');
INSERT INTO `region` VALUES ('334', '西安', '2', '27');
INSERT INTO `region` VALUES ('335', '铜川', '2', '27');
INSERT INTO `region` VALUES ('336', '宝鸡', '2', '27');
INSERT INTO `region` VALUES ('337', '咸阳', '2', '27');
INSERT INTO `region` VALUES ('338', '渭南', '2', '27');
INSERT INTO `region` VALUES ('339', '延安', '2', '27');
INSERT INTO `region` VALUES ('340', '汉中', '2', '27');
INSERT INTO `region` VALUES ('341', '榆林', '2', '27');
INSERT INTO `region` VALUES ('342', '安康', '2', '27');
INSERT INTO `region` VALUES ('343', '商洛', '2', '27');
INSERT INTO `region` VALUES ('344', '兰州', '2', '28');
INSERT INTO `region` VALUES ('345', '嘉峪关', '2', '28');
INSERT INTO `region` VALUES ('346', '金昌', '2', '28');
INSERT INTO `region` VALUES ('347', '白银', '2', '28');
INSERT INTO `region` VALUES ('348', '天水', '2', '28');
INSERT INTO `region` VALUES ('349', '武威', '2', '28');
INSERT INTO `region` VALUES ('350', '张掖', '2', '28');
INSERT INTO `region` VALUES ('351', '平凉', '2', '28');
INSERT INTO `region` VALUES ('352', '酒泉', '2', '28');
INSERT INTO `region` VALUES ('353', '庆阳', '2', '28');
INSERT INTO `region` VALUES ('354', '定西', '2', '28');
INSERT INTO `region` VALUES ('355', '陇南', '2', '28');
INSERT INTO `region` VALUES ('356', '临夏', '2', '28');
INSERT INTO `region` VALUES ('357', '甘南', '2', '28');
INSERT INTO `region` VALUES ('358', '西宁', '2', '29');
INSERT INTO `region` VALUES ('359', '海东', '2', '29');
INSERT INTO `region` VALUES ('360', '海北', '2', '29');
INSERT INTO `region` VALUES ('361', '黄南', '2', '29');
INSERT INTO `region` VALUES ('362', '海南', '2', '29');
INSERT INTO `region` VALUES ('363', '果洛', '2', '29');
INSERT INTO `region` VALUES ('364', '玉树', '2', '29');
INSERT INTO `region` VALUES ('365', '海西', '2', '29');
INSERT INTO `region` VALUES ('366', '银川', '2', '30');
INSERT INTO `region` VALUES ('367', '石嘴山', '2', '30');
INSERT INTO `region` VALUES ('368', '吴忠', '2', '30');
INSERT INTO `region` VALUES ('369', '固原', '2', '30');
INSERT INTO `region` VALUES ('370', '中卫', '2', '30');
INSERT INTO `region` VALUES ('371', '乌鲁木齐', '2', '31');
INSERT INTO `region` VALUES ('372', '克拉玛依', '2', '31');
INSERT INTO `region` VALUES ('373', '吐鲁番', '2', '31');
INSERT INTO `region` VALUES ('374', '哈密', '2', '31');
INSERT INTO `region` VALUES ('375', '和田', '2', '31');
INSERT INTO `region` VALUES ('376', '阿克苏', '2', '31');
INSERT INTO `region` VALUES ('377', '喀什', '2', '31');
INSERT INTO `region` VALUES ('378', '克孜勒苏柯尔克孜', '2', '31');
INSERT INTO `region` VALUES ('379', '巴音郭楞蒙古', '2', '31');
INSERT INTO `region` VALUES ('380', '昌吉', '2', '31');
INSERT INTO `region` VALUES ('381', '博尔塔拉蒙古', '2', '31');
INSERT INTO `region` VALUES ('382', '伊犁哈萨克', '2', '31');
INSERT INTO `region` VALUES ('383', '塔城', '2', '31');
INSERT INTO `region` VALUES ('384', '阿勒泰', '2', '31');
INSERT INTO `region` VALUES ('385', '台北', '2', '32');
INSERT INTO `region` VALUES ('386', '高雄', '2', '32');
INSERT INTO `region` VALUES ('387', '基隆', '2', '32');
INSERT INTO `region` VALUES ('388', '台中', '2', '32');
INSERT INTO `region` VALUES ('389', '台南', '2', '32');
INSERT INTO `region` VALUES ('390', '新竹', '2', '32');
INSERT INTO `region` VALUES ('391', '香港', '2', '33');
INSERT INTO `region` VALUES ('392', '澳门', '2', '33');

-- ----------------------------
-- Table structure for `report_param`
-- ----------------------------
DROP TABLE IF EXISTS `report_param`;
CREATE TABLE `report_param` (
  `paramId` bigint(20) NOT NULL AUTO_INCREMENT,
  `reportId` bigint(20) NOT NULL COMMENT '所属报表',
  `paramName` varchar(64) NOT NULL COMMENT '参数名称',
  `paramKey` varchar(64) NOT NULL COMMENT '参数Key',
  `defaultVal` varchar(128) NOT NULL COMMENT '缺省值',
  `paramType` varchar(32) NOT NULL COMMENT '类型\r\n            字符类型--varchar\r\n            整型--int\r\n            精度型--decimal\r\n            日期型--date\r\n            日期时间型--datetime\r\n            ',
  `sn` int(11) NOT NULL COMMENT '系列号',
  PRIMARY KEY (`paramId`),
  KEY `FK_RP_R_RPT` (`reportId`) USING BTREE,
  CONSTRAINT `report_param_ibfk_1` FOREIGN KEY (`reportId`) REFERENCES `report_template` (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表参数';

-- ----------------------------
-- Records of report_param
-- ----------------------------

-- ----------------------------
-- Table structure for `report_template`
-- ----------------------------
DROP TABLE IF EXISTS `report_template`;
CREATE TABLE `report_template` (
  `reportId` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL COMMENT '标题',
  `descp` varchar(500) NOT NULL COMMENT '描述',
  `reportLocation` varchar(128) NOT NULL COMMENT '报表模块的jasper文件的路径',
  `createtime` datetime NOT NULL COMMENT '创建时间',
  `updatetime` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报表模板\r\nreport_template';

-- ----------------------------
-- Records of report_template
-- ----------------------------

-- ----------------------------
-- Table structure for `role_fun`
-- ----------------------------
DROP TABLE IF EXISTS `role_fun`;
CREATE TABLE `role_fun` (
  `roleId` bigint(20) NOT NULL,
  `functionId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`functionId`),
  KEY `FK_RF_R_AFN` (`functionId`) USING BTREE,
  CONSTRAINT `role_fun_ibfk_1` FOREIGN KEY (`functionId`) REFERENCES `app_function` (`functionId`),
  CONSTRAINT `role_fun_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `app_role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_fun
-- ----------------------------

-- ----------------------------
-- Table structure for `shopin_band`
-- ----------------------------
DROP TABLE IF EXISTS `shopin_band`;
CREATE TABLE `shopin_band` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bandName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopin_band
-- ----------------------------

-- ----------------------------
-- Table structure for `shopin_proclass`
-- ----------------------------
DROP TABLE IF EXISTS `shopin_proclass`;
CREATE TABLE `shopin_proclass` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proClassName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopin_proclass
-- ----------------------------

-- ----------------------------
-- Table structure for `short_message`
-- ----------------------------
DROP TABLE IF EXISTS `short_message`;
CREATE TABLE `short_message` (
  `messageId` bigint(20) NOT NULL AUTO_INCREMENT,
  `senderId` bigint(20) DEFAULT NULL COMMENT '主键',
  `content` varchar(256) NOT NULL,
  `sender` varchar(64) NOT NULL,
  `msgType` smallint(6) NOT NULL COMMENT '1=个人信息\r\n            2=日程安排\r\n            3=计划任务\r\n            ',
  `sendTime` datetime NOT NULL,
  PRIMARY KEY (`messageId`),
  KEY `FK_SM_R_AU` (`senderId`) USING BTREE,
  CONSTRAINT `short_message_ibfk_1` FOREIGN KEY (`senderId`) REFERENCES `app_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='短信消息';

-- ----------------------------
-- Records of short_message
-- ----------------------------
INSERT INTO `short_message` VALUES ('1', '1', '1', '1', '1', '2011-11-29 17:41:28');

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `configId` bigint(20) NOT NULL AUTO_INCREMENT,
  `configKey` varchar(64) NOT NULL COMMENT 'Key',
  `configName` varchar(64) NOT NULL COMMENT '配置名称',
  `configDesc` varchar(256) DEFAULT NULL COMMENT '配置描述',
  `typeName` varchar(32) NOT NULL COMMENT '所属分类名称',
  `dataType` smallint(6) NOT NULL COMMENT '数据类型\r\n            1=varchar\r\n            2=intger\r\n            3=decimal\r\n            4=datetime\r\n            5=time\r\n            ',
  `dataValue` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`configId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统配置\r\n\r\n用于系统的全局配置\r\n如邮件服务';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', 'host', '主机Host', '主机IP', '系统邮件配置', '1', 'smtp.shopin.cn');
INSERT INTO `sys_config` VALUES ('2', 'username', '用户名', '邮件发送的邮箱用户名', '系统邮件配置', '1', 'zhangpeng@shopin.cn');
INSERT INTO `sys_config` VALUES ('3', 'password', '密码', '邮件发送的邮箱密码', '系统邮件配置', '1', 'zhang1982peng');
INSERT INTO `sys_config` VALUES ('4', 'from', '来自', '发送人的邮箱或用户名', '系统邮件配置', '1', 'zhangpeng@shopin.cn');
INSERT INTO `sys_config` VALUES ('5', 'goodsStockUser', '用户帐号', '当库存产生警报时，接收消息的人员', '行政管理配置', '1', 'admin');
INSERT INTO `sys_config` VALUES ('6', 'codeConfig', '验证码', '登录时是否需要验证码', '验证码配置', '2', '1');
INSERT INTO `sys_config` VALUES ('7', 'displayName', '显示名称', '邮件发送显示的名称', '系统邮件配置', '1', '上品折扣办公系统');
INSERT INTO `sys_config` VALUES ('8', 'smtpAuth', '是否发件验证', '邮件发送Smtp验证', '系统邮件配置', '1', 'true');
INSERT INTO `sys_config` VALUES ('9', 'replyTo', '回复地址', '邮件回复时的地址', '系统以邮件配置', '1', 'zhangpeng@shopin.cn');

-- ----------------------------
-- Table structure for `system_log`
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `logId` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL COMMENT '用户名',
  `userId` bigint(20) NOT NULL COMMENT '用户ID',
  `createtime` datetime NOT NULL COMMENT '执行时间',
  `exeOperation` varchar(512) NOT NULL COMMENT '执行操作',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_log
-- ----------------------------

-- ----------------------------
-- Table structure for `task_sign`
-- ----------------------------
DROP TABLE IF EXISTS `task_sign`;
CREATE TABLE `task_sign` (
  `signId` bigint(20) NOT NULL,
  `assignId` bigint(20) NOT NULL COMMENT '所属流程设置',
  `voteCounts` int(11) DEFAULT NULL COMMENT '绝对票数',
  `votePercents` int(11) DEFAULT NULL COMMENT '百分比票数',
  `decideType` smallint(6) NOT NULL COMMENT '1=pass 通过\r\n            2=reject 拒绝',
  PRIMARY KEY (`signId`),
  KEY `FK_TS_R_PUA` (`assignId`) USING BTREE,
  CONSTRAINT `task_sign_ibfk_1` FOREIGN KEY (`assignId`) REFERENCES `pro_user_assign` (`assignId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userId` bigint(20) NOT NULL COMMENT '主键',
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `FK_UR_R_AR` (`roleId`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `app_role` (`roleId`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `app_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '-1');
INSERT INTO `user_role` VALUES ('2', '-1');
INSERT INTO `user_role` VALUES ('107', '-1');
INSERT INTO `user_role` VALUES ('47', '6');
INSERT INTO `user_role` VALUES ('304', '12');
INSERT INTO `user_role` VALUES ('321', '12');

-- ----------------------------
-- Table structure for `user_sub`
-- ----------------------------
DROP TABLE IF EXISTS `user_sub`;
CREATE TABLE `user_sub` (
  `subId` bigint(20) NOT NULL AUTO_INCREMENT,
  `subUserId` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  PRIMARY KEY (`subId`),
  KEY `FK_USB_R_AU` (`subUserId`) USING BTREE,
  KEY `FK_US_R_AU` (`userId`) USING BTREE,
  CONSTRAINT `user_sub_ibfk_1` FOREIGN KEY (`subUserId`) REFERENCES `app_user` (`userId`),
  CONSTRAINT `user_sub_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `app_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='subordinate';

-- ----------------------------
-- Records of user_sub
-- ----------------------------
