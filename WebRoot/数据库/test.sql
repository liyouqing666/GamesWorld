/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50151
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50151
File Encoding         : 65001

Date: 2017-04-16 14:05:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `game_goods`
-- ----------------------------
DROP TABLE IF EXISTS `game_goods`;
CREATE TABLE `game_goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `goods_price` double(11,0) DEFAULT NULL,
  `goods_info` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `goods_store` int(11) DEFAULT NULL,
  `goods_evaluate` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `goods_score` int(11) DEFAULT NULL,
  `goods_image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `goods_state` int(11) DEFAULT NULL,
  `goods_class` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of game_goods
-- ----------------------------
INSERT INTO `game_goods` VALUES ('5', '5', '5', '5', '500', '5', '5', 'pic.png', '1', '4');
INSERT INTO `game_goods` VALUES ('6', '6', '6', '6', '600', '6', '6', 'pic.png', '1', '4');
INSERT INTO `game_goods` VALUES ('7', '7', '7', '7', '700', '7', '7', 'pic.png', '1', '1');
INSERT INTO `game_goods` VALUES ('8', '8', '8', '8', '800', '8', '8', 'pic.png', '1', '2');
INSERT INTO `game_goods` VALUES ('9', '9', '9', '9', '900', '9', '9', 'pic.png', '1', '3');
INSERT INTO `game_goods` VALUES ('10', '10', '10', '10', '100', '10', '10', 'pic.png', '1', '4');
INSERT INTO `game_goods` VALUES ('11', 'li', '12', 'lsjfljsl', '234', '', '1', '1476340122341.jpg', '1', '2');
INSERT INTO `game_goods` VALUES ('12', 'qqqwqwww', '123', 'lsjfljsl', '500', '', '1', '1476341091327.jpg', '1', '1');
INSERT INTO `game_goods` VALUES ('13', 'wang', '34', 'gggggggg', '340', '', '1', '1476365642397.jpg', '1', '4');
INSERT INTO `game_goods` VALUES ('15', 'tt', '23', 'gggggg', '345', '', '1', '1476367449884.jpg', '1', '3');
INSERT INTO `game_goods` VALUES ('19', 'oowwww', '23', '333', '34', '', '1', '1476494983990.jpg', '1', '2');

-- ----------------------------
-- Table structure for `game_message`
-- ----------------------------
DROP TABLE IF EXISTS `game_message`;
CREATE TABLE `game_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_title` varchar(11) DEFAULT NULL,
  `message_content` varchar(255) DEFAULT NULL,
  `message_user_id` int(11) DEFAULT NULL,
  `message_time` date DEFAULT NULL,
  `message_type` varchar(255) DEFAULT NULL,
  `message_admin_reply` varchar(255) DEFAULT NULL,
  `message_is_solve` int(11) DEFAULT NULL,
  `message_is_show` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  KEY `fk_message_userid` (`message_user_id`),
  CONSTRAINT `fk_message_userid` FOREIGN KEY (`message_user_id`) REFERENCES `game_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='message_title   varchar\r\n\r\nmessage_time date';

-- ----------------------------
-- Records of game_message
-- ----------------------------

-- ----------------------------
-- Table structure for `game_order`
-- ----------------------------
DROP TABLE IF EXISTS `game_order`;
CREATE TABLE `game_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` int(11) DEFAULT NULL,
  `order_state` int(11) DEFAULT NULL,
  `order_time` date DEFAULT NULL,
  `order_total` double(50,0) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of game_order
-- ----------------------------
INSERT INTO `game_order` VALUES ('36', '1', '3', '2016-10-10', '4', 'ww', '123', 'gg', '11');
INSERT INTO `game_order` VALUES ('37', '1', '2', '2016-10-10', '12', 'ww', '123', 'gg', '11');
INSERT INTO `game_order` VALUES ('39', '1', '1', '2016-10-11', '2', 'ww', '123', 'gg', '11');
INSERT INTO `game_order` VALUES ('40', '1', '1', '2016-10-11', '2', 'ww', '123', 'gg', '11');
INSERT INTO `game_order` VALUES ('53', '1', '1', '2016-10-11', '2', 'ww', '123', 'gg', '11');
INSERT INTO `game_order` VALUES ('54', '1', '1', '2016-10-11', '14', 'ww', '123', 'gg', '11');
INSERT INTO `game_order` VALUES ('55', '1', '1', '2016-10-11', '6', 'ww', '123', 'gg', '11');
INSERT INTO `game_order` VALUES ('56', '1', '1', '2016-10-11', '7', 'ww', '123', 'gg', '11');
INSERT INTO `game_order` VALUES ('57', '1', '1', '2016-10-11', '7', 'ww', '123', 'gg', '11');
INSERT INTO `game_order` VALUES ('58', '1', '1', '2016-10-11', '7', 'ww', '123', 'gg', '11');
INSERT INTO `game_order` VALUES ('59', '1', '1', '2016-10-12', '9', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('60', '1', '1', '2016-10-12', '6', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('61', '1', '1', '2016-10-12', '17', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('62', '1', '1', '2016-10-12', '7', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('63', '1', '1', '2016-10-12', '8', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('64', '1', '1', '2016-10-12', '2', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('65', '1', '1', '2016-10-13', '3', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('66', '1', '1', '2016-10-14', '6', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('67', '1', '1', '2016-10-14', '141', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('68', '1', '1', '2016-10-15', '5', 'tttt', '1234567', 'hhhhhhh', '14');
INSERT INTO `game_order` VALUES ('69', '1', '1', '2016-10-15', '28', 'hhhh', '1234567', 'hhhhhhh', '14');
INSERT INTO `game_order` VALUES ('70', '1', '1', '2016-10-15', '135', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('71', '1', '1', '2016-10-29', '9', 'test2', '4567', '123', '12');
INSERT INTO `game_order` VALUES ('72', '1', '1', '2016-12-11', '9', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('73', '1', '1', '2016-12-26', '10', 'test1', '1234567', '123', '1');
INSERT INTO `game_order` VALUES ('74', '1', '1', '2017-04-06', '453', 'test1', '1234567', '123', '1');

-- ----------------------------
-- Table structure for `game_order2`
-- ----------------------------
DROP TABLE IF EXISTS `game_order2`;
CREATE TABLE `game_order2` (
  `order2_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` double(50,0) DEFAULT NULL,
  `total` double(50,0) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`order2_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of game_order2
-- ----------------------------
INSERT INTO `game_order2` VALUES ('14', '22', '1', '1', '1', '1');
INSERT INTO `game_order2` VALUES ('15', '33', '1', '1', '1', '1');
INSERT INTO `game_order2` VALUES ('16', '33', '1', '1', '1', '1');
INSERT INTO `game_order2` VALUES ('20', '36', '1', '6', '6', 'pic.png');
INSERT INTO `game_order2` VALUES ('21', '36', '1', '6', '6', 'pic.png');
INSERT INTO `game_order2` VALUES ('22', '36', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('23', '37', '1', '6', '6', 'pic.png');
INSERT INTO `game_order2` VALUES ('24', '37', '1', '3', '3', 'pic.png');
INSERT INTO `game_order2` VALUES ('25', '37', '1', '3', '3', 'pic.png');
INSERT INTO `game_order2` VALUES ('26', '39', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('27', '40', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('28', '41', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('29', '42', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('30', '43', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('31', '44', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('32', '45', '1', '3', '3', 'pic.png');
INSERT INTO `game_order2` VALUES ('33', '46', '1', '3', '3', 'pic.png');
INSERT INTO `game_order2` VALUES ('34', '47', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('35', '47', '1', '7', '7', 'pic.png');
INSERT INTO `game_order2` VALUES ('36', '48', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('37', '49', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('38', '49', '1', '3', '3', 'pic.png');
INSERT INTO `game_order2` VALUES ('39', '50', '1', '3', '3', 'pic.png');
INSERT INTO `game_order2` VALUES ('40', '51', '1', '3', '3', 'pic.png');
INSERT INTO `game_order2` VALUES ('42', '53', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('43', '54', '1', '7', '7', 'pic.png');
INSERT INTO `game_order2` VALUES ('44', '54', '1', '7', '7', 'pic.png');
INSERT INTO `game_order2` VALUES ('45', '55', '1', '6', '6', 'pic.png');
INSERT INTO `game_order2` VALUES ('46', '56', '1', '7', '7', 'pic.png');
INSERT INTO `game_order2` VALUES ('47', '57', '1', '7', '7', 'pic.png');
INSERT INTO `game_order2` VALUES ('48', '58', '1', '7', '7', 'pic.png');
INSERT INTO `game_order2` VALUES ('49', '59', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('50', '59', '1', '7', '7', 'pic.png');
INSERT INTO `game_order2` VALUES ('51', '60', '1', '6', '6', 'pic.png');
INSERT INTO `game_order2` VALUES ('52', '61', '1', '7', '7', 'pic.png');
INSERT INTO `game_order2` VALUES ('53', '61', '1', '4', '4', 'pic.png');
INSERT INTO `game_order2` VALUES ('54', '61', '1', '6', '6', 'pic.png');
INSERT INTO `game_order2` VALUES ('55', '62', '1', '7', '7', 'pic.png');
INSERT INTO `game_order2` VALUES ('56', '63', '1', '6', '6', 'pic.png');
INSERT INTO `game_order2` VALUES ('57', '63', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('58', '64', '1', '2', '2', 'pic.png');
INSERT INTO `game_order2` VALUES ('59', '65', '1', '3', '3', 'pic.png');
INSERT INTO `game_order2` VALUES ('60', '66', '1', '6', '6', 'pic.png');
INSERT INTO `game_order2` VALUES ('61', '67', '1', '4', '4', 'pic.png');
INSERT INTO `game_order2` VALUES ('62', '67', '1', '8', '8', 'pic.png');
INSERT INTO `game_order2` VALUES ('63', '67', '1', '123', '123', '1476341091327.jpg');
INSERT INTO `game_order2` VALUES ('64', '67', '1', '6', '6', 'pic.png');
INSERT INTO `game_order2` VALUES ('65', '68', '1', '5', '5', 'pic.png');
INSERT INTO `game_order2` VALUES ('66', '69', '1', '5', '5', 'pic.png');
INSERT INTO `game_order2` VALUES ('67', '69', '1', '23', '23', '1476367449884.jpg');
INSERT INTO `game_order2` VALUES ('68', '70', '1', '12', '12', '1476340122341.jpg');
INSERT INTO `game_order2` VALUES ('69', '70', '1', '123', '123', '1476341091327.jpg');
INSERT INTO `game_order2` VALUES ('70', '71', '1', '5', '5', 'pic.png');
INSERT INTO `game_order2` VALUES ('71', '71', '1', '4', '4', 'pic.png');
INSERT INTO `game_order2` VALUES ('72', '72', '1', '9', '9', 'pic.png');
INSERT INTO `game_order2` VALUES ('73', '73', '1', '10', '10', 'pic.png');
INSERT INTO `game_order2` VALUES ('74', '74', '13', '34', '442', '1476365642397.jpg');
INSERT INTO `game_order2` VALUES ('75', '74', '1', '6', '6', 'pic.png');
INSERT INTO `game_order2` VALUES ('76', '74', '1', '5', '5', 'pic.png');

-- ----------------------------
-- Table structure for `game_shopping`
-- ----------------------------
DROP TABLE IF EXISTS `game_shopping`;
CREATE TABLE `game_shopping` (
  `shopp_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `shopp_num` int(11) DEFAULT NULL,
  `shopp_price` double(11,0) DEFAULT NULL,
  `shopp_total` double(11,0) DEFAULT NULL,
  `shopp_image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`shopp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='wo gai le  ';

-- ----------------------------
-- Records of game_shopping
-- ----------------------------
INSERT INTO `game_shopping` VALUES ('8', '2', '1', '2', '2', 'pic.png', '11');
INSERT INTO `game_shopping` VALUES ('9', '2', '1', '2', '2', 'pic.png', '11');

-- ----------------------------
-- Table structure for `game_user`
-- ----------------------------
DROP TABLE IF EXISTS `game_user`;
CREATE TABLE `game_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `qq` int(11) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `tel` int(20) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of game_user
-- ----------------------------
INSERT INTO `game_user` VALUES ('1', 'test1', '123', 'test1', '835253723@qq.com', '12', '123', '1234567', '0');
INSERT INTO `game_user` VALUES ('2', 'admin', '123', 'admin', '123@qq.com', '12345', '12345', '12345678', '1');
INSERT INTO `game_user` VALUES ('3', 'ttttttttt', '123456q', 'rrrrrrrrrrrrrrrr', '123@qq.com', '12', 'tttttttt', '122344', '0');
INSERT INTO `game_user` VALUES ('4', 'aaa', '123', 'aaa', '835253723@qq.com', '123', 'yyy', '12345', '0');
INSERT INTO `game_user` VALUES ('5', 'bbb', '123', 'bbb', '835253723@qq.com', '1234', 'bbb', '12345', '0');
INSERT INTO `game_user` VALUES ('6', 'rrr', '123', 'ggg', '835253723@qq.com', '1234', 'tttt', '12345', '0');
INSERT INTO `game_user` VALUES ('7', 'eeee', '123', 'rrrr', '835253723@qq.com', '3456', 'ttt', '1234', '0');
INSERT INTO `game_user` VALUES ('8', 'www', '123', 'eeee', '835253723@qq.com', '2345', 'www', '12345', '0');
INSERT INTO `game_user` VALUES ('9', 'ddd', '123', 'ddd', '835253723@qq.com', '5678', 'vvv', '1234', '0');
INSERT INTO `game_user` VALUES ('10', 'sss', '123', 'sss', '835253723@qq.com', '1234', 'dddd', '3456', null);
INSERT INTO `game_user` VALUES ('11', 'admi', 'lyq1234', 'ttttttt', '123@qq.com', '12', 'hhhhhhh', '1234567', '0');
INSERT INTO `game_user` VALUES ('12', 'test2', '123', 'test2', '835253723@qq.com', '12', '123', '4567', '0');
INSERT INTO `game_user` VALUES ('13', 'test3', '123', 'test3', '835253723@qq.com', '12', '123', '7890', '0');
INSERT INTO `game_user` VALUES ('14', 'ggg', 'lyq1234', 'hhhh', '123@qq.com', '12', 'hhhhhhh', '1234567', '0');

-- ----------------------------
-- Table structure for `jifenbiao`
-- ----------------------------
DROP TABLE IF EXISTS `jifenbiao`;
CREATE TABLE `jifenbiao` (
  `id` varchar(255) DEFAULT NULL,
  `jifen` varchar(255) DEFAULT NULL,
  `lastjifen` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of jifenbiao
-- ----------------------------
INSERT INTO `jifenbiao` VALUES ('1', '1', '0', '1');
INSERT INTO `jifenbiao` VALUES ('2', '5', '0', '5');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `age_index` (`age`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('2', '5', '1', '1');
INSERT INTO `student` VALUES ('4', '5', '6', '1');
INSERT INTO `student` VALUES ('6', '1', '1', '1');
INSERT INTO `student` VALUES ('25', '4', '5', '6');

-- ----------------------------
-- Table structure for `stu_info`
-- ----------------------------
DROP TABLE IF EXISTS `stu_info`;
CREATE TABLE `stu_info` (
  `stu_no` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `stu_gender` varchar(10) DEFAULT NULL,
  `stu_age` int(11) DEFAULT NULL,
  PRIMARY KEY (`stu_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of stu_info
-- ----------------------------
INSERT INTO `stu_info` VALUES ('1', 'gg', 'a', '11');
INSERT INTO `stu_info` VALUES ('2', 'jj', 'j', '34');

-- ----------------------------
-- Procedure structure for `aa`
-- ----------------------------
DROP PROCEDURE IF EXISTS `aa`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `aa`()
BEGIN
select * from student;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `getnames`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getnames`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getnames`()
BEGIN  
  declare cur1 cursor for select * from student;  
  declare cur2 cursor for select * from stu_info;  
  open cur1;  
  open cur2;  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `gg`
-- ----------------------------
DROP PROCEDURE IF EXISTS `gg`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `gg`(in tt VARCHAR(5),out gg VARCHAR(5))
BEGIN

set gg=tt*1+1;
 insert into stu_info set stu_no=gg;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `p_jifen`
-- ----------------------------
DROP PROCEDURE IF EXISTS `p_jifen`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_jifen`()
BEGIN
    update jifenbiao set num=lastjifen,lastjifen=jifen,jifen=num ;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `yy_b`
-- ----------------------------
DROP PROCEDURE IF EXISTS `yy_b`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `yy_b`()
BEGIN

DECLARE  gg  VARCHAR(50);

set gg=(select id  from student limit 0,1);
select gg;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `bb`
-- ----------------------------
DROP FUNCTION IF EXISTS `bb`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `bb`(pp int ) RETURNS int(11)
BEGIN

	return (pp);
end
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `myFunction`
-- ----------------------------
DROP FUNCTION IF EXISTS `myFunction`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `myFunction`(in_string      VARCHAR(255),
         in_find_str    VARCHAR(20),
        in_repl_str    VARCHAR(20)) RETURNS varchar(255) CHARSET latin1
BEGIN
      DECLARE l_new_string VARCHAR(255);
      DECLARE l_find_pos   INT;
    
       SET l_find_pos=INSTR(in_string,in_find_str);
    
       IF (l_find_pos>0) THEN
         SET l_new_string=INSERT(in_string,l_find_pos,LENGTH(in_find_str),in_repl_str);
       ELSE
         SET l_new_string=in_string;
      END IF;
       RETURN(l_new_string);
    
     END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `p_test`
-- ----------------------------
DROP EVENT IF EXISTS `p_test`;
DELIMITER ;;
CREATE EVENT `p_test` ON SCHEDULE EVERY 10 SECOND STARTS '2017-01-11 10:40:02' ON COMPLETION PRESERVE ENABLE DO call p_jifen()
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `tri_hg`;
DELIMITER ;;
CREATE TRIGGER `tri_hg` AFTER INSERT ON `student` FOR EACH ROW BEGIN


END
;;
DELIMITER ;
