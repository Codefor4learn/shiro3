/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50146
Source Host           : localhost:3306
Source Database       : db_shiro2

Target Server Type    : MYSQL
Target Server Version : 50146
File Encoding         : 65001

Date: 2020-11-15 19:57:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_permissions
-- ----------------------------
DROP TABLE IF EXISTS `tb_permissions`;
CREATE TABLE `tb_permissions` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `permission_code` varchar(60) NOT NULL,
  `permission_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_permissions
-- ----------------------------
INSERT INTO `tb_permissions` VALUES ('1', 'sys:c:save', '入库');
INSERT INTO `tb_permissions` VALUES ('2', 'sys:c:delete', '出库');
INSERT INTO `tb_permissions` VALUES ('3', 'sys:c:update', '修改');
INSERT INTO `tb_permissions` VALUES ('4', 'sys:c:find', '查询');
INSERT INTO `tb_permissions` VALUES ('5', 'sys:x:save', '增加订单');
INSERT INTO `tb_permissions` VALUES ('6', 'sys:x:delete', '删除订单');
INSERT INTO `tb_permissions` VALUES ('7', 'sys:x:update', '更新订单');
INSERT INTO `tb_permissions` VALUES ('8', 'sys:x:find', '查询订单');
INSERT INTO `tb_permissions` VALUES ('9', 'sys:k:save', '增加客户');
INSERT INTO `tb_permissions` VALUES ('10', 'sys:k:delete', '删除客户');
INSERT INTO `tb_permissions` VALUES ('11', 'sys:k:update', '更新客户');
INSERT INTO `tb_permissions` VALUES ('12', 'sys:k:find', '查询客户');

-- ----------------------------
-- Table structure for tb_roles
-- ----------------------------
DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE `tb_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(60) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roles
-- ----------------------------
INSERT INTO `tb_roles` VALUES ('1', 'admin');
INSERT INTO `tb_roles` VALUES ('2', 'cmanager');
INSERT INTO `tb_roles` VALUES ('3', 'xmanager');
INSERT INTO `tb_roles` VALUES ('4', 'kmanager');
INSERT INTO `tb_roles` VALUES ('5', 'zmanager');

-- ----------------------------
-- Table structure for tb_rps
-- ----------------------------
DROP TABLE IF EXISTS `tb_rps`;
CREATE TABLE `tb_rps` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_rps
-- ----------------------------
INSERT INTO `tb_rps` VALUES ('2', '1');
INSERT INTO `tb_rps` VALUES ('2', '2');
INSERT INTO `tb_rps` VALUES ('2', '3');
INSERT INTO `tb_rps` VALUES ('2', '4');
INSERT INTO `tb_rps` VALUES ('3', '5');
INSERT INTO `tb_rps` VALUES ('3', '6');
INSERT INTO `tb_rps` VALUES ('3', '7');
INSERT INTO `tb_rps` VALUES ('3', '8');
INSERT INTO `tb_rps` VALUES ('3', '9');
INSERT INTO `tb_rps` VALUES ('3', '10');
INSERT INTO `tb_rps` VALUES ('3', '11');
INSERT INTO `tb_rps` VALUES ('3', '12');
INSERT INTO `tb_rps` VALUES ('4', '9');
INSERT INTO `tb_rps` VALUES ('4', '12');
INSERT INTO `tb_rps` VALUES ('5', '4');
INSERT INTO `tb_rps` VALUES ('5', '8');
INSERT INTO `tb_rps` VALUES ('5', '12');

-- ----------------------------
-- Table structure for tb_urs
-- ----------------------------
DROP TABLE IF EXISTS `tb_urs`;
CREATE TABLE `tb_urs` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_urs
-- ----------------------------
INSERT INTO `tb_urs` VALUES ('1', '1');
INSERT INTO `tb_urs` VALUES ('2', '2');
INSERT INTO `tb_urs` VALUES ('3', '3');
INSERT INTO `tb_urs` VALUES ('4', '4');
INSERT INTO `tb_urs` VALUES ('5', '5');
INSERT INTO `tb_urs` VALUES ('1', '2');
INSERT INTO `tb_urs` VALUES ('1', '3');
INSERT INTO `tb_urs` VALUES ('1', '4');
INSERT INTO `tb_urs` VALUES ('1', '5');

-- ----------------------------
-- Table structure for tb_users
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `password_salt` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_users
-- ----------------------------
INSERT INTO `tb_users` VALUES ('1', 'zs', 'e10adc3949ba59abbe56e057f20f883e', '');
INSERT INTO `tb_users` VALUES ('2', 'ls', 'e10adc3949ba59abbe56e057f20f883e', '');
INSERT INTO `tb_users` VALUES ('3', 'ww', 'e10adc3949ba59abbe56e057f20f883e', '');
INSERT INTO `tb_users` VALUES ('4', 'zl', 'e10adc3949ba59abbe56e057f20f883e', '');
INSERT INTO `tb_users` VALUES ('5', 'cq', 'e10adc3949ba59abbe56e057f20f883e', '');
INSERT INTO `tb_users` VALUES ('6', 'hz', 'e10adc3949ba59abbe56e057f20f883e', '');
INSERT INTO `tb_users` VALUES ('7', 'hzz', 'e10adc3949ba59abbe56e057f20f883e', '');
INSERT INTO `tb_users` VALUES ('8', 'hz2', 'b2ecd5322731bd85ab60b0aa66a69a6c', '');
INSERT INTO `tb_users` VALUES ('9', 'hz3', '25b37c2d3c1384317ba25481ed918e77', 'hz3');
INSERT INTO `tb_users` VALUES ('12', 'hz4', 'eb7bada1187adcedb03b9a4faea60e7e', 'hz4');
