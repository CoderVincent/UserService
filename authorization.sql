/*
 Navicat MySQL Data Transfer

 Source Server         : mydata
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost
 Source Database       : authorization

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : utf-8

 Date: 01/23/2018 16:50:56 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `data_object`
-- ----------------------------
DROP TABLE IF EXISTS `data_object`;
CREATE TABLE `data_object` (
  `do_id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `dot_id` int(255) unsigned zerofill DEFAULT NULL,
  `do_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`do_id`),
  KEY `data_object_ibfk_1` (`dot_id`),
  CONSTRAINT `data_object_ibfk_1` FOREIGN KEY (`dot_id`) REFERENCES `data_object_type` (`dot_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `data_object`
-- ----------------------------
BEGIN;
INSERT INTO `data_object` VALUES ('1', '1', '北京销售部'), ('2', '2', '上海销售部'), ('3', '3', '员工张三'), ('4', '4', '客户李四');
COMMIT;

-- ----------------------------
--  Table structure for `data_object_type`
-- ----------------------------
DROP TABLE IF EXISTS `data_object_type`;
CREATE TABLE `data_object_type` (
  `dot_id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `dot_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`dot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `data_object_type`
-- ----------------------------
BEGIN;
INSERT INTO `data_object_type` VALUES ('1', '库房'), ('2', '员工'), ('3', '客户'), ('4', '供应商');
COMMIT;

-- ----------------------------
--  Table structure for `function`
-- ----------------------------
DROP TABLE IF EXISTS `function`;
CREATE TABLE `function` (
  `f_id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `function_number` varchar(255) DEFAULT NULL,
  `function_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `resource_id` int(255) unsigned zerofill DEFAULT NULL,
  `ot_id` int(255) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `function_ibfk_1` (`resource_id`),
  KEY `function_ibfk_2` (`ot_id`),
  CONSTRAINT `function_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `function_ibfk_2` FOREIGN KEY (`ot_id`) REFERENCES `operate_type` (`ot_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `function`
-- ----------------------------
BEGIN;
INSERT INTO `function` VALUES ('2', '1001', '销售订单写操作', '界面管理', '1', '2'), ('3', '1002', '客户信息写操作', '客户管理', '1', '3'), ('4', '1003', '销售订单读操作', '界面管理', '1', '2'), ('5', '1004', '销售订单改操作', '界面管理', '2', '1'), ('6', '1005', '销售订单查操作', '界面管理', '1', '1'), ('7', '1006', '客户信息读操作', '界面管理', '1', '3'), ('8', '1007', '客户信息查操作', '界面管理', '1', '4');
COMMIT;

-- ----------------------------
--  Table structure for `operate_type`
-- ----------------------------
DROP TABLE IF EXISTS `operate_type`;
CREATE TABLE `operate_type` (
  `ot_id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `ot_number` varchar(255) DEFAULT NULL,
  `ot_name` varchar(255) DEFAULT NULL,
  `ot_describtion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `operate_type`
-- ----------------------------
BEGIN;
INSERT INTO `operate_type` VALUES ('1', '01', 'add', '增加一个功能'), ('2', '02', 'delete', '删除一个功能'), ('3', '03', 'query', '查询一个功能'), ('4', '04', 'modify', '修改一个功能');
COMMIT;

-- ----------------------------
--  Table structure for `resource`
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource` (
  `resource_id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(255) DEFAULT NULL,
  `resource_number` varchar(255) DEFAULT NULL,
  `resource_describe` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `resource`
-- ----------------------------
BEGIN;
INSERT INTO `resource` VALUES ('1', '销售数据', '10001', '描述了整个销售数据'), ('2', '用户数据', '10002', '包括用户相关的各种数据'), ('3', '订单数据', '10003', '包括订单相关的各种数据'), ('4', '德邦物流', '10005', '描述了整个物流数据');
COMMIT;

-- ----------------------------
--  Table structure for `resource_data_object_type`
-- ----------------------------
DROP TABLE IF EXISTS `resource_data_object_type`;
CREATE TABLE `resource_data_object_type` (
  `rdot_id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `dot_id` int(255) unsigned zerofill DEFAULT NULL,
  `resource_id` int(255) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`rdot_id`),
  KEY `resource_data_object_type_ibfk_1` (`dot_id`),
  KEY `resource_data_object_type_ibfk_2` (`resource_id`),
  CONSTRAINT `resource_data_object_type_ibfk_1` FOREIGN KEY (`dot_id`) REFERENCES `data_object_type` (`dot_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resource_data_object_type_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `resource_data_object_type`
-- ----------------------------
BEGIN;
INSERT INTO `resource_data_object_type` VALUES ('1', '1', '1'), ('2', '2', '1'), ('3', '1', '2'), ('4', '3', '3');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `r_id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', ' 超级管理员', '001'), ('2', '普通管理员', '002'), ('3', '超级会员', '003'), ('4', '普通会员', '004'), ('5', '普通用户', '005'), ('6', '游客', '006'), ('7', '路人', '007');
COMMIT;

-- ----------------------------
--  Table structure for `role_authorization`
-- ----------------------------
DROP TABLE IF EXISTS `role_authorization`;
CREATE TABLE `role_authorization` (
  `ra_id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `r_id` int(255) unsigned zerofill DEFAULT NULL,
  `f_id` int(255) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`ra_id`),
  KEY `role_authorization_ibfk_1` (`r_id`),
  KEY `role_authorization_ibfk_2` (`f_id`),
  CONSTRAINT `role_authorization_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_authorization_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `function` (`f_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role_authorization`
-- ----------------------------
BEGIN;
INSERT INTO `role_authorization` VALUES ('2', '1', '2'), ('4', '2', '3'), ('7', '3', '4'), ('8', '1', '5'), ('9', '1', '6'), ('10', '1', '7'), ('11', '1', '8');
COMMIT;

-- ----------------------------
--  Table structure for `role_authorization_object`
-- ----------------------------
DROP TABLE IF EXISTS `role_authorization_object`;
CREATE TABLE `role_authorization_object` (
  `rao_id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `ra_id` int(255) unsigned zerofill DEFAULT NULL,
  `do_id` int(255) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`rao_id`),
  KEY `role_authorization_object_ibfk_1` (`ra_id`),
  KEY `role_authorization_object_ibfk_2` (`do_id`),
  CONSTRAINT `role_authorization_object_ibfk_1` FOREIGN KEY (`ra_id`) REFERENCES `role_authorization` (`ra_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_authorization_object_ibfk_2` FOREIGN KEY (`do_id`) REFERENCES `data_object` (`do_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `nickname` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `locked` smallint(255) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `latest_ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', '皮卡丘', 'test1', '1', null, null, null, null, null, null, null, null), ('2', '妙蛙种子', 'test2', '1', null, null, null, null, null, null, null, null), ('3', '喵喵', 'test3', '1', null, null, null, null, null, null, null, null), ('4', '双弹瓦斯', 'test4', '2', null, null, null, null, null, null, null, null), ('6', '幻梦', 'test7', '3', null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `user_identify`
-- ----------------------------
DROP TABLE IF EXISTS `user_identify`;
CREATE TABLE `user_identify` (
  `user_identify_id` int(255) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(255) unsigned zerofill NOT NULL,
  `identifier` varchar(30) NOT NULL,
  `identify_type` int(5) NOT NULL,
  `credential` varchar(250) DEFAULT NULL,
  `salt` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`user_identify_id`),
  KEY `u_id` (`u_id`),
  KEY `u_id_2` (`u_id`),
  KEY `u_id_3` (`u_id`),
  KEY `u_id_4` (`u_id`),
  CONSTRAINT `user_identify_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `ur_id` int(255) unsigned zerofill NOT NULL AUTO_INCREMENT COMMENT '用户角色主键',
  `u_id` int(255) unsigned zerofill DEFAULT NULL,
  `r_id` int(255) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`ur_id`),
  KEY `user_role_ibfk_1` (`u_id`),
  KEY `user_role_ibfk_2` (`r_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user_role`
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES ('1', '1', '1'), ('3', '2', '1'), ('4', '3', '2'), ('5', '4', '3');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
