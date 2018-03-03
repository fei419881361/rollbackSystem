/*
Navicat MySQL Data Transfer

Source Server         : TEST
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : rollcall

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-03 23:15:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for classtable
-- ----------------------------
DROP TABLE IF EXISTS `classtable`;
CREATE TABLE `classtable` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sclass` int(255) NOT NULL,
  `sgrade` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rollcall
-- ----------------------------
DROP TABLE IF EXISTS `rollcall`;
CREATE TABLE `rollcall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `rctime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) NOT NULL,
  `sid` varchar(255) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) NOT NULL DEFAULT '',
  `sex` int(1) NOT NULL DEFAULT '1' COMMENT '男',
  `sclass` int(255) NOT NULL,
  `sgrade` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) NOT NULL,
  `tid` varchar(255) NOT NULL,
  `sex` int(1) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
