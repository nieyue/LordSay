/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : lord_say_db

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-03-30 18:12:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account_level_tb`
-- ----------------------------
DROP TABLE IF EXISTS `account_level_tb`;
CREATE TABLE `account_level_tb` (
  `account_level_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账户等级id',
  `name` varchar(255) DEFAULT NULL COMMENT '等级名',
  `level` tinyint(4) DEFAULT '0' COMMENT '等级,默认是0，数字越大，等级越高',
  `img_address` varchar(255) DEFAULT NULL COMMENT '等级图片',
  `team_purchase_price` decimal(11,2) DEFAULT '0.00' COMMENT '团购金额',
  `recommend_commission` decimal(11,2) DEFAULT '0.00' COMMENT '推荐佣金,默认是0表示不是推荐，无佣金',
  `split_reward` decimal(11,2) DEFAULT '0.00' COMMENT '拆分奖励',
  `split_parent_reward` decimal(11,2) DEFAULT '0.00' COMMENT '拆分上级奖励',
  `split_platform_reward` decimal(11,2) DEFAULT '0.00' COMMENT '拆分平台奖励',
  `number` int(11) DEFAULT NULL COMMENT 'VIP名额，默认为0表示没有',
  `discount_price` decimal(11,2) DEFAULT '0.00' COMMENT '优惠价格',
  `total_price` decimal(11,2) DEFAULT '0.00' COMMENT '总价值',
  `mark` varchar(255) DEFAULT NULL COMMENT '备注（权益）',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`account_level_id`),
  KEY `INDEX_LEVEL` (`level`) USING BTREE,
  KEY `INDEX_TEAMPURCHASEPRICE` (`team_purchase_price`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8 COMMENT='等级表';

-- ----------------------------
-- Records of account_level_tb
-- ----------------------------
INSERT INTO `account_level_tb` VALUES ('1001', '学徒', '0', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5ia0rd21952ll8m74o9h9hr1t.png', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '学徒，浏览，互动，购买产品，升级vip', '2018-02-05 14:21:36');
INSERT INTO `account_level_tb` VALUES ('1002', '普通vip', '1', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '18.25', '146.00', '91.25', '109.50', '0', '0.00', '365.00', '普通vip，团购权限，推广权益，免费看所有视频（不含售卖视频）', '2018-02-05 13:55:13');
INSERT INTO `account_level_tb` VALUES ('1003', '钻石vip', '2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8j4o210nm1ip459l127t1gt219.png', '4500.00', '225.00', '1800.00', '1125.00', '1350.00', '39', '115.00', '14235.00', '钻石vip,团购权限，推广权益，免费看所有视频（不含售卖视频），分成', '2018-02-05 13:56:36');
INSERT INTO `account_level_tb` VALUES ('1004', '联合发起人', '3', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8jh02bes1eje8d6nm91ei71e.png', '25000.00', '1250.00', '10000.00', '6250.00', '7500.00', '250', '100.00', '91250.00', '联合发起人，团购权限，推广权益，免费看所有视频（不含售卖视频），分成', '2018-02-05 13:56:48');
INSERT INTO `account_level_tb` VALUES ('1005', '高级合伙人', '4', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8k44510dn1sgvr1usb1gcb1j.png', '65000.00', '3250.00', '26000.00', '16250.00', '19500.00', '738', '88.00', '269370.00', '高级合伙人，团购权限，推广权益，免费看所有视频（不含售卖视频），分成，有机会与平台合作红利', '2018-02-05 13:57:09');
INSERT INTO `account_level_tb` VALUES ('1006', '创始股东', '5', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8kd03sljbdd1f5oq9311pf1o.png', '195000.00', '9750.00', '78000.00', '48750.00', '58500.00', '2475', '80.00', '903375.00', '创始股东，团购权限，推广权益，免费看所有视频（不含售卖视频），分成，与平台合作红利。', '2018-02-05 13:57:17');

-- ----------------------------
-- Table structure for `account_parent_tb`
-- ----------------------------
DROP TABLE IF EXISTS `account_parent_tb`;
CREATE TABLE `account_parent_tb` (
  `account_parent_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账户上级id',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `subordinate_number` int(11) DEFAULT NULL COMMENT '学员数',
  `master_id` int(11) DEFAULT NULL COMMENT '直接上级id',
  `real_master_id` int(11) DEFAULT NULL COMMENT '真实上级id',
  `account_level_id` int(11) DEFAULT NULL COMMENT '账户等级id',
  `name` varchar(255) DEFAULT NULL COMMENT '等级名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`account_parent_id`),
  KEY `INDEX_AOCUNTLEVELID` (`account_level_id`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_MASTERID` (`master_id`) USING BTREE,
  KEY `INDEX_REALMASTERID` (`real_master_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8 COMMENT='账户上级表';

-- ----------------------------
-- Records of account_parent_tb
-- ----------------------------
INSERT INTO `account_parent_tb` VALUES ('1001', '1009', '谢威', '17702183918', '3', '1000', '1000', '1004', '联合发起人', '2018-01-27 18:21:05', '2018-02-24 18:00:04');
INSERT INTO `account_parent_tb` VALUES ('1002', '1010', '舒靖宇', '15211547807', '1', '1000', '1000', '1004', '联合发起人', '2018-02-04 20:28:28', '2018-03-13 16:47:59');
INSERT INTO `account_parent_tb` VALUES ('1004', '1000', '聂跃', '15111336587', '5', null, null, '1006', '创始股东', '2018-02-05 13:13:47', '2018-02-05 13:13:52');
INSERT INTO `account_parent_tb` VALUES ('1005', '1011', null, '15111336586', '0', '1000', '1000', '1001', '学徒', '2018-02-06 16:39:35', '2018-02-06 16:39:35');
INSERT INTO `account_parent_tb` VALUES ('1006', '1012', '啦啦啦', '15674830902', '0', '1009', '1009', '1001', '学徒', '2018-03-12 10:30:47', '2018-03-12 10:30:47');
INSERT INTO `account_parent_tb` VALUES ('1007', '1014', '普通vip', '18774814879', '0', '1010', '1000', '1002', '学徒', '2018-02-10 13:23:05', '2018-02-10 13:59:05');
INSERT INTO `account_parent_tb` VALUES ('1008', '1013', '舒靖宇', '17388964490', '0', '1000', '1000', '1001', '学徒', '2018-02-24 13:07:55', '2018-02-24 13:07:55');
INSERT INTO `account_parent_tb` VALUES ('1009', '1015', null, '17767094985', '0', '1000', '1000', '1001', '学徒', '2018-02-22 16:43:03', '2018-02-22 16:43:03');
INSERT INTO `account_parent_tb` VALUES ('1010', '1016', '测试', '15068747539', '4', '1000', '1000', '1001', '学徒', '2018-03-05 15:57:08', '2018-03-05 15:57:08');
INSERT INTO `account_parent_tb` VALUES ('1011', '1017', null, '18606713507', '0', '1016', '1016', '1001', '学徒', '2018-02-28 17:54:43', '2018-02-28 17:54:43');
INSERT INTO `account_parent_tb` VALUES ('1012', '1018', null, '13958060769', '0', '1016', '1016', '1001', '学徒', '2018-03-01 13:23:55', '2018-03-01 13:23:55');
INSERT INTO `account_parent_tb` VALUES ('1013', '1019', '王小明', '18300700235', '0', '1009', '1009', '1001', '学徒', '2018-03-13 09:51:10', '2018-03-13 09:51:10');
INSERT INTO `account_parent_tb` VALUES ('1014', '1020', null, '15168318364', '0', '1016', '1016', '1001', '学徒', '2018-03-13 16:20:27', '2018-03-13 16:20:27');
INSERT INTO `account_parent_tb` VALUES ('1015', '1021', null, '13588328250', '0', '1016', '1016', '1001', '学徒', '2018-03-27 14:27:41', '2018-03-27 14:27:41');

-- ----------------------------
-- Table structure for `account_tb`
-- ----------------------------
DROP TABLE IF EXISTS `account_tb`;
CREATE TABLE `account_tb` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '账户id',
  `sign` varchar(255) DEFAULT NULL COMMENT '签名',
  `phone` varchar(255) DEFAULT NULL COMMENT '注册手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '联系手机号，可以任意修改',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图像',
  `sex` tinyint(4) DEFAULT '0' COMMENT '性别,默认为0未知，为1男性，为2女性',
  `age` tinyint(4) DEFAULT NULL COMMENT '年龄',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `email` varchar(255) DEFAULT NULL COMMENT 'email',
  `auth` tinyint(4) DEFAULT NULL COMMENT '认证，0没认证，1审核中，2已认证',
  `identity_cards` varchar(255) DEFAULT NULL COMMENT '身份证',
  `identity_cards_front_img` varchar(255) DEFAULT NULL COMMENT '身份证正面',
  `identity_cards_back_img` varchar(255) DEFAULT NULL COMMENT '身份证反面',
  `wechat` varchar(255) DEFAULT NULL COMMENT '微信号',
  `alipay` varchar(255) DEFAULT NULL COMMENT '支付宝账号',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `login_date` datetime DEFAULT NULL COMMENT '登陆时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，默认0正常，1锁定，2，异常',
  `master_id` int(11) DEFAULT NULL COMMENT '直接上级id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id外键',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`account_id`),
  KEY `INDEX_AUTH` (`auth`) USING BTREE,
  KEY `INDEX_PHONE` (`phone`) USING BTREE,
  KEY `INDEX_REALNAME` (`realname`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_LOGINDATE` (`login_date`) USING BTREE,
  KEY `INDEX_ROLEID` (`role_id`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Records of account_tb
-- ----------------------------
INSERT INTO `account_tb` VALUES ('1000', '路路通', '15111336587', '11874bb6149dd45428da628c9766b252', null, '聂跃2', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180327135737', '1', '14', null, '湖南省', '长沙市', null, '278076304@qq.com', null, null, null, null, '123456', '考虑', '2018-01-19 15:46:08', '2018-03-30 17:54:05', '0', null, '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1009', '新婆婆婆婆师兄弟帝王将相洗衣机维修', '17702183918', '11874bb6149dd45428da628c9766b252', '', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533', '1', '25', '', '北京市', '安徽省-安庆市', '谢威', '', '2', '136494946469476', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180204154022', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180204154038', '', '', '2018-01-27 18:21:05', '2018-03-28 10:24:03', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1010', '-/:;()', '15211547807', '11874bb6149dd45428da628c9766b252', null, '', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1520863161.png', '2', '25', null, '湖北省', '武汉市', '舒靖宇', null, '2', '123456', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517747286.png', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517747301.png', '147852369', 'gmjgdpg123', '2018-01-27 20:23:22', '2018-03-28 09:19:23', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1011', 'safsdafdsf', '15111336586', '0ce6e1b70c8a0c7b88b2a0c543f3aeb7', '15111336586', '搞事情', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5l472v92qo1849k1h1jec1d6g7v.png', '1', '10', '中国', '湖南省', '长沙市', 'sfdsf', '232@gfdgf.bg', '2', '123123123213123', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5l495bc2eqsgf1l6g1l2e1b1d84.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5l49rul2nc1gtb1m1m1k861peo89.png', 'dsf', 'sdfsdf', '2018-02-06 16:39:35', '2018-02-22 13:29:08', '2', '1000', '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1012', '就继续桐木', '15674830902', '11874bb6149dd45428da628c9766b252', '', 'LOL哦咯', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180207011738', '1', '26', '', '天津市', '天津市', '啦啦啦', '', '1', '125466464664647', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180312102954', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180312103028', '', '', '2018-02-07 01:15:45', '2018-03-16 16:47:27', '0', '1009', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1013', null, '17388964490', '11874bb6149dd45428da628c9766b252', '17388964490', null, null, null, null, null, null, null, '舒靖宇', null, '1', '431224199204051234', 'http://p2bhwwngu.bkt.clouddn.com/ios_1013_1519448824.png', 'http://p2bhwwngu.bkt.clouddn.com/ios_1013_1519448838.png', null, null, '2018-02-10 13:13:19', '2018-03-05 17:25:30', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1014', '', '18774814879', '0ce6e1b70c8a0c7b88b2a0c543f3aeb7', '18774814879', 'vvcc', '', null, null, '', '', '', '小胖子', '', '1', '987654321', 'http://p2bhwwngu.bkt.clouddn.com/ios_1014_1518240172.png', 'http://p2bhwwngu.bkt.clouddn.com/ios_1014_1518240182.png', '有点', '154554', '2018-02-10 13:19:45', '2018-03-16 21:14:46', '0', '1010', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1015', '哈哈法国红酒', '17767094985', '96fa69e75d86e7acdded21448de3a7a3', '17767094985', 'LOKCK', '', '1', '2', '', '', '吉林省-松原市', '', '', '0', '', '', '', '', '', '2018-02-22 16:43:03', '2018-03-27 13:46:45', '0', '1000', '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1016', 'Cessation ', '15068747539', '11874bb6149dd45428da628c9766b252', '15068747539', '', 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1522142869.png', '1', '23', '', '内蒙古自治区', '呼和浩特市', '测试', '', '2', '1234564899887789663111478889877786668887788', 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1520236614.png', 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1520236622.png', 'yymiancheng', '', '2018-02-23 14:07:13', '2018-03-27 15:29:23', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1017', null, '18606713507', '11874bb6149dd45428da628c9766b252', '18606713507', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-02-28 17:54:43', '2018-03-28 13:32:47', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1018', null, '13958060769', '11874bb6149dd45428da628c9766b252', '13958060769', null, 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180313162550', null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-03-01 13:23:55', '2018-03-27 15:23:15', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1019', null, '18300700235', '11874bb6149dd45428da628c9766b252', '18300700235', null, null, null, null, null, null, null, '王小明', null, '1', '410111111111111111', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180313095053', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180313095106', null, null, '2018-03-13 09:49:12', '2018-03-29 11:03:14', '0', '1009', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1020', null, '15168318364', '51781fefc1cb8b7bbb0a890e1b6a79cf', '15168318364', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-03-13 16:20:27', '2018-03-13 16:20:27', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1021', null, '13588328250', '11874bb6149dd45428da628c9766b252', '13588328250', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-03-27 14:27:41', '2018-03-27 14:27:41', '0', '1016', '1001', '用户');

-- ----------------------------
-- Table structure for `app_version_tb`
-- ----------------------------
DROP TABLE IF EXISTS `app_version_tb`;
CREATE TABLE `app_version_tb` (
  `app_version_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'app版本id',
  `platform` tinyint(4) DEFAULT NULL COMMENT 'app平台，默认0安卓，1为IOS',
  `name` varchar(255) DEFAULT NULL COMMENT 'app版本名',
  `type` tinyint(4) DEFAULT '0' COMMENT 'app类型，默认0普通，1为强制',
  `content` varchar(255) DEFAULT NULL COMMENT 'app更新内容',
  `link` varchar(255) DEFAULT NULL COMMENT 'app版本链接',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) DEFAULT NULL COMMENT 'app状态，默认0上线，1为未上线',
  PRIMARY KEY (`app_version_id`),
  KEY `INDEX_PLATFORM` (`platform`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8 COMMENT='app版本表';

-- ----------------------------
-- Records of app_version_tb
-- ----------------------------
INSERT INTO `app_version_tb` VALUES ('1006', '0', '1.0', '0', 'sdf', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5kj83gl1b7kviik4u19mvlish.png', '2018-02-09 14:07:41', '0');
INSERT INTO `app_version_tb` VALUES ('1007', '0', '1.0', '0', 'sdf', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5kj8tnt5pdf453l8oa61daum.png', '2018-02-09 14:07:35', '0');

-- ----------------------------
-- Table structure for `article_cate_tb`
-- ----------------------------
DROP TABLE IF EXISTS `article_cate_tb`;
CREATE TABLE `article_cate_tb` (
  `article_cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章类型id',
  `name` varchar(255) DEFAULT NULL COMMENT '文章类型名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`article_cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8 COMMENT='文章类型表';

-- ----------------------------
-- Records of article_cate_tb
-- ----------------------------
INSERT INTO `article_cate_tb` VALUES ('1000', '个性推荐', '2018-01-23 14:44:48');
INSERT INTO `article_cate_tb` VALUES ('1001', '课程', '2018-02-22 17:44:54');
INSERT INTO `article_cate_tb` VALUES ('1002', '微专业', '2018-02-02 08:59:45');
INSERT INTO `article_cate_tb` VALUES ('1005', '测试分类', '2018-03-27 15:16:20');

-- ----------------------------
-- Table structure for `article_comment_tb`
-- ----------------------------
DROP TABLE IF EXISTS `article_comment_tb`;
CREATE TABLE `article_comment_tb` (
  `article_comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章评论id',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `point_number` int(11) DEFAULT '0' COMMENT '点赞数',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `article_id` int(11) DEFAULT NULL COMMENT '文章id外键',
  `account_id` int(11) DEFAULT NULL COMMENT '评论人id外键',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图像',
  PRIMARY KEY (`article_comment_id`),
  KEY `INDEX_POINTNUMBER` (`point_number`) USING BTREE,
  KEY `INDEX_ARTICLEID` (`article_id`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

-- ----------------------------
-- Records of article_comment_tb
-- ----------------------------
INSERT INTO `article_comment_tb` VALUES ('3', '真有意思啊', '1', '2018-01-29 16:02:37', '4', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('4', '还能好好玩耍不\n', '4', '2018-01-29 16:03:07', '4', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('5', '撒旦飞洒地方', '0', '2018-01-29 16:08:18', '3', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('6', '十大法师的', '1', '2018-01-29 16:08:21', '3', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('7', '士大夫', '1', '2018-01-29 16:08:35', '2', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('8', '你以为所以我现在1', '0', '2018-02-02 00:51:47', '3', '1009', '啦啦啦啦', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('9', '聊几句V53', '0', '2018-02-02 00:54:54', '4', '1009', '啦啦啦啦', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('10', '你想让我庸人自扰之', '2', '2018-02-02 01:54:55', '2', '1009', '啦啦啦啦', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('11', '5句我自己', '1', '2018-02-03 01:46:15', '3', '1009', '我会注意', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('12', 'ggvv记录', '1', '2018-02-07 00:48:20', '4', '1009', '我会注意', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('13', '呵呵', '2', '2018-02-08 16:43:14', '2', '1009', '我会注意', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('15', '我的生活就是一个劲在别人看来很大关系人的问题，我的人生就是一个', '2', '2018-02-09 21:12:30', '2', '1010', null, null);
INSERT INTO `article_comment_tb` VALUES ('16', '我的人生就是一个人和事物的人生态度，我的人生就是一个人和事物的人生态度，我的人生就是一个人和事', '2', '2018-02-09 21:23:16', '2', '1010', '123', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png');
INSERT INTO `article_comment_tb` VALUES ('17', '破给名字呀，你的人生态度就是这样吧。我们都在一起的时候我就不去了。我', '3', '2018-02-09 21:24:03', '2', '1010', '123', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png');
INSERT INTO `article_comment_tb` VALUES ('18', '龙', '2', '2018-02-22 16:33:02', '3', '1000', '聂跃', 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('19', '啦啦啦', '2', '2018-02-22 20:13:43', '4', '1009', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('20', 'N97一些事一些情庸人自扰之XP密钥嘻嘻嘻嘻一下星期一休息嘻嘻嘻嘻在上自习一心一意一样一样噢你嘻嘻嘻', '2', '2018-02-22 20:14:09', '4', '1009', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('21', '知心', '0', '2018-02-24 10:22:35', '5', '1009', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('22', '后悔', '1', '2018-02-24 10:22:52', '5', '1009', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('23', '狗狗', '5', '2018-02-24 15:40:43', '10', '1000', '聂跃', 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('24', '好感动……', '2', '2018-02-24 23:48:05', '8', '1000', '聂跃', 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('25', '可怕', '3', '2018-02-25 12:55:43', '9', '1000', '聂跃', 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('26', '6666666', '4', '2018-02-27 21:31:15', '9', '1009', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('27', '对的。', '4', '2018-03-01 14:07:36', '10', '1009', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('28', '测试', '2', '2018-03-05 15:52:11', '9', '1009', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('29', '测试', '3', '2018-03-05 15:52:27', '9', '1009', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('30', '测试', '3', '2018-03-05 15:53:44', '5', '1009', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('31', '测试', '11', '2018-03-05 15:54:42', '10', '1016', '大白嗯哼', 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1519366739.png');
INSERT INTO `article_comment_tb` VALUES ('33', '加急', '3', '2018-03-13 16:56:19', '8', '1000', '聂跃1', 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('34', '回家睡觉计算机三级见识见识就说你呢实话实说都很好的还不到好的好的比较喜欢加到几点几点回家独具匠心家电家具都好都好简单机械不是的话大好河山你带回家小虎还乡吉祥混沌就觉得不是很熟还打不打还很喜欢小虎还乡回电话都很好的忽上忽下好想好好说好的好好的呢哈哈哈小虎还乡还很喜欢啥时候睡说的很好都好好的', '2', '2018-03-13 16:56:58', '8', '1000', '聂跃1', 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('35', '123456', '4', '2018-03-13 17:10:53', '10', '1016', '大白嗯哼', 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1520929499.png');
INSERT INTO `article_comment_tb` VALUES ('36', '转网', '0', '2018-03-15 19:20:00', '10', '1000', '聂跃1', 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('40', '5卡图图他', '0', '2018-03-16 10:49:08', '10', '1012', 'LOL哦咯', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180207011738');
INSERT INTO `article_comment_tb` VALUES ('44', '测试', '0', '2018-03-26 16:46:01', '10', '1016', 'ceshi', 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1520929499.png');
INSERT INTO `article_comment_tb` VALUES ('46', '计算机技术', '0', '2018-03-27 13:58:59', '6', '1000', '聂跃2', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180327135737');
INSERT INTO `article_comment_tb` VALUES ('47', 'gggg ', '0', '2018-03-27 14:45:07', '6', '1016', '', 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1520929499.png');
INSERT INTO `article_comment_tb` VALUES ('48', 'ddfd', '1', '2018-03-27 15:22:06', '11', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('50', 'dd', '0', '2018-03-27 15:23:27', '6', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('51', 'fdd', '0', '2018-03-27 15:23:39', '6', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('52', 'dffff', '1', '2018-03-27 15:24:04', '11', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('53', 'dddd', '0', '2018-03-27 15:24:25', '6', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('54', 'zxxxd', '0', '2018-03-27 15:26:22', '7', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('55', ' just', '0', '2018-03-27 15:30:35', '8', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('56', 'quick', '0', '2018-03-27 15:34:34', '8', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('57', 'just', '0', '2018-03-27 15:35:38', '5', '1017', '未命名', '');

-- ----------------------------
-- Table structure for `article_tb`
-- ----------------------------
DROP TABLE IF EXISTS `article_tb`;
CREATE TABLE `article_tb` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `subtitle` varchar(255) DEFAULT NULL COMMENT '子标题',
  `img_address` varchar(255) DEFAULT NULL COMMENT '封面',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT '跳转url',
  `content` longtext COMMENT '内容',
  `comment_number` bigint(20) DEFAULT '0' COMMENT '评论数',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态,下架0，上架1',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `article_cate_id` int(11) DEFAULT NULL COMMENT '文章类型id外键',
  PRIMARY KEY (`article_id`),
  KEY `INDEX_ARTICLECATEID` (`article_cate_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE,
  KEY `INDEX_COMMENTNUMBER` (`comment_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of article_tb
-- ----------------------------
INSERT INTO `article_tb` VALUES ('2', '平昌冬奥会开幕式最全盘点！ 朝韩旗手共同入场，金妍儿点燃圣火', '这是韩国时隔30年后再度举办奥运会，也是其首次举办冬奥会。继1972年札幌冬奥会、1998年长野冬奥会之后，冬奥会第三次落户亚洲。', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1060042918,4007443073&fm=173&s=5786980BC21239EDDA3D9EA903007095&w=218&h=146&img.JPEG', '', '<h3 style=\"text-align: left;\">CD君</h3><h3 style=\"text-align: left;\">中国日报</h3><p style=\"text-align: left;\">为您的资讯保鲜</p><p style=\"text-align: left;\">北京时间2月9日晚19时，2018年平昌冬奥会开幕式在韩国平昌奥林匹克体育场盛大举行。</p><p style=\"text-align: left;\">这是韩国时隔30年后再度举办奥运会，也是其首次举办冬奥会。继1972年札幌冬奥会、1998年长野冬奥会之后，冬奥会第三次落户亚洲。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3848130923,2878233503&amp;fm=173&amp;s=29F2E304DB25BA4F4C5C878E0300E08F&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者吕小炜摄</p><p style=\"text-align: left;\">随着钟声响起，平昌冬奥拉开序幕，奥林匹克运动，也正式进入了东亚时间。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3216895071,2762599730&amp;fm=173&amp;s=E1649346C50ABB477CD4759E03008092&amp;w=640&amp;h=392&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者白雪飞摄</p><p style=\"text-align: left;\">开幕式文艺演出以小朋友作为线索贯穿始终。</p><div style=\"text-align: left;\"><img width=\"405px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3420389651,3085989812&amp;fm=173&amp;s=57B6866400673D2CA6BB64000300E0DA&amp;w=405&amp;h=189&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">五个孩子，象征着奥运五环，同时，他们的名字，分别代表五行：金、木、水、火、土。</p><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3210180365,2649292913&amp;fm=173&amp;s=868697415AA33F265022810E0300D0DB&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">平昌冬奥会开幕式，精彩的短片引出白虎。</p><p style=\"text-align: left;\">本届冬奥会的官方吉祥物就包括有着白老虎形象的“Soohorang”。</p><div style=\"text-align: left;\"><img width=\"199px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3783826903,2739302379&amp;fm=173&amp;s=0134E937CFA552804FCD44DE0100C0A0&amp;w=199&amp;h=287&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">据组委会介绍，老虎象征着朝鲜半岛的地理形状，尤其是白老虎被认为是神圣的守护兽。同时，白老虎的“白”色象征着冰雪体育运动。</p><p style=\"text-align: left;\">而接下来出场的这几位，中国网友纷纷表示，看着有点眼熟......</p><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3236045651,2828225351&amp;fm=173&amp;s=79A2C05D58C73B601C154FBA03007006&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3278899753,3084758734&amp;fm=173&amp;s=29C08A4E52D3187300E4888803001097&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3871616973,2868584941&amp;fm=173&amp;s=68D08A464173943D78CD459803001086&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"401px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3277266357,2652903491&amp;fm=173&amp;s=C4F3A86445140E750ED084920300C083&amp;w=401&amp;h=187&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3226382123,2626722303&amp;fm=173&amp;s=B23831890A132BE53A8604CC0300E097&amp;w=640&amp;h=408&amp;img.JPEG\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3300832316,3025198607&amp;fm=173&amp;s=4DE3AB46ED03B8D4505D8C9F0100C081&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者鞠焕宗摄</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3187533601,1984660226&amp;fm=173&amp;s=4892E81A95B44D821C70F5C3010010B2&amp;w=638&amp;h=188&amp;img.JPEG\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=1796697192,1090035462&amp;fm=173&amp;s=1094ED3313084D431A74A4DB0000C0B3&amp;w=639&amp;h=283&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">据媒体报道，平昌今晚最低温度低达零下十度。大部分运动员出场都是这样的装扮↓↓</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3186095462,2620925207&amp;fm=173&amp;s=FA82408B2E33AEC80E78BAAE0300E005&amp;w=640&amp;h=455&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">据组委会介绍，截至目前，来自92个国家和地区的2925名运动员确认参加本届冬奥会，同时有55684名工作人员、志愿者为本届冬奥会服务，规模均为冬奥历史之最。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3212569064,3318380883&amp;fm=173&amp;s=6552738C0B33BEDC46D0088C03008082&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新西兰代表团在开幕式上入场。 新华社记者鞠焕宗摄</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=2880670162,2566695324&amp;fm=173&amp;s=B6B0308920008EE862385EAE03007084&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3029739630,2619073062&amp;fm=173&amp;s=E38223AB34421CE57699A99C03009083&amp;w=640&amp;h=427&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">尼日利亚代表团在开幕式上入场。 新华社记者吕小炜摄</p><p style=\"text-align: left;\">可是这位......完全不是一个季节↓↓</p><div style=\"text-align: left;\"><img width=\"421px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3340746734,3089634572&amp;fm=173&amp;s=80F553822481195F08ECB58903004085&amp;w=421&amp;h=195&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">平昌冬奥汤加的旗手是越野滑雪运动员陶法托富阿，在里约奥运会的开幕式上，他也担任了汤加旗手，当时他赤裸上身，身着汤加传统服饰，给大家留下了非常深刻的印象。这一次，他再次展现了他强健的肌肉。</p><p style=\"text-align: left;\">千呼万唤~中国队入场啦！</p><div style=\"text-align: left;\"><img width=\"372px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3388659037,2919817021&amp;fm=173&amp;s=C8D4C20302C319552214479803007006&amp;w=372&amp;h=187&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=2135571400,1004292982&amp;fm=173&amp;s=5786980BC21239EDDA3D9EA903007095&amp;w=639&amp;h=434&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">2月9日，中国代表团旗手周洋在开幕式上入场。中国日报记者 冯永斌 摄</p><p style=\"text-align: left;\">平昌冬奥中国代表团开幕式旗手是温哥华、索契两届冬奥会三枚金牌得主 —— 中国短道速滑运动员周洋！</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3354587794,2636390417&amp;fm=173&amp;s=9EA2C003720278EC163001DA03005035&amp;w=640&amp;h=678&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">中国代表团在开幕式上入场。 新华社记者鞠焕宗摄</p><p style=\"text-align: left;\">这也是继大杨扬之后，第二次由短道速滑运动员担任开幕式旗手！</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3802530035,2914429646&amp;fm=173&amp;s=0638188BCC93F9F14E89FCCF03008036&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">中国代表团在开幕式上入场。 新华社记者鞠焕宗摄</p><p style=\"text-align: left;\">韩朝运动员代表团在朝鲜半岛旗的引导下压轴登场，本次双方选定的旗手分别是韩国雪车（有舵雪橇）运动员元润钟（音译）和朝鲜的冰球联队队员黄忠琴（音译）。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=1785124476,1268930272&amp;fm=173&amp;s=6C51EA0B40593DED02A905DB03008096&amp;w=640&amp;h=430&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">朝韩两国代表团在开幕式上举“朝鲜半岛旗”共同入场。 中国日报记者 冯永斌 摄</p><p style=\"text-align: left;\">这也是朝鲜代表团和韩国代表团第10次在国际体育赛事中共同入场。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3120847989,3041081345&amp;fm=173&amp;s=AFE9AA0B0B934DE50169E5DB030090B6&amp;w=640&amp;h=415&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">继2000年悉尼奥运会，2004年雅典奥运会以及2006年都灵冬奥会之后，韩国和朝鲜的共同组成的朝韩代表团再次携手参加奥运会的开幕式。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3838772237,2660378012&amp;fm=173&amp;s=B7E1BB094C116FEDCA0D2CD1030010B0&amp;w=640&amp;h=442&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">本届平昌冬奥，朝韩双方还联合组成了女子冰球队参赛，这是奥运会历史上的第一次。奥林匹克不能完全停止争端，但是可以在运动场上表达对和平的渴望。</p><p style=\"text-align: left;\">朝韩两国冬奥代表团在开幕式上举“朝鲜半岛旗”共同入场，再次彰显奥林匹克呼唤和平的巨大感召力。</p><p style=\"text-align: left;\">据参考消息，在开幕式现场，韩国总统文在寅身穿韩国国家队服装出席开幕式。朝鲜高级别代表团团长金永南、金正恩胞妹金与正坐在文在寅身后。落座前，文在寅主动与金与正握手。这是文在寅与来访的金与正首次会面。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3431726973,2968159559&amp;fm=173&amp;s=C8D0EA0B5C62908E7A1520DA0100C091&amp;w=640&amp;h=446&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">2月9日，朝鲜劳动党中央委员会第一副部长金与正（右三）在开幕式上。 当日，2018年平昌冬奥会开幕式在平昌奥林匹克体育场举行。新华社记者吕小炜摄</p><p style=\"text-align: left;\">孩子们共同放飞了一只和平鸽，代表着和平！天空被1218架无人机点亮，组成一个闪亮的人形，地面是5位单板滑雪者和100位双板滑雪者在奥运的赛场上疾驰而下！1218架无人机在天空组成硕大的五环！</p><div style=\"text-align: left;\"><img width=\"351px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3761076168,3169558966&amp;fm=173&amp;s=A9F8E206DBC13D6EB6DCE69F03008086&amp;w=351&amp;h=176&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"405px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2995157307,2659938657&amp;fm=173&amp;s=DFE5A9445A833B7412B7D48A0300E09F&amp;w=405&amp;h=203&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">圣火传递的最后时刻，来自朝韩女子冰球队的两名运动员一起拾级而上，将奥林匹克的圣火交给了韩国运动的象征、国民偶像——金妍儿。</p><div style=\"text-align: left;\"><img width=\"377px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2876192277,2248076147&amp;fm=173&amp;s=ACEAEA04ADE1200D6E6D888C010050C2&amp;w=377&amp;h=189&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"302px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3003303336,2758310655&amp;fm=173&amp;s=65F32A641D01217446F6E59B0300408B&amp;w=302&amp;h=159&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">奥林匹克圣火，在希腊点燃之后，经过了2018公里的接力全程，终于到达金妍儿手中，金妍儿在冰上翩翩起舞，将圣火送到主火炬台下的点燃装置上，主火炬就此点燃。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3399876452,2782627847&amp;fm=173&amp;s=2560D204E5148DDC8FF6548F0300A089&amp;w=640&amp;h=820&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者白雪飞摄</p><div style=\"text-align: left;\"><img width=\"304px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3541705125,2771657533&amp;fm=173&amp;s=017971861915B0590C490D9D0300D083&amp;w=304&amp;h=181&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3699897610,3217367235&amp;fm=173&amp;s=25543BC29A3EAEDC4EFDA81F010080C3&amp;w=640&amp;h=443&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者鞠焕宗摄</p><p style=\"text-align: left;\">比赛看点</p><p style=\"text-align: left;\">本届冬奥会中国代表团有82名运动员，参加12个项目的比赛，参加比赛的项目总数也是创下了历史新高，其中钢架雪车、雪车是历史上第一次获得参赛资格。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2293919715,1214010658&amp;fm=173&amp;s=61F4308D5C7296CA0688628C0300E097&amp;w=640&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">除了中国，还有两个队伍非常特别。</p><p style=\"text-align: left;\">一支队伍来自尼日利亚。</p><div style=\"text-align: left;\"><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3507287631,2934023721&amp;fm=173&amp;s=9A922FC14402AF535EA12E120300C0D6&amp;w=500&amp;h=315&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">尼日利亚雪车队</p><p style=\"text-align: left;\">尼日利亚姑娘塞温·阿迪贡和另外两名队友今年2月组成非洲首支雪车队出征韩国平昌冬奥会。</p><p style=\"text-align: left;\">她们平时在得克萨斯州的泥土跑道上训练，直到去年1月才在犹他州帕克城踏上冰面。据英国《星期日泰晤士报》，阿迪贡在谈到比赛经历时曾说：“那是我们的第一场比赛，女士们第一见到了冰、见到雪车、见到雪车跑道”。</p><p style=\"text-align: left;\">去年完成5场资格赛并保持世界前44的排名后，这支尼日利亚雪车队终于取得今年平昌冬奥会的参赛资格。</p><p style=\"text-align: left;\">除了雪车队伍，来自非洲摩洛哥的运动员萨米尔阿兹玛尼也会参加今年冬奥会的滑雪比赛。为备战冬奥会，他利用起伏的沙丘，做强化关节训练，还会穿着装有滚轮的滑雪板在沙漠公路上提升体能和耐力。</p><p style=\"text-align: left;\">来源：CCTV5、新华社、参考消息</p><p style=\"text-align: left;\">编辑：王瑜、侯俊杰</p>', '6', '1', '2018-01-28 16:32:04', '2018-01-28 16:32:04', '1000');
INSERT INTO `article_tb` VALUES ('3', '县城手机战的“乡土”营销：买手机送足浴盆', '中新网客户端石家庄2月23日电 题：(新春见闻)县城手机战的“乡土”营销：买手机送足浴盆', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3425483143,1906034554&fm=173&s=99F24C800E639ADE049D0114030050DA&w=218&h=146&img.JPEG', '', '<div><p>中新网客户端石家庄2月23日电 题：(新春见闻)县城手机战的“乡土”营销：买手机送足浴盆</p><p>记者 吴涛</p><p>移动互联网时代，手机是人们最亲密的“伙伴”。春节期间，记者在河北省无极县走访发现，县城的手机市场和大家的认知差异较大，有些情况甚至颠覆你的想象。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=805330091,2380710629&amp;fm=173&amp;s=99F24C800E639ADE049D0114030050DA&amp;w=500&amp;h=333&amp;img.JPEG\" data-loaded=\"0\"></div><p>县城手机专卖店，OPPO和vivo居多。中新网 吴涛 摄</p><p>用什么？</p><p>——OPPO、vivo主导，难见三星、苹果</p><p>无极县有一条主要街道，贯穿东西，主要的商场和门店都集中在这条街上，手机店也不例外。记者走访发现，这条街上有30个左右的手机专卖或通讯店，支撑起这个县城的手机市场。</p><p>通过走访不难发现，在县城，销售最好的是OPPO和vivo，难见苹果、三星身影，华为也只有近两年才开张的一家旗舰店。</p><p>这不只体现在手机专卖店数量上，还有巨大广告横幅和活灵活现的卡通人物营销——这些基本都被OPPO和vivo占领。</p><p>有意思的是，每到OPPO和vivo做营销活动时，场面颇为壮观。放置在路边的音箱都开到最大声音，舞台搭起来，歌舞跳起来。总之，大街上最热闹、音箱声音最大的店面一般就是OPPO或vivo的专卖店。</p><p>其实，这种情况不是个例，据调研机构Quest Mobile安卓终端报告显示，OPPO和vivo的三四线城市及以下用户占比较多，其中OPPO最高，达53.7%。</p><p>这或和很多人的印象存有较大差异：难道用的最多的手机不是苹果、三星吗？据调查机构IDC发布调查数据显示，2017年四季度，全球智能手机出货量达到4.035亿台。手机厂商排名三星、苹果居前二，然后依次为华为、OPPO、小米。</p><p>但在该县城，这么多的手机专卖店，只有极少部分店面有苹果和小米手机出售，基本没有三星。“小米前几年还行，现在很难卖动了；三星原来一直就没有卖。”某手机专卖店服务人员表示。</p><p>另外，除了OPPO和vivo，记者还发现，在县城，一些老年机型也活得比较“滋润”。这类手机按键和音量都很大，普遍售价200元左右。一位70多岁的老婆婆对记者表示，她好几年前就开始用这种手机了，只接打电话，很好用。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=950438241,880612904&amp;fm=173&amp;s=1E844D814C1540C8648780DF0300C0B3&amp;w=500&amp;h=375&amp;img.JPEG\" data-loaded=\"0\"></div><p>某手机专卖店展示的老年机型。中新网 吴涛 摄</p><p>为什么？</p><p>——定价策略或是关键</p><p>春节期间，记者走访时眼见一位消费者买下一款OPPO，追上去问“这么多的手机品牌，为什么选择了这款？”</p><p>“周围的人都在用，况且也没有卖其他的。”消费者答。</p><p>记者观察发现，对县城居民来说，尤其是年轻的消费者来说，关键是手机要有他们指定的功能。可以玩《王者荣耀》不？能美化照片吗？能“吃鸡”(逃生射击类游戏)吗？这些都能成为买手机的理由。</p><p>另外，定价策略或是OPPO和vivo“吃得开”的一个原因。虽然官方称线上线下一个价，但是基本所有的vivo和OPPO线下价格都比线上优惠。</p><p>一款vivo X20全面屏4GB+64GB版本，官网售价2998元。但在县城，至少两个手机专卖店给记者表示，售价2798元。真要买，价格还有商量的余地。OPPO也一样，售价不但比线上便宜，还有一些机型送足浴盆、电饭锅等礼品。</p><p>有意思的是，华为线下旗舰店卖的手机价格高于线上或和线上一致。某华为旗舰店服务员对记者透露，“我们利润薄，但他们(vivo和OPPO)利润太大了，赚的多，所以敢于优惠。但经常有上面的人暗查他们，知道他们卖便宜了还会罚款。”</p><p>售后是OPPO和vivo的另一个“杀手锏”。几乎所有的OPPO和vivo专卖店都支持线下维修，但是三星或者苹果，你维修只能邮寄到指定地址，还得自己出邮费，何时拿回手机也是一个问题。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=1888857215,706434690&amp;fm=173&amp;s=278069A50813B2D8446940840300D0C2&amp;w=500&amp;h=375&amp;img.JPEG\" data-loaded=\"0\"></div><p>某手机专卖店做活动，买就送电饭锅、足浴盆等。中新网 吴涛 摄</p><p>玩什么？</p><p>——视频类应用最吃香</p><p>和大城市相比，县城居民的手机不一样，安装的应用和大家的印象也存有较大的差异。据中国互联网络信息中心的数据显示，移动互联网快速发展迅速，截至2017年12月底，每10个手机网民中，4个人订网络外卖，3个骑共享单车。</p><p>但县城居民或大都不在这个范围内。“我知道有外卖，县城也有，但太贵了，偶尔会用。” 不止一个人对记者这样表示，“随便点顿饭三四十元，这点钱自己买菜做饭够一家子吃了。”共享单车的使用更无从谈起，压根就没有。</p><p>记者观察发现，大部分人手机上安装的是资讯类和视频类软件，爱奇艺、快手、火山小视频等安装率高，而且很多用户不止安装一个视频类软件。另外，安装美颜相机应用也较多。</p><p>“感觉这些APP够用吗？”某商场服务员接受中新网记者采访时表示，“够用，主要是用来拍照和看视频打发时间。”返回搜狐，查看更多</p></div>', '5', '1', '2018-01-28 16:37:30', '2018-01-28 16:37:30', '1001');
INSERT INTO `article_tb` VALUES ('4', '威少为了三双遭绝杀？关键时刻又一次让乔治选择变得简单', '与掘金交手，雷霆打出了本赛季最精彩的一场比赛', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=72032686,3494064946&fm=173&s=52C048A44E4E1F5306C0858B03006081&w=218&h=146&img.JPEG', 'https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_10052312347202782283%22%7D&n_type=0&p_from=1', '<div id=\"loginBanner\"><h1></h1><h3></h3><p><span style=\"font-weight: normal;\">与掘金交手，雷霆打出了本赛季最精彩的一场比赛，保罗乔治逆天表现令人感慨万分，掘金队深知乔治手感极佳，却丝毫拿他没办法，篮下得分为所欲为，三分线外兵不血刃，最后时刻飙进三分眼看就要拖进加时赛，然而戏剧性一幕发生在灯亮那一刻。<br></span><span style=\"font-weight: normal;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=700448189,3118158180&amp;fm=173&amp;s=C2C060A444578BD6004585890300B081&amp;w=640&amp;h=503&amp;img.JPEG\" data-loaded=\"0\"><br></span><span style=\"font-weight: normal;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=1482253396,4075800873&amp;fm=173&amp;s=DED8698596CB38EC6AA999CD0300F011&amp;w=640&amp;h=362&amp;img.JPEG\" data-loaded=\"0\"><br></span><span style=\"font-weight: normal;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=2089485761,2969476882&amp;fm=173&amp;s=ADD14083C28319F53180A59A03007011&amp;w=637&amp;h=539&amp;img.JPEG\" data-loaded=\"0\"><br></span><span style=\"font-weight: normal;\">保罗乔治不仅进攻无解，而且防守端同样出色，本场他硬生生跳起抢断莱尔斯，助攻威少暴扣。<br></span><span style=\"font-weight: normal;\">最后1.4秒，威少数据正好定格在20分9篮板21助攻，面对哈里斯投篮，威少从篮下扑过来，显然这一球威少太大意，不少球迷再次质疑威少是为了抢下最后一个篮板达成三双。而在约基奇看来，哈里斯投进这记绝杀是因为威少当时睡着了。约基奇的调侃也许还在为最后时刻威少凶狠犯规而耿耿于怀。<br></span><span style=\"font-weight: normal;\">从客观角度上来看，1.4秒关系到球队胜负，威少想要这记篮板也不太现实，就算哈里斯未能投进比赛时间也到了。<br></span><span style=\"font-weight: normal;\">威少最后时刻防守可谓“进退两难”，首先一方面担心哈里斯篮下空接暴扣，另一方面就是对手投三分；但无论如何从慢镜头显示来看，他防守距离哈里斯太远，威少站在篮下也许是想和格兰特两人限制对手空接。<br></span><span style=\"font-weight: normal;\">而赛后威少也表示，哈里斯这记绝杀他有触到球，但还是进了。<br></span><span style=\"font-weight: normal;\">威少今天的表现也许又一次让乔治今夏选择变得更加简单，上一场乔治0出手，威少主动承认错误，今天末节得到了全队最高的8次出手，威少几乎将所有球权交给了了保罗乔治。</span></p><p></p><p></p></div>', '6', '1', '2018-01-28 17:34:27', '2018-01-28 17:34:27', '1002');
INSERT INTO `article_tb` VALUES ('5', '2017年谁挣钱最多？京沪人均可支配收入逼近6万元', '2017年谁挣钱最多？京沪人均可支配收入逼近6万元', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3521098845,1745252136&fm=173&s=66EAB8568E1051CA4CCF65E50300E03E&w=218&h=146&img.JPEG', '', '<p>中新网客户端北京2月24日电(记者李金磊)国家统计局近日公布了31个省份2017年居民人均可支配收入。数据显示，10省份人均可支配收入超过全国水平。上海、北京2017年居民人均可支配收入逼近6万元大关，上海以58987.96元位居全国首位。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=440278906,1714656825&amp;fm=173&amp;s=66EAB8568E1051CA4CCF65E50300E03E&amp;w=500&amp;h=338&amp;img.JPEG\" data-loaded=\"0\"></div><p>人民币。 中新网记者李金磊摄</p><p>10省份人均可支配收入超全国水平</p><p>国家统计局的数据显示，2017年居民人均可支配收入25974元，比上年名义增长9.0%；扣除价格因素实际增长7.3%。</p><p>居民可支配收入，指居民可用于最终消费支出和储蓄的总和，即居民可用于自由支配的收入，既包括现金收入，也包括实物收入。按照收入的来源，可支配收入包括工资性收入、经营净收入、财产净收入和转移净收入。</p><p>中新网记者梳理发现，上海、北京、浙江、天津、江苏、广东、福建、辽宁、山东、内蒙古2017年居民人均可支配收入超过了全国平均水平。</p><div><img width=\"239px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=540324936,3845180481&amp;fm=173&amp;s=1AAE742319D149CA5A5571CA000080B1&amp;w=239&amp;h=511&amp;img.JPEG\" data-loaded=\"0\"></div><div><img width=\"238px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=78105616,3579114037&amp;fm=173&amp;s=1AAA742319D6C0CA4855F0CA000080B1&amp;w=238&amp;h=416&amp;img.JPEG\" data-loaded=\"0\"></div><p>2017年各地居民人均可支配收入。来源：国家统计局网站</p><p>京沪人均可支配收入逼近6万元大关</p><p>在31个省区市中，上海、北京、浙江2017年居民人均可支配收入位居前三名。其中，上海、北京居民人均可支配收入分别达到58987.96元、57229.83元，逼近6万元大关。</p><p>上海、北京是2017年全国仅有的居民人均可支配收入在“5万元俱乐部”的地区；浙江居民人均可支配收入达到42045.69元，属于“4万元俱乐部”的唯一成员。</p><p>收入水平高，消费水平也高。国家统计局数据显示，上海2017年居民人均消费支出为39791.85元，北京为37425.34元，位居全国前两位。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3849965064,3504479757&amp;fm=173&amp;s=13A042A70812A2CA4EA9913303006041&amp;w=500&amp;h=375&amp;img.JPEG\" data-loaded=\"0\"></div><p>居民在超市里购物。 中新网记者李金磊摄</p><p>多地居民收入增速跑赢GDP增速</p><p>从全国来看，2017年居民收入增长快于经济增长。数据显示，2017年全国居民人均可支配收入比上年实际增长7.3%，实际增速比GDP和人均GDP增长分别快0.4和1.0个百分点。</p><p>在地方层面，多地2017年居民收入增速跑赢了当地的GDP增速。如，北京2017年居民人均可支配收入实际增长6.9%，高于同期GDP增速0.2个百分点。江苏2017年居民人均可支配收入实际增长7.4%，高出GDP增速0.2个百分点。</p><p>中国劳动学会副会长苏海南对中新网记者表示，居民收入增速跑赢GDP增速，首先是因为经济稳定增长，企业效益好转，居民收入有了增长的基础。同时，努力让居民收入增长跟经济增长保持同步，一系列居民增收、深化收入分配制度改革政策也起到了积极的推动作用。(完)</p>', '4', '1', '2018-02-24 09:28:05', '2018-02-24 09:28:05', '1001');
INSERT INTO `article_tb` VALUES ('6', '宪法宣誓誓词将从70字修改为75字 改了啥？', '宪法宣誓制度将完善！70字誓词将改为75字，改了啥？', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=169260962,1081020469&fm=173&s=4E3003C0DE930BC4669964B40300B012&w=218&h=146&img.JPEG', '', '<p>23日召开的十二届全国人大常委会第三十三次会议，拟对宪法宣誓制度相关规定作出适当修改，明确监察委员会组成人员依法产生后应当进行宪法宣誓、宣誓仪式应当奏唱中华人民共和国国歌。</p><p>宪法宣誓誓词中有关奋斗目标的表述也将修改为“为建设富强民主文明和谐美丽的社会主义现代化强国努力奋斗！”</p><div><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=1844075206,1555696544&amp;fm=173&amp;s=4E3003C0DE930BC4669964B40300B012&amp;w=639&amp;h=425&amp;img.JPEG\" data-loaded=\"0\"></div><p>2015年7月1日，十二届全国人大常委会第十五次会议通过了《全国人民代表大会常务委员会关于实行宪法宣誓制度的决定》，以立法方式确立了我国宪法宣誓制度。</p><p>此次修改旨在贯彻落实党的十九大和十九届二中全会精神，适应深化国家监察体制改革的需要，完善宪法宣誓制度，进一步弘扬宪法精神、彰显宪法权威。</p><p>全国人大常委会法工委副主任张勇受委员长会议委托作相关修订草案说明时说，党的十九大确立了习近平新时代中国特色社会主义思想的历史地位，确定了我国发展新的奋斗目标，并对深化国家监察体制改革、制定国家监察法提出了新要求。</p><p>党的十九届二中全会通过了《中共中央关于修改宪法部分内容的建议》，提出把党的十九大确定的重大理论观点和重大方针政策载入国家根本法，体现党和国家事业发展的新成就新经验新要求。</p><p>张勇说，在全党全国学习贯彻党的十九大和十九届二中全会精神过程中，一些地方、部门和同志提出，应当根据党的十九大精神和十九届二中全会宪法修改精神，对2015年决定中的宣誓誓词作出适当修改，进一步完善我国宪法宣誓制度。</p><p>此外，随着各地监察委员会陆续成立，由地方各级人大及其常委会选举或者任命的监察委员会主任、副主任、委员，在就职时普遍进行了宪法宣誓。</p><p>许多地方建议，在国家法律层面作出明确规定，监察委员会组成人员依法产生后应当进行宪法宣誓。</p><p>“总的看，根据党的十九大和十九届二中全会精神，适应深化国家监察体制改革的需要，对2015年决定作出适当修改是必要的。”张勇说。</p><p>根据修订草案，宪法宣誓誓词将从70字修改为75字，有关条款中增加了与监察委员会有关的内容。增加的“宣誓仪式应当奏唱中华人民共和国国歌”的规定，也是为了与全国人大常委会2017年9月通过的国歌法有关规定相衔接。返回搜狐，查看更多</p>', '5', '1', '2018-02-24 09:29:15', '2018-02-24 09:29:15', '1001');
INSERT INTO `article_tb` VALUES ('7', '《渴望现场》收官 央视舞台成就平凡人音乐梦想', '大型中国故事主题音乐竞演节目《渴望现场》于大年初二迎来总决赛，9强竞演者经过激烈的比拼，终于决出了节目第一季总冠军', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3474194859,3738622053&fm=173&s=B46248A60CE284925909E1320300F013&w=218&h=146&img.JPEG', '', '<div><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=18949919,3204402929&amp;fm=173&amp;s=4941A3465FE384DC1CEDA09803005093&amp;w=600&amp;h=402&amp;img.JPEG\" data-loaded=\"0\"></div><p></p><div><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=1262955707,1078610417&amp;fm=173&amp;s=DD7404C68A70AADC46448CAA03001002&amp;w=600&amp;h=400&amp;img.JPEG\" data-loaded=\"0\"></div><p></p><p>大型中国故事主题音乐竞演节目《渴望现场》于大年初二迎来总决赛，9强竞演者经过激烈的比拼，终于决出了节目第一季总冠军。毕业于北京大学的前北大合唱团团长王上，不仅以超强的演唱实力获得人工智能“小渴”评委的高分，更以腹有诗书气自华的独特气质赢得“渴望筑梦团”制作人们的青睐，将总冠军的奖杯收入囊中。</p><p></p><p></p><p></p><p>《渴望现场》总决赛的的竞演愈发激烈，9位从108位竞演者中脱颖而出的决赛竞演者也毫无保留，奉献出自己最好的舞台表演。最终由王上凭借《等待》一举夺冠，亚军和季军分别由演绎了《青藏高原》、《没离开过》的周兴才让和娜日莎夺得。其余六位竞演者也奉献了精彩的演出：杨啟凭借天籁般的声线演绎《后会无期》；王天阳邀请回了自己的最佳搭档黄小幺，为现场观众带来了一首情意绵绵的《有个爱你的人不容易》，田恩琦为决赛重拾舞姿，一曲《超级冠军》，劲歌热舞，掀翻全场；黄诗荑一首《女儿情》装点得舞台宛如梦境；一首《我怀念的》以高度共鸣的抒情歌搭配唯美的舞台设计将观众们带到了竞演者的世界里；《渴望现场》中年龄最小的戴韩安妮在决赛中与父亲合作演绎的一曲《野子》为自己赢得了观众喝彩。</p><p></p><p></p><div><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=1166069845,591286648&amp;fm=173&amp;s=B66248A604A204B75908E13203006013&amp;w=600&amp;h=400&amp;img.JPEG\" data-loaded=\"0\"></div><p></p><p></p><p></p><p>25岁的总冠军王上毕业于北京大学，本硕连读的7年北大时光，热爱唱歌的王上一直与北大合唱团共同成长。在校期间，作为合唱团的团长，王上曾带领北大合唱团出征有“合唱界的奥林匹克”之称的世界合唱大赛，并用一首中国民族音乐一举战胜了几十个国家的对手，拿到了世界合唱大赛的冠军，让五星红旗在世界的舞台上飘扬。在总决赛中，王上特别邀请到北大合唱团成员们到场助阵，一曲深情满满的《等待》，唱出了90后新时代青年们的豪情与梦想，助力王上一举夺冠。在《渴望现场》一路走来，王上先后演唱的《我爱你中国》、《故乡的云》、《You Raise Me up》等歌曲均获得了人工智能音乐评分系统“小渴”打出的90分以上的高分，表现出色。同时，王上不仅唱功过硬，出身于文艺世家的他，一直在传统文化的浸润和熏陶下成长，在《渴望现场》的舞台上表现得如同谦谦君子一般，充满书生气。兼有学霸属性的他，不仅于在校期间创作了自己的原创作品，还是知乎“声乐问题优秀回答者”，乐于将自己在音乐方面的所学和见解分享出去。而他身上的音乐气质，也如他的性格一样兼具活泼和深沉，期待在王上的个人演唱会中再次听到他诚挚动人的歌声。</p><p></p><p>从节目开播，首次联手中科院推出人工智能音乐评分系统的《渴望现场》就以“音乐+科技”的创新形式备受各方关注，获人民日报（海外版）、工人日报等媒体点赞。用音乐讲述中国故事，用歌声唱响中国声音的108位包括“国系90后”北大90后女学生宋玺、华阴老腔第11代传人张猛等在内的新青年，在《渴望现场》向观众展示了新时代中国青年的精神风貌，单宋玺的视频播放量就突破千万，并引发人民日报等近百家媒体转发点赞，将“国系90后”的概念传遍了中国。第一季节目温情收官，但精彩仍将继续，期待第二季节目带来更多惊喜和感动。</p>', '1', '1', '2018-02-24 09:30:03', '2018-02-24 09:30:03', '1002');
INSERT INTO `article_tb` VALUES ('8', '【牵妈妈的手】想您了，妈妈', '你多久没牵妈妈的手？', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1957512093,1064716064&fm=173&s=AD32E41659B24694124131DE0300E0A0&w=218&h=146&img.JPEG', '', '<div><img width=\"486px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3590317473,3155656438&amp;fm=173&amp;s=B58E377E031073D24964D4FD03005029&amp;w=486&amp;h=353&amp;img.JPEG\" data-loaded=\"0\"></div><div><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3276919675,2917811384&amp;fm=173&amp;s=19863C7263A4731503FA4FEE0200E024&amp;w=630&amp;h=555&amp;img.GIF\" data-loaded=\"0\"></div><p>又一次在梦中惊醒，梦到了妈妈，她微笑着，面容依旧那么慈祥，却渐行渐远，我站在小路的这一端，看着她消失在小路转弯的地方，怎么喊也喊不回来……</p><p>再过几个月，妈妈去世就十周年了。永远忘不了大学毕业后参加工作的第一天，姐姐打来电话那头传来妈妈不在了的噩耗。苦日子过完了，妈妈却走了，好日子开始了，妈妈却走了，这就是我苦命的妈妈。妈妈在时，上有老是一种表面的负担，妈妈没了，亲不待是一种本质的孤独。妈妈在时，家乡是我的老家，妈妈没了，家乡就只能叫做故乡了，梦见的次数会越来越多，回去的次数却越来越少。</p><div><img width=\"300px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3634585013,2775072753&amp;fm=173&amp;s=AD32E41659B24694124131DE0300E0A0&amp;w=300&amp;h=240&amp;img.JPEG\" data-loaded=\"0\"></div><p>妈妈只是一个平凡质朴的农村妇女，没有多少文化，但对我和姐姐要求很严厉，小的时候我们很淘气，挨过不少妈妈的打。等我长大一点时，看见妈妈那么辛苦，想帮妈妈干点活，可她总是不让，要我好好学习，将来好有出息。家里有台缝纫机，妈妈每次忙完农活，就给我和姐姐做衣服穿，也许都是旧布料，但每次上学我们的衣服总是干干净净。</p><p>01</p><p>01</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2681986335,2371913617&amp;fm=173&amp;s=CC2AA7570A62420D449F45600300703A&amp;w=500&amp;h=527&amp;img.JPEG\" data-loaded=\"0\"></div><p>记得小的时候，爸爸参军复员后工作离家很远，交通不方便，每隔几个月才回家一次，是妈妈一个人拉扯着我和姐姐，为了生计，印象中妈妈每天都是忙忙碌碌，忙完这个又忙那个。每次吃饭，都是叮咛着我和姐姐吃饱，妈妈才吃凉了的饭菜，就这样，不知她吃了多少的凉饭，饥一顿饱一顿，才把我们都拉扯大。</p><p>Mom</p><p>02</p><div><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=2902618094,2470061509&amp;fm=173&amp;s=71A390550E726C174837F6EA0300701D&amp;w=640&amp;h=384&amp;img.JPEG\" data-loaded=\"0\"></div><p>上大学以后，离家很远，忙着学习，忙着贪玩，回家的时间变得更少，偶尔的电话问候，也总被自己以各种借口一拖再拖，电话拨通没说几句，可能就匆匆挂掉。即使回家，也是各种同学聚会，玩累了到家倒头就睡，却时常忘记妈妈为我准备了很久的饭菜。</p><p>Mom</p><p>03</p><div><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=2231813108,1279982737&amp;fm=173&amp;s=038B914DD4DB4E7E1600F1A00300E001&amp;w=640&amp;h=457&amp;img.JPEG\" data-loaded=\"0\"></div><p>时光太匆匆，转眼我已到了而立之年，已经是两个孩子的爸爸，逐渐体会到了生活的不易，为人父母的不易。脑海中不觉想象着妈妈的模样，想念着妈妈做饭菜味道，想象着，如果妈妈还在该有多好，或许岁月已染白了她的双鬓，或许时光已雕刻了她的额头，或许看着膝下的乖孙打闹，她还会露出慈祥的微笑。</p><p>Mom</p><p>想您了，妈妈。</p><p>如果可以，下次梦里能不能别那么着急走？</p><p>我们的世界很大，远游寻梦，却时常模糊了父母的音容，父母的世界却很小，小到只剩下孩子和家。盼望着每一次我们给他们打电话，期盼着我们每一次回家……人生其实很短，有些话有些事总等着以后说和做，总想着爸妈总在那儿，以后有的是机会。可我们在慢慢长大，他们却在慢慢变老，岁月不会为你和父母驻足，一回头他们已经白发苍苍，不要让等待最终成为遗憾。多给爱你的人留点时间，珍惜和父母团聚的日子，多陪陪他们。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3589243416,2657788446&amp;fm=173&amp;s=54525D3A417647300A6CF1D40300C0B2&amp;w=500&amp;h=138&amp;img.JPEG\" data-loaded=\"0\"></div>', '5', '1', '2018-02-24 09:30:47', '2018-02-24 09:30:47', '1002');
INSERT INTO `article_tb` VALUES ('9', '中国游客出境被索“小费” 千万别给还要记住这招', '春节假期，不少人选择出境游。据中国旅游研究院预计，今年春节假期我国出境游人次将达到650万，规模为历史之最。', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2414048836,1326700880&fm=173&s=FE3A57CB4DF58E4568D9351F0300D0C1&w=218&h=146&img.JPEG', '', '<p>春节假期，不少人选择出境游。据中国旅游研究院预计，今年春节假期我国出境游人次将达到650万，规模为历史之最。</p><p>　　 在这些出境的游客中，有些去了墨西哥，却遭遇到了一些不愉快的经历。</p><p>　　 一些中国公民反映墨方个别移民官员在入境核查时向他们索要“小费”。其实，除了墨西哥，还有一些国家海关人员也有向中国游客索要小费的行为，还有些中国游客因此遭遇了海关人员的暴力。</p><p>　　墨西哥：部分中国公民在墨入境被索要“小费”</p><p>　　 2月15号，中国驻墨西哥大使馆网站发文指出，近期，中国公民在墨西哥城国际机场入境出境过境受阻案件有所增多。同时，一些中国公民反映墨方个别移民官员在入境核查时向他们索要“小费”。</p><div><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=4091121756,3037057569&amp;fm=173&amp;s=FE3A57CB4DF58E4568D9351F0300D0C1&amp;w=640&amp;h=326&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　 中国驻墨西哥大使馆已经就此与墨方提出交涉。墨西哥方面给出回应称，墨西哥紧邻美国，移民和出入境政策十分严格，对各国公民一视同仁。</p><div><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3481985712,2938738922&amp;fm=173&amp;s=E99A26D504312D8C7A9C42630300E056&amp;w=640&amp;h=324&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　 墨西哥方面将就中方提出的索贿问题展开调查，希望中国公民能够及时举证，协助墨西哥方面执法。</p><div><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=2616440279,2374485275&amp;fm=173&amp;s=BC9943910A110DC81E38F9500300D0F1&amp;w=640&amp;h=324&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　新闻链接：中国公民在国外屡被索要“小费”</p><p>　　 其实不仅仅是在墨西哥，很多中国游客在国外都遭遇过海关人员索要小费的经历，有些游客迫于压力给了，有些则没给。还有些中国游客因此遭遇了海关人员的暴力。</p><p>　　 这段视频据称拍摄于2016年5月2号晚，越南芽庄金兰国际机场边检工作人员向中国游客索要10元人民币小费。一名带小孩的母亲拒绝给小费，越南边检人员竟然扣下孩子的护照，要求母亲交100元人民币才能出关。</p><p>　　 在网友拍摄的现场视频中，可以看到有边检人员，甚至还拿出电击枪向游客挥舞。</p><p>　　 事件被曝光后，芽庄机场涉事工作人员被停职调查。</p><p>　　 这段视频拍摄于印尼海关，拍摄时间是2017年3月，画面中蓝色短袖男子是一名中国游客，他在入境柜台前拿出了钱包。视频的拍摄者是他后面等候的中国游客。据拍摄者表示，入关印尼，海关强制收取中国人小费100-300元，只收中国人。</p><p>　　出境游被索要“小费”怎么办？</p><p>　　 根据国际惯例，即使你已获得一国签证，相关国家也有权拒绝入境且无需说明理由。因此建议中国游客在入境前要正确填写入境卡和海关申报表，办理落地签证，提前准备好机票和酒店预订单等材料，不给对方借题发挥的空间。</p><p>　　 在这里，提醒大家：如果遇到索要小费的情况，请不要支付，并记录下对方信息及时举证。如遇紧急情况、受到不公正对待或发生纠纷，可及时与当地使馆联系，并收集和保存好证据，以便日后通过投诉或司法途径解决。</p>', '4', '1', '2018-02-24 09:32:18', '2018-02-24 09:32:18', '1000');
INSERT INTO `article_tb` VALUES ('10', '只想省点钱\"携号转网\"：移动请放过我', '　如今，“移动革命”接近尾声，人类被移动互联网重重包围，生活方式随之改变。', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3587693726,2308931756&fm=173&s=A62245A128D08894591D4DDB03009092&w=218&h=146&img.JPEG', '', '<p>如今，“移动革命”接近尾声，人类被移动互联网重重包围，生活方式随之改变。与此同时，智能手机的电话功能已逐渐被“免费”即时通讯应用所取代，并且手机娱乐影音属性进一步强化，所以数据流量自然成为手机用户最关心的问题之一。</p><p>　　不过，随着互联网手机卡的到来，数据流量资费的困扰开始被解除，但是对于笔者来说，直到目前仍没有享受到这种福利，因为我是一名中国移动“情怀”用户。</p><div><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=969799350,4019288445&amp;fm=173&amp;s=A62245A128D08894591D4DDB03009092&amp;w=600&amp;h=370&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　情怀不能当饭吃，这句话用来形容“我的手机卡”来说最合适不过了，来看看笔者近六个月的资费详情：（2017年9月和10月份是本人每月实际消费，从11月开始通过其他平台进行数据流量充值，所以移动数据显示只有低消的68元）</p><div><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=910493017,3875051378&amp;fm=173&amp;s=903674335F674D1B4A4821D20000C0B2&amp;w=600&amp;h=395&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　本人是每月180分钟通话+6GB数据流量的套餐标准，作为对比，如果我更换为联网手机卡（这里以“腾讯大王卡”为例），则可以省下不少钱。</p><p>　　腾讯大王卡</p><p>　　省内用户每月资费：19元月费+18元语音费+30元流量费（约23.4GB）=67元；</p><p>　　省外用户每月资费：19元月费+18元语音费+60元流量费（约23.4GB）=97元。</p><p>　　即使每月消耗的是全国流量，其实际资费也不过97元而已，但是却可以使用近25GB的数据流量，这与6GB数据流量体验完全不在一个量级上。由此可见，互联网手机卡既省钱，又能吃得饱。</p><p>　　想\"逃离\"，但中国移动不想放我</p><p>　　其实，中国移动也推出了互联网卡，但是比起中国联通、电信与互联网公司合作推出第三方互联网卡要鸡肋一些。</p><p>　　第一款是小魔卡——上海当地互联网套餐卡，目前并不在其它地区开放办理。第二款是“任我用”套餐（无限流量），套餐资费从188元起步，还有288元价位档，当然这是针对新用户的；而针对老用户推出的是238元的套餐。不管是哪个资费套餐，对于普通用户来说都有些不实用。</p><p>　　可能有的小伙伴会说，你转投其他互联网手机卡（中国联通、中国电信）阵营不就解决问题了吗？</p><p>　　本人何尝不想啊，本人手机号绑定的银行卡以及重要应用注册账号不少于60个，解除绑定并且重新重新绑定新手机号，想想都是一个可怕的大工程；并且还需要重新告知家人、朋友以及客户新更换的手机号码；相信很多中国移动手机卡的小伙伴都会有同感。但是如果可以“携号转网”，换手机卡带来的困扰都可以被解决。</p><p>　　携号转网大家应该知道吧？就是号码可携带、移机不改号，一家移动电信运营商的，比如持有移动号码的手机用户，转入中国电信或中国联通，享受中国电信或中国联通提供的电信运营服务。但是对于开放携号转网这件事，笔者认为中国移动不会同意；先来看一组数据：</p><div><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=932242680,3970689300&amp;fm=173&amp;s=5191E93397E06D0950F809CE0300C036&amp;w=600&amp;h=219&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　2010年11月22日，工信部第一批携号转网试点在天津、海南启动。2014年9月20日，第二批携号转网试点在江西、湖北、云南落地实施。从工信部数据显示来看，截止2016年6月底，开展携号转网试点的五省（市）共有超过45万用户使用了号码携带服务。</p><p>　　其中，中国电信携入16.8万，携出6.6万，净增用户10.2万；中国移动携入16.2万，携出25万，净增用户-8.8万；中国联通携入14.7万，携出16.1万，净增用户-1.4万。从结果来看，转入中国电信网络的用户最多，而中国移动的用户流失率最高。</p><p>　　再来看一组数据：</p><div><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=944852705,3955035510&amp;fm=173&amp;s=1CBB7E9620B88825467412770300D038&amp;w=600&amp;h=164&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　截止到2017年年末，中国移动4G用户累计6.49亿人，而中国电信4G用户、中国联通4G用户分别仅有1.82亿人、1.74亿人；如果以携号转网试点的五省（市）为参考标准，开放携号转网后，中国移动将会用户流失是巨大的，其损失是不可估量的。所以不妨猜测，中国移动必然会抵制携号转网的全面开放。</p><p>　　此前，工信部电信研究院报告曾直白地指出，用户携号转网难度大，而究其原因，是运营商为避免用户流失，通过技术手段人为设置各种门槛，阻止用户携出。所以，携号转网试点近7年仍未全面放开，这背后最大的阻碍者就是运营商。</p><p>　　除了\"身不由己\"，也有好消息</p><p>　　不过，对于消费者似乎也有好消息，2017年8月，工信部在一份“十三五规划纲要”文件中，明确指出要在2020年全国范围内推行携号转网服务。另外还有消息称，工信部将开展“异网漫游”试点，用户可在保持号码不变、归属运营商不变的情况下，使用其他运营商的网络。打比方来说，在联通信号弱、移动信号强的区域，联通用户可使用移动的网络。</p><p>　　不管是携号转网还是异网漫游，成为现实都将有很长的路要走。不过我们可以以取消漫游资费来做参照，国内漫游费伴随手机用户20多个年头，堪称化石费用，但是去年在国家强令要求下，很快就被取消了；所以说，携号转网、异网漫游或许也会通过类似方法成功实现。</p><p>　　如果携号转网最终能够全国落实，对于用户来说是一个利好消息，有了流通选择业务的自由，以前卖方强势运营商说了算的时代将成为过去。自由竞争的市场，不管是在资费还是在服务水平上，几大运营商都要展开积极的调整来吸引用户，最终不管是资费下降还是服务提升获利的还是消费者。</p><p>　　如果携号转网全面开放，对于中国电信和中国联通来说，也是一大利好，因为在4G时代，两者就确立4G网络共享、融合发展的策略，能够想象，携号转网开放后，中国联通与中国电信之间的用户携出与携入必将十分活跃，变得更加频繁。而对于中国移动来说，如果舍不得让利，一旦携号转网全面放开，用户的选择更多样更自由，中国移动估计要哭晕在厕所。</p><p>　　最后，对于携号转网大家怎么看？如果携号转网全面开放，你们会投到哪家阵营下？</p><div><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=939596530,3947916671&amp;fm=173&amp;s=F33B30C4462548B61D1264D00300309A&amp;w=600&amp;h=398&amp;img.JPEG\" data-loaded=\"0\"></div>', '7', '1', '2018-02-24 09:32:59', '2018-02-24 09:32:59', '1000');
INSERT INTO `article_tb` VALUES ('11', '测试文章 化肥会挥发', '', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j54usg1crv1mil2fl1e8u142511.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3qsgm10gu7pe56v66t1ak32k.mp4', '<p>化肥会测试文章 化肥会挥发</p>', '2', '1', '2018-03-27 14:48:59', '2018-03-27 14:48:59', '1005');

-- ----------------------------
-- Table structure for `banner_tb`
-- ----------------------------
DROP TABLE IF EXISTS `banner_tb`;
CREATE TABLE `banner_tb` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'bannerid',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` tinyint(4) DEFAULT '0' COMMENT '类型，默认1首页轮播，2视频，3文章',
  `img_address` varchar(255) DEFAULT NULL COMMENT '图片',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `link` varchar(255) DEFAULT NULL COMMENT '链接',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，默认0下架，1上架',
  PRIMARY KEY (`banner_id`),
  KEY `INDEX_TYPE` (`type`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COMMENT='banner表';

-- ----------------------------
-- Records of banner_tb
-- ----------------------------
INSERT INTO `banner_tb` VALUES ('1000', '武庚纪', '1', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1515385308,354501896&fm=173&app=25&f=JPEG?w=218&h=146&s=EFBC07C74A3043940695C4BB03007013', '武庚纪：紫电再次上线，英雄救美并趁机告白，阿岚会接受他吗？', 'https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_9243077454081329555%22%7D&n_type=0&p_from=1', '2018-03-30 17:58:46', '1');
INSERT INTO `banner_tb` VALUES ('1001', '一户人家被19座坟墓包围', '1', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2218809317,527006108&fm=173&app=12&f=JPEG?w=218&h=146&s=BF94598445850EE820B0FCB60300A081', '一户人家被19座坟墓包围：开门见坟 最近半米\n', 'https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_7990631491843176035%22%7D&n_type=0&p_from=1', '2018-03-30 18:00:08', '1');
INSERT INTO `banner_tb` VALUES ('1002', '连续第三年裁员或涉及千人', '3', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2517002031,3108225445&fm=173&app=12&f=JPEG?w=218&h=146&s=C03417D05E614B1F7480E8010300F0E3', '连续第三年裁员或涉及千人，魅族官方称是末位淘汰不超10%', 'https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_7990631491843176035%22%7D&n_type=0&p_from=1', '2018-03-30 18:00:42', '1');
INSERT INTO `banner_tb` VALUES ('1003', '独孤天下', '2', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=37681831,3945139552&fm=173&app=25&f=JPEG?w=218&h=146&s=D5600CAB12AF86FC119938B403009040', '《独孤天下》独孤般若凄美下线 安以轩虐心演绎', 'https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_10862629842721736047%22%7D&n_type=0&p_from=1', '2018-03-30 18:02:23', '1');

-- ----------------------------
-- Table structure for `config_tb`
-- ----------------------------
DROP TABLE IF EXISTS `config_tb`;
CREATE TABLE `config_tb` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `customer_service_phone` varchar(255) DEFAULT NULL COMMENT '客服电话',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
-- Records of config_tb
-- ----------------------------
INSERT INTO `config_tb` VALUES ('1000', '400-0000-000', '2018-02-05 13:41:05', '2018-02-05 14:32:12');

-- ----------------------------
-- Table structure for `distribute_tb`
-- ----------------------------
DROP TABLE IF EXISTS `distribute_tb`;
CREATE TABLE `distribute_tb` (
  `distribute_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分发id',
  `realname` varchar(255) DEFAULT NULL COMMENT '购买人',
  `number` int(4) DEFAULT NULL COMMENT '数量，默认1张',
  `price` decimal(11,2) DEFAULT NULL COMMENT '金额',
  `distribute_date` datetime DEFAULT NULL COMMENT '分发时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '分发状态，默认1已分发',
  `account_id` int(11) DEFAULT NULL COMMENT '账户自身id,邀请码',
  `buy_account_id` int(11) DEFAULT NULL COMMENT '购买者id,外键',
  PRIMARY KEY (`distribute_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_BUYACCOUNTID` (`buy_account_id`) USING BTREE,
  KEY `INDEX_DISTRIBUTEDATE` (`distribute_date`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COMMENT='分发表';

-- ----------------------------
-- Records of distribute_tb
-- ----------------------------
INSERT INTO `distribute_tb` VALUES ('1000', '舒靖宇', '1', '365.00', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1', '1000', '1010');
INSERT INTO `distribute_tb` VALUES ('1001', '谢威', '1', '365.00', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1', '1000', '1009');
INSERT INTO `distribute_tb` VALUES ('1002', '小胖子', '1', '365.00', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1', '1000', '1014');

-- ----------------------------
-- Table structure for `feedback_tb`
-- ----------------------------
DROP TABLE IF EXISTS `feedback_tb`;
CREATE TABLE `feedback_tb` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '意见反馈id',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `account_id` int(11) DEFAULT NULL COMMENT '提交人账户id外键',
  `phone` varchar(255) DEFAULT NULL COMMENT '提交人注册手机号',
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

-- ----------------------------
-- Records of feedback_tb
-- ----------------------------
INSERT INTO `feedback_tb` VALUES ('1000', '生活多美好！', '2018-02-05 14:35:59', '1000', '15111336587');

-- ----------------------------
-- Table structure for `finance_record_tb`
-- ----------------------------
DROP TABLE IF EXISTS `finance_record_tb`;
CREATE TABLE `finance_record_tb` (
  `finance_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '财务记录id',
  `method` tinyint(4) DEFAULT NULL COMMENT '方式，1支付宝，2微信,3余额支付,4ios内购',
  `type` tinyint(4) DEFAULT NULL COMMENT '类型，1账户充值，2账户提现,3招收学员佣金,4推荐佣金,5团购账单,6拆分账单,7二级团购奖励,8vip购买,9分发奖励，10二级购买vip奖励,11付费课程购买',
  `transaction_number` varchar(255) DEFAULT NULL COMMENT '交易单号',
  `money` decimal(11,2) DEFAULT '0.00' COMMENT '金额',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，默认1待处理，2成功，3已拒绝',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id,外键',
  PRIMARY KEY (`finance_record_id`),
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_METHOD` (`method`) USING BTREE,
  KEY `INDEX_TYPE` (`type`) USING BTREE,
  KEY `INDEX_TRANSACTIONNUMBER` (`transaction_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1062 DEFAULT CHARSET=utf8 COMMENT='财务记录表 ';

-- ----------------------------
-- Records of finance_record_tb
-- ----------------------------
INSERT INTO `finance_record_tb` VALUES ('1000', '2', '1', '12552018020415050511009', '704535.00', '2', '2018-02-04 15:05:06', '2018-02-04 15:05:06', '1009');
INSERT INTO `finance_record_tb` VALUES ('1002', '2', '2', '37442018020415270911009', '200.00', '2', '2018-02-04 15:27:10', '2018-02-26 16:18:12', '1009');
INSERT INTO `finance_record_tb` VALUES ('1003', '2', '2', '98252018020415280711009', '100000.00', '1', '2018-02-04 15:28:08', '2018-02-04 15:28:08', '1009');
INSERT INTO `finance_record_tb` VALUES ('1004', '2', '1', '31372018020415414411009', '64949.00', '2', '2018-02-04 15:41:44', '2018-02-04 15:41:44', '1009');
INSERT INTO `finance_record_tb` VALUES ('1005', '2', '2', '40662018020415415811009', '600000.00', '1', '2018-02-04 15:41:58', '2018-02-04 15:41:58', '1009');
INSERT INTO `finance_record_tb` VALUES ('1006', '2', '1', '16202018020420321211010', '100000.00', '2', '2018-02-04 20:32:13', '2018-02-04 20:32:13', '1010');
INSERT INTO `finance_record_tb` VALUES ('1007', '1', '1', '71692018020420585311010', '10000.00', '2', '2018-02-04 20:58:53', '2018-02-04 20:58:53', '1010');
INSERT INTO `finance_record_tb` VALUES ('1008', '2', '1', '53902018020421015911010', '10000.00', '2', '2018-02-04 21:01:59', '2018-02-04 21:01:59', '1010');
INSERT INTO `finance_record_tb` VALUES ('1009', '1', '1', '39242018020421021411010', '10000.00', '2', '2018-02-04 21:02:14', '2018-02-04 21:02:14', '1010');
INSERT INTO `finance_record_tb` VALUES ('1010', '1', '2', '12192018020421094211010', '10000.00', '1', '2018-02-04 21:09:42', '2018-02-04 21:09:42', '1010');
INSERT INTO `finance_record_tb` VALUES ('1011', '2', '2', '26592018020421123811010', '10000.00', '1', '2018-02-04 21:12:38', '2018-02-04 21:12:38', '1010');
INSERT INTO `finance_record_tb` VALUES ('1012', '2', '8', '41592018020517091918768', '365.00', '2', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1010');
INSERT INTO `finance_record_tb` VALUES ('1013', '2', '9', '74502018020517091914980', '365.00', '2', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1000');
INSERT INTO `finance_record_tb` VALUES ('1014', '3', '11', '56842018020521043315760', '1111.00', '2', '2018-02-05 21:04:34', '2018-02-05 21:04:34', '1009');
INSERT INTO `finance_record_tb` VALUES ('1015', '3', '11', '68402018020521043712938', '1111.00', '2', '2018-02-05 21:04:37', '2018-02-05 21:04:37', '1009');
INSERT INTO `finance_record_tb` VALUES ('1016', '3', '11', '80462018020522392711828', '1111.00', '2', '2018-02-05 22:39:27', '2018-02-05 22:39:27', '1009');
INSERT INTO `finance_record_tb` VALUES ('1017', '2', '8', '60892018020615351812719', '365.00', '2', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1009');
INSERT INTO `finance_record_tb` VALUES ('1018', '2', '9', '22832018020615351817508', '365.00', '2', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1000');
INSERT INTO `finance_record_tb` VALUES ('1019', '2', '2', '53972018020700501311009', '556.00', '1', '2018-02-07 00:50:13', '2018-02-07 00:50:13', '1009');
INSERT INTO `finance_record_tb` VALUES ('1020', '2', '1', '64372018020814143211011', '1.00', '2', '2018-02-08 14:14:33', '2018-02-08 14:14:33', '1011');
INSERT INTO `finance_record_tb` VALUES ('1021', '1', '1', '98912018020814151711011', '20000.00', '2', '2018-02-08 14:15:18', '2018-02-08 14:15:18', '1011');
INSERT INTO `finance_record_tb` VALUES ('1022', '2', '1', '44742018020814154111011', '200000000.00', '2', '2018-02-08 14:15:42', '2018-02-08 14:15:42', '1011');
INSERT INTO `finance_record_tb` VALUES ('1023', '3', '5', '49192018020915415514850', '4500.00', '2', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1009');
INSERT INTO `finance_record_tb` VALUES ('1024', '2', '11', '77182018021002040215929', '1111.00', '2', '2018-02-10 02:04:02', '2018-02-10 02:04:02', '1010');
INSERT INTO `finance_record_tb` VALUES ('1025', '1', '1', '80892018021012342411010', '10000.00', '2', '2018-02-10 12:34:24', '2018-02-10 12:34:24', '1010');
INSERT INTO `finance_record_tb` VALUES ('1026', '1', '1', '85242018021012352911010', '10000.00', '2', '2018-02-10 12:35:29', '2018-02-10 12:35:29', '1010');
INSERT INTO `finance_record_tb` VALUES ('1027', '2', '2', '44402018021012371111010', '1000.00', '1', '2018-02-10 12:37:11', '2018-02-10 12:37:11', '1010');
INSERT INTO `finance_record_tb` VALUES ('1028', '2', '1', '88332018021013243811014', '10000.00', '2', '2018-02-10 13:24:38', '2018-02-10 13:24:38', '1014');
INSERT INTO `finance_record_tb` VALUES ('1029', '3', '8', '84672018021013590514370', '365.00', '2', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1014');
INSERT INTO `finance_record_tb` VALUES ('1030', '3', '9', '76642018021013590512601', '146.00', '2', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1000');
INSERT INTO `finance_record_tb` VALUES ('1031', '3', '11', '92812018022216145214806', '0.01', '2', '2018-02-22 16:14:52', '2018-02-22 16:14:52', '1000');
INSERT INTO `finance_record_tb` VALUES ('1032', '3', '11', '66682018022314201312672', '0.01', '2', '2018-02-23 14:20:13', '2018-02-23 14:20:13', '1016');
INSERT INTO `finance_record_tb` VALUES ('1033', '3', '6', '29932018022409231317201', '1800.00', '2', '2018-02-24 09:23:14', '2018-02-24 09:23:14', '1000');
INSERT INTO `finance_record_tb` VALUES ('1034', '1', '5', '95652018022411073017401', '25000.00', '2', '2018-02-24 11:07:30', '2018-02-24 11:07:30', '1009');
INSERT INTO `finance_record_tb` VALUES ('1035', '2', '2', '33082018022414240011009', '60895.00', '1', '2018-02-24 14:24:01', '2018-02-24 14:24:01', '1009');
INSERT INTO `finance_record_tb` VALUES ('1036', '1', '6', '81902018022418000418117', '10000.00', '2', '2018-02-24 18:00:04', '2018-02-24 18:00:04', '1000');
INSERT INTO `finance_record_tb` VALUES ('1037', '1', '11', '93672018022717262614906', '0.01', '2', '2018-02-27 17:26:27', '2018-02-27 17:26:27', '1009');
INSERT INTO `finance_record_tb` VALUES ('1038', '1', '11', '53142018022810044611238', '0.01', '2', '2018-02-28 10:04:47', '2018-02-28 10:04:47', '1010');
INSERT INTO `finance_record_tb` VALUES ('1039', '2', '2', '27532018022811332411010', '1000.00', '1', '2018-02-28 11:33:24', '2018-02-28 11:33:24', '1010');
INSERT INTO `finance_record_tb` VALUES ('1040', '1', '2', '60552018022811513911010', '1000.00', '1', '2018-02-28 11:51:39', '2018-02-28 11:51:39', '1010');
INSERT INTO `finance_record_tb` VALUES ('1041', '1', '2', '41512018022812205411010', '1000.00', '1', '2018-02-28 12:20:54', '2018-02-28 12:20:54', '1010');
INSERT INTO `finance_record_tb` VALUES ('1042', '2', '2', '71402018022814234911010', '1000.00', '1', '2018-02-28 14:23:49', '2018-02-28 14:23:49', '1010');
INSERT INTO `finance_record_tb` VALUES ('1043', '1', '1', '86352018022815131111009', '0.01', '2', '2018-02-28 15:13:28', '2018-02-28 15:13:28', '1009');
INSERT INTO `finance_record_tb` VALUES ('1044', '1', '1', '39382018022815212611009', '0.01', '2', '2018-02-28 15:21:42', '2018-02-28 15:21:42', '1009');
INSERT INTO `finance_record_tb` VALUES ('1045', '1', '1', '11602018022815231311009', '0.01', '2', '2018-02-28 15:23:29', '2018-02-28 15:23:29', '1009');
INSERT INTO `finance_record_tb` VALUES ('1046', '1', '11', '93802018022821342817303', '0.01', '2', '2018-02-28 21:34:28', '2018-02-28 21:34:28', '1000');
INSERT INTO `finance_record_tb` VALUES ('1047', '1', '11', '89932018030113380315790', '0.01', '2', '2018-03-01 13:38:04', '2018-03-01 13:38:04', '1018');
INSERT INTO `finance_record_tb` VALUES ('1048', '3', '5', '1010201803051235007834', '4500.00', '2', '2018-03-05 12:35:01', '2018-03-05 12:35:01', '1010');
INSERT INTO `finance_record_tb` VALUES ('1049', '3', '6', '47402018030611484015847', '1800.00', '2', '2018-03-06 11:48:41', '2018-03-06 11:48:41', '1000');
INSERT INTO `finance_record_tb` VALUES ('1050', '1', '11', '1018201803081753232459', '0.01', '2', '2018-03-08 17:53:23', '2018-03-08 17:53:23', '1018');
INSERT INTO `finance_record_tb` VALUES ('1051', '2', '2', '1010201803122206421333', '1.00', '1', '2018-03-12 22:06:43', '2018-03-12 22:06:43', '1010');
INSERT INTO `finance_record_tb` VALUES ('1052', '3', '11', '1010201803130051233221', '0.01', '2', '2018-03-13 00:51:24', '2018-03-13 00:51:24', '1010');
INSERT INTO `finance_record_tb` VALUES ('1053', '3', '5', '1010201803130106133218', '25000.00', '2', '2018-03-13 01:06:14', '2018-03-13 01:06:14', '1010');
INSERT INTO `finance_record_tb` VALUES ('1054', '3', '6', '33742018031316475918526', '10000.00', '2', '2018-03-13 16:47:59', '2018-03-13 16:47:59', '1000');
INSERT INTO `finance_record_tb` VALUES ('1055', '3', '11', '1014201803140932052849', '1111.00', '2', '2018-03-14 09:32:06', '2018-03-14 09:32:06', '1014');
INSERT INTO `finance_record_tb` VALUES ('1056', '1', '2', '1014201803140942147297', '100.00', '1', '2018-03-14 09:42:14', '2018-03-14 09:42:14', '1014');
INSERT INTO `finance_record_tb` VALUES ('1057', '1', '2', '1014201803140942307390', '844.00', '1', '2018-03-14 09:42:31', '2018-03-14 09:42:31', '1014');
INSERT INTO `finance_record_tb` VALUES ('1058', '1', '2', '1014201803140943148339', '7580.00', '1', '2018-03-14 09:43:14', '2018-03-14 09:43:14', '1014');
INSERT INTO `finance_record_tb` VALUES ('1059', '2', '2', '1010201803152302297561', '1.00', '1', '2018-03-15 23:02:30', '2018-03-15 23:02:30', '1010');
INSERT INTO `finance_record_tb` VALUES ('1060', '1', '11', '1016201803261720471004', '0.01', '2', '2018-03-26 17:20:47', '2018-03-26 17:20:47', '1016');
INSERT INTO `finance_record_tb` VALUES ('1061', '1', '1', '1016201803271531246309', '0.01', '2', '2018-03-27 15:31:28', '2018-03-27 15:31:28', '1016');

-- ----------------------------
-- Table structure for `finance_tb`
-- ----------------------------
DROP TABLE IF EXISTS `finance_tb`;
CREATE TABLE `finance_tb` (
  `finance_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '财务id',
  `password` varchar(255) DEFAULT NULL COMMENT '支付密码',
  `money` decimal(11,2) DEFAULT '0.00' COMMENT '余额',
  `recharge` decimal(11,2) DEFAULT '0.00' COMMENT '充值金额',
  `consume` decimal(11,2) DEFAULT '0.00' COMMENT '消费金额',
  `withdrawals` decimal(11,2) DEFAULT '0.00' COMMENT '提现金额',
  `recruiting_commission` decimal(11,2) DEFAULT '0.00' COMMENT '招收学员佣金',
  `recommend_commission` decimal(11,2) DEFAULT '0.00' COMMENT '推荐佣金',
  `team_purchase_price` decimal(11,2) DEFAULT '0.00' COMMENT '团购账单',
  `split_reward` decimal(11,2) DEFAULT '0.00' COMMENT '拆分奖励',
  `split_parent_reward` decimal(11,2) DEFAULT '0.00' COMMENT '拆分上级奖励',
  `base_profit` decimal(11,2) DEFAULT '0.00' COMMENT '赠送金钱',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`finance_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8 COMMENT='财务表';

-- ----------------------------
-- Records of finance_tb
-- ----------------------------
INSERT INTO `finance_tb` VALUES ('1000', '11874bb6149dd45428da628c9766b252', '24037.99', '0.00', '0.01', '0.00', '0.00', '0.00', '0.00', '24038.00', '0.00', '0.00', '1000', '2018-01-19 15:46:08', '2018-03-13 16:47:59');
INSERT INTO `finance_tb` VALUES ('1005', '11874bb6149dd45428da628c9766b252', '0.03', '769484.03', '5611.00', '761651.00', '0.00', '0.00', '4500.00', '0.00', '0.00', '0.00', '1009', '2018-01-27 18:21:05', '2018-02-28 15:23:29');
INSERT INTO `finance_tb` VALUES ('1006', '11874bb6149dd45428da628c9766b252', '95497.99', '150000.00', '29500.01', '25002.00', '0.00', '0.00', '29500.00', '0.00', '0.00', '0.00', '1010', '2018-01-27 20:23:22', '2018-03-15 23:02:30');
INSERT INTO `finance_tb` VALUES ('1007', null, '200020001.00', '200020001.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1011', '2018-02-06 16:39:35', '2018-02-08 14:15:42');
INSERT INTO `finance_tb` VALUES ('1008', '11874bb6149dd45428da628c9766b252', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1012', '2018-02-07 01:15:45', '2018-03-12 17:05:13');
INSERT INTO `finance_tb` VALUES ('1009', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1013', '2018-02-10 13:13:19', '2018-02-10 13:13:19');
INSERT INTO `finance_tb` VALUES ('1010', '11874bb6149dd45428da628c9766b252', '0.00', '10000.00', '1476.00', '8524.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1014', '2018-02-10 13:19:45', '2018-03-14 09:43:14');
INSERT INTO `finance_tb` VALUES ('1011', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1015', '2018-02-22 16:43:03', '2018-02-22 16:43:03');
INSERT INTO `finance_tb` VALUES ('1012', '9a4dc3c8d8a5292000960aa991369e4e', '0.01', '0.01', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1016', '2018-02-23 14:07:13', '2018-03-27 15:31:28');
INSERT INTO `finance_tb` VALUES ('1013', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1017', '2018-02-28 17:54:43', '2018-02-28 17:54:43');
INSERT INTO `finance_tb` VALUES ('1014', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1018', '2018-03-01 13:23:55', '2018-03-01 13:23:55');
INSERT INTO `finance_tb` VALUES ('1015', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1019', '2018-03-13 09:49:12', '2018-03-13 09:49:12');
INSERT INTO `finance_tb` VALUES ('1016', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1020', '2018-03-13 16:20:27', '2018-03-13 16:20:27');
INSERT INTO `finance_tb` VALUES ('1017', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1021', '2018-03-27 14:27:41', '2018-03-27 14:27:41');

-- ----------------------------
-- Table structure for `integral_board_tb`
-- ----------------------------
DROP TABLE IF EXISTS `integral_board_tb`;
CREATE TABLE `integral_board_tb` (
  `integral_board_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分榜id',
  `type` tinyint(4) DEFAULT '1' COMMENT '类型,1个人，2团队',
  `time_type` tinyint(4) DEFAULT '1' COMMENT '时间类型,1周，2月，3总',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `icon` varchar(255) DEFAULT NULL COMMENT '图像',
  `integral` decimal(11,2) DEFAULT '0.00' COMMENT '积分',
  `record_time` datetime DEFAULT NULL COMMENT '记录时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  PRIMARY KEY (`integral_board_id`),
  KEY `INDEX_TYPE` (`type`) USING BTREE,
  KEY `INDEX_TIMETYPE` (`time_type`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_RECORDTIME` (`record_time`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1062 DEFAULT CHARSET=utf8 COMMENT='积分榜表';

-- ----------------------------
-- Records of integral_board_tb
-- ----------------------------
INSERT INTO `integral_board_tb` VALUES ('1000', '1', '1', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '74.00', '2018-02-05 00:00:00', '2018-02-09 16:02:23', '2018-02-10 13:56:49', '1009');
INSERT INTO `integral_board_tb` VALUES ('1001', '1', '2', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '180.00', '2018-02-01 00:00:00', '2018-02-09 16:02:23', '2018-02-28 17:47:41', '1009');
INSERT INTO `integral_board_tb` VALUES ('1002', '1', '3', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '289.00', '2018-01-01 00:00:00', '2018-02-09 16:02:23', '2018-03-27 13:18:42', '1009');
INSERT INTO `integral_board_tb` VALUES ('1003', '2', '3', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '289.00', '2018-01-01 00:00:00', '2018-02-09 16:02:23', '2018-03-27 13:18:42', '1009');
INSERT INTO `integral_board_tb` VALUES ('1005', '1', '1', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '36.00', '2018-02-05 00:00:00', '2018-02-09 22:11:18', '2018-02-10 13:33:30', '1010');
INSERT INTO `integral_board_tb` VALUES ('1006', '1', '2', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '132.00', '2018-02-01 00:00:00', '2018-02-09 22:11:18', '2018-02-28 13:52:42', '1010');
INSERT INTO `integral_board_tb` VALUES ('1007', '1', '3', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '173.00', '2018-01-01 00:00:00', '2018-02-09 22:11:18', '2018-03-16 10:00:26', '1010');
INSERT INTO `integral_board_tb` VALUES ('1008', '2', '3', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '173.00', '2018-01-01 00:00:00', '2018-02-09 22:11:18', '2018-03-16 10:00:26', '1010');
INSERT INTO `integral_board_tb` VALUES ('1009', '1', '1', null, null, '91.00', '2018-02-05 00:00:00', '2018-02-09 22:27:37', '2018-02-11 22:09:41', '1000');
INSERT INTO `integral_board_tb` VALUES ('1010', '1', '2', null, null, '167.00', '2018-02-01 00:00:00', '2018-02-09 22:27:37', '2018-02-28 21:34:44', '1000');
INSERT INTO `integral_board_tb` VALUES ('1011', '1', '3', null, null, '487.00', '2018-01-01 00:00:00', '2018-02-09 22:27:37', '2018-03-28 12:37:21', '1000');
INSERT INTO `integral_board_tb` VALUES ('1012', '2', '3', null, null, '597.00', '2018-01-01 00:00:00', '2018-02-09 23:51:42', '2018-03-28 12:37:21', '1000');
INSERT INTO `integral_board_tb` VALUES ('1015', '1', '1', null, null, '10.00', '2018-02-12 00:00:00', '2018-02-12 18:36:23', '2018-02-15 22:03:50', '1000');
INSERT INTO `integral_board_tb` VALUES ('1016', '1', '1', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png', '59.00', '2018-02-19 00:00:00', '2018-02-22 16:16:02', '2018-02-24 09:24:54', '1000');
INSERT INTO `integral_board_tb` VALUES ('1017', '1', '1', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '42.00', '2018-02-19 00:00:00', '2018-02-23 09:54:01', '2018-02-23 23:57:29', '1009');
INSERT INTO `integral_board_tb` VALUES ('1018', '2', '2', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '368.00', '2018-01-01 00:00:00', '2018-02-23 09:54:01', '2018-03-27 13:18:42', '1000');
INSERT INTO `integral_board_tb` VALUES ('1019', '1', '1', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1519366739.png', '2.00', '2018-02-19 00:00:00', '2018-02-23 14:20:24', '2018-02-23 14:20:48', '1016');
INSERT INTO `integral_board_tb` VALUES ('1020', '1', '2', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1519366739.png', '4.00', '2018-02-01 00:00:00', '2018-02-23 14:20:24', '2018-02-28 17:49:16', '1016');
INSERT INTO `integral_board_tb` VALUES ('1021', '1', '3', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1519366739.png', '16.00', '2018-01-01 00:00:00', '2018-02-23 14:20:24', '2018-03-26 17:39:04', '1016');
INSERT INTO `integral_board_tb` VALUES ('1022', '2', '3', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1519366739.png', '16.00', '2018-01-01 00:00:00', '2018-02-23 14:20:24', '2018-03-26 17:39:04', '1016');
INSERT INTO `integral_board_tb` VALUES ('1023', '1', '1', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '59.00', '2018-02-19 00:00:00', '2018-02-24 13:14:45', '2018-02-25 18:55:54', '1010');
INSERT INTO `integral_board_tb` VALUES ('1024', '1', '1', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180224135432', '93.00', '2018-02-26 00:00:00', '2018-02-26 09:52:41', '2018-03-02 14:04:28', '1009');
INSERT INTO `integral_board_tb` VALUES ('1025', '1', '1', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1519451189.png', '37.00', '2018-02-26 00:00:00', '2018-02-26 13:14:50', '2018-02-28 13:52:42', '1010');
INSERT INTO `integral_board_tb` VALUES ('1026', '1', '1', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1519366739.png', '2.00', '2018-02-26 00:00:00', '2018-02-28 17:49:05', '2018-02-28 17:49:16', '1016');
INSERT INTO `integral_board_tb` VALUES ('1027', '1', '1', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png', '41.00', '2018-02-26 00:00:00', '2018-02-28 21:30:08', '2018-03-03 20:43:47', '1000');
INSERT INTO `integral_board_tb` VALUES ('1028', '1', '1', null, null, '5.00', '2018-02-26 00:00:00', '2018-03-01 13:38:16', '2018-03-01 13:38:36', '1018');
INSERT INTO `integral_board_tb` VALUES ('1029', '1', '2', null, null, '14.00', '2018-03-01 00:00:00', '2018-03-01 13:38:16', '2018-03-27 14:59:18', '1018');
INSERT INTO `integral_board_tb` VALUES ('1030', '1', '3', null, null, '14.00', '2018-01-01 00:00:00', '2018-03-01 13:38:16', '2018-03-27 14:59:18', '1018');
INSERT INTO `integral_board_tb` VALUES ('1031', '2', '3', null, null, '14.00', '2018-01-01 00:00:00', '2018-03-01 13:38:16', '2018-03-27 14:59:18', '1018');
INSERT INTO `integral_board_tb` VALUES ('1032', '2', '2', null, null, '14.00', '2018-01-01 00:00:00', '2018-03-01 13:38:16', '2018-03-27 14:59:18', '1016');
INSERT INTO `integral_board_tb` VALUES ('1033', '1', '2', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533', '109.00', '2018-03-01 00:00:00', '2018-03-01 13:51:02', '2018-03-27 13:18:42', '1009');
INSERT INTO `integral_board_tb` VALUES ('1034', '1', '2', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png', '320.00', '2018-03-01 00:00:00', '2018-03-02 11:04:06', '2018-03-28 12:37:21', '1000');
INSERT INTO `integral_board_tb` VALUES ('1035', '1', '1', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1519366739.png', '2.00', '2018-03-05 00:00:00', '2018-03-05 15:46:23', '2018-03-05 15:47:01', '1016');
INSERT INTO `integral_board_tb` VALUES ('1036', '1', '2', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1519366739.png', '12.00', '2018-03-01 00:00:00', '2018-03-05 15:46:23', '2018-03-26 17:39:04', '1016');
INSERT INTO `integral_board_tb` VALUES ('1037', '1', '1', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533', '13.00', '2018-03-05 00:00:00', '2018-03-05 15:48:52', '2018-03-08 17:41:45', '1009');
INSERT INTO `integral_board_tb` VALUES ('1038', '1', '1', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png', '37.00', '2018-03-05 00:00:00', '2018-03-08 17:23:15', '2018-03-11 05:17:07', '1000');
INSERT INTO `integral_board_tb` VALUES ('1039', '1', '1', null, null, '5.00', '2018-03-05 00:00:00', '2018-03-08 17:55:30', '2018-03-08 18:00:24', '1018');
INSERT INTO `integral_board_tb` VALUES ('1040', '1', '1', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1520035085.png', '6.00', '2018-03-05 00:00:00', '2018-03-11 04:47:43', '2018-03-11 05:13:16', '1010');
INSERT INTO `integral_board_tb` VALUES ('1041', '1', '2', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1520035085.png', '41.00', '2018-03-01 00:00:00', '2018-03-11 04:47:43', '2018-03-16 10:00:26', '1010');
INSERT INTO `integral_board_tb` VALUES ('1042', '1', '1', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533', '30.00', '2018-03-12 00:00:00', '2018-03-12 09:34:55', '2018-03-18 10:36:19', '1009');
INSERT INTO `integral_board_tb` VALUES ('1043', '1', '1', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1520035085.png', '35.00', '2018-03-12 00:00:00', '2018-03-12 11:12:31', '2018-03-16 10:00:26', '1010');
INSERT INTO `integral_board_tb` VALUES ('1044', '1', '1', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png', '56.00', '2018-03-12 00:00:00', '2018-03-12 21:04:49', '2018-03-15 19:19:20', '1000');
INSERT INTO `integral_board_tb` VALUES ('1045', '1', '1', null, 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180313162550', '1.00', '2018-03-12 00:00:00', '2018-03-13 16:43:20', '2018-03-13 16:43:20', '1018');
INSERT INTO `integral_board_tb` VALUES ('1046', '1', '1', '测试', 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1520929499.png', '2.00', '2018-03-12 00:00:00', '2018-03-13 17:20:04', '2018-03-13 17:20:14', '1016');
INSERT INTO `integral_board_tb` VALUES ('1047', '1', '1', '小胖子', '', '21.00', '2018-03-12 00:00:00', '2018-03-14 09:32:17', '2018-03-16 21:15:02', '1014');
INSERT INTO `integral_board_tb` VALUES ('1048', '1', '2', '小胖子', '', '21.00', '2018-03-01 00:00:00', '2018-03-14 09:32:17', '2018-03-16 21:15:02', '1014');
INSERT INTO `integral_board_tb` VALUES ('1049', '1', '3', '小胖子', '', '21.00', '2018-01-01 00:00:00', '2018-03-14 09:32:17', '2018-03-16 21:15:02', '1014');
INSERT INTO `integral_board_tb` VALUES ('1050', '2', '3', '小胖子', '', '21.00', '2018-01-01 00:00:00', '2018-03-14 09:32:17', '2018-03-16 21:15:02', '1014');
INSERT INTO `integral_board_tb` VALUES ('1051', '2', '2', '小胖子', '', '21.00', '2018-01-01 00:00:00', '2018-03-14 09:32:17', '2018-03-16 21:15:02', '1010');
INSERT INTO `integral_board_tb` VALUES ('1052', '1', '1', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533', '3.00', '2018-03-19 00:00:00', '2018-03-19 14:40:47', '2018-03-19 14:42:05', '1009');
INSERT INTO `integral_board_tb` VALUES ('1053', '1', '1', '测试', 'http://p2bhwwngu.bkt.clouddn.com/ios_1016_1520929499.png', '8.00', '2018-03-26 00:00:00', '2018-03-26 16:44:05', '2018-03-26 17:39:04', '1016');
INSERT INTO `integral_board_tb` VALUES ('1054', '1', '1', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180227114533', '34.00', '2018-03-26 00:00:00', '2018-03-26 17:25:23', '2018-03-27 13:18:42', '1009');
INSERT INTO `integral_board_tb` VALUES ('1055', '1', '1', '王小明', null, '53.00', '2018-03-26 00:00:00', '2018-03-27 13:19:25', '2018-03-27 13:24:13', '1019');
INSERT INTO `integral_board_tb` VALUES ('1056', '1', '2', '王小明', null, '53.00', '2018-03-01 00:00:00', '2018-03-27 13:19:25', '2018-03-27 13:24:13', '1019');
INSERT INTO `integral_board_tb` VALUES ('1057', '1', '3', '王小明', null, '53.00', '2018-01-01 00:00:00', '2018-03-27 13:19:25', '2018-03-27 13:24:13', '1019');
INSERT INTO `integral_board_tb` VALUES ('1058', '2', '3', '王小明', null, '53.00', '2018-01-01 00:00:00', '2018-03-27 13:19:25', '2018-03-27 13:24:13', '1019');
INSERT INTO `integral_board_tb` VALUES ('1059', '2', '2', '王小明', null, '53.00', '2018-01-01 00:00:00', '2018-03-27 13:19:25', '2018-03-27 13:24:13', '1009');
INSERT INTO `integral_board_tb` VALUES ('1060', '1', '1', null, 'http://p2bhwwngu.bkt.clouddn.com/ios_1000_1519287324.png', '193.00', '2018-03-26 00:00:00', '2018-03-27 13:49:42', '2018-03-28 12:37:21', '1000');
INSERT INTO `integral_board_tb` VALUES ('1061', '1', '1', null, 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180313162550', '3.00', '2018-03-26 00:00:00', '2018-03-27 14:58:52', '2018-03-27 14:59:18', '1018');

-- ----------------------------
-- Table structure for `integral_detail_tb`
-- ----------------------------
DROP TABLE IF EXISTS `integral_detail_tb`;
CREATE TABLE `integral_detail_tb` (
  `integral_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分详细id',
  `type` tinyint(4) DEFAULT '0' COMMENT '类型,0失去，1获得',
  `integral` decimal(11,2) DEFAULT '0.00' COMMENT '积分',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  PRIMARY KEY (`integral_detail_id`),
  KEY `INDEX_TYPE` (`type`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2194 DEFAULT CHARSET=utf8 COMMENT='积分详细表';

-- ----------------------------
-- Records of integral_detail_tb
-- ----------------------------
INSERT INTO `integral_detail_tb` VALUES ('1141', '1', '1.00', '2018-02-09 16:02:23', '2018-02-09 16:02:23', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1142', '1', '1.00', '2018-02-09 16:02:28', '2018-02-09 16:02:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1143', '1', '1.00', '2018-02-09 16:02:33', '2018-02-09 16:02:33', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1144', '1', '1.00', '2018-02-09 16:02:38', '2018-02-09 16:02:38', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1145', '1', '1.00', '2018-02-09 16:02:43', '2018-02-09 16:02:43', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1146', '1', '1.00', '2018-02-09 16:02:48', '2018-02-09 16:02:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1147', '1', '1.00', '2018-02-09 16:02:53', '2018-02-09 16:02:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1148', '1', '1.00', '2018-02-09 16:02:59', '2018-02-09 16:02:59', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1149', '1', '1.00', '2018-02-09 16:03:03', '2018-02-09 16:03:03', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1150', '1', '1.00', '2018-02-09 16:03:08', '2018-02-09 16:03:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1151', '1', '1.00', '2018-02-09 16:03:13', '2018-02-09 16:03:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1152', '1', '1.00', '2018-02-09 16:03:18', '2018-02-09 16:03:18', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1153', '1', '1.00', '2018-02-09 16:03:23', '2018-02-09 16:03:23', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1154', '1', '1.00', '2018-02-09 16:03:28', '2018-02-09 16:03:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1155', '1', '1.00', '2018-02-09 16:03:33', '2018-02-09 16:03:33', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1156', '1', '1.00', '2018-02-09 16:06:10', '2018-02-09 16:06:10', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1157', '1', '1.00', '2018-02-09 16:06:15', '2018-02-09 16:06:15', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1158', '1', '1.00', '2018-02-09 16:06:20', '2018-02-09 16:06:20', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1159', '1', '1.00', '2018-02-09 16:06:25', '2018-02-09 16:06:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1160', '1', '1.00', '2018-02-09 16:06:31', '2018-02-09 16:06:31', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1161', '1', '1.00', '2018-02-09 16:06:35', '2018-02-09 16:06:35', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1162', '1', '1.00', '2018-02-09 16:06:40', '2018-02-09 16:06:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1163', '1', '1.00', '2018-02-09 16:06:45', '2018-02-09 16:06:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1164', '1', '1.00', '2018-02-09 16:06:50', '2018-02-09 16:06:50', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1165', '1', '1.00', '2018-02-09 16:06:55', '2018-02-09 16:06:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1166', '1', '1.00', '2018-02-09 16:10:48', '2018-02-09 16:10:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1167', '1', '1.00', '2018-02-09 16:10:54', '2018-02-09 16:10:54', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1168', '1', '1.00', '2018-02-09 16:10:58', '2018-02-09 16:10:58', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1169', '1', '1.00', '2018-02-09 16:11:03', '2018-02-09 16:11:03', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1170', '1', '1.00', '2018-02-09 16:11:09', '2018-02-09 16:11:09', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1171', '1', '1.00', '2018-02-09 16:11:14', '2018-02-09 16:11:14', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1172', '1', '1.00', '2018-02-09 17:00:31', '2018-02-09 17:00:31', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1173', '1', '1.00', '2018-02-09 17:00:36', '2018-02-09 17:00:36', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1174', '1', '1.00', '2018-02-09 17:00:41', '2018-02-09 17:00:41', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1175', '1', '1.00', '2018-02-09 17:00:46', '2018-02-09 17:00:46', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1176', '1', '1.00', '2018-02-09 17:21:36', '2018-02-09 17:21:36', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1177', '1', '1.00', '2018-02-09 17:21:41', '2018-02-09 17:21:41', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1178', '1', '1.00', '2018-02-09 17:21:46', '2018-02-09 17:21:46', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1179', '1', '1.00', '2018-02-09 17:21:51', '2018-02-09 17:21:51', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1180', '1', '1.00', '2018-02-09 17:21:56', '2018-02-09 17:21:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1181', '1', '1.00', '2018-02-09 17:36:29', '2018-02-09 17:36:29', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1182', '1', '1.00', '2018-02-09 17:36:34', '2018-02-09 17:36:34', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1183', '1', '1.00', '2018-02-09 22:11:18', '2018-02-09 22:11:18', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1184', '1', '1.00', '2018-02-09 22:12:17', '2018-02-09 22:12:17', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1185', '1', '1.00', '2018-02-09 22:27:37', '2018-02-09 22:27:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1186', '1', '1.00', '2018-02-09 22:27:41', '2018-02-09 22:27:41', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1187', '1', '1.00', '2018-02-09 23:51:42', '2018-02-09 23:51:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1188', '1', '1.00', '2018-02-09 23:51:47', '2018-02-09 23:51:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1189', '1', '1.00', '2018-02-09 23:51:52', '2018-02-09 23:51:52', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1190', '1', '1.00', '2018-02-09 23:51:57', '2018-02-09 23:51:57', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1191', '1', '1.00', '2018-02-09 23:52:02', '2018-02-09 23:52:02', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1192', '1', '1.00', '2018-02-09 23:52:07', '2018-02-09 23:52:07', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1193', '1', '1.00', '2018-02-09 23:52:12', '2018-02-09 23:52:12', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1194', '1', '1.00', '2018-02-09 23:52:17', '2018-02-09 23:52:17', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1195', '1', '1.00', '2018-02-09 23:52:22', '2018-02-09 23:52:22', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1196', '1', '1.00', '2018-02-09 23:55:32', '2018-02-09 23:55:32', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1197', '1', '1.00', '2018-02-09 23:55:37', '2018-02-09 23:55:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1198', '1', '1.00', '2018-02-10 00:06:38', '2018-02-10 00:06:38', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1199', '1', '1.00', '2018-02-10 00:06:43', '2018-02-10 00:06:43', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1200', '1', '1.00', '2018-02-10 00:06:48', '2018-02-10 00:06:48', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1201', '1', '1.00', '2018-02-10 00:10:41', '2018-02-10 00:10:41', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1202', '1', '1.00', '2018-02-10 00:10:46', '2018-02-10 00:10:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1203', '1', '1.00', '2018-02-10 00:17:28', '2018-02-10 00:17:28', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1204', '1', '1.00', '2018-02-10 00:17:33', '2018-02-10 00:17:33', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1205', '1', '1.00', '2018-02-10 00:23:31', '2018-02-10 00:23:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1206', '1', '1.00', '2018-02-10 00:23:36', '2018-02-10 00:23:36', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1207', '1', '1.00', '2018-02-10 00:23:41', '2018-02-10 00:23:41', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1208', '1', '1.00', '2018-02-10 00:23:46', '2018-02-10 00:23:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1209', '1', '1.00', '2018-02-10 00:30:40', '2018-02-10 00:30:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1210', '1', '1.00', '2018-02-10 00:30:45', '2018-02-10 00:30:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1211', '1', '1.00', '2018-02-10 00:30:50', '2018-02-10 00:30:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1212', '1', '1.00', '2018-02-10 00:30:55', '2018-02-10 00:30:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1213', '1', '1.00', '2018-02-10 00:31:00', '2018-02-10 00:31:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1214', '1', '1.00', '2018-02-10 00:31:05', '2018-02-10 00:31:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1215', '1', '1.00', '2018-02-10 00:31:10', '2018-02-10 00:31:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1216', '1', '1.00', '2018-02-10 00:32:34', '2018-02-10 00:32:34', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1217', '1', '1.00', '2018-02-10 00:32:39', '2018-02-10 00:32:39', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1218', '1', '1.00', '2018-02-10 00:32:48', '2018-02-10 00:32:48', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1219', '1', '1.00', '2018-02-10 00:32:53', '2018-02-10 00:32:53', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1220', '1', '1.00', '2018-02-10 00:32:58', '2018-02-10 00:32:58', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1221', '1', '1.00', '2018-02-10 00:33:03', '2018-02-10 00:33:03', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1222', '1', '1.00', '2018-02-10 00:33:08', '2018-02-10 00:33:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1223', '1', '1.00', '2018-02-10 00:33:13', '2018-02-10 00:33:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1224', '1', '1.00', '2018-02-10 00:35:54', '2018-02-10 00:35:54', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1225', '1', '1.00', '2018-02-10 00:35:59', '2018-02-10 00:35:59', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1226', '1', '1.00', '2018-02-10 00:36:04', '2018-02-10 00:36:04', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1227', '1', '1.00', '2018-02-10 00:36:09', '2018-02-10 00:36:09', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1228', '1', '1.00', '2018-02-10 00:47:11', '2018-02-10 00:47:11', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1229', '1', '1.00', '2018-02-10 00:47:16', '2018-02-10 00:47:16', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1230', '1', '1.00', '2018-02-10 00:47:21', '2018-02-10 00:47:21', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1231', '1', '1.00', '2018-02-10 00:55:05', '2018-02-10 00:55:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1232', '1', '1.00', '2018-02-10 00:55:10', '2018-02-10 00:55:10', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1233', '1', '1.00', '2018-02-10 00:55:15', '2018-02-10 00:55:15', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1234', '1', '1.00', '2018-02-10 01:00:18', '2018-02-10 01:00:18', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1235', '1', '1.00', '2018-02-10 01:01:41', '2018-02-10 01:01:41', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1236', '1', '1.00', '2018-02-10 01:01:46', '2018-02-10 01:01:46', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1237', '1', '1.00', '2018-02-10 01:03:25', '2018-02-10 01:03:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1238', '1', '1.00', '2018-02-10 01:03:30', '2018-02-10 01:03:30', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1239', '1', '1.00', '2018-02-10 01:03:35', '2018-02-10 01:03:35', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1240', '1', '1.00', '2018-02-10 01:03:40', '2018-02-10 01:03:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1241', '1', '1.00', '2018-02-10 01:03:45', '2018-02-10 01:03:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1242', '1', '1.00', '2018-02-10 01:03:50', '2018-02-10 01:03:50', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1243', '1', '1.00', '2018-02-10 01:04:15', '2018-02-10 01:04:15', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1244', '1', '1.00', '2018-02-10 01:04:27', '2018-02-10 01:04:27', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1245', '1', '1.00', '2018-02-10 01:07:44', '2018-02-10 01:07:44', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1246', '1', '1.00', '2018-02-10 01:07:51', '2018-02-10 01:07:51', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1247', '1', '1.00', '2018-02-10 01:09:08', '2018-02-10 01:09:08', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1248', '1', '1.00', '2018-02-10 01:11:29', '2018-02-10 01:11:29', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1249', '1', '1.00', '2018-02-10 01:12:16', '2018-02-10 01:12:16', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1250', '1', '1.00', '2018-02-10 01:12:22', '2018-02-10 01:12:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1251', '1', '1.00', '2018-02-10 01:12:23', '2018-02-10 01:12:23', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1252', '1', '1.00', '2018-02-10 01:14:03', '2018-02-10 01:14:03', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1253', '1', '1.00', '2018-02-10 02:03:41', '2018-02-10 02:03:41', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1254', '1', '1.00', '2018-02-10 02:04:33', '2018-02-10 02:04:33', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1255', '1', '1.00', '2018-02-10 02:07:14', '2018-02-10 02:07:14', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1256', '1', '1.00', '2018-02-10 11:09:14', '2018-02-10 11:09:14', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1257', '1', '1.00', '2018-02-10 12:39:39', '2018-02-10 12:39:39', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1258', '1', '1.00', '2018-02-10 12:41:09', '2018-02-10 12:41:09', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1259', '1', '1.00', '2018-02-10 12:42:05', '2018-02-10 12:42:05', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1260', '1', '1.00', '2018-02-10 12:42:27', '2018-02-10 12:42:27', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1261', '1', '1.00', '2018-02-10 12:44:10', '2018-02-10 12:44:10', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1262', '1', '1.00', '2018-02-10 12:45:08', '2018-02-10 12:45:08', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1263', '1', '1.00', '2018-02-10 12:46:08', '2018-02-10 12:46:08', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1264', '1', '1.00', '2018-02-10 12:46:23', '2018-02-10 12:46:23', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1265', '1', '1.00', '2018-02-10 12:47:14', '2018-02-10 12:47:14', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1266', '1', '1.00', '2018-02-10 12:48:13', '2018-02-10 12:48:13', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1267', '1', '1.00', '2018-02-10 12:49:13', '2018-02-10 12:49:13', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1268', '1', '1.00', '2018-02-10 12:50:13', '2018-02-10 12:50:13', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1269', '1', '1.00', '2018-02-10 12:51:13', '2018-02-10 12:51:13', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1270', '1', '1.00', '2018-02-10 12:56:22', '2018-02-10 12:56:22', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1271', '1', '1.00', '2018-02-10 12:58:38', '2018-02-10 12:58:38', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1272', '1', '1.00', '2018-02-10 13:05:19', '2018-02-10 13:05:19', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1273', '1', '1.00', '2018-02-10 13:05:25', '2018-02-10 13:05:25', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1274', '1', '1.00', '2018-02-10 13:32:40', '2018-02-10 13:32:40', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1275', '1', '1.00', '2018-02-10 13:33:19', '2018-02-10 13:33:19', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1276', '1', '1.00', '2018-02-10 13:33:23', '2018-02-10 13:33:23', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1277', '1', '1.00', '2018-02-10 13:33:30', '2018-02-10 13:33:30', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1278', '1', '1.00', '2018-02-10 13:54:13', '2018-02-10 13:54:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1279', '1', '1.00', '2018-02-10 13:54:18', '2018-02-10 13:54:18', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1280', '1', '1.00', '2018-02-10 13:54:23', '2018-02-10 13:54:23', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1281', '1', '1.00', '2018-02-10 13:54:28', '2018-02-10 13:54:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1282', '1', '1.00', '2018-02-10 13:54:34', '2018-02-10 13:54:34', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1283', '1', '1.00', '2018-02-10 13:54:38', '2018-02-10 13:54:38', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1284', '1', '1.00', '2018-02-10 13:54:43', '2018-02-10 13:54:43', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1285', '1', '1.00', '2018-02-10 13:54:48', '2018-02-10 13:54:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1286', '1', '1.00', '2018-02-10 13:54:53', '2018-02-10 13:54:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1287', '1', '1.00', '2018-02-10 13:56:39', '2018-02-10 13:56:39', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1288', '1', '1.00', '2018-02-10 13:56:44', '2018-02-10 13:56:44', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1289', '1', '1.00', '2018-02-10 13:56:49', '2018-02-10 13:56:49', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1290', '1', '1.00', '2018-02-11 22:05:25', '2018-02-11 22:05:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1291', '1', '1.00', '2018-02-11 22:05:30', '2018-02-11 22:05:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1292', '1', '1.00', '2018-02-11 22:05:35', '2018-02-11 22:05:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1293', '1', '1.00', '2018-02-11 22:05:40', '2018-02-11 22:05:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1294', '1', '1.00', '2018-02-11 22:05:45', '2018-02-11 22:05:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1295', '1', '1.00', '2018-02-11 22:05:50', '2018-02-11 22:05:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1296', '1', '1.00', '2018-02-11 22:05:55', '2018-02-11 22:05:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1297', '1', '1.00', '2018-02-11 22:06:00', '2018-02-11 22:06:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1298', '1', '1.00', '2018-02-11 22:06:05', '2018-02-11 22:06:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1299', '1', '1.00', '2018-02-11 22:06:10', '2018-02-11 22:06:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1300', '1', '1.00', '2018-02-11 22:06:15', '2018-02-11 22:06:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1301', '1', '1.00', '2018-02-11 22:06:21', '2018-02-11 22:06:21', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1302', '1', '1.00', '2018-02-11 22:06:25', '2018-02-11 22:06:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1303', '1', '1.00', '2018-02-11 22:06:30', '2018-02-11 22:06:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1304', '1', '1.00', '2018-02-11 22:06:35', '2018-02-11 22:06:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1305', '1', '1.00', '2018-02-11 22:06:40', '2018-02-11 22:06:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1306', '1', '1.00', '2018-02-11 22:06:45', '2018-02-11 22:06:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1307', '1', '1.00', '2018-02-11 22:06:50', '2018-02-11 22:06:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1308', '1', '1.00', '2018-02-11 22:06:55', '2018-02-11 22:06:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1309', '1', '1.00', '2018-02-11 22:07:00', '2018-02-11 22:07:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1310', '1', '1.00', '2018-02-11 22:07:05', '2018-02-11 22:07:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1311', '1', '1.00', '2018-02-11 22:07:10', '2018-02-11 22:07:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1312', '1', '1.00', '2018-02-11 22:07:15', '2018-02-11 22:07:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1313', '1', '1.00', '2018-02-11 22:07:20', '2018-02-11 22:07:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1314', '1', '1.00', '2018-02-11 22:07:25', '2018-02-11 22:07:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1315', '1', '1.00', '2018-02-11 22:07:30', '2018-02-11 22:07:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1316', '1', '1.00', '2018-02-11 22:07:35', '2018-02-11 22:07:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1317', '1', '1.00', '2018-02-11 22:07:40', '2018-02-11 22:07:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1318', '1', '1.00', '2018-02-11 22:07:45', '2018-02-11 22:07:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1319', '1', '1.00', '2018-02-11 22:07:50', '2018-02-11 22:07:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1320', '1', '1.00', '2018-02-11 22:07:55', '2018-02-11 22:07:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1321', '1', '1.00', '2018-02-11 22:08:00', '2018-02-11 22:08:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1322', '1', '1.00', '2018-02-11 22:08:05', '2018-02-11 22:08:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1323', '1', '1.00', '2018-02-11 22:08:10', '2018-02-11 22:08:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1324', '1', '1.00', '2018-02-11 22:08:15', '2018-02-11 22:08:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1325', '1', '1.00', '2018-02-11 22:08:20', '2018-02-11 22:08:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1326', '1', '1.00', '2018-02-11 22:08:26', '2018-02-11 22:08:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1327', '1', '1.00', '2018-02-11 22:08:31', '2018-02-11 22:08:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1328', '1', '1.00', '2018-02-11 22:08:36', '2018-02-11 22:08:36', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1329', '1', '1.00', '2018-02-11 22:08:40', '2018-02-11 22:08:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1330', '1', '1.00', '2018-02-11 22:08:46', '2018-02-11 22:08:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1331', '1', '1.00', '2018-02-11 22:08:51', '2018-02-11 22:08:51', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1332', '1', '1.00', '2018-02-11 22:08:56', '2018-02-11 22:08:56', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1333', '1', '1.00', '2018-02-11 22:09:01', '2018-02-11 22:09:01', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1334', '1', '1.00', '2018-02-11 22:09:06', '2018-02-11 22:09:06', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1335', '1', '1.00', '2018-02-11 22:09:11', '2018-02-11 22:09:11', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1336', '1', '1.00', '2018-02-11 22:09:16', '2018-02-11 22:09:16', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1337', '1', '1.00', '2018-02-11 22:09:21', '2018-02-11 22:09:21', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1338', '1', '1.00', '2018-02-11 22:09:26', '2018-02-11 22:09:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1339', '1', '1.00', '2018-02-11 22:09:31', '2018-02-11 22:09:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1340', '1', '1.00', '2018-02-11 22:09:36', '2018-02-11 22:09:36', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1341', '1', '1.00', '2018-02-11 22:09:41', '2018-02-11 22:09:41', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1342', '1', '1.00', '2018-02-12 18:36:23', '2018-02-12 18:36:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1343', '1', '1.00', '2018-02-12 18:36:28', '2018-02-12 18:36:28', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1344', '1', '1.00', '2018-02-13 12:07:26', '2018-02-13 12:07:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1345', '1', '1.00', '2018-02-13 12:07:31', '2018-02-13 12:07:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1346', '1', '1.00', '2018-02-13 12:07:36', '2018-02-13 12:07:36', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1347', '1', '1.00', '2018-02-13 12:07:41', '2018-02-13 12:07:41', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1348', '1', '1.00', '2018-02-13 12:07:46', '2018-02-13 12:07:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1349', '1', '1.00', '2018-02-13 12:07:51', '2018-02-13 12:07:51', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1350', '1', '1.00', '2018-02-13 12:07:56', '2018-02-13 12:07:56', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1351', '1', '1.00', '2018-02-15 22:03:50', '2018-02-15 22:03:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1352', '1', '1.00', '2018-02-22 16:16:02', '2018-02-22 16:16:02', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1353', '1', '1.00', '2018-02-22 16:17:21', '2018-02-22 16:17:21', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1354', '1', '1.00', '2018-02-22 16:17:23', '2018-02-22 16:17:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1355', '1', '1.00', '2018-02-22 16:17:24', '2018-02-22 16:17:24', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1356', '1', '1.00', '2018-02-22 16:18:20', '2018-02-22 16:18:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1357', '1', '1.00', '2018-02-22 16:18:25', '2018-02-22 16:18:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1358', '1', '1.00', '2018-02-22 16:19:49', '2018-02-22 16:19:49', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1359', '1', '1.00', '2018-02-22 16:20:06', '2018-02-22 16:20:06', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1360', '1', '1.00', '2018-02-22 16:20:20', '2018-02-22 16:20:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1361', '1', '1.00', '2018-02-22 16:20:34', '2018-02-22 16:20:34', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1362', '1', '1.00', '2018-02-22 16:20:51', '2018-02-22 16:20:51', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1363', '1', '1.00', '2018-02-22 16:22:23', '2018-02-22 16:22:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1364', '1', '1.00', '2018-02-22 16:34:26', '2018-02-22 16:34:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1365', '1', '1.00', '2018-02-22 16:35:22', '2018-02-22 16:35:22', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1366', '1', '1.00', '2018-02-22 16:35:27', '2018-02-22 16:35:27', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1367', '1', '1.00', '2018-02-22 16:35:32', '2018-02-22 16:35:32', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1368', '1', '1.00', '2018-02-22 16:35:37', '2018-02-22 16:35:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1369', '1', '1.00', '2018-02-22 16:35:42', '2018-02-22 16:35:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1370', '1', '1.00', '2018-02-22 16:35:47', '2018-02-22 16:35:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1371', '1', '1.00', '2018-02-22 16:35:48', '2018-02-22 16:35:48', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1372', '1', '1.00', '2018-02-22 16:35:53', '2018-02-22 16:35:53', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1373', '1', '1.00', '2018-02-22 16:36:05', '2018-02-22 16:36:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1374', '1', '1.00', '2018-02-22 16:36:15', '2018-02-22 16:36:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1375', '1', '1.00', '2018-02-22 17:12:12', '2018-02-22 17:12:12', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1376', '1', '1.00', '2018-02-22 17:12:29', '2018-02-22 17:12:29', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1377', '1', '1.00', '2018-02-22 17:12:46', '2018-02-22 17:12:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1378', '1', '1.00', '2018-02-22 17:33:05', '2018-02-22 17:33:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1379', '1', '1.00', '2018-02-22 17:33:14', '2018-02-22 17:33:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1380', '1', '1.00', '2018-02-22 17:33:28', '2018-02-22 17:33:28', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1381', '1', '1.00', '2018-02-22 17:33:43', '2018-02-22 17:33:43', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1382', '1', '1.00', '2018-02-22 17:33:55', '2018-02-22 17:33:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1383', '1', '1.00', '2018-02-22 17:33:57', '2018-02-22 17:33:57', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1384', '1', '1.00', '2018-02-22 17:34:05', '2018-02-22 17:34:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1385', '1', '1.00', '2018-02-22 17:34:18', '2018-02-22 17:34:18', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1386', '1', '1.00', '2018-02-22 17:36:30', '2018-02-22 17:36:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1387', '1', '1.00', '2018-02-23 09:54:01', '2018-02-23 09:54:01', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1388', '1', '1.00', '2018-02-23 09:54:08', '2018-02-23 09:54:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1389', '1', '1.00', '2018-02-23 11:09:17', '2018-02-23 11:09:17', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1390', '1', '1.00', '2018-02-23 11:09:22', '2018-02-23 11:09:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1391', '1', '1.00', '2018-02-23 11:09:27', '2018-02-23 11:09:27', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1392', '1', '1.00', '2018-02-23 11:09:32', '2018-02-23 11:09:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1393', '1', '1.00', '2018-02-23 11:11:52', '2018-02-23 11:11:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1394', '1', '1.00', '2018-02-23 11:11:57', '2018-02-23 11:11:57', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1395', '1', '1.00', '2018-02-23 11:12:02', '2018-02-23 11:12:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1396', '1', '1.00', '2018-02-23 11:12:07', '2018-02-23 11:12:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1397', '1', '1.00', '2018-02-23 11:12:12', '2018-02-23 11:12:12', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1398', '1', '1.00', '2018-02-23 11:12:17', '2018-02-23 11:12:17', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1399', '1', '1.00', '2018-02-23 11:12:22', '2018-02-23 11:12:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1400', '1', '1.00', '2018-02-23 11:12:27', '2018-02-23 11:12:27', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1401', '1', '1.00', '2018-02-23 11:12:32', '2018-02-23 11:12:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1402', '1', '1.00', '2018-02-23 11:12:37', '2018-02-23 11:12:37', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1403', '1', '1.00', '2018-02-23 11:12:42', '2018-02-23 11:12:42', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1404', '1', '1.00', '2018-02-23 11:12:47', '2018-02-23 11:12:47', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1405', '1', '1.00', '2018-02-23 11:12:52', '2018-02-23 11:12:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1406', '1', '1.00', '2018-02-23 11:12:57', '2018-02-23 11:12:57', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1407', '1', '1.00', '2018-02-23 11:14:28', '2018-02-23 11:14:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1408', '1', '1.00', '2018-02-23 11:14:39', '2018-02-23 11:14:39', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1409', '1', '1.00', '2018-02-23 11:14:39', '2018-02-23 11:14:39', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1410', '1', '1.00', '2018-02-23 11:14:43', '2018-02-23 11:14:43', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1411', '1', '1.00', '2018-02-23 11:14:48', '2018-02-23 11:14:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1412', '1', '1.00', '2018-02-23 11:14:53', '2018-02-23 11:14:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1413', '1', '1.00', '2018-02-23 11:14:58', '2018-02-23 11:14:58', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1414', '1', '1.00', '2018-02-23 11:15:03', '2018-02-23 11:15:03', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1415', '1', '1.00', '2018-02-23 11:15:08', '2018-02-23 11:15:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1416', '1', '1.00', '2018-02-23 11:15:13', '2018-02-23 11:15:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1417', '1', '1.00', '2018-02-23 11:15:18', '2018-02-23 11:15:18', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1418', '1', '1.00', '2018-02-23 11:15:23', '2018-02-23 11:15:23', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1419', '1', '1.00', '2018-02-23 11:15:28', '2018-02-23 11:15:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1420', '1', '1.00', '2018-02-23 11:15:33', '2018-02-23 11:15:33', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1421', '1', '1.00', '2018-02-23 11:15:38', '2018-02-23 11:15:38', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1422', '1', '1.00', '2018-02-23 11:15:43', '2018-02-23 11:15:43', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1423', '1', '1.00', '2018-02-23 11:15:48', '2018-02-23 11:15:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1424', '1', '1.00', '2018-02-23 11:15:53', '2018-02-23 11:15:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1425', '1', '1.00', '2018-02-23 11:15:58', '2018-02-23 11:15:58', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1426', '1', '1.00', '2018-02-23 13:11:51', '2018-02-23 13:11:51', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1427', '1', '1.00', '2018-02-23 13:11:55', '2018-02-23 13:11:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1428', '1', '1.00', '2018-02-23 13:19:30', '2018-02-23 13:19:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1429', '1', '1.00', '2018-02-23 13:19:43', '2018-02-23 13:19:43', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1430', '1', '1.00', '2018-02-23 14:20:24', '2018-02-23 14:20:24', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1431', '1', '1.00', '2018-02-23 14:20:48', '2018-02-23 14:20:48', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1432', '1', '1.00', '2018-02-23 17:06:29', '2018-02-23 17:06:29', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1433', '1', '1.00', '2018-02-23 17:06:34', '2018-02-23 17:06:34', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1434', '1', '1.00', '2018-02-23 17:06:39', '2018-02-23 17:06:39', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1435', '1', '1.00', '2018-02-23 17:06:44', '2018-02-23 17:06:44', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1436', '1', '1.00', '2018-02-23 17:07:56', '2018-02-23 17:07:56', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1437', '1', '1.00', '2018-02-23 17:08:01', '2018-02-23 17:08:01', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1438', '1', '1.00', '2018-02-23 17:08:03', '2018-02-23 17:08:03', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1439', '1', '1.00', '2018-02-23 17:08:09', '2018-02-23 17:08:09', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1440', '1', '1.00', '2018-02-23 17:08:13', '2018-02-23 17:08:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1441', '1', '1.00', '2018-02-23 17:08:18', '2018-02-23 17:08:18', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1442', '1', '1.00', '2018-02-23 17:09:17', '2018-02-23 17:09:17', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1443', '1', '1.00', '2018-02-23 17:09:44', '2018-02-23 17:09:44', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1444', '1', '1.00', '2018-02-23 17:09:47', '2018-02-23 17:09:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1445', '1', '1.00', '2018-02-23 17:09:49', '2018-02-23 17:09:49', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1446', '1', '1.00', '2018-02-23 17:10:48', '2018-02-23 17:10:48', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1447', '1', '1.00', '2018-02-23 17:10:53', '2018-02-23 17:10:53', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1448', '1', '1.00', '2018-02-23 17:10:58', '2018-02-23 17:10:58', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1449', '1', '1.00', '2018-02-23 17:11:03', '2018-02-23 17:11:03', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1450', '1', '1.00', '2018-02-23 17:11:08', '2018-02-23 17:11:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1451', '1', '1.00', '2018-02-23 23:57:19', '2018-02-23 23:57:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1452', '1', '1.00', '2018-02-23 23:57:24', '2018-02-23 23:57:24', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1453', '1', '1.00', '2018-02-23 23:57:29', '2018-02-23 23:57:29', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1454', '1', '1.00', '2018-02-24 09:24:54', '2018-02-24 09:24:54', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1455', '1', '1.00', '2018-02-24 13:14:45', '2018-02-24 13:14:45', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1456', '1', '1.00', '2018-02-24 13:15:56', '2018-02-24 13:15:56', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1457', '1', '1.00', '2018-02-24 13:16:10', '2018-02-24 13:16:10', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1458', '1', '1.00', '2018-02-24 13:33:58', '2018-02-24 13:33:58', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1459', '1', '1.00', '2018-02-24 13:34:23', '2018-02-24 13:34:23', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1460', '1', '1.00', '2018-02-24 14:22:01', '2018-02-24 14:22:01', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1461', '1', '1.00', '2018-02-24 14:22:10', '2018-02-24 14:22:10', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1462', '1', '1.00', '2018-02-24 14:22:35', '2018-02-24 14:22:35', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1463', '1', '1.00', '2018-02-24 14:22:37', '2018-02-24 14:22:37', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1464', '1', '1.00', '2018-02-24 14:22:51', '2018-02-24 14:22:51', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1465', '1', '1.00', '2018-02-24 15:49:58', '2018-02-24 15:49:58', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1466', '1', '1.00', '2018-02-24 15:50:03', '2018-02-24 15:50:03', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1467', '1', '1.00', '2018-02-25 09:06:26', '2018-02-25 09:06:26', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1468', '1', '1.00', '2018-02-25 09:06:33', '2018-02-25 09:06:33', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1469', '1', '1.00', '2018-02-25 09:36:18', '2018-02-25 09:36:18', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1470', '1', '1.00', '2018-02-25 09:38:48', '2018-02-25 09:38:48', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1471', '1', '1.00', '2018-02-25 11:44:11', '2018-02-25 11:44:11', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1472', '1', '1.00', '2018-02-25 11:44:28', '2018-02-25 11:44:28', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1473', '1', '1.00', '2018-02-25 11:44:41', '2018-02-25 11:44:41', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1474', '1', '1.00', '2018-02-25 11:46:58', '2018-02-25 11:46:58', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1475', '1', '1.00', '2018-02-25 11:47:04', '2018-02-25 11:47:04', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1476', '1', '1.00', '2018-02-25 11:52:13', '2018-02-25 11:52:13', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1477', '1', '1.00', '2018-02-25 11:52:20', '2018-02-25 11:52:20', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1478', '1', '1.00', '2018-02-25 11:52:29', '2018-02-25 11:52:29', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1479', '1', '1.00', '2018-02-25 11:53:27', '2018-02-25 11:53:27', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1480', '1', '1.00', '2018-02-25 11:56:04', '2018-02-25 11:56:04', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1481', '1', '1.00', '2018-02-25 11:56:17', '2018-02-25 11:56:17', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1482', '1', '1.00', '2018-02-25 12:05:06', '2018-02-25 12:05:06', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1483', '1', '1.00', '2018-02-25 12:05:17', '2018-02-25 12:05:17', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1484', '1', '1.00', '2018-02-25 12:11:37', '2018-02-25 12:11:37', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1485', '1', '1.00', '2018-02-25 12:12:23', '2018-02-25 12:12:23', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1486', '1', '1.00', '2018-02-25 12:12:35', '2018-02-25 12:12:35', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1487', '1', '1.00', '2018-02-25 12:13:14', '2018-02-25 12:13:14', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1488', '1', '1.00', '2018-02-25 12:33:39', '2018-02-25 12:33:39', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1489', '1', '1.00', '2018-02-25 12:34:41', '2018-02-25 12:34:41', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1490', '1', '1.00', '2018-02-25 12:40:43', '2018-02-25 12:40:43', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1491', '1', '1.00', '2018-02-25 12:53:38', '2018-02-25 12:53:38', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1492', '1', '1.00', '2018-02-25 15:01:58', '2018-02-25 15:01:58', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1493', '1', '1.00', '2018-02-25 15:10:28', '2018-02-25 15:10:28', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1494', '1', '1.00', '2018-02-25 15:51:00', '2018-02-25 15:51:00', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1495', '1', '1.00', '2018-02-25 15:51:01', '2018-02-25 15:51:01', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1496', '1', '1.00', '2018-02-25 15:51:04', '2018-02-25 15:51:04', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1497', '1', '1.00', '2018-02-25 16:04:14', '2018-02-25 16:04:14', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1498', '1', '1.00', '2018-02-25 16:04:18', '2018-02-25 16:04:18', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1499', '1', '1.00', '2018-02-25 16:05:35', '2018-02-25 16:05:35', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1500', '1', '1.00', '2018-02-25 17:11:49', '2018-02-25 17:11:49', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1501', '1', '1.00', '2018-02-25 17:11:59', '2018-02-25 17:11:59', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1502', '1', '1.00', '2018-02-25 17:22:30', '2018-02-25 17:22:30', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1503', '1', '1.00', '2018-02-25 17:22:36', '2018-02-25 17:22:36', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1504', '1', '1.00', '2018-02-25 17:53:45', '2018-02-25 17:53:45', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1505', '1', '1.00', '2018-02-25 17:54:22', '2018-02-25 17:54:22', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1506', '1', '1.00', '2018-02-25 17:54:35', '2018-02-25 17:54:35', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1507', '1', '1.00', '2018-02-25 17:54:41', '2018-02-25 17:54:41', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1508', '1', '1.00', '2018-02-25 17:54:47', '2018-02-25 17:54:47', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1509', '1', '1.00', '2018-02-25 17:55:36', '2018-02-25 17:55:36', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1510', '1', '1.00', '2018-02-25 18:34:02', '2018-02-25 18:34:02', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1511', '1', '1.00', '2018-02-25 18:34:14', '2018-02-25 18:34:14', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1512', '1', '1.00', '2018-02-25 18:41:21', '2018-02-25 18:41:21', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1513', '1', '1.00', '2018-02-25 18:55:54', '2018-02-25 18:55:54', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1514', '1', '1.00', '2018-02-26 09:52:41', '2018-02-26 09:52:41', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1515', '1', '1.00', '2018-02-26 09:52:46', '2018-02-26 09:52:46', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1516', '1', '1.00', '2018-02-26 09:52:51', '2018-02-26 09:52:51', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1517', '1', '1.00', '2018-02-26 09:52:56', '2018-02-26 09:52:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1518', '1', '1.00', '2018-02-26 09:53:01', '2018-02-26 09:53:01', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1519', '1', '1.00', '2018-02-26 10:10:59', '2018-02-26 10:10:59', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1520', '1', '1.00', '2018-02-26 10:11:04', '2018-02-26 10:11:04', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1521', '1', '1.00', '2018-02-26 10:15:39', '2018-02-26 10:15:39', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1522', '1', '1.00', '2018-02-26 10:15:46', '2018-02-26 10:15:46', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1523', '1', '1.00', '2018-02-26 10:15:51', '2018-02-26 10:15:51', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1524', '1', '1.00', '2018-02-26 10:15:56', '2018-02-26 10:15:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1525', '1', '1.00', '2018-02-26 10:16:01', '2018-02-26 10:16:01', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1526', '1', '1.00', '2018-02-26 10:16:08', '2018-02-26 10:16:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1527', '1', '1.00', '2018-02-26 13:14:50', '2018-02-26 13:14:50', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1528', '1', '1.00', '2018-02-26 15:21:53', '2018-02-26 15:21:53', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1529', '1', '1.00', '2018-02-26 15:59:53', '2018-02-26 15:59:53', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1530', '1', '1.00', '2018-02-26 16:31:00', '2018-02-26 16:31:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1531', '1', '1.00', '2018-02-26 16:31:05', '2018-02-26 16:31:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1532', '1', '1.00', '2018-02-26 16:46:50', '2018-02-26 16:46:50', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1533', '1', '1.00', '2018-02-26 16:46:55', '2018-02-26 16:46:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1534', '1', '1.00', '2018-02-26 17:39:09', '2018-02-26 17:39:09', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1535', '1', '1.00', '2018-02-26 17:40:26', '2018-02-26 17:40:26', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1536', '1', '1.00', '2018-02-26 17:40:31', '2018-02-26 17:40:31', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1537', '1', '1.00', '2018-02-26 17:43:20', '2018-02-26 17:43:20', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1538', '1', '1.00', '2018-02-26 17:43:40', '2018-02-26 17:43:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1539', '1', '1.00', '2018-02-26 17:43:48', '2018-02-26 17:43:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1540', '1', '1.00', '2018-02-26 17:43:53', '2018-02-26 17:43:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1541', '1', '1.00', '2018-02-26 22:14:49', '2018-02-26 22:14:49', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1542', '1', '1.00', '2018-02-26 22:14:54', '2018-02-26 22:14:54', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1543', '1', '1.00', '2018-02-27 12:09:21', '2018-02-27 12:09:21', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1544', '1', '1.00', '2018-02-27 12:13:23', '2018-02-27 12:13:23', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1545', '1', '1.00', '2018-02-27 13:46:16', '2018-02-27 13:46:16', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1546', '1', '1.00', '2018-02-27 14:31:39', '2018-02-27 14:31:39', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1547', '1', '1.00', '2018-02-27 15:34:52', '2018-02-27 15:34:52', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1548', '1', '1.00', '2018-02-27 15:35:01', '2018-02-27 15:35:01', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1549', '1', '1.00', '2018-02-27 15:40:51', '2018-02-27 15:40:51', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1550', '1', '1.00', '2018-02-27 15:40:56', '2018-02-27 15:40:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1551', '1', '1.00', '2018-02-27 15:42:14', '2018-02-27 15:42:14', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1552', '1', '1.00', '2018-02-27 15:42:19', '2018-02-27 15:42:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1553', '1', '1.00', '2018-02-27 15:48:58', '2018-02-27 15:48:58', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1554', '1', '1.00', '2018-02-27 15:52:28', '2018-02-27 15:52:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1555', '1', '1.00', '2018-02-27 15:52:33', '2018-02-27 15:52:33', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1556', '1', '1.00', '2018-02-27 15:52:38', '2018-02-27 15:52:38', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1557', '1', '1.00', '2018-02-27 15:52:43', '2018-02-27 15:52:43', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1558', '1', '1.00', '2018-02-27 15:52:48', '2018-02-27 15:52:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1559', '1', '1.00', '2018-02-27 15:52:52', '2018-02-27 15:52:52', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1560', '1', '1.00', '2018-02-27 15:52:53', '2018-02-27 15:52:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1561', '1', '1.00', '2018-02-27 15:53:35', '2018-02-27 15:53:35', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1562', '1', '1.00', '2018-02-27 15:53:40', '2018-02-27 15:53:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1563', '1', '1.00', '2018-02-27 16:04:14', '2018-02-27 16:04:14', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1564', '1', '1.00', '2018-02-27 16:12:20', '2018-02-27 16:12:20', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1565', '1', '1.00', '2018-02-27 16:12:37', '2018-02-27 16:12:37', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1566', '1', '1.00', '2018-02-27 16:12:47', '2018-02-27 16:12:47', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1567', '1', '1.00', '2018-02-27 16:12:52', '2018-02-27 16:12:52', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1568', '1', '1.00', '2018-02-27 16:12:56', '2018-02-27 16:12:56', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1569', '1', '1.00', '2018-02-27 16:13:37', '2018-02-27 16:13:37', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1570', '1', '1.00', '2018-02-27 16:14:31', '2018-02-27 16:14:31', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1571', '1', '1.00', '2018-02-27 16:14:36', '2018-02-27 16:14:36', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1572', '1', '1.00', '2018-02-27 16:15:19', '2018-02-27 16:15:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1573', '1', '1.00', '2018-02-27 16:15:24', '2018-02-27 16:15:24', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1574', '1', '1.00', '2018-02-27 16:18:08', '2018-02-27 16:18:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1575', '1', '1.00', '2018-02-27 16:18:15', '2018-02-27 16:18:15', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1576', '1', '1.00', '2018-02-27 16:18:20', '2018-02-27 16:18:20', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1577', '1', '1.00', '2018-02-27 16:19:20', '2018-02-27 16:19:20', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1578', '1', '1.00', '2018-02-27 16:40:24', '2018-02-27 16:40:24', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1579', '1', '1.00', '2018-02-27 16:47:05', '2018-02-27 16:47:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1580', '1', '1.00', '2018-02-27 16:47:14', '2018-02-27 16:47:14', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1581', '1', '1.00', '2018-02-27 16:47:22', '2018-02-27 16:47:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1582', '1', '1.00', '2018-02-27 16:47:32', '2018-02-27 16:47:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1583', '1', '1.00', '2018-02-27 16:47:37', '2018-02-27 16:47:37', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1584', '1', '1.00', '2018-02-27 16:52:00', '2018-02-27 16:52:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1585', '1', '1.00', '2018-02-27 17:03:53', '2018-02-27 17:03:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1586', '1', '1.00', '2018-02-27 17:03:58', '2018-02-27 17:03:58', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1587', '1', '1.00', '2018-02-27 17:06:49', '2018-02-27 17:06:49', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1588', '1', '1.00', '2018-02-27 17:24:53', '2018-02-27 17:24:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1589', '1', '1.00', '2018-02-27 17:24:58', '2018-02-27 17:24:58', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1590', '1', '1.00', '2018-02-27 17:44:59', '2018-02-27 17:44:59', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1591', '1', '1.00', '2018-02-27 17:46:18', '2018-02-27 17:46:18', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1592', '1', '1.00', '2018-02-27 17:46:39', '2018-02-27 17:46:39', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1593', '1', '1.00', '2018-02-27 17:47:02', '2018-02-27 17:47:02', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1594', '1', '1.00', '2018-02-27 17:47:59', '2018-02-27 17:47:59', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1595', '1', '1.00', '2018-02-27 17:48:17', '2018-02-27 17:48:17', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1596', '1', '1.00', '2018-02-27 17:50:49', '2018-02-27 17:50:49', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1597', '1', '1.00', '2018-02-27 17:50:54', '2018-02-27 17:50:54', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1598', '1', '1.00', '2018-02-27 17:51:07', '2018-02-27 17:51:07', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1599', '1', '1.00', '2018-02-27 18:01:48', '2018-02-27 18:01:48', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1600', '1', '1.00', '2018-02-27 18:01:59', '2018-02-27 18:01:59', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1601', '1', '1.00', '2018-02-27 18:02:04', '2018-02-27 18:02:04', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1602', '1', '1.00', '2018-02-27 18:02:10', '2018-02-27 18:02:10', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1603', '1', '1.00', '2018-02-27 20:39:53', '2018-02-27 20:39:53', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1604', '1', '1.00', '2018-02-27 21:30:25', '2018-02-27 21:30:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1605', '1', '1.00', '2018-02-27 21:30:30', '2018-02-27 21:30:30', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1606', '1', '1.00', '2018-02-28 10:05:18', '2018-02-28 10:05:18', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1607', '1', '1.00', '2018-02-28 11:09:32', '2018-02-28 11:09:32', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1608', '1', '1.00', '2018-02-28 11:09:53', '2018-02-28 11:09:53', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1609', '1', '1.00', '2018-02-28 11:29:22', '2018-02-28 11:29:22', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1610', '1', '1.00', '2018-02-28 13:52:42', '2018-02-28 13:52:42', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1611', '1', '1.00', '2018-02-28 17:47:26', '2018-02-28 17:47:26', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1612', '1', '1.00', '2018-02-28 17:47:31', '2018-02-28 17:47:31', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1613', '1', '1.00', '2018-02-28 17:47:36', '2018-02-28 17:47:36', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1614', '1', '1.00', '2018-02-28 17:47:41', '2018-02-28 17:47:41', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1615', '1', '1.00', '2018-02-28 17:49:05', '2018-02-28 17:49:05', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1616', '1', '1.00', '2018-02-28 17:49:16', '2018-02-28 17:49:16', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1617', '1', '1.00', '2018-02-28 21:30:08', '2018-02-28 21:30:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1618', '1', '1.00', '2018-02-28 21:30:13', '2018-02-28 21:30:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1619', '1', '1.00', '2018-02-28 21:30:18', '2018-02-28 21:30:18', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1620', '1', '1.00', '2018-02-28 21:30:23', '2018-02-28 21:30:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1621', '1', '1.00', '2018-02-28 21:33:31', '2018-02-28 21:33:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1622', '1', '1.00', '2018-02-28 21:34:39', '2018-02-28 21:34:39', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1623', '1', '1.00', '2018-02-28 21:34:44', '2018-02-28 21:34:44', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1624', '1', '1.00', '2018-03-01 13:38:16', '2018-03-01 13:38:16', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1625', '1', '1.00', '2018-03-01 13:38:21', '2018-03-01 13:38:21', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1626', '1', '1.00', '2018-03-01 13:38:26', '2018-03-01 13:38:26', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1627', '1', '1.00', '2018-03-01 13:38:31', '2018-03-01 13:38:31', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1628', '1', '1.00', '2018-03-01 13:38:36', '2018-03-01 13:38:36', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1629', '1', '1.00', '2018-03-01 13:51:02', '2018-03-01 13:51:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1630', '1', '1.00', '2018-03-01 13:51:07', '2018-03-01 13:51:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1631', '1', '1.00', '2018-03-01 13:51:12', '2018-03-01 13:51:12', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1632', '1', '1.00', '2018-03-01 13:51:17', '2018-03-01 13:51:17', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1633', '1', '1.00', '2018-03-01 13:51:22', '2018-03-01 13:51:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1634', '1', '1.00', '2018-03-01 13:51:27', '2018-03-01 13:51:27', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1635', '1', '1.00', '2018-03-01 13:51:32', '2018-03-01 13:51:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1636', '1', '1.00', '2018-03-01 13:51:37', '2018-03-01 13:51:37', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1637', '1', '1.00', '2018-03-01 13:51:42', '2018-03-01 13:51:42', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1638', '1', '1.00', '2018-03-01 13:58:47', '2018-03-01 13:58:47', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1639', '1', '1.00', '2018-03-01 13:58:52', '2018-03-01 13:58:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1640', '1', '1.00', '2018-03-01 13:58:57', '2018-03-01 13:58:57', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1641', '1', '1.00', '2018-03-01 13:59:02', '2018-03-01 13:59:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1642', '1', '1.00', '2018-03-01 14:03:39', '2018-03-01 14:03:39', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1643', '1', '1.00', '2018-03-01 14:03:44', '2018-03-01 14:03:44', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1644', '1', '1.00', '2018-03-01 16:36:07', '2018-03-01 16:36:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1645', '1', '1.00', '2018-03-01 16:36:09', '2018-03-01 16:36:09', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1646', '1', '1.00', '2018-03-01 16:36:14', '2018-03-01 16:36:14', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1647', '1', '1.00', '2018-03-01 16:36:19', '2018-03-01 16:36:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1648', '1', '1.00', '2018-03-02 11:04:06', '2018-03-02 11:04:06', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1649', '1', '1.00', '2018-03-02 11:04:09', '2018-03-02 11:04:09', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1650', '1', '1.00', '2018-03-02 11:04:20', '2018-03-02 11:04:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1651', '1', '1.00', '2018-03-02 11:04:25', '2018-03-02 11:04:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1652', '1', '1.00', '2018-03-02 11:04:30', '2018-03-02 11:04:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1653', '1', '1.00', '2018-03-02 11:04:37', '2018-03-02 11:04:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1654', '1', '1.00', '2018-03-02 11:05:05', '2018-03-02 11:05:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1655', '1', '1.00', '2018-03-02 11:05:10', '2018-03-02 11:05:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1656', '1', '1.00', '2018-03-02 11:05:16', '2018-03-02 11:05:16', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1657', '1', '1.00', '2018-03-02 11:13:02', '2018-03-02 11:13:02', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1658', '1', '1.00', '2018-03-02 11:13:07', '2018-03-02 11:13:07', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1659', '1', '1.00', '2018-03-02 11:40:24', '2018-03-02 11:40:24', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1660', '1', '1.00', '2018-03-02 11:40:37', '2018-03-02 11:40:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1661', '1', '1.00', '2018-03-02 11:40:42', '2018-03-02 11:40:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1662', '1', '1.00', '2018-03-02 11:48:34', '2018-03-02 11:48:34', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1663', '1', '1.00', '2018-03-02 11:48:39', '2018-03-02 11:48:39', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1664', '1', '1.00', '2018-03-02 11:48:41', '2018-03-02 11:48:41', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1665', '1', '1.00', '2018-03-02 11:48:46', '2018-03-02 11:48:46', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1666', '1', '1.00', '2018-03-02 11:54:12', '2018-03-02 11:54:12', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1667', '1', '1.00', '2018-03-02 11:54:18', '2018-03-02 11:54:18', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1668', '1', '1.00', '2018-03-02 11:59:27', '2018-03-02 11:59:27', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1669', '1', '1.00', '2018-03-02 11:59:42', '2018-03-02 11:59:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1670', '1', '1.00', '2018-03-02 11:59:47', '2018-03-02 11:59:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1671', '1', '1.00', '2018-03-02 14:04:13', '2018-03-02 14:04:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1672', '1', '1.00', '2018-03-02 14:04:20', '2018-03-02 14:04:20', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1673', '1', '1.00', '2018-03-02 14:04:23', '2018-03-02 14:04:23', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1674', '1', '1.00', '2018-03-02 14:04:28', '2018-03-02 14:04:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1675', '1', '1.00', '2018-03-03 15:30:54', '2018-03-03 15:30:54', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1676', '1', '1.00', '2018-03-03 15:30:59', '2018-03-03 15:30:59', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1677', '1', '1.00', '2018-03-03 15:31:06', '2018-03-03 15:31:06', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1678', '1', '1.00', '2018-03-03 15:31:09', '2018-03-03 15:31:09', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1679', '1', '1.00', '2018-03-03 15:31:13', '2018-03-03 15:31:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1680', '1', '1.00', '2018-03-03 15:31:19', '2018-03-03 15:31:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1681', '1', '1.00', '2018-03-03 15:31:24', '2018-03-03 15:31:24', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1682', '1', '1.00', '2018-03-03 15:31:28', '2018-03-03 15:31:28', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1683', '1', '1.00', '2018-03-03 15:31:34', '2018-03-03 15:31:34', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1684', '1', '1.00', '2018-03-03 15:31:45', '2018-03-03 15:31:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1685', '1', '1.00', '2018-03-03 15:31:55', '2018-03-03 15:31:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1686', '1', '1.00', '2018-03-03 15:31:55', '2018-03-03 15:31:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1687', '1', '1.00', '2018-03-03 15:32:13', '2018-03-03 15:32:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1688', '1', '1.00', '2018-03-03 15:32:13', '2018-03-03 15:32:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1689', '1', '1.00', '2018-03-03 15:32:13', '2018-03-03 15:32:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1690', '1', '1.00', '2018-03-03 15:32:14', '2018-03-03 15:32:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1691', '1', '1.00', '2018-03-03 20:43:47', '2018-03-03 20:43:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1692', '1', '1.00', '2018-03-05 15:46:23', '2018-03-05 15:46:23', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1693', '1', '1.00', '2018-03-05 15:47:01', '2018-03-05 15:47:01', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1694', '1', '1.00', '2018-03-05 15:48:52', '2018-03-05 15:48:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1695', '1', '1.00', '2018-03-05 15:49:00', '2018-03-05 15:49:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1696', '1', '1.00', '2018-03-05 15:49:07', '2018-03-05 15:49:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1697', '1', '1.00', '2018-03-05 15:50:00', '2018-03-05 15:50:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1698', '1', '1.00', '2018-03-05 15:50:05', '2018-03-05 15:50:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1699', '1', '1.00', '2018-03-05 15:50:09', '2018-03-05 15:50:09', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1700', '1', '1.00', '2018-03-05 15:53:19', '2018-03-05 15:53:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1701', '1', '1.00', '2018-03-05 15:53:23', '2018-03-05 15:53:23', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1702', '1', '1.00', '2018-03-08 15:26:07', '2018-03-08 15:26:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1703', '1', '1.00', '2018-03-08 15:33:00', '2018-03-08 15:33:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1704', '1', '1.00', '2018-03-08 16:45:29', '2018-03-08 16:45:29', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1705', '1', '1.00', '2018-03-08 17:23:15', '2018-03-08 17:23:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1706', '1', '1.00', '2018-03-08 17:23:20', '2018-03-08 17:23:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1707', '1', '1.00', '2018-03-08 17:23:25', '2018-03-08 17:23:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1708', '1', '1.00', '2018-03-08 17:23:30', '2018-03-08 17:23:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1709', '1', '1.00', '2018-03-08 17:23:35', '2018-03-08 17:23:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1710', '1', '1.00', '2018-03-08 17:23:40', '2018-03-08 17:23:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1711', '1', '1.00', '2018-03-08 17:23:45', '2018-03-08 17:23:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1712', '1', '1.00', '2018-03-08 17:31:47', '2018-03-08 17:31:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1713', '1', '1.00', '2018-03-08 17:31:55', '2018-03-08 17:31:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1714', '1', '1.00', '2018-03-08 17:32:02', '2018-03-08 17:32:02', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1715', '1', '1.00', '2018-03-08 17:32:07', '2018-03-08 17:32:07', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1716', '1', '1.00', '2018-03-08 17:32:14', '2018-03-08 17:32:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1717', '1', '1.00', '2018-03-08 17:32:19', '2018-03-08 17:32:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1718', '1', '1.00', '2018-03-08 17:32:24', '2018-03-08 17:32:24', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1719', '1', '1.00', '2018-03-08 17:32:26', '2018-03-08 17:32:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1720', '1', '1.00', '2018-03-08 17:32:31', '2018-03-08 17:32:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1721', '1', '1.00', '2018-03-08 17:39:03', '2018-03-08 17:39:03', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1722', '1', '1.00', '2018-03-08 17:39:08', '2018-03-08 17:39:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1723', '1', '1.00', '2018-03-08 17:39:50', '2018-03-08 17:39:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1724', '1', '1.00', '2018-03-08 17:39:55', '2018-03-08 17:39:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1725', '1', '1.00', '2018-03-08 17:40:00', '2018-03-08 17:40:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1726', '1', '1.00', '2018-03-08 17:40:05', '2018-03-08 17:40:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1727', '1', '1.00', '2018-03-08 17:40:10', '2018-03-08 17:40:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1728', '1', '1.00', '2018-03-08 17:40:15', '2018-03-08 17:40:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1729', '1', '1.00', '2018-03-08 17:41:32', '2018-03-08 17:41:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1730', '1', '1.00', '2018-03-08 17:41:45', '2018-03-08 17:41:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1731', '1', '1.00', '2018-03-08 17:51:24', '2018-03-08 17:51:24', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1732', '1', '1.00', '2018-03-08 17:51:29', '2018-03-08 17:51:29', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1733', '1', '1.00', '2018-03-08 17:51:34', '2018-03-08 17:51:34', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1734', '1', '1.00', '2018-03-08 17:51:39', '2018-03-08 17:51:39', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1735', '1', '1.00', '2018-03-08 17:55:30', '2018-03-08 17:55:30', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1736', '1', '1.00', '2018-03-08 17:55:35', '2018-03-08 17:55:35', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1737', '1', '1.00', '2018-03-08 17:58:49', '2018-03-08 17:58:49', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1738', '1', '1.00', '2018-03-08 18:00:19', '2018-03-08 18:00:19', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1739', '1', '1.00', '2018-03-08 18:00:24', '2018-03-08 18:00:24', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1740', '1', '1.00', '2018-03-09 13:53:08', '2018-03-09 13:53:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1741', '1', '1.00', '2018-03-09 13:53:13', '2018-03-09 13:53:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1742', '1', '1.00', '2018-03-11 04:18:48', '2018-03-11 04:18:48', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1743', '1', '1.00', '2018-03-11 04:19:06', '2018-03-11 04:19:06', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1744', '1', '1.00', '2018-03-11 04:44:46', '2018-03-11 04:44:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1745', '1', '1.00', '2018-03-11 04:46:58', '2018-03-11 04:46:58', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1746', '1', '1.00', '2018-03-11 04:47:14', '2018-03-11 04:47:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1747', '1', '1.00', '2018-03-11 04:47:43', '2018-03-11 04:47:43', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1748', '1', '1.00', '2018-03-11 04:47:48', '2018-03-11 04:47:48', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1749', '1', '1.00', '2018-03-11 05:04:33', '2018-03-11 05:04:33', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1750', '1', '1.00', '2018-03-11 05:10:48', '2018-03-11 05:10:48', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1751', '1', '1.00', '2018-03-11 05:11:29', '2018-03-11 05:11:29', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1752', '1', '1.00', '2018-03-11 05:13:16', '2018-03-11 05:13:16', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1753', '1', '1.00', '2018-03-11 05:14:09', '2018-03-11 05:14:09', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1754', '1', '1.00', '2018-03-11 05:17:07', '2018-03-11 05:17:07', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1755', '1', '1.00', '2018-03-12 09:34:55', '2018-03-12 09:34:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1756', '1', '1.00', '2018-03-12 09:35:00', '2018-03-12 09:35:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1757', '1', '1.00', '2018-03-12 09:35:05', '2018-03-12 09:35:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1758', '1', '1.00', '2018-03-12 09:35:14', '2018-03-12 09:35:14', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1759', '1', '1.00', '2018-03-12 10:26:55', '2018-03-12 10:26:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1760', '1', '1.00', '2018-03-12 10:27:05', '2018-03-12 10:27:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1761', '1', '1.00', '2018-03-12 10:27:10', '2018-03-12 10:27:10', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1762', '1', '1.00', '2018-03-12 10:27:18', '2018-03-12 10:27:18', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1763', '1', '1.00', '2018-03-12 10:27:21', '2018-03-12 10:27:21', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1764', '1', '1.00', '2018-03-12 10:28:06', '2018-03-12 10:28:06', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1765', '1', '1.00', '2018-03-12 10:28:09', '2018-03-12 10:28:09', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1766', '1', '1.00', '2018-03-12 10:28:30', '2018-03-12 10:28:30', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1767', '1', '1.00', '2018-03-12 11:12:31', '2018-03-12 11:12:31', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1768', '1', '1.00', '2018-03-12 19:40:03', '2018-03-12 19:40:03', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1769', '1', '1.00', '2018-03-12 21:04:49', '2018-03-12 21:04:49', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1770', '1', '1.00', '2018-03-12 21:04:54', '2018-03-12 21:04:54', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1771', '1', '1.00', '2018-03-12 21:04:59', '2018-03-12 21:04:59', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1772', '1', '1.00', '2018-03-12 21:08:16', '2018-03-12 21:08:16', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1773', '1', '1.00', '2018-03-12 22:16:20', '2018-03-12 22:16:20', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1774', '1', '1.00', '2018-03-12 22:29:49', '2018-03-12 22:29:49', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1775', '1', '1.00', '2018-03-12 22:29:54', '2018-03-12 22:29:54', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1776', '1', '1.00', '2018-03-12 22:57:42', '2018-03-12 22:57:42', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1777', '1', '1.00', '2018-03-12 23:35:10', '2018-03-12 23:35:10', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1778', '1', '1.00', '2018-03-12 23:37:56', '2018-03-12 23:37:56', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1779', '1', '1.00', '2018-03-12 23:44:11', '2018-03-12 23:44:11', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1780', '1', '1.00', '2018-03-12 23:46:39', '2018-03-12 23:46:39', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1781', '1', '1.00', '2018-03-12 23:49:51', '2018-03-12 23:49:51', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1782', '1', '1.00', '2018-03-12 23:51:02', '2018-03-12 23:51:02', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1783', '1', '1.00', '2018-03-13 00:00:51', '2018-03-13 00:00:51', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1784', '1', '1.00', '2018-03-13 00:41:43', '2018-03-13 00:41:43', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1785', '1', '1.00', '2018-03-13 00:42:31', '2018-03-13 00:42:31', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1786', '1', '1.00', '2018-03-13 00:45:09', '2018-03-13 00:45:09', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1787', '1', '1.00', '2018-03-13 00:48:51', '2018-03-13 00:48:51', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1788', '1', '1.00', '2018-03-13 00:51:32', '2018-03-13 00:51:32', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1789', '1', '1.00', '2018-03-13 16:05:51', '2018-03-13 16:05:51', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1790', '1', '1.00', '2018-03-13 16:05:53', '2018-03-13 16:05:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1791', '1', '1.00', '2018-03-13 16:06:18', '2018-03-13 16:06:18', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1792', '1', '1.00', '2018-03-13 16:06:48', '2018-03-13 16:06:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1793', '1', '1.00', '2018-03-13 16:07:22', '2018-03-13 16:07:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1794', '1', '1.00', '2018-03-13 16:07:27', '2018-03-13 16:07:27', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1795', '1', '1.00', '2018-03-13 16:07:32', '2018-03-13 16:07:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1796', '1', '1.00', '2018-03-13 16:43:20', '2018-03-13 16:43:20', '1018');
INSERT INTO `integral_detail_tb` VALUES ('1797', '1', '1.00', '2018-03-13 16:49:25', '2018-03-13 16:49:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1798', '1', '1.00', '2018-03-13 16:49:30', '2018-03-13 16:49:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1799', '1', '1.00', '2018-03-13 16:49:33', '2018-03-13 16:49:33', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1800', '1', '1.00', '2018-03-13 16:49:38', '2018-03-13 16:49:38', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1801', '1', '1.00', '2018-03-13 16:49:41', '2018-03-13 16:49:41', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1802', '1', '1.00', '2018-03-13 16:49:46', '2018-03-13 16:49:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1803', '1', '1.00', '2018-03-13 16:49:48', '2018-03-13 16:49:48', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1804', '1', '1.00', '2018-03-13 16:49:50', '2018-03-13 16:49:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1805', '1', '1.00', '2018-03-13 16:49:59', '2018-03-13 16:49:59', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1806', '1', '1.00', '2018-03-13 16:50:42', '2018-03-13 16:50:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1807', '1', '1.00', '2018-03-13 16:50:45', '2018-03-13 16:50:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1808', '1', '1.00', '2018-03-13 16:50:46', '2018-03-13 16:50:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1809', '1', '1.00', '2018-03-13 16:51:19', '2018-03-13 16:51:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1810', '1', '1.00', '2018-03-13 16:51:28', '2018-03-13 16:51:28', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1811', '1', '1.00', '2018-03-13 16:51:34', '2018-03-13 16:51:34', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1812', '1', '1.00', '2018-03-13 16:51:40', '2018-03-13 16:51:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1813', '1', '1.00', '2018-03-13 16:51:57', '2018-03-13 16:51:57', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1814', '1', '1.00', '2018-03-13 16:52:04', '2018-03-13 16:52:04', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1815', '1', '1.00', '2018-03-13 16:52:06', '2018-03-13 16:52:06', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1816', '1', '1.00', '2018-03-13 16:52:12', '2018-03-13 16:52:12', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1817', '1', '1.00', '2018-03-13 16:52:17', '2018-03-13 16:52:17', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1818', '1', '1.00', '2018-03-13 16:52:19', '2018-03-13 16:52:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1819', '1', '1.00', '2018-03-13 16:52:20', '2018-03-13 16:52:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1820', '1', '1.00', '2018-03-13 16:52:22', '2018-03-13 16:52:22', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1821', '1', '1.00', '2018-03-13 16:52:23', '2018-03-13 16:52:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1822', '1', '1.00', '2018-03-13 16:52:28', '2018-03-13 16:52:28', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1823', '1', '1.00', '2018-03-13 16:52:55', '2018-03-13 16:52:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1824', '1', '1.00', '2018-03-13 16:52:56', '2018-03-13 16:52:56', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1825', '1', '1.00', '2018-03-13 16:52:57', '2018-03-13 16:52:57', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1826', '1', '1.00', '2018-03-13 16:52:58', '2018-03-13 16:52:58', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1827', '1', '1.00', '2018-03-13 16:52:59', '2018-03-13 16:52:59', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1828', '1', '1.00', '2018-03-13 16:54:09', '2018-03-13 16:54:09', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1829', '1', '1.00', '2018-03-13 16:54:11', '2018-03-13 16:54:11', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1830', '1', '1.00', '2018-03-13 16:54:12', '2018-03-13 16:54:12', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1831', '1', '1.00', '2018-03-13 16:54:14', '2018-03-13 16:54:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1832', '1', '1.00', '2018-03-13 16:54:17', '2018-03-13 16:54:17', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1833', '1', '1.00', '2018-03-13 16:54:19', '2018-03-13 16:54:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1834', '1', '1.00', '2018-03-13 16:54:21', '2018-03-13 16:54:21', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1835', '1', '1.00', '2018-03-13 16:54:26', '2018-03-13 16:54:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1836', '1', '1.00', '2018-03-13 16:54:46', '2018-03-13 16:54:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1837', '1', '1.00', '2018-03-13 16:55:00', '2018-03-13 16:55:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1838', '1', '1.00', '2018-03-13 16:55:01', '2018-03-13 16:55:01', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1839', '1', '1.00', '2018-03-13 16:55:03', '2018-03-13 16:55:03', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1840', '1', '1.00', '2018-03-13 16:55:23', '2018-03-13 16:55:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1841', '1', '1.00', '2018-03-13 16:55:29', '2018-03-13 16:55:29', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1842', '1', '1.00', '2018-03-13 16:55:32', '2018-03-13 16:55:32', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1843', '1', '1.00', '2018-03-13 16:55:38', '2018-03-13 16:55:38', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1844', '1', '1.00', '2018-03-13 16:55:42', '2018-03-13 16:55:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1845', '1', '1.00', '2018-03-13 16:55:43', '2018-03-13 16:55:43', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1846', '1', '1.00', '2018-03-13 16:56:06', '2018-03-13 16:56:06', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1847', '1', '1.00', '2018-03-13 16:57:31', '2018-03-13 16:57:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1848', '1', '1.00', '2018-03-13 17:20:04', '2018-03-13 17:20:04', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1849', '1', '1.00', '2018-03-13 17:20:14', '2018-03-13 17:20:14', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1850', '1', '1.00', '2018-03-13 19:39:56', '2018-03-13 19:39:56', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1851', '1', '1.00', '2018-03-13 19:40:26', '2018-03-13 19:40:26', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1852', '1', '1.00', '2018-03-13 19:50:57', '2018-03-13 19:50:57', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1853', '1', '1.00', '2018-03-13 19:51:13', '2018-03-13 19:51:13', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1854', '1', '1.00', '2018-03-13 19:51:21', '2018-03-13 19:51:21', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1855', '1', '1.00', '2018-03-13 19:51:48', '2018-03-13 19:51:48', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1856', '1', '1.00', '2018-03-13 19:52:30', '2018-03-13 19:52:30', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1857', '1', '1.00', '2018-03-13 19:52:33', '2018-03-13 19:52:33', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1858', '1', '1.00', '2018-03-13 19:52:36', '2018-03-13 19:52:36', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1859', '1', '1.00', '2018-03-14 09:32:17', '2018-03-14 09:32:17', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1860', '1', '1.00', '2018-03-14 09:41:31', '2018-03-14 09:41:31', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1861', '1', '1.00', '2018-03-14 09:52:36', '2018-03-14 09:52:36', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1862', '1', '1.00', '2018-03-14 10:11:31', '2018-03-14 10:11:31', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1863', '1', '1.00', '2018-03-14 10:11:35', '2018-03-14 10:11:35', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1864', '1', '1.00', '2018-03-14 10:11:40', '2018-03-14 10:11:40', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1865', '1', '1.00', '2018-03-15 19:11:59', '2018-03-15 19:11:59', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1866', '1', '1.00', '2018-03-15 19:12:54', '2018-03-15 19:12:54', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1867', '1', '1.00', '2018-03-15 19:13:38', '2018-03-15 19:13:38', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1868', '1', '1.00', '2018-03-15 19:13:43', '2018-03-15 19:13:43', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1869', '1', '1.00', '2018-03-15 19:13:51', '2018-03-15 19:13:51', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1870', '1', '1.00', '2018-03-15 19:13:56', '2018-03-15 19:13:56', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1871', '1', '1.00', '2018-03-15 19:13:56', '2018-03-15 19:13:56', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1872', '1', '1.00', '2018-03-15 19:13:59', '2018-03-15 19:13:59', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1873', '1', '1.00', '2018-03-15 19:14:02', '2018-03-15 19:14:02', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1874', '1', '1.00', '2018-03-15 19:14:06', '2018-03-15 19:14:06', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1875', '1', '1.00', '2018-03-15 19:14:24', '2018-03-15 19:14:24', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1876', '1', '1.00', '2018-03-15 19:14:27', '2018-03-15 19:14:27', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1877', '1', '1.00', '2018-03-15 19:14:32', '2018-03-15 19:14:32', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1878', '1', '1.00', '2018-03-15 19:14:34', '2018-03-15 19:14:34', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1879', '1', '1.00', '2018-03-15 19:19:20', '2018-03-15 19:19:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1880', '1', '1.00', '2018-03-16 09:13:39', '2018-03-16 09:13:39', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1881', '1', '1.00', '2018-03-16 09:13:42', '2018-03-16 09:13:42', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1882', '1', '1.00', '2018-03-16 09:13:45', '2018-03-16 09:13:45', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1883', '1', '1.00', '2018-03-16 09:13:47', '2018-03-16 09:13:47', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1884', '1', '1.00', '2018-03-16 09:13:52', '2018-03-16 09:13:52', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1885', '1', '1.00', '2018-03-16 09:14:16', '2018-03-16 09:14:16', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1886', '1', '1.00', '2018-03-16 09:15:54', '2018-03-16 09:15:54', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1887', '1', '1.00', '2018-03-16 10:00:26', '2018-03-16 10:00:26', '1010');
INSERT INTO `integral_detail_tb` VALUES ('1888', '1', '1.00', '2018-03-16 16:48:11', '2018-03-16 16:48:11', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1889', '1', '1.00', '2018-03-16 16:48:16', '2018-03-16 16:48:16', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1890', '1', '1.00', '2018-03-16 17:19:40', '2018-03-16 17:19:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1891', '1', '1.00', '2018-03-16 17:19:45', '2018-03-16 17:19:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1892', '1', '1.00', '2018-03-16 17:25:25', '2018-03-16 17:25:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1893', '1', '1.00', '2018-03-16 17:27:25', '2018-03-16 17:27:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1894', '1', '1.00', '2018-03-16 17:30:35', '2018-03-16 17:30:35', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1895', '1', '1.00', '2018-03-16 17:30:40', '2018-03-16 17:30:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1896', '1', '1.00', '2018-03-16 17:30:45', '2018-03-16 17:30:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1897', '1', '1.00', '2018-03-16 21:15:02', '2018-03-16 21:15:02', '1014');
INSERT INTO `integral_detail_tb` VALUES ('1898', '1', '1.00', '2018-03-18 10:10:47', '2018-03-18 10:10:47', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1899', '1', '1.00', '2018-03-18 10:36:19', '2018-03-18 10:36:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1900', '1', '1.00', '2018-03-19 14:40:47', '2018-03-19 14:40:47', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1901', '1', '1.00', '2018-03-19 14:40:51', '2018-03-19 14:40:51', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1902', '1', '1.00', '2018-03-19 14:42:05', '2018-03-19 14:42:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1903', '1', '1.00', '2018-03-26 16:44:05', '2018-03-26 16:44:05', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1904', '1', '1.00', '2018-03-26 16:44:11', '2018-03-26 16:44:11', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1905', '1', '1.00', '2018-03-26 17:02:11', '2018-03-26 17:02:11', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1906', '1', '1.00', '2018-03-26 17:20:56', '2018-03-26 17:20:56', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1907', '1', '1.00', '2018-03-26 17:21:53', '2018-03-26 17:21:53', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1908', '1', '1.00', '2018-03-26 17:25:23', '2018-03-26 17:25:23', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1909', '1', '1.00', '2018-03-26 17:25:28', '2018-03-26 17:25:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1910', '1', '1.00', '2018-03-26 17:25:31', '2018-03-26 17:25:31', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1911', '1', '1.00', '2018-03-26 17:25:36', '2018-03-26 17:25:36', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1912', '1', '1.00', '2018-03-26 17:25:42', '2018-03-26 17:25:42', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1913', '1', '1.00', '2018-03-26 17:25:47', '2018-03-26 17:25:47', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1914', '1', '1.00', '2018-03-26 17:26:09', '2018-03-26 17:26:09', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1915', '1', '1.00', '2018-03-26 17:26:14', '2018-03-26 17:26:14', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1916', '1', '1.00', '2018-03-26 17:26:40', '2018-03-26 17:26:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1917', '1', '1.00', '2018-03-26 17:26:45', '2018-03-26 17:26:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1918', '1', '1.00', '2018-03-26 17:30:52', '2018-03-26 17:30:52', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1919', '1', '1.00', '2018-03-26 17:31:00', '2018-03-26 17:31:00', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1920', '1', '1.00', '2018-03-26 17:39:04', '2018-03-26 17:39:04', '1016');
INSERT INTO `integral_detail_tb` VALUES ('1921', '1', '1.00', '2018-03-27 13:16:47', '2018-03-27 13:16:47', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1922', '1', '1.00', '2018-03-27 13:16:52', '2018-03-27 13:16:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1923', '1', '1.00', '2018-03-27 13:16:57', '2018-03-27 13:16:57', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1924', '1', '1.00', '2018-03-27 13:17:02', '2018-03-27 13:17:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1925', '1', '1.00', '2018-03-27 13:17:07', '2018-03-27 13:17:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1926', '1', '1.00', '2018-03-27 13:17:12', '2018-03-27 13:17:12', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1927', '1', '1.00', '2018-03-27 13:17:17', '2018-03-27 13:17:17', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1928', '1', '1.00', '2018-03-27 13:17:22', '2018-03-27 13:17:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1929', '1', '1.00', '2018-03-27 13:17:27', '2018-03-27 13:17:27', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1930', '1', '1.00', '2018-03-27 13:17:32', '2018-03-27 13:17:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1931', '1', '1.00', '2018-03-27 13:17:37', '2018-03-27 13:17:37', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1932', '1', '1.00', '2018-03-27 13:17:42', '2018-03-27 13:17:42', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1933', '1', '1.00', '2018-03-27 13:17:47', '2018-03-27 13:17:47', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1934', '1', '1.00', '2018-03-27 13:17:52', '2018-03-27 13:17:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1935', '1', '1.00', '2018-03-27 13:17:57', '2018-03-27 13:17:57', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1936', '1', '1.00', '2018-03-27 13:18:02', '2018-03-27 13:18:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1937', '1', '1.00', '2018-03-27 13:18:07', '2018-03-27 13:18:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1938', '1', '1.00', '2018-03-27 13:18:13', '2018-03-27 13:18:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1939', '1', '1.00', '2018-03-27 13:18:17', '2018-03-27 13:18:17', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1940', '1', '1.00', '2018-03-27 13:18:22', '2018-03-27 13:18:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1941', '1', '1.00', '2018-03-27 13:18:27', '2018-03-27 13:18:27', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1942', '1', '1.00', '2018-03-27 13:18:32', '2018-03-27 13:18:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1943', '1', '1.00', '2018-03-27 13:18:37', '2018-03-27 13:18:37', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1944', '1', '1.00', '2018-03-27 13:18:42', '2018-03-27 13:18:42', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1945', '1', '1.00', '2018-03-27 13:19:25', '2018-03-27 13:19:25', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1946', '1', '1.00', '2018-03-27 13:20:00', '2018-03-27 13:20:00', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1947', '1', '1.00', '2018-03-27 13:20:03', '2018-03-27 13:20:03', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1948', '1', '1.00', '2018-03-27 13:20:08', '2018-03-27 13:20:08', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1949', '1', '1.00', '2018-03-27 13:20:13', '2018-03-27 13:20:13', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1950', '1', '1.00', '2018-03-27 13:20:18', '2018-03-27 13:20:18', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1951', '1', '1.00', '2018-03-27 13:20:23', '2018-03-27 13:20:23', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1952', '1', '1.00', '2018-03-27 13:20:28', '2018-03-27 13:20:28', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1953', '1', '1.00', '2018-03-27 13:20:33', '2018-03-27 13:20:33', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1954', '1', '1.00', '2018-03-27 13:20:38', '2018-03-27 13:20:38', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1955', '1', '1.00', '2018-03-27 13:20:43', '2018-03-27 13:20:43', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1956', '1', '1.00', '2018-03-27 13:20:48', '2018-03-27 13:20:48', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1957', '1', '1.00', '2018-03-27 13:20:53', '2018-03-27 13:20:53', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1958', '1', '1.00', '2018-03-27 13:20:58', '2018-03-27 13:20:58', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1959', '1', '1.00', '2018-03-27 13:21:03', '2018-03-27 13:21:03', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1960', '1', '1.00', '2018-03-27 13:21:08', '2018-03-27 13:21:08', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1961', '1', '1.00', '2018-03-27 13:21:13', '2018-03-27 13:21:13', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1962', '1', '1.00', '2018-03-27 13:21:18', '2018-03-27 13:21:18', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1963', '1', '1.00', '2018-03-27 13:21:23', '2018-03-27 13:21:23', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1964', '1', '1.00', '2018-03-27 13:21:28', '2018-03-27 13:21:28', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1965', '1', '1.00', '2018-03-27 13:21:33', '2018-03-27 13:21:33', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1966', '1', '1.00', '2018-03-27 13:21:38', '2018-03-27 13:21:38', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1967', '1', '1.00', '2018-03-27 13:21:43', '2018-03-27 13:21:43', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1968', '1', '1.00', '2018-03-27 13:21:48', '2018-03-27 13:21:48', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1969', '1', '1.00', '2018-03-27 13:21:53', '2018-03-27 13:21:53', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1970', '1', '1.00', '2018-03-27 13:21:58', '2018-03-27 13:21:58', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1971', '1', '1.00', '2018-03-27 13:22:03', '2018-03-27 13:22:03', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1972', '1', '1.00', '2018-03-27 13:22:08', '2018-03-27 13:22:08', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1973', '1', '1.00', '2018-03-27 13:22:13', '2018-03-27 13:22:13', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1974', '1', '1.00', '2018-03-27 13:22:18', '2018-03-27 13:22:18', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1975', '1', '1.00', '2018-03-27 13:22:23', '2018-03-27 13:22:23', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1976', '1', '1.00', '2018-03-27 13:22:28', '2018-03-27 13:22:28', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1977', '1', '1.00', '2018-03-27 13:22:33', '2018-03-27 13:22:33', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1978', '1', '1.00', '2018-03-27 13:22:38', '2018-03-27 13:22:38', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1979', '1', '1.00', '2018-03-27 13:22:43', '2018-03-27 13:22:43', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1980', '1', '1.00', '2018-03-27 13:22:48', '2018-03-27 13:22:48', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1981', '1', '1.00', '2018-03-27 13:22:53', '2018-03-27 13:22:53', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1982', '1', '1.00', '2018-03-27 13:22:58', '2018-03-27 13:22:58', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1983', '1', '1.00', '2018-03-27 13:23:03', '2018-03-27 13:23:03', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1984', '1', '1.00', '2018-03-27 13:23:08', '2018-03-27 13:23:08', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1985', '1', '1.00', '2018-03-27 13:23:13', '2018-03-27 13:23:13', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1986', '1', '1.00', '2018-03-27 13:23:18', '2018-03-27 13:23:18', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1987', '1', '1.00', '2018-03-27 13:23:23', '2018-03-27 13:23:23', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1988', '1', '1.00', '2018-03-27 13:23:28', '2018-03-27 13:23:28', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1989', '1', '1.00', '2018-03-27 13:23:33', '2018-03-27 13:23:33', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1990', '1', '1.00', '2018-03-27 13:23:38', '2018-03-27 13:23:38', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1991', '1', '1.00', '2018-03-27 13:23:43', '2018-03-27 13:23:43', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1992', '1', '1.00', '2018-03-27 13:23:48', '2018-03-27 13:23:48', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1993', '1', '1.00', '2018-03-27 13:23:53', '2018-03-27 13:23:53', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1994', '1', '1.00', '2018-03-27 13:23:58', '2018-03-27 13:23:58', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1995', '1', '1.00', '2018-03-27 13:24:03', '2018-03-27 13:24:03', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1996', '1', '1.00', '2018-03-27 13:24:08', '2018-03-27 13:24:08', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1997', '1', '1.00', '2018-03-27 13:24:13', '2018-03-27 13:24:13', '1019');
INSERT INTO `integral_detail_tb` VALUES ('1998', '1', '1.00', '2018-03-27 13:49:42', '2018-03-27 13:49:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('1999', '1', '1.00', '2018-03-27 13:49:45', '2018-03-27 13:49:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2000', '1', '1.00', '2018-03-27 13:49:47', '2018-03-27 13:49:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2001', '1', '1.00', '2018-03-27 13:49:48', '2018-03-27 13:49:48', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2002', '1', '1.00', '2018-03-27 13:49:48', '2018-03-27 13:49:48', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2003', '1', '1.00', '2018-03-27 13:49:50', '2018-03-27 13:49:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2004', '1', '1.00', '2018-03-27 13:49:50', '2018-03-27 13:49:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2005', '1', '1.00', '2018-03-27 13:49:52', '2018-03-27 13:49:52', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2006', '1', '1.00', '2018-03-27 13:49:55', '2018-03-27 13:49:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2007', '1', '1.00', '2018-03-27 13:49:55', '2018-03-27 13:49:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2008', '1', '1.00', '2018-03-27 13:49:57', '2018-03-27 13:49:57', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2009', '1', '1.00', '2018-03-27 13:49:58', '2018-03-27 13:49:58', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2010', '1', '1.00', '2018-03-27 13:49:59', '2018-03-27 13:49:59', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2011', '1', '1.00', '2018-03-27 13:50:00', '2018-03-27 13:50:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2012', '1', '1.00', '2018-03-27 13:50:02', '2018-03-27 13:50:02', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2013', '1', '1.00', '2018-03-27 13:50:03', '2018-03-27 13:50:03', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2014', '1', '1.00', '2018-03-27 13:50:05', '2018-03-27 13:50:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2015', '1', '1.00', '2018-03-27 13:50:06', '2018-03-27 13:50:06', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2016', '1', '1.00', '2018-03-27 13:50:07', '2018-03-27 13:50:07', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2017', '1', '1.00', '2018-03-27 13:50:08', '2018-03-27 13:50:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2018', '1', '1.00', '2018-03-27 13:50:11', '2018-03-27 13:50:11', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2019', '1', '1.00', '2018-03-27 13:50:11', '2018-03-27 13:50:11', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2020', '1', '1.00', '2018-03-27 13:50:12', '2018-03-27 13:50:12', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2021', '1', '1.00', '2018-03-27 13:50:13', '2018-03-27 13:50:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2022', '1', '1.00', '2018-03-27 13:50:14', '2018-03-27 13:50:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2023', '1', '1.00', '2018-03-27 13:50:18', '2018-03-27 13:50:18', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2024', '1', '1.00', '2018-03-27 13:50:23', '2018-03-27 13:50:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2025', '1', '1.00', '2018-03-27 13:50:26', '2018-03-27 13:50:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2026', '1', '1.00', '2018-03-27 13:50:27', '2018-03-27 13:50:27', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2027', '1', '1.00', '2018-03-27 13:50:28', '2018-03-27 13:50:28', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2028', '1', '1.00', '2018-03-27 13:50:29', '2018-03-27 13:50:29', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2029', '1', '1.00', '2018-03-27 13:50:31', '2018-03-27 13:50:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2030', '1', '1.00', '2018-03-27 13:50:32', '2018-03-27 13:50:32', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2031', '1', '1.00', '2018-03-27 13:50:33', '2018-03-27 13:50:33', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2032', '1', '1.00', '2018-03-27 13:50:34', '2018-03-27 13:50:34', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2033', '1', '1.00', '2018-03-27 13:50:35', '2018-03-27 13:50:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2034', '1', '1.00', '2018-03-27 13:50:37', '2018-03-27 13:50:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2035', '1', '1.00', '2018-03-27 13:50:38', '2018-03-27 13:50:38', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2036', '1', '1.00', '2018-03-27 13:50:39', '2018-03-27 13:50:39', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2037', '1', '1.00', '2018-03-27 13:50:40', '2018-03-27 13:50:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2038', '1', '1.00', '2018-03-27 13:50:42', '2018-03-27 13:50:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2039', '1', '1.00', '2018-03-27 13:50:44', '2018-03-27 13:50:44', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2040', '1', '1.00', '2018-03-27 13:50:45', '2018-03-27 13:50:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2041', '1', '1.00', '2018-03-27 13:50:46', '2018-03-27 13:50:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2042', '1', '1.00', '2018-03-27 13:50:46', '2018-03-27 13:50:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2043', '1', '1.00', '2018-03-27 13:50:47', '2018-03-27 13:50:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2044', '1', '1.00', '2018-03-27 13:50:49', '2018-03-27 13:50:49', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2045', '1', '1.00', '2018-03-27 13:54:03', '2018-03-27 13:54:03', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2046', '1', '1.00', '2018-03-27 13:54:05', '2018-03-27 13:54:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2047', '1', '1.00', '2018-03-27 13:54:06', '2018-03-27 13:54:06', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2048', '1', '1.00', '2018-03-27 13:54:09', '2018-03-27 13:54:09', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2049', '1', '1.00', '2018-03-27 13:54:11', '2018-03-27 13:54:11', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2050', '1', '1.00', '2018-03-27 13:54:12', '2018-03-27 13:54:12', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2051', '1', '1.00', '2018-03-27 13:54:13', '2018-03-27 13:54:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2052', '1', '1.00', '2018-03-27 13:54:14', '2018-03-27 13:54:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2053', '1', '1.00', '2018-03-27 13:54:15', '2018-03-27 13:54:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2054', '1', '1.00', '2018-03-27 13:54:16', '2018-03-27 13:54:16', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2055', '1', '1.00', '2018-03-27 13:54:17', '2018-03-27 13:54:17', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2056', '1', '1.00', '2018-03-27 13:54:18', '2018-03-27 13:54:18', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2057', '1', '1.00', '2018-03-27 13:54:20', '2018-03-27 13:54:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2058', '1', '1.00', '2018-03-27 13:54:21', '2018-03-27 13:54:21', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2059', '1', '1.00', '2018-03-27 13:54:22', '2018-03-27 13:54:22', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2060', '1', '1.00', '2018-03-27 13:54:23', '2018-03-27 13:54:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2061', '1', '1.00', '2018-03-27 13:54:24', '2018-03-27 13:54:24', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2062', '1', '1.00', '2018-03-27 13:54:25', '2018-03-27 13:54:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2063', '1', '1.00', '2018-03-27 13:54:26', '2018-03-27 13:54:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2064', '1', '1.00', '2018-03-27 13:54:27', '2018-03-27 13:54:27', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2065', '1', '1.00', '2018-03-27 13:54:28', '2018-03-27 13:54:28', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2066', '1', '1.00', '2018-03-27 13:54:29', '2018-03-27 13:54:29', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2067', '1', '1.00', '2018-03-27 13:54:30', '2018-03-27 13:54:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2068', '1', '1.00', '2018-03-27 13:54:31', '2018-03-27 13:54:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2069', '1', '1.00', '2018-03-27 13:54:32', '2018-03-27 13:54:32', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2070', '1', '1.00', '2018-03-27 13:54:33', '2018-03-27 13:54:33', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2071', '1', '1.00', '2018-03-27 13:54:35', '2018-03-27 13:54:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2072', '1', '1.00', '2018-03-27 13:54:35', '2018-03-27 13:54:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2073', '1', '1.00', '2018-03-27 13:54:37', '2018-03-27 13:54:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2074', '1', '1.00', '2018-03-27 13:59:16', '2018-03-27 13:59:16', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2075', '1', '1.00', '2018-03-27 13:59:21', '2018-03-27 13:59:21', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2076', '1', '1.00', '2018-03-27 13:59:26', '2018-03-27 13:59:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2077', '1', '1.00', '2018-03-27 13:59:31', '2018-03-27 13:59:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2078', '1', '1.00', '2018-03-27 13:59:36', '2018-03-27 13:59:36', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2079', '1', '1.00', '2018-03-27 13:59:41', '2018-03-27 13:59:41', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2080', '1', '1.00', '2018-03-27 13:59:46', '2018-03-27 13:59:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2081', '1', '1.00', '2018-03-27 13:59:51', '2018-03-27 13:59:51', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2082', '1', '1.00', '2018-03-27 14:01:45', '2018-03-27 14:01:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2083', '1', '1.00', '2018-03-27 14:02:33', '2018-03-27 14:02:33', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2084', '1', '1.00', '2018-03-27 14:02:38', '2018-03-27 14:02:38', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2085', '1', '1.00', '2018-03-27 14:03:09', '2018-03-27 14:03:09', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2086', '1', '1.00', '2018-03-27 14:03:11', '2018-03-27 14:03:11', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2087', '1', '1.00', '2018-03-27 14:03:13', '2018-03-27 14:03:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2088', '1', '1.00', '2018-03-27 14:03:15', '2018-03-27 14:03:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2089', '1', '1.00', '2018-03-27 14:03:17', '2018-03-27 14:03:17', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2090', '1', '1.00', '2018-03-27 14:04:55', '2018-03-27 14:04:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2091', '1', '1.00', '2018-03-27 14:13:17', '2018-03-27 14:13:17', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2092', '1', '1.00', '2018-03-27 14:13:22', '2018-03-27 14:13:22', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2093', '1', '1.00', '2018-03-27 14:13:27', '2018-03-27 14:13:27', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2094', '1', '1.00', '2018-03-27 14:13:30', '2018-03-27 14:13:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2095', '1', '1.00', '2018-03-27 14:13:50', '2018-03-27 14:13:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2096', '1', '1.00', '2018-03-27 14:13:52', '2018-03-27 14:13:52', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2097', '1', '1.00', '2018-03-27 14:13:54', '2018-03-27 14:13:54', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2098', '1', '1.00', '2018-03-27 14:14:07', '2018-03-27 14:14:07', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2099', '1', '1.00', '2018-03-27 14:14:13', '2018-03-27 14:14:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2100', '1', '1.00', '2018-03-27 14:14:15', '2018-03-27 14:14:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2101', '1', '1.00', '2018-03-27 14:14:30', '2018-03-27 14:14:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2102', '1', '1.00', '2018-03-27 14:14:35', '2018-03-27 14:14:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2103', '1', '1.00', '2018-03-27 14:14:51', '2018-03-27 14:14:51', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2104', '1', '1.00', '2018-03-27 14:14:54', '2018-03-27 14:14:54', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2105', '1', '1.00', '2018-03-27 14:14:55', '2018-03-27 14:14:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2106', '1', '1.00', '2018-03-27 14:14:57', '2018-03-27 14:14:57', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2107', '1', '1.00', '2018-03-27 14:15:00', '2018-03-27 14:15:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2108', '1', '1.00', '2018-03-27 14:15:05', '2018-03-27 14:15:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2109', '1', '1.00', '2018-03-27 14:15:10', '2018-03-27 14:15:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2110', '1', '1.00', '2018-03-27 14:15:15', '2018-03-27 14:15:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2111', '1', '1.00', '2018-03-27 14:15:16', '2018-03-27 14:15:16', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2112', '1', '1.00', '2018-03-27 14:15:17', '2018-03-27 14:15:17', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2113', '1', '1.00', '2018-03-27 14:15:19', '2018-03-27 14:15:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2114', '1', '1.00', '2018-03-27 14:15:26', '2018-03-27 14:15:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2115', '1', '1.00', '2018-03-27 14:15:27', '2018-03-27 14:15:27', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2116', '1', '1.00', '2018-03-27 14:15:32', '2018-03-27 14:15:32', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2117', '1', '1.00', '2018-03-27 14:15:37', '2018-03-27 14:15:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2118', '1', '1.00', '2018-03-27 14:15:42', '2018-03-27 14:15:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2119', '1', '1.00', '2018-03-27 14:15:43', '2018-03-27 14:15:43', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2120', '1', '1.00', '2018-03-27 14:15:45', '2018-03-27 14:15:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2121', '1', '1.00', '2018-03-27 14:15:48', '2018-03-27 14:15:48', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2122', '1', '1.00', '2018-03-27 14:15:52', '2018-03-27 14:15:52', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2123', '1', '1.00', '2018-03-27 14:15:55', '2018-03-27 14:15:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2124', '1', '1.00', '2018-03-27 14:16:08', '2018-03-27 14:16:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2125', '1', '1.00', '2018-03-27 14:16:11', '2018-03-27 14:16:11', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2126', '1', '1.00', '2018-03-27 14:16:16', '2018-03-27 14:16:16', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2127', '1', '1.00', '2018-03-27 14:16:17', '2018-03-27 14:16:17', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2128', '1', '1.00', '2018-03-27 14:16:19', '2018-03-27 14:16:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2129', '1', '1.00', '2018-03-27 14:16:27', '2018-03-27 14:16:27', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2130', '1', '1.00', '2018-03-27 14:16:30', '2018-03-27 14:16:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2131', '1', '1.00', '2018-03-27 14:16:33', '2018-03-27 14:16:33', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2132', '1', '1.00', '2018-03-27 14:16:35', '2018-03-27 14:16:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2133', '1', '1.00', '2018-03-27 14:16:36', '2018-03-27 14:16:36', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2134', '1', '1.00', '2018-03-27 14:16:39', '2018-03-27 14:16:39', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2135', '1', '1.00', '2018-03-27 14:16:42', '2018-03-27 14:16:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2136', '1', '1.00', '2018-03-27 14:16:43', '2018-03-27 14:16:43', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2137', '1', '1.00', '2018-03-27 14:16:46', '2018-03-27 14:16:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2138', '1', '1.00', '2018-03-27 14:16:51', '2018-03-27 14:16:51', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2139', '1', '1.00', '2018-03-27 14:16:56', '2018-03-27 14:16:56', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2140', '1', '1.00', '2018-03-27 14:16:57', '2018-03-27 14:16:57', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2141', '1', '1.00', '2018-03-27 14:17:00', '2018-03-27 14:17:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2142', '1', '1.00', '2018-03-27 14:17:02', '2018-03-27 14:17:02', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2143', '1', '1.00', '2018-03-27 14:17:07', '2018-03-27 14:17:07', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2144', '1', '1.00', '2018-03-27 14:17:12', '2018-03-27 14:17:12', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2145', '1', '1.00', '2018-03-27 14:17:18', '2018-03-27 14:17:18', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2146', '1', '1.00', '2018-03-27 14:17:19', '2018-03-27 14:17:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2147', '1', '1.00', '2018-03-27 14:17:21', '2018-03-27 14:17:21', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2148', '1', '1.00', '2018-03-27 14:17:23', '2018-03-27 14:17:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2149', '1', '1.00', '2018-03-27 14:17:31', '2018-03-27 14:17:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2150', '1', '1.00', '2018-03-27 14:17:32', '2018-03-27 14:17:32', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2151', '1', '1.00', '2018-03-27 14:17:37', '2018-03-27 14:17:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2152', '1', '1.00', '2018-03-27 14:17:39', '2018-03-27 14:17:39', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2153', '1', '1.00', '2018-03-27 14:17:44', '2018-03-27 14:17:44', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2154', '1', '1.00', '2018-03-27 14:17:49', '2018-03-27 14:17:49', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2155', '1', '1.00', '2018-03-27 14:17:54', '2018-03-27 14:17:54', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2156', '1', '1.00', '2018-03-27 14:17:59', '2018-03-27 14:17:59', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2157', '1', '1.00', '2018-03-27 14:18:04', '2018-03-27 14:18:04', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2158', '1', '1.00', '2018-03-27 14:18:09', '2018-03-27 14:18:09', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2159', '1', '1.00', '2018-03-27 14:18:14', '2018-03-27 14:18:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2160', '1', '1.00', '2018-03-27 14:18:19', '2018-03-27 14:18:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2161', '1', '1.00', '2018-03-27 14:19:33', '2018-03-27 14:19:33', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2162', '1', '1.00', '2018-03-27 14:19:37', '2018-03-27 14:19:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2163', '1', '1.00', '2018-03-27 14:19:43', '2018-03-27 14:19:43', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2164', '1', '1.00', '2018-03-27 14:19:46', '2018-03-27 14:19:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2165', '1', '1.00', '2018-03-27 14:19:47', '2018-03-27 14:19:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2166', '1', '1.00', '2018-03-27 14:19:50', '2018-03-27 14:19:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2167', '1', '1.00', '2018-03-27 14:19:55', '2018-03-27 14:19:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2168', '1', '1.00', '2018-03-27 14:19:55', '2018-03-27 14:19:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2169', '1', '1.00', '2018-03-27 14:19:56', '2018-03-27 14:19:56', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2170', '1', '1.00', '2018-03-27 14:19:57', '2018-03-27 14:19:57', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2171', '1', '1.00', '2018-03-27 14:19:57', '2018-03-27 14:19:57', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2172', '1', '1.00', '2018-03-27 14:19:58', '2018-03-27 14:19:58', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2173', '1', '1.00', '2018-03-27 14:20:00', '2018-03-27 14:20:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2174', '1', '1.00', '2018-03-27 14:20:07', '2018-03-27 14:20:07', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2175', '1', '1.00', '2018-03-27 14:20:07', '2018-03-27 14:20:07', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2176', '1', '1.00', '2018-03-27 14:20:08', '2018-03-27 14:20:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2177', '1', '1.00', '2018-03-27 14:20:12', '2018-03-27 14:20:12', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2178', '1', '1.00', '2018-03-27 14:20:15', '2018-03-27 14:20:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2179', '1', '1.00', '2018-03-27 14:20:18', '2018-03-27 14:20:18', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2180', '1', '1.00', '2018-03-27 14:20:23', '2018-03-27 14:20:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2181', '1', '1.00', '2018-03-27 14:20:25', '2018-03-27 14:20:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2182', '1', '1.00', '2018-03-27 14:20:30', '2018-03-27 14:20:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2183', '1', '1.00', '2018-03-27 14:20:35', '2018-03-27 14:20:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2184', '1', '1.00', '2018-03-27 14:20:39', '2018-03-27 14:20:39', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2185', '1', '1.00', '2018-03-27 14:20:42', '2018-03-27 14:20:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2186', '1', '1.00', '2018-03-27 14:20:45', '2018-03-27 14:20:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2187', '1', '1.00', '2018-03-27 14:20:47', '2018-03-27 14:20:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2188', '1', '1.00', '2018-03-27 14:20:48', '2018-03-27 14:20:48', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2189', '1', '1.00', '2018-03-27 14:20:53', '2018-03-27 14:20:53', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2190', '1', '1.00', '2018-03-27 14:58:52', '2018-03-27 14:58:52', '1018');
INSERT INTO `integral_detail_tb` VALUES ('2191', '1', '1.00', '2018-03-27 14:58:57', '2018-03-27 14:58:57', '1018');
INSERT INTO `integral_detail_tb` VALUES ('2192', '1', '1.00', '2018-03-27 14:59:18', '2018-03-27 14:59:18', '1018');
INSERT INTO `integral_detail_tb` VALUES ('2193', '1', '1.00', '2018-03-28 12:37:21', '2018-03-28 12:37:21', '1000');

-- ----------------------------
-- Table structure for `integral_tb`
-- ----------------------------
DROP TABLE IF EXISTS `integral_tb`;
CREATE TABLE `integral_tb` (
  `integral_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分id',
  `integral` decimal(11,2) DEFAULT '0.00' COMMENT '剩余积分',
  `recharge` decimal(11,2) DEFAULT '0.00' COMMENT '充值积分',
  `consume` decimal(11,2) DEFAULT '0.00' COMMENT '消费积分',
  `base_profit` decimal(11,2) DEFAULT '0.00' COMMENT '赠送积分',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  PRIMARY KEY (`integral_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1018 DEFAULT CHARSET=utf8 COMMENT='积分表';

-- ----------------------------
-- Records of integral_tb
-- ----------------------------
INSERT INTO `integral_tb` VALUES ('1004', '486.00', '0.00', '0.00', '0.00', '2018-02-08 21:46:59', '2018-03-28 12:37:21', '1000');
INSERT INTO `integral_tb` VALUES ('1005', '289.00', '0.00', '0.00', '0.00', '2018-02-08 21:47:19', '2018-03-27 13:18:42', '1009');
INSERT INTO `integral_tb` VALUES ('1006', '173.00', '0.00', '0.00', '0.00', '2018-02-08 21:47:33', '2018-03-16 10:00:26', '1010');
INSERT INTO `integral_tb` VALUES ('1007', '0.00', '0.00', '0.00', '0.00', '2018-02-08 21:47:48', '2018-02-08 21:47:50', '1011');
INSERT INTO `integral_tb` VALUES ('1008', '0.00', '0.00', '0.00', '0.00', '2018-02-08 21:48:00', '2018-02-08 21:48:03', '1012');
INSERT INTO `integral_tb` VALUES ('1009', '0.00', '0.00', '0.00', '0.00', '2018-02-10 13:13:19', '2018-02-10 13:13:19', '1013');
INSERT INTO `integral_tb` VALUES ('1010', '21.00', '0.00', '0.00', '0.00', '2018-02-10 13:19:45', '2018-03-16 21:15:02', '1014');
INSERT INTO `integral_tb` VALUES ('1011', '0.00', '0.00', '0.00', '0.00', '2018-02-22 16:43:03', '2018-02-22 16:43:03', '1015');
INSERT INTO `integral_tb` VALUES ('1012', '16.00', '0.00', '0.00', '0.00', '2018-02-23 14:07:13', '2018-03-26 17:39:04', '1016');
INSERT INTO `integral_tb` VALUES ('1013', '0.00', '0.00', '0.00', '0.00', '2018-02-28 17:54:43', '2018-02-28 17:54:43', '1017');
INSERT INTO `integral_tb` VALUES ('1014', '14.00', '0.00', '0.00', '0.00', '2018-03-01 13:23:55', '2018-03-27 14:59:18', '1018');
INSERT INTO `integral_tb` VALUES ('1015', '53.00', '0.00', '0.00', '0.00', '2018-03-13 09:49:12', '2018-03-27 13:24:13', '1019');
INSERT INTO `integral_tb` VALUES ('1016', '0.00', '0.00', '0.00', '0.00', '2018-03-13 16:20:27', '2018-03-13 16:20:27', '1020');
INSERT INTO `integral_tb` VALUES ('1017', '0.00', '0.00', '0.00', '0.00', '2018-03-27 14:27:41', '2018-03-27 14:27:41', '1021');

-- ----------------------------
-- Table structure for `medal_tb`
-- ----------------------------
DROP TABLE IF EXISTS `medal_tb`;
CREATE TABLE `medal_tb` (
  `medal_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '勋章id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_address` varchar(255) DEFAULT NULL COMMENT '图片',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '勋章人ID',
  `medal_term_id` int(11) DEFAULT NULL COMMENT '勋章项ID',
  PRIMARY KEY (`medal_id`),
  KEY `INDEX_MEDALTERMID` (`medal_term_id`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='勋章表';

-- ----------------------------
-- Records of medal_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `medal_term_tb`
-- ----------------------------
DROP TABLE IF EXISTS `medal_term_tb`;
CREATE TABLE `medal_term_tb` (
  `medal_term_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '勋章项id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_address` varchar(255) DEFAULT NULL COMMENT '图片',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`medal_term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='勋章项表';

-- ----------------------------
-- Records of medal_term_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `notice_tb`
-- ----------------------------
DROP TABLE IF EXISTS `notice_tb`;
CREATE TABLE `notice_tb` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通知id',
  `region` tinyint(4) DEFAULT '2' COMMENT '范围，1全局，2个人',
  `title` varchar(255) DEFAULT NULL COMMENT '标题，比如：系统通知',
  `img_address` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `content` longtext COMMENT '内容',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，默认0未读，1已读',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '通知人id外键',
  `parent_id` int(11) DEFAULT NULL COMMENT '父id',
  PRIMARY KEY (`notice_id`),
  KEY `INDEX_TITLE` (`title`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE,
  KEY `INDEX_REGION` (`region`) USING BTREE,
  KEY `INDEX_PARENTID` (`parent_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1140 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of notice_tb
-- ----------------------------
INSERT INTO `notice_tb` VALUES ('1004', '2', '团购通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gav4cn173evs35fv1g8f1e6pu.png', '您的4500.0元团购申请已成功，详情请前往您的团购中查看。', '0', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1009', null);
INSERT INTO `notice_tb` VALUES ('1005', '2', '团购申请', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gb9b7411vottl4am19qm7i81d.png', '您新收到一个来自谢威的4500.0元团购申请，请及时处理。', '0', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1000', null);
INSERT INTO `notice_tb` VALUES ('1012', '2', '团购通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gav4cn173evs35fv1g8f1e6pu.png', '您的25000.0元团购申请已成功，详情请前往您的团购中查看。', '0', '2018-02-24 11:07:31', '2018-02-24 11:07:31', '1009', null);
INSERT INTO `notice_tb` VALUES ('1013', '2', '团购申请', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gb9b7411vottl4am19qm7i81d.png', '您新收到一个来自谢威的25000.0元团购申请，请及时处理。', '0', '2018-02-24 11:07:31', '2018-02-24 11:07:31', '1000', null);
INSERT INTO `notice_tb` VALUES ('1014', '2', '团购通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gav4cn173evs35fv1g8f1e6pu.png', '您的4500.0元团购申请已成功，详情请前往您的团购中查看。', '0', '2018-03-05 12:35:01', '2018-03-05 12:35:01', '1010', null);
INSERT INTO `notice_tb` VALUES ('1015', '2', '团购申请', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gb9b7411vottl4am19qm7i81d.png', '您新收到一个来自舒靖宇的4500.0元团购申请，请及时处理。', '0', '2018-03-05 12:35:01', '2018-03-05 12:35:01', '1000', null);
INSERT INTO `notice_tb` VALUES ('1016', '2', '团购通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gav4cn173evs35fv1g8f1e6pu.png', '您的25000.0元团购申请已成功，详情请前往您的团购中查看。', '0', '2018-03-13 01:06:14', '2018-03-13 01:06:14', '1010', null);
INSERT INTO `notice_tb` VALUES ('1017', '2', '团购申请', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gb9b7411vottl4am19qm7i81d.png', '您新收到一个来自舒靖宇的25000.0元团购申请，请及时处理。', '0', '2018-03-13 01:06:14', '2018-03-13 01:06:14', '1000', null);
INSERT INTO `notice_tb` VALUES ('1080', '1', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', null, null);
INSERT INTO `notice_tb` VALUES ('1081', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1000', '1080');
INSERT INTO `notice_tb` VALUES ('1082', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1009', '1080');
INSERT INTO `notice_tb` VALUES ('1083', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1010', '1080');
INSERT INTO `notice_tb` VALUES ('1084', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1011', '1080');
INSERT INTO `notice_tb` VALUES ('1085', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1012', '1080');
INSERT INTO `notice_tb` VALUES ('1086', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1013', '1080');
INSERT INTO `notice_tb` VALUES ('1087', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1014', '1080');
INSERT INTO `notice_tb` VALUES ('1088', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1015', '1080');
INSERT INTO `notice_tb` VALUES ('1089', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1016', '1080');
INSERT INTO `notice_tb` VALUES ('1090', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1017', '1080');
INSERT INTO `notice_tb` VALUES ('1091', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1018', '1080');
INSERT INTO `notice_tb` VALUES ('1092', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1019', '1080');
INSERT INTO `notice_tb` VALUES ('1093', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1020', '1080');
INSERT INTO `notice_tb` VALUES ('1094', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1021', '1080');
INSERT INTO `notice_tb` VALUES ('1095', '1', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '1', '2018-03-30 16:34:17', '2018-03-30 17:03:49', null, null);
INSERT INTO `notice_tb` VALUES ('1096', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1000', '1095');
INSERT INTO `notice_tb` VALUES ('1097', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1009', '1095');
INSERT INTO `notice_tb` VALUES ('1098', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1010', '1095');
INSERT INTO `notice_tb` VALUES ('1099', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1011', '1095');
INSERT INTO `notice_tb` VALUES ('1100', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1012', '1095');
INSERT INTO `notice_tb` VALUES ('1101', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1013', '1095');
INSERT INTO `notice_tb` VALUES ('1102', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1014', '1095');
INSERT INTO `notice_tb` VALUES ('1103', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1015', '1095');
INSERT INTO `notice_tb` VALUES ('1104', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1016', '1095');
INSERT INTO `notice_tb` VALUES ('1105', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1017', '1095');
INSERT INTO `notice_tb` VALUES ('1106', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1018', '1095');
INSERT INTO `notice_tb` VALUES ('1107', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1019', '1095');
INSERT INTO `notice_tb` VALUES ('1108', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1020', '1095');
INSERT INTO `notice_tb` VALUES ('1109', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1021', '1095');
INSERT INTO `notice_tb` VALUES ('1110', '1', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '1', '2018-03-30 17:03:28', '2018-03-30 17:03:45', null, null);
INSERT INTO `notice_tb` VALUES ('1111', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1000', '1110');
INSERT INTO `notice_tb` VALUES ('1112', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1009', '1110');
INSERT INTO `notice_tb` VALUES ('1113', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1010', '1110');
INSERT INTO `notice_tb` VALUES ('1114', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1011', '1110');
INSERT INTO `notice_tb` VALUES ('1115', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1012', '1110');
INSERT INTO `notice_tb` VALUES ('1116', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1013', '1110');
INSERT INTO `notice_tb` VALUES ('1117', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1014', '1110');
INSERT INTO `notice_tb` VALUES ('1118', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1015', '1110');
INSERT INTO `notice_tb` VALUES ('1119', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1016', '1110');
INSERT INTO `notice_tb` VALUES ('1120', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1017', '1110');
INSERT INTO `notice_tb` VALUES ('1121', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1018', '1110');
INSERT INTO `notice_tb` VALUES ('1122', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1019', '1110');
INSERT INTO `notice_tb` VALUES ('1123', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1020', '1110');
INSERT INTO `notice_tb` VALUES ('1124', '2', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1021', '1110');

-- ----------------------------
-- Table structure for `order_detail_tb`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail_tb`;
CREATE TABLE `order_detail_tb` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_address` varchar(255) DEFAULT NULL COMMENT '封面',
  `total_price` decimal(11,2) DEFAULT NULL COMMENT '总价',
  `number` int(11) DEFAULT NULL COMMENT '数量/集数',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `business_id` int(11) DEFAULT NULL COMMENT '业务id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  PRIMARY KEY (`order_detail_id`),
  KEY `INDEX_ORDERID` (`order_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail_tb
-- ----------------------------
INSERT INTO `order_detail_tb` VALUES ('1000', '普通vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1002', '1000');
INSERT INTO `order_detail_tb` VALUES ('1001', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1', '2018-02-05 21:04:34', '2018-02-05 21:04:34', '1002', '1001');
INSERT INTO `order_detail_tb` VALUES ('1002', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1', '2018-02-05 21:04:37', '2018-02-05 21:04:37', '1002', '1002');
INSERT INTO `order_detail_tb` VALUES ('1003', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1', '2018-02-05 22:39:27', '2018-02-05 22:39:27', '1002', '1003');
INSERT INTO `order_detail_tb` VALUES ('1004', '普通vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1002', '1004');
INSERT INTO `order_detail_tb` VALUES ('1005', '钻石vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8j4o210nm1ip459l127t1gt219.png', '4500.00', '1', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1003', '1005');
INSERT INTO `order_detail_tb` VALUES ('1006', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1', '2018-02-10 02:04:02', '2018-02-10 02:04:02', '1002', '1006');
INSERT INTO `order_detail_tb` VALUES ('1007', '普通vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1002', '1007');
INSERT INTO `order_detail_tb` VALUES ('1008', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '0.01', '1', '2018-02-22 16:14:52', '2018-02-22 16:14:52', '1006', '1008');
INSERT INTO `order_detail_tb` VALUES ('1009', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '0.01', '1', '2018-02-23 14:20:13', '2018-02-23 14:20:13', '1006', '1009');
INSERT INTO `order_detail_tb` VALUES ('1010', '联合发起人', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8jh02bes1eje8d6nm91ei71e.png', '25000.00', '1', '2018-02-24 11:07:30', '2018-02-24 11:07:30', '1004', '1010');
INSERT INTO `order_detail_tb` VALUES ('1011', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '0.01', '1', '2018-02-27 17:26:27', '2018-02-27 17:26:27', '1006', '1011');
INSERT INTO `order_detail_tb` VALUES ('1012', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '0.01', '1', '2018-02-28 10:04:47', '2018-02-28 10:04:47', '1006', '1012');
INSERT INTO `order_detail_tb` VALUES ('1013', '如何打造高效团队？最重要的是这三件事', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '0.01', '1', '2018-02-28 21:34:28', '2018-02-28 21:34:28', '1001', '1013');
INSERT INTO `order_detail_tb` VALUES ('1014', '如何打造高效团队？最重要的是这三件事', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '0.01', '1', '2018-03-01 13:38:04', '2018-03-01 13:38:04', '1001', '1014');
INSERT INTO `order_detail_tb` VALUES ('1015', '钻石vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8j4o210nm1ip459l127t1gt219.png', '4500.00', '1', '2018-03-05 12:35:01', '2018-03-05 12:35:01', '1003', '1015');
INSERT INTO `order_detail_tb` VALUES ('1016', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '0.01', '1', '2018-03-08 17:53:23', '2018-03-08 17:53:23', '1006', '1016');
INSERT INTO `order_detail_tb` VALUES ('1017', '如何打造高效团队？最重要的是这三件事', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '0.01', '1', '2018-03-13 00:51:24', '2018-03-13 00:51:24', '1001', '1017');
INSERT INTO `order_detail_tb` VALUES ('1018', '联合发起人', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8jh02bes1eje8d6nm91ei71e.png', '25000.00', '1', '2018-03-13 01:06:14', '2018-03-13 01:06:14', '1004', '1018');
INSERT INTO `order_detail_tb` VALUES ('1019', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1', '2018-03-14 09:32:06', '2018-03-14 09:32:06', '1002', '1019');
INSERT INTO `order_detail_tb` VALUES ('1020', '如何打造高效团队？最重要的是这三件事', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '0.01', '1', '2018-03-26 17:20:47', '2018-03-26 17:20:47', '1001', '1020');

-- ----------------------------
-- Table structure for `order_tb`
-- ----------------------------
DROP TABLE IF EXISTS `order_tb`;
CREATE TABLE `order_tb` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单号',
  `type` tinyint(4) DEFAULT '0' COMMENT '类型，1VIP购买，2团购卡团购，3付费课程',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付类型，1支付宝，2微信,3余额支付,4ios内购',
  `status` tinyint(4) DEFAULT NULL COMMENT '订单状态，-1待处理删除，0已完成删除,1待处理，2已完成',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '下单人',
  PRIMARY KEY (`order_id`),
  KEY `INDEX_TYPE` (`type`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE,
  KEY `INDEX_PAYTYPE` (`pay_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8 COMMENT='视频订单表';

-- ----------------------------
-- Records of order_tb
-- ----------------------------
INSERT INTO `order_tb` VALUES ('1000', '23942018020517092018792', '1', '2', '0', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1010');
INSERT INTO `order_tb` VALUES ('1001', '28312018020521043312990', '3', '3', '0', '2018-02-05 21:04:34', '2018-02-05 21:04:34', '1009');
INSERT INTO `order_tb` VALUES ('1002', '90292018020521043717342', '3', '3', '0', '2018-02-05 21:04:37', '2018-02-05 21:04:37', '1009');
INSERT INTO `order_tb` VALUES ('1003', '18542018020522392712298', '3', '3', '0', '2018-02-05 22:39:27', '2018-02-05 22:39:27', '1009');
INSERT INTO `order_tb` VALUES ('1004', '32352018020615351817408', '1', '2', '2', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1009');
INSERT INTO `order_tb` VALUES ('1005', '48082018020915415513908', '2', '3', '2', '2018-02-09 15:41:55', '2018-02-24 09:23:14', '1009');
INSERT INTO `order_tb` VALUES ('1006', '95912018021002040216777', '3', '2', '2', '2018-02-10 02:04:02', '2018-02-10 02:04:02', '1010');
INSERT INTO `order_tb` VALUES ('1007', '47722018021013590510740', '1', '3', '2', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1014');
INSERT INTO `order_tb` VALUES ('1008', '48812018022216145217557', '3', '3', '2', '2018-02-22 16:14:52', '2018-02-22 16:14:52', '1000');
INSERT INTO `order_tb` VALUES ('1009', '85742018022314201311905', '3', '3', '0', '2018-02-23 14:20:13', '2018-02-23 14:20:13', '1016');
INSERT INTO `order_tb` VALUES ('1010', '62122018022411073018898', '2', '1', '2', '2018-02-24 11:07:30', '2018-02-24 18:00:04', '1009');
INSERT INTO `order_tb` VALUES ('1011', '99372018022717254518726', '3', '1', '0', '2018-02-27 17:26:27', '2018-02-27 17:26:27', '1009');
INSERT INTO `order_tb` VALUES ('1012', '13492018022810042515065', '3', '1', '2', '2018-02-28 10:04:47', '2018-02-28 10:04:47', '1010');
INSERT INTO `order_tb` VALUES ('1013', '72822018022821342113740', '3', '1', '2', '2018-02-28 21:34:28', '2018-02-28 21:34:28', '1000');
INSERT INTO `order_tb` VALUES ('1014', '45582018030113370510771', '3', '1', '2', '2018-03-01 13:38:04', '2018-03-01 13:38:04', '1018');
INSERT INTO `order_tb` VALUES ('1015', '1010201803051235003677', '2', '3', '2', '2018-03-05 12:35:01', '2018-03-06 11:48:41', '1010');
INSERT INTO `order_tb` VALUES ('1016', '1018201803081742015915', '3', '1', '2', '2018-03-08 17:53:23', '2018-03-08 17:53:23', '1018');
INSERT INTO `order_tb` VALUES ('1017', '1010201803130051235579', '3', '3', '2', '2018-03-13 00:51:24', '2018-03-13 00:51:24', '1010');
INSERT INTO `order_tb` VALUES ('1018', '1010201803130106138133', '2', '3', '2', '2018-03-13 01:06:14', '2018-03-13 16:48:00', '1010');
INSERT INTO `order_tb` VALUES ('1019', '1014201803140932051776', '3', '3', '2', '2018-03-14 09:32:06', '2018-03-14 09:32:06', '1014');
INSERT INTO `order_tb` VALUES ('1020', '1016201803261720388300', '3', '1', '2', '2018-03-26 17:20:47', '2018-03-26 17:20:47', '1016');

-- ----------------------------
-- Table structure for `payment_tb`
-- ----------------------------
DROP TABLE IF EXISTS `payment_tb`;
CREATE TABLE `payment_tb` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '支付id',
  `subject` varchar(255) DEFAULT NULL COMMENT '主题',
  `body` varchar(255) DEFAULT NULL COMMENT '内容',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '异步通知',
  `type` tinyint(4) DEFAULT NULL COMMENT '支付类型，默认1支付宝支付，2微信支付，3银联支付,4ios内购',
  `order_number` varchar(255) DEFAULT NULL COMMENT '平台订单号',
  `money` decimal(11,2) DEFAULT NULL COMMENT '金额',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，1已下单-未支付，2支付成功，3支付失败',
  `business_type` tinyint(4) DEFAULT NULL COMMENT '业务类型，1VIP购买，2团购卡团购，3付费课程',
  `business_id` int(11) DEFAULT NULL COMMENT '业务id,外键',
  `business_notify_url` longtext COMMENT '业务回调,外键',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id,外键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`payment_id`),
  KEY `INDEX_ORDERNUMBER` (`order_number`) USING BTREE,
  KEY `INDEX_TYPE` (`type`) USING BTREE,
  KEY `INDEX_BUSINESSID` (`business_id`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1060 DEFAULT CHARSET=utf8 COMMENT='支付表';

-- ----------------------------
-- Records of payment_tb
-- ----------------------------
INSERT INTO `payment_tb` VALUES ('1000', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '17842018022415065412833', '1111.00', '1', '3', '1002', null, '1009', '2018-02-24 15:06:55', '2018-02-24 15:06:55');
INSERT INTO `payment_tb` VALUES ('1001', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '44572018022415145415194', '1111.00', '1', '3', '1002', null, '1009', '2018-02-24 15:14:54', '2018-02-24 15:14:54');
INSERT INTO `payment_tb` VALUES ('1002', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '99372018022717254518726', '0.01', '2', '3', '1006', null, '1009', '2018-02-27 17:25:46', '2018-02-27 17:26:27');
INSERT INTO `payment_tb` VALUES ('1003', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '22332018022720401710273', '0.01', '1', '3', '1006', null, '1010', '2018-02-27 20:40:18', '2018-02-27 20:40:18');
INSERT INTO `payment_tb` VALUES ('1004', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '20262018022721565011562', '0.01', '1', '3', '1006', null, '1010', '2018-02-27 21:56:51', '2018-02-27 21:56:51');
INSERT INTO `payment_tb` VALUES ('1005', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '92752018022800282211813', '0.01', '1', '3', '1006', null, '1010', '2018-02-28 00:28:23', '2018-02-28 00:28:23');
INSERT INTO `payment_tb` VALUES ('1006', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '80432018022809373011009', '5.00', '1', '4', null, null, '1009', '2018-02-28 09:37:31', '2018-02-28 09:37:31');
INSERT INTO `payment_tb` VALUES ('1007', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '97172018022810005111009', '1.00', '1', '4', null, null, '1009', '2018-02-28 10:00:51', '2018-02-28 10:00:51');
INSERT INTO `payment_tb` VALUES ('1008', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '18062018022810033711009', '1.00', '1', '4', null, null, '1009', '2018-02-28 10:03:37', '2018-02-28 10:03:37');
INSERT INTO `payment_tb` VALUES ('1009', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '13492018022810042515065', '0.01', '2', '3', '1006', null, '1010', '2018-02-28 10:04:26', '2018-02-28 10:04:47');
INSERT INTO `payment_tb` VALUES ('1010', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '15552018022812301511010', '1.00', '1', '4', null, null, '1010', '2018-02-28 12:30:15', '2018-02-28 12:30:15');
INSERT INTO `payment_tb` VALUES ('1011', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '50142018022812491411010', '1.00', '1', '4', null, null, '1010', '2018-02-28 12:49:14', '2018-02-28 12:49:14');
INSERT INTO `payment_tb` VALUES ('1012', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '58472018022812492211010', '1.00', '1', '4', null, null, '1010', '2018-02-28 12:49:22', '2018-02-28 12:49:22');
INSERT INTO `payment_tb` VALUES ('1013', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '90832018022812502111010', '1.00', '1', '4', null, null, '1010', '2018-02-28 12:50:22', '2018-02-28 12:50:22');
INSERT INTO `payment_tb` VALUES ('1014', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '51132018022812513611010', '1.00', '3', '4', null, null, '1010', '2018-02-28 12:51:36', '2018-02-28 12:51:44');
INSERT INTO `payment_tb` VALUES ('1015', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '30042018022812534511010', '1.00', '3', '4', null, null, '1010', '2018-02-28 12:53:46', '2018-02-28 12:53:52');
INSERT INTO `payment_tb` VALUES ('1016', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '37622018022813510611010', '1.00', '1', '4', null, null, '1010', '2018-02-28 13:51:06', '2018-02-28 13:51:06');
INSERT INTO `payment_tb` VALUES ('1017', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '64272018022814545911010', '1.00', '1', '4', null, null, '1010', '2018-02-28 14:55:00', '2018-02-28 14:55:00');
INSERT INTO `payment_tb` VALUES ('1018', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '52732018022815091411010', '0.01', '1', '4', null, null, '1010', '2018-02-28 15:09:14', '2018-02-28 15:09:14');
INSERT INTO `payment_tb` VALUES ('1019', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '86352018022815131111009', '0.01', '2', '4', null, null, '1009', '2018-02-28 15:13:12', '2018-02-28 15:13:28');
INSERT INTO `payment_tb` VALUES ('1020', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '39382018022815212611009', '0.01', '2', '4', null, null, '1009', '2018-02-28 15:21:26', '2018-02-28 15:21:42');
INSERT INTO `payment_tb` VALUES ('1021', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '11602018022815231311009', '0.01', '2', '4', null, null, '1009', '2018-02-28 15:23:14', '2018-02-28 15:23:29');
INSERT INTO `payment_tb` VALUES ('1022', '充值', '充值', 'http://app.jiehao9.com/finance/alipayRechargeNotifyUrl', '1', '46522018022817460511009', '1.00', '1', '4', null, null, '1009', '2018-02-28 17:46:06', '2018-02-28 17:46:06');
INSERT INTO `payment_tb` VALUES ('1023', 'VIP购买', 'VIP购买', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '92132018022817492814481', '365.00', '1', '1', '1002', null, '1016', '2018-02-28 17:49:28', '2018-02-28 17:49:28');
INSERT INTO `payment_tb` VALUES ('1024', 'VIP购买', 'VIP购买', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '21052018022817494512369', '365.00', '1', '1', '1002', null, '1016', '2018-02-28 17:49:46', '2018-02-28 17:49:46');
INSERT INTO `payment_tb` VALUES ('1025', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '59612018022821334613003', '1111.00', '1', '3', '1002', null, '1000', '2018-02-28 21:33:46', '2018-02-28 21:33:46');
INSERT INTO `payment_tb` VALUES ('1026', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '72822018022821342113740', '0.01', '2', '3', '1001', null, '1000', '2018-02-28 21:34:22', '2018-02-28 21:34:28');
INSERT INTO `payment_tb` VALUES ('1027', '团购卡团购', '团购卡团购', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '61682018022822315312747', '65000.00', '1', '2', '1005', '{\"nickname\":\"哦？是吗\",\"phone\":\"17702183918\",\"contactPhone\":\"17702183918\"}', '1009', '2018-02-28 22:31:54', '2018-02-28 22:31:54');
INSERT INTO `payment_tb` VALUES ('1028', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '43992018030109391814659', '1111.00', '1', '3', '1002', null, '1000', '2018-03-01 09:39:19', '2018-03-01 09:39:19');
INSERT INTO `payment_tb` VALUES ('1029', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '83772018030113241914524', '0.01', '1', '3', '1001', null, '1018', '2018-03-01 13:24:19', '2018-03-01 13:24:19');
INSERT INTO `payment_tb` VALUES ('1030', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '24782018030113315312207', '0.01', '1', '3', '1001', null, '1018', '2018-03-01 13:31:54', '2018-03-01 13:31:54');
INSERT INTO `payment_tb` VALUES ('1031', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '43462018030113334517815', '1111.00', '1', '3', '1002', null, '1018', '2018-03-01 13:33:45', '2018-03-01 13:33:45');
INSERT INTO `payment_tb` VALUES ('1032', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '45582018030113370510771', '0.01', '2', '3', '1001', null, '1018', '2018-03-01 13:37:06', '2018-03-01 13:38:04');
INSERT INTO `payment_tb` VALUES ('1033', '团购卡团购', '团购卡团购', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '45192018030114130114810', '195000.00', '1', '2', '1006', '{\"nickname\":\"哦？是吗\",\"phone\":\"17702183918\",\"contactPhone\":\"17702183918\"}', '1009', '2018-03-01 14:13:02', '2018-03-01 14:13:02');
INSERT INTO `payment_tb` VALUES ('1034', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '29202018030116363412581', '0.01', '1', '3', '1001', null, '1009', '2018-03-01 16:36:34', '2018-03-01 16:36:34');
INSERT INTO `payment_tb` VALUES ('1035', 'VIP购买', 'VIP购买', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '1016201803031356424991', '365.00', '1', '1', '1002', null, '1016', '2018-03-03 13:56:43', '2018-03-03 13:56:43');
INSERT INTO `payment_tb` VALUES ('1036', '团购卡团购', '团购卡团购', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '1010201803041329235011', '4500.00', '1', '2', '1003', '{\"nickname\":\"123\",\"phone\":\"15211547807\",\"contactPhone\":\"15211547807\"}', '1010', '2018-03-04 13:29:24', '2018-03-04 13:29:24');
INSERT INTO `payment_tb` VALUES ('1037', '团购卡团购', '团购卡团购', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '1010201803051234466270', '4500.00', '1', '2', '1003', '{\"nickname\":\"123\",\"phone\":\"15211547807\",\"contactPhone\":\"15211547807\"}', '1010', '2018-03-05 12:34:47', '2018-03-05 12:34:47');
INSERT INTO `payment_tb` VALUES ('1038', 'VIP购买', 'VIP购买', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '1016201803051542504612', '365.00', '1', '1', '1002', null, '1016', '2018-03-05 15:42:50', '2018-03-05 15:42:50');
INSERT INTO `payment_tb` VALUES ('1039', 'VIP购买', 'VIP购买', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '1016201803051547456362', '365.00', '1', '1', '1002', null, '1016', '2018-03-05 15:47:46', '2018-03-05 15:47:46');
INSERT INTO `payment_tb` VALUES ('1040', 'VIP购买', 'VIP购买', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '1012201803081401086412', '365.00', '1', '1', '1002', null, '1012', '2018-03-08 14:01:08', '2018-03-08 14:01:08');
INSERT INTO `payment_tb` VALUES ('1041', 'VIP购买', 'VIP购买', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '1016201803081723405844', '365.00', '1', '1', '1002', null, '1016', '2018-03-08 17:23:40', '2018-03-08 17:23:40');
INSERT INTO `payment_tb` VALUES ('1042', '付费课程', '付费课程', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '1018201803081742015915', '0.01', '2', '3', '1006', null, '1018', '2018-03-08 17:42:02', '2018-03-08 17:53:23');
INSERT INTO `payment_tb` VALUES ('1043', 'VIP购买', 'VIP购买', 'http://app.jiehao9.com/payment/alipayNotifyUrl', '1', '1016201803121002306241', '365.00', '1', '1', '1002', null, '1016', '2018-03-12 10:02:31', '2018-03-12 10:02:31');
INSERT INTO `payment_tb` VALUES ('1044', '付费课程', '付费课程', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1018201803131645087347', '1111.00', '1', '3', '1002', null, '1018', '2018-03-13 16:45:08', '2018-03-13 16:45:08');
INSERT INTO `payment_tb` VALUES ('1045', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201803131715418916', '365.00', '1', '1', '1002', null, '1016', '2018-03-13 17:15:42', '2018-03-13 17:15:42');
INSERT INTO `payment_tb` VALUES ('1046', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201803150954587886', '0.01', '1', '4', null, null, '1014', '2018-03-15 09:54:58', '2018-03-15 09:54:58');
INSERT INTO `payment_tb` VALUES ('1047', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1010201803152259059512', '0.01', '1', '4', null, null, '1010', '2018-03-15 22:59:06', '2018-03-15 22:59:06');
INSERT INTO `payment_tb` VALUES ('1048', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1010201803161211522016', '0.01', '1', '4', null, null, '1010', '2018-03-16 12:11:53', '2018-03-16 12:11:53');
INSERT INTO `payment_tb` VALUES ('1049', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201803261641053253', '365.00', '1', '1', '1002', null, '1016', '2018-03-26 16:41:05', '2018-03-26 16:41:05');
INSERT INTO `payment_tb` VALUES ('1050', '付费课程', '付费课程', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201803261720388300', '0.01', '2', '3', '1001', null, '1016', '2018-03-26 17:20:39', '2018-03-26 17:20:47');
INSERT INTO `payment_tb` VALUES ('1051', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201803261731433068', '365.00', '1', '1', '1002', null, '1016', '2018-03-26 17:31:43', '2018-03-26 17:31:43');
INSERT INTO `payment_tb` VALUES ('1052', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201803261747003498', '1.00', '1', '4', null, null, '1016', '2018-03-26 17:47:00', '2018-03-26 17:47:00');
INSERT INTO `payment_tb` VALUES ('1053', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201803261747064911', '0.10', '3', '4', null, null, '1016', '2018-03-26 17:47:07', '2018-03-26 17:47:10');
INSERT INTO `payment_tb` VALUES ('1054', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201803271514445208', '365.00', '1', '1', '1002', null, '1016', '2018-03-27 15:14:45', '2018-03-27 15:14:45');
INSERT INTO `payment_tb` VALUES ('1055', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201803271529225232', '365.00', '1', '1', '1002', null, '1016', '2018-03-27 15:29:23', '2018-03-27 15:29:23');
INSERT INTO `payment_tb` VALUES ('1056', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201803271531162525', '1.00', '1', '4', null, null, '1016', '2018-03-27 15:31:16', '2018-03-27 15:31:16');
INSERT INTO `payment_tb` VALUES ('1057', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201803271531246309', '0.01', '2', '4', null, null, '1016', '2018-03-27 15:31:24', '2018-03-27 15:31:28');
INSERT INTO `payment_tb` VALUES ('1058', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201803271532019036', '0.10', '3', '4', null, null, '1016', '2018-03-27 15:32:02', '2018-03-27 15:32:05');
INSERT INTO `payment_tb` VALUES ('1059', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1019201803281131081973', '365.00', '1', '1', '1002', null, '1019', '2018-03-28 11:31:08', '2018-03-28 11:31:08');

-- ----------------------------
-- Table structure for `platform_day_tb`
-- ----------------------------
DROP TABLE IF EXISTS `platform_day_tb`;
CREATE TABLE `platform_day_tb` (
  `platform_day_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '平台日id',
  `team_purchase_price` decimal(11,2) DEFAULT '0.00' COMMENT '团购金额',
  `recommend_commission` decimal(11,2) DEFAULT '0.00' COMMENT '推荐佣金',
  `split_reward` decimal(11,2) DEFAULT '0.00' COMMENT '拆分奖励',
  `split_parent_reward` decimal(11,2) DEFAULT '0.00' COMMENT '拆分上级奖励',
  `split_platform_reward` decimal(11,2) DEFAULT '0.00' COMMENT '拆分平台奖励',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`platform_day_id`),
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='平台日表';

-- ----------------------------
-- Records of platform_day_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `receipt_info_tb`
-- ----------------------------
DROP TABLE IF EXISTS `receipt_info_tb`;
CREATE TABLE `receipt_info_tb` (
  `receipt_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收货信息id',
  `name` varchar(255) DEFAULT NULL COMMENT '收货地址姓名',
  `phone` varchar(255) DEFAULT NULL COMMENT '收货地址手机号',
  `address` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `is_default` tinyint(4) DEFAULT '0' COMMENT '默认为0不是，1是',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id,外键',
  PRIMARY KEY (`receipt_info_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_ISDEFAULT` (`is_default`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='收货地址表 ';

-- ----------------------------
-- Records of receipt_info_tb
-- ----------------------------
INSERT INTO `receipt_info_tb` VALUES ('1002', '协议', '144676494376', '贵州省 安顺市 ;心如止水一样一样', '1', '2018-01-27 19:38:42', '2018-01-27 19:38:55', '1009');
INSERT INTO `receipt_info_tb` VALUES ('1003', '就看看', '56655', '广东省 河源市 ;书海', '0', '2018-02-22 16:50:11', '2018-02-22 16:50:11', '1015');

-- ----------------------------
-- Table structure for `role_tb`
-- ----------------------------
DROP TABLE IF EXISTS `role_tb`;
CREATE TABLE `role_tb` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名',
  `duty` varchar(255) DEFAULT NULL COMMENT '角色职责',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role_tb
-- ----------------------------
INSERT INTO `role_tb` VALUES ('1000', '超级管理员', '超级管理员', '2018-01-19 15:46:08');
INSERT INTO `role_tb` VALUES ('1001', '用户', '用户', '2018-01-19 15:46:08');

-- ----------------------------
-- Table structure for `split_tb`
-- ----------------------------
DROP TABLE IF EXISTS `split_tb`;
CREATE TABLE `split_tb` (
  `split_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '拆分id',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(255) DEFAULT NULL COMMENT '会员账号',
  `contact_phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `number` int(4) DEFAULT NULL COMMENT '数量',
  `price` decimal(11,2) DEFAULT NULL COMMENT '金额',
  `apply_date` datetime DEFAULT NULL COMMENT '申请时间',
  `split_date` datetime DEFAULT NULL COMMENT '拆分时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '拆分状态，默认0已申请，1已拆分，2已拒绝，3已退款，4已推荐给上级',
  `recommend_account_id` int(11) DEFAULT NULL COMMENT '推荐人id',
  `account_id` int(11) DEFAULT NULL COMMENT '账户自身id,邀请码',
  `buy_account_id` int(11) DEFAULT NULL COMMENT '购买者id,外键',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id,外键',
  PRIMARY KEY (`split_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_BUYACCOUNTID` (`buy_account_id`) USING BTREE,
  KEY `INDEX_RECOMMENDACCOUNTID` (`recommend_account_id`) USING BTREE,
  KEY `INDEX_APPLYDATE` (`apply_date`) USING BTREE,
  KEY `INDEX_SPLITDATE` (`split_date`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='拆分表';

-- ----------------------------
-- Records of split_tb
-- ----------------------------
INSERT INTO `split_tb` VALUES ('1000', '哦？是吗', '17702183918', '17702183918', '无', '39', '4500.00', '2018-02-09 15:41:55', '2018-02-24 09:23:14', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1', null, '1000', '1009', '1005');
INSERT INTO `split_tb` VALUES ('1001', '哦？是吗', '17702183918', '17702183918', '无', '250', '25000.00', '2018-02-24 11:07:30', '2018-02-24 18:00:04', '2018-02-24 11:07:30', '2018-02-24 11:07:30', '1', null, '1000', '1009', '1010');
INSERT INTO `split_tb` VALUES ('1002', '123', '15211547807', '15211547807', '无', '39', '4500.00', '2018-03-05 12:35:01', '2018-03-06 11:48:41', '2018-03-05 12:35:01', '2018-03-05 12:35:01', '1', null, '1000', '1010', '1015');
INSERT INTO `split_tb` VALUES ('1003', '123', '15211547807', '15211547807', '无', '250', '25000.00', '2018-03-13 01:06:14', '2018-03-13 16:48:00', '2018-03-13 01:06:14', '2018-03-13 01:06:14', '1', null, '1000', '1010', '1018');

-- ----------------------------
-- Table structure for `team_purchase_info_tb`
-- ----------------------------
DROP TABLE IF EXISTS `team_purchase_info_tb`;
CREATE TABLE `team_purchase_info_tb` (
  `team_purchase_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '团购信息id',
  `team_purchase_card_allowance` int(11) DEFAULT NULL COMMENT '团购卡余量',
  `already_team_purchase` int(11) DEFAULT NULL COMMENT '已团购（张）',
  `wait_dispose` int(11) DEFAULT NULL COMMENT '待处理（张）',
  `wait_dispose_price` decimal(11,2) DEFAULT NULL COMMENT '待处理总额',
  `wait_dispose_update_date` datetime DEFAULT NULL COMMENT '待处理更新时间',
  `team_purchase_success` int(11) DEFAULT NULL COMMENT '团购成功（张）',
  `team_purchase_success_price` decimal(11,2) DEFAULT NULL COMMENT '团购成功总额',
  `team_purchase_success_update_date` datetime DEFAULT NULL COMMENT '团购成功更新时间',
  `already_split` int(11) DEFAULT NULL COMMENT '已拆分（张）',
  `already_split_price` decimal(11,2) DEFAULT NULL COMMENT '已拆分总额',
  `already_split_update_date` datetime DEFAULT NULL COMMENT '已拆分更新时间',
  `already_recommend` int(11) DEFAULT NULL COMMENT '已推荐给上级（张）',
  `already_recommend_price` decimal(11,2) DEFAULT NULL COMMENT '已推荐给上级总额',
  `already_recommend_update_date` datetime DEFAULT NULL COMMENT '已推荐给上级更新时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id,外键',
  PRIMARY KEY (`team_purchase_info_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='团购信息表 ';

-- ----------------------------
-- Records of team_purchase_info_tb
-- ----------------------------
INSERT INTO `team_purchase_info_tb` VALUES ('1000', '1894', '0', '0', '0.00', '2018-02-05 15:18:48', '0', '0.00', '2018-02-05 15:19:07', '578', '59000.00', '2018-03-13 16:47:59', '0', '0.00', '2018-02-05 15:20:20', '2018-02-05 15:20:22', '2018-03-13 16:47:59', '1000');
INSERT INTO `team_purchase_info_tb` VALUES ('1001', '289', '289', '0', '0.00', '2018-03-13 16:47:59', '289', '29500.00', '2018-03-13 16:47:59', '0', '0.00', '2018-02-05 17:09:20', '0', '0.00', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '2018-03-13 16:47:59', '1010');
INSERT INTO `team_purchase_info_tb` VALUES ('1002', '289', '289', '0', '0.00', '2018-02-24 18:00:04', '289', '29500.00', '2018-02-24 18:00:04', '0', '0.00', '2018-02-06 15:35:18', '0', '0.00', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '2018-02-24 18:00:04', '1009');
INSERT INTO `team_purchase_info_tb` VALUES ('1003', '0', '0', '0', '0.00', '2018-02-10 13:59:05', '0', '0.00', '2018-02-10 13:59:05', '0', '0.00', '2018-02-10 13:59:05', '0', '0.00', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1014');

-- ----------------------------
-- Table structure for `video_cache_tb`
-- ----------------------------
DROP TABLE IF EXISTS `video_cache_tb`;
CREATE TABLE `video_cache_tb` (
  `video_cache_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频缓存id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_address` varchar(255) DEFAULT NULL COMMENT '封面',
  `duration` varchar(255) DEFAULT NULL COMMENT '时长',
  `size` varchar(255) DEFAULT NULL COMMENT '容量，单位byte',
  `account_id` int(11) DEFAULT NULL COMMENT '播放记录id外键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `video_id` int(11) DEFAULT NULL COMMENT '视频id外键',
  PRIMARY KEY (`video_cache_id`),
  KEY `INDEX_VIDEOID` (`video_id`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='视频缓存表';

-- ----------------------------
-- Records of video_cache_tb
-- ----------------------------
INSERT INTO `video_cache_tb` VALUES ('1000', 'cs5', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '6', '4.20MB', '1009', '2018-03-02 14:04:40', '5');
INSERT INTO `video_cache_tb` VALUES ('1001', 'cesh3', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '6', '15.76MB', '1009', '2018-03-02 14:05:18', '3');
INSERT INTO `video_cache_tb` VALUES ('1002', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '6', '15.76MB', '1009', '2018-03-02 14:05:22', '2');

-- ----------------------------
-- Table structure for `video_play_record_tb`
-- ----------------------------
DROP TABLE IF EXISTS `video_play_record_tb`;
CREATE TABLE `video_play_record_tb` (
  `video_play_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频播放记录id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_address` varchar(255) DEFAULT NULL COMMENT '封面',
  `duration` varchar(255) DEFAULT NULL COMMENT '时长',
  `size` varchar(255) DEFAULT NULL COMMENT '容量，单位byte',
  `account_id` int(11) DEFAULT NULL COMMENT '观看者id外键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `video_id` int(11) DEFAULT NULL COMMENT '视频id外键',
  PRIMARY KEY (`video_play_record_id`),
  KEY `INDEX_VIDEOID` (`video_id`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1559 DEFAULT CHARSET=utf8 COMMENT='视频播放记录表';

-- ----------------------------
-- Records of video_play_record_tb
-- ----------------------------
INSERT INTO `video_play_record_tb` VALUES ('1530', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-03-16 09:13:39', '10');
INSERT INTO `video_play_record_tb` VALUES ('1531', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-03-16 09:13:42', '12');
INSERT INTO `video_play_record_tb` VALUES ('1532', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1010', '2018-03-16 09:13:47', '7');
INSERT INTO `video_play_record_tb` VALUES ('1533', 'cccccd', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', '1010', '2018-03-16 09:14:16', '11');
INSERT INTO `video_play_record_tb` VALUES ('1534', 'cccccd', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', '1009', '2018-03-16 16:48:11', '11');
INSERT INTO `video_play_record_tb` VALUES ('1535', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1009', '2018-03-16 17:19:40', '13');
INSERT INTO `video_play_record_tb` VALUES ('1536', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1014', '2018-03-16 21:15:02', '8');
INSERT INTO `video_play_record_tb` VALUES ('1537', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1009', '2018-03-19 14:42:05', '8');
INSERT INTO `video_play_record_tb` VALUES ('1538', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1016', '2018-03-26 16:44:05', '12');
INSERT INTO `video_play_record_tb` VALUES ('1539', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1016', '2018-03-26 17:20:56', '10');
INSERT INTO `video_play_record_tb` VALUES ('1540', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1009', '2018-03-26 17:25:23', '7');
INSERT INTO `video_play_record_tb` VALUES ('1541', 'cc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1009', '2018-03-26 17:25:31', '6');
INSERT INTO `video_play_record_tb` VALUES ('1542', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1009', '2018-03-26 17:25:42', '2');
INSERT INTO `video_play_record_tb` VALUES ('1543', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1009', '2018-03-26 17:26:09', '9');
INSERT INTO `video_play_record_tb` VALUES ('1544', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1019', '2018-03-27 13:19:25', '7');
INSERT INTO `video_play_record_tb` VALUES ('1549', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1000', '2018-03-27 14:01:45', '13');
INSERT INTO `video_play_record_tb` VALUES ('1550', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1000', '2018-03-27 14:02:33', '12');
INSERT INTO `video_play_record_tb` VALUES ('1551', 'cccccd', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', '1000', '2018-03-27 14:03:09', '11');
INSERT INTO `video_play_record_tb` VALUES ('1552', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1000', '2018-03-27 14:04:55', '10');
INSERT INTO `video_play_record_tb` VALUES ('1553', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1000', '2018-03-27 14:13:17', '14');
INSERT INTO `video_play_record_tb` VALUES ('1554', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1000', '2018-03-27 14:13:50', '8');
INSERT INTO `video_play_record_tb` VALUES ('1555', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1000', '2018-03-27 14:13:54', '2');
INSERT INTO `video_play_record_tb` VALUES ('1556', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1000', '2018-03-27 14:14:35', '7');
INSERT INTO `video_play_record_tb` VALUES ('1557', 'cc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1000', '2018-03-27 14:16:46', '6');
INSERT INTO `video_play_record_tb` VALUES ('1558', '测试', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3j6fm3ae1pd21efcf8u1pvq2f.jpg', '00:00:12', '1.54', '1018', '2018-03-27 14:58:52', '15');

-- ----------------------------
-- Table structure for `video_set_cate_tb`
-- ----------------------------
DROP TABLE IF EXISTS `video_set_cate_tb`;
CREATE TABLE `video_set_cate_tb` (
  `video_set_cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集类型id',
  `name` varchar(255) DEFAULT NULL COMMENT '视频集类型名称',
  `summary` varchar(255) DEFAULT NULL COMMENT '简介',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `img_address` varchar(255) DEFAULT NULL COMMENT '封面',
  `play_number` varchar(255) DEFAULT NULL COMMENT '播放总次数',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`video_set_cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8 COMMENT='视频集类型表';

-- ----------------------------
-- Records of video_set_cate_tb
-- ----------------------------
INSERT INTO `video_set_cate_tb` VALUES ('1000', '婚姻家庭', '婚姻家庭咨询师是为在恋爱、婚姻、家庭生活中遇到各种问题的求助者提供咨询和辅导服务的人员，他们会恪守职业道德，保护求助者的个人隐私，更好地为求助者服务。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a23rgp1lttge8ogq13c717cf1f.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5s9o8r4nqj1uaf1n3p18dh1svu5b.jpg', '99', '2018-03-27 14:19:37');
INSERT INTO `video_set_cate_tb` VALUES ('1001', '子女教育', '教育子女要以引导，引诱，方法，在游戏中学习，娱乐中提高，比赛中锻炼，人才共生就是要吧学习的人放在一起所以他们就爱学习，所以你要运用适当的方法和技巧去引导他，当上学的时候就可以竞争中提高了。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a239ko11im15na1gr0b5n1uec1a.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5s9revogh31sm5o1a3d719et5g.jpg', '83', '2018-03-27 14:01:45');
INSERT INTO `video_set_cate_tb` VALUES ('1002', '演讲口才', '《演讲与口才》是一个杂志出刊。该杂志创始人为邵守义，他对我国演讲与口才理论的研究做出了巨大的贡献，被誉为“新时期演讲事业的开拓者”。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a22n7t17de8g913e7gghnou15.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5s9sfdf172u1h7v1jaf114u4c75l.jpg', '86', '2018-03-27 14:15:55');
INSERT INTO `video_set_cate_tb` VALUES ('1003', '自我成长', '人一生的主线基本围绕家庭，工作，情感三个方面，其中工作是实现自我最直接的一条线，身边总会有一些成功或是不成功的案例。多数人对成功的理解就是拥有更多的财富，而作为一个从事多年猎头顾问以及心理咨询的我来说，如何将自我成长发挥到极致才是真正的成功。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a224rvlcnqfr1h5ao11p4610.png', 'https://image.xinli001.com/20160115/100404ru964l7hjfz8r5mz.jpg', '83', '2018-03-27 14:20:48');
INSERT INTO `video_set_cate_tb` VALUES ('1004', '人际关系', '人际关系这个词是在20世纪初由美国人事管理协会率先提出的，也被称为人际关系论，1933年由美国哈佛大学教授梅约创立。这个概念可以从三个方面理解：\n1、人际关系表明人与人相互交往过程中心理关系的亲密性、融洽性和协调性的程度\n2、人际关系有三种心理成分组成。认知、情感和行为成分\n3、人际关系是在彼此交往的过程中建立和发展起来的。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a21jr7r8aang1ih21na11ol8r.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5s9uppvhmi1jl4slu1pv9pdh5q.jpg', '60', '2018-03-28 12:37:21');
INSERT INTO `video_set_cate_tb` VALUES ('1005', '企业管理', '企业管理是对企业生产经营活动进行计划、组织、指挥、协调和控制等一系列活动的总称，是社会化大生产的客观要求。企业管理是尽可能利用企业的人力、物力、财力、信息等资源，实现多、快、好、省的目标，取得最大的投入产出效率。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a21642lig1i7a12siea1m01m.png', 'https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=d8b6210d8313632711edc531a18ea056/c8ea15ce36d3d5397f69b2123387e950342ab08f.jpg', '15', '2018-03-26 17:26:09');
INSERT INTO `video_set_cate_tb` VALUES ('1006', '团队打造', '“没有行动的远见只能是一种梦想，没有远见的行动只能是一种苦役，远见和行动才是世界的希望”', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a20f1q9ka31d1acl1l7h18ioh.png', 'https://gss0.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/f9198618367adab480e717ba80d4b31c8701e410.jpg', '134', '2018-03-27 14:19:33');
INSERT INTO `video_set_cate_tb` VALUES ('1007', '市场营销', '市场营销（Marketing），又称作市场学、市场行销或行销学，MBA、EMBA等经典商管课程均将市场营销作为对管理者进行管理和教育的重要模块包含在内。市场营销是在创造、沟通、传播和交换产品中，为顾客、客户、合作伙伴以及整个社会带来经济价值的活动、过程和体系。主要是指营销人员针对市场开展经营活动、销售行为的过程。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c58i4jkm123t1mpa2bkgp8i17h.png', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2098464012,1630838369&fm=173&s=9BA046870C1138DC56A73FA10300B00E&w=218&h=146&img.JPEG', '62', '2018-03-27 14:59:18');

-- ----------------------------
-- Table structure for `video_set_collect_tb`
-- ----------------------------
DROP TABLE IF EXISTS `video_set_collect_tb`;
CREATE TABLE `video_set_collect_tb` (
  `video_set_collect_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集收藏id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_address` varchar(255) DEFAULT NULL COMMENT '封面',
  `duration` varchar(255) DEFAULT NULL COMMENT '时长',
  `size` varchar(255) DEFAULT NULL COMMENT '容量，单位byte',
  `account_id` int(11) DEFAULT NULL COMMENT '收藏人id外键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `video_set_id` int(11) DEFAULT NULL COMMENT '视频集id外键',
  PRIMARY KEY (`video_set_collect_id`),
  KEY `INDEX_VIDEOSETID` (`video_set_id`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8 COMMENT='视频集收藏表';

-- ----------------------------
-- Records of video_set_collect_tb
-- ----------------------------
INSERT INTO `video_set_collect_tb` VALUES ('1025', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1009', '2018-03-12 09:35:08', '1007');
INSERT INTO `video_set_collect_tb` VALUES ('1027', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1016', '2018-03-13 17:20:07', '1006');
INSERT INTO `video_set_collect_tb` VALUES ('1028', '如何打造高效团队？最重要的是这三件事', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1016', '2018-03-26 17:21:54', '1001');
INSERT INTO `video_set_collect_tb` VALUES ('1029', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1000', '2018-03-27 13:59:48', '1007');
INSERT INTO `video_set_collect_tb` VALUES ('1030', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1000', '2018-03-27 14:15:09', '1008');
INSERT INTO `video_set_collect_tb` VALUES ('1031', '测试视频 化肥会挥发', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3gsdj1sb61dtq5hm19kb3ut1e.jpg', '00:00:12', '1.54', '1016', '2018-03-27 15:09:17', '1009');

-- ----------------------------
-- Table structure for `video_set_search_tb`
-- ----------------------------
DROP TABLE IF EXISTS `video_set_search_tb`;
CREATE TABLE `video_set_search_tb` (
  `video_set_search_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集搜索id',
  `name` varchar(255) DEFAULT NULL COMMENT '视频集搜索名称',
  `number` int(11) DEFAULT NULL COMMENT '次数',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`video_set_search_id`),
  KEY `INDEX_NUMBER` (`number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8 COMMENT='视频集搜索表';

-- ----------------------------
-- Records of video_set_search_tb
-- ----------------------------
INSERT INTO `video_set_search_tb` VALUES ('1000', '人才', '8', '2018-03-27 15:27:58');
INSERT INTO `video_set_search_tb` VALUES ('1001', '团队', '333', '2018-02-02 19:33:43');
INSERT INTO `video_set_search_tb` VALUES ('1002', '亲子', '5', '2018-03-27 15:27:25');
INSERT INTO `video_set_search_tb` VALUES ('1003', '教育', '12328', '2018-03-27 15:27:19');
INSERT INTO `video_set_search_tb` VALUES ('1004', '人生', '1232', '2018-02-02 19:34:06');
INSERT INTO `video_set_search_tb` VALUES ('1005', '打造', '13434', '2018-02-02 19:34:14');
INSERT INTO `video_set_search_tb` VALUES ('1006', '口才', '13446', '2018-03-27 15:27:35');
INSERT INTO `video_set_search_tb` VALUES ('1007', '成长', '12327', '2018-03-27 15:27:21');
INSERT INTO `video_set_search_tb` VALUES ('1008', '营销', '12329', '2018-03-27 15:27:18');
INSERT INTO `video_set_search_tb` VALUES ('1009', '222', '4', '2018-03-27 15:27:23');

-- ----------------------------
-- Table structure for `video_set_tag_tb`
-- ----------------------------
DROP TABLE IF EXISTS `video_set_tag_tb`;
CREATE TABLE `video_set_tag_tb` (
  `video_set_tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集标签id',
  `name` varchar(255) DEFAULT NULL COMMENT '视频集标签名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `video_set_id` int(11) DEFAULT NULL COMMENT '视频集id',
  PRIMARY KEY (`video_set_tag_id`),
  KEY `INDEX_VIDEOSETID` (`video_set_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8 COMMENT='视频集标签表';

-- ----------------------------
-- Records of video_set_tag_tb
-- ----------------------------
INSERT INTO `video_set_tag_tb` VALUES ('1000', '演讲', '2018-02-02 18:51:05', '1008');
INSERT INTO `video_set_tag_tb` VALUES ('1001', '口才', '2018-02-02 18:51:09', '1008');
INSERT INTO `video_set_tag_tb` VALUES ('1002', '子女', '2018-02-02 18:51:19', '1007');
INSERT INTO `video_set_tag_tb` VALUES ('1003', '教育', '2018-02-02 18:51:23', '1007');
INSERT INTO `video_set_tag_tb` VALUES ('1004', '婚姻', '2018-02-02 18:51:37', '1006');
INSERT INTO `video_set_tag_tb` VALUES ('1005', '家庭', '2018-02-02 18:51:42', '1006');
INSERT INTO `video_set_tag_tb` VALUES ('1006', '市场', '2018-02-02 18:52:00', '1000');
INSERT INTO `video_set_tag_tb` VALUES ('1007', '营销', '2018-02-02 18:52:05', '1000');
INSERT INTO `video_set_tag_tb` VALUES ('1008', '团队', '2018-02-02 18:52:23', '1001');
INSERT INTO `video_set_tag_tb` VALUES ('1009', '企业', '2018-02-02 18:52:37', '1002');
INSERT INTO `video_set_tag_tb` VALUES ('1010', '管理', '2018-02-02 18:52:41', '1002');
INSERT INTO `video_set_tag_tb` VALUES ('1011', '关系', '2018-02-02 18:52:54', '1003');
INSERT INTO `video_set_tag_tb` VALUES ('1012', '成长', '2018-02-02 18:55:51', '1004');

-- ----------------------------
-- Table structure for `video_set_tb`
-- ----------------------------
DROP TABLE IF EXISTS `video_set_tb`;
CREATE TABLE `video_set_tb` (
  `video_set_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_address` varchar(255) DEFAULT NULL COMMENT '封面',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `summary` longtext COMMENT '简介',
  `recommend` tinyint(4) DEFAULT '0' COMMENT '推荐，默认0不推，1封推，2热门推荐，3专栏',
  `cost` tinyint(4) DEFAULT '0' COMMENT '是否收费，0免费，1vip免费，2付费课程',
  `total_price` decimal(11,2) DEFAULT '0.00' COMMENT '总价，默认为0，若为0则免费',
  `number` int(11) DEFAULT '0' COMMENT '视频集数',
  `play_number` int(11) DEFAULT '0' COMMENT '播放总次数',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态0下架,默认1上架',
  `video_set_cate_id` int(11) DEFAULT NULL COMMENT '视频集类型id,外键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`video_set_id`),
  KEY `INDEX_RECOMMEND` (`recommend`) USING BTREE,
  KEY `INDEX_COST` (`cost`) USING BTREE,
  KEY `INDEX_VIDEOSETCATEID` (`video_set_cate_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8 COMMENT='视频集表';

-- ----------------------------
-- Records of video_set_tb
-- ----------------------------
INSERT INTO `video_set_tb` VALUES ('1000', '自带流量的IP是个什么鬼？', 'http://p2bhwwngu.bkt.clouddn.com/o_1c529rh8d1sea19b1l9hgfr1p1kh.jpg', '苗庆显', '三只松鼠毫无疑问是电商上最成功的坚果品牌，有数据说2016年销售了49亿元，2017年的双十一又是坚果类销售第一。\n据总结，三只松鼠的成功是IP化的成功，于是为了IP价值的最大化，三只松鼠决定干两件事：一是延伸品类，比如做牙膏，理由是“吃了三只松鼠的坚果，要刷牙，肯定会想到用三只松鼠的牙膏”；二是布局线下店，让三只松鼠的IP价值在线下落地。', '0', '1', '0.00', '1', '60', '1', '1007', '2018-01-30 09:11:57', '2018-02-08 18:48:14');
INSERT INTO `video_set_tb` VALUES ('1001', '如何打造高效团队？最重要的是这三件事', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '多多头 ', '据说二战时德国军队将人分成四类：聪明又懒惰的可做军官，聪明又勤快的可任参谋；愚蠢又懒惰的可当士兵，愚蠢又勤快的赶紧滚蛋。以上说法虽然有失偏颇但是也昭显了一个高效团队的管理思路和用人原则。', '0', '2', '0.01', '1', '134', '1', '1006', '2018-01-30 09:27:07', '2018-02-28 10:55:12');
INSERT INTO `video_set_tb` VALUES ('1002', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '测试', '企业管理学专业主要是培养能够掌握现代工商管理的理论、方法和技能，熟悉国内外工商管理的历史、现状和最新动态，能用所学知识分析解决我国企业管理中的一些实际问题的高级人才。', '1', '2', '1111.00', '1', '15', '1', '1005', '2018-01-30 10:01:47', '2018-01-30 14:20:52');
INSERT INTO `video_set_tb` VALUES ('1003', '人际关系', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '百科科学词条', '人际关系这个词是在20世纪初由美国人事管理协会率先提出的，也被称为人际关系论，1933年由美国哈佛大学教授梅约创立。这个概念可以从三个方面理解：\n1、人际关系表明人与人相互交往过程中心理关系的亲密性、融洽性和协调性的程度\n2、人际关系有三种心理成分组成。认知、情感和行为成分\n3、人际关系是在彼此交往的过程中建立和发展起来的。', '2', '1', '0.00', '1', '60', '1', '1004', '2018-01-30 10:03:40', '2018-01-30 14:20:19');
INSERT INTO `video_set_tb` VALUES ('1004', '如何定义自我成长', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52ctfj617p11u6hak28j7uttr.jpg', 'SusanKuang', '知识，作为人类集体智慧的结晶，是从古至今所有人类长期探索宇宙万物以及自我所积累的结果。然而并非所有知识都拥有同样的价值，其中最重要的当然非科学知识莫属。与非科学或者伪科学类知识不同，科学知识有几大重要特点：第一，它的涵盖面很广，能够解释的范围也广；第二，它研究的是客观世界，并且可以通过不断自我修正的方式去接近真理；第三，它追求逻辑上的自洽性。因此，当我们以科学知识为基础去了解周围世界时，我们对于世界的理解会更接近其真实的样子。\n\n作者：SusanKuang\n链接：https://www.jianshu.com/p/3bfb8f05d64a\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '0', '0', '0.00', '2', '83', '1', '1003', '2018-01-30 10:04:52', '2018-03-26 17:42:39');
INSERT INTO `video_set_tb` VALUES ('1005', '如何锻炼口才？', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52dh7kp1rst17pl1d14i9114meh.jpg', '知乎用户', '口才像一辆汽车，表达能力是发动机，知识积累、业务能力、敬业精神这些都是汽油。没有汽油，再好的发动机也没用。腹有诗书气自华，随着内在综合实力的提高，你的外在气质也会出现相匹配的分值上升，提升整体战斗力。', '0', '1', '0.00', '4', '45', '1', '1002', '2018-01-30 10:16:25', '2018-02-08 18:48:09');
INSERT INTO `video_set_tb` VALUES ('1006', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', 'ces', '程皓具有金牌牙医和恋爱专家两种身份，帮客户王宁在比利时举办婚礼派对。派对结束泳池边有美女陷入窒息，程皓为美女做心脏复苏，被即将升任大堂经理的罗玥误会猥亵少女，打晕并报警抓走程皓。罗玥嫉恶如仇在警局仍指责攻击程皓，调取录像证明程皓清白，程皓寄投诉信反击罗玥。经理带罗玥前来道歉赔偿，程皓要罗玥当私人导游。', '1', '2', '0.01', '1', '99', '1', '1000', '2018-02-01 14:06:19', '2018-02-10 12:37:39');
INSERT INTO `video_set_tb` VALUES ('1007', '全职高手', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', 'ss', '作为嘉世战队队长的叶秋被俱乐部逼得交出一叶之秋账号卡，叶秋不愿做陪练，提出解约。俱乐部以叶秋劳苦功高为由，逼他退役来交换赔付违约费。叶秋同意，随后离开了嘉世。苏沐橙追上他表示不舍，叶秋告诉苏沐橙，他会“休息一年，然后回来”。在游荡中，叶修进入兴欣网络会所，因帮陈果打败了连胜陈果的敌手，', '1', '1', '0.00', '1', '83', '1', '1001', '2018-02-01 14:15:36', '2018-02-08 18:47:45');
INSERT INTO `video_set_tb` VALUES ('1008', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', 'dd', '萧炎，主人公，萧家历史上空前绝后的斗气修炼天才。4岁就开始修炼斗之气，10岁拥有了九段斗之气，11岁突破十段斗之气，一跃成为家族百年来最年轻的斗者。然而在12岁那年，他却“丧失”了修炼能力，只拥有三段斗之气。整整三年时间，家族冷遇，旁人轻视，被未婚妻退婚……种种打击接踵而至。 就在他即将绝望的时候，', '0', '1', '0.00', '1', '41', '1', '1002', '2018-02-01 14:18:06', '2018-02-08 18:48:02');
INSERT INTO `video_set_tb` VALUES ('1009', '测试视频 化肥会挥发', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j5bpv24cp1qjn8hi1heb1aut4o.png', '测试作者', '测试视频 化肥会挥发', '2', '0', '0.00', '1', '2', '1', '1007', '2018-03-27 14:50:39', '2018-03-27 15:22:51');

-- ----------------------------
-- Table structure for `video_tb`
-- ----------------------------
DROP TABLE IF EXISTS `video_tb`;
CREATE TABLE `video_tb` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_address` varchar(255) DEFAULT NULL COMMENT '封面',
  `duration` varchar(255) DEFAULT NULL COMMENT '时长',
  `size` varchar(255) DEFAULT NULL COMMENT '容量，单位MB',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `play_number` int(11) DEFAULT '0' COMMENT '播放次数',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态0下架,默认1上架',
  `video_set_id` int(11) DEFAULT NULL COMMENT '视频集id,外键',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`video_id`),
  KEY `INDEX_VIDEOSETID` (`video_set_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='视频表';

-- ----------------------------
-- Records of video_tb
-- ----------------------------
INSERT INTO `video_tb` VALUES ('2', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '39', '1', '1005', '2018-01-30 14:01:43', '2018-02-07 10:21:59');
INSERT INTO `video_tb` VALUES ('3', 'cesh3', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '2', '1', '1005', '2018-01-30 14:06:43', '2018-02-07 10:21:50');
INSERT INTO `video_tb` VALUES ('4', 'ces4', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '1', '1', '1005', '2018-01-30 14:12:18', '2018-02-07 10:21:24');
INSERT INTO `video_tb` VALUES ('5', 'cs5', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '3', '1', '1005', '2018-01-30 14:18:24', '2018-02-07 10:21:33');
INSERT INTO `video_tb` VALUES ('6', 'cc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '7', '1', '1004', '2018-01-30 14:19:13', '2018-02-07 10:20:16');
INSERT INTO `video_tb` VALUES ('7', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '76', '1', '1004', '2018-01-30 14:19:50', '2018-02-07 10:20:25');
INSERT INTO `video_tb` VALUES ('8', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '60', '1', '1003', '2018-01-30 14:20:19', '2018-02-07 10:20:02');
INSERT INTO `video_tb` VALUES ('9', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '15', '1', '1002', '2018-01-30 14:20:52', '2018-02-07 10:20:37');
INSERT INTO `video_tb` VALUES ('10', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q5on0t5gbq5a2e11eh18eo1i.mp4', '134', '1', '1001', '2018-01-30 14:21:37', '2018-02-07 10:20:54');
INSERT INTO `video_tb` VALUES ('11', 'cccccd', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '60', '1', '1000', '2018-01-30 14:23:05', '2018-02-07 10:21:07');
INSERT INTO `video_tb` VALUES ('12', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '99', '1', '1006', '2018-02-01 14:10:54', '2018-02-07 10:22:46');
INSERT INTO `video_tb` VALUES ('13', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '83', '1', '1007', '2018-02-01 14:17:17', '2018-02-07 10:22:30');
INSERT INTO `video_tb` VALUES ('14', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '41', '1', '1008', '2018-02-01 14:19:07', '2018-02-07 10:22:16');
INSERT INTO `video_tb` VALUES ('15', '测试', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3j6fm3ae1pd21efcf8u1pvq2f.jpg', '00:00:12', '1.54', 'http://p2bhwwngu.bkt.clouddn.com/o_1c9j3qsgm10gu7pe56v66t1ak32k.mp4', '2', '1', '1009', '2018-03-27 14:56:24', '2018-03-27 14:57:23');

-- ----------------------------
-- Table structure for `vip_growth_record_tb`
-- ----------------------------
DROP TABLE IF EXISTS `vip_growth_record_tb`;
CREATE TABLE `vip_growth_record_tb` (
  `vip_growth_record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'vip成长记录id',
  `name` varchar(255) DEFAULT NULL COMMENT '等级名',
  `level` tinyint(4) DEFAULT '0' COMMENT '等级,默认是0，数字越大，等级越高',
  `price` decimal(11,2) DEFAULT '0.00' COMMENT '金额',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  PRIMARY KEY (`vip_growth_record_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_LEVEL` (`level`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8 COMMENT='vip成长记录表';

-- ----------------------------
-- Records of vip_growth_record_tb
-- ----------------------------
INSERT INTO `vip_growth_record_tb` VALUES ('1000', '普通vip', '1', '365.00', '2018-02-05 17:09:20', '1010');
INSERT INTO `vip_growth_record_tb` VALUES ('1001', '普通vip', '1', '365.00', '2018-02-06 15:35:18', '1009');
INSERT INTO `vip_growth_record_tb` VALUES ('1002', '普通vip', '1', '365.00', '2018-02-10 13:59:05', '1014');
INSERT INTO `vip_growth_record_tb` VALUES ('1003', '钻石vip', '2', '4500.00', '2018-02-24 09:23:14', '1009');
INSERT INTO `vip_growth_record_tb` VALUES ('1004', '联合发起人', '3', '25000.00', '2018-02-24 18:00:04', '1009');
INSERT INTO `vip_growth_record_tb` VALUES ('1005', '钻石vip', '2', '4500.00', '2018-03-06 11:48:41', '1010');
INSERT INTO `vip_growth_record_tb` VALUES ('1006', '联合发起人', '3', '25000.00', '2018-03-13 16:47:59', '1010');

-- ----------------------------
-- Table structure for `vip_number_tb`
-- ----------------------------
DROP TABLE IF EXISTS `vip_number_tb`;
CREATE TABLE `vip_number_tb` (
  `vip_number_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'vip购买次数id',
  `number` tinyint(4) DEFAULT NULL COMMENT '次数',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '购买人',
  `real_master_id` int(11) DEFAULT NULL COMMENT '真实上级id',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态，1待处理，2已处理，3已超次',
  PRIMARY KEY (`vip_number_id`),
  KEY `INDEX_NUMBER` (`number`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='vip购买次数表';

-- ----------------------------
-- Records of vip_number_tb
-- ----------------------------

-- ----------------------------
-- Table structure for `vip_tb`
-- ----------------------------
DROP TABLE IF EXISTS `vip_tb`;
CREATE TABLE `vip_tb` (
  `vip_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'vip表id',
  `name` varchar(255) DEFAULT NULL COMMENT '等级名',
  `level` tinyint(4) DEFAULT '0' COMMENT '等级,默认是0，数字越大，等级越高',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，0到期,1没到期',
  `expire_date` datetime DEFAULT NULL COMMENT '到期时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  PRIMARY KEY (`vip_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_LEVEL` (`level`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8 COMMENT='vip表';

-- ----------------------------
-- Records of vip_tb
-- ----------------------------
INSERT INTO `vip_tb` VALUES ('1000', '联合发起人', '3', '1', '2019-02-24 18:00:04', '2018-02-06 15:35:18', '2018-02-24 18:00:04', '1009');
INSERT INTO `vip_tb` VALUES ('1001', '联合发起人', '3', '1', '2019-03-13 16:47:59', '2018-02-05 17:09:20', '2018-03-13 16:47:59', '1010');
INSERT INTO `vip_tb` VALUES ('1002', '创始股东', '5', '1', '2030-01-01 13:16:18', '2018-02-05 13:16:35', '2018-02-05 13:16:37', '1000');
INSERT INTO `vip_tb` VALUES ('1003', '学徒', '0', '0', '2018-02-06 16:39:35', '2018-02-06 16:39:35', '2018-02-06 16:39:35', '1011');
INSERT INTO `vip_tb` VALUES ('1004', '学徒', '0', '0', '2018-02-07 01:15:45', '2018-02-07 01:15:45', '2018-02-07 01:15:45', '1012');
INSERT INTO `vip_tb` VALUES ('1005', '学徒', '0', '0', '2018-02-10 13:13:19', '2018-02-10 13:13:19', '2018-02-10 13:13:19', '1013');
INSERT INTO `vip_tb` VALUES ('1006', '普通vip', '1', '1', '2019-02-10 13:59:05', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1014');
INSERT INTO `vip_tb` VALUES ('1007', '学徒', '0', '0', '2018-02-22 16:43:03', '2018-02-22 16:43:03', '2018-02-22 16:43:03', '1015');
INSERT INTO `vip_tb` VALUES ('1008', '学徒', '0', '0', '2018-02-23 14:07:13', '2018-02-23 14:07:13', '2018-02-23 14:07:13', '1016');
INSERT INTO `vip_tb` VALUES ('1009', '学徒', '0', '0', '2018-02-28 17:54:43', '2018-02-28 17:54:43', '2018-02-28 17:54:43', '1017');
INSERT INTO `vip_tb` VALUES ('1010', '学徒', '0', '0', '2018-03-01 13:23:55', '2018-03-01 13:23:55', '2018-03-01 13:23:55', '1018');
INSERT INTO `vip_tb` VALUES ('1011', '学徒', '0', '0', '2018-03-13 09:49:12', '2018-03-13 09:49:12', '2018-03-13 09:49:12', '1019');
INSERT INTO `vip_tb` VALUES ('1012', '学徒', '0', '0', '2018-03-13 16:20:27', '2018-03-13 16:20:27', '2018-03-13 16:20:27', '1020');
INSERT INTO `vip_tb` VALUES ('1013', '学徒', '0', '0', '2018-03-27 14:27:41', '2018-03-27 14:27:41', '2018-03-27 14:27:41', '1021');

-- ----------------------------
-- Table structure for `withdrawals_tb`
-- ----------------------------
DROP TABLE IF EXISTS `withdrawals_tb`;
CREATE TABLE `withdrawals_tb` (
  `withdrawals_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '提现信息id',
  `realname` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `accountname` varchar(255) DEFAULT NULL COMMENT '账号名称',
  `finance_record_id` int(11) DEFAULT NULL COMMENT '财务记录id外键',
  PRIMARY KEY (`withdrawals_id`),
  KEY `INDEX_FINANCERECORDID` (`finance_record_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='提现信息表';

-- ----------------------------
-- Records of withdrawals_tb
-- ----------------------------
