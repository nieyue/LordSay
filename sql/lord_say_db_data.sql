/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : lord_say_db

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-11-23 17:02:46
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
INSERT INTO `account_level_tb` VALUES ('1001', '学徒', '0', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5ia0rd21952ll8m74o9h9hr1t.png', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '学徒，浏览，互动，购买产品，升级vip', '2018-02-05 14:21:36');
INSERT INTO `account_level_tb` VALUES ('1002', '普通vip', '1', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '18.25', '146.00', '91.25', '109.50', '0', '0.00', '365.00', '普通vip，团购权限，推广权益，免费看所有视频（不含售卖视频）', '2018-02-05 13:55:13');
INSERT INTO `account_level_tb` VALUES ('1003', '钻石vip', '2', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8j4o210nm1ip459l127t1gt219.png', '4500.00', '225.00', '1800.00', '1125.00', '1350.00', '39', '115.00', '14235.00', '钻石vip,团购权限，推广权益，免费看所有视频（不含售卖视频），分成', '2018-02-05 13:56:36');
INSERT INTO `account_level_tb` VALUES ('1004', '联合发起人', '3', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8jh02bes1eje8d6nm91ei71e.png', '25000.00', '1250.00', '10000.00', '6250.00', '7500.00', '250', '100.00', '91250.00', '联合发起人，团购权限，推广权益，免费看所有视频（不含售卖视频），分成', '2018-02-05 13:56:48');
INSERT INTO `account_level_tb` VALUES ('1005', '高级合伙人', '4', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8k44510dn1sgvr1usb1gcb1j.png', '65000.00', '3250.00', '26000.00', '16250.00', '19500.00', '738', '88.00', '269370.00', '高级合伙人，团购权限，推广权益，免费看所有视频（不含售卖视频），分成，有机会与平台合作红利', '2018-02-05 13:57:09');
INSERT INTO `account_level_tb` VALUES ('1006', '创始股东', '5', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8kd03sljbdd1f5oq9311pf1o.png', '195000.00', '9750.00', '78000.00', '48750.00', '58500.00', '2475', '80.00', '903375.00', '创始股东，团购权限，推广权益，免费看所有视频（不含售卖视频），分成，与平台合作红利。', '2018-02-05 13:57:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=1034 DEFAULT CHARSET=utf8 COMMENT='账户上级表';

-- ----------------------------
-- Records of account_parent_tb
-- ----------------------------
INSERT INTO `account_parent_tb` VALUES ('1001', '1009', '谢威', '17702183918', '21', '1000', '1000', '1004', '联合发起人', '2018-01-27 18:21:05', '2018-02-24 18:00:04');
INSERT INTO `account_parent_tb` VALUES ('1002', '1010', '舒靖宇', '15211547807', '1', '1000', '1000', '1004', '联合发起人', '2018-02-04 20:28:28', '2018-03-13 16:47:59');
INSERT INTO `account_parent_tb` VALUES ('1004', '1000', '聂跃', '15111336587', '12', null, null, '1006', '创始股东', '2018-02-05 13:13:47', '2018-02-05 13:13:52');
INSERT INTO `account_parent_tb` VALUES ('1005', '1011', null, '15111336586', '0', '1000', '1000', '1001', '学徒', '2018-02-06 16:39:35', '2018-02-06 16:39:35');
INSERT INTO `account_parent_tb` VALUES ('1006', '1012', '啦啦啦', '15674830902', '0', '1009', '1009', '1001', '学徒', '2018-03-12 10:30:47', '2018-03-12 10:30:47');
INSERT INTO `account_parent_tb` VALUES ('1007', '1014', '普通vip', '18774814879', '0', '1010', '1000', '1002', '学徒', '2018-02-10 13:23:05', '2018-02-10 13:59:05');
INSERT INTO `account_parent_tb` VALUES ('1008', '1013', '舒靖宇', '17388964490', '0', '1000', '1000', '1001', '学徒', '2018-02-24 13:07:55', '2018-02-24 13:07:55');
INSERT INTO `account_parent_tb` VALUES ('1009', '1015', null, '17767094985', '0', '1000', '1000', '1001', '学徒', '2018-02-22 16:43:03', '2018-02-22 16:43:03');
INSERT INTO `account_parent_tb` VALUES ('1010', '1016', '测试', '15068747539', '9', '1000', '1000', '1001', '学徒', '2018-03-05 15:57:08', '2018-03-05 15:57:08');
INSERT INTO `account_parent_tb` VALUES ('1011', '1017', '测试', '18606713507', '0', '1016', '1016', '1001', '学徒', '2018-04-17 16:43:04', '2018-04-17 16:43:04');
INSERT INTO `account_parent_tb` VALUES ('1012', '1018', null, '13958060769zhuxiao', '0', '1016', '1016', '1001', '学徒', '2018-03-01 13:23:55', '2018-03-01 13:23:55');
INSERT INTO `account_parent_tb` VALUES ('1013', '1019', '王小明', '18300700235', '2', '1009', '1009', '1002', '普通vip', '2018-03-13 09:51:10', '2018-06-01 11:05:13');
INSERT INTO `account_parent_tb` VALUES ('1014', '1020', null, '15168318364', '0', '1016', '1016', '1001', '学徒', '2018-03-13 16:20:27', '2018-03-13 16:20:27');
INSERT INTO `account_parent_tb` VALUES ('1015', '1021', null, '13588328250', '0', '1016', '1016', '1001', '学徒', '2018-03-27 14:27:41', '2018-03-27 14:27:41');
INSERT INTO `account_parent_tb` VALUES ('1016', '1022', null, '18229961030', '0', '1000', '1000', '1001', '学徒', '2018-04-01 23:34:49', '2018-04-01 23:34:49');
INSERT INTO `account_parent_tb` VALUES ('1017', '1023', null, '18357795862', '0', '1000', '1000', '1001', '学徒', '2018-04-02 16:53:56', '2018-04-02 16:53:56');
INSERT INTO `account_parent_tb` VALUES ('1018', '1024', null, '17682317316', '0', '1016', '1016', '1001', '学徒', '2018-04-03 11:01:55', '2018-04-03 11:01:55');
INSERT INTO `account_parent_tb` VALUES ('1019', '1025', null, '17764562587', '0', '1016', '1016', '1001', '学徒', '2018-04-08 10:18:52', '2018-04-08 10:18:52');
INSERT INTO `account_parent_tb` VALUES ('1020', '1026', null, '15958134694', '0', '1016', '1016', '1001', '学徒', '2018-04-17 17:25:05', '2018-04-17 17:25:05');
INSERT INTO `account_parent_tb` VALUES ('1021', '1027', null, '17308496139', '0', '1000', '1000', '1001', '学徒', '2018-05-03 22:18:28', '2018-05-03 22:18:28');
INSERT INTO `account_parent_tb` VALUES ('1022', '1028', null, '18367175373', '0', '1019', '1019', '1001', '学徒', '2018-05-29 18:46:14', '2018-05-29 18:46:14');
INSERT INTO `account_parent_tb` VALUES ('1023', '1029', null, '17130042356', '0', '1000', '1000', '1001', '学徒', '2018-05-30 16:06:28', '2018-05-30 16:06:28');
INSERT INTO `account_parent_tb` VALUES ('1024', '1030', null, '17788563571', '0', '1000', '1000', '1001', '学徒', '2018-05-30 16:10:51', '2018-05-30 16:10:51');
INSERT INTO `account_parent_tb` VALUES ('1025', '1038', '普通vip', '18367175373', '2', '1000', '1000', '1002', '学徒', '2018-05-31 11:39:30', '2018-05-31 17:11:40');
INSERT INTO `account_parent_tb` VALUES ('1026', '1039', null, '17376583517', '0', '1000', '1000', '1001', '学徒', '2018-05-31 14:20:08', '2018-05-31 14:20:08');
INSERT INTO `account_parent_tb` VALUES ('1027', '1040', null, '18300700235', '0', '1038', '1038', '1001', '学徒', '2018-06-01 14:43:35', '2018-06-01 14:43:35');
INSERT INTO `account_parent_tb` VALUES ('1028', '1041', '刘哥', '18300700235', '0', '1038', '1009', '1002', '普通vip', '2018-06-08 13:55:59', '2018-07-20 15:38:46');
INSERT INTO `account_parent_tb` VALUES ('1029', '1042', null, '13033604013', '0', '1009', '1009', '1002', '普通vip', '2018-06-01 16:35:05', '2018-06-01 17:46:32');
INSERT INTO `account_parent_tb` VALUES ('1030', '1043', '这是测试', '17376568179', '0', '1016', '1016', '1001', '学徒', '2018-06-04 13:42:22', '2018-06-04 13:42:22');
INSERT INTO `account_parent_tb` VALUES ('1031', '1044', '杰杰杰', '13958060769zhuxiao', '0', '1000', '1000', '1001', '学徒', '2018-06-13 14:16:10', '2018-06-13 14:16:10');
INSERT INTO `account_parent_tb` VALUES ('1032', '1052', null, '18137137010', '0', '1009', '1009', '1002', '普通vip', '2018-06-26 17:34:51', '2018-06-27 10:18:52');
INSERT INTO `account_parent_tb` VALUES ('1033', '1055', '111', '13958060769', '0', '1016', '1016', '1001', '学徒', '2018-11-23 10:56:03', '2018-11-23 10:56:03');

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
) ENGINE=InnoDB AUTO_INCREMENT=1056 DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Records of account_tb
-- ----------------------------
INSERT INTO `account_tb` VALUES ('1000', '路路通', '15111336587', '11874bb6149dd45428da628c9766b252', null, '聂跃2', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '1', '14', null, '湖南省', '长沙市', null, '278076304@qq.com', null, null, null, null, '123456', '考虑', '2018-01-19 15:46:08', '2018-11-23 16:40:53', '0', null, '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1009', '她问我看实物图天', '17702183918', '11874bb6149dd45428da628c9766b252', '', '路路通', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '1', '25', '', '湖南省', '湘西土家族苗族自治州', '谢威', '', '2', '136494946469476', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180204154022', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180204154038', '', '', '2018-01-27 18:21:05', '2018-07-30 17:19:22', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1010', '-/:;()', '15211547807', '11874bb6149dd45428da628c9766b252', null, '12345', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520863161.png', '2', '25', null, '湖北省', '武汉市', '舒靖宇', null, '2', '123456', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1517747286.png', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1517747301.png', '147852369', 'gmjgdpg123', '2018-01-27 20:23:22', '2018-05-15 13:02:12', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1011', 'safsdafdsf', '15111336586', '11874bb6149dd45428da628c9766b252', '15111336586', '搞事情', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5l472v92qo1849k1h1jec1d6g7v.png', '1', '10', '中国', '湖南省', '长沙市', 'sfdsf', '232@gfdgf.bg', '2', '123123123213123', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5l495bc2eqsgf1l6g1l2e1b1d84.png', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5l49rul2nc1gtb1m1m1k861peo89.png', 'dsf', 'sdfsdf', '2018-02-06 16:39:35', '2018-06-28 12:36:40', '0', '1000', '1002', '普通管理员');
INSERT INTO `account_tb` VALUES ('1012', '签名？不存在的。', '15674830902', '11874bb6149dd45428da628c9766b252', '', '太上皇', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180507120009', '1', '2', '', '天津市', '安徽省-安庆市', '啦啦啦', '', '1', '125466464664647', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180312102954', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180312103028', '', '', '2018-02-07 01:15:45', '2018-11-22 15:57:32', '0', '1009', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1013', '1111', '17388964490', '11874bb6149dd45428da628c9766b252', '17388964490', null, null, null, null, null, null, null, '舒靖宇', null, '1', '431224199204051234', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1013_1519448824.png', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1013_1519448838.png', null, null, '2018-02-10 13:13:19', '2018-07-31 17:47:52', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1014', '', '18774814879', '11874bb6149dd45428da628c9766b252', '18774814879', 'vvcc', '', '0', null, '', '', '', '小胖子', '', '2', '9876543214', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1014_1518240172.png', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1014_1518240182.png', '有点', '154554', '2018-02-10 13:19:45', '2018-10-25 16:00:17', '0', '1010', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1015', '哈哈法国红酒', '17767094985', '96fa69e75d86e7acdded21448de3a7a3', '17767094985', 'LOKCK', '', '1', '2', '', '', '吉林省-松原市', '', '', '0', '', '', '', '', '', '2018-02-22 16:43:03', '2018-04-18 10:59:55', '0', '1000', '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1016', '测试', '15068747539', 'aac04a65e7b010b21835bae0396acae0', '15068747539', '123', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20181123104446', '1', '23', '', '内蒙古自治区', '安徽省-安庆市', '测试', '', '2', '1234564899887789663111478889877786668887788', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1520236614.png', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1520236622.png', 'yymiancheng', '', '2018-02-23 14:07:13', '2018-11-23 16:44:06', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1017', '测试123', '18606713507', '931c181d9fe424a87113217ba3e42b93', '18606713507', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180417154011', '1', '101', null, null, '浙江省-杭州市', '测试', null, '1', '36235688979643554', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180417164301', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180417164306', null, null, '2018-02-28 17:54:43', '2018-08-16 13:45:00', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1018', null, '13958060769zhuxiao', '11874bb6149dd45428da628c9766b252', '13958060769zhuxiao', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180313162550', null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-03-01 13:23:55', '2018-03-27 15:23:15', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1019', '吉他墙上挂', '18300000000', '11874bb6149dd45428da628c9766b252', '18300700235', '小草帽', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180531174602', null, null, '', '', '', '王小明', '', '2', '410111111111111111', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180313095053', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180313095106', '', '', '2018-03-13 09:49:12', '2018-06-01 11:26:11', '0', '1009', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1020', null, '15168318364', '51781fefc1cb8b7bbb0a890e1b6a79cf', '15168318364', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-03-13 16:20:27', '2018-03-13 16:20:27', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1021', '123456789', '13588328250', '0522a436cfd6d9fb1fb1b8d84b3e5804', '13588328250', '测试版02', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1021_1523946788.png', '1', '10', null, '浙江省', '杭州市', null, null, '0', null, null, null, null, null, '2018-03-27 14:27:41', '2018-04-17 14:30:50', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1022', null, '18229961030', '11874bb6149dd45428da628c9766b252', '18229961030', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-04-01 23:34:49', '2018-04-01 23:34:49', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1023', null, '18357795862', '57004c50da8c04b2d271524acd087925', '18357795862', '偌瑶', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180403091426', '2', '22', null, null, '浙江省-杭州市', null, null, '0', null, null, null, null, null, '2018-04-02 16:53:56', '2018-04-25 15:46:05', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1024', null, '17682317316', '11874bb6149dd45428da628c9766b252', '17682317316', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-04-03 11:01:55', '2018-04-17 17:44:41', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1025', null, '17764562587', '931c181d9fe424a87113217ba3e42b93', '17764562587', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1025_1523154005.png', null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-04-08 10:18:52', '2018-04-08 17:54:23', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1026', null, '15958134694', '5d2ca53ee160707674627f2705053e53', '15958134694', '陌小研', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1026_1523957127.png', '2', '19', null, null, null, null, null, '0', null, null, null, null, null, '2018-04-17 17:25:05', '2018-07-04 15:54:01', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1027', null, '17308496139', '11874bb6149dd45428da628c9766b252', '17308496139', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-05-03 22:18:28', '2018-05-06 13:44:52', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1029', null, '17130042356', '11874bb6149dd45428da628c9766b252', '17130042356', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-05-30 16:06:28', '2018-05-30 16:08:11', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1030', null, '17788563571', '11874bb6149dd45428da628c9766b252', '17788563571', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-05-30 16:10:51', '2018-05-30 16:12:39', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1031', null, '13900000000', '9dc35d6c5a2b8e7c3eefc9d8b586daa8', null, null, '', null, null, null, null, null, null, null, '0', null, '', '', null, null, '2018-05-30 17:06:42', '2018-05-30 17:06:42', '0', null, null, '普通管理员');
INSERT INTO `account_tb` VALUES ('1032', null, '13800000000', '11874bb6149dd45428da628c9766b252', null, null, null, '0', '18', '中国', null, null, null, null, '0', null, null, null, null, null, '2018-05-30 17:07:30', '2018-05-30 17:07:30', '0', null, '1002', '普通管理员');
INSERT INTO `account_tb` VALUES ('1033', null, '13700000000', 'f44f3dd2f74ea4667947fed6b979200d', null, null, '', null, null, null, null, null, null, null, '0', null, '', '', null, null, '2018-05-30 17:08:05', '2018-05-30 17:08:05', '0', null, null, '普通管理员');
INSERT INTO `account_tb` VALUES ('1034', null, '13600000000', 'f44f3dd2f74ea4667947fed6b979200d', null, null, '', null, null, null, null, null, null, null, '0', null, '', '', null, null, '2018-05-30 17:08:33', '2018-05-30 17:08:33', '0', null, null, '普通管理员');
INSERT INTO `account_tb` VALUES ('1035', null, '13500000000', '11874bb6149dd45428da628c9766b252', null, null, '', null, null, null, null, null, null, null, '0', null, '', '', null, null, '2018-05-30 17:10:54', '2018-05-30 17:10:54', '0', null, null, '普通管理员');
INSERT INTO `account_tb` VALUES ('1036', null, '13400000000', '11874bb6149dd45428da628c9766b252', null, null, null, '0', '18', '中国', null, null, null, null, '0', null, null, null, null, null, '2018-05-30 17:11:46', '2018-05-30 17:11:46', '0', null, '1002', '普通管理员');
INSERT INTO `account_tb` VALUES ('1037', null, '13300000000', '11874bb6149dd45428da628c9766b252', null, null, '', null, null, null, null, null, null, null, '0', null, '', '', null, null, '2018-05-30 17:12:15', '2018-05-30 17:12:15', '0', null, null, '普通管理员');
INSERT INTO `account_tb` VALUES ('1038', '就是这个意思。', '18367175373', '11874bb6149dd45428da628c9766b252', '18367175373', '强壮的土豆', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180611102033', '1', null, '', '', '安徽省-安庆市', '刘海歌他哥', '', '2', '666666', '<null>', '<null>', '', '', '2018-05-30 18:31:26', '2018-07-31 16:53:48', '0', '1019', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1039', null, '17376583517', '11874bb6149dd45428da628c9766b252', '17376583517', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-05-31 14:20:08', '2018-05-31 14:20:08', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1040', null, '18300000001', '11874bb6149dd45428da628c9766b252', '18300700235', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-06-01 14:43:35', '2018-06-01 14:47:16', '0', '1038', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1041', '这是什么鬼啊', '18300700235', '11874bb6149dd45428da628c9766b252', '18300700235', '小财猫', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1532076143.png', null, null, '', '内蒙古自治区', '呼和浩特市', '刘哥', '', '2', '410100199900000000', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437283.png', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437351.png', '', '', '2018-06-01 16:14:28', '2018-11-23 11:09:28', '0', '1009', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1042', '', '13033604013', '11874bb6149dd45428da628c9766b252', '13033604013', '小草帽', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1042_1533024218.png', null, null, '', '', '', '没小钱', '', '2', '', '', '', '', '', '2018-06-01 16:35:05', '2018-07-31 18:12:18', '0', '1009', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1043', '没有签名', '17376568179', '931c181d9fe424a87113217ba3e42b93', '17376568179', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1043_1528090818.png', '2', '23', null, '浙江省', '杭州市', '这是测试', null, '1', '123456789123456789', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1043_1528090930.png', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1043_1528090937.png', null, null, '2018-06-04 13:39:47', '2018-06-04 13:39:47', '0', '1016', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1044', '', '13958060769zhuxiao', '11874bb6149dd45428da628c9766b252', '13958060769', '', '', null, null, '', '', '', '杰杰杰', '', '2', '330011445566778899', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180613141606', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180613141610', '', '', '2018-06-13 14:09:14', '2018-07-31 17:08:57', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1049', '', '12345678912', '11874bb6149dd45428da628c9766b252', '', '和规范化', '', null, null, '', '', '', '', '', '0', '', '', '', '', '', '2018-06-25 09:20:53', '2018-06-26 23:14:28', '0', null, '1002', '普通管理员');
INSERT INTO `account_tb` VALUES ('1051', null, '18300700123', '11874bb6149dd45428da628c9766b252', null, '强壮的土豆', null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-06-25 09:35:22', '2018-07-31 14:22:10', '0', null, '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1052', '', '18137137010', 'f46188f4361b4b8426e20f12760a4adf', '18137137010', '123', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1052_1530005702.png', null, null, '', '', '', '梁威', '', '2', '', '', '', '', '', '2018-06-26 17:34:51', '2018-07-31 18:04:51', '0', '1009', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1053', null, '13216180235', '11874bb6149dd45428da628c9766b252', null, '土豆地瓜', null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-07-04 10:54:56', '2018-09-07 17:47:35', '0', null, '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1054', '', '15068747523', '11874bb6149dd45428da628c9766b252', '', 'admin', '', null, null, '', '', '', '', '', '0', '', '', '', '', '', '2018-07-04 13:54:55', '2018-07-04 13:56:05', '0', null, '1002', '普通管理员');
INSERT INTO `account_tb` VALUES ('1055', '', '13958060769', 'e10adc3949ba59abbe56e057f20f883e', '13958060769', '', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20181123104555', null, null, '', '', '', '111', '', '2', '111222', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20181123105602', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20181123105608', '', '', '2018-11-23 10:35:15', '2018-11-23 13:13:48', '0', '1016', '1001', '用户');

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
INSERT INTO `app_version_tb` VALUES ('1006', '0', '1.0', '0', 'sdf', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5kj83gl1b7kviik4u19mvlish.png', '2018-02-09 14:07:41', '0');
INSERT INTO `app_version_tb` VALUES ('1007', '0', '1.0', '0', 'sdf', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5kj8tnt5pdf453l8oa61daum.png', '2018-02-09 14:07:35', '0');

-- ----------------------------
-- Table structure for `article_cate_tb`
-- ----------------------------
DROP TABLE IF EXISTS `article_cate_tb`;
CREATE TABLE `article_cate_tb` (
  `article_cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章类型id',
  `name` varchar(255) DEFAULT NULL COMMENT '文章类型名称',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`article_cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8 COMMENT='文章类型表';

-- ----------------------------
-- Records of article_cate_tb
-- ----------------------------
INSERT INTO `article_cate_tb` VALUES ('1000', '课程', '2018-07-20 15:01:48');
INSERT INTO `article_cate_tb` VALUES ('1002', '微专业', '2018-07-20 15:02:31');
INSERT INTO `article_cate_tb` VALUES ('1006', '个性推荐', '2018-07-20 15:01:17');

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

-- ----------------------------
-- Records of article_comment_tb
-- ----------------------------
INSERT INTO `article_comment_tb` VALUES ('3', '真有意思啊', '1', '2018-01-29 16:02:37', '4', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('4', '还能好好玩耍不\n', '4', '2018-01-29 16:03:07', '4', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('5', '撒旦飞洒地方', '0', '2018-01-29 16:08:18', '3', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('6', '十大法师的', '1', '2018-01-29 16:08:21', '3', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('7', '士大夫', '1', '2018-01-29 16:08:35', '2', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('8', '你以为所以我现在1', '0', '2018-02-02 00:51:47', '3', '1009', '啦啦啦啦', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('9', '聊几句V53', '0', '2018-02-02 00:54:54', '4', '1009', '啦啦啦啦', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('10', '你想让我庸人自扰之', '2', '2018-02-02 01:54:55', '2', '1009', '啦啦啦啦', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('12', 'ggvv记录', '1', '2018-02-07 00:48:20', '4', '1009', '我会注意', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('13', '呵呵', '2', '2018-02-08 16:43:14', '2', '1009', '我会注意', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('15', '我的生活就是一个劲在别人看来很大关系人的问题，我的人生就是一个', '2', '2018-02-09 21:12:30', '2', '1010', null, null);
INSERT INTO `article_comment_tb` VALUES ('16', '我的人生就是一个人和事物的人生态度，我的人生就是一个人和事物的人生态度，我的人生就是一个人和事', '2', '2018-02-09 21:23:16', '2', '1010', '123', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1517055943.png');
INSERT INTO `article_comment_tb` VALUES ('17', '破给名字呀，你的人生态度就是这样吧。我们都在一起的时候我就不去了。我', '3', '2018-02-09 21:24:03', '2', '1010', '123', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1517055943.png');
INSERT INTO `article_comment_tb` VALUES ('18', '龙', '2', '2018-02-22 16:33:02', '3', '1000', '聂跃', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('19', '啦啦啦', '2', '2018-02-22 20:13:43', '4', '1009', '哦？是吗', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('20', 'N97一些事一些情庸人自扰之XP密钥嘻嘻嘻嘻一下星期一休息嘻嘻嘻嘻在上自习一心一意一样一样噢你嘻嘻嘻', '2', '2018-02-22 20:14:09', '4', '1009', '哦？是吗', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('21', '知心', '0', '2018-02-24 10:22:35', '5', '1009', '哦？是吗', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('23', '狗狗', '5', '2018-02-24 15:40:43', '10', '1000', '聂跃', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('24', '好感动……', '2', '2018-02-24 23:48:05', '8', '1000', '聂跃', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('25', '可怕', '3', '2018-02-25 12:55:43', '9', '1000', '聂跃', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('26', '6666666', '4', '2018-02-27 21:31:15', '9', '1009', '哦？是吗', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('27', '对的。', '5', '2018-03-01 14:07:36', '10', '1009', '哦？是吗', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('28', '测试', '2', '2018-03-05 15:52:11', '9', '1009', '哦？是吗', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('29', '测试', '3', '2018-03-05 15:52:27', '9', '1009', '哦？是吗', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('30', '测试', '3', '2018-03-05 15:53:44', '5', '1009', '哦？是吗', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('31', '测试', '12', '2018-03-05 15:54:42', '10', '1016', '大白嗯哼', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1519366739.png');
INSERT INTO `article_comment_tb` VALUES ('33', '加急', '3', '2018-03-13 16:56:19', '8', '1000', '聂跃1', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('34', '回家睡觉计算机三级见识见识就说你呢实话实说都很好的还不到好的好的比较喜欢加到几点几点回家独具匠心家电家具都好都好简单机械不是的话大好河山你带回家小虎还乡吉祥混沌就觉得不是很熟还打不打还很喜欢小虎还乡回电话都很好的忽上忽下好想好好说好的好好的呢哈哈哈小虎还乡还很喜欢啥时候睡说的很好都好好的', '2', '2018-03-13 16:56:58', '8', '1000', '聂跃1', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('35', '123456', '6', '2018-03-13 17:10:53', '10', '1016', '大白嗯哼', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1520929499.png');
INSERT INTO `article_comment_tb` VALUES ('36', '转网', '0', '2018-03-15 19:20:00', '10', '1000', '聂跃1', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png');
INSERT INTO `article_comment_tb` VALUES ('40', '5卡图图他', '1', '2018-03-16 10:49:08', '10', '1012', 'LOL哦咯', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180207011738');
INSERT INTO `article_comment_tb` VALUES ('44', '测试', '1', '2018-03-26 16:46:01', '10', '1016', 'ceshi', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1520929499.png');
INSERT INTO `article_comment_tb` VALUES ('46', '计算机技术', '0', '2018-03-27 13:58:59', '6', '1000', '聂跃2', 'http://laoyeshuovideo.laoyeshuo.cnm/fitment_20180327135737');
INSERT INTO `article_comment_tb` VALUES ('47', 'gggg ', '0', '2018-03-27 14:45:07', '6', '1016', '', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1520929499.png');
INSERT INTO `article_comment_tb` VALUES ('48', 'ddfd', '1', '2018-03-27 15:22:06', '11', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('50', 'dd', '0', '2018-03-27 15:23:27', '6', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('51', 'fdd', '1', '2018-03-27 15:23:39', '6', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('52', 'dffff', '1', '2018-03-27 15:24:04', '11', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('53', 'dddd', '1', '2018-03-27 15:24:25', '6', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('54', 'zxxxd', '0', '2018-03-27 15:26:22', '7', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('55', ' just', '0', '2018-03-27 15:30:35', '8', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('56', 'quick', '0', '2018-03-27 15:34:34', '8', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('57', 'just', '0', '2018-03-27 15:35:38', '5', '1017', '未命名', '');
INSERT INTO `article_comment_tb` VALUES ('58', '啊旅途', '0', '2018-04-01 13:54:12', '9', '1009', '哦？是吗', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533');
INSERT INTO `article_comment_tb` VALUES ('59', '我了个去', '1', '2018-05-03 22:34:31', '10', '1027', '173****6139', 'null');
INSERT INTO `article_comment_tb` VALUES ('62', '测试3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333633333333333333333333331331313131313131313131313131313133131313131313131313131313313131313131313131313133131313131313131313133131346467881946466484', '0', '2018-06-13 17:47:11', '9', '1044', '139****0769', 'null');
INSERT INTO `article_comment_tb` VALUES ('63', '测试', '0', '2018-06-13 17:47:25', '9', '1044', '139****0769', 'null');
INSERT INTO `article_comment_tb` VALUES ('64', '测试1111111122242421545454548484494994946464646646464646464852234646464548454549464464461194494979764646451516464949449794643131646454243637193173179146169939341971379793913799773673917613197139739179317379197317973191731943173197397197917919719379319133194', '0', '2018-06-13 17:49:13', '9', '1044', '139****0769', 'null');
INSERT INTO `article_comment_tb` VALUES ('65', '5566', '1', '2018-06-26 17:06:59', '10', '1041', '小财猫', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437172.png');
INSERT INTO `article_comment_tb` VALUES ('67', '5555', '0', '2018-07-17 13:57:48', '6', '1052', '', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1052_1530005702.png');
INSERT INTO `article_comment_tb` VALUES ('69', '赶紧看看', '1', '2018-07-30 16:26:33', '10', '1016', '123', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180730162025');
INSERT INTO `article_comment_tb` VALUES ('70', '测试', '0', '2018-11-23 10:44:11', '15', '1016', '123', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180730162025');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of article_tb
-- ----------------------------
INSERT INTO `article_tb` VALUES ('2', '平昌冬奥会开幕式最全盘点！ 朝韩旗手共同入场，金妍儿点燃圣火', '这是韩国时隔30年后再度举办奥运会，也是其首次举办冬奥会。继1972年札幌冬奥会、1998年长野冬奥会之后，冬奥会第三次落户亚洲。', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1060042918,4007443073&fm=173&s=5786980BC21239EDDA3D9EA903007095&w=218&h=146&img.JPEG', '', '<h3 style=\"text-align: left;\">CD君</h3><h3 style=\"text-align: left;\">中国日报</h3><p style=\"text-align: left;\">为您的资讯保鲜</p><p style=\"text-align: left;\">北京时间2月9日晚19时，2018年平昌冬奥会开幕式在韩国平昌奥林匹克体育场盛大举行。</p><p style=\"text-align: left;\">这是韩国时隔30年后再度举办奥运会，也是其首次举办冬奥会。继1972年札幌冬奥会、1998年长野冬奥会之后，冬奥会第三次落户亚洲。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3848130923,2878233503&amp;fm=173&amp;s=29F2E304DB25BA4F4C5C878E0300E08F&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者吕小炜摄</p><p style=\"text-align: left;\">随着钟声响起，平昌冬奥拉开序幕，奥林匹克运动，也正式进入了东亚时间。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3216895071,2762599730&amp;fm=173&amp;s=E1649346C50ABB477CD4759E03008092&amp;w=640&amp;h=392&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者白雪飞摄</p><p style=\"text-align: left;\">开幕式文艺演出以小朋友作为线索贯穿始终。</p><div style=\"text-align: left;\"><img width=\"405px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3420389651,3085989812&amp;fm=173&amp;s=57B6866400673D2CA6BB64000300E0DA&amp;w=405&amp;h=189&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">五个孩子，象征着奥运五环，同时，他们的名字，分别代表五行：金、木、水、火、土。</p><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3210180365,2649292913&amp;fm=173&amp;s=868697415AA33F265022810E0300D0DB&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">平昌冬奥会开幕式，精彩的短片引出白虎。</p><p style=\"text-align: left;\">本届冬奥会的官方吉祥物就包括有着白老虎形象的“Soohorang”。</p><div style=\"text-align: left;\"><img width=\"199px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3783826903,2739302379&amp;fm=173&amp;s=0134E937CFA552804FCD44DE0100C0A0&amp;w=199&amp;h=287&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">据组委会介绍，老虎象征着朝鲜半岛的地理形状，尤其是白老虎被认为是神圣的守护兽。同时，白老虎的“白”色象征着冰雪体育运动。</p><p style=\"text-align: left;\">而接下来出场的这几位，中国网友纷纷表示，看着有点眼熟......</p><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3236045651,2828225351&amp;fm=173&amp;s=79A2C05D58C73B601C154FBA03007006&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3278899753,3084758734&amp;fm=173&amp;s=29C08A4E52D3187300E4888803001097&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3871616973,2868584941&amp;fm=173&amp;s=68D08A464173943D78CD459803001086&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"401px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3277266357,2652903491&amp;fm=173&amp;s=C4F3A86445140E750ED084920300C083&amp;w=401&amp;h=187&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3226382123,2626722303&amp;fm=173&amp;s=B23831890A132BE53A8604CC0300E097&amp;w=640&amp;h=408&amp;img.JPEG\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3300832316,3025198607&amp;fm=173&amp;s=4DE3AB46ED03B8D4505D8C9F0100C081&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者鞠焕宗摄</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3187533601,1984660226&amp;fm=173&amp;s=4892E81A95B44D821C70F5C3010010B2&amp;w=638&amp;h=188&amp;img.JPEG\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=1796697192,1090035462&amp;fm=173&amp;s=1094ED3313084D431A74A4DB0000C0B3&amp;w=639&amp;h=283&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">据媒体报道，平昌今晚最低温度低达零下十度。大部分运动员出场都是这样的装扮↓↓</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3186095462,2620925207&amp;fm=173&amp;s=FA82408B2E33AEC80E78BAAE0300E005&amp;w=640&amp;h=455&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">据组委会介绍，截至目前，来自92个国家和地区的2925名运动员确认参加本届冬奥会，同时有55684名工作人员、志愿者为本届冬奥会服务，规模均为冬奥历史之最。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3212569064,3318380883&amp;fm=173&amp;s=6552738C0B33BEDC46D0088C03008082&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新西兰代表团在开幕式上入场。 新华社记者鞠焕宗摄</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=2880670162,2566695324&amp;fm=173&amp;s=B6B0308920008EE862385EAE03007084&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3029739630,2619073062&amp;fm=173&amp;s=E38223AB34421CE57699A99C03009083&amp;w=640&amp;h=427&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">尼日利亚代表团在开幕式上入场。 新华社记者吕小炜摄</p><p style=\"text-align: left;\">可是这位......完全不是一个季节↓↓</p><div style=\"text-align: left;\"><img width=\"421px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3340746734,3089634572&amp;fm=173&amp;s=80F553822481195F08ECB58903004085&amp;w=421&amp;h=195&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">平昌冬奥汤加的旗手是越野滑雪运动员陶法托富阿，在里约奥运会的开幕式上，他也担任了汤加旗手，当时他赤裸上身，身着汤加传统服饰，给大家留下了非常深刻的印象。这一次，他再次展现了他强健的肌肉。</p><p style=\"text-align: left;\">千呼万唤~中国队入场啦！</p><div style=\"text-align: left;\"><img width=\"372px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3388659037,2919817021&amp;fm=173&amp;s=C8D4C20302C319552214479803007006&amp;w=372&amp;h=187&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=2135571400,1004292982&amp;fm=173&amp;s=5786980BC21239EDDA3D9EA903007095&amp;w=639&amp;h=434&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">2月9日，中国代表团旗手周洋在开幕式上入场。中国日报记者 冯永斌 摄</p><p style=\"text-align: left;\">平昌冬奥中国代表团开幕式旗手是温哥华、索契两届冬奥会三枚金牌得主 —— 中国短道速滑运动员周洋！</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3354587794,2636390417&amp;fm=173&amp;s=9EA2C003720278EC163001DA03005035&amp;w=640&amp;h=678&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">中国代表团在开幕式上入场。 新华社记者鞠焕宗摄</p><p style=\"text-align: left;\">这也是继大杨扬之后，第二次由短道速滑运动员担任开幕式旗手！</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3802530035,2914429646&amp;fm=173&amp;s=0638188BCC93F9F14E89FCCF03008036&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">中国代表团在开幕式上入场。 新华社记者鞠焕宗摄</p><p style=\"text-align: left;\">韩朝运动员代表团在朝鲜半岛旗的引导下压轴登场，本次双方选定的旗手分别是韩国雪车（有舵雪橇）运动员元润钟（音译）和朝鲜的冰球联队队员黄忠琴（音译）。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=1785124476,1268930272&amp;fm=173&amp;s=6C51EA0B40593DED02A905DB03008096&amp;w=640&amp;h=430&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">朝韩两国代表团在开幕式上举“朝鲜半岛旗”共同入场。 中国日报记者 冯永斌 摄</p><p style=\"text-align: left;\">这也是朝鲜代表团和韩国代表团第10次在国际体育赛事中共同入场。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3120847989,3041081345&amp;fm=173&amp;s=AFE9AA0B0B934DE50169E5DB030090B6&amp;w=640&amp;h=415&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">继2000年悉尼奥运会，2004年雅典奥运会以及2006年都灵冬奥会之后，韩国和朝鲜的共同组成的朝韩代表团再次携手参加奥运会的开幕式。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3838772237,2660378012&amp;fm=173&amp;s=B7E1BB094C116FEDCA0D2CD1030010B0&amp;w=640&amp;h=442&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">本届平昌冬奥，朝韩双方还联合组成了女子冰球队参赛，这是奥运会历史上的第一次。奥林匹克不能完全停止争端，但是可以在运动场上表达对和平的渴望。</p><p style=\"text-align: left;\">朝韩两国冬奥代表团在开幕式上举“朝鲜半岛旗”共同入场，再次彰显奥林匹克呼唤和平的巨大感召力。</p><p style=\"text-align: left;\">据参考消息，在开幕式现场，韩国总统文在寅身穿韩国国家队服装出席开幕式。朝鲜高级别代表团团长金永南、金正恩胞妹金与正坐在文在寅身后。落座前，文在寅主动与金与正握手。这是文在寅与来访的金与正首次会面。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3431726973,2968159559&amp;fm=173&amp;s=C8D0EA0B5C62908E7A1520DA0100C091&amp;w=640&amp;h=446&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">2月9日，朝鲜劳动党中央委员会第一副部长金与正（右三）在开幕式上。 当日，2018年平昌冬奥会开幕式在平昌奥林匹克体育场举行。新华社记者吕小炜摄</p><p style=\"text-align: left;\">孩子们共同放飞了一只和平鸽，代表着和平！天空被1218架无人机点亮，组成一个闪亮的人形，地面是5位单板滑雪者和100位双板滑雪者在奥运的赛场上疾驰而下！1218架无人机在天空组成硕大的五环！</p><div style=\"text-align: left;\"><img width=\"351px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3761076168,3169558966&amp;fm=173&amp;s=A9F8E206DBC13D6EB6DCE69F03008086&amp;w=351&amp;h=176&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"405px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2995157307,2659938657&amp;fm=173&amp;s=DFE5A9445A833B7412B7D48A0300E09F&amp;w=405&amp;h=203&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">圣火传递的最后时刻，来自朝韩女子冰球队的两名运动员一起拾级而上，将奥林匹克的圣火交给了韩国运动的象征、国民偶像——金妍儿。</p><div style=\"text-align: left;\"><img width=\"377px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2876192277,2248076147&amp;fm=173&amp;s=ACEAEA04ADE1200D6E6D888C010050C2&amp;w=377&amp;h=189&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"302px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3003303336,2758310655&amp;fm=173&amp;s=65F32A641D01217446F6E59B0300408B&amp;w=302&amp;h=159&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">奥林匹克圣火，在希腊点燃之后，经过了2018公里的接力全程，终于到达金妍儿手中，金妍儿在冰上翩翩起舞，将圣火送到主火炬台下的点燃装置上，主火炬就此点燃。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3399876452,2782627847&amp;fm=173&amp;s=2560D204E5148DDC8FF6548F0300A089&amp;w=640&amp;h=820&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者白雪飞摄</p><div style=\"text-align: left;\"><img width=\"304px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3541705125,2771657533&amp;fm=173&amp;s=017971861915B0590C490D9D0300D083&amp;w=304&amp;h=181&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3699897610,3217367235&amp;fm=173&amp;s=25543BC29A3EAEDC4EFDA81F010080C3&amp;w=640&amp;h=443&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者鞠焕宗摄</p><p style=\"text-align: left;\">比赛看点</p><p style=\"text-align: left;\">本届冬奥会中国代表团有82名运动员，参加12个项目的比赛，参加比赛的项目总数也是创下了历史新高，其中钢架雪车、雪车是历史上第一次获得参赛资格。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2293919715,1214010658&amp;fm=173&amp;s=61F4308D5C7296CA0688628C0300E097&amp;w=640&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">除了中国，还有两个队伍非常特别。</p><p style=\"text-align: left;\">一支队伍来自尼日利亚。</p><div style=\"text-align: left;\"><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3507287631,2934023721&amp;fm=173&amp;s=9A922FC14402AF535EA12E120300C0D6&amp;w=500&amp;h=315&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">尼日利亚雪车队</p><p style=\"text-align: left;\">尼日利亚姑娘塞温·阿迪贡和另外两名队友今年2月组成非洲首支雪车队出征韩国平昌冬奥会。</p><p style=\"text-align: left;\">她们平时在得克萨斯州的泥土跑道上训练，直到去年1月才在犹他州帕克城踏上冰面。据英国《星期日泰晤士报》，阿迪贡在谈到比赛经历时曾说：“那是我们的第一场比赛，女士们第一见到了冰、见到雪车、见到雪车跑道”。</p><p style=\"text-align: left;\">去年完成5场资格赛并保持世界前44的排名后，这支尼日利亚雪车队终于取得今年平昌冬奥会的参赛资格。</p><p style=\"text-align: left;\">除了雪车队伍，来自非洲摩洛哥的运动员萨米尔阿兹玛尼也会参加今年冬奥会的滑雪比赛。为备战冬奥会，他利用起伏的沙丘，做强化关节训练，还会穿着装有滚轮的滑雪板在沙漠公路上提升体能和耐力。</p><p style=\"text-align: left;\">来源：CCTV5、新华社、参考消息</p><p style=\"text-align: left;\">编辑：王瑜、侯俊杰</p>', '6', '1', '2018-01-28 16:32:04', '2018-01-28 16:32:04', '1000');
INSERT INTO `article_tb` VALUES ('3', '县城手机战的“乡土”营销：买手机送足浴盆', '中新网客户端石家庄2月23日电 题：(新春见闻)县城手机战的“乡土”营销：买手机送足浴盆', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3425483143,1906034554&fm=173&s=99F24C800E639ADE049D0114030050DA&w=218&h=146&img.JPEG', '', '<div><p>中新网客户端石家庄2月23日电 题：(新春见闻)县城手机战的“乡土”营销：买手机送足浴盆</p><p>记者 吴涛</p><p>移动互联网时代，手机是人们最亲密的“伙伴”。春节期间，记者在河北省无极县走访发现，县城的手机市场和大家的认知差异较大，有些情况甚至颠覆你的想象。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=805330091,2380710629&amp;fm=173&amp;s=99F24C800E639ADE049D0114030050DA&amp;w=500&amp;h=333&amp;img.JPEG\" data-loaded=\"0\"></div><p>县城手机专卖店，OPPO和vivo居多。中新网 吴涛 摄</p><p>用什么？</p><p>——OPPO、vivo主导，难见三星、苹果</p><p>无极县有一条主要街道，贯穿东西，主要的商场和门店都集中在这条街上，手机店也不例外。记者走访发现，这条街上有30个左右的手机专卖或通讯店，支撑起这个县城的手机市场。</p><p>通过走访不难发现，在县城，销售最好的是OPPO和vivo，难见苹果、三星身影，华为也只有近两年才开张的一家旗舰店。</p><p>这不只体现在手机专卖店数量上，还有巨大广告横幅和活灵活现的卡通人物营销——这些基本都被OPPO和vivo占领。</p><p>有意思的是，每到OPPO和vivo做营销活动时，场面颇为壮观。放置在路边的音箱都开到最大声音，舞台搭起来，歌舞跳起来。总之，大街上最热闹、音箱声音最大的店面一般就是OPPO或vivo的专卖店。</p><p>其实，这种情况不是个例，据调研机构Quest Mobile安卓终端报告显示，OPPO和vivo的三四线城市及以下用户占比较多，其中OPPO最高，达53.7%。</p><p>这或和很多人的印象存有较大差异：难道用的最多的手机不是苹果、三星吗？据调查机构IDC发布调查数据显示，2017年四季度，全球智能手机出货量达到4.035亿台。手机厂商排名三星、苹果居前二，然后依次为华为、OPPO、小米。</p><p>但在该县城，这么多的手机专卖店，只有极少部分店面有苹果和小米手机出售，基本没有三星。“小米前几年还行，现在很难卖动了；三星原来一直就没有卖。”某手机专卖店服务人员表示。</p><p>另外，除了OPPO和vivo，记者还发现，在县城，一些老年机型也活得比较“滋润”。这类手机按键和音量都很大，普遍售价200元左右。一位70多岁的老婆婆对记者表示，她好几年前就开始用这种手机了，只接打电话，很好用。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=950438241,880612904&amp;fm=173&amp;s=1E844D814C1540C8648780DF0300C0B3&amp;w=500&amp;h=375&amp;img.JPEG\" data-loaded=\"0\"></div><p>某手机专卖店展示的老年机型。中新网 吴涛 摄</p><p>为什么？</p><p>——定价策略或是关键</p><p>春节期间，记者走访时眼见一位消费者买下一款OPPO，追上去问“这么多的手机品牌，为什么选择了这款？”</p><p>“周围的人都在用，况且也没有卖其他的。”消费者答。</p><p>记者观察发现，对县城居民来说，尤其是年轻的消费者来说，关键是手机要有他们指定的功能。可以玩《王者荣耀》不？能美化照片吗？能“吃鸡”(逃生射击类游戏)吗？这些都能成为买手机的理由。</p><p>另外，定价策略或是OPPO和vivo“吃得开”的一个原因。虽然官方称线上线下一个价，但是基本所有的vivo和OPPO线下价格都比线上优惠。</p><p>一款vivo X20全面屏4GB+64GB版本，官网售价2998元。但在县城，至少两个手机专卖店给记者表示，售价2798元。真要买，价格还有商量的余地。OPPO也一样，售价不但比线上便宜，还有一些机型送足浴盆、电饭锅等礼品。</p><p>有意思的是，华为线下旗舰店卖的手机价格高于线上或和线上一致。某华为旗舰店服务员对记者透露，“我们利润薄，但他们(vivo和OPPO)利润太大了，赚的多，所以敢于优惠。但经常有上面的人暗查他们，知道他们卖便宜了还会罚款。”</p><p>售后是OPPO和vivo的另一个“杀手锏”。几乎所有的OPPO和vivo专卖店都支持线下维修，但是三星或者苹果，你维修只能邮寄到指定地址，还得自己出邮费，何时拿回手机也是一个问题。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=1888857215,706434690&amp;fm=173&amp;s=278069A50813B2D8446940840300D0C2&amp;w=500&amp;h=375&amp;img.JPEG\" data-loaded=\"0\"></div><p>某手机专卖店做活动，买就送电饭锅、足浴盆等。中新网 吴涛 摄</p><p>玩什么？</p><p>——视频类应用最吃香</p><p>和大城市相比，县城居民的手机不一样，安装的应用和大家的印象也存有较大的差异。据中国互联网络信息中心的数据显示，移动互联网快速发展迅速，截至2017年12月底，每10个手机网民中，4个人订网络外卖，3个骑共享单车。</p><p>但县城居民或大都不在这个范围内。“我知道有外卖，县城也有，但太贵了，偶尔会用。” 不止一个人对记者这样表示，“随便点顿饭三四十元，这点钱自己买菜做饭够一家子吃了。”共享单车的使用更无从谈起，压根就没有。</p><p>记者观察发现，大部分人手机上安装的是资讯类和视频类软件，爱奇艺、快手、火山小视频等安装率高，而且很多用户不止安装一个视频类软件。另外，安装美颜相机应用也较多。</p><p>“感觉这些APP够用吗？”某商场服务员接受中新网记者采访时表示，“够用，主要是用来拍照和看视频打发时间。”返回搜狐，查看更多</p></div>', '4', '1', '2018-01-28 16:37:30', '2018-01-28 16:37:30', '1001');
INSERT INTO `article_tb` VALUES ('4', '威少为了三双遭绝杀？关键时刻又一次让乔治选择变得简单', '与掘金交手，雷霆打出了本赛季最精彩的一场比赛', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=72032686,3494064946&fm=173&s=52C048A44E4E1F5306C0858B03006081&w=218&h=146&img.JPEG', 'https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_10052312347202782283%22%7D&n_type=0&p_from=1', '<div id=\"loginBanner\"><h1></h1><h3></h3><p><span style=\"font-weight: normal;\">与掘金交手，雷霆打出了本赛季最精彩的一场比赛，保罗乔治逆天表现令人感慨万分，掘金队深知乔治手感极佳，却丝毫拿他没办法，篮下得分为所欲为，三分线外兵不血刃，最后时刻飙进三分眼看就要拖进加时赛，然而戏剧性一幕发生在灯亮那一刻。<br></span><span style=\"font-weight: normal;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=700448189,3118158180&amp;fm=173&amp;s=C2C060A444578BD6004585890300B081&amp;w=640&amp;h=503&amp;img.JPEG\" data-loaded=\"0\"><br></span><span style=\"font-weight: normal;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=1482253396,4075800873&amp;fm=173&amp;s=DED8698596CB38EC6AA999CD0300F011&amp;w=640&amp;h=362&amp;img.JPEG\" data-loaded=\"0\"><br></span><span style=\"font-weight: normal;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=2089485761,2969476882&amp;fm=173&amp;s=ADD14083C28319F53180A59A03007011&amp;w=637&amp;h=539&amp;img.JPEG\" data-loaded=\"0\"><br></span><span style=\"font-weight: normal;\">保罗乔治不仅进攻无解，而且防守端同样出色，本场他硬生生跳起抢断莱尔斯，助攻威少暴扣。<br></span><span style=\"font-weight: normal;\">最后1.4秒，威少数据正好定格在20分9篮板21助攻，面对哈里斯投篮，威少从篮下扑过来，显然这一球威少太大意，不少球迷再次质疑威少是为了抢下最后一个篮板达成三双。而在约基奇看来，哈里斯投进这记绝杀是因为威少当时睡着了。约基奇的调侃也许还在为最后时刻威少凶狠犯规而耿耿于怀。<br></span><span style=\"font-weight: normal;\">从客观角度上来看，1.4秒关系到球队胜负，威少想要这记篮板也不太现实，就算哈里斯未能投进比赛时间也到了。<br></span><span style=\"font-weight: normal;\">威少最后时刻防守可谓“进退两难”，首先一方面担心哈里斯篮下空接暴扣，另一方面就是对手投三分；但无论如何从慢镜头显示来看，他防守距离哈里斯太远，威少站在篮下也许是想和格兰特两人限制对手空接。<br></span><span style=\"font-weight: normal;\">而赛后威少也表示，哈里斯这记绝杀他有触到球，但还是进了。<br></span><span style=\"font-weight: normal;\">威少今天的表现也许又一次让乔治今夏选择变得更加简单，上一场乔治0出手，威少主动承认错误，今天末节得到了全队最高的8次出手，威少几乎将所有球权交给了了保罗乔治。</span></p><p></p><p></p></div>', '6', '1', '2018-01-28 17:34:27', '2018-01-28 17:34:27', '1002');
INSERT INTO `article_tb` VALUES ('5', '2017年谁挣钱最多？京沪人均可支配收入逼近6万元', '2017年谁挣钱最多？京沪人均可支配收入逼近6万元', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3521098845,1745252136&fm=173&s=66EAB8568E1051CA4CCF65E50300E03E&w=218&h=146&img.JPEG', '', '<p>中新网客户端北京2月24日电(记者李金磊)国家统计局近日公布了31个省份2017年居民人均可支配收入。数据显示，10省份人均可支配收入超过全国水平。上海、北京2017年居民人均可支配收入逼近6万元大关，上海以58987.96元位居全国首位。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=440278906,1714656825&amp;fm=173&amp;s=66EAB8568E1051CA4CCF65E50300E03E&amp;w=500&amp;h=338&amp;img.JPEG\" data-loaded=\"0\"></div><p>人民币。 中新网记者李金磊摄</p><p>10省份人均可支配收入超全国水平</p><p>国家统计局的数据显示，2017年居民人均可支配收入25974元，比上年名义增长9.0%；扣除价格因素实际增长7.3%。</p><p>居民可支配收入，指居民可用于最终消费支出和储蓄的总和，即居民可用于自由支配的收入，既包括现金收入，也包括实物收入。按照收入的来源，可支配收入包括工资性收入、经营净收入、财产净收入和转移净收入。</p><p>中新网记者梳理发现，上海、北京、浙江、天津、江苏、广东、福建、辽宁、山东、内蒙古2017年居民人均可支配收入超过了全国平均水平。</p><div><img width=\"239px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=540324936,3845180481&amp;fm=173&amp;s=1AAE742319D149CA5A5571CA000080B1&amp;w=239&amp;h=511&amp;img.JPEG\" data-loaded=\"0\"></div><div><img width=\"238px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=78105616,3579114037&amp;fm=173&amp;s=1AAA742319D6C0CA4855F0CA000080B1&amp;w=238&amp;h=416&amp;img.JPEG\" data-loaded=\"0\"></div><p>2017年各地居民人均可支配收入。来源：国家统计局网站</p><p>京沪人均可支配收入逼近6万元大关</p><p>在31个省区市中，上海、北京、浙江2017年居民人均可支配收入位居前三名。其中，上海、北京居民人均可支配收入分别达到58987.96元、57229.83元，逼近6万元大关。</p><p>上海、北京是2017年全国仅有的居民人均可支配收入在“5万元俱乐部”的地区；浙江居民人均可支配收入达到42045.69元，属于“4万元俱乐部”的唯一成员。</p><p>收入水平高，消费水平也高。国家统计局数据显示，上海2017年居民人均消费支出为39791.85元，北京为37425.34元，位居全国前两位。</p><div><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3849965064,3504479757&amp;fm=173&amp;s=13A042A70812A2CA4EA9913303006041&amp;w=500&amp;h=375&amp;img.JPEG\" data-loaded=\"0\"></div><p>居民在超市里购物。 中新网记者李金磊摄</p><p>多地居民收入增速跑赢GDP增速</p><p>从全国来看，2017年居民收入增长快于经济增长。数据显示，2017年全国居民人均可支配收入比上年实际增长7.3%，实际增速比GDP和人均GDP增长分别快0.4和1.0个百分点。</p><p>在地方层面，多地2017年居民收入增速跑赢了当地的GDP增速。如，北京2017年居民人均可支配收入实际增长6.9%，高于同期GDP增速0.2个百分点。江苏2017年居民人均可支配收入实际增长7.4%，高出GDP增速0.2个百分点。</p><p>中国劳动学会副会长苏海南对中新网记者表示，居民收入增速跑赢GDP增速，首先是因为经济稳定增长，企业效益好转，居民收入有了增长的基础。同时，努力让居民收入增长跟经济增长保持同步，一系列居民增收、深化收入分配制度改革政策也起到了积极的推动作用。(完)</p>', '3', '1', '2018-02-24 09:28:05', '2018-02-24 09:28:05', '1001');
INSERT INTO `article_tb` VALUES ('6', '宪法宣誓誓词将从70字修改为75字 改了啥？', '宪法宣誓制度将完善！70字誓词将改为75字，改了啥？', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=169260962,1081020469&fm=173&s=4E3003C0DE930BC4669964B40300B012&w=218&h=146&img.JPEG', '', '<p>23日召开的十二届全国人大常委会第三十三次会议，拟对宪法宣誓制度相关规定作出适当修改，明确监察委员会组成人员依法产生后应当进行宪法宣誓、宣誓仪式应当奏唱中华人民共和国国歌。</p><p>宪法宣誓誓词中有关奋斗目标的表述也将修改为“为建设富强民主文明和谐美丽的社会主义现代化强国努力奋斗！”</p><div><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=1844075206,1555696544&amp;fm=173&amp;s=4E3003C0DE930BC4669964B40300B012&amp;w=639&amp;h=425&amp;img.JPEG\" data-loaded=\"0\"></div><p>2015年7月1日，十二届全国人大常委会第十五次会议通过了《全国人民代表大会常务委员会关于实行宪法宣誓制度的决定》，以立法方式确立了我国宪法宣誓制度。</p><p>此次修改旨在贯彻落实党的十九大和十九届二中全会精神，适应深化国家监察体制改革的需要，完善宪法宣誓制度，进一步弘扬宪法精神、彰显宪法权威。</p><p>全国人大常委会法工委副主任张勇受委员长会议委托作相关修订草案说明时说，党的十九大确立了习近平新时代中国特色社会主义思想的历史地位，确定了我国发展新的奋斗目标，并对深化国家监察体制改革、制定国家监察法提出了新要求。</p><p>党的十九届二中全会通过了《中共中央关于修改宪法部分内容的建议》，提出把党的十九大确定的重大理论观点和重大方针政策载入国家根本法，体现党和国家事业发展的新成就新经验新要求。</p><p>张勇说，在全党全国学习贯彻党的十九大和十九届二中全会精神过程中，一些地方、部门和同志提出，应当根据党的十九大精神和十九届二中全会宪法修改精神，对2015年决定中的宣誓誓词作出适当修改，进一步完善我国宪法宣誓制度。</p><p>此外，随着各地监察委员会陆续成立，由地方各级人大及其常委会选举或者任命的监察委员会主任、副主任、委员，在就职时普遍进行了宪法宣誓。</p><p>许多地方建议，在国家法律层面作出明确规定，监察委员会组成人员依法产生后应当进行宪法宣誓。</p><p>“总的看，根据党的十九大和十九届二中全会精神，适应深化国家监察体制改革的需要，对2015年决定作出适当修改是必要的。”张勇说。</p><p>根据修订草案，宪法宣誓誓词将从70字修改为75字，有关条款中增加了与监察委员会有关的内容。增加的“宣誓仪式应当奏唱中华人民共和国国歌”的规定，也是为了与全国人大常委会2017年9月通过的国歌法有关规定相衔接。返回搜狐，查看更多</p>', '6', '1', '2018-02-24 09:29:15', '2018-02-24 09:29:15', '1001');
INSERT INTO `article_tb` VALUES ('7', '《渴望现场》收官 央视舞台成就平凡人音乐梦想', '大型中国故事主题音乐竞演节目《渴望现场》于大年初二迎来总决赛，9强竞演者经过激烈的比拼，终于决出了节目第一季总冠军', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3474194859,3738622053&fm=173&s=B46248A60CE284925909E1320300F013&w=218&h=146&img.JPEG', '', '<div><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=18949919,3204402929&amp;fm=173&amp;s=4941A3465FE384DC1CEDA09803005093&amp;w=600&amp;h=402&amp;img.JPEG\" data-loaded=\"0\"></div><p></p><div><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=1262955707,1078610417&amp;fm=173&amp;s=DD7404C68A70AADC46448CAA03001002&amp;w=600&amp;h=400&amp;img.JPEG\" data-loaded=\"0\"></div><p></p><p>大型中国故事主题音乐竞演节目《渴望现场》于大年初二迎来总决赛，9强竞演者经过激烈的比拼，终于决出了节目第一季总冠军。毕业于北京大学的前北大合唱团团长王上，不仅以超强的演唱实力获得人工智能“小渴”评委的高分，更以腹有诗书气自华的独特气质赢得“渴望筑梦团”制作人们的青睐，将总冠军的奖杯收入囊中。</p><p></p><p></p><p></p><p>《渴望现场》总决赛的的竞演愈发激烈，9位从108位竞演者中脱颖而出的决赛竞演者也毫无保留，奉献出自己最好的舞台表演。最终由王上凭借《等待》一举夺冠，亚军和季军分别由演绎了《青藏高原》、《没离开过》的周兴才让和娜日莎夺得。其余六位竞演者也奉献了精彩的演出：杨啟凭借天籁般的声线演绎《后会无期》；王天阳邀请回了自己的最佳搭档黄小幺，为现场观众带来了一首情意绵绵的《有个爱你的人不容易》，田恩琦为决赛重拾舞姿，一曲《超级冠军》，劲歌热舞，掀翻全场；黄诗荑一首《女儿情》装点得舞台宛如梦境；一首《我怀念的》以高度共鸣的抒情歌搭配唯美的舞台设计将观众们带到了竞演者的世界里；《渴望现场》中年龄最小的戴韩安妮在决赛中与父亲合作演绎的一曲《野子》为自己赢得了观众喝彩。</p><p></p><p></p><div><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=1166069845,591286648&amp;fm=173&amp;s=B66248A604A204B75908E13203006013&amp;w=600&amp;h=400&amp;img.JPEG\" data-loaded=\"0\"></div><p></p><p></p><p></p><p>25岁的总冠军王上毕业于北京大学，本硕连读的7年北大时光，热爱唱歌的王上一直与北大合唱团共同成长。在校期间，作为合唱团的团长，王上曾带领北大合唱团出征有“合唱界的奥林匹克”之称的世界合唱大赛，并用一首中国民族音乐一举战胜了几十个国家的对手，拿到了世界合唱大赛的冠军，让五星红旗在世界的舞台上飘扬。在总决赛中，王上特别邀请到北大合唱团成员们到场助阵，一曲深情满满的《等待》，唱出了90后新时代青年们的豪情与梦想，助力王上一举夺冠。在《渴望现场》一路走来，王上先后演唱的《我爱你中国》、《故乡的云》、《You Raise Me up》等歌曲均获得了人工智能音乐评分系统“小渴”打出的90分以上的高分，表现出色。同时，王上不仅唱功过硬，出身于文艺世家的他，一直在传统文化的浸润和熏陶下成长，在《渴望现场》的舞台上表现得如同谦谦君子一般，充满书生气。兼有学霸属性的他，不仅于在校期间创作了自己的原创作品，还是知乎“声乐问题优秀回答者”，乐于将自己在音乐方面的所学和见解分享出去。而他身上的音乐气质，也如他的性格一样兼具活泼和深沉，期待在王上的个人演唱会中再次听到他诚挚动人的歌声。</p><p></p><p>从节目开播，首次联手中科院推出人工智能音乐评分系统的《渴望现场》就以“音乐+科技”的创新形式备受各方关注，获人民日报（海外版）、工人日报等媒体点赞。用音乐讲述中国故事，用歌声唱响中国声音的108位包括“国系90后”北大90后女学生宋玺、华阴老腔第11代传人张猛等在内的新青年，在《渴望现场》向观众展示了新时代中国青年的精神风貌，单宋玺的视频播放量就突破千万，并引发人民日报等近百家媒体转发点赞，将“国系90后”的概念传遍了中国。第一季节目温情收官，但精彩仍将继续，期待第二季节目带来更多惊喜和感动。</p>', '1', '1', '2018-02-24 09:30:03', '2018-02-24 09:30:03', '1002');
INSERT INTO `article_tb` VALUES ('9', '中国游客出境被索“小费” 千万别给还要记住这招', '春节假期，不少人选择出境游。据中国旅游研究院预计，今年春节假期我国出境游人次将达到650万，规模为历史之最。', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2414048836,1326700880&fm=173&s=FE3A57CB4DF58E4568D9351F0300D0C1&w=218&h=146&img.JPEG', '', '<p>春节假期，不少人选择出境游。据中国旅游研究院预计，今年春节假期我国出境游人次将达到650万，规模为历史之最。</p><p>　　 在这些出境的游客中，有些去了墨西哥，却遭遇到了一些不愉快的经历。</p><p>　　 一些中国公民反映墨方个别移民官员在入境核查时向他们索要“小费”。其实，除了墨西哥，还有一些国家海关人员也有向中国游客索要小费的行为，还有些中国游客因此遭遇了海关人员的暴力。</p><p>　　墨西哥：部分中国公民在墨入境被索要“小费”</p><p>　　 2月15号，中国驻墨西哥大使馆网站发文指出，近期，中国公民在墨西哥城国际机场入境出境过境受阻案件有所增多。同时，一些中国公民反映墨方个别移民官员在入境核查时向他们索要“小费”。</p><div><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=4091121756,3037057569&amp;fm=173&amp;s=FE3A57CB4DF58E4568D9351F0300D0C1&amp;w=640&amp;h=326&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　 中国驻墨西哥大使馆已经就此与墨方提出交涉。墨西哥方面给出回应称，墨西哥紧邻美国，移民和出入境政策十分严格，对各国公民一视同仁。</p><div><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3481985712,2938738922&amp;fm=173&amp;s=E99A26D504312D8C7A9C42630300E056&amp;w=640&amp;h=324&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　 墨西哥方面将就中方提出的索贿问题展开调查，希望中国公民能够及时举证，协助墨西哥方面执法。</p><div><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=2616440279,2374485275&amp;fm=173&amp;s=BC9943910A110DC81E38F9500300D0F1&amp;w=640&amp;h=324&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　新闻链接：中国公民在国外屡被索要“小费”</p><p>　　 其实不仅仅是在墨西哥，很多中国游客在国外都遭遇过海关人员索要小费的经历，有些游客迫于压力给了，有些则没给。还有些中国游客因此遭遇了海关人员的暴力。</p><p>　　 这段视频据称拍摄于2016年5月2号晚，越南芽庄金兰国际机场边检工作人员向中国游客索要10元人民币小费。一名带小孩的母亲拒绝给小费，越南边检人员竟然扣下孩子的护照，要求母亲交100元人民币才能出关。</p><p>　　 在网友拍摄的现场视频中，可以看到有边检人员，甚至还拿出电击枪向游客挥舞。</p><p>　　 事件被曝光后，芽庄机场涉事工作人员被停职调查。</p><p>　　 这段视频拍摄于印尼海关，拍摄时间是2017年3月，画面中蓝色短袖男子是一名中国游客，他在入境柜台前拿出了钱包。视频的拍摄者是他后面等候的中国游客。据拍摄者表示，入关印尼，海关强制收取中国人小费100-300元，只收中国人。</p><p>　　出境游被索要“小费”怎么办？</p><p>　　 根据国际惯例，即使你已获得一国签证，相关国家也有权拒绝入境且无需说明理由。因此建议中国游客在入境前要正确填写入境卡和海关申报表，办理落地签证，提前准备好机票和酒店预订单等材料，不给对方借题发挥的空间。</p><p>　　 在这里，提醒大家：如果遇到索要小费的情况，请不要支付，并记录下对方信息及时举证。如遇紧急情况、受到不公正对待或发生纠纷，可及时与当地使馆联系，并收集和保存好证据，以便日后通过投诉或司法途径解决。</p>', '8', '1', '2018-02-24 09:32:18', '2018-02-24 09:32:18', '1000');
INSERT INTO `article_tb` VALUES ('10', '只想省点钱\"携号转网\"：移动请放过我', '　如今，“移动革命”接近尾声，人类被移动互联网重重包围，生活方式随之改变。', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3587693726,2308931756&fm=173&s=A62245A128D08894591D4DDB03009092&w=218&h=146&img.JPEG', '', '<p>如今，“移动革命”接近尾声，人类被移动互联网重重包围，生活方式随之改变。与此同时，智能手机的电话功能已逐渐被“免费”即时通讯应用所取代，并且手机娱乐影音属性进一步强化，所以数据流量自然成为手机用户最关心的问题之一。</p><p>　　不过，随着互联网手机卡的到来，数据流量资费的困扰开始被解除，但是对于笔者来说，直到目前仍没有享受到这种福利，因为我是一名中国移动“情怀”用户。</p><div><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=969799350,4019288445&amp;fm=173&amp;s=A62245A128D08894591D4DDB03009092&amp;w=600&amp;h=370&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　情怀不能当饭吃，这句话用来形容“我的手机卡”来说最合适不过了，来看看笔者近六个月的资费详情：（2017年9月和10月份是本人每月实际消费，从11月开始通过其他平台进行数据流量充值，所以移动数据显示只有低消的68元）</p><div><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=910493017,3875051378&amp;fm=173&amp;s=903674335F674D1B4A4821D20000C0B2&amp;w=600&amp;h=395&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　本人是每月180分钟通话+6GB数据流量的套餐标准，作为对比，如果我更换为联网手机卡（这里以“腾讯大王卡”为例），则可以省下不少钱。</p><p>　　腾讯大王卡</p><p>　　省内用户每月资费：19元月费+18元语音费+30元流量费（约23.4GB）=67元；</p><p>　　省外用户每月资费：19元月费+18元语音费+60元流量费（约23.4GB）=97元。</p><p>　　即使每月消耗的是全国流量，其实际资费也不过97元而已，但是却可以使用近25GB的数据流量，这与6GB数据流量体验完全不在一个量级上。由此可见，互联网手机卡既省钱，又能吃得饱。</p><p>　　想\"逃离\"，但中国移动不想放我</p><p>　　其实，中国移动也推出了互联网卡，但是比起中国联通、电信与互联网公司合作推出第三方互联网卡要鸡肋一些。</p><p>　　第一款是小魔卡——上海当地互联网套餐卡，目前并不在其它地区开放办理。第二款是“任我用”套餐（无限流量），套餐资费从188元起步，还有288元价位档，当然这是针对新用户的；而针对老用户推出的是238元的套餐。不管是哪个资费套餐，对于普通用户来说都有些不实用。</p><p>　　可能有的小伙伴会说，你转投其他互联网手机卡（中国联通、中国电信）阵营不就解决问题了吗？</p><p>　　本人何尝不想啊，本人手机号绑定的银行卡以及重要应用注册账号不少于60个，解除绑定并且重新重新绑定新手机号，想想都是一个可怕的大工程；并且还需要重新告知家人、朋友以及客户新更换的手机号码；相信很多中国移动手机卡的小伙伴都会有同感。但是如果可以“携号转网”，换手机卡带来的困扰都可以被解决。</p><p>　　携号转网大家应该知道吧？就是号码可携带、移机不改号，一家移动电信运营商的，比如持有移动号码的手机用户，转入中国电信或中国联通，享受中国电信或中国联通提供的电信运营服务。但是对于开放携号转网这件事，笔者认为中国移动不会同意；先来看一组数据：</p><div><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=932242680,3970689300&amp;fm=173&amp;s=5191E93397E06D0950F809CE0300C036&amp;w=600&amp;h=219&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　2010年11月22日，工信部第一批携号转网试点在天津、海南启动。2014年9月20日，第二批携号转网试点在江西、湖北、云南落地实施。从工信部数据显示来看，截止2016年6月底，开展携号转网试点的五省（市）共有超过45万用户使用了号码携带服务。</p><p>　　其中，中国电信携入16.8万，携出6.6万，净增用户10.2万；中国移动携入16.2万，携出25万，净增用户-8.8万；中国联通携入14.7万，携出16.1万，净增用户-1.4万。从结果来看，转入中国电信网络的用户最多，而中国移动的用户流失率最高。</p><p>　　再来看一组数据：</p><div><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=944852705,3955035510&amp;fm=173&amp;s=1CBB7E9620B88825467412770300D038&amp;w=600&amp;h=164&amp;img.JPEG\" data-loaded=\"0\"></div><p>　　截止到2017年年末，中国移动4G用户累计6.49亿人，而中国电信4G用户、中国联通4G用户分别仅有1.82亿人、1.74亿人；如果以携号转网试点的五省（市）为参考标准，开放携号转网后，中国移动将会用户流失是巨大的，其损失是不可估量的。所以不妨猜测，中国移动必然会抵制携号转网的全面开放。</p><p>　　此前，工信部电信研究院报告曾直白地指出，用户携号转网难度大，而究其原因，是运营商为避免用户流失，通过技术手段人为设置各种门槛，阻止用户携出。所以，携号转网试点近7年仍未全面放开，这背后最大的阻碍者就是运营商。</p><p>　　除了\"身不由己\"，也有好消息</p><p>　　不过，对于消费者似乎也有好消息，2017年8月，工信部在一份“十三五规划纲要”文件中，明确指出要在2020年全国范围内推行携号转网服务。另外还有消息称，工信部将开展“异网漫游”试点，用户可在保持号码不变、归属运营商不变的情况下，使用其他运营商的网络。打比方来说，在联通信号弱、移动信号强的区域，联通用户可使用移动的网络。</p><p>　　不管是携号转网还是异网漫游，成为现实都将有很长的路要走。不过我们可以以取消漫游资费来做参照，国内漫游费伴随手机用户20多个年头，堪称化石费用，但是去年在国家强令要求下，很快就被取消了；所以说，携号转网、异网漫游或许也会通过类似方法成功实现。</p><p>　　如果携号转网最终能够全国落实，对于用户来说是一个利好消息，有了流通选择业务的自由，以前卖方强势运营商说了算的时代将成为过去。自由竞争的市场，不管是在资费还是在服务水平上，几大运营商都要展开积极的调整来吸引用户，最终不管是资费下降还是服务提升获利的还是消费者。</p><p>　　如果携号转网全面开放，对于中国电信和中国联通来说，也是一大利好，因为在4G时代，两者就确立4G网络共享、融合发展的策略，能够想象，携号转网开放后，中国联通与中国电信之间的用户携出与携入必将十分活跃，变得更加频繁。而对于中国移动来说，如果舍不得让利，一旦携号转网全面放开，用户的选择更多样更自由，中国移动估计要哭晕在厕所。</p><p>　　最后，对于携号转网大家怎么看？如果携号转网全面开放，你们会投到哪家阵营下？</p><div><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=939596530,3947916671&amp;fm=173&amp;s=F33B30C4462548B61D1264D00300309A&amp;w=600&amp;h=398&amp;img.JPEG\" data-loaded=\"0\"></div>', '10', '1', '2018-02-24 09:32:59', '2018-02-24 09:32:59', '1000');
INSERT INTO `article_tb` VALUES ('15', '再来人：用科学技术推动教育行业的变革', '用科技解放双手，推动教育行业的变革', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cjksjqum1vv8kkmrgvuth1mlj11.png', '', '<p>2018年7月20日14：00整，于再来人北京总部——神州数码大厦5层，召开了其最新研发的科技产品MSP的发布会。由再来人联合创始人兼CEO谌烜沙(Alan)、再来人联合创始人Vits(魏博乐)、再来人技术部总监何苏轩及再来人产品经理刘婧铱(Olivia)出席并发表讲话。</p><center><img src=\"https://a5img.pncdn.cn/2018/0730/1532923287955.png\" border=\"0\"></center><p>　　<strong>用科技解放双手，推动教育行业的变革</strong></p><p>　　教育公司&amp;科技产品，如果不是再来人，我们可能很难将教育行业与科技产品联想到一块。再来人作为一家教育科技公司，凭借其领先的科学技术及海量的数据资料研发出一套独有的KEIS方法论，并致力于以更高效的方式完成教与学的整个过程、在有限的时间内将学生的结果最佳化，提升学生及家长的服务满意度，目前再来人以96%的服务满意度在业界遥遥领先，事实证明，他们也正在通过科技推动着教育行业的变革。</p><center><img src=\"https://a5img.pncdn.cn/2018/0730/1532923287646.png\" border=\"0\"></center><p>　　<strong>以产品效果与用户体验为前提，用科技颠覆行业</strong></p><p>　　再来人联合创始人谌烜沙(Alan)为会议发表了致辞，他表示再来人作为一个产品导向的公司，在过程中不断自我提升、力求完美，从服务结果上看，我们目前拥有的产品已达到行业顶级。以清华、北大学生为例，我们目前为止帮助的清华、北大学员获得世界排名前十名校Offer的概率已超过90%，而除再来人外，行业内平均值仅为25%。那么此次MSP的发布就意味着我们的产品在拥有超高水准的基础上，又做了一次巨大的飞跃，对此我也表示非常的激动。同时Alan又为大家分享了再来人产品迭代中几次重要的升级：</p><p>　　2013年，我同另外一位联合创始人Vits以及以名校招生官组成的顾问团队的共同努力下，研发出了产品的雏形MVP(Minimum Viable Product，最小可行性产品)。</p><p>　　2014年我们来到北京，v1.0产品核心STEP辅导体系及KEIS方法论正式上线。我们确立了STEP体系中的关键角色——名校导师，将其拆分延伸为学术、文笔、职业三个不同方向，让导师发挥其最擅长的。为了确保效果，我们对导师设定了学生杠杆数量及13步入驻的导师质量把控体系。</p><p>　　2015年，我们验证了产品效果之后，发现其有效性远高于同行竞品，同时我们获得了来自于Ian(劳斯莱斯全球董事长、前麦肯锡全球董事长)、Jim O\'Neill(前英国商务部部长、前高盛资产管理部董事长)的投资。为了学员能更科学的选校我们又上线了v2.0产品，同年申请季，我们成为了全美排名第一的普林斯顿大学输送学生数量最多的国内留学品牌，在保障申请结果的同时，我们维持了95%的客户满意度，而当时行业的平均满意度仅仅只是9%。</p><p>　　2016年，我们发布了v3.0产品，加入了全职的班主任(Coordinator)角色。进军留学市场两年的我们就已收获数千份名校录取，同时我们帮助学员所获奖学金突破5亿大关。在规模增大的同时，我们一直保持着超高的客户满意度，普林斯顿大学录取数量连续两年保持行业首位。同年统计，当时我们的名校录取数量就已成为“5大”传统机构录取总数的3倍;同时，被称为“本科诺贝尔奖”的罗德奖学金，每年中国区仅4位获得者，我们的学员就有2位，这些数据再一次证明我们研发的产品是可以帮助学生变得更加卓越的。</p><p>　　2017年，我们在v4.0产品中加入PlanB服务，同时又升级了背景提升项目，更好的支持了低年级同学。我们同时获得了新华网《公众信赖出国服务》&amp;新浪网《中国品牌知名度留学机构》两项大奖，截止至2017年，我们帮助学员获得的奖学金总额已超过12亿大关，这是一件多么振奋人心的事情。</p><p>　　Alan强调再来人是一家产品导向的公司，我们产品的发展历程足以体现初衷，我们愿意用实际行动去解决用户所面临的问题。事实证明，我们在产品上所有的动作，不但保障了服务结果同时也提升了用户体验。</p><center><img src=\"https://a5img.pncdn.cn/2018/0730/1532923287903.png\" border=\"0\"></center><p>　　<strong>什么是MSP？</strong></p><p>　　那么究竟什么是MSP?再来人产品经理刘婧铱(Olivia)为现场所有人做了详尽的说明。</p><p>　　MSP即Mentee-Mentor Service Platform，是一套实现从学员-家长-导师-班主任(Coordinator)“四位一体”全方位服务的平台。为了能够使我们目前拥有的600+并于下半年持续增长至1000+的海外名校导师能够更好、更科学的服务于我们的学员，我们研发了MSP。它的应用还可以让导师、学员间的合作更加高效，在保障学员申请结果的同时，又能减少重复性工作以提高用户体验。</p><p>　　MSP分为四个子系统，分别是学生服务平台、导师服务平台、家长跟踪平台、班主任&amp;导师管理系统。学员、家长、导师、班主任(Coordinator)可通过MSP完成服务过程中的所有动作，并实时跟踪服务进程，将整个服务过程透明化、公开化、数据化。</p><p>　　<strong>四大主要功能</strong></p><p>　　1.信息同步与整合</p><p>　　通过MSP，学员、导师、家长、班主任(Coordinator)可以清晰的看到所有服务相关信息，并将信息进行整合而不是零散的散落在邮件里。</p><p>　　2.时间预约与反馈</p><p>　　学生可以在MSP预约沟通时间，只需选择所在时区，系统将自动调换至该时区的日期和时间。沟通结束，MSP会将导师反馈内容标准化，导师可以在平台直接提交反馈。</p><p>　　3.文书上传与下载</p><p>　　文书及其他申请材料的上传、下载都会在MSP上进行，并可以看到修改进度，方便导师和学生把控时间，在项目截止日之前，完成修改工作。</p><p>　　4.信息提示与提醒</p><p>　　MSP会根据学生、导师、班主任(Coordinator)、家长的操作相互发送提醒，实现了学生、导师把控服务进度，家长、班主任跟踪服务过程。</p><center><img src=\"https://a5img.pncdn.cn/2018/0730/1532923287547.png\" border=\"0\"></center><p>　　<strong>科技丰富教育理念，产品优化教育结果</strong></p><p>　　作为再来人技术部总监，何苏轩首先对所有参与MSP研发以及发布的同事表示感谢。他发表了从科技角度出发对教育理念的理解，他生动地将教育的整个过程比作“漆黑的森林”，而将科技比作为黑暗中指引方向的“火把”，他表示教育不应该只单单停留在“教”与“学”的基本概念，它应该结合大数据与科学的方法更高效的完成整个过程，并让学生所有的选择变得更科学，从而保障学生的结果最佳化。</p><p>　　同时，他也声明再来人未来还将会坚持产品导向，持续研发更前沿的科技产品，应用于我们的学员、家长、导师及工作团队，用科技力量推动教育行业的变革。</p><center><img src=\"https://a5img.pncdn.cn/2018/0730/1532923287101.png\" border=\"0\"></center><p>　　<strong>从繁到简，见证行业变革</strong></p><p>　　最后，再来人联合创始人Vits强调对MSP能够实际应用到学员学习、导师服务及员工工作中表示非常激动，并对MSP的实际效果非常期待，他认为MSP的发布意味着教育行业 “从繁到简”的转变，在场的所有人也会是这次再来人乃至整个教育行业科技变革的见证者。</p>', '1', '1', '2018-07-30 14:05:18', '2018-07-30 14:05:18', '1002');

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
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8 COMMENT='banner表';

-- ----------------------------
-- Records of banner_tb
-- ----------------------------
INSERT INTO `banner_tb` VALUES ('1002', '连续第三年裁员或涉及千人', '3', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2517002031,3108225445&fm=173&app=12&f=JPEG?w=218&h=146&s=C03417D05E614B1F7480E8010300F0E3', '连续第三年裁员或涉及千人，魅族官方称是末位淘汰不超10%', 'https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_7990631491843176035%22%7D&n_type=0&p_from=1', '2018-03-30 18:00:42', '1');
INSERT INTO `banner_tb` VALUES ('1003', '独孤天下', '2', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=37681831,3945139552&fm=173&app=25&f=JPEG?w=218&h=146&s=D5600CAB12AF86FC119938B403009040', '《独孤天下》独孤般若凄美下线 安以轩虐心演绎', 'https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_10862629842721736047%22%7D&n_type=0&p_from=1', '2018-03-30 18:02:23', '1');
INSERT INTO `banner_tb` VALUES ('1005', '测试文章', '1', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3474194859,3738622053&fm=173&s=B46248A60CE284925909E1320300F013&w=218&h=146&img.JPEG', null, 'laoyeshuo://article?articleId=10', '2018-04-02 22:52:05', '1');
INSERT INTO `banner_tb` VALUES ('1006', '测试视频', '1', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '', 'laoyeshuo://videoSet?videoSetId=1029', '2018-07-20 16:32:41', '1');
INSERT INTO `banner_tb` VALUES ('1007', '测试', '3', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '', 'laoyeshuo://videoSet?videoSetId=1029', '2018-07-20 15:34:04', '1');
INSERT INTO `banner_tb` VALUES ('1008', '测试', '3', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3474194859,3738622053&fm=173&s=B46248A60CE284925909E1320300F013&w=218&h=146&img.JPEG', '', 'laoyeshuo://article?articleId=10', '2018-04-02 23:02:57', '1');
INSERT INTO `banner_tb` VALUES ('1012', '测试视频01', '1', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cjkt7b0ddlka8r8t712bf84u7q.jpg', null, 'laoyeshuo://videoSet?videoSetId=1029', '2018-07-30 14:15:31', '1');
INSERT INTO `banner_tb` VALUES ('1013', '测试视频02', '3', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cjktau0p9e71oi210tqj7g14d47v.jpg', '2018年7月20日14：00整，于再来人北京总部——神州数码大厦5层，召开了其最新研发的科技产品MSP的发布会。由再来人联合创始人兼CEO谌烜沙(Alan)、再来人联合创始人Vits(魏博乐)、再来人技术部总监何苏轩及再来人产品经理刘婧铱(Olivia)出席并发表讲话。', 'https://www.admin5.com/article/20180730/868145.shtml', '2018-07-30 14:17:51', '1');
INSERT INTO `banner_tb` VALUES ('1014', '测试视频03', '2', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cjkufac61rvsqjr9uvuk51186cm.jpg', '', 'laoyeshuo://videoSet?videoSetId=1027', '2018-07-30 14:37:13', '1');
INSERT INTO `banner_tb` VALUES ('1015', '测试', '1', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cjku31c84241nla1s6417ph1bgkab.jpg', null, 'laoyeshuo://article?articleId=5', '2018-07-30 14:32:12', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8 COMMENT='分发表';

-- ----------------------------
-- Records of distribute_tb
-- ----------------------------
INSERT INTO `distribute_tb` VALUES ('1000', '舒靖宇', '1', '365.00', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1', '1000', '1010');
INSERT INTO `distribute_tb` VALUES ('1001', '谢威', '1', '365.00', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1', '1000', '1009');
INSERT INTO `distribute_tb` VALUES ('1002', '小胖子', '1', '365.00', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1', '1000', '1014');
INSERT INTO `distribute_tb` VALUES ('1006', '刘海歌他哥', '1', '365.00', '2018-05-31 17:11:40', '2018-05-31 17:11:40', '2018-05-31 17:11:40', '1', '1000', '1038');
INSERT INTO `distribute_tb` VALUES ('1007', '王小明', '1', '365.00', '2018-06-01 11:05:13', '2018-06-01 11:05:13', '2018-06-01 11:05:13', '1', '1009', '1019');
INSERT INTO `distribute_tb` VALUES ('1008', '', '1', '365.00', '2018-06-01 17:46:32', '2018-06-01 17:46:32', '2018-06-01 17:46:32', '1', '1009', '1042');
INSERT INTO `distribute_tb` VALUES ('1009', '梁未', '1', '365.00', '2018-06-27 10:18:52', '2018-06-27 10:18:52', '2018-06-27 10:18:52', '1', '1009', '1052');
INSERT INTO `distribute_tb` VALUES ('1010', '刘哥', '1', '365.00', '2018-07-20 15:38:46', '2018-07-20 15:38:46', '2018-07-20 15:38:46', '1', '1009', '1041');

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
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

-- ----------------------------
-- Records of feedback_tb
-- ----------------------------
INSERT INTO `feedback_tb` VALUES ('1000', '生活多美好！', '2018-02-05 14:35:59', '1000', '15111336587');
INSERT INTO `feedback_tb` VALUES ('1002', '好好好好好', '2018-04-02 10:46:31', '1009', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=1145 DEFAULT CHARSET=utf8 COMMENT='财务记录表 ';

-- ----------------------------
-- Records of finance_record_tb
-- ----------------------------
INSERT INTO `finance_record_tb` VALUES ('1000', '2', '1', '12552018020415050511009', '704535.00', '2', '2018-02-04 15:05:06', '2018-02-04 15:05:06', '1009');
INSERT INTO `finance_record_tb` VALUES ('1002', '2', '2', '37442018020415270911009', '200.00', '2', '2018-02-04 15:27:10', '2018-02-26 16:18:12', '1009');
INSERT INTO `finance_record_tb` VALUES ('1003', '2', '2', '98252018020415280711009', '100000.00', '3', '2018-02-04 15:28:08', '2018-07-30 19:10:22', '1009');
INSERT INTO `finance_record_tb` VALUES ('1004', '2', '1', '31372018020415414411009', '64949.00', '2', '2018-02-04 15:41:44', '2018-02-04 15:41:44', '1009');
INSERT INTO `finance_record_tb` VALUES ('1005', '2', '2', '40662018020415415811009', '600000.00', '3', '2018-02-04 15:41:58', '2018-07-30 19:13:27', '1009');
INSERT INTO `finance_record_tb` VALUES ('1006', '2', '1', '16202018020420321211010', '100000.00', '2', '2018-02-04 20:32:13', '2018-02-04 20:32:13', '1010');
INSERT INTO `finance_record_tb` VALUES ('1007', '1', '1', '71692018020420585311010', '10000.00', '2', '2018-02-04 20:58:53', '2018-02-04 20:58:53', '1010');
INSERT INTO `finance_record_tb` VALUES ('1008', '2', '1', '53902018020421015911010', '10000.00', '2', '2018-02-04 21:01:59', '2018-02-04 21:01:59', '1010');
INSERT INTO `finance_record_tb` VALUES ('1009', '1', '1', '39242018020421021411010', '10000.00', '2', '2018-02-04 21:02:14', '2018-02-04 21:02:14', '1010');
INSERT INTO `finance_record_tb` VALUES ('1010', '1', '2', '12192018020421094211010', '10000.00', '2', '2018-02-04 21:09:42', '2018-04-11 12:06:10', '1010');
INSERT INTO `finance_record_tb` VALUES ('1011', '2', '2', '26592018020421123811010', '10000.00', '3', '2018-02-04 21:12:38', '2018-07-30 19:15:56', '1010');
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
INSERT INTO `finance_record_tb` VALUES ('1040', '1', '2', '60552018022811513911010', '1000.00', '2', '2018-02-28 11:51:39', '2018-04-11 12:17:24', '1010');
INSERT INTO `finance_record_tb` VALUES ('1041', '1', '2', '41512018022812205411010', '1000.00', '2', '2018-02-28 12:20:54', '2018-04-11 12:18:39', '1010');
INSERT INTO `finance_record_tb` VALUES ('1042', '2', '2', '71402018022814234911010', '1000.00', '2', '2018-02-28 14:23:49', '2018-04-11 12:18:03', '1010');
INSERT INTO `finance_record_tb` VALUES ('1043', '1', '1', '86352018022815131111009', '0.01', '2', '2018-02-28 15:13:28', '2018-02-28 15:13:28', '1009');
INSERT INTO `finance_record_tb` VALUES ('1044', '1', '1', '39382018022815212611009', '0.01', '2', '2018-02-28 15:21:42', '2018-02-28 15:21:42', '1009');
INSERT INTO `finance_record_tb` VALUES ('1045', '1', '1', '11602018022815231311009', '0.01', '2', '2018-02-28 15:23:29', '2018-02-28 15:23:29', '1009');
INSERT INTO `finance_record_tb` VALUES ('1046', '1', '11', '93802018022821342817303', '0.01', '2', '2018-02-28 21:34:28', '2018-02-28 21:34:28', '1000');
INSERT INTO `finance_record_tb` VALUES ('1047', '1', '11', '89932018030113380315790', '0.01', '2', '2018-03-01 13:38:04', '2018-03-01 13:38:04', '1018');
INSERT INTO `finance_record_tb` VALUES ('1048', '3', '5', '1010201803051235007834', '4500.00', '2', '2018-03-05 12:35:01', '2018-03-05 12:35:01', '1010');
INSERT INTO `finance_record_tb` VALUES ('1049', '3', '6', '47402018030611484015847', '1800.00', '2', '2018-03-06 11:48:41', '2018-03-06 11:48:41', '1000');
INSERT INTO `finance_record_tb` VALUES ('1050', '1', '11', '1018201803081753232459', '0.01', '2', '2018-03-08 17:53:23', '2018-03-08 17:53:23', '1018');
INSERT INTO `finance_record_tb` VALUES ('1051', '2', '2', '1010201803122206421333', '1.00', '2', '2018-03-12 22:06:43', '2018-04-11 12:16:16', '1010');
INSERT INTO `finance_record_tb` VALUES ('1052', '3', '11', '1010201803130051233221', '0.01', '2', '2018-03-13 00:51:24', '2018-03-13 00:51:24', '1010');
INSERT INTO `finance_record_tb` VALUES ('1053', '3', '5', '1010201803130106133218', '25000.00', '2', '2018-03-13 01:06:14', '2018-03-13 01:06:14', '1010');
INSERT INTO `finance_record_tb` VALUES ('1054', '3', '6', '33742018031316475918526', '10000.00', '2', '2018-03-13 16:47:59', '2018-03-13 16:47:59', '1000');
INSERT INTO `finance_record_tb` VALUES ('1055', '3', '11', '1014201803140932052849', '1111.00', '2', '2018-03-14 09:32:06', '2018-03-14 09:32:06', '1014');
INSERT INTO `finance_record_tb` VALUES ('1056', '1', '2', '1014201803140942147297', '100.00', '1', '2018-03-14 09:42:14', '2018-03-14 09:42:14', '1014');
INSERT INTO `finance_record_tb` VALUES ('1057', '1', '2', '1014201803140942307390', '844.00', '1', '2018-03-14 09:42:31', '2018-03-14 09:42:31', '1014');
INSERT INTO `finance_record_tb` VALUES ('1058', '1', '2', '1014201803140943148339', '7580.00', '1', '2018-03-14 09:43:14', '2018-03-14 09:43:14', '1014');
INSERT INTO `finance_record_tb` VALUES ('1059', '2', '2', '1010201803152302297561', '1.00', '2', '2018-03-15 23:02:30', '2018-04-11 12:13:51', '1010');
INSERT INTO `finance_record_tb` VALUES ('1060', '1', '11', '1016201803261720471004', '0.01', '2', '2018-03-26 17:20:47', '2018-03-26 17:20:47', '1016');
INSERT INTO `finance_record_tb` VALUES ('1061', '1', '1', '1016201803271531246309', '0.01', '2', '2018-03-27 15:31:28', '2018-03-27 15:31:28', '1016');
INSERT INTO `finance_record_tb` VALUES ('1062', '1', '1', '1010201804011702308352', '0.01', '2', '2018-04-01 17:02:37', '2018-04-01 17:02:37', '1010');
INSERT INTO `finance_record_tb` VALUES ('1063', '1', '1', '1010201804011706403570', '0.01', '2', '2018-04-01 17:06:52', '2018-04-01 17:06:52', '1010');
INSERT INTO `finance_record_tb` VALUES ('1064', '1', '1', '1010201804011711383887', '0.01', '2', '2018-04-01 17:11:43', '2018-04-01 17:11:43', '1010');
INSERT INTO `finance_record_tb` VALUES ('1065', '1', '2', '1016201804031050033834', '0.01', '2', '2018-04-03 10:50:04', '2018-05-30 16:57:07', '1016');
INSERT INTO `finance_record_tb` VALUES ('1066', '1', '1', '1010201804081639062963', '0.01', '2', '2018-04-08 16:39:11', '2018-04-08 16:39:11', '1010');
INSERT INTO `finance_record_tb` VALUES ('1067', '1', '1', '1010201804081641433955', '0.01', '2', '2018-04-08 16:41:48', '2018-04-08 16:41:48', '1010');
INSERT INTO `finance_record_tb` VALUES ('1068', '1', '1', '1009201804081740549302', '0.01', '2', '2018-04-08 17:41:46', '2018-04-08 17:41:46', '1009');
INSERT INTO `finance_record_tb` VALUES ('1069', '1', '1', '1016201804121400018545', '0.01', '2', '2018-04-12 14:00:07', '2018-04-12 14:00:07', '1016');
INSERT INTO `finance_record_tb` VALUES ('1070', '1', '1', '1016201804121400227657', '0.02', '2', '2018-04-12 14:00:27', '2018-04-12 14:00:27', '1016');
INSERT INTO `finance_record_tb` VALUES ('1071', '1', '1', '1016201804121401356494', '0.01', '2', '2018-04-12 14:01:39', '2018-04-12 14:01:39', '1016');
INSERT INTO `finance_record_tb` VALUES ('1072', '1', '1', '1016201804121427548873', '0.01', '2', '2018-04-12 14:27:59', '2018-04-12 14:27:59', '1016');
INSERT INTO `finance_record_tb` VALUES ('1073', '1', '1', '1016201804121429103131', '0.01', '2', '2018-04-12 14:29:14', '2018-04-12 14:29:14', '1016');
INSERT INTO `finance_record_tb` VALUES ('1074', '1', '1', '1016201804121429404785', '0.09', '2', '2018-04-12 14:29:45', '2018-04-12 14:29:45', '1016');
INSERT INTO `finance_record_tb` VALUES ('1075', '1', '1', '1016201804121431406127', '0.01', '2', '2018-04-12 14:32:09', '2018-04-12 14:32:09', '1016');
INSERT INTO `finance_record_tb` VALUES ('1076', '1', '1', '1016201804171503498316', '0.01', '2', '2018-04-17 15:04:31', '2018-04-17 15:04:31', '1016');
INSERT INTO `finance_record_tb` VALUES ('1077', '1', '1', '1016201804171504496848', '0.11', '2', '2018-04-17 15:05:09', '2018-04-17 15:05:09', '1016');
INSERT INTO `finance_record_tb` VALUES ('1078', '3', '11', '1000201805311642441551', '100.00', '2', '2018-05-31 16:42:44', '2018-05-31 16:42:44', '1000');
INSERT INTO `finance_record_tb` VALUES ('1079', '3', '11', '1038201805311650322226', '100.00', '2', '2018-05-31 16:50:32', '2018-05-31 16:50:32', '1038');
INSERT INTO `finance_record_tb` VALUES ('1080', '3', '8', '1038201805311659565732', '365.00', '2', '2018-05-31 16:59:56', '2018-05-31 16:59:56', '1038');
INSERT INTO `finance_record_tb` VALUES ('1081', '3', '9', '1000201805311659568321', '146.00', '2', '2018-05-31 16:59:56', '2018-05-31 16:59:56', '1000');
INSERT INTO `finance_record_tb` VALUES ('1082', '3', '8', '1038201805311711396146', '365.00', '2', '2018-05-31 17:11:40', '2018-05-31 17:11:40', '1038');
INSERT INTO `finance_record_tb` VALUES ('1083', '3', '9', '1000201805311711397053', '146.00', '2', '2018-05-31 17:11:40', '2018-05-31 17:11:40', '1000');
INSERT INTO `finance_record_tb` VALUES ('1084', '3', '8', '1019201806011105126608', '365.00', '2', '2018-06-01 11:05:13', '2018-06-01 11:05:13', '1019');
INSERT INTO `finance_record_tb` VALUES ('1085', '3', '9', '1009201806011105128439', '146.00', '2', '2018-06-01 11:05:13', '2018-06-01 11:05:13', '1009');
INSERT INTO `finance_record_tb` VALUES ('1086', '3', '10', '1000201806011105125912', '91.25', '2', '2018-06-01 11:05:13', '2018-06-01 11:05:13', '1000');
INSERT INTO `finance_record_tb` VALUES ('1087', '3', '8', '1042201806011746322403', '365.00', '2', '2018-06-01 17:46:32', '2018-06-01 17:46:32', '1042');
INSERT INTO `finance_record_tb` VALUES ('1088', '3', '9', '1009201806011746328680', '146.00', '2', '2018-06-01 17:46:32', '2018-06-01 17:46:32', '1009');
INSERT INTO `finance_record_tb` VALUES ('1089', '3', '10', '1000201806011746327911', '91.25', '2', '2018-06-01 17:46:32', '2018-06-01 17:46:32', '1000');
INSERT INTO `finance_record_tb` VALUES ('1090', '1', '1', '1014201806081457448109', '0.01', '2', '2018-06-08 14:57:52', '2018-06-08 14:57:52', '1014');
INSERT INTO `finance_record_tb` VALUES ('1091', '3', '5', '1038201806121609551977', '4500.00', '2', '2018-06-12 16:09:55', '2018-06-12 16:09:55', '1038');
INSERT INTO `finance_record_tb` VALUES ('1092', '1', '1', '1016201806131341304654', '0.01', '2', '2018-06-13 13:41:35', '2018-06-13 13:41:35', '1016');
INSERT INTO `finance_record_tb` VALUES ('1093', '1', '1', '1016201806131341555306', '0.12', '2', '2018-06-13 13:41:59', '2018-06-13 13:41:59', '1016');
INSERT INTO `finance_record_tb` VALUES ('1094', '1', '2', '1041201806250932084923', '100.00', '2', '2018-06-25 09:32:09', '2018-07-09 13:49:53', '1041');
INSERT INTO `finance_record_tb` VALUES ('1095', '1', '2', '1041201806261717023248', '1.00', '2', '2018-06-26 17:17:03', '2018-07-05 14:58:37', '1041');
INSERT INTO `finance_record_tb` VALUES ('1096', '3', '8', '1052201806271018525569', '365.00', '2', '2018-06-27 10:18:52', '2018-06-27 10:18:52', '1052');
INSERT INTO `finance_record_tb` VALUES ('1097', '3', '9', '1009201806271018521751', '146.00', '2', '2018-06-27 10:18:52', '2018-06-27 10:18:52', '1009');
INSERT INTO `finance_record_tb` VALUES ('1098', '3', '10', '1000201806271018523381', '91.25', '2', '2018-06-27 10:18:52', '2018-06-27 10:18:52', '1000');
INSERT INTO `finance_record_tb` VALUES ('1099', '1', '2', '1052201806271020509629', '1.00', '2', '2018-06-27 10:20:51', '2018-06-27 10:22:07', '1052');
INSERT INTO `finance_record_tb` VALUES ('1100', '1', '2', '1052201806271027142413', '10.00', '2', '2018-06-27 10:27:15', '2018-06-27 10:28:28', '1052');
INSERT INTO `finance_record_tb` VALUES ('1101', '1', '2', '1041201806271120277584', '100.00', '2', '2018-06-27 11:20:28', '2018-07-05 14:58:35', '1041');
INSERT INTO `finance_record_tb` VALUES ('1102', '1', '2', '1041201807041048433527', '100.00', '2', '2018-07-04 10:48:44', '2018-07-05 14:58:30', '1041');
INSERT INTO `finance_record_tb` VALUES ('1103', '1', '1', '1016201807041629306628', '0.01', '2', '2018-07-04 16:29:43', '2018-07-04 16:29:43', '1016');
INSERT INTO `finance_record_tb` VALUES ('1104', '1', '1', '1016201807041734582413', '0.01', '2', '2018-07-04 17:35:14', '2018-07-04 17:35:14', '1016');
INSERT INTO `finance_record_tb` VALUES ('1105', '1', '1', '1044201807051436483736', '0.01', '2', '2018-07-05 14:37:06', '2018-07-05 14:37:06', '1044');
INSERT INTO `finance_record_tb` VALUES ('1106', '1', '1', '1044201807051437184034', '1.01', '2', '2018-07-05 14:37:33', '2018-07-05 14:37:33', '1044');
INSERT INTO `finance_record_tb` VALUES ('1107', '1', '2', '1016201807051500315691', '0.43', '2', '2018-07-05 15:00:31', '2018-07-05 15:01:07', '1016');
INSERT INTO `finance_record_tb` VALUES ('1108', '1', '1', '1041201807051502197928', '0.01', '2', '2018-07-05 15:02:26', '2018-07-05 15:02:26', '1041');
INSERT INTO `finance_record_tb` VALUES ('1109', '1', '1', '1014201807051614409634', '0.01', '2', '2018-07-05 16:14:50', '2018-07-05 16:14:50', '1014');
INSERT INTO `finance_record_tb` VALUES ('1110', '1', '1', '1014201807051625101039', '0.10', '2', '2018-07-05 16:25:18', '2018-07-05 16:25:18', '1014');
INSERT INTO `finance_record_tb` VALUES ('1111', '1', '1', '1041201807051627544473', '0.10', '2', '2018-07-05 16:28:02', '2018-07-05 16:28:02', '1041');
INSERT INTO `finance_record_tb` VALUES ('1112', '1', '1', '1044201807051632048909', '0.10', '2', '2018-07-05 16:32:44', '2018-07-05 16:32:44', '1044');
INSERT INTO `finance_record_tb` VALUES ('1113', '1', '1', '1044201807051632572440', '0.20', '2', '2018-07-05 16:33:16', '2018-07-05 16:33:16', '1044');
INSERT INTO `finance_record_tb` VALUES ('1114', '1', '1', '1016201807051646004485', '0.10', '2', '2018-07-05 16:46:03', '2018-07-05 16:46:03', '1016');
INSERT INTO `finance_record_tb` VALUES ('1115', '1', '1', '1016201807051646437258', '0.20', '2', '2018-07-05 16:46:47', '2018-07-05 16:46:47', '1016');
INSERT INTO `finance_record_tb` VALUES ('1116', '1', '1', '1016201807051647306629', '0.10', '2', '2018-07-05 16:47:35', '2018-07-05 16:47:35', '1016');
INSERT INTO `finance_record_tb` VALUES ('1117', '1', '1', '1041201807051658076312', '0.01', '2', '2018-07-05 16:58:14', '2018-07-05 16:58:14', '1041');
INSERT INTO `finance_record_tb` VALUES ('1118', '1', '2', '1052201807170948244313', '10.00', '2', '2018-07-17 09:48:24', '2018-07-17 09:48:44', '1052');
INSERT INTO `finance_record_tb` VALUES ('1119', '1', '2', '1052201807171730211848', '100.00', '2', '2018-07-17 17:30:22', '2018-07-17 17:31:00', '1052');
INSERT INTO `finance_record_tb` VALUES ('1120', '1', '1', '1041201807201521357519', '0.01', '2', '2018-07-20 15:21:52', '2018-07-20 15:21:52', '1041');
INSERT INTO `finance_record_tb` VALUES ('1121', '1', '2', '1041201807201522354837', '100.00', '2', '2018-07-20 15:22:35', '2018-07-20 15:23:03', '1041');
INSERT INTO `finance_record_tb` VALUES ('1122', '3', '8', '1041201807201538455650', '365.00', '2', '2018-07-20 15:38:46', '2018-07-20 15:38:46', '1041');
INSERT INTO `finance_record_tb` VALUES ('1123', '3', '9', '1009201807201538453854', '146.00', '2', '2018-07-20 15:38:46', '2018-07-20 15:38:46', '1009');
INSERT INTO `finance_record_tb` VALUES ('1124', '3', '10', '1000201807201538453472', '91.25', '2', '2018-07-20 15:38:46', '2018-07-20 15:38:46', '1000');
INSERT INTO `finance_record_tb` VALUES ('1125', '1', '1', '1016201807301434016387', '0.10', '2', '2018-07-30 14:34:07', '2018-07-30 14:34:07', '1016');
INSERT INTO `finance_record_tb` VALUES ('1126', '1', '2', '1016201807301439277607', '0.30', '2', '2018-07-30 14:39:28', '2018-07-30 14:40:22', '1016');
INSERT INTO `finance_record_tb` VALUES ('1127', '1', '1', '1016201807301446574693', '0.01', '2', '2018-07-30 14:47:01', '2018-07-30 14:47:01', '1016');
INSERT INTO `finance_record_tb` VALUES ('1128', '1', '1', '1041201807301549542362', '0.01', '2', '2018-07-30 15:50:12', '2018-07-30 15:50:12', '1041');
INSERT INTO `finance_record_tb` VALUES ('1129', '1', '1', '1016201807301618203459', '0.10', '2', '2018-07-30 16:19:45', '2018-07-30 16:19:45', '1016');
INSERT INTO `finance_record_tb` VALUES ('1130', '3', '11', '1041201807301712022911', '0.01', '2', '2018-07-30 17:12:03', '2018-07-30 17:12:03', '1041');
INSERT INTO `finance_record_tb` VALUES ('1131', '1', '2', '1041201807301922589414', '100.00', '3', '2018-07-30 19:22:59', '2018-07-30 19:23:28', '1041');
INSERT INTO `finance_record_tb` VALUES ('1132', '1', '2', '1052201807311114036291', '14.00', '1', '2018-07-31 11:14:04', '2018-07-31 11:14:04', '1052');
INSERT INTO `finance_record_tb` VALUES ('1133', '1', '1', '1052201807311114332156', '0.01', '2', '2018-07-31 11:15:31', '2018-07-31 11:15:31', '1052');
INSERT INTO `finance_record_tb` VALUES ('1134', '1', '2', '1052201807311442553439', '10.01', '1', '2018-07-31 14:42:55', '2018-07-31 14:42:55', '1052');
INSERT INTO `finance_record_tb` VALUES ('1135', '1', '1', '1052201807311443178198', '0.01', '2', '2018-07-31 14:43:48', '2018-07-31 14:43:48', '1052');
INSERT INTO `finance_record_tb` VALUES ('1136', '1', '1', '1052201807311447448089', '0.01', '2', '2018-07-31 14:48:08', '2018-07-31 14:48:08', '1052');
INSERT INTO `finance_record_tb` VALUES ('1137', '1', '1', '1052201807311450423472', '0.01', '2', '2018-07-31 14:51:01', '2018-07-31 14:51:01', '1052');
INSERT INTO `finance_record_tb` VALUES ('1138', '1', '1', '1052201807311454334836', '0.01', '2', '2018-07-31 14:55:13', '2018-07-31 14:55:13', '1052');
INSERT INTO `finance_record_tb` VALUES ('1139', '1', '1', '1052201807311457146075', '0.01', '2', '2018-07-31 14:57:40', '2018-07-31 14:57:40', '1052');
INSERT INTO `finance_record_tb` VALUES ('1140', '3', '11', '1016201811231050186226', '0.01', '2', '2018-11-23 10:50:18', '2018-11-23 10:50:18', '1016');
INSERT INTO `finance_record_tb` VALUES ('1141', '3', '11', '1016201811231050259662', '0.01', '2', '2018-11-23 10:50:25', '2018-11-23 10:50:25', '1016');
INSERT INTO `finance_record_tb` VALUES ('1142', '1', '1', '1055201811231103144858', '0.10', '2', '2018-11-23 11:04:18', '2018-11-23 11:04:18', '1055');
INSERT INTO `finance_record_tb` VALUES ('1143', '3', '11', '1055201811231314092953', '0.01', '2', '2018-11-23 13:14:10', '2018-11-23 13:14:10', '1055');
INSERT INTO `finance_record_tb` VALUES ('1144', '3', '11', '1055201811231314155801', '0.01', '2', '2018-11-23 13:14:15', '2018-11-23 13:14:15', '1055');

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
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=utf8 COMMENT='财务表';

-- ----------------------------
-- Records of finance_tb
-- ----------------------------
INSERT INTO `finance_tb` VALUES ('1000', '11874bb6149dd45428da628c9766b252', '24594.99', '0.00', '100.01', '0.00', '0.00', '0.00', '0.00', '24330.00', '365.00', '0.00', '1000', '2018-01-19 15:46:08', '2018-07-20 15:38:46');
INSERT INTO `finance_tb` VALUES ('1005', '11874bb6149dd45428da628c9766b252', '584.04', '769484.04', '5611.00', '761651.00', '0.00', '0.00', '4500.00', '584.00', '0.00', '0.00', '1009', '2018-01-27 18:21:05', '2018-07-20 15:38:46');
INSERT INTO `finance_tb` VALUES ('1006', '11874bb6149dd45428da628c9766b252', '95498.04', '150000.05', '29500.01', '25002.00', '0.00', '0.00', '29500.00', '0.00', '0.00', '0.00', '1010', '2018-01-27 20:23:22', '2018-04-08 16:41:48');
INSERT INTO `finance_tb` VALUES ('1007', null, '200020001.00', '200020001.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1011', '2018-02-06 16:39:35', '2018-02-08 14:15:42');
INSERT INTO `finance_tb` VALUES ('1008', '603c05920d6f94cccaf1ddbe6bf1597c', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1012', '2018-02-07 01:15:45', '2018-05-30 14:56:09');
INSERT INTO `finance_tb` VALUES ('1009', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1013', '2018-02-10 13:13:19', '2018-02-10 13:13:19');
INSERT INTO `finance_tb` VALUES ('1010', '11874bb6149dd45428da628c9766b252', '0.12', '10000.12', '1476.00', '8524.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1014', '2018-02-10 13:19:45', '2018-07-05 16:25:18');
INSERT INTO `finance_tb` VALUES ('1011', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1015', '2018-02-22 16:43:03', '2018-02-22 16:43:03');
INSERT INTO `finance_tb` VALUES ('1012', '9a4dc3c8d8a5292000960aa991369e4e', '0.29', '1.05', '0.02', '0.74', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1016', '2018-02-23 14:07:13', '2018-11-23 10:50:25');
INSERT INTO `finance_tb` VALUES ('1013', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1017', '2018-02-28 17:54:43', '2018-02-28 17:54:43');
INSERT INTO `finance_tb` VALUES ('1014', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1018', '2018-03-01 13:23:55', '2018-03-01 13:23:55');
INSERT INTO `finance_tb` VALUES ('1015', '4792b97ccc109aab951677410802d7ce', '99635.00', '0.00', '365.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '1019', '2018-03-13 09:49:12', '2018-06-01 11:05:13');
INSERT INTO `finance_tb` VALUES ('1016', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1020', '2018-03-13 16:20:27', '2018-03-13 16:20:27');
INSERT INTO `finance_tb` VALUES ('1017', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1021', '2018-03-27 14:27:41', '2018-03-27 14:27:41');
INSERT INTO `finance_tb` VALUES ('1018', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1022', '2018-04-01 23:34:49', '2018-04-01 23:34:49');
INSERT INTO `finance_tb` VALUES ('1019', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1023', '2018-04-02 16:53:56', '2018-04-02 16:53:56');
INSERT INTO `finance_tb` VALUES ('1020', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1024', '2018-04-03 11:01:55', '2018-04-03 11:01:55');
INSERT INTO `finance_tb` VALUES ('1021', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1025', '2018-04-08 10:18:52', '2018-04-08 10:18:52');
INSERT INTO `finance_tb` VALUES ('1022', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1026', '2018-04-17 17:25:05', '2018-04-17 17:25:05');
INSERT INTO `finance_tb` VALUES ('1023', '11874bb6149dd45428da628c9766b252', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1027', '2018-05-03 22:18:28', '2018-05-06 12:37:57');
INSERT INTO `finance_tb` VALUES ('1025', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1029', '2018-05-30 16:06:28', '2018-05-30 16:06:28');
INSERT INTO `finance_tb` VALUES ('1026', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1030', '2018-05-30 16:10:51', '2018-05-30 16:10:51');
INSERT INTO `finance_tb` VALUES ('1027', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1031', '2018-05-30 17:06:42', '2018-05-30 17:06:42');
INSERT INTO `finance_tb` VALUES ('1028', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1032', '2018-05-30 17:07:30', '2018-05-30 17:07:30');
INSERT INTO `finance_tb` VALUES ('1029', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1033', '2018-05-30 17:08:05', '2018-05-30 17:08:05');
INSERT INTO `finance_tb` VALUES ('1030', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1034', '2018-05-30 17:08:33', '2018-05-30 17:08:33');
INSERT INTO `finance_tb` VALUES ('1031', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1035', '2018-05-30 17:10:54', '2018-05-30 17:10:54');
INSERT INTO `finance_tb` VALUES ('1032', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1036', '2018-05-30 17:11:46', '2018-05-30 17:11:46');
INSERT INTO `finance_tb` VALUES ('1033', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1037', '2018-05-30 17:12:15', '2018-05-30 17:12:15');
INSERT INTO `finance_tb` VALUES ('1034', '11874bb6149dd45428da628c9766b252', '94670.00', '0.00', '5330.00', '0.00', '0.00', '0.00', '4500.00', '0.00', '0.00', '100000.00', '1038', '2018-05-30 18:31:26', '2018-06-12 16:09:55');
INSERT INTO `finance_tb` VALUES ('1035', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1039', '2018-05-31 14:20:08', '2018-05-31 14:20:08');
INSERT INTO `finance_tb` VALUES ('1036', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1040', '2018-06-01 14:43:35', '2018-06-01 14:43:35');
INSERT INTO `finance_tb` VALUES ('1037', '11874bb6149dd45428da628c9766b252', '99134.13', '0.14', '365.01', '501.00', '0.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '1041', '2018-06-01 16:14:28', '2018-07-30 19:22:59');
INSERT INTO `finance_tb` VALUES ('1038', '11874bb6149dd45428da628c9766b252', '999635.00', '0.00', '365.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1000000.00', '1042', '2018-06-01 16:35:05', '2018-06-01 17:46:32');
INSERT INTO `finance_tb` VALUES ('1039', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1043', '2018-06-04 13:39:47', '2018-06-04 13:39:47');
INSERT INTO `finance_tb` VALUES ('1040', '11874bb6149dd45428da628c9766b252', '1.32', '1.32', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1044', '2018-06-13 14:09:14', '2018-07-05 16:33:16');
INSERT INTO `finance_tb` VALUES ('1041', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1045', '2018-06-24 11:36:11', '2018-06-24 11:36:11');
INSERT INTO `finance_tb` VALUES ('1042', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1046', '2018-06-25 09:15:33', '2018-06-25 09:15:33');
INSERT INTO `finance_tb` VALUES ('1043', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1047', '2018-06-25 09:16:20', '2018-06-25 09:16:20');
INSERT INTO `finance_tb` VALUES ('1044', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1048', '2018-06-25 09:20:30', '2018-06-25 09:20:30');
INSERT INTO `finance_tb` VALUES ('1045', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1049', '2018-06-25 09:20:53', '2018-06-25 09:20:53');
INSERT INTO `finance_tb` VALUES ('1046', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1050', '2018-06-25 09:22:16', '2018-06-25 09:22:16');
INSERT INTO `finance_tb` VALUES ('1047', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1051', '2018-06-25 09:35:22', '2018-06-25 09:35:22');
INSERT INTO `finance_tb` VALUES ('1048', 'bfbe6b47df0d8f1f52958d23010b119b', '99490.05', '0.06', '365.00', '145.01', '0.00', '0.00', '0.00', '0.00', '0.00', '100000.00', '1052', '2018-06-26 17:34:51', '2018-07-31 14:57:40');
INSERT INTO `finance_tb` VALUES ('1049', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1053', '2018-07-04 10:54:56', '2018-07-04 10:54:56');
INSERT INTO `finance_tb` VALUES ('1050', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1054', '2018-07-04 13:54:55', '2018-07-04 13:54:55');
INSERT INTO `finance_tb` VALUES ('1051', '11874bb6149dd45428da628c9766b252', '0.08', '0.10', '0.02', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1055', '2018-11-23 10:35:15', '2018-11-23 13:14:15');

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
) ENGINE=InnoDB AUTO_INCREMENT=1172 DEFAULT CHARSET=utf8 COMMENT='积分榜表';

-- ----------------------------
-- Records of integral_board_tb
-- ----------------------------
INSERT INTO `integral_board_tb` VALUES ('1000', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722', '74.00', '2018-02-05 00:00:00', '2018-02-09 16:02:23', '2018-02-10 13:56:49', '1009');
INSERT INTO `integral_board_tb` VALUES ('1001', '1', '2', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722', '180.00', '2018-02-01 00:00:00', '2018-02-09 16:02:23', '2018-02-28 17:47:41', '1009');
INSERT INTO `integral_board_tb` VALUES ('1002', '1', '3', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722', '517.00', '2018-01-01 00:00:00', '2018-02-09 16:02:23', '2018-07-04 14:50:57', '1009');
INSERT INTO `integral_board_tb` VALUES ('1003', '2', '3', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722', '517.00', '2018-01-01 00:00:00', '2018-02-09 16:02:23', '2018-07-04 14:50:57', '1009');
INSERT INTO `integral_board_tb` VALUES ('1005', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1517055943.png', '36.00', '2018-02-05 00:00:00', '2018-02-09 22:11:18', '2018-02-10 13:33:30', '1010');
INSERT INTO `integral_board_tb` VALUES ('1006', '1', '2', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1517055943.png', '132.00', '2018-02-01 00:00:00', '2018-02-09 22:11:18', '2018-02-28 13:52:42', '1010');
INSERT INTO `integral_board_tb` VALUES ('1007', '1', '3', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1517055943.png', '245.00', '2018-01-01 00:00:00', '2018-02-09 22:11:18', '2018-05-15 13:05:56', '1010');
INSERT INTO `integral_board_tb` VALUES ('1008', '2', '3', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1517055943.png', '245.00', '2018-01-01 00:00:00', '2018-02-09 22:11:18', '2018-05-15 13:05:56', '1010');
INSERT INTO `integral_board_tb` VALUES ('1009', '1', '1', null, null, '91.00', '2018-02-05 00:00:00', '2018-02-09 22:27:37', '2018-02-11 22:09:41', '1000');
INSERT INTO `integral_board_tb` VALUES ('1010', '1', '2', null, null, '167.00', '2018-02-01 00:00:00', '2018-02-09 22:27:37', '2018-02-28 21:34:44', '1000');
INSERT INTO `integral_board_tb` VALUES ('1011', '1', '3', null, null, '606.00', '2018-01-01 00:00:00', '2018-02-09 22:27:37', '2018-11-23 11:18:51', '1000');
INSERT INTO `integral_board_tb` VALUES ('1012', '2', '3', null, null, '716.00', '2018-01-01 00:00:00', '2018-02-09 23:51:42', '2018-11-23 11:18:51', '1000');
INSERT INTO `integral_board_tb` VALUES ('1015', '1', '1', null, null, '10.00', '2018-02-12 00:00:00', '2018-02-12 18:36:23', '2018-02-15 22:03:50', '1000');
INSERT INTO `integral_board_tb` VALUES ('1016', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png', '59.00', '2018-02-19 00:00:00', '2018-02-22 16:16:02', '2018-02-24 09:24:54', '1000');
INSERT INTO `integral_board_tb` VALUES ('1017', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722', '42.00', '2018-02-19 00:00:00', '2018-02-23 09:54:01', '2018-02-23 23:57:29', '1009');
INSERT INTO `integral_board_tb` VALUES ('1018', '2', '2', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180127193722', '843.00', '2018-01-01 00:00:00', '2018-02-23 09:54:01', '2018-11-23 12:34:03', '1000');
INSERT INTO `integral_board_tb` VALUES ('1019', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1519366739.png', '2.00', '2018-02-19 00:00:00', '2018-02-23 14:20:24', '2018-02-23 14:20:48', '1016');
INSERT INTO `integral_board_tb` VALUES ('1020', '1', '2', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1519366739.png', '4.00', '2018-02-01 00:00:00', '2018-02-23 14:20:24', '2018-02-28 17:49:16', '1016');
INSERT INTO `integral_board_tb` VALUES ('1021', '1', '3', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1519366739.png', '88.00', '2018-01-01 00:00:00', '2018-02-23 14:20:24', '2018-11-23 12:34:03', '1016');
INSERT INTO `integral_board_tb` VALUES ('1022', '2', '3', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1519366739.png', '88.00', '2018-01-01 00:00:00', '2018-02-23 14:20:24', '2018-11-23 12:34:03', '1016');
INSERT INTO `integral_board_tb` VALUES ('1023', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1517055943.png', '59.00', '2018-02-19 00:00:00', '2018-02-24 13:14:45', '2018-02-25 18:55:54', '1010');
INSERT INTO `integral_board_tb` VALUES ('1024', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180224135432', '93.00', '2018-02-26 00:00:00', '2018-02-26 09:52:41', '2018-03-02 14:04:28', '1009');
INSERT INTO `integral_board_tb` VALUES ('1025', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1519451189.png', '37.00', '2018-02-26 00:00:00', '2018-02-26 13:14:50', '2018-02-28 13:52:42', '1010');
INSERT INTO `integral_board_tb` VALUES ('1026', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1519366739.png', '2.00', '2018-02-26 00:00:00', '2018-02-28 17:49:05', '2018-02-28 17:49:16', '1016');
INSERT INTO `integral_board_tb` VALUES ('1027', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png', '41.00', '2018-02-26 00:00:00', '2018-02-28 21:30:08', '2018-03-03 20:43:47', '1000');
INSERT INTO `integral_board_tb` VALUES ('1028', '1', '1', null, null, '5.00', '2018-02-26 00:00:00', '2018-03-01 13:38:16', '2018-03-01 13:38:36', '1018');
INSERT INTO `integral_board_tb` VALUES ('1029', '1', '2', null, null, '14.00', '2018-03-01 00:00:00', '2018-03-01 13:38:16', '2018-03-27 14:59:18', '1018');
INSERT INTO `integral_board_tb` VALUES ('1030', '1', '3', null, null, '14.00', '2018-01-01 00:00:00', '2018-03-01 13:38:16', '2018-03-27 14:59:18', '1018');
INSERT INTO `integral_board_tb` VALUES ('1031', '2', '3', null, null, '14.00', '2018-01-01 00:00:00', '2018-03-01 13:38:16', '2018-03-27 14:59:18', '1018');
INSERT INTO `integral_board_tb` VALUES ('1032', '2', '2', null, null, '61.00', '2018-01-01 00:00:00', '2018-03-01 13:38:16', '2018-11-23 13:39:54', '1016');
INSERT INTO `integral_board_tb` VALUES ('1033', '1', '2', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533', '109.00', '2018-03-01 00:00:00', '2018-03-01 13:51:02', '2018-03-27 13:18:42', '1009');
INSERT INTO `integral_board_tb` VALUES ('1034', '1', '2', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png', '325.00', '2018-03-01 00:00:00', '2018-03-02 11:04:06', '2018-03-31 18:56:58', '1000');
INSERT INTO `integral_board_tb` VALUES ('1035', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1519366739.png', '2.00', '2018-03-05 00:00:00', '2018-03-05 15:46:23', '2018-03-05 15:47:01', '1016');
INSERT INTO `integral_board_tb` VALUES ('1036', '1', '2', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1519366739.png', '12.00', '2018-03-01 00:00:00', '2018-03-05 15:46:23', '2018-03-26 17:39:04', '1016');
INSERT INTO `integral_board_tb` VALUES ('1037', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533', '13.00', '2018-03-05 00:00:00', '2018-03-05 15:48:52', '2018-03-08 17:41:45', '1009');
INSERT INTO `integral_board_tb` VALUES ('1038', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png', '37.00', '2018-03-05 00:00:00', '2018-03-08 17:23:15', '2018-03-11 05:17:07', '1000');
INSERT INTO `integral_board_tb` VALUES ('1039', '1', '1', null, null, '5.00', '2018-03-05 00:00:00', '2018-03-08 17:55:30', '2018-03-08 18:00:24', '1018');
INSERT INTO `integral_board_tb` VALUES ('1040', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520035085.png', '6.00', '2018-03-05 00:00:00', '2018-03-11 04:47:43', '2018-03-11 05:13:16', '1010');
INSERT INTO `integral_board_tb` VALUES ('1041', '1', '2', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520035085.png', '55.00', '2018-03-01 00:00:00', '2018-03-11 04:47:43', '2018-03-31 23:32:00', '1010');
INSERT INTO `integral_board_tb` VALUES ('1042', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533', '30.00', '2018-03-12 00:00:00', '2018-03-12 09:34:55', '2018-03-18 10:36:19', '1009');
INSERT INTO `integral_board_tb` VALUES ('1043', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520035085.png', '35.00', '2018-03-12 00:00:00', '2018-03-12 11:12:31', '2018-03-16 10:00:26', '1010');
INSERT INTO `integral_board_tb` VALUES ('1044', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png', '56.00', '2018-03-12 00:00:00', '2018-03-12 21:04:49', '2018-03-15 19:19:20', '1000');
INSERT INTO `integral_board_tb` VALUES ('1045', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180313162550', '1.00', '2018-03-12 00:00:00', '2018-03-13 16:43:20', '2018-03-13 16:43:20', '1018');
INSERT INTO `integral_board_tb` VALUES ('1046', '1', '1', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1520929499.png', '2.00', '2018-03-12 00:00:00', '2018-03-13 17:20:04', '2018-03-13 17:20:14', '1016');
INSERT INTO `integral_board_tb` VALUES ('1047', '1', '1', '小胖子', '', '21.00', '2018-03-12 00:00:00', '2018-03-14 09:32:17', '2018-03-16 21:15:02', '1014');
INSERT INTO `integral_board_tb` VALUES ('1048', '1', '2', '小胖子', '', '21.00', '2018-03-01 00:00:00', '2018-03-14 09:32:17', '2018-03-16 21:15:02', '1014');
INSERT INTO `integral_board_tb` VALUES ('1049', '1', '3', '小胖子', '', '40.00', '2018-01-01 00:00:00', '2018-03-14 09:32:17', '2018-09-06 21:46:48', '1014');
INSERT INTO `integral_board_tb` VALUES ('1050', '2', '3', '小胖子', '', '40.00', '2018-01-01 00:00:00', '2018-03-14 09:32:17', '2018-09-06 21:46:48', '1014');
INSERT INTO `integral_board_tb` VALUES ('1051', '2', '2', '小胖子', '', '40.00', '2018-01-01 00:00:00', '2018-03-14 09:32:17', '2018-09-06 21:46:48', '1010');
INSERT INTO `integral_board_tb` VALUES ('1052', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533', '3.00', '2018-03-19 00:00:00', '2018-03-19 14:40:47', '2018-03-19 14:42:05', '1009');
INSERT INTO `integral_board_tb` VALUES ('1053', '1', '1', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1520929499.png', '8.00', '2018-03-26 00:00:00', '2018-03-26 16:44:05', '2018-03-26 17:39:04', '1016');
INSERT INTO `integral_board_tb` VALUES ('1054', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180227114533', '49.00', '2018-03-26 00:00:00', '2018-03-26 17:25:23', '2018-04-01 21:38:40', '1009');
INSERT INTO `integral_board_tb` VALUES ('1055', '1', '1', '王小明', null, '53.00', '2018-03-26 00:00:00', '2018-03-27 13:19:25', '2018-03-27 13:24:13', '1019');
INSERT INTO `integral_board_tb` VALUES ('1056', '1', '2', '王小明', null, '53.00', '2018-03-01 00:00:00', '2018-03-27 13:19:25', '2018-03-27 13:24:13', '1019');
INSERT INTO `integral_board_tb` VALUES ('1057', '1', '3', '王小明', null, '68.00', '2018-01-01 00:00:00', '2018-03-27 13:19:25', '2018-04-03 10:20:23', '1019');
INSERT INTO `integral_board_tb` VALUES ('1058', '2', '3', '王小明', null, '68.00', '2018-01-01 00:00:00', '2018-03-27 13:19:25', '2018-04-03 10:20:23', '1019');
INSERT INTO `integral_board_tb` VALUES ('1059', '2', '2', '王小明', null, '128.00', '2018-01-01 00:00:00', '2018-03-27 13:19:25', '2018-07-31 23:09:13', '1009');
INSERT INTO `integral_board_tb` VALUES ('1060', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1000_1519287324.png', '199.00', '2018-03-26 00:00:00', '2018-03-27 13:49:42', '2018-04-01 22:27:05', '1000');
INSERT INTO `integral_board_tb` VALUES ('1061', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180313162550', '3.00', '2018-03-26 00:00:00', '2018-03-27 14:58:52', '2018-03-27 14:59:18', '1018');
INSERT INTO `integral_board_tb` VALUES ('1062', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520863161.png', '36.00', '2018-03-26 00:00:00', '2018-03-31 15:13:06', '2018-04-01 17:46:19', '1010');
INSERT INTO `integral_board_tb` VALUES ('1063', '1', '2', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520863161.png', '28.00', '2018-04-01 00:00:00', '2018-04-01 02:04:25', '2018-04-11 21:32:29', '1010');
INSERT INTO `integral_board_tb` VALUES ('1064', '1', '2', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401135421', '110.00', '2018-04-01 00:00:00', '2018-04-01 13:55:53', '2018-04-17 17:50:11', '1009');
INSERT INTO `integral_board_tb` VALUES ('1065', '1', '2', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '72.00', '2018-04-01 00:00:00', '2018-04-01 22:27:05', '2018-04-22 15:14:47', '1000');
INSERT INTO `integral_board_tb` VALUES ('1066', '1', '1', null, null, '83.00', '2018-04-02 00:00:00', '2018-04-02 16:54:28', '2018-04-03 13:35:04', '1023');
INSERT INTO `integral_board_tb` VALUES ('1067', '1', '2', null, null, '83.00', '2018-04-01 00:00:00', '2018-04-02 16:54:28', '2018-04-03 13:35:04', '1023');
INSERT INTO `integral_board_tb` VALUES ('1068', '1', '3', null, null, '83.00', '2018-01-01 00:00:00', '2018-04-02 16:54:28', '2018-04-03 13:35:04', '1023');
INSERT INTO `integral_board_tb` VALUES ('1069', '2', '3', null, null, '83.00', '2018-01-01 00:00:00', '2018-04-02 16:54:28', '2018-04-03 13:35:04', '1023');
INSERT INTO `integral_board_tb` VALUES ('1070', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '62.00', '2018-04-02 00:00:00', '2018-04-02 22:54:30', '2018-04-07 10:24:50', '1000');
INSERT INTO `integral_board_tb` VALUES ('1071', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '57.00', '2018-04-02 00:00:00', '2018-04-02 22:55:28', '2018-04-08 21:30:21', '1009');
INSERT INTO `integral_board_tb` VALUES ('1072', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520863161.png', '3.00', '2018-04-02 00:00:00', '2018-04-02 22:59:03', '2018-04-05 23:13:05', '1010');
INSERT INTO `integral_board_tb` VALUES ('1073', '1', '1', '王小明', null, '15.00', '2018-04-02 00:00:00', '2018-04-03 10:16:12', '2018-04-03 10:20:23', '1019');
INSERT INTO `integral_board_tb` VALUES ('1074', '1', '2', '王小明', null, '15.00', '2018-04-01 00:00:00', '2018-04-03 10:16:12', '2018-04-03 10:20:23', '1019');
INSERT INTO `integral_board_tb` VALUES ('1075', '1', '1', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1522142869.png', '9.00', '2018-04-02 00:00:00', '2018-04-03 10:47:20', '2018-04-03 11:15:39', '1016');
INSERT INTO `integral_board_tb` VALUES ('1076', '1', '2', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1522142869.png', '28.00', '2018-04-01 00:00:00', '2018-04-03 10:47:20', '2018-04-17 18:00:08', '1016');
INSERT INTO `integral_board_tb` VALUES ('1077', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '7.00', '2018-04-09 00:00:00', '2018-04-11 10:28:53', '2018-04-11 10:30:25', '1000');
INSERT INTO `integral_board_tb` VALUES ('1078', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520863161.png', '3.00', '2018-04-09 00:00:00', '2018-04-11 19:46:49', '2018-04-11 21:32:29', '1010');
INSERT INTO `integral_board_tb` VALUES ('1079', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '12.00', '2018-04-09 00:00:00', '2018-04-11 21:15:18', '2018-04-13 11:13:53', '1009');
INSERT INTO `integral_board_tb` VALUES ('1080', '1', '1', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1522142869.png', '8.00', '2018-04-09 00:00:00', '2018-04-12 14:11:20', '2018-04-12 14:56:00', '1016');
INSERT INTO `integral_board_tb` VALUES ('1081', '1', '1', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1522142869.png', '11.00', '2018-04-16 00:00:00', '2018-04-17 14:38:57', '2018-04-17 18:00:08', '1016');
INSERT INTO `integral_board_tb` VALUES ('1082', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1021_1523946788.png', '1.00', '2018-04-16 00:00:00', '2018-04-17 14:39:05', '2018-04-17 14:39:05', '1021');
INSERT INTO `integral_board_tb` VALUES ('1083', '1', '2', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1021_1523946788.png', '1.00', '2018-04-01 00:00:00', '2018-04-17 14:39:05', '2018-04-17 14:39:05', '1021');
INSERT INTO `integral_board_tb` VALUES ('1084', '1', '3', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1021_1523946788.png', '1.00', '2018-01-01 00:00:00', '2018-04-17 14:39:05', '2018-04-17 14:39:05', '1021');
INSERT INTO `integral_board_tb` VALUES ('1085', '2', '3', null, 'http://laoyeshuovideo.laoyeshuo.cn/ios_1021_1523946788.png', '1.00', '2018-01-01 00:00:00', '2018-04-17 14:39:05', '2018-04-17 14:39:05', '1021');
INSERT INTO `integral_board_tb` VALUES ('1086', '1', '1', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180417154011', '28.00', '2018-04-16 00:00:00', '2018-04-17 16:47:02', '2018-04-17 16:54:11', '1017');
INSERT INTO `integral_board_tb` VALUES ('1087', '1', '2', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180417154011', '28.00', '2018-04-01 00:00:00', '2018-04-17 16:47:02', '2018-04-17 16:54:11', '1017');
INSERT INTO `integral_board_tb` VALUES ('1088', '1', '3', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180417154011', '28.00', '2018-01-01 00:00:00', '2018-04-17 16:47:02', '2018-04-17 16:54:11', '1017');
INSERT INTO `integral_board_tb` VALUES ('1089', '2', '3', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180417154011', '28.00', '2018-01-01 00:00:00', '2018-04-17 16:47:02', '2018-04-17 16:54:11', '1017');
INSERT INTO `integral_board_tb` VALUES ('1090', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '26.00', '2018-04-16 00:00:00', '2018-04-17 17:06:53', '2018-04-17 17:50:11', '1009');
INSERT INTO `integral_board_tb` VALUES ('1091', '1', '1', '', '', '12.00', '2018-04-16 00:00:00', '2018-04-17 17:47:20', '2018-04-17 17:48:55', '1015');
INSERT INTO `integral_board_tb` VALUES ('1092', '1', '2', '', '', '12.00', '2018-04-01 00:00:00', '2018-04-17 17:47:20', '2018-04-17 17:48:55', '1015');
INSERT INTO `integral_board_tb` VALUES ('1093', '1', '3', '', '', '12.00', '2018-01-01 00:00:00', '2018-04-17 17:47:20', '2018-04-17 17:48:55', '1015');
INSERT INTO `integral_board_tb` VALUES ('1094', '2', '3', '', '', '12.00', '2018-01-01 00:00:00', '2018-04-17 17:47:20', '2018-04-17 17:48:55', '1015');
INSERT INTO `integral_board_tb` VALUES ('1095', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '2.00', '2018-04-16 00:00:00', '2018-04-22 15:14:42', '2018-04-22 15:14:47', '1000');
INSERT INTO `integral_board_tb` VALUES ('1096', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520863161.png', '13.00', '2018-04-30 00:00:00', '2018-05-01 14:43:18', '2018-05-06 14:28:59', '1010');
INSERT INTO `integral_board_tb` VALUES ('1097', '1', '2', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520863161.png', '30.00', '2018-05-01 00:00:00', '2018-05-01 14:43:18', '2018-05-15 13:05:56', '1010');
INSERT INTO `integral_board_tb` VALUES ('1098', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '3.00', '2018-04-30 00:00:00', '2018-05-01 16:20:55', '2018-05-01 16:21:47', '1000');
INSERT INTO `integral_board_tb` VALUES ('1099', '1', '2', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '19.00', '2018-05-01 00:00:00', '2018-05-01 16:20:55', '2018-05-31 16:42:54', '1000');
INSERT INTO `integral_board_tb` VALUES ('1100', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '36.00', '2018-05-07 00:00:00', '2018-05-07 13:54:15', '2018-05-13 15:02:22', '1009');
INSERT INTO `integral_board_tb` VALUES ('1101', '1', '2', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '59.00', '2018-05-01 00:00:00', '2018-05-07 13:54:15', '2018-05-31 14:29:35', '1009');
INSERT INTO `integral_board_tb` VALUES ('1102', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520863161.png', '2.00', '2018-05-07 00:00:00', '2018-05-07 23:11:56', '2018-05-07 23:13:18', '1010');
INSERT INTO `integral_board_tb` VALUES ('1103', '1', '1', '舒靖宇', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1010_1520863161.png', '15.00', '2018-05-14 00:00:00', '2018-05-15 00:04:45', '2018-05-15 13:05:56', '1010');
INSERT INTO `integral_board_tb` VALUES ('1104', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '13.00', '2018-05-21 00:00:00', '2018-05-23 22:29:08', '2018-05-23 22:30:49', '1000');
INSERT INTO `integral_board_tb` VALUES ('1105', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '3.00', '2018-05-28 00:00:00', '2018-05-29 18:08:39', '2018-05-31 16:42:54', '1000');
INSERT INTO `integral_board_tb` VALUES ('1106', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '23.00', '2018-05-28 00:00:00', '2018-05-30 16:37:25', '2018-05-31 14:29:35', '1009');
INSERT INTO `integral_board_tb` VALUES ('1107', '1', '1', '刘海歌他哥', '', '4.00', '2018-05-28 00:00:00', '2018-05-31 17:03:12', '2018-05-31 17:03:20', '1038');
INSERT INTO `integral_board_tb` VALUES ('1108', '1', '2', '刘海歌他哥', '', '4.00', '2018-05-01 00:00:00', '2018-05-31 17:03:12', '2018-05-31 17:03:20', '1038');
INSERT INTO `integral_board_tb` VALUES ('1109', '1', '3', '刘海歌他哥', '', '8.00', '2018-01-01 00:00:00', '2018-05-31 17:03:12', '2018-06-12 16:14:23', '1038');
INSERT INTO `integral_board_tb` VALUES ('1110', '2', '3', '刘海歌他哥', '', '8.00', '2018-01-01 00:00:00', '2018-05-31 17:03:12', '2018-06-12 16:14:23', '1038');
INSERT INTO `integral_board_tb` VALUES ('1111', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '5.00', '2018-06-04 00:00:00', '2018-06-05 11:19:43', '2018-06-08 13:44:56', '1009');
INSERT INTO `integral_board_tb` VALUES ('1112', '1', '2', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '6.00', '2018-06-01 00:00:00', '2018-06-05 11:19:43', '2018-06-23 14:11:34', '1009');
INSERT INTO `integral_board_tb` VALUES ('1113', '1', '1', '刘海歌他哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1038_1527760312.png', '1.00', '2018-06-04 00:00:00', '2018-06-08 17:44:26', '2018-06-08 17:44:26', '1038');
INSERT INTO `integral_board_tb` VALUES ('1114', '1', '2', '刘海歌他哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1038_1527760312.png', '4.00', '2018-06-01 00:00:00', '2018-06-08 17:44:26', '2018-06-12 16:14:23', '1038');
INSERT INTO `integral_board_tb` VALUES ('1115', '1', '1', '刘海歌他哥', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180611102033', '3.00', '2018-06-11 00:00:00', '2018-06-12 16:14:14', '2018-06-12 16:14:23', '1038');
INSERT INTO `integral_board_tb` VALUES ('1116', '1', '1', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1522142869.png', '1.00', '2018-06-18 00:00:00', '2018-06-23 13:49:06', '2018-06-23 13:49:06', '1016');
INSERT INTO `integral_board_tb` VALUES ('1117', '1', '2', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1522142869.png', '1.00', '2018-06-01 00:00:00', '2018-06-23 13:49:06', '2018-06-23 13:49:06', '1016');
INSERT INTO `integral_board_tb` VALUES ('1118', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '1.00', '2018-06-18 00:00:00', '2018-06-23 14:11:34', '2018-06-23 14:11:34', '1009');
INSERT INTO `integral_board_tb` VALUES ('1119', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '1.00', '2018-06-18 00:00:00', '2018-06-24 10:31:38', '2018-06-24 10:31:38', '1000');
INSERT INTO `integral_board_tb` VALUES ('1120', '1', '2', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '15.00', '2018-06-01 00:00:00', '2018-06-24 10:31:38', '2018-06-26 23:38:24', '1000');
INSERT INTO `integral_board_tb` VALUES ('1121', '1', '1', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437172.png', '3.00', '2018-06-25 00:00:00', '2018-06-26 17:05:54', '2018-06-26 17:06:20', '1041');
INSERT INTO `integral_board_tb` VALUES ('1122', '1', '2', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437172.png', '3.00', '2018-06-01 00:00:00', '2018-06-26 17:05:54', '2018-06-26 17:06:20', '1041');
INSERT INTO `integral_board_tb` VALUES ('1123', '1', '3', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437172.png', '51.00', '2018-01-01 00:00:00', '2018-06-26 17:05:54', '2018-08-02 10:05:44', '1041');
INSERT INTO `integral_board_tb` VALUES ('1124', '2', '3', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437172.png', '51.00', '2018-01-01 00:00:00', '2018-06-26 17:05:54', '2018-08-02 10:05:44', '1041');
INSERT INTO `integral_board_tb` VALUES ('1125', '2', '2', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437172.png', '51.00', '2018-01-01 00:00:00', '2018-06-26 17:05:54', '2018-08-02 10:05:44', '1038');
INSERT INTO `integral_board_tb` VALUES ('1126', '1', '1', '小胖子', '', '3.00', '2018-06-25 00:00:00', '2018-06-26 23:22:28', '2018-06-28 10:49:11', '1014');
INSERT INTO `integral_board_tb` VALUES ('1127', '1', '2', '小胖子', '', '3.00', '2018-06-01 00:00:00', '2018-06-26 23:22:28', '2018-06-28 10:49:11', '1014');
INSERT INTO `integral_board_tb` VALUES ('1128', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '14.00', '2018-06-25 00:00:00', '2018-06-26 23:24:02', '2018-06-26 23:38:24', '1000');
INSERT INTO `integral_board_tb` VALUES ('1129', '1', '1', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '53.00', '2018-07-02 00:00:00', '2018-07-04 14:46:03', '2018-07-04 14:50:57', '1009');
INSERT INTO `integral_board_tb` VALUES ('1130', '1', '2', '谢威', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180401153106', '53.00', '2018-07-01 00:00:00', '2018-07-04 14:46:03', '2018-07-04 14:50:57', '1009');
INSERT INTO `integral_board_tb` VALUES ('1131', '1', '1', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1522142869.png', '13.00', '2018-07-02 00:00:00', '2018-07-04 16:05:18', '2018-07-05 17:51:23', '1016');
INSERT INTO `integral_board_tb` VALUES ('1132', '1', '2', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1522142869.png', '22.00', '2018-07-01 00:00:00', '2018-07-04 16:05:18', '2018-07-30 16:26:24', '1016');
INSERT INTO `integral_board_tb` VALUES ('1133', '1', '1', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437172.png', '1.00', '2018-07-09 00:00:00', '2018-07-09 10:17:56', '2018-07-09 10:17:56', '1041');
INSERT INTO `integral_board_tb` VALUES ('1134', '1', '2', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437172.png', '47.00', '2018-07-01 00:00:00', '2018-07-09 10:17:56', '2018-07-31 18:10:57', '1041');
INSERT INTO `integral_board_tb` VALUES ('1135', '1', '1', '小胖子', '', '1.00', '2018-07-09 00:00:00', '2018-07-10 18:52:50', '2018-07-10 18:52:50', '1014');
INSERT INTO `integral_board_tb` VALUES ('1136', '1', '2', '小胖子', '', '9.00', '2018-07-01 00:00:00', '2018-07-10 18:52:50', '2018-07-26 09:49:34', '1014');
INSERT INTO `integral_board_tb` VALUES ('1137', '1', '1', '小胖子', '', '3.00', '2018-07-16 00:00:00', '2018-07-16 18:09:08', '2018-07-16 18:09:38', '1014');
INSERT INTO `integral_board_tb` VALUES ('1138', '1', '1', '梁威', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1052_1530005702.png', '15.00', '2018-07-16 00:00:00', '2018-07-17 09:52:10', '2018-07-18 09:16:02', '1052');
INSERT INTO `integral_board_tb` VALUES ('1139', '1', '2', '梁威', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1052_1530005702.png', '36.00', '2018-07-01 00:00:00', '2018-07-17 09:52:10', '2018-07-31 16:58:48', '1052');
INSERT INTO `integral_board_tb` VALUES ('1140', '1', '3', '梁威', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1052_1530005702.png', '36.00', '2018-01-01 00:00:00', '2018-07-17 09:52:10', '2018-07-31 16:58:48', '1052');
INSERT INTO `integral_board_tb` VALUES ('1141', '2', '3', '梁威', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1052_1530005702.png', '36.00', '2018-01-01 00:00:00', '2018-07-17 09:52:10', '2018-07-31 16:58:48', '1052');
INSERT INTO `integral_board_tb` VALUES ('1142', '1', '1', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1528437172.png', '35.00', '2018-07-16 00:00:00', '2018-07-20 14:54:25', '2018-07-20 16:34:51', '1041');
INSERT INTO `integral_board_tb` VALUES ('1143', '1', '1', '没小钱', '', '6.00', '2018-07-16 00:00:00', '2018-07-20 16:33:55', '2018-07-20 16:36:32', '1042');
INSERT INTO `integral_board_tb` VALUES ('1144', '1', '2', '没小钱', '', '9.00', '2018-07-01 00:00:00', '2018-07-20 16:33:55', '2018-07-31 16:07:04', '1042');
INSERT INTO `integral_board_tb` VALUES ('1145', '1', '3', '没小钱', '', '9.00', '2018-01-01 00:00:00', '2018-07-20 16:33:55', '2018-07-31 16:07:04', '1042');
INSERT INTO `integral_board_tb` VALUES ('1146', '2', '3', '没小钱', '', '9.00', '2018-01-01 00:00:00', '2018-07-20 16:33:56', '2018-07-31 16:07:04', '1042');
INSERT INTO `integral_board_tb` VALUES ('1147', '1', '1', '小胖子', '', '5.00', '2018-07-23 00:00:00', '2018-07-26 09:21:18', '2018-07-26 09:49:34', '1014');
INSERT INTO `integral_board_tb` VALUES ('1148', '1', '1', '梁威', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1052_1530005702.png', '5.00', '2018-07-23 00:00:00', '2018-07-26 14:03:44', '2018-07-26 14:04:55', '1052');
INSERT INTO `integral_board_tb` VALUES ('1149', '1', '1', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1532076143.png', '3.00', '2018-07-23 00:00:00', '2018-07-26 16:41:24', '2018-07-27 09:45:19', '1041');
INSERT INTO `integral_board_tb` VALUES ('1150', '1', '1', '啦啦啦', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180507120009', '14.00', '2018-07-23 00:00:00', '2018-07-26 22:42:50', '2018-07-26 22:48:15', '1012');
INSERT INTO `integral_board_tb` VALUES ('1151', '1', '2', '啦啦啦', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180507120009', '15.00', '2018-07-01 00:00:00', '2018-07-26 22:42:50', '2018-07-31 23:09:13', '1012');
INSERT INTO `integral_board_tb` VALUES ('1152', '1', '3', '啦啦啦', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180507120009', '15.00', '2018-01-01 00:00:00', '2018-07-26 22:42:50', '2018-07-31 23:09:13', '1012');
INSERT INTO `integral_board_tb` VALUES ('1153', '2', '3', '啦啦啦', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180507120009', '15.00', '2018-01-01 00:00:00', '2018-07-26 22:42:50', '2018-07-31 23:09:13', '1012');
INSERT INTO `integral_board_tb` VALUES ('1154', '1', '1', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1016_1522142869.png', '9.00', '2018-07-30 00:00:00', '2018-07-30 14:00:26', '2018-07-30 16:26:24', '1016');
INSERT INTO `integral_board_tb` VALUES ('1155', '1', '1', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1532076143.png', '9.00', '2018-07-30 00:00:00', '2018-07-30 17:12:11', '2018-08-02 10:05:44', '1041');
INSERT INTO `integral_board_tb` VALUES ('1156', '1', '1', '没小钱', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1042_1533024218.png', '3.00', '2018-07-30 00:00:00', '2018-07-31 16:04:19', '2018-07-31 16:07:04', '1042');
INSERT INTO `integral_board_tb` VALUES ('1157', '1', '1', '梁威', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1052_1530005702.png', '16.00', '2018-07-30 00:00:00', '2018-07-31 16:09:39', '2018-07-31 16:58:48', '1052');
INSERT INTO `integral_board_tb` VALUES ('1158', '1', '1', '啦啦啦', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180507120009', '1.00', '2018-07-30 00:00:00', '2018-07-31 23:09:13', '2018-07-31 23:09:13', '1012');
INSERT INTO `integral_board_tb` VALUES ('1159', '1', '2', '刘哥', 'http://laoyeshuovideo.laoyeshuo.cn/ios_1041_1532076143.png', '1.00', '2018-08-01 00:00:00', '2018-08-02 10:05:44', '2018-08-02 10:05:44', '1041');
INSERT INTO `integral_board_tb` VALUES ('1160', '1', '1', '小胖子', '', '6.00', '2018-08-20 00:00:00', '2018-08-23 15:02:46', '2018-08-23 15:03:10', '1014');
INSERT INTO `integral_board_tb` VALUES ('1161', '1', '2', '小胖子', '', '6.00', '2018-08-01 00:00:00', '2018-08-23 15:02:46', '2018-08-23 15:03:10', '1014');
INSERT INTO `integral_board_tb` VALUES ('1162', '1', '1', '小胖子', '', '1.00', '2018-09-03 00:00:00', '2018-09-06 21:46:48', '2018-09-06 21:46:48', '1014');
INSERT INTO `integral_board_tb` VALUES ('1163', '1', '2', '小胖子', '', '1.00', '2018-09-01 00:00:00', '2018-09-06 21:46:48', '2018-09-06 21:46:48', '1014');
INSERT INTO `integral_board_tb` VALUES ('1164', '1', '1', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180730162025', '21.00', '2018-11-19 00:00:00', '2018-11-23 10:43:21', '2018-11-23 12:34:03', '1016');
INSERT INTO `integral_board_tb` VALUES ('1165', '1', '2', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180730162025', '21.00', '2018-11-01 00:00:00', '2018-11-23 10:43:21', '2018-11-23 12:34:03', '1016');
INSERT INTO `integral_board_tb` VALUES ('1166', '1', '1', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '8.00', '2018-11-19 00:00:00', '2018-11-23 11:18:32', '2018-11-23 11:18:51', '1000');
INSERT INTO `integral_board_tb` VALUES ('1167', '1', '2', null, 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20180327135737', '8.00', '2018-11-01 00:00:00', '2018-11-23 11:18:32', '2018-11-23 11:18:51', '1000');
INSERT INTO `integral_board_tb` VALUES ('1168', '1', '1', '111', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20181123104555', '18.00', '2018-11-19 00:00:00', '2018-11-23 13:14:24', '2018-11-23 13:39:54', '1055');
INSERT INTO `integral_board_tb` VALUES ('1169', '1', '2', '111', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20181123104555', '18.00', '2018-11-01 00:00:00', '2018-11-23 13:14:24', '2018-11-23 13:39:54', '1055');
INSERT INTO `integral_board_tb` VALUES ('1170', '1', '3', '111', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20181123104555', '18.00', '2018-01-01 00:00:00', '2018-11-23 13:14:24', '2018-11-23 13:39:54', '1055');
INSERT INTO `integral_board_tb` VALUES ('1171', '2', '3', '111', 'http://laoyeshuovideo.laoyeshuo.cn/fitment_20181123104555', '18.00', '2018-01-01 00:00:00', '2018-11-23 13:14:24', '2018-11-23 13:39:54', '1055');

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
) ENGINE=InnoDB AUTO_INCREMENT=2980 DEFAULT CHARSET=utf8 COMMENT='积分详细表';

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
INSERT INTO `integral_detail_tb` VALUES ('2194', '1', '1.00', '2018-03-31 15:13:06', '2018-03-31 15:13:06', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2195', '1', '1.00', '2018-03-31 15:14:05', '2018-03-31 15:14:05', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2196', '1', '1.00', '2018-03-31 15:19:59', '2018-03-31 15:19:59', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2197', '1', '1.00', '2018-03-31 15:21:02', '2018-03-31 15:21:02', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2198', '1', '1.00', '2018-03-31 15:21:54', '2018-03-31 15:21:54', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2199', '1', '1.00', '2018-03-31 15:26:17', '2018-03-31 15:26:17', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2200', '1', '1.00', '2018-03-31 15:26:27', '2018-03-31 15:26:27', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2201', '1', '1.00', '2018-03-31 15:52:07', '2018-03-31 15:52:07', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2202', '1', '1.00', '2018-03-31 15:53:28', '2018-03-31 15:53:28', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2203', '1', '1.00', '2018-03-31 16:30:30', '2018-03-31 16:30:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2204', '1', '1.00', '2018-03-31 17:10:57', '2018-03-31 17:10:57', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2205', '1', '1.00', '2018-03-31 18:50:25', '2018-03-31 18:50:25', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2206', '1', '1.00', '2018-03-31 18:56:45', '2018-03-31 18:56:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2207', '1', '1.00', '2018-03-31 18:56:47', '2018-03-31 18:56:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2208', '1', '1.00', '2018-03-31 18:56:52', '2018-03-31 18:56:52', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2209', '1', '1.00', '2018-03-31 18:56:58', '2018-03-31 18:56:58', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2210', '1', '1.00', '2018-03-31 19:05:59', '2018-03-31 19:05:59', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2211', '1', '1.00', '2018-03-31 19:21:29', '2018-03-31 19:21:29', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2212', '1', '1.00', '2018-03-31 23:32:00', '2018-03-31 23:32:00', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2213', '1', '1.00', '2018-04-01 02:04:24', '2018-04-01 02:04:24', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2214', '1', '1.00', '2018-04-01 02:04:30', '2018-04-01 02:04:30', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2215', '1', '1.00', '2018-04-01 02:20:36', '2018-04-01 02:20:36', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2216', '1', '1.00', '2018-04-01 02:20:50', '2018-04-01 02:20:50', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2217', '1', '1.00', '2018-04-01 13:05:35', '2018-04-01 13:05:35', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2218', '1', '1.00', '2018-04-01 13:05:50', '2018-04-01 13:05:50', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2219', '1', '1.00', '2018-04-01 13:05:59', '2018-04-01 13:05:59', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2220', '1', '1.00', '2018-04-01 13:34:37', '2018-04-01 13:34:37', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2221', '1', '1.00', '2018-04-01 13:35:24', '2018-04-01 13:35:24', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2222', '1', '1.00', '2018-04-01 13:35:46', '2018-04-01 13:35:46', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2223', '1', '1.00', '2018-04-01 13:41:25', '2018-04-01 13:41:25', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2224', '1', '1.00', '2018-04-01 13:55:53', '2018-04-01 13:55:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2225', '1', '1.00', '2018-04-01 15:36:02', '2018-04-01 15:36:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2226', '1', '1.00', '2018-04-01 15:36:07', '2018-04-01 15:36:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2227', '1', '1.00', '2018-04-01 16:03:08', '2018-04-01 16:03:08', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2228', '1', '1.00', '2018-04-01 16:04:11', '2018-04-01 16:04:11', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2229', '1', '1.00', '2018-04-01 16:35:48', '2018-04-01 16:35:48', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2230', '1', '1.00', '2018-04-01 16:37:15', '2018-04-01 16:37:15', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2231', '1', '1.00', '2018-04-01 16:42:13', '2018-04-01 16:42:13', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2232', '1', '1.00', '2018-04-01 16:46:33', '2018-04-01 16:46:33', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2233', '1', '1.00', '2018-04-01 16:51:35', '2018-04-01 16:51:35', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2234', '1', '1.00', '2018-04-01 16:51:44', '2018-04-01 16:51:44', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2235', '1', '1.00', '2018-04-01 17:44:47', '2018-04-01 17:44:47', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2236', '1', '1.00', '2018-04-01 17:44:54', '2018-04-01 17:44:54', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2237', '1', '1.00', '2018-04-01 17:46:19', '2018-04-01 17:46:19', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2238', '1', '1.00', '2018-04-01 19:31:38', '2018-04-01 19:31:38', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2239', '1', '1.00', '2018-04-01 21:36:24', '2018-04-01 21:36:24', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2240', '1', '1.00', '2018-04-01 21:36:29', '2018-04-01 21:36:29', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2241', '1', '1.00', '2018-04-01 21:36:34', '2018-04-01 21:36:34', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2242', '1', '1.00', '2018-04-01 21:36:39', '2018-04-01 21:36:39', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2243', '1', '1.00', '2018-04-01 21:36:44', '2018-04-01 21:36:44', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2244', '1', '1.00', '2018-04-01 21:36:49', '2018-04-01 21:36:49', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2245', '1', '1.00', '2018-04-01 21:36:54', '2018-04-01 21:36:54', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2246', '1', '1.00', '2018-04-01 21:36:59', '2018-04-01 21:36:59', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2247', '1', '1.00', '2018-04-01 21:38:27', '2018-04-01 21:38:27', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2248', '1', '1.00', '2018-04-01 21:38:32', '2018-04-01 21:38:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2249', '1', '1.00', '2018-04-01 21:38:40', '2018-04-01 21:38:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2250', '1', '1.00', '2018-04-01 22:27:05', '2018-04-01 22:27:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2251', '1', '1.00', '2018-04-02 16:54:28', '2018-04-02 16:54:28', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2252', '1', '1.00', '2018-04-02 16:54:33', '2018-04-02 16:54:33', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2253', '1', '1.00', '2018-04-02 16:54:38', '2018-04-02 16:54:38', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2254', '1', '1.00', '2018-04-02 16:54:43', '2018-04-02 16:54:43', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2255', '1', '1.00', '2018-04-02 16:54:48', '2018-04-02 16:54:48', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2256', '1', '1.00', '2018-04-02 16:54:53', '2018-04-02 16:54:53', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2257', '1', '1.00', '2018-04-02 22:54:30', '2018-04-02 22:54:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2258', '1', '1.00', '2018-04-02 22:54:35', '2018-04-02 22:54:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2259', '1', '1.00', '2018-04-02 22:54:40', '2018-04-02 22:54:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2260', '1', '1.00', '2018-04-02 22:55:28', '2018-04-02 22:55:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2261', '1', '1.00', '2018-04-02 22:55:33', '2018-04-02 22:55:33', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2262', '1', '1.00', '2018-04-02 22:59:03', '2018-04-02 22:59:03', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2263', '1', '1.00', '2018-04-02 23:03:41', '2018-04-02 23:03:41', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2264', '1', '1.00', '2018-04-02 23:03:46', '2018-04-02 23:03:46', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2265', '1', '1.00', '2018-04-02 23:10:29', '2018-04-02 23:10:29', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2266', '1', '1.00', '2018-04-02 23:10:34', '2018-04-02 23:10:34', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2267', '1', '1.00', '2018-04-02 23:10:39', '2018-04-02 23:10:39', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2268', '1', '1.00', '2018-04-02 23:10:44', '2018-04-02 23:10:44', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2269', '1', '1.00', '2018-04-03 09:06:38', '2018-04-03 09:06:38', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2270', '1', '1.00', '2018-04-03 09:13:48', '2018-04-03 09:13:48', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2271', '1', '1.00', '2018-04-03 09:13:53', '2018-04-03 09:13:53', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2272', '1', '1.00', '2018-04-03 09:13:58', '2018-04-03 09:13:58', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2273', '1', '1.00', '2018-04-03 10:16:12', '2018-04-03 10:16:12', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2274', '1', '1.00', '2018-04-03 10:16:17', '2018-04-03 10:16:17', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2275', '1', '1.00', '2018-04-03 10:16:22', '2018-04-03 10:16:22', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2276', '1', '1.00', '2018-04-03 10:16:27', '2018-04-03 10:16:27', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2277', '1', '1.00', '2018-04-03 10:16:32', '2018-04-03 10:16:32', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2278', '1', '1.00', '2018-04-03 10:16:37', '2018-04-03 10:16:37', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2279', '1', '1.00', '2018-04-03 10:16:42', '2018-04-03 10:16:42', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2280', '1', '1.00', '2018-04-03 10:16:47', '2018-04-03 10:16:47', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2281', '1', '1.00', '2018-04-03 10:16:52', '2018-04-03 10:16:52', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2282', '1', '1.00', '2018-04-03 10:16:57', '2018-04-03 10:16:57', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2283', '1', '1.00', '2018-04-03 10:17:02', '2018-04-03 10:17:02', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2284', '1', '1.00', '2018-04-03 10:17:07', '2018-04-03 10:17:07', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2285', '1', '1.00', '2018-04-03 10:17:12', '2018-04-03 10:17:12', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2286', '1', '1.00', '2018-04-03 10:20:18', '2018-04-03 10:20:18', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2287', '1', '1.00', '2018-04-03 10:20:23', '2018-04-03 10:20:23', '1019');
INSERT INTO `integral_detail_tb` VALUES ('2288', '1', '1.00', '2018-04-03 10:24:58', '2018-04-03 10:24:58', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2289', '1', '1.00', '2018-04-03 10:25:04', '2018-04-03 10:25:04', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2290', '1', '1.00', '2018-04-03 10:25:09', '2018-04-03 10:25:09', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2291', '1', '1.00', '2018-04-03 10:25:14', '2018-04-03 10:25:14', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2292', '1', '1.00', '2018-04-03 10:25:19', '2018-04-03 10:25:19', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2293', '1', '1.00', '2018-04-03 10:25:24', '2018-04-03 10:25:24', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2294', '1', '1.00', '2018-04-03 10:25:29', '2018-04-03 10:25:29', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2295', '1', '1.00', '2018-04-03 10:25:34', '2018-04-03 10:25:34', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2296', '1', '1.00', '2018-04-03 10:25:39', '2018-04-03 10:25:39', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2297', '1', '1.00', '2018-04-03 10:25:44', '2018-04-03 10:25:44', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2298', '1', '1.00', '2018-04-03 10:25:49', '2018-04-03 10:25:49', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2299', '1', '1.00', '2018-04-03 10:25:54', '2018-04-03 10:25:54', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2300', '1', '1.00', '2018-04-03 10:25:59', '2018-04-03 10:25:59', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2301', '1', '1.00', '2018-04-03 10:26:04', '2018-04-03 10:26:04', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2302', '1', '1.00', '2018-04-03 10:26:09', '2018-04-03 10:26:09', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2303', '1', '1.00', '2018-04-03 10:26:14', '2018-04-03 10:26:14', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2304', '1', '1.00', '2018-04-03 10:26:19', '2018-04-03 10:26:19', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2305', '1', '1.00', '2018-04-03 10:26:24', '2018-04-03 10:26:24', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2306', '1', '1.00', '2018-04-03 10:26:29', '2018-04-03 10:26:29', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2307', '1', '1.00', '2018-04-03 10:26:34', '2018-04-03 10:26:34', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2308', '1', '1.00', '2018-04-03 10:26:39', '2018-04-03 10:26:39', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2309', '1', '1.00', '2018-04-03 10:26:44', '2018-04-03 10:26:44', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2310', '1', '1.00', '2018-04-03 10:26:49', '2018-04-03 10:26:49', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2311', '1', '1.00', '2018-04-03 10:26:54', '2018-04-03 10:26:54', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2312', '1', '1.00', '2018-04-03 10:26:59', '2018-04-03 10:26:59', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2313', '1', '1.00', '2018-04-03 10:27:04', '2018-04-03 10:27:04', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2314', '1', '1.00', '2018-04-03 10:27:09', '2018-04-03 10:27:09', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2315', '1', '1.00', '2018-04-03 10:27:14', '2018-04-03 10:27:14', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2316', '1', '1.00', '2018-04-03 10:27:19', '2018-04-03 10:27:19', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2317', '1', '1.00', '2018-04-03 10:27:24', '2018-04-03 10:27:24', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2318', '1', '1.00', '2018-04-03 10:27:29', '2018-04-03 10:27:29', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2319', '1', '1.00', '2018-04-03 10:27:34', '2018-04-03 10:27:34', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2320', '1', '1.00', '2018-04-03 10:27:39', '2018-04-03 10:27:39', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2321', '1', '1.00', '2018-04-03 10:27:44', '2018-04-03 10:27:44', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2322', '1', '1.00', '2018-04-03 10:27:49', '2018-04-03 10:27:49', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2323', '1', '1.00', '2018-04-03 10:27:54', '2018-04-03 10:27:54', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2324', '1', '1.00', '2018-04-03 10:27:59', '2018-04-03 10:27:59', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2325', '1', '1.00', '2018-04-03 10:28:04', '2018-04-03 10:28:04', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2326', '1', '1.00', '2018-04-03 10:28:09', '2018-04-03 10:28:09', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2327', '1', '1.00', '2018-04-03 10:28:14', '2018-04-03 10:28:14', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2328', '1', '1.00', '2018-04-03 10:28:19', '2018-04-03 10:28:19', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2329', '1', '1.00', '2018-04-03 10:28:24', '2018-04-03 10:28:24', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2330', '1', '1.00', '2018-04-03 10:28:29', '2018-04-03 10:28:29', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2331', '1', '1.00', '2018-04-03 10:28:34', '2018-04-03 10:28:34', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2332', '1', '1.00', '2018-04-03 10:28:39', '2018-04-03 10:28:39', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2333', '1', '1.00', '2018-04-03 10:28:44', '2018-04-03 10:28:44', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2334', '1', '1.00', '2018-04-03 10:28:49', '2018-04-03 10:28:49', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2335', '1', '1.00', '2018-04-03 10:28:54', '2018-04-03 10:28:54', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2336', '1', '1.00', '2018-04-03 10:28:59', '2018-04-03 10:28:59', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2337', '1', '1.00', '2018-04-03 10:29:04', '2018-04-03 10:29:04', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2338', '1', '1.00', '2018-04-03 10:29:09', '2018-04-03 10:29:09', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2339', '1', '1.00', '2018-04-03 10:29:14', '2018-04-03 10:29:14', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2340', '1', '1.00', '2018-04-03 10:29:19', '2018-04-03 10:29:19', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2341', '1', '1.00', '2018-04-03 10:29:24', '2018-04-03 10:29:24', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2342', '1', '1.00', '2018-04-03 10:29:29', '2018-04-03 10:29:29', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2343', '1', '1.00', '2018-04-03 10:29:34', '2018-04-03 10:29:34', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2344', '1', '1.00', '2018-04-03 10:29:39', '2018-04-03 10:29:39', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2345', '1', '1.00', '2018-04-03 10:29:44', '2018-04-03 10:29:44', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2346', '1', '1.00', '2018-04-03 10:29:49', '2018-04-03 10:29:49', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2347', '1', '1.00', '2018-04-03 10:29:54', '2018-04-03 10:29:54', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2348', '1', '1.00', '2018-04-03 10:29:59', '2018-04-03 10:29:59', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2349', '1', '1.00', '2018-04-03 10:47:20', '2018-04-03 10:47:20', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2350', '1', '1.00', '2018-04-03 10:47:31', '2018-04-03 10:47:31', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2351', '1', '1.00', '2018-04-03 10:47:35', '2018-04-03 10:47:35', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2352', '1', '1.00', '2018-04-03 10:47:40', '2018-04-03 10:47:40', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2353', '1', '1.00', '2018-04-03 10:48:05', '2018-04-03 10:48:05', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2354', '1', '1.00', '2018-04-03 10:48:07', '2018-04-03 10:48:07', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2355', '1', '1.00', '2018-04-03 11:10:38', '2018-04-03 11:10:38', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2356', '1', '1.00', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2357', '1', '1.00', '2018-04-03 11:11:01', '2018-04-03 11:11:01', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2358', '1', '1.00', '2018-04-03 11:11:04', '2018-04-03 11:11:04', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2359', '1', '1.00', '2018-04-03 11:11:08', '2018-04-03 11:11:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2360', '1', '1.00', '2018-04-03 11:11:16', '2018-04-03 11:11:16', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2361', '1', '1.00', '2018-04-03 11:11:21', '2018-04-03 11:11:21', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2362', '1', '1.00', '2018-04-03 11:11:26', '2018-04-03 11:11:26', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2363', '1', '1.00', '2018-04-03 11:11:31', '2018-04-03 11:11:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2364', '1', '1.00', '2018-04-03 11:11:59', '2018-04-03 11:11:59', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2365', '1', '1.00', '2018-04-03 11:12:04', '2018-04-03 11:12:04', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2366', '1', '1.00', '2018-04-03 11:12:09', '2018-04-03 11:12:09', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2367', '1', '1.00', '2018-04-03 11:12:14', '2018-04-03 11:12:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2368', '1', '1.00', '2018-04-03 11:12:19', '2018-04-03 11:12:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2369', '1', '1.00', '2018-04-03 11:12:24', '2018-04-03 11:12:24', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2370', '1', '1.00', '2018-04-03 11:12:29', '2018-04-03 11:12:29', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2371', '1', '1.00', '2018-04-03 11:12:35', '2018-04-03 11:12:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2372', '1', '1.00', '2018-04-03 11:12:40', '2018-04-03 11:12:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2373', '1', '1.00', '2018-04-03 11:12:45', '2018-04-03 11:12:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2374', '1', '1.00', '2018-04-03 11:12:50', '2018-04-03 11:12:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2375', '1', '1.00', '2018-04-03 11:12:55', '2018-04-03 11:12:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2376', '1', '1.00', '2018-04-03 11:13:00', '2018-04-03 11:13:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2377', '1', '1.00', '2018-04-03 11:13:05', '2018-04-03 11:13:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2378', '1', '1.00', '2018-04-03 11:13:10', '2018-04-03 11:13:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2379', '1', '1.00', '2018-04-03 11:13:15', '2018-04-03 11:13:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2380', '1', '1.00', '2018-04-03 11:13:20', '2018-04-03 11:13:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2381', '1', '1.00', '2018-04-03 11:13:25', '2018-04-03 11:13:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2382', '1', '1.00', '2018-04-03 11:13:30', '2018-04-03 11:13:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2383', '1', '1.00', '2018-04-03 11:13:35', '2018-04-03 11:13:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2384', '1', '1.00', '2018-04-03 11:13:40', '2018-04-03 11:13:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2385', '1', '1.00', '2018-04-03 11:13:45', '2018-04-03 11:13:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2386', '1', '1.00', '2018-04-03 11:13:50', '2018-04-03 11:13:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2387', '1', '1.00', '2018-04-03 11:13:55', '2018-04-03 11:13:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2388', '1', '1.00', '2018-04-03 11:14:00', '2018-04-03 11:14:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2389', '1', '1.00', '2018-04-03 11:14:05', '2018-04-03 11:14:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2390', '1', '1.00', '2018-04-03 11:14:10', '2018-04-03 11:14:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2391', '1', '1.00', '2018-04-03 11:14:15', '2018-04-03 11:14:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2392', '1', '1.00', '2018-04-03 11:14:20', '2018-04-03 11:14:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2393', '1', '1.00', '2018-04-03 11:14:25', '2018-04-03 11:14:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2394', '1', '1.00', '2018-04-03 11:14:30', '2018-04-03 11:14:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2395', '1', '1.00', '2018-04-03 11:14:35', '2018-04-03 11:14:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2396', '1', '1.00', '2018-04-03 11:14:40', '2018-04-03 11:14:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2397', '1', '1.00', '2018-04-03 11:14:45', '2018-04-03 11:14:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2398', '1', '1.00', '2018-04-03 11:14:50', '2018-04-03 11:14:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2399', '1', '1.00', '2018-04-03 11:14:55', '2018-04-03 11:14:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2400', '1', '1.00', '2018-04-03 11:15:00', '2018-04-03 11:15:00', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2401', '1', '1.00', '2018-04-03 11:15:05', '2018-04-03 11:15:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2402', '1', '1.00', '2018-04-03 11:15:10', '2018-04-03 11:15:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2403', '1', '1.00', '2018-04-03 11:15:15', '2018-04-03 11:15:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2404', '1', '1.00', '2018-04-03 11:15:35', '2018-04-03 11:15:35', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2405', '1', '1.00', '2018-04-03 11:15:36', '2018-04-03 11:15:36', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2406', '1', '1.00', '2018-04-03 11:15:39', '2018-04-03 11:15:39', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2407', '1', '1.00', '2018-04-03 11:26:51', '2018-04-03 11:26:51', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2408', '1', '1.00', '2018-04-03 11:26:56', '2018-04-03 11:26:56', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2409', '1', '1.00', '2018-04-03 11:27:01', '2018-04-03 11:27:01', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2410', '1', '1.00', '2018-04-03 11:27:06', '2018-04-03 11:27:06', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2411', '1', '1.00', '2018-04-03 11:27:11', '2018-04-03 11:27:11', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2412', '1', '1.00', '2018-04-03 11:27:16', '2018-04-03 11:27:16', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2413', '1', '1.00', '2018-04-03 11:27:21', '2018-04-03 11:27:21', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2414', '1', '1.00', '2018-04-03 13:34:39', '2018-04-03 13:34:39', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2415', '1', '1.00', '2018-04-03 13:34:44', '2018-04-03 13:34:44', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2416', '1', '1.00', '2018-04-03 13:34:49', '2018-04-03 13:34:49', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2417', '1', '1.00', '2018-04-03 13:34:54', '2018-04-03 13:34:54', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2418', '1', '1.00', '2018-04-03 13:34:59', '2018-04-03 13:34:59', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2419', '1', '1.00', '2018-04-03 13:35:04', '2018-04-03 13:35:04', '1023');
INSERT INTO `integral_detail_tb` VALUES ('2420', '1', '1.00', '2018-04-05 23:13:05', '2018-04-05 23:13:05', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2421', '1', '1.00', '2018-04-07 10:24:05', '2018-04-07 10:24:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2422', '1', '1.00', '2018-04-07 10:24:10', '2018-04-07 10:24:10', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2423', '1', '1.00', '2018-04-07 10:24:15', '2018-04-07 10:24:15', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2424', '1', '1.00', '2018-04-07 10:24:20', '2018-04-07 10:24:20', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2425', '1', '1.00', '2018-04-07 10:24:25', '2018-04-07 10:24:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2426', '1', '1.00', '2018-04-07 10:24:30', '2018-04-07 10:24:30', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2427', '1', '1.00', '2018-04-07 10:24:35', '2018-04-07 10:24:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2428', '1', '1.00', '2018-04-07 10:24:40', '2018-04-07 10:24:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2429', '1', '1.00', '2018-04-07 10:24:45', '2018-04-07 10:24:45', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2430', '1', '1.00', '2018-04-07 10:24:50', '2018-04-07 10:24:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2431', '1', '1.00', '2018-04-08 17:49:24', '2018-04-08 17:49:24', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2432', '1', '1.00', '2018-04-08 21:20:19', '2018-04-08 21:20:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2433', '1', '1.00', '2018-04-08 21:20:24', '2018-04-08 21:20:24', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2434', '1', '1.00', '2018-04-08 21:20:29', '2018-04-08 21:20:29', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2435', '1', '1.00', '2018-04-08 21:20:34', '2018-04-08 21:20:34', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2436', '1', '1.00', '2018-04-08 21:20:39', '2018-04-08 21:20:39', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2437', '1', '1.00', '2018-04-08 21:20:44', '2018-04-08 21:20:44', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2438', '1', '1.00', '2018-04-08 21:20:49', '2018-04-08 21:20:49', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2439', '1', '1.00', '2018-04-08 21:20:54', '2018-04-08 21:20:54', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2440', '1', '1.00', '2018-04-08 21:20:59', '2018-04-08 21:20:59', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2441', '1', '1.00', '2018-04-08 21:21:04', '2018-04-08 21:21:04', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2442', '1', '1.00', '2018-04-08 21:21:09', '2018-04-08 21:21:09', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2443', '1', '1.00', '2018-04-08 21:21:14', '2018-04-08 21:21:14', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2444', '1', '1.00', '2018-04-08 21:21:19', '2018-04-08 21:21:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2445', '1', '1.00', '2018-04-08 21:21:24', '2018-04-08 21:21:24', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2446', '1', '1.00', '2018-04-08 21:21:34', '2018-04-08 21:21:34', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2447', '1', '1.00', '2018-04-08 21:21:38', '2018-04-08 21:21:38', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2448', '1', '1.00', '2018-04-08 21:21:43', '2018-04-08 21:21:43', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2449', '1', '1.00', '2018-04-08 21:21:48', '2018-04-08 21:21:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2450', '1', '1.00', '2018-04-08 21:21:53', '2018-04-08 21:21:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2451', '1', '1.00', '2018-04-08 21:21:58', '2018-04-08 21:21:58', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2452', '1', '1.00', '2018-04-08 21:22:03', '2018-04-08 21:22:03', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2453', '1', '1.00', '2018-04-08 21:22:08', '2018-04-08 21:22:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2454', '1', '1.00', '2018-04-08 21:22:13', '2018-04-08 21:22:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2455', '1', '1.00', '2018-04-08 21:22:19', '2018-04-08 21:22:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2456', '1', '1.00', '2018-04-08 21:28:15', '2018-04-08 21:28:15', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2457', '1', '1.00', '2018-04-08 21:28:20', '2018-04-08 21:28:20', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2458', '1', '1.00', '2018-04-08 21:28:25', '2018-04-08 21:28:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2459', '1', '1.00', '2018-04-08 21:28:30', '2018-04-08 21:28:30', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2460', '1', '1.00', '2018-04-08 21:28:35', '2018-04-08 21:28:35', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2461', '1', '1.00', '2018-04-08 21:28:40', '2018-04-08 21:28:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2462', '1', '1.00', '2018-04-08 21:28:45', '2018-04-08 21:28:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2463', '1', '1.00', '2018-04-08 21:28:50', '2018-04-08 21:28:50', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2464', '1', '1.00', '2018-04-08 21:28:55', '2018-04-08 21:28:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2465', '1', '1.00', '2018-04-08 21:29:00', '2018-04-08 21:29:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2466', '1', '1.00', '2018-04-08 21:29:05', '2018-04-08 21:29:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2467', '1', '1.00', '2018-04-08 21:29:10', '2018-04-08 21:29:10', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2468', '1', '1.00', '2018-04-08 21:29:15', '2018-04-08 21:29:15', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2469', '1', '1.00', '2018-04-08 21:29:20', '2018-04-08 21:29:20', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2470', '1', '1.00', '2018-04-08 21:29:25', '2018-04-08 21:29:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2471', '1', '1.00', '2018-04-08 21:29:30', '2018-04-08 21:29:30', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2472', '1', '1.00', '2018-04-08 21:29:35', '2018-04-08 21:29:35', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2473', '1', '1.00', '2018-04-08 21:29:40', '2018-04-08 21:29:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2474', '1', '1.00', '2018-04-08 21:29:45', '2018-04-08 21:29:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2475', '1', '1.00', '2018-04-08 21:29:50', '2018-04-08 21:29:50', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2476', '1', '1.00', '2018-04-08 21:29:55', '2018-04-08 21:29:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2477', '1', '1.00', '2018-04-08 21:30:00', '2018-04-08 21:30:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2478', '1', '1.00', '2018-04-08 21:30:16', '2018-04-08 21:30:16', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2479', '1', '1.00', '2018-04-08 21:30:21', '2018-04-08 21:30:21', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2480', '1', '1.00', '2018-04-11 10:28:53', '2018-04-11 10:28:53', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2481', '1', '1.00', '2018-04-11 10:28:56', '2018-04-11 10:28:56', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2482', '1', '1.00', '2018-04-11 10:29:05', '2018-04-11 10:29:05', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2483', '1', '1.00', '2018-04-11 10:29:11', '2018-04-11 10:29:11', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2484', '1', '1.00', '2018-04-11 10:29:27', '2018-04-11 10:29:27', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2485', '1', '1.00', '2018-04-11 10:30:14', '2018-04-11 10:30:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2486', '1', '1.00', '2018-04-11 10:30:25', '2018-04-11 10:30:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2487', '1', '1.00', '2018-04-11 19:46:49', '2018-04-11 19:46:49', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2488', '1', '1.00', '2018-04-11 19:50:52', '2018-04-11 19:50:52', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2489', '1', '1.00', '2018-04-11 21:15:18', '2018-04-11 21:15:18', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2490', '1', '1.00', '2018-04-11 21:18:24', '2018-04-11 21:18:24', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2491', '1', '1.00', '2018-04-11 21:18:53', '2018-04-11 21:18:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2492', '1', '1.00', '2018-04-11 21:19:01', '2018-04-11 21:19:01', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2493', '1', '1.00', '2018-04-11 21:32:29', '2018-04-11 21:32:29', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2494', '1', '1.00', '2018-04-12 10:35:22', '2018-04-12 10:35:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2495', '1', '1.00', '2018-04-12 14:11:20', '2018-04-12 14:11:20', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2496', '1', '1.00', '2018-04-12 14:11:29', '2018-04-12 14:11:29', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2497', '1', '1.00', '2018-04-12 14:11:51', '2018-04-12 14:11:51', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2498', '1', '1.00', '2018-04-12 14:34:32', '2018-04-12 14:34:32', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2499', '1', '1.00', '2018-04-12 14:54:49', '2018-04-12 14:54:49', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2500', '1', '1.00', '2018-04-12 14:54:53', '2018-04-12 14:54:53', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2501', '1', '1.00', '2018-04-12 14:55:17', '2018-04-12 14:55:17', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2502', '1', '1.00', '2018-04-12 14:56:00', '2018-04-12 14:56:00', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2503', '1', '1.00', '2018-04-13 11:12:58', '2018-04-13 11:12:58', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2504', '1', '1.00', '2018-04-13 11:13:03', '2018-04-13 11:13:03', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2505', '1', '1.00', '2018-04-13 11:13:08', '2018-04-13 11:13:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2506', '1', '1.00', '2018-04-13 11:13:40', '2018-04-13 11:13:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2507', '1', '1.00', '2018-04-13 11:13:45', '2018-04-13 11:13:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2508', '1', '1.00', '2018-04-13 11:13:49', '2018-04-13 11:13:49', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2509', '1', '1.00', '2018-04-13 11:13:53', '2018-04-13 11:13:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2510', '1', '1.00', '2018-04-17 14:38:57', '2018-04-17 14:38:57', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2511', '1', '1.00', '2018-04-17 14:39:02', '2018-04-17 14:39:02', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2512', '1', '1.00', '2018-04-17 14:39:05', '2018-04-17 14:39:05', '1021');
INSERT INTO `integral_detail_tb` VALUES ('2513', '1', '1.00', '2018-04-17 14:39:07', '2018-04-17 14:39:07', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2514', '1', '1.00', '2018-04-17 14:39:12', '2018-04-17 14:39:12', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2515', '1', '1.00', '2018-04-17 14:39:17', '2018-04-17 14:39:17', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2516', '1', '1.00', '2018-04-17 14:39:22', '2018-04-17 14:39:22', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2517', '1', '1.00', '2018-04-17 14:39:27', '2018-04-17 14:39:27', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2518', '1', '1.00', '2018-04-17 14:39:32', '2018-04-17 14:39:32', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2519', '1', '1.00', '2018-04-17 16:47:02', '2018-04-17 16:47:02', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2520', '1', '1.00', '2018-04-17 16:47:07', '2018-04-17 16:47:07', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2521', '1', '1.00', '2018-04-17 16:47:12', '2018-04-17 16:47:12', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2522', '1', '1.00', '2018-04-17 16:47:14', '2018-04-17 16:47:14', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2523', '1', '1.00', '2018-04-17 16:47:19', '2018-04-17 16:47:19', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2524', '1', '1.00', '2018-04-17 16:47:25', '2018-04-17 16:47:25', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2525', '1', '1.00', '2018-04-17 16:47:30', '2018-04-17 16:47:30', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2526', '1', '1.00', '2018-04-17 16:47:35', '2018-04-17 16:47:35', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2527', '1', '1.00', '2018-04-17 16:47:40', '2018-04-17 16:47:40', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2528', '1', '1.00', '2018-04-17 16:47:45', '2018-04-17 16:47:45', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2529', '1', '1.00', '2018-04-17 16:47:50', '2018-04-17 16:47:50', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2530', '1', '1.00', '2018-04-17 16:47:55', '2018-04-17 16:47:55', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2531', '1', '1.00', '2018-04-17 16:48:00', '2018-04-17 16:48:00', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2532', '1', '1.00', '2018-04-17 16:48:05', '2018-04-17 16:48:05', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2533', '1', '1.00', '2018-04-17 16:48:10', '2018-04-17 16:48:10', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2534', '1', '1.00', '2018-04-17 16:48:15', '2018-04-17 16:48:15', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2535', '1', '1.00', '2018-04-17 16:48:20', '2018-04-17 16:48:20', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2536', '1', '1.00', '2018-04-17 16:48:25', '2018-04-17 16:48:25', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2537', '1', '1.00', '2018-04-17 16:48:30', '2018-04-17 16:48:30', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2538', '1', '1.00', '2018-04-17 16:48:35', '2018-04-17 16:48:35', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2539', '1', '1.00', '2018-04-17 16:48:40', '2018-04-17 16:48:40', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2540', '1', '1.00', '2018-04-17 16:48:45', '2018-04-17 16:48:45', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2541', '1', '1.00', '2018-04-17 16:48:50', '2018-04-17 16:48:50', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2542', '1', '1.00', '2018-04-17 16:48:55', '2018-04-17 16:48:55', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2543', '1', '1.00', '2018-04-17 16:49:00', '2018-04-17 16:49:00', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2544', '1', '1.00', '2018-04-17 16:49:35', '2018-04-17 16:49:35', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2545', '1', '1.00', '2018-04-17 16:52:32', '2018-04-17 16:52:32', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2546', '1', '1.00', '2018-04-17 16:54:11', '2018-04-17 16:54:11', '1017');
INSERT INTO `integral_detail_tb` VALUES ('2547', '1', '1.00', '2018-04-17 17:06:53', '2018-04-17 17:06:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2548', '1', '1.00', '2018-04-17 17:06:58', '2018-04-17 17:06:58', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2549', '1', '1.00', '2018-04-17 17:07:05', '2018-04-17 17:07:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2550', '1', '1.00', '2018-04-17 17:07:10', '2018-04-17 17:07:10', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2551', '1', '1.00', '2018-04-17 17:07:12', '2018-04-17 17:07:12', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2552', '1', '1.00', '2018-04-17 17:07:17', '2018-04-17 17:07:17', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2553', '1', '1.00', '2018-04-17 17:41:41', '2018-04-17 17:41:41', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2554', '1', '1.00', '2018-04-17 17:41:56', '2018-04-17 17:41:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2555', '1', '1.00', '2018-04-17 17:41:59', '2018-04-17 17:41:59', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2556', '1', '1.00', '2018-04-17 17:42:02', '2018-04-17 17:42:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2557', '1', '1.00', '2018-04-17 17:42:07', '2018-04-17 17:42:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2558', '1', '1.00', '2018-04-17 17:42:12', '2018-04-17 17:42:12', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2559', '1', '1.00', '2018-04-17 17:42:17', '2018-04-17 17:42:17', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2560', '1', '1.00', '2018-04-17 17:42:28', '2018-04-17 17:42:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2561', '1', '1.00', '2018-04-17 17:42:33', '2018-04-17 17:42:33', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2562', '1', '1.00', '2018-04-17 17:42:38', '2018-04-17 17:42:38', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2563', '1', '1.00', '2018-04-17 17:42:43', '2018-04-17 17:42:43', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2564', '1', '1.00', '2018-04-17 17:42:48', '2018-04-17 17:42:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2565', '1', '1.00', '2018-04-17 17:42:53', '2018-04-17 17:42:53', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2566', '1', '1.00', '2018-04-17 17:42:58', '2018-04-17 17:42:58', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2567', '1', '1.00', '2018-04-17 17:43:03', '2018-04-17 17:43:03', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2568', '1', '1.00', '2018-04-17 17:43:08', '2018-04-17 17:43:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2569', '1', '1.00', '2018-04-17 17:43:13', '2018-04-17 17:43:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2570', '1', '1.00', '2018-04-17 17:43:18', '2018-04-17 17:43:18', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2571', '1', '1.00', '2018-04-17 17:47:20', '2018-04-17 17:47:20', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2572', '1', '1.00', '2018-04-17 17:47:25', '2018-04-17 17:47:25', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2573', '1', '1.00', '2018-04-17 17:47:30', '2018-04-17 17:47:30', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2574', '1', '1.00', '2018-04-17 17:47:35', '2018-04-17 17:47:35', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2575', '1', '1.00', '2018-04-17 17:47:40', '2018-04-17 17:47:40', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2576', '1', '1.00', '2018-04-17 17:47:45', '2018-04-17 17:47:45', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2577', '1', '1.00', '2018-04-17 17:47:50', '2018-04-17 17:47:50', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2578', '1', '1.00', '2018-04-17 17:47:55', '2018-04-17 17:47:55', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2579', '1', '1.00', '2018-04-17 17:48:00', '2018-04-17 17:48:00', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2580', '1', '1.00', '2018-04-17 17:48:05', '2018-04-17 17:48:05', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2581', '1', '1.00', '2018-04-17 17:48:10', '2018-04-17 17:48:10', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2582', '1', '1.00', '2018-04-17 17:48:55', '2018-04-17 17:48:55', '1015');
INSERT INTO `integral_detail_tb` VALUES ('2583', '1', '1.00', '2018-04-17 17:50:02', '2018-04-17 17:50:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2584', '1', '1.00', '2018-04-17 17:50:06', '2018-04-17 17:50:06', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2585', '1', '1.00', '2018-04-17 17:50:11', '2018-04-17 17:50:11', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2586', '1', '1.00', '2018-04-17 18:00:06', '2018-04-17 18:00:06', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2587', '1', '1.00', '2018-04-17 18:00:08', '2018-04-17 18:00:08', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2588', '1', '1.00', '2018-04-22 15:14:42', '2018-04-22 15:14:42', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2589', '1', '1.00', '2018-04-22 15:14:47', '2018-04-22 15:14:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2590', '1', '1.00', '2018-05-01 14:43:18', '2018-05-01 14:43:18', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2591', '1', '1.00', '2018-05-01 15:17:11', '2018-05-01 15:17:11', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2592', '1', '1.00', '2018-05-01 15:18:05', '2018-05-01 15:18:05', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2593', '1', '1.00', '2018-05-01 16:20:55', '2018-05-01 16:20:55', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2594', '1', '1.00', '2018-05-01 16:21:22', '2018-05-01 16:21:22', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2595', '1', '1.00', '2018-05-01 16:21:47', '2018-05-01 16:21:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2596', '1', '1.00', '2018-05-01 16:43:37', '2018-05-01 16:43:37', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2597', '1', '1.00', '2018-05-01 16:45:02', '2018-05-01 16:45:02', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2598', '1', '1.00', '2018-05-01 16:52:50', '2018-05-01 16:52:50', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2599', '1', '1.00', '2018-05-06 12:35:41', '2018-05-06 12:35:41', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2600', '1', '1.00', '2018-05-06 13:15:42', '2018-05-06 13:15:42', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2601', '1', '1.00', '2018-05-06 14:11:00', '2018-05-06 14:11:00', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2602', '1', '1.00', '2018-05-06 14:11:36', '2018-05-06 14:11:36', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2603', '1', '1.00', '2018-05-06 14:15:12', '2018-05-06 14:15:12', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2604', '1', '1.00', '2018-05-06 14:15:36', '2018-05-06 14:15:36', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2605', '1', '1.00', '2018-05-06 14:28:59', '2018-05-06 14:28:59', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2606', '1', '1.00', '2018-05-07 13:54:15', '2018-05-07 13:54:15', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2607', '1', '1.00', '2018-05-07 13:54:27', '2018-05-07 13:54:27', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2608', '1', '1.00', '2018-05-07 13:54:31', '2018-05-07 13:54:31', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2609', '1', '1.00', '2018-05-07 13:55:20', '2018-05-07 13:55:20', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2610', '1', '1.00', '2018-05-07 13:55:32', '2018-05-07 13:55:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2611', '1', '1.00', '2018-05-07 13:55:52', '2018-05-07 13:55:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2612', '1', '1.00', '2018-05-07 14:08:50', '2018-05-07 14:08:50', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2613', '1', '1.00', '2018-05-07 14:08:55', '2018-05-07 14:08:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2614', '1', '1.00', '2018-05-07 14:09:00', '2018-05-07 14:09:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2615', '1', '1.00', '2018-05-07 14:09:04', '2018-05-07 14:09:04', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2616', '1', '1.00', '2018-05-07 14:09:07', '2018-05-07 14:09:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2617', '1', '1.00', '2018-05-07 14:15:00', '2018-05-07 14:15:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2618', '1', '1.00', '2018-05-07 14:16:58', '2018-05-07 14:16:58', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2619', '1', '1.00', '2018-05-07 14:17:01', '2018-05-07 14:17:01', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2620', '1', '1.00', '2018-05-07 23:11:56', '2018-05-07 23:11:56', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2621', '1', '1.00', '2018-05-07 23:13:18', '2018-05-07 23:13:18', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2622', '1', '1.00', '2018-05-08 08:39:06', '2018-05-08 08:39:06', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2623', '1', '1.00', '2018-05-08 08:39:50', '2018-05-08 08:39:50', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2624', '1', '1.00', '2018-05-08 22:42:13', '2018-05-08 22:42:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2625', '1', '1.00', '2018-05-08 22:44:49', '2018-05-08 22:44:49', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2626', '1', '1.00', '2018-05-08 22:45:48', '2018-05-08 22:45:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2627', '1', '1.00', '2018-05-08 22:46:49', '2018-05-08 22:46:49', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2628', '1', '1.00', '2018-05-08 22:47:48', '2018-05-08 22:47:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2629', '1', '1.00', '2018-05-08 22:48:48', '2018-05-08 22:48:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2630', '1', '1.00', '2018-05-08 22:49:48', '2018-05-08 22:49:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2631', '1', '1.00', '2018-05-08 22:50:48', '2018-05-08 22:50:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2632', '1', '1.00', '2018-05-08 22:51:42', '2018-05-08 22:51:42', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2633', '1', '1.00', '2018-05-13 13:40:39', '2018-05-13 13:40:39', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2634', '1', '1.00', '2018-05-13 13:45:02', '2018-05-13 13:45:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2635', '1', '1.00', '2018-05-13 13:46:12', '2018-05-13 13:46:12', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2636', '1', '1.00', '2018-05-13 13:48:56', '2018-05-13 13:48:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2637', '1', '1.00', '2018-05-13 13:49:56', '2018-05-13 13:49:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2638', '1', '1.00', '2018-05-13 13:50:56', '2018-05-13 13:50:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2639', '1', '1.00', '2018-05-13 14:47:16', '2018-05-13 14:47:16', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2640', '1', '1.00', '2018-05-13 14:50:29', '2018-05-13 14:50:29', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2641', '1', '1.00', '2018-05-13 14:50:52', '2018-05-13 14:50:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2642', '1', '1.00', '2018-05-13 14:52:08', '2018-05-13 14:52:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2643', '1', '1.00', '2018-05-13 15:02:22', '2018-05-13 15:02:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2644', '1', '1.00', '2018-05-15 00:04:45', '2018-05-15 00:04:45', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2645', '1', '1.00', '2018-05-15 00:05:46', '2018-05-15 00:05:46', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2646', '1', '1.00', '2018-05-15 00:06:46', '2018-05-15 00:06:46', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2647', '1', '1.00', '2018-05-15 00:07:45', '2018-05-15 00:07:45', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2648', '1', '1.00', '2018-05-15 00:08:46', '2018-05-15 00:08:46', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2649', '1', '1.00', '2018-05-15 00:09:45', '2018-05-15 00:09:45', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2650', '1', '1.00', '2018-05-15 00:10:47', '2018-05-15 00:10:47', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2651', '1', '1.00', '2018-05-15 00:11:45', '2018-05-15 00:11:45', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2652', '1', '1.00', '2018-05-15 00:15:20', '2018-05-15 00:15:20', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2653', '1', '1.00', '2018-05-15 00:17:00', '2018-05-15 00:17:00', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2654', '1', '1.00', '2018-05-15 00:18:00', '2018-05-15 00:18:00', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2655', '1', '1.00', '2018-05-15 00:19:00', '2018-05-15 00:19:00', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2656', '1', '1.00', '2018-05-15 13:03:37', '2018-05-15 13:03:37', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2657', '1', '1.00', '2018-05-15 13:04:36', '2018-05-15 13:04:36', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2658', '1', '1.00', '2018-05-15 13:05:56', '2018-05-15 13:05:56', '1010');
INSERT INTO `integral_detail_tb` VALUES ('2659', '1', '1.00', '2018-05-23 22:29:08', '2018-05-23 22:29:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2660', '1', '1.00', '2018-05-23 22:29:13', '2018-05-23 22:29:13', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2661', '1', '1.00', '2018-05-23 22:29:18', '2018-05-23 22:29:18', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2662', '1', '1.00', '2018-05-23 22:29:23', '2018-05-23 22:29:23', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2663', '1', '1.00', '2018-05-23 22:29:28', '2018-05-23 22:29:28', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2664', '1', '1.00', '2018-05-23 22:29:33', '2018-05-23 22:29:33', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2665', '1', '1.00', '2018-05-23 22:30:25', '2018-05-23 22:30:25', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2666', '1', '1.00', '2018-05-23 22:30:31', '2018-05-23 22:30:31', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2667', '1', '1.00', '2018-05-23 22:30:36', '2018-05-23 22:30:36', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2668', '1', '1.00', '2018-05-23 22:30:38', '2018-05-23 22:30:38', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2669', '1', '1.00', '2018-05-23 22:30:40', '2018-05-23 22:30:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2670', '1', '1.00', '2018-05-23 22:30:46', '2018-05-23 22:30:46', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2671', '1', '1.00', '2018-05-23 22:30:49', '2018-05-23 22:30:49', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2672', '1', '1.00', '2018-05-29 18:08:39', '2018-05-29 18:08:39', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2673', '1', '1.00', '2018-05-30 16:37:25', '2018-05-30 16:37:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2674', '1', '1.00', '2018-05-31 11:34:47', '2018-05-31 11:34:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2675', '1', '1.00', '2018-05-31 14:27:40', '2018-05-31 14:27:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2676', '1', '1.00', '2018-05-31 14:27:45', '2018-05-31 14:27:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2677', '1', '1.00', '2018-05-31 14:27:50', '2018-05-31 14:27:50', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2678', '1', '1.00', '2018-05-31 14:27:55', '2018-05-31 14:27:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2679', '1', '1.00', '2018-05-31 14:28:00', '2018-05-31 14:28:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2680', '1', '1.00', '2018-05-31 14:28:05', '2018-05-31 14:28:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2681', '1', '1.00', '2018-05-31 14:28:10', '2018-05-31 14:28:10', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2682', '1', '1.00', '2018-05-31 14:28:15', '2018-05-31 14:28:15', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2683', '1', '1.00', '2018-05-31 14:28:20', '2018-05-31 14:28:20', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2684', '1', '1.00', '2018-05-31 14:28:25', '2018-05-31 14:28:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2685', '1', '1.00', '2018-05-31 14:28:40', '2018-05-31 14:28:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2686', '1', '1.00', '2018-05-31 14:28:45', '2018-05-31 14:28:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2687', '1', '1.00', '2018-05-31 14:28:50', '2018-05-31 14:28:50', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2688', '1', '1.00', '2018-05-31 14:28:55', '2018-05-31 14:28:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2689', '1', '1.00', '2018-05-31 14:29:00', '2018-05-31 14:29:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2690', '1', '1.00', '2018-05-31 14:29:05', '2018-05-31 14:29:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2691', '1', '1.00', '2018-05-31 14:29:10', '2018-05-31 14:29:10', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2692', '1', '1.00', '2018-05-31 14:29:15', '2018-05-31 14:29:15', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2693', '1', '1.00', '2018-05-31 14:29:20', '2018-05-31 14:29:20', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2694', '1', '1.00', '2018-05-31 14:29:25', '2018-05-31 14:29:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2695', '1', '1.00', '2018-05-31 14:29:30', '2018-05-31 14:29:30', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2696', '1', '1.00', '2018-05-31 14:29:35', '2018-05-31 14:29:35', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2697', '1', '1.00', '2018-05-31 16:42:54', '2018-05-31 16:42:54', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2698', '1', '1.00', '2018-05-31 17:03:12', '2018-05-31 17:03:12', '1038');
INSERT INTO `integral_detail_tb` VALUES ('2699', '1', '1.00', '2018-05-31 17:03:18', '2018-05-31 17:03:18', '1038');
INSERT INTO `integral_detail_tb` VALUES ('2700', '1', '1.00', '2018-05-31 17:03:19', '2018-05-31 17:03:19', '1038');
INSERT INTO `integral_detail_tb` VALUES ('2701', '1', '1.00', '2018-05-31 17:03:20', '2018-05-31 17:03:20', '1038');
INSERT INTO `integral_detail_tb` VALUES ('2702', '1', '1.00', '2018-06-05 11:19:43', '2018-06-05 11:19:43', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2703', '1', '1.00', '2018-06-05 18:10:19', '2018-06-05 18:10:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2704', '1', '1.00', '2018-06-08 13:41:48', '2018-06-08 13:41:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2705', '1', '1.00', '2018-06-08 13:41:56', '2018-06-08 13:41:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2706', '1', '1.00', '2018-06-08 13:44:56', '2018-06-08 13:44:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2707', '1', '1.00', '2018-06-08 17:44:26', '2018-06-08 17:44:26', '1038');
INSERT INTO `integral_detail_tb` VALUES ('2708', '1', '1.00', '2018-06-12 16:14:14', '2018-06-12 16:14:14', '1038');
INSERT INTO `integral_detail_tb` VALUES ('2709', '1', '1.00', '2018-06-12 16:14:20', '2018-06-12 16:14:20', '1038');
INSERT INTO `integral_detail_tb` VALUES ('2710', '1', '1.00', '2018-06-12 16:14:23', '2018-06-12 16:14:23', '1038');
INSERT INTO `integral_detail_tb` VALUES ('2711', '1', '1.00', '2018-06-23 13:49:06', '2018-06-23 13:49:06', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2712', '1', '1.00', '2018-06-23 14:11:34', '2018-06-23 14:11:34', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2713', '1', '1.00', '2018-06-24 10:31:38', '2018-06-24 10:31:38', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2714', '1', '1.00', '2018-06-26 17:05:54', '2018-06-26 17:05:54', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2715', '1', '1.00', '2018-06-26 17:06:09', '2018-06-26 17:06:09', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2716', '1', '1.00', '2018-06-26 17:06:20', '2018-06-26 17:06:20', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2717', '1', '1.00', '2018-06-26 23:22:28', '2018-06-26 23:22:28', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2718', '1', '1.00', '2018-06-26 23:22:33', '2018-06-26 23:22:33', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2719', '1', '1.00', '2018-06-26 23:24:02', '2018-06-26 23:24:02', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2720', '1', '1.00', '2018-06-26 23:34:50', '2018-06-26 23:34:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2721', '1', '1.00', '2018-06-26 23:35:09', '2018-06-26 23:35:09', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2722', '1', '1.00', '2018-06-26 23:35:34', '2018-06-26 23:35:34', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2723', '1', '1.00', '2018-06-26 23:35:50', '2018-06-26 23:35:50', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2724', '1', '1.00', '2018-06-26 23:35:52', '2018-06-26 23:35:52', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2725', '1', '1.00', '2018-06-26 23:35:57', '2018-06-26 23:35:57', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2726', '1', '1.00', '2018-06-26 23:36:08', '2018-06-26 23:36:08', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2727', '1', '1.00', '2018-06-26 23:36:14', '2018-06-26 23:36:14', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2728', '1', '1.00', '2018-06-26 23:36:17', '2018-06-26 23:36:17', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2729', '1', '1.00', '2018-06-26 23:36:22', '2018-06-26 23:36:22', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2730', '1', '1.00', '2018-06-26 23:38:19', '2018-06-26 23:38:19', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2731', '1', '1.00', '2018-06-26 23:38:21', '2018-06-26 23:38:21', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2732', '1', '1.00', '2018-06-26 23:38:24', '2018-06-26 23:38:24', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2733', '1', '1.00', '2018-06-28 10:49:11', '2018-06-28 10:49:11', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2734', '1', '1.00', '2018-07-04 14:46:03', '2018-07-04 14:46:03', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2735', '1', '1.00', '2018-07-04 14:46:08', '2018-07-04 14:46:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2736', '1', '1.00', '2018-07-04 14:46:13', '2018-07-04 14:46:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2737', '1', '1.00', '2018-07-04 14:46:18', '2018-07-04 14:46:18', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2738', '1', '1.00', '2018-07-04 14:46:23', '2018-07-04 14:46:23', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2739', '1', '1.00', '2018-07-04 14:46:28', '2018-07-04 14:46:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2740', '1', '1.00', '2018-07-04 14:46:33', '2018-07-04 14:46:33', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2741', '1', '1.00', '2018-07-04 14:46:38', '2018-07-04 14:46:38', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2742', '1', '1.00', '2018-07-04 14:46:38', '2018-07-04 14:46:38', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2743', '1', '1.00', '2018-07-04 14:46:57', '2018-07-04 14:46:57', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2744', '1', '1.00', '2018-07-04 14:47:02', '2018-07-04 14:47:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2745', '1', '1.00', '2018-07-04 14:47:07', '2018-07-04 14:47:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2746', '1', '1.00', '2018-07-04 14:47:12', '2018-07-04 14:47:12', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2747', '1', '1.00', '2018-07-04 14:47:17', '2018-07-04 14:47:17', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2748', '1', '1.00', '2018-07-04 14:47:22', '2018-07-04 14:47:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2749', '1', '1.00', '2018-07-04 14:47:27', '2018-07-04 14:47:27', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2750', '1', '1.00', '2018-07-04 14:47:32', '2018-07-04 14:47:32', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2751', '1', '1.00', '2018-07-04 14:47:37', '2018-07-04 14:47:37', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2752', '1', '1.00', '2018-07-04 14:47:42', '2018-07-04 14:47:42', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2753', '1', '1.00', '2018-07-04 14:47:47', '2018-07-04 14:47:47', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2754', '1', '1.00', '2018-07-04 14:47:52', '2018-07-04 14:47:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2755', '1', '1.00', '2018-07-04 14:47:57', '2018-07-04 14:47:57', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2756', '1', '1.00', '2018-07-04 14:48:02', '2018-07-04 14:48:02', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2757', '1', '1.00', '2018-07-04 14:48:06', '2018-07-04 14:48:06', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2758', '1', '1.00', '2018-07-04 14:48:13', '2018-07-04 14:48:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2759', '1', '1.00', '2018-07-04 14:48:16', '2018-07-04 14:48:16', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2760', '1', '1.00', '2018-07-04 14:48:21', '2018-07-04 14:48:21', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2761', '1', '1.00', '2018-07-04 14:48:26', '2018-07-04 14:48:26', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2762', '1', '1.00', '2018-07-04 14:48:31', '2018-07-04 14:48:31', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2763', '1', '1.00', '2018-07-04 14:48:36', '2018-07-04 14:48:36', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2764', '1', '1.00', '2018-07-04 14:48:41', '2018-07-04 14:48:41', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2765', '1', '1.00', '2018-07-04 14:48:46', '2018-07-04 14:48:46', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2766', '1', '1.00', '2018-07-04 14:48:51', '2018-07-04 14:48:51', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2767', '1', '1.00', '2018-07-04 14:48:56', '2018-07-04 14:48:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2768', '1', '1.00', '2018-07-04 14:49:01', '2018-07-04 14:49:01', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2769', '1', '1.00', '2018-07-04 14:49:06', '2018-07-04 14:49:06', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2770', '1', '1.00', '2018-07-04 14:49:11', '2018-07-04 14:49:11', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2771', '1', '1.00', '2018-07-04 14:49:16', '2018-07-04 14:49:16', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2772', '1', '1.00', '2018-07-04 14:49:21', '2018-07-04 14:49:21', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2773', '1', '1.00', '2018-07-04 14:49:26', '2018-07-04 14:49:26', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2774', '1', '1.00', '2018-07-04 14:49:31', '2018-07-04 14:49:31', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2775', '1', '1.00', '2018-07-04 14:49:40', '2018-07-04 14:49:40', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2776', '1', '1.00', '2018-07-04 14:49:43', '2018-07-04 14:49:43', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2777', '1', '1.00', '2018-07-04 14:49:48', '2018-07-04 14:49:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2778', '1', '1.00', '2018-07-04 14:49:52', '2018-07-04 14:49:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2779', '1', '1.00', '2018-07-04 14:49:55', '2018-07-04 14:49:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2780', '1', '1.00', '2018-07-04 14:49:56', '2018-07-04 14:49:56', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2781', '1', '1.00', '2018-07-04 14:49:57', '2018-07-04 14:49:57', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2782', '1', '1.00', '2018-07-04 14:50:05', '2018-07-04 14:50:05', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2783', '1', '1.00', '2018-07-04 14:50:10', '2018-07-04 14:50:10', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2784', '1', '1.00', '2018-07-04 14:50:47', '2018-07-04 14:50:47', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2785', '1', '1.00', '2018-07-04 14:50:52', '2018-07-04 14:50:52', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2786', '1', '1.00', '2018-07-04 14:50:57', '2018-07-04 14:50:57', '1009');
INSERT INTO `integral_detail_tb` VALUES ('2787', '1', '1.00', '2018-07-04 16:05:18', '2018-07-04 16:05:18', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2788', '1', '1.00', '2018-07-04 16:05:47', '2018-07-04 16:05:47', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2789', '1', '1.00', '2018-07-04 16:06:34', '2018-07-04 16:06:34', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2790', '1', '1.00', '2018-07-05 15:06:14', '2018-07-05 15:06:14', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2791', '1', '1.00', '2018-07-05 15:09:50', '2018-07-05 15:09:50', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2792', '1', '1.00', '2018-07-05 15:09:59', '2018-07-05 15:09:59', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2793', '1', '1.00', '2018-07-05 15:22:36', '2018-07-05 15:22:36', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2794', '1', '1.00', '2018-07-05 15:23:11', '2018-07-05 15:23:11', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2795', '1', '1.00', '2018-07-05 15:41:26', '2018-07-05 15:41:26', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2796', '1', '1.00', '2018-07-05 15:42:25', '2018-07-05 15:42:25', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2797', '1', '1.00', '2018-07-05 15:43:25', '2018-07-05 15:43:25', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2798', '1', '1.00', '2018-07-05 17:51:06', '2018-07-05 17:51:06', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2799', '1', '1.00', '2018-07-05 17:51:23', '2018-07-05 17:51:23', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2800', '1', '1.00', '2018-07-09 10:17:56', '2018-07-09 10:17:56', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2801', '1', '1.00', '2018-07-10 18:52:50', '2018-07-10 18:52:50', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2802', '1', '1.00', '2018-07-16 18:09:08', '2018-07-16 18:09:08', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2803', '1', '1.00', '2018-07-16 18:09:13', '2018-07-16 18:09:13', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2804', '1', '1.00', '2018-07-16 18:09:38', '2018-07-16 18:09:38', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2805', '1', '1.00', '2018-07-17 09:52:10', '2018-07-17 09:52:10', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2806', '1', '1.00', '2018-07-17 10:48:45', '2018-07-17 10:48:45', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2807', '1', '1.00', '2018-07-17 10:49:44', '2018-07-17 10:49:44', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2808', '1', '1.00', '2018-07-17 10:51:24', '2018-07-17 10:51:24', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2809', '1', '1.00', '2018-07-17 10:52:23', '2018-07-17 10:52:23', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2810', '1', '1.00', '2018-07-17 10:53:23', '2018-07-17 10:53:23', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2811', '1', '1.00', '2018-07-17 10:55:04', '2018-07-17 10:55:04', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2812', '1', '1.00', '2018-07-17 10:55:11', '2018-07-17 10:55:11', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2813', '1', '1.00', '2018-07-17 10:55:28', '2018-07-17 10:55:28', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2814', '1', '1.00', '2018-07-17 10:55:45', '2018-07-17 10:55:45', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2815', '1', '1.00', '2018-07-17 10:55:52', '2018-07-17 10:55:52', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2816', '1', '1.00', '2018-07-17 13:53:33', '2018-07-17 13:53:33', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2817', '1', '1.00', '2018-07-17 13:54:53', '2018-07-17 13:54:53', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2818', '1', '1.00', '2018-07-17 17:29:27', '2018-07-17 17:29:27', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2819', '1', '1.00', '2018-07-18 09:16:02', '2018-07-18 09:16:02', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2820', '1', '1.00', '2018-07-20 14:54:25', '2018-07-20 14:54:25', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2821', '1', '1.00', '2018-07-20 15:24:01', '2018-07-20 15:24:01', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2822', '1', '1.00', '2018-07-20 15:29:36', '2018-07-20 15:29:36', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2823', '1', '1.00', '2018-07-20 15:29:41', '2018-07-20 15:29:41', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2824', '1', '1.00', '2018-07-20 15:29:46', '2018-07-20 15:29:46', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2825', '1', '1.00', '2018-07-20 15:29:51', '2018-07-20 15:29:51', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2826', '1', '1.00', '2018-07-20 15:29:56', '2018-07-20 15:29:56', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2827', '1', '1.00', '2018-07-20 15:30:01', '2018-07-20 15:30:01', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2828', '1', '1.00', '2018-07-20 15:30:06', '2018-07-20 15:30:06', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2829', '1', '1.00', '2018-07-20 15:30:11', '2018-07-20 15:30:11', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2830', '1', '1.00', '2018-07-20 15:30:16', '2018-07-20 15:30:16', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2831', '1', '1.00', '2018-07-20 15:30:21', '2018-07-20 15:30:21', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2832', '1', '1.00', '2018-07-20 15:30:26', '2018-07-20 15:30:26', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2833', '1', '1.00', '2018-07-20 15:30:31', '2018-07-20 15:30:31', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2834', '1', '1.00', '2018-07-20 15:30:36', '2018-07-20 15:30:36', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2835', '1', '1.00', '2018-07-20 15:33:20', '2018-07-20 15:33:20', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2836', '1', '1.00', '2018-07-20 15:33:30', '2018-07-20 15:33:30', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2837', '1', '1.00', '2018-07-20 15:40:14', '2018-07-20 15:40:14', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2838', '1', '1.00', '2018-07-20 15:40:26', '2018-07-20 15:40:26', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2839', '1', '1.00', '2018-07-20 16:17:20', '2018-07-20 16:17:20', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2840', '1', '1.00', '2018-07-20 16:18:19', '2018-07-20 16:18:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2841', '1', '1.00', '2018-07-20 16:19:19', '2018-07-20 16:19:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2842', '1', '1.00', '2018-07-20 16:20:19', '2018-07-20 16:20:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2843', '1', '1.00', '2018-07-20 16:21:19', '2018-07-20 16:21:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2844', '1', '1.00', '2018-07-20 16:22:19', '2018-07-20 16:22:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2845', '1', '1.00', '2018-07-20 16:23:19', '2018-07-20 16:23:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2846', '1', '1.00', '2018-07-20 16:24:19', '2018-07-20 16:24:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2847', '1', '1.00', '2018-07-20 16:25:19', '2018-07-20 16:25:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2848', '1', '1.00', '2018-07-20 16:26:19', '2018-07-20 16:26:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2849', '1', '1.00', '2018-07-20 16:27:19', '2018-07-20 16:27:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2850', '1', '1.00', '2018-07-20 16:28:19', '2018-07-20 16:28:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2851', '1', '1.00', '2018-07-20 16:31:24', '2018-07-20 16:31:24', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2852', '1', '1.00', '2018-07-20 16:31:29', '2018-07-20 16:31:29', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2853', '1', '1.00', '2018-07-20 16:33:52', '2018-07-20 16:33:52', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2854', '1', '1.00', '2018-07-20 16:33:55', '2018-07-20 16:33:55', '1042');
INSERT INTO `integral_detail_tb` VALUES ('2855', '1', '1.00', '2018-07-20 16:34:00', '2018-07-20 16:34:00', '1042');
INSERT INTO `integral_detail_tb` VALUES ('2856', '1', '1.00', '2018-07-20 16:34:05', '2018-07-20 16:34:05', '1042');
INSERT INTO `integral_detail_tb` VALUES ('2857', '1', '1.00', '2018-07-20 16:34:51', '2018-07-20 16:34:51', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2858', '1', '1.00', '2018-07-20 16:35:24', '2018-07-20 16:35:24', '1042');
INSERT INTO `integral_detail_tb` VALUES ('2859', '1', '1.00', '2018-07-20 16:36:27', '2018-07-20 16:36:27', '1042');
INSERT INTO `integral_detail_tb` VALUES ('2860', '1', '1.00', '2018-07-20 16:36:32', '2018-07-20 16:36:32', '1042');
INSERT INTO `integral_detail_tb` VALUES ('2861', '1', '1.00', '2018-07-26 09:21:18', '2018-07-26 09:21:18', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2862', '1', '1.00', '2018-07-26 09:23:17', '2018-07-26 09:23:17', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2863', '1', '1.00', '2018-07-26 09:37:59', '2018-07-26 09:37:59', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2864', '1', '1.00', '2018-07-26 09:46:35', '2018-07-26 09:46:35', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2865', '1', '1.00', '2018-07-26 09:49:34', '2018-07-26 09:49:34', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2866', '1', '1.00', '2018-07-26 14:03:44', '2018-07-26 14:03:44', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2867', '1', '1.00', '2018-07-26 14:03:52', '2018-07-26 14:03:52', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2868', '1', '1.00', '2018-07-26 14:04:23', '2018-07-26 14:04:23', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2869', '1', '1.00', '2018-07-26 14:04:27', '2018-07-26 14:04:27', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2870', '1', '1.00', '2018-07-26 14:04:55', '2018-07-26 14:04:55', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2871', '1', '1.00', '2018-07-26 16:41:24', '2018-07-26 16:41:24', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2872', '1', '1.00', '2018-07-26 22:42:50', '2018-07-26 22:42:50', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2873', '1', '1.00', '2018-07-26 22:42:55', '2018-07-26 22:42:55', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2874', '1', '1.00', '2018-07-26 22:43:00', '2018-07-26 22:43:00', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2875', '1', '1.00', '2018-07-26 22:43:05', '2018-07-26 22:43:05', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2876', '1', '1.00', '2018-07-26 22:43:10', '2018-07-26 22:43:10', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2877', '1', '1.00', '2018-07-26 22:43:15', '2018-07-26 22:43:15', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2878', '1', '1.00', '2018-07-26 22:43:20', '2018-07-26 22:43:20', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2879', '1', '1.00', '2018-07-26 22:43:25', '2018-07-26 22:43:25', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2880', '1', '1.00', '2018-07-26 22:43:30', '2018-07-26 22:43:30', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2881', '1', '1.00', '2018-07-26 22:47:55', '2018-07-26 22:47:55', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2882', '1', '1.00', '2018-07-26 22:48:00', '2018-07-26 22:48:00', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2883', '1', '1.00', '2018-07-26 22:48:05', '2018-07-26 22:48:05', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2884', '1', '1.00', '2018-07-26 22:48:10', '2018-07-26 22:48:10', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2885', '1', '1.00', '2018-07-26 22:48:15', '2018-07-26 22:48:15', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2886', '1', '1.00', '2018-07-27 09:45:14', '2018-07-27 09:45:14', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2887', '1', '1.00', '2018-07-27 09:45:19', '2018-07-27 09:45:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2888', '1', '1.00', '2018-07-30 14:00:26', '2018-07-30 14:00:26', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2889', '1', '1.00', '2018-07-30 14:00:42', '2018-07-30 14:00:42', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2890', '1', '1.00', '2018-07-30 14:00:50', '2018-07-30 14:00:50', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2891', '1', '1.00', '2018-07-30 14:19:24', '2018-07-30 14:19:24', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2892', '1', '1.00', '2018-07-30 14:51:48', '2018-07-30 14:51:48', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2893', '1', '1.00', '2018-07-30 16:12:57', '2018-07-30 16:12:57', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2894', '1', '1.00', '2018-07-30 16:13:23', '2018-07-30 16:13:23', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2895', '1', '1.00', '2018-07-30 16:23:43', '2018-07-30 16:23:43', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2896', '1', '1.00', '2018-07-30 16:26:24', '2018-07-30 16:26:24', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2897', '1', '1.00', '2018-07-30 17:12:11', '2018-07-30 17:12:11', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2898', '1', '1.00', '2018-07-30 17:12:16', '2018-07-30 17:12:16', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2899', '1', '1.00', '2018-07-30 17:12:19', '2018-07-30 17:12:19', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2900', '1', '1.00', '2018-07-30 17:12:24', '2018-07-30 17:12:24', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2901', '1', '1.00', '2018-07-30 17:12:57', '2018-07-30 17:12:57', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2902', '1', '1.00', '2018-07-30 17:14:24', '2018-07-30 17:14:24', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2903', '1', '1.00', '2018-07-30 17:16:29', '2018-07-30 17:16:29', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2904', '1', '1.00', '2018-07-31 16:04:19', '2018-07-31 16:04:19', '1042');
INSERT INTO `integral_detail_tb` VALUES ('2905', '1', '1.00', '2018-07-31 16:04:35', '2018-07-31 16:04:35', '1042');
INSERT INTO `integral_detail_tb` VALUES ('2906', '1', '1.00', '2018-07-31 16:07:04', '2018-07-31 16:07:04', '1042');
INSERT INTO `integral_detail_tb` VALUES ('2907', '1', '1.00', '2018-07-31 16:09:39', '2018-07-31 16:09:39', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2908', '1', '1.00', '2018-07-31 16:11:11', '2018-07-31 16:11:11', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2909', '1', '1.00', '2018-07-31 16:18:27', '2018-07-31 16:18:27', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2910', '1', '1.00', '2018-07-31 16:18:38', '2018-07-31 16:18:38', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2911', '1', '1.00', '2018-07-31 16:18:42', '2018-07-31 16:18:42', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2912', '1', '1.00', '2018-07-31 16:21:49', '2018-07-31 16:21:49', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2913', '1', '1.00', '2018-07-31 16:22:45', '2018-07-31 16:22:45', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2914', '1', '1.00', '2018-07-31 16:24:09', '2018-07-31 16:24:09', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2915', '1', '1.00', '2018-07-31 16:24:15', '2018-07-31 16:24:15', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2916', '1', '1.00', '2018-07-31 16:24:20', '2018-07-31 16:24:20', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2917', '1', '1.00', '2018-07-31 16:37:21', '2018-07-31 16:37:21', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2918', '1', '1.00', '2018-07-31 16:37:36', '2018-07-31 16:37:36', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2919', '1', '1.00', '2018-07-31 16:37:42', '2018-07-31 16:37:42', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2920', '1', '1.00', '2018-07-31 16:37:43', '2018-07-31 16:37:43', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2921', '1', '1.00', '2018-07-31 16:43:18', '2018-07-31 16:43:18', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2922', '1', '1.00', '2018-07-31 16:58:48', '2018-07-31 16:58:48', '1052');
INSERT INTO `integral_detail_tb` VALUES ('2923', '1', '1.00', '2018-07-31 18:10:56', '2018-07-31 18:10:56', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2924', '1', '1.00', '2018-07-31 23:09:13', '2018-07-31 23:09:13', '1012');
INSERT INTO `integral_detail_tb` VALUES ('2925', '1', '1.00', '2018-08-02 10:05:44', '2018-08-02 10:05:44', '1041');
INSERT INTO `integral_detail_tb` VALUES ('2926', '1', '1.00', '2018-08-23 15:02:45', '2018-08-23 15:02:45', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2927', '1', '1.00', '2018-08-23 15:02:50', '2018-08-23 15:02:50', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2928', '1', '1.00', '2018-08-23 15:02:55', '2018-08-23 15:02:55', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2929', '1', '1.00', '2018-08-23 15:03:00', '2018-08-23 15:03:00', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2930', '1', '1.00', '2018-08-23 15:03:05', '2018-08-23 15:03:05', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2931', '1', '1.00', '2018-08-23 15:03:10', '2018-08-23 15:03:10', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2932', '1', '1.00', '2018-09-06 21:46:48', '2018-09-06 21:46:48', '1014');
INSERT INTO `integral_detail_tb` VALUES ('2933', '1', '1.00', '2018-11-23 10:43:21', '2018-11-23 10:43:21', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2934', '1', '1.00', '2018-11-23 10:43:42', '2018-11-23 10:43:42', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2935', '1', '1.00', '2018-11-23 10:43:47', '2018-11-23 10:43:47', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2936', '1', '1.00', '2018-11-23 10:47:02', '2018-11-23 10:47:02', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2937', '1', '1.00', '2018-11-23 10:47:07', '2018-11-23 10:47:07', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2938', '1', '1.00', '2018-11-23 10:47:12', '2018-11-23 10:47:12', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2939', '1', '1.00', '2018-11-23 10:47:17', '2018-11-23 10:47:17', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2940', '1', '1.00', '2018-11-23 10:47:22', '2018-11-23 10:47:22', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2941', '1', '1.00', '2018-11-23 10:47:27', '2018-11-23 10:47:27', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2942', '1', '1.00', '2018-11-23 10:47:32', '2018-11-23 10:47:32', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2943', '1', '1.00', '2018-11-23 10:47:37', '2018-11-23 10:47:37', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2944', '1', '1.00', '2018-11-23 10:47:42', '2018-11-23 10:47:42', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2945', '1', '1.00', '2018-11-23 10:47:47', '2018-11-23 10:47:47', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2946', '1', '1.00', '2018-11-23 10:47:52', '2018-11-23 10:47:52', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2947', '1', '1.00', '2018-11-23 10:48:28', '2018-11-23 10:48:28', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2948', '1', '1.00', '2018-11-23 10:48:33', '2018-11-23 10:48:33', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2949', '1', '1.00', '2018-11-23 10:49:26', '2018-11-23 10:49:26', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2950', '1', '1.00', '2018-11-23 10:50:30', '2018-11-23 10:50:30', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2951', '1', '1.00', '2018-11-23 10:50:35', '2018-11-23 10:50:35', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2952', '1', '1.00', '2018-11-23 10:58:08', '2018-11-23 10:58:08', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2953', '1', '1.00', '2018-11-23 11:18:32', '2018-11-23 11:18:32', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2954', '1', '1.00', '2018-11-23 11:18:35', '2018-11-23 11:18:35', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2955', '1', '1.00', '2018-11-23 11:18:37', '2018-11-23 11:18:37', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2956', '1', '1.00', '2018-11-23 11:18:39', '2018-11-23 11:18:39', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2957', '1', '1.00', '2018-11-23 11:18:40', '2018-11-23 11:18:40', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2958', '1', '1.00', '2018-11-23 11:18:44', '2018-11-23 11:18:44', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2959', '1', '1.00', '2018-11-23 11:18:47', '2018-11-23 11:18:47', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2960', '1', '1.00', '2018-11-23 11:18:51', '2018-11-23 11:18:51', '1000');
INSERT INTO `integral_detail_tb` VALUES ('2961', '1', '1.00', '2018-11-23 12:34:03', '2018-11-23 12:34:03', '1016');
INSERT INTO `integral_detail_tb` VALUES ('2962', '1', '1.00', '2018-11-23 13:14:24', '2018-11-23 13:14:24', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2963', '1', '1.00', '2018-11-23 13:20:02', '2018-11-23 13:20:02', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2964', '1', '1.00', '2018-11-23 13:20:07', '2018-11-23 13:20:07', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2965', '1', '1.00', '2018-11-23 13:20:12', '2018-11-23 13:20:12', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2966', '1', '1.00', '2018-11-23 13:20:15', '2018-11-23 13:20:15', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2967', '1', '1.00', '2018-11-23 13:20:18', '2018-11-23 13:20:18', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2968', '1', '1.00', '2018-11-23 13:21:26', '2018-11-23 13:21:26', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2969', '1', '1.00', '2018-11-23 13:21:31', '2018-11-23 13:21:31', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2970', '1', '1.00', '2018-11-23 13:21:36', '2018-11-23 13:21:36', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2971', '1', '1.00', '2018-11-23 13:21:37', '2018-11-23 13:21:37', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2972', '1', '1.00', '2018-11-23 13:21:39', '2018-11-23 13:21:39', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2973', '1', '1.00', '2018-11-23 13:21:54', '2018-11-23 13:21:54', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2974', '1', '1.00', '2018-11-23 13:21:59', '2018-11-23 13:21:59', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2975', '1', '1.00', '2018-11-23 13:22:02', '2018-11-23 13:22:02', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2976', '1', '1.00', '2018-11-23 13:22:04', '2018-11-23 13:22:04', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2977', '1', '1.00', '2018-11-23 13:22:09', '2018-11-23 13:22:09', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2978', '1', '1.00', '2018-11-23 13:22:11', '2018-11-23 13:22:11', '1055');
INSERT INTO `integral_detail_tb` VALUES ('2979', '1', '1.00', '2018-11-23 13:39:54', '2018-11-23 13:39:54', '1055');

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
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=utf8 COMMENT='积分表';

-- ----------------------------
-- Records of integral_tb
-- ----------------------------
INSERT INTO `integral_tb` VALUES ('1004', '605.00', '0.00', '0.00', '0.00', '2018-02-08 21:46:59', '2018-11-23 11:18:51', '1000');
INSERT INTO `integral_tb` VALUES ('1005', '517.00', '0.00', '0.00', '0.00', '2018-02-08 21:47:19', '2018-07-04 14:50:57', '1009');
INSERT INTO `integral_tb` VALUES ('1006', '245.00', '0.00', '0.00', '0.00', '2018-02-08 21:47:33', '2018-05-15 13:05:56', '1010');
INSERT INTO `integral_tb` VALUES ('1007', '0.00', '0.00', '0.00', '0.00', '2018-02-08 21:47:48', '2018-02-08 21:47:50', '1011');
INSERT INTO `integral_tb` VALUES ('1008', '15.00', '0.00', '0.00', '0.00', '2018-02-08 21:48:00', '2018-07-31 23:09:13', '1012');
INSERT INTO `integral_tb` VALUES ('1009', '0.00', '0.00', '0.00', '0.00', '2018-02-10 13:13:19', '2018-02-10 13:13:19', '1013');
INSERT INTO `integral_tb` VALUES ('1010', '40.00', '0.00', '0.00', '0.00', '2018-02-10 13:19:45', '2018-09-06 21:46:48', '1014');
INSERT INTO `integral_tb` VALUES ('1011', '12.00', '0.00', '0.00', '0.00', '2018-02-22 16:43:03', '2018-04-17 17:48:55', '1015');
INSERT INTO `integral_tb` VALUES ('1012', '88.00', '0.00', '0.00', '0.00', '2018-02-23 14:07:13', '2018-11-23 12:34:03', '1016');
INSERT INTO `integral_tb` VALUES ('1013', '28.00', '0.00', '0.00', '0.00', '2018-02-28 17:54:43', '2018-04-17 16:54:11', '1017');
INSERT INTO `integral_tb` VALUES ('1014', '14.00', '0.00', '0.00', '0.00', '2018-03-01 13:23:55', '2018-03-27 14:59:18', '1018');
INSERT INTO `integral_tb` VALUES ('1015', '68.00', '0.00', '0.00', '0.00', '2018-03-13 09:49:12', '2018-04-03 10:20:23', '1019');
INSERT INTO `integral_tb` VALUES ('1016', '0.00', '0.00', '0.00', '0.00', '2018-03-13 16:20:27', '2018-03-13 16:20:27', '1020');
INSERT INTO `integral_tb` VALUES ('1017', '1.00', '0.00', '0.00', '0.00', '2018-03-27 14:27:41', '2018-04-17 14:39:05', '1021');
INSERT INTO `integral_tb` VALUES ('1018', '0.00', '0.00', '0.00', '0.00', '2018-04-01 23:34:49', '2018-04-01 23:34:49', '1022');
INSERT INTO `integral_tb` VALUES ('1019', '83.00', '0.00', '0.00', '0.00', '2018-04-02 16:53:56', '2018-04-03 13:35:04', '1023');
INSERT INTO `integral_tb` VALUES ('1020', '0.00', '0.00', '0.00', '0.00', '2018-04-03 11:01:55', '2018-04-03 11:01:55', '1024');
INSERT INTO `integral_tb` VALUES ('1021', '0.00', '0.00', '0.00', '0.00', '2018-04-08 10:18:52', '2018-04-08 10:18:52', '1025');
INSERT INTO `integral_tb` VALUES ('1022', '0.00', '0.00', '0.00', '0.00', '2018-04-17 17:25:05', '2018-04-17 17:25:05', '1026');
INSERT INTO `integral_tb` VALUES ('1023', '0.00', '0.00', '0.00', '0.00', '2018-05-03 22:18:28', '2018-05-03 22:18:28', '1027');
INSERT INTO `integral_tb` VALUES ('1024', '0.00', '0.00', '0.00', '0.00', '2018-05-29 18:46:14', '2018-05-29 18:46:14', '1028');
INSERT INTO `integral_tb` VALUES ('1025', '0.00', '0.00', '0.00', '0.00', '2018-05-30 16:06:28', '2018-05-30 16:06:28', '1029');
INSERT INTO `integral_tb` VALUES ('1026', '0.00', '0.00', '0.00', '0.00', '2018-05-30 16:10:51', '2018-05-30 16:10:51', '1030');
INSERT INTO `integral_tb` VALUES ('1027', '0.00', '0.00', '0.00', '0.00', '2018-05-30 17:06:42', '2018-05-30 17:06:42', '1031');
INSERT INTO `integral_tb` VALUES ('1028', '0.00', '0.00', '0.00', '0.00', '2018-05-30 17:07:30', '2018-05-30 17:07:30', '1032');
INSERT INTO `integral_tb` VALUES ('1029', '0.00', '0.00', '0.00', '0.00', '2018-05-30 17:08:05', '2018-05-30 17:08:05', '1033');
INSERT INTO `integral_tb` VALUES ('1030', '0.00', '0.00', '0.00', '0.00', '2018-05-30 17:08:33', '2018-05-30 17:08:33', '1034');
INSERT INTO `integral_tb` VALUES ('1031', '0.00', '0.00', '0.00', '0.00', '2018-05-30 17:10:54', '2018-05-30 17:10:54', '1035');
INSERT INTO `integral_tb` VALUES ('1032', '0.00', '0.00', '0.00', '0.00', '2018-05-30 17:11:46', '2018-05-30 17:11:46', '1036');
INSERT INTO `integral_tb` VALUES ('1033', '0.00', '0.00', '0.00', '0.00', '2018-05-30 17:12:15', '2018-05-30 17:12:15', '1037');
INSERT INTO `integral_tb` VALUES ('1034', '8.00', '0.00', '0.00', '0.00', '2018-05-30 18:31:26', '2018-06-12 16:14:23', '1038');
INSERT INTO `integral_tb` VALUES ('1035', '0.00', '0.00', '0.00', '0.00', '2018-05-31 14:20:08', '2018-05-31 14:20:08', '1039');
INSERT INTO `integral_tb` VALUES ('1036', '0.00', '0.00', '0.00', '0.00', '2018-06-01 14:43:35', '2018-06-01 14:43:35', '1040');
INSERT INTO `integral_tb` VALUES ('1037', '51.00', '0.00', '0.00', '0.00', '2018-06-01 16:14:28', '2018-08-02 10:05:44', '1041');
INSERT INTO `integral_tb` VALUES ('1038', '9.00', '0.00', '0.00', '0.00', '2018-06-01 16:35:05', '2018-07-31 16:07:04', '1042');
INSERT INTO `integral_tb` VALUES ('1039', '0.00', '0.00', '0.00', '0.00', '2018-06-04 13:39:47', '2018-06-04 13:39:47', '1043');
INSERT INTO `integral_tb` VALUES ('1040', '0.00', '0.00', '0.00', '0.00', '2018-06-13 14:09:14', '2018-06-13 14:09:14', '1044');
INSERT INTO `integral_tb` VALUES ('1041', '0.00', '0.00', '0.00', '0.00', '2018-06-24 11:36:11', '2018-06-24 11:36:11', '1045');
INSERT INTO `integral_tb` VALUES ('1042', '0.00', '0.00', '0.00', '0.00', '2018-06-25 09:15:33', '2018-06-25 09:15:33', '1046');
INSERT INTO `integral_tb` VALUES ('1043', '0.00', '0.00', '0.00', '0.00', '2018-06-25 09:16:20', '2018-06-25 09:16:20', '1047');
INSERT INTO `integral_tb` VALUES ('1044', '0.00', '0.00', '0.00', '0.00', '2018-06-25 09:20:30', '2018-06-25 09:20:30', '1048');
INSERT INTO `integral_tb` VALUES ('1045', '0.00', '0.00', '0.00', '0.00', '2018-06-25 09:20:53', '2018-06-25 09:20:53', '1049');
INSERT INTO `integral_tb` VALUES ('1046', '0.00', '0.00', '0.00', '0.00', '2018-06-25 09:22:16', '2018-06-25 09:22:16', '1050');
INSERT INTO `integral_tb` VALUES ('1047', '0.00', '0.00', '0.00', '0.00', '2018-06-25 09:35:22', '2018-06-25 09:35:22', '1051');
INSERT INTO `integral_tb` VALUES ('1048', '36.00', '0.00', '0.00', '0.00', '2018-06-26 17:34:51', '2018-07-31 16:58:48', '1052');
INSERT INTO `integral_tb` VALUES ('1049', '0.00', '0.00', '0.00', '0.00', '2018-07-04 10:54:56', '2018-07-04 10:54:56', '1053');
INSERT INTO `integral_tb` VALUES ('1050', '0.00', '0.00', '0.00', '0.00', '2018-07-04 13:54:55', '2018-07-04 13:54:55', '1054');
INSERT INTO `integral_tb` VALUES ('1051', '18.00', '0.00', '0.00', '0.00', '2018-11-23 10:35:15', '2018-11-23 13:39:54', '1055');

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
) ENGINE=InnoDB AUTO_INCREMENT=1273 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of notice_tb
-- ----------------------------
INSERT INTO `notice_tb` VALUES ('1004', '2', '团购通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gav4cn173evs35fv1g8f1e6pu.png', '您的4500.0元团购申请已成功，详情请前往您的团购中查看。', '1', '2018-02-09 15:41:55', '2018-05-31 14:16:32', '1009', null);
INSERT INTO `notice_tb` VALUES ('1005', '2', '团购申请', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb9b7411vottl4am19qm7i81d.png', '您新收到一个来自谢威的4500.0元团购申请，请及时处理。', '1', '2018-02-09 15:41:55', '2018-05-01 16:22:11', '1000', null);
INSERT INTO `notice_tb` VALUES ('1012', '2', '团购通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gav4cn173evs35fv1g8f1e6pu.png', '您的25000.0元团购申请已成功，详情请前往您的团购中查看。', '1', '2018-02-24 11:07:31', '2018-05-31 14:16:34', '1009', null);
INSERT INTO `notice_tb` VALUES ('1013', '2', '团购申请', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb9b7411vottl4am19qm7i81d.png', '您新收到一个来自谢威的25000.0元团购申请，请及时处理。', '1', '2018-02-24 11:07:31', '2018-05-01 16:22:13', '1000', null);
INSERT INTO `notice_tb` VALUES ('1014', '2', '团购通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gav4cn173evs35fv1g8f1e6pu.png', '您的4500.0元团购申请已成功，详情请前往您的团购中查看。', '0', '2018-03-05 12:35:01', '2018-03-05 12:35:01', '1010', null);
INSERT INTO `notice_tb` VALUES ('1015', '2', '团购申请', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb9b7411vottl4am19qm7i81d.png', '您新收到一个来自舒靖宇的4500.0元团购申请，请及时处理。', '0', '2018-03-05 12:35:01', '2018-03-05 12:35:01', '1000', null);
INSERT INTO `notice_tb` VALUES ('1016', '2', '团购通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gav4cn173evs35fv1g8f1e6pu.png', '您的25000.0元团购申请已成功，详情请前往您的团购中查看。', '0', '2018-03-13 01:06:14', '2018-03-13 01:06:14', '1010', null);
INSERT INTO `notice_tb` VALUES ('1017', '2', '团购申请', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb9b7411vottl4am19qm7i81d.png', '您新收到一个来自舒靖宇的25000.0元团购申请，请及时处理。', '1', '2018-03-13 01:06:14', '2018-05-01 16:26:40', '1000', null);
INSERT INTO `notice_tb` VALUES ('1080', '1', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', null, null);
INSERT INTO `notice_tb` VALUES ('1081', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1000', '1080');
INSERT INTO `notice_tb` VALUES ('1082', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '1', '2018-03-30 16:33:44', '2018-04-08 23:13:43', '1009', '1080');
INSERT INTO `notice_tb` VALUES ('1083', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1010', '1080');
INSERT INTO `notice_tb` VALUES ('1084', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1011', '1080');
INSERT INTO `notice_tb` VALUES ('1085', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1012', '1080');
INSERT INTO `notice_tb` VALUES ('1086', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '1', '2018-03-30 16:33:44', '2018-05-01 01:19:23', '1013', '1080');
INSERT INTO `notice_tb` VALUES ('1087', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1014', '1080');
INSERT INTO `notice_tb` VALUES ('1088', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1015', '1080');
INSERT INTO `notice_tb` VALUES ('1089', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '1', '2018-03-30 16:33:44', '2018-04-12 14:08:38', '1016', '1080');
INSERT INTO `notice_tb` VALUES ('1090', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1017', '1080');
INSERT INTO `notice_tb` VALUES ('1091', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1018', '1080');
INSERT INTO `notice_tb` VALUES ('1092', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1019', '1080');
INSERT INTO `notice_tb` VALUES ('1093', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1020', '1080');
INSERT INTO `notice_tb` VALUES ('1094', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-03-30 16:33:44', '2018-03-30 16:33:44', '1021', '1080');
INSERT INTO `notice_tb` VALUES ('1095', '1', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '1', '2018-03-30 16:34:17', '2018-03-30 17:03:49', null, null);
INSERT INTO `notice_tb` VALUES ('1096', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1000', '1095');
INSERT INTO `notice_tb` VALUES ('1097', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '1', '2018-03-30 16:34:17', '2018-04-08 23:13:43', '1009', '1095');
INSERT INTO `notice_tb` VALUES ('1098', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1010', '1095');
INSERT INTO `notice_tb` VALUES ('1099', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1011', '1095');
INSERT INTO `notice_tb` VALUES ('1100', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1012', '1095');
INSERT INTO `notice_tb` VALUES ('1101', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1013', '1095');
INSERT INTO `notice_tb` VALUES ('1102', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1014', '1095');
INSERT INTO `notice_tb` VALUES ('1103', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1015', '1095');
INSERT INTO `notice_tb` VALUES ('1104', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '1', '2018-03-30 16:34:17', '2018-04-12 14:08:40', '1016', '1095');
INSERT INTO `notice_tb` VALUES ('1105', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1017', '1095');
INSERT INTO `notice_tb` VALUES ('1106', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1018', '1095');
INSERT INTO `notice_tb` VALUES ('1107', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1019', '1095');
INSERT INTO `notice_tb` VALUES ('1108', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1020', '1095');
INSERT INTO `notice_tb` VALUES ('1109', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第一条测试通知', '0', '2018-03-30 16:34:17', '2018-03-30 17:03:49', '1021', '1095');
INSERT INTO `notice_tb` VALUES ('1110', '1', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '1', '2018-03-30 17:03:28', '2018-03-30 17:03:45', null, null);
INSERT INTO `notice_tb` VALUES ('1111', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1000', '1110');
INSERT INTO `notice_tb` VALUES ('1112', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '1', '2018-03-30 17:03:28', '2018-04-08 23:13:43', '1009', '1110');
INSERT INTO `notice_tb` VALUES ('1113', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1010', '1110');
INSERT INTO `notice_tb` VALUES ('1114', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1011', '1110');
INSERT INTO `notice_tb` VALUES ('1115', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1012', '1110');
INSERT INTO `notice_tb` VALUES ('1116', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1013', '1110');
INSERT INTO `notice_tb` VALUES ('1117', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1014', '1110');
INSERT INTO `notice_tb` VALUES ('1118', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1015', '1110');
INSERT INTO `notice_tb` VALUES ('1119', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '1', '2018-03-30 17:03:28', '2018-04-12 14:08:41', '1016', '1110');
INSERT INTO `notice_tb` VALUES ('1120', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1017', '1110');
INSERT INTO `notice_tb` VALUES ('1121', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1018', '1110');
INSERT INTO `notice_tb` VALUES ('1122', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1019', '1110');
INSERT INTO `notice_tb` VALUES ('1123', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1020', '1110');
INSERT INTO `notice_tb` VALUES ('1124', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3c2vq1j41v68pgk1cchb8j2s.png', '这是第二条测试通知', '0', '2018-03-30 17:03:28', '2018-03-30 17:03:45', '1021', '1110');
INSERT INTO `notice_tb` VALUES ('1140', '1', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', null, null);
INSERT INTO `notice_tb` VALUES ('1141', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '1', '2018-04-03 11:10:43', '2018-04-11 10:28:07', '1000', '1140');
INSERT INTO `notice_tb` VALUES ('1142', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '1', '2018-04-03 11:10:43', '2018-04-08 23:13:43', '1009', '1140');
INSERT INTO `notice_tb` VALUES ('1143', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1010', '1140');
INSERT INTO `notice_tb` VALUES ('1144', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1011', '1140');
INSERT INTO `notice_tb` VALUES ('1145', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1012', '1140');
INSERT INTO `notice_tb` VALUES ('1146', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1013', '1140');
INSERT INTO `notice_tb` VALUES ('1147', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1014', '1140');
INSERT INTO `notice_tb` VALUES ('1148', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1015', '1140');
INSERT INTO `notice_tb` VALUES ('1149', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '1', '2018-04-03 11:10:43', '2018-04-12 14:08:44', '1016', '1140');
INSERT INTO `notice_tb` VALUES ('1150', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1017', '1140');
INSERT INTO `notice_tb` VALUES ('1151', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1018', '1140');
INSERT INTO `notice_tb` VALUES ('1152', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1019', '1140');
INSERT INTO `notice_tb` VALUES ('1153', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1020', '1140');
INSERT INTO `notice_tb` VALUES ('1154', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1021', '1140');
INSERT INTO `notice_tb` VALUES ('1155', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1022', '1140');
INSERT INTO `notice_tb` VALUES ('1156', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1023', '1140');
INSERT INTO `notice_tb` VALUES ('1157', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第三条系统通知', '0', '2018-04-03 11:10:43', '2018-04-03 11:10:43', '1024', '1140');
INSERT INTO `notice_tb` VALUES ('1158', '1', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', null, null);
INSERT INTO `notice_tb` VALUES ('1159', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1000', '1158');
INSERT INTO `notice_tb` VALUES ('1160', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '1', '2018-04-03 11:12:05', '2018-04-11 21:17:15', '1009', '1158');
INSERT INTO `notice_tb` VALUES ('1161', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1010', '1158');
INSERT INTO `notice_tb` VALUES ('1162', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1011', '1158');
INSERT INTO `notice_tb` VALUES ('1163', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '1', '2018-04-03 11:12:05', '2018-05-07 11:53:14', '1012', '1158');
INSERT INTO `notice_tb` VALUES ('1164', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1013', '1158');
INSERT INTO `notice_tb` VALUES ('1165', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1014', '1158');
INSERT INTO `notice_tb` VALUES ('1166', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1015', '1158');
INSERT INTO `notice_tb` VALUES ('1167', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '1', '2018-04-03 11:12:05', '2018-04-12 14:08:46', '1016', '1158');
INSERT INTO `notice_tb` VALUES ('1168', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1017', '1158');
INSERT INTO `notice_tb` VALUES ('1169', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1018', '1158');
INSERT INTO `notice_tb` VALUES ('1170', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1019', '1158');
INSERT INTO `notice_tb` VALUES ('1171', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1020', '1158');
INSERT INTO `notice_tb` VALUES ('1172', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1021', '1158');
INSERT INTO `notice_tb` VALUES ('1173', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1022', '1158');
INSERT INTO `notice_tb` VALUES ('1174', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1023', '1158');
INSERT INTO `notice_tb` VALUES ('1175', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第四条系统通知', '0', '2018-04-03 11:12:05', '2018-04-03 11:12:05', '1024', '1158');
INSERT INTO `notice_tb` VALUES ('1176', '1', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', null, null);
INSERT INTO `notice_tb` VALUES ('1177', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '1', '2018-04-03 11:14:02', '2018-04-08 23:22:01', '1000', '1176');
INSERT INTO `notice_tb` VALUES ('1178', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '1', '2018-04-03 11:14:02', '2018-04-11 21:16:40', '1009', '1176');
INSERT INTO `notice_tb` VALUES ('1179', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1010', '1176');
INSERT INTO `notice_tb` VALUES ('1180', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1011', '1176');
INSERT INTO `notice_tb` VALUES ('1181', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '1', '2018-04-03 11:14:02', '2018-05-07 11:53:09', '1012', '1176');
INSERT INTO `notice_tb` VALUES ('1182', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '1', '2018-04-03 11:14:02', '2018-05-01 01:19:09', '1013', '1176');
INSERT INTO `notice_tb` VALUES ('1183', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1014', '1176');
INSERT INTO `notice_tb` VALUES ('1184', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1015', '1176');
INSERT INTO `notice_tb` VALUES ('1185', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '1', '2018-04-03 11:14:02', '2018-04-12 14:08:48', '1016', '1176');
INSERT INTO `notice_tb` VALUES ('1186', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1017', '1176');
INSERT INTO `notice_tb` VALUES ('1187', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1018', '1176');
INSERT INTO `notice_tb` VALUES ('1188', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1019', '1176');
INSERT INTO `notice_tb` VALUES ('1189', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1020', '1176');
INSERT INTO `notice_tb` VALUES ('1190', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1021', '1176');
INSERT INTO `notice_tb` VALUES ('1191', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1022', '1176');
INSERT INTO `notice_tb` VALUES ('1192', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1023', '1176');
INSERT INTO `notice_tb` VALUES ('1193', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第五条系统通知', '0', '2018-04-03 11:14:02', '2018-04-03 11:14:02', '1024', '1176');
INSERT INTO `notice_tb` VALUES ('1194', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的10000.0元提现已到账，请前往您的支付宝账号进行查看。', '1', '2018-04-11 12:06:10', '2018-04-11 12:09:59', '1010', null);
INSERT INTO `notice_tb` VALUES ('1195', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的1.0元提现已到账，请前往您的微信账号进行查看。', '0', '2018-04-11 12:13:51', '2018-04-11 12:13:51', '1010', null);
INSERT INTO `notice_tb` VALUES ('1196', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的1.0元提现已到账，请前往您的微信账号进行查看。', '0', '2018-04-11 12:16:16', '2018-04-11 12:16:16', '1010', null);
INSERT INTO `notice_tb` VALUES ('1197', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的1000.0元提现已到账，请前往您的支付宝账号进行查看。', '0', '2018-04-11 12:17:24', '2018-04-11 12:17:24', '1010', null);
INSERT INTO `notice_tb` VALUES ('1198', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的1000.0元提现已到账，请前往您的微信账号进行查看。', '0', '2018-04-11 12:18:03', '2018-04-11 12:18:03', '1010', null);
INSERT INTO `notice_tb` VALUES ('1199', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的1000.0元提现已到账，请前往您的支付宝账号进行查看。', '1', '2018-04-11 12:18:39', '2018-05-01 16:41:59', '1010', null);
INSERT INTO `notice_tb` VALUES ('1200', '1', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', null, null);
INSERT INTO `notice_tb` VALUES ('1201', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1000', '1200');
INSERT INTO `notice_tb` VALUES ('1202', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '1', '2018-04-12 14:06:48', '2018-05-07 13:40:46', '1009', '1200');
INSERT INTO `notice_tb` VALUES ('1203', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '1', '2018-04-12 14:06:48', '2018-05-01 16:52:42', '1010', '1200');
INSERT INTO `notice_tb` VALUES ('1204', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1011', '1200');
INSERT INTO `notice_tb` VALUES ('1205', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '1', '2018-04-12 14:06:48', '2018-07-31 23:09:57', '1012', '1200');
INSERT INTO `notice_tb` VALUES ('1206', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '1', '2018-04-12 14:06:48', '2018-05-01 17:06:20', '1013', '1200');
INSERT INTO `notice_tb` VALUES ('1207', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1014', '1200');
INSERT INTO `notice_tb` VALUES ('1208', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1015', '1200');
INSERT INTO `notice_tb` VALUES ('1209', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '1', '2018-04-12 14:06:48', '2018-04-12 14:08:50', '1016', '1200');
INSERT INTO `notice_tb` VALUES ('1210', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1017', '1200');
INSERT INTO `notice_tb` VALUES ('1211', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1018', '1200');
INSERT INTO `notice_tb` VALUES ('1212', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '1', '2018-04-12 14:06:48', '2018-05-07 14:38:59', '1019', '1200');
INSERT INTO `notice_tb` VALUES ('1213', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1020', '1200');
INSERT INTO `notice_tb` VALUES ('1214', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1021', '1200');
INSERT INTO `notice_tb` VALUES ('1215', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1022', '1200');
INSERT INTO `notice_tb` VALUES ('1216', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1023', '1200');
INSERT INTO `notice_tb` VALUES ('1217', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1024', '1200');
INSERT INTO `notice_tb` VALUES ('1218', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是第7条通知', '0', '2018-04-12 14:06:48', '2018-04-12 14:06:48', '1025', '1200');
INSERT INTO `notice_tb` VALUES ('1219', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的0.01元提现已到账，请前往您的支付宝账号进行查看。', '1', '2018-05-30 16:57:07', '2018-07-05 15:30:58', '1016', null);
INSERT INTO `notice_tb` VALUES ('1220', '1', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', null, null);
INSERT INTO `notice_tb` VALUES ('1221', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '1', '2018-05-30 17:13:35', '2018-05-31 11:32:41', '1000', '1220');
INSERT INTO `notice_tb` VALUES ('1222', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '1', '2018-05-30 17:13:35', '2018-05-31 14:16:22', '1009', '1220');
INSERT INTO `notice_tb` VALUES ('1223', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1010', '1220');
INSERT INTO `notice_tb` VALUES ('1224', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1011', '1220');
INSERT INTO `notice_tb` VALUES ('1225', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '1', '2018-05-30 17:13:35', '2018-07-26 22:44:02', '1012', '1220');
INSERT INTO `notice_tb` VALUES ('1226', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '1', '2018-05-30 17:13:35', '2018-07-31 17:18:52', '1013', '1220');
INSERT INTO `notice_tb` VALUES ('1227', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1014', '1220');
INSERT INTO `notice_tb` VALUES ('1228', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1015', '1220');
INSERT INTO `notice_tb` VALUES ('1229', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '1', '2018-05-30 17:13:35', '2018-07-05 15:30:54', '1016', '1220');
INSERT INTO `notice_tb` VALUES ('1230', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1017', '1220');
INSERT INTO `notice_tb` VALUES ('1231', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1018', '1220');
INSERT INTO `notice_tb` VALUES ('1232', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1019', '1220');
INSERT INTO `notice_tb` VALUES ('1233', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1020', '1220');
INSERT INTO `notice_tb` VALUES ('1234', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1021', '1220');
INSERT INTO `notice_tb` VALUES ('1235', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1022', '1220');
INSERT INTO `notice_tb` VALUES ('1236', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1023', '1220');
INSERT INTO `notice_tb` VALUES ('1237', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1024', '1220');
INSERT INTO `notice_tb` VALUES ('1238', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1025', '1220');
INSERT INTO `notice_tb` VALUES ('1239', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1026', '1220');
INSERT INTO `notice_tb` VALUES ('1240', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1027', '1220');
INSERT INTO `notice_tb` VALUES ('1241', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1028', '1220');
INSERT INTO `notice_tb` VALUES ('1242', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1029', '1220');
INSERT INTO `notice_tb` VALUES ('1243', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1030', '1220');
INSERT INTO `notice_tb` VALUES ('1244', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1031', '1220');
INSERT INTO `notice_tb` VALUES ('1245', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1032', '1220');
INSERT INTO `notice_tb` VALUES ('1246', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1033', '1220');
INSERT INTO `notice_tb` VALUES ('1247', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1034', '1220');
INSERT INTO `notice_tb` VALUES ('1248', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1035', '1220');
INSERT INTO `notice_tb` VALUES ('1249', '2', '系统通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gaqqst68db2j16nno61q3cp.jpg', '测试530', '0', '2018-05-30 17:13:35', '2018-05-30 17:13:35', '1036', '1220');
INSERT INTO `notice_tb` VALUES ('1251', '2', '团购卡余额不足', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb3tvce1e1d7sivg5kr1naq13.png', '您的团购卡余额不足0张，为了不影响您下级的正常升级，请前往升级。', '0', '2018-06-01 16:27:02', '2018-06-01 16:27:02', '1038', null);
INSERT INTO `notice_tb` VALUES ('1254', '2', '团购卡余额不足', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb3tvce1e1d7sivg5kr1naq13.png', '您的团购卡余额不足0张，为了不影响您下级的正常升级，请前往升级。', '0', '2018-06-12 16:07:07', '2018-06-12 16:07:07', '1038', null);
INSERT INTO `notice_tb` VALUES ('1255', '2', '团购通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gav4cn173evs35fv1g8f1e6pu.png', '您的4500.0元团购申请已成功，详情请前往您的团购中查看。', '0', '2018-06-12 16:09:55', '2018-06-12 16:09:55', '1038', null);
INSERT INTO `notice_tb` VALUES ('1256', '2', '团购申请', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb9b7411vottl4am19qm7i81d.png', '您新收到一个来自普通vip的4500.0元团购申请，请及时处理。', '1', '2018-06-12 16:09:55', '2018-11-09 19:04:27', '1000', null);
INSERT INTO `notice_tb` VALUES ('1257', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的1.0元提现已到账，请前往您的支付宝账号进行查看。', '1', '2018-06-27 10:22:07', '2018-07-17 17:30:44', '1052', null);
INSERT INTO `notice_tb` VALUES ('1258', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的10.0元提现已到账，请前往您的支付宝账号进行查看。', '1', '2018-06-27 10:28:28', '2018-07-17 17:30:42', '1052', null);
INSERT INTO `notice_tb` VALUES ('1259', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的100.0元提现已到账，请前往您的支付宝账号进行查看。', '0', '2018-07-05 14:58:30', '2018-07-05 14:58:30', '1041', null);
INSERT INTO `notice_tb` VALUES ('1260', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的100.0元提现已到账，请前往您的支付宝账号进行查看。', '0', '2018-07-05 14:58:35', '2018-07-05 14:58:35', '1041', null);
INSERT INTO `notice_tb` VALUES ('1261', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的1.0元提现已到账，请前往您的支付宝账号进行查看。', '0', '2018-07-05 14:58:37', '2018-07-05 14:58:37', '1041', null);
INSERT INTO `notice_tb` VALUES ('1262', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的0.43元提现已到账，请前往您的支付宝账号进行查看。', '1', '2018-07-05 15:01:07', '2018-07-05 15:31:09', '1016', null);
INSERT INTO `notice_tb` VALUES ('1263', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的100.0元提现已到账，请前往您的支付宝账号进行查看。', '1', '2018-07-09 13:49:53', '2018-07-30 17:09:10', '1041', null);
INSERT INTO `notice_tb` VALUES ('1264', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的10.0元提现已到账，请前往您的支付宝账号进行查看。', '1', '2018-07-17 09:48:44', '2018-07-17 17:30:36', '1052', null);
INSERT INTO `notice_tb` VALUES ('1265', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的100.0元提现已到账，请前往您的支付宝账号进行查看。', '1', '2018-07-17 17:31:00', '2018-07-17 17:31:09', '1052', null);
INSERT INTO `notice_tb` VALUES ('1266', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的100.0元提现已到账，请前往您的支付宝账号进行查看。', '0', '2018-07-20 15:23:03', '2018-07-20 15:23:03', '1041', null);
INSERT INTO `notice_tb` VALUES ('1267', '2', '团购卡余额不足', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb3tvce1e1d7sivg5kr1naq13.png', '您的团购卡余额不足0张，为了不影响您下级的正常升级，请前往升级。', '0', '2018-07-20 15:36:02', '2018-07-20 15:36:02', '1038', null);
INSERT INTO `notice_tb` VALUES ('1268', '2', '提现到账通知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb6olh2b49fi11hvqv914c818.png', '您申请的0.3元提现已到账，请前往您的支付宝账号进行查看。', '1', '2018-07-30 14:40:22', '2018-07-30 14:41:16', '1016', null);
INSERT INTO `notice_tb` VALUES ('1269', '2', '提现失败', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb3tvce1e1d7sivg5kr1naq13.png', '您申请的100000.0元提现失败，理由为：测试中，不能体现！', '0', '2018-07-30 19:10:23', '2018-07-30 19:10:23', '1009', null);
INSERT INTO `notice_tb` VALUES ('1270', '2', '提现失败', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb3tvce1e1d7sivg5kr1naq13.png', '您申请的600000.0元提现失败，理由为：对方公司的法规梵蒂冈', '0', '2018-07-30 19:13:27', '2018-07-30 19:13:27', '1009', null);
INSERT INTO `notice_tb` VALUES ('1271', '2', '提现失败', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb3tvce1e1d7sivg5kr1naq13.png', '您申请的10000.0元提现失败，理由为：buneng打发士大夫', '0', '2018-07-30 19:15:56', '2018-07-30 19:15:56', '1010', null);
INSERT INTO `notice_tb` VALUES ('1272', '2', '提现失败', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5gb3tvce1e1d7sivg5kr1naq13.png', '您申请的100.0元提现失败，理由为：余额不足，提现失败。', '1', '2018-07-30 19:23:28', '2018-07-30 19:23:38', '1041', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail_tb
-- ----------------------------
INSERT INTO `order_detail_tb` VALUES ('1000', '普通vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1002', '1000');
INSERT INTO `order_detail_tb` VALUES ('1001', '企业管理学', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1', '2018-02-05 21:04:34', '2018-02-05 21:04:34', '1002', '1001');
INSERT INTO `order_detail_tb` VALUES ('1002', '企业管理学', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1', '2018-02-05 21:04:37', '2018-02-05 21:04:37', '1002', '1002');
INSERT INTO `order_detail_tb` VALUES ('1003', '企业管理学', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1', '2018-02-05 22:39:27', '2018-02-05 22:39:27', '1002', '1003');
INSERT INTO `order_detail_tb` VALUES ('1004', '普通vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1002', '1004');
INSERT INTO `order_detail_tb` VALUES ('1005', '钻石vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8j4o210nm1ip459l127t1gt219.png', '4500.00', '1', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1003', '1005');
INSERT INTO `order_detail_tb` VALUES ('1006', '企业管理学', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1', '2018-02-10 02:04:02', '2018-02-10 02:04:02', '1002', '1006');
INSERT INTO `order_detail_tb` VALUES ('1007', '普通vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1002', '1007');
INSERT INTO `order_detail_tb` VALUES ('1008', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '0.01', '1', '2018-02-22 16:14:52', '2018-02-22 16:14:52', '1006', '1008');
INSERT INTO `order_detail_tb` VALUES ('1009', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '0.01', '1', '2018-02-23 14:20:13', '2018-02-23 14:20:13', '1006', '1009');
INSERT INTO `order_detail_tb` VALUES ('1010', '联合发起人', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8jh02bes1eje8d6nm91ei71e.png', '25000.00', '1', '2018-02-24 11:07:30', '2018-02-24 11:07:30', '1004', '1010');
INSERT INTO `order_detail_tb` VALUES ('1011', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '0.01', '1', '2018-02-27 17:26:27', '2018-02-27 17:26:27', '1006', '1011');
INSERT INTO `order_detail_tb` VALUES ('1012', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '0.01', '1', '2018-02-28 10:04:47', '2018-02-28 10:04:47', '1006', '1012');
INSERT INTO `order_detail_tb` VALUES ('1013', '如何打造高效团队？最重要的是这三件事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '0.01', '1', '2018-02-28 21:34:28', '2018-02-28 21:34:28', '1001', '1013');
INSERT INTO `order_detail_tb` VALUES ('1014', '如何打造高效团队？最重要的是这三件事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '0.01', '1', '2018-03-01 13:38:04', '2018-03-01 13:38:04', '1001', '1014');
INSERT INTO `order_detail_tb` VALUES ('1015', '钻石vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8j4o210nm1ip459l127t1gt219.png', '4500.00', '1', '2018-03-05 12:35:01', '2018-03-05 12:35:01', '1003', '1015');
INSERT INTO `order_detail_tb` VALUES ('1016', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '0.01', '1', '2018-03-08 17:53:23', '2018-03-08 17:53:23', '1006', '1016');
INSERT INTO `order_detail_tb` VALUES ('1017', '如何打造高效团队？最重要的是这三件事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '0.01', '1', '2018-03-13 00:51:24', '2018-03-13 00:51:24', '1001', '1017');
INSERT INTO `order_detail_tb` VALUES ('1018', '联合发起人', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8jh02bes1eje8d6nm91ei71e.png', '25000.00', '1', '2018-03-13 01:06:14', '2018-03-13 01:06:14', '1004', '1018');
INSERT INTO `order_detail_tb` VALUES ('1019', '企业管理学', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1', '2018-03-14 09:32:06', '2018-03-14 09:32:06', '1002', '1019');
INSERT INTO `order_detail_tb` VALUES ('1020', '如何打造高效团队？最重要的是这三件事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '0.01', '1', '2018-03-26 17:20:47', '2018-03-26 17:20:47', '1001', '1020');
INSERT INTO `order_detail_tb` VALUES ('1021', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2obr21opijfc18ar1m6fuch1vm.jpg', '100.00', '2', '2018-05-31 16:42:44', '2018-05-31 16:42:44', '1031', '1021');
INSERT INTO `order_detail_tb` VALUES ('1022', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2obr21opijfc18ar1m6fuch1vm.jpg', '100.00', '2', '2018-05-31 16:50:32', '2018-05-31 16:50:32', '1031', '1022');
INSERT INTO `order_detail_tb` VALUES ('1024', '普通vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-05-31 17:11:40', '2018-05-31 17:11:40', '1002', '1024');
INSERT INTO `order_detail_tb` VALUES ('1025', '普通vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-06-01 11:05:13', '2018-06-01 11:05:13', '1002', '1025');
INSERT INTO `order_detail_tb` VALUES ('1026', '普通vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-06-01 17:46:32', '2018-06-01 17:46:32', '1002', '1026');
INSERT INTO `order_detail_tb` VALUES ('1027', '钻石vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8j4o210nm1ip459l127t1gt219.png', '4500.00', '1', '2018-06-12 16:09:55', '2018-06-12 16:09:55', '1003', '1027');
INSERT INTO `order_detail_tb` VALUES ('1028', '普通vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-06-27 10:18:52', '2018-06-27 10:18:52', '1002', '1028');
INSERT INTO `order_detail_tb` VALUES ('1029', '普通vip', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1', '2018-07-20 15:38:46', '2018-07-20 15:38:46', '1002', '1029');
INSERT INTO `order_detail_tb` VALUES ('1030', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2obr21opijfc18ar1m6fuch1vm.jpg', '0.01', '2', '2018-07-30 17:12:03', '2018-07-30 17:12:03', '1031', '1030');
INSERT INTO `order_detail_tb` VALUES ('1031', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2obr21opijfc18ar1m6fuch1vm.jpg', '0.01', '2', '2018-11-23 10:50:18', '2018-11-23 10:50:18', '1031', '1031');
INSERT INTO `order_detail_tb` VALUES ('1032', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2obr21opijfc18ar1m6fuch1vm.jpg', '0.01', '2', '2018-11-23 10:50:25', '2018-11-23 10:50:25', '1031', '1032');
INSERT INTO `order_detail_tb` VALUES ('1033', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2obr21opijfc18ar1m6fuch1vm.jpg', '0.01', '2', '2018-11-23 13:14:10', '2018-11-23 13:14:10', '1031', '1033');
INSERT INTO `order_detail_tb` VALUES ('1034', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2obr21opijfc18ar1m6fuch1vm.jpg', '0.01', '2', '2018-11-23 13:14:15', '2018-11-23 13:14:15', '1031', '1034');

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
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8 COMMENT='视频订单表';

-- ----------------------------
-- Records of order_tb
-- ----------------------------
INSERT INTO `order_tb` VALUES ('1000', '23942018020517092018792', '1', '2', '0', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1010');
INSERT INTO `order_tb` VALUES ('1001', '28312018020521043312990', '3', '3', '0', '2018-02-05 21:04:34', '2018-02-05 21:04:34', '1009');
INSERT INTO `order_tb` VALUES ('1002', '90292018020521043717342', '3', '3', '0', '2018-02-05 21:04:37', '2018-02-05 21:04:37', '1009');
INSERT INTO `order_tb` VALUES ('1003', '18542018020522392712298', '3', '3', '0', '2018-02-05 22:39:27', '2018-02-05 22:39:27', '1009');
INSERT INTO `order_tb` VALUES ('1004', '32352018020615351817408', '1', '2', '2', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1009');
INSERT INTO `order_tb` VALUES ('1005', '48082018020915415513908', '2', '3', '0', '2018-02-09 15:41:55', '2018-02-24 09:23:14', '1009');
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
INSERT INTO `order_tb` VALUES ('1021', '1000201805311642442563', '3', '3', '2', '2018-05-31 16:42:44', '2018-05-31 16:42:44', '1000');
INSERT INTO `order_tb` VALUES ('1022', '1038201805311650323818', '3', '3', '2', '2018-05-31 16:50:32', '2018-05-31 16:50:32', '1038');
INSERT INTO `order_tb` VALUES ('1024', '1038201805311711399356', '1', '3', '2', '2018-05-31 17:11:40', '2018-05-31 17:11:40', '1038');
INSERT INTO `order_tb` VALUES ('1025', '1019201806011105126616', '1', '3', '2', '2018-06-01 11:05:13', '2018-06-01 11:05:13', '1019');
INSERT INTO `order_tb` VALUES ('1026', '1042201806011746324379', '1', '3', '2', '2018-06-01 17:46:32', '2018-06-01 17:46:32', '1042');
INSERT INTO `order_tb` VALUES ('1027', '1038201806121609557683', '2', '3', '1', '2018-06-12 16:09:55', '2018-06-12 16:09:55', '1038');
INSERT INTO `order_tb` VALUES ('1028', '1052201806271018529985', '1', '3', '2', '2018-06-27 10:18:52', '2018-06-27 10:18:52', '1052');
INSERT INTO `order_tb` VALUES ('1029', '1041201807201538455331', '1', '3', '2', '2018-07-20 15:38:46', '2018-07-20 15:38:46', '1041');
INSERT INTO `order_tb` VALUES ('1030', '1041201807301712025274', '3', '3', '2', '2018-07-30 17:12:03', '2018-07-30 17:12:03', '1041');
INSERT INTO `order_tb` VALUES ('1031', '1016201811231050188944', '3', '3', '2', '2018-11-23 10:50:18', '2018-11-23 10:50:18', '1016');
INSERT INTO `order_tb` VALUES ('1032', '1016201811231050258544', '3', '3', '2', '2018-11-23 10:50:25', '2018-11-23 10:50:25', '1016');
INSERT INTO `order_tb` VALUES ('1033', '1055201811231314099022', '3', '3', '2', '2018-11-23 13:14:10', '2018-11-23 13:14:10', '1055');
INSERT INTO `order_tb` VALUES ('1034', '1055201811231314157661', '3', '3', '2', '2018-11-23 13:14:15', '2018-11-23 13:14:15', '1055');

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
) ENGINE=InnoDB AUTO_INCREMENT=1163 DEFAULT CHARSET=utf8 COMMENT='支付表';

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
INSERT INTO `payment_tb` VALUES ('1060', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1013201804011618198873', '365.00', '1', '1', '1002', null, '1013', '2018-04-01 16:18:20', '2018-04-01 16:18:20');
INSERT INTO `payment_tb` VALUES ('1061', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1013201804011618526231', '365.00', '1', '1', '1002', null, '1013', '2018-04-01 16:18:52', '2018-04-01 16:18:52');
INSERT INTO `payment_tb` VALUES ('1062', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1013201804011620327664', '365.00', '1', '1', '1002', null, '1013', '2018-04-01 16:20:32', '2018-04-01 16:20:32');
INSERT INTO `payment_tb` VALUES ('1063', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1013201804011621024782', '365.00', '1', '1', '1002', null, '1013', '2018-04-01 16:21:02', '2018-04-01 16:21:02');
INSERT INTO `payment_tb` VALUES ('1064', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1013201804011622534218', '365.00', '1', '1', '1002', null, '1013', '2018-04-01 16:22:54', '2018-04-01 16:22:54');
INSERT INTO `payment_tb` VALUES ('1065', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1013201804011625257643', '365.00', '1', '1', '1002', null, '1013', '2018-04-01 16:25:25', '2018-04-01 16:25:25');
INSERT INTO `payment_tb` VALUES ('1066', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1013201804011625513743', '365.00', '1', '1', '1002', null, '1013', '2018-04-01 16:25:51', '2018-04-01 16:25:51');
INSERT INTO `payment_tb` VALUES ('1067', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1013201804011628355460', '365.00', '1', '1', '1002', null, '1013', '2018-04-01 16:28:36', '2018-04-01 16:28:36');
INSERT INTO `payment_tb` VALUES ('1068', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1010201804011702308352', '0.01', '2', '4', null, null, '1010', '2018-04-01 17:02:30', '2018-04-01 17:02:37');
INSERT INTO `payment_tb` VALUES ('1069', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1010201804011706403570', '0.01', '2', '4', null, null, '1010', '2018-04-01 17:06:41', '2018-04-01 17:06:52');
INSERT INTO `payment_tb` VALUES ('1070', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1010201804011711383887', '0.01', '2', '4', null, null, '1010', '2018-04-01 17:11:39', '2018-04-01 17:11:43');
INSERT INTO `payment_tb` VALUES ('1071', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804031050256390', '0.10', '3', '4', null, null, '1016', '2018-04-03 10:50:25', '2018-04-03 10:50:29');
INSERT INTO `payment_tb` VALUES ('1072', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201804031118076919', '365.00', '1', '1', '1002', null, '1016', '2018-04-03 11:18:08', '2018-04-03 11:18:08');
INSERT INTO `payment_tb` VALUES ('1073', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804081014195781', '0.10', '3', '4', null, null, '1016', '2018-04-08 10:14:19', '2018-04-08 10:14:23');
INSERT INTO `payment_tb` VALUES ('1074', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1010201804081639062963', '0.01', '2', '4', null, null, '1010', '2018-04-08 16:39:06', '2018-04-08 16:39:11');
INSERT INTO `payment_tb` VALUES ('1075', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1010201804081641433955', '0.01', '2', '4', null, null, '1010', '2018-04-08 16:41:44', '2018-04-08 16:41:48');
INSERT INTO `payment_tb` VALUES ('1076', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1009201804081740549302', '0.01', '2', '4', null, null, '1009', '2018-04-08 17:40:55', '2018-04-08 17:41:46');
INSERT INTO `payment_tb` VALUES ('1077', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201804081750386822', '365.00', '1', '1', '1002', null, '1016', '2018-04-08 17:50:38', '2018-04-08 17:50:38');
INSERT INTO `payment_tb` VALUES ('1078', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804081751032806', '0.01', '1', '4', null, null, '1016', '2018-04-08 17:51:04', '2018-04-08 17:51:04');
INSERT INTO `payment_tb` VALUES ('1079', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804081755358424', '0.10', '3', '4', null, null, '1016', '2018-04-08 17:55:36', '2018-04-08 17:55:41');
INSERT INTO `payment_tb` VALUES ('1080', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201804081756024828', '365.00', '1', '1', '1002', null, '1016', '2018-04-08 17:56:02', '2018-04-08 17:56:02');
INSERT INTO `payment_tb` VALUES ('1081', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121357238400', '0.10', '3', '4', null, null, '1016', '2018-04-12 13:57:23', '2018-04-12 13:57:29');
INSERT INTO `payment_tb` VALUES ('1082', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121400018545', '0.01', '2', '4', null, null, '1016', '2018-04-12 14:00:01', '2018-04-12 14:00:07');
INSERT INTO `payment_tb` VALUES ('1083', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121400227657', '0.02', '2', '4', null, null, '1016', '2018-04-12 14:00:22', '2018-04-12 14:00:27');
INSERT INTO `payment_tb` VALUES ('1084', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121400366086', '0.10', '3', '4', null, null, '1016', '2018-04-12 14:00:37', '2018-04-12 14:00:41');
INSERT INTO `payment_tb` VALUES ('1085', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121400589684', '0.20', '1', '4', null, null, '1016', '2018-04-12 14:00:59', '2018-04-12 14:00:59');
INSERT INTO `payment_tb` VALUES ('1086', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121401206255', '0.10', '3', '4', null, null, '1016', '2018-04-12 14:01:21', '2018-04-12 14:01:23');
INSERT INTO `payment_tb` VALUES ('1087', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121401356494', '0.01', '2', '4', null, null, '1016', '2018-04-12 14:01:36', '2018-04-12 14:01:39');
INSERT INTO `payment_tb` VALUES ('1088', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121427278367', '0.10', '3', '4', null, null, '1016', '2018-04-12 14:27:28', '2018-04-12 14:27:34');
INSERT INTO `payment_tb` VALUES ('1089', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121427548873', '0.01', '2', '4', null, null, '1016', '2018-04-12 14:27:55', '2018-04-12 14:27:59');
INSERT INTO `payment_tb` VALUES ('1090', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121428333625', '1.00', '3', '4', null, null, '1016', '2018-04-12 14:28:34', '2018-04-12 14:28:37');
INSERT INTO `payment_tb` VALUES ('1091', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121429103131', '0.01', '2', '4', null, null, '1016', '2018-04-12 14:29:11', '2018-04-12 14:29:14');
INSERT INTO `payment_tb` VALUES ('1092', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121429404785', '0.09', '2', '4', null, null, '1016', '2018-04-12 14:29:40', '2018-04-12 14:29:45');
INSERT INTO `payment_tb` VALUES ('1093', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121431223342', '100.00', '1', '4', null, null, '1016', '2018-04-12 14:31:23', '2018-04-12 14:31:23');
INSERT INTO `payment_tb` VALUES ('1094', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121431406127', '0.01', '2', '4', null, null, '1016', '2018-04-12 14:31:41', '2018-04-12 14:32:09');
INSERT INTO `payment_tb` VALUES ('1095', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201804121457002175', '365.00', '1', '1', '1002', null, '1016', '2018-04-12 14:57:00', '2018-04-12 14:57:00');
INSERT INTO `payment_tb` VALUES ('1096', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121521575302', '1.00', '1', '4', null, null, '1016', '2018-04-12 15:21:57', '2018-04-12 15:21:57');
INSERT INTO `payment_tb` VALUES ('1097', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804121524308954', '1.00', '1', '4', null, null, '1016', '2018-04-12 15:24:31', '2018-04-12 15:24:31');
INSERT INTO `payment_tb` VALUES ('1098', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201804171503027424', '365.00', '1', '1', '1002', null, '1016', '2018-04-17 15:03:03', '2018-04-17 15:03:03');
INSERT INTO `payment_tb` VALUES ('1099', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804171503498316', '0.01', '2', '4', null, null, '1016', '2018-04-17 15:03:50', '2018-04-17 15:04:31');
INSERT INTO `payment_tb` VALUES ('1100', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201804171504496848', '0.11', '2', '4', null, null, '1016', '2018-04-17 15:04:50', '2018-04-17 15:05:09');
INSERT INTO `payment_tb` VALUES ('1101', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1012201805071336316459', '365.00', '1', '1', '1002', null, '1012', '2018-05-07 13:36:31', '2018-05-07 13:36:31');
INSERT INTO `payment_tb` VALUES ('1102', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1009201805301644327392', '999999999.99', '1', '4', null, null, '1009', '2018-05-30 16:44:33', '2018-05-30 16:44:33');
INSERT INTO `payment_tb` VALUES ('1103', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1009201805311423085237', '100.00', '1', '4', null, null, '1009', '2018-05-31 14:23:08', '2018-05-31 14:23:08');
INSERT INTO `payment_tb` VALUES ('1104', '付费课程', '付费课程', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1012201805312302469736', '100.00', '1', '3', '1031', null, '1012', '2018-05-31 23:02:46', '2018-05-31 23:02:46');
INSERT INTO `payment_tb` VALUES ('1105', '付费课程', '付费课程', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201806041330344703', '100.00', '1', '3', '1031', null, '1016', '2018-06-04 13:30:34', '2018-06-04 13:30:34');
INSERT INTO `payment_tb` VALUES ('1106', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1009201806081346259731', '0.10', '3', '4', null, null, '1009', '2018-06-08 13:46:26', '2018-06-08 13:46:32');
INSERT INTO `payment_tb` VALUES ('1107', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1009201806081347278948', '0.20', '3', '4', null, null, '1009', '2018-06-08 13:47:27', '2018-06-08 13:47:30');
INSERT INTO `payment_tb` VALUES ('1108', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1009201806081350123832', '0.20', '3', '4', null, null, '1009', '2018-06-08 13:50:13', '2018-06-08 13:50:17');
INSERT INTO `payment_tb` VALUES ('1109', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1041201806081357056983', '0.10', '1', '4', null, null, '1041', '2018-06-08 13:57:05', '2018-06-08 13:57:05');
INSERT INTO `payment_tb` VALUES ('1110', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201806081457448109', '0.01', '2', '4', null, null, '1014', '2018-06-08 14:57:44', '2018-06-08 14:57:52');
INSERT INTO `payment_tb` VALUES ('1111', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201806131340092211', '1.00', '1', '4', null, null, '1016', '2018-06-13 13:40:10', '2018-06-13 13:40:10');
INSERT INTO `payment_tb` VALUES ('1112', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201806131340176991', '0.10', '3', '4', null, null, '1016', '2018-06-13 13:40:17', '2018-06-13 13:40:21');
INSERT INTO `payment_tb` VALUES ('1113', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201806131341304654', '0.01', '2', '4', null, null, '1016', '2018-06-13 13:41:31', '2018-06-13 13:41:35');
INSERT INTO `payment_tb` VALUES ('1114', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201806131341555306', '0.12', '2', '4', null, null, '1016', '2018-06-13 13:41:56', '2018-06-13 13:41:59');
INSERT INTO `payment_tb` VALUES ('1115', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1044201806131411305097', '365.00', '1', '1', '1002', null, '1044', '2018-06-13 14:11:30', '2018-06-13 14:11:30');
INSERT INTO `payment_tb` VALUES ('1116', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1044201807041417405526', '365.00', '1', '1', '1002', null, '1044', '2018-07-04 14:17:41', '2018-07-04 14:17:41');
INSERT INTO `payment_tb` VALUES ('1117', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807041628221076', '0.01', '1', '4', null, null, '1016', '2018-07-04 16:28:22', '2018-07-04 16:28:22');
INSERT INTO `payment_tb` VALUES ('1118', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807041629306628', '0.01', '2', '4', null, null, '1016', '2018-07-04 16:29:30', '2018-07-04 16:29:43');
INSERT INTO `payment_tb` VALUES ('1119', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807041639315249', '0.01', '1', '4', null, null, '1016', '2018-07-04 16:39:31', '2018-07-04 16:39:31');
INSERT INTO `payment_tb` VALUES ('1120', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1041201807041648392164', '100.00', '1', '4', null, null, '1041', '2018-07-04 16:48:39', '2018-07-04 16:48:39');
INSERT INTO `payment_tb` VALUES ('1121', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201807041655316485', '0.01', '1', '4', null, null, '1014', '2018-07-04 16:55:32', '2018-07-04 16:55:32');
INSERT INTO `payment_tb` VALUES ('1122', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201807041725559485', '0.01', '1', '4', null, null, '1014', '2018-07-04 17:25:56', '2018-07-04 17:25:56');
INSERT INTO `payment_tb` VALUES ('1123', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1041201807041728286629', '100.00', '1', '4', null, null, '1041', '2018-07-04 17:28:28', '2018-07-04 17:28:28');
INSERT INTO `payment_tb` VALUES ('1124', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807041734582413', '0.01', '2', '4', null, null, '1016', '2018-07-04 17:34:59', '2018-07-04 17:35:14');
INSERT INTO `payment_tb` VALUES ('1125', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201807041735201338', '0.01', '1', '4', null, null, '1014', '2018-07-04 17:35:20', '2018-07-04 17:35:20');
INSERT INTO `payment_tb` VALUES ('1126', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807041735357769', '0.10', '3', '4', null, null, '1016', '2018-07-04 17:35:35', '2018-07-04 17:35:39');
INSERT INTO `payment_tb` VALUES ('1127', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201807041754226353', '0.00', '1', '4', null, null, '1014', '2018-07-04 17:54:23', '2018-07-04 17:54:23');
INSERT INTO `payment_tb` VALUES ('1128', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1044201807051432084464', '1.00', '1', '4', null, null, '1044', '2018-07-05 14:32:08', '2018-07-05 14:32:08');
INSERT INTO `payment_tb` VALUES ('1129', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1044201807051433189116', '1.00', '1', '4', null, null, '1044', '2018-07-05 14:33:18', '2018-07-05 14:33:18');
INSERT INTO `payment_tb` VALUES ('1130', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1044201807051433265808', '0.10', '3', '4', null, null, '1044', '2018-07-05 14:33:26', '2018-07-05 14:35:18');
INSERT INTO `payment_tb` VALUES ('1131', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1044201807051436053747', '0.20', '3', '4', null, null, '1044', '2018-07-05 14:36:05', '2018-07-05 14:36:20');
INSERT INTO `payment_tb` VALUES ('1132', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1044201807051436483736', '0.01', '2', '4', null, null, '1044', '2018-07-05 14:36:49', '2018-07-05 14:37:06');
INSERT INTO `payment_tb` VALUES ('1133', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1044201807051437184034', '1.01', '2', '4', null, null, '1044', '2018-07-05 14:37:19', '2018-07-05 14:37:33');
INSERT INTO `payment_tb` VALUES ('1134', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1041201807051446457898', '0.10', '3', '4', null, null, '1041', '2018-07-05 14:46:46', '2018-07-05 14:46:58');
INSERT INTO `payment_tb` VALUES ('1135', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1041201807051502197928', '0.01', '2', '4', null, null, '1041', '2018-07-05 15:02:19', '2018-07-05 15:02:27');
INSERT INTO `payment_tb` VALUES ('1136', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201807051610171000', '0.10', '3', '4', null, null, '1014', '2018-07-05 16:10:18', '2018-07-05 16:10:29');
INSERT INTO `payment_tb` VALUES ('1137', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201807051614409634', '0.01', '2', '4', null, null, '1014', '2018-07-05 16:14:41', '2018-07-05 16:14:50');
INSERT INTO `payment_tb` VALUES ('1138', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201807051624297409', '0.10', '1', '4', null, null, '1014', '2018-07-05 16:24:29', '2018-07-05 16:24:29');
INSERT INTO `payment_tb` VALUES ('1139', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201807051625101039', '0.10', '2', '4', null, null, '1014', '2018-07-05 16:25:11', '2018-07-05 16:25:18');
INSERT INTO `payment_tb` VALUES ('1140', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1041201807051627544473', '0.10', '2', '4', null, null, '1041', '2018-07-05 16:27:54', '2018-07-05 16:28:02');
INSERT INTO `payment_tb` VALUES ('1141', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1044201807051632048909', '0.10', '2', '4', null, null, '1044', '2018-07-05 16:32:04', '2018-07-05 16:32:44');
INSERT INTO `payment_tb` VALUES ('1142', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1044201807051632572440', '0.20', '2', '4', null, null, '1044', '2018-07-05 16:32:58', '2018-07-05 16:33:16');
INSERT INTO `payment_tb` VALUES ('1143', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807051646004485', '0.10', '2', '4', null, null, '1016', '2018-07-05 16:46:00', '2018-07-05 16:46:03');
INSERT INTO `payment_tb` VALUES ('1144', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807051646437258', '0.20', '2', '4', null, null, '1016', '2018-07-05 16:46:43', '2018-07-05 16:46:47');
INSERT INTO `payment_tb` VALUES ('1145', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807051647306629', '0.10', '2', '4', null, null, '1016', '2018-07-05 16:47:30', '2018-07-05 16:47:35');
INSERT INTO `payment_tb` VALUES ('1146', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1041201807051658076312', '0.01', '2', '4', null, null, '1041', '2018-07-05 16:58:07', '2018-07-05 16:58:14');
INSERT INTO `payment_tb` VALUES ('1147', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1041201807201521357519', '0.01', '2', '4', null, null, '1041', '2018-07-20 15:21:35', '2018-07-20 15:21:52');
INSERT INTO `payment_tb` VALUES ('1148', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807301434016387', '0.10', '2', '4', null, null, '1016', '2018-07-30 14:34:01', '2018-07-30 14:34:07');
INSERT INTO `payment_tb` VALUES ('1149', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807301446574693', '0.01', '2', '4', null, null, '1016', '2018-07-30 14:46:57', '2018-07-30 14:47:01');
INSERT INTO `payment_tb` VALUES ('1150', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1041201807301549542362', '0.01', '2', '4', null, null, '1041', '2018-07-30 15:49:54', '2018-07-30 15:50:12');
INSERT INTO `payment_tb` VALUES ('1151', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1041201807301559074157', '0.01', '1', '4', null, null, '1041', '2018-07-30 15:59:08', '2018-07-30 15:59:08');
INSERT INTO `payment_tb` VALUES ('1152', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1016201807301618203459', '0.10', '2', '4', null, null, '1016', '2018-07-30 16:18:21', '2018-07-30 16:19:45');
INSERT INTO `payment_tb` VALUES ('1153', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1052201807311114332156', '0.01', '2', '4', null, null, '1052', '2018-07-31 11:14:33', '2018-07-31 11:15:31');
INSERT INTO `payment_tb` VALUES ('1154', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1052201807311443178198', '0.01', '2', '4', null, null, '1052', '2018-07-31 14:43:17', '2018-07-31 14:43:48');
INSERT INTO `payment_tb` VALUES ('1155', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1052201807311447448089', '0.01', '2', '4', null, null, '1052', '2018-07-31 14:47:44', '2018-07-31 14:48:08');
INSERT INTO `payment_tb` VALUES ('1156', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1052201807311450423472', '0.01', '2', '4', null, null, '1052', '2018-07-31 14:50:42', '2018-07-31 14:51:01');
INSERT INTO `payment_tb` VALUES ('1157', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1052201807311454334836', '0.01', '2', '4', null, null, '1052', '2018-07-31 14:54:34', '2018-07-31 14:55:13');
INSERT INTO `payment_tb` VALUES ('1158', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1052201807311457146075', '0.01', '2', '4', null, null, '1052', '2018-07-31 14:57:15', '2018-07-31 14:57:40');
INSERT INTO `payment_tb` VALUES ('1159', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1014201810251600251431', '0.01', '1', '4', null, null, '1014', '2018-10-25 16:00:26', '2018-10-25 16:00:26');
INSERT INTO `payment_tb` VALUES ('1160', '充值', '充值', 'http://server.laoyeshuo.cn/finance/alipayRechargeNotifyUrl', '1', '1055201811231103144858', '0.10', '2', '4', null, null, '1055', '2018-11-23 11:03:14', '2018-11-23 11:04:18');
INSERT INTO `payment_tb` VALUES ('1161', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201811231606273138', '365.00', '1', '1', '1002', null, '1016', '2018-11-23 16:06:27', '2018-11-23 16:06:27');
INSERT INTO `payment_tb` VALUES ('1162', 'VIP购买', 'VIP购买', 'http://server.laoyeshuo.cn/payment/alipayNotifyUrl', '1', '1016201811231607202829', '365.00', '1', '1', '1002', null, '1016', '2018-11-23 16:07:21', '2018-11-23 16:07:21');

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
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8 COMMENT='收货地址表 ';

-- ----------------------------
-- Records of receipt_info_tb
-- ----------------------------
INSERT INTO `receipt_info_tb` VALUES ('1002', '协议', '144676494376', '贵州省 安顺市 ;心如止水一样一样', '1', '2018-01-27 19:38:42', '2018-01-27 19:38:55', '1009');
INSERT INTO `receipt_info_tb` VALUES ('1003', '就看看', '56655', '广东省 河源市 ;书海', '0', '2018-02-22 16:50:11', '2018-02-22 16:50:11', '1015');
INSERT INTO `receipt_info_tb` VALUES ('1004', '测试', '15068747539', '浙江省 杭州市 ;西湖区天目山路', '0', '2018-04-17 14:23:53', '2018-04-17 14:23:53', '1016');
INSERT INTO `receipt_info_tb` VALUES ('1005', 'iuyuu', '22556625585', '安徽省 滁州市 ;jjyyiilkk', '0', '2018-04-17 14:45:57', '2018-04-17 14:45:57', '1015');
INSERT INTO `receipt_info_tb` VALUES ('1006', '测试', '15068747539', '安徽省 安庆市 ;测试', '0', '2018-04-17 16:45:10', '2018-04-17 16:45:10', '1017');
INSERT INTO `receipt_info_tb` VALUES ('1007', '测试', '15068747539', '福建省 福州市 ;奇偶数', '0', '2018-04-17 16:45:34', '2018-04-17 16:45:34', '1017');
INSERT INTO `receipt_info_tb` VALUES ('1008', '六六六', '18300000000', '安徽省 安庆市 ;就是这里', '0', '2018-04-18 09:29:07', '2018-04-18 09:29:07', '1019');
INSERT INTO `receipt_info_tb` VALUES ('1009', '三亚', '18300000000', '广东省 潮州市 ;还是这里', '1', '2018-04-18 09:29:28', '2018-04-18 09:29:37', '1019');
INSERT INTO `receipt_info_tb` VALUES ('1012', '啦啦啦', '18300100123', '安徽省 安庆市 ;呵呵', '0', '2018-05-07 13:39:02', '2018-05-07 13:39:02', '1009');
INSERT INTO `receipt_info_tb` VALUES ('1013', '来咯', '17702183918', '广西壮族自治区 百色市 ;那你以为', '1', '2018-05-12 22:10:42', '2018-05-12 22:12:20', '1012');

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
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role_tb
-- ----------------------------
INSERT INTO `role_tb` VALUES ('1000', '超级管理员', '超级管理员', '2018-01-19 15:46:08');
INSERT INTO `role_tb` VALUES ('1001', '用户', '用户', '2018-01-19 15:46:08');
INSERT INTO `role_tb` VALUES ('1002', '普通管理员', '普通管理员', '2018-04-03 14:59:35');

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
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COMMENT='拆分表';

-- ----------------------------
-- Records of split_tb
-- ----------------------------
INSERT INTO `split_tb` VALUES ('1000', '哦？是吗', '17702183918', '17702183918', '无', '39', '4500.00', '2018-02-09 15:41:55', '2018-02-24 09:23:14', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1', null, '1000', '1009', '1005');
INSERT INTO `split_tb` VALUES ('1001', '哦？是吗', '17702183918', '17702183918', '无', '250', '25000.00', '2018-02-24 11:07:30', '2018-02-24 18:00:04', '2018-02-24 11:07:30', '2018-02-24 11:07:30', '1', null, '1000', '1009', '1010');
INSERT INTO `split_tb` VALUES ('1002', '123', '15211547807', '15211547807', '无', '39', '4500.00', '2018-03-05 12:35:01', '2018-03-06 11:48:41', '2018-03-05 12:35:01', '2018-03-05 12:35:01', '1', null, '1000', '1010', '1015');
INSERT INTO `split_tb` VALUES ('1003', '123', '15211547807', '15211547807', '无', '250', '25000.00', '2018-03-13 01:06:14', '2018-03-13 16:48:00', '2018-03-13 01:06:14', '2018-03-13 01:06:14', '1', null, '1000', '1010', '1018');
INSERT INTO `split_tb` VALUES ('1004', '强壮的土豆', '18367175373', '18367175373', '无', '39', '4500.00', '2018-06-12 16:09:55', null, '2018-06-12 16:09:55', '2018-06-12 16:09:55', '0', null, '1000', '1038', '1027');

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
) ENGINE=InnoDB AUTO_INCREMENT=1010 DEFAULT CHARSET=utf8 COMMENT='团购信息表 ';

-- ----------------------------
-- Records of team_purchase_info_tb
-- ----------------------------
INSERT INTO `team_purchase_info_tb` VALUES ('1000', '1892', '0', '0', '0.00', '2018-02-05 15:18:48', '0', '0.00', '2018-02-05 15:19:07', '578', '59000.00', '2018-03-13 16:47:59', '0', '0.00', '2018-02-05 15:20:20', '2018-02-05 15:20:22', '2018-05-31 17:11:40', '1000');
INSERT INTO `team_purchase_info_tb` VALUES ('1001', '289', '289', '0', '0.00', '2018-03-13 16:47:59', '289', '29500.00', '2018-03-13 16:47:59', '0', '0.00', '2018-02-05 17:09:20', '0', '0.00', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '2018-03-13 16:47:59', '1010');
INSERT INTO `team_purchase_info_tb` VALUES ('1002', '285', '289', '0', '0.00', '2018-02-24 18:00:04', '289', '29500.00', '2018-02-24 18:00:04', '0', '0.00', '2018-02-06 15:35:18', '0', '0.00', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '2018-07-20 15:38:46', '1009');
INSERT INTO `team_purchase_info_tb` VALUES ('1003', '0', '0', '0', '0.00', '2018-02-10 13:59:05', '0', '0.00', '2018-02-10 13:59:05', '0', '0.00', '2018-02-10 13:59:05', '0', '0.00', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1014');
INSERT INTO `team_purchase_info_tb` VALUES ('1005', '0', '39', '39', '4500.00', '2018-06-12 16:09:55', '0', '0.00', '2018-05-31 17:11:40', '0', '0.00', '2018-05-31 17:11:40', '0', '0.00', '2018-05-31 17:11:40', '2018-05-31 17:11:40', '2018-06-12 16:09:55', '1038');
INSERT INTO `team_purchase_info_tb` VALUES ('1006', '0', '0', '0', '0.00', '2018-06-01 11:05:13', '0', '0.00', '2018-06-01 11:05:13', '0', '0.00', '2018-06-01 11:05:13', '0', '0.00', '2018-06-01 11:05:13', '2018-06-01 11:05:13', '2018-06-01 11:05:13', '1019');
INSERT INTO `team_purchase_info_tb` VALUES ('1007', '0', '0', '0', '0.00', '2018-06-01 17:46:32', '0', '0.00', '2018-06-01 17:46:32', '0', '0.00', '2018-06-01 17:46:32', '0', '0.00', '2018-06-01 17:46:32', '2018-06-01 17:46:32', '2018-06-01 17:46:32', '1042');
INSERT INTO `team_purchase_info_tb` VALUES ('1008', '0', '0', '0', '0.00', '2018-06-27 10:18:52', '0', '0.00', '2018-06-27 10:18:52', '0', '0.00', '2018-06-27 10:18:52', '0', '0.00', '2018-06-27 10:18:52', '2018-06-27 10:18:52', '2018-06-27 10:18:52', '1052');
INSERT INTO `team_purchase_info_tb` VALUES ('1009', '0', '0', '0', '0.00', '2018-07-20 15:38:46', '0', '0.00', '2018-07-20 15:38:46', '0', '0.00', '2018-07-20 15:38:46', '0', '0.00', '2018-07-20 15:38:46', '2018-07-20 15:38:46', '2018-07-20 15:38:46', '1041');

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
INSERT INTO `video_cache_tb` VALUES ('1000', 'cs5', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '6', '4.20MB', '1009', '2018-03-02 14:04:40', '5');
INSERT INTO `video_cache_tb` VALUES ('1001', 'cesh3', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '6', '15.76MB', '1009', '2018-03-02 14:05:18', '3');
INSERT INTO `video_cache_tb` VALUES ('1002', '测试22', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '6', '15.76MB', '1009', '2018-03-02 14:05:22', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=1668 DEFAULT CHARSET=utf8 COMMENT='视频播放记录表';

-- ----------------------------
-- Records of video_play_record_tb
-- ----------------------------
INSERT INTO `video_play_record_tb` VALUES ('1530', 'ccccc', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-04-01 13:05:35', '10');
INSERT INTO `video_play_record_tb` VALUES ('1531', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-04-01 16:46:33', '12');
INSERT INTO `video_play_record_tb` VALUES ('1532', 'cc2', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1010', '2018-04-01 17:46:18', '7');
INSERT INTO `video_play_record_tb` VALUES ('1533', 'cccccd', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', '1010', '2018-04-01 02:20:50', '11');
INSERT INTO `video_play_record_tb` VALUES ('1536', 'ccc', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1014', '2018-03-16 21:15:02', '8');
INSERT INTO `video_play_record_tb` VALUES ('1540', 'cc2', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1009', '2018-04-01 21:38:27', '7');
INSERT INTO `video_play_record_tb` VALUES ('1544', 'cc2', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1019', '2018-04-03 10:20:18', '7');
INSERT INTO `video_play_record_tb` VALUES ('1549', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1000', '2018-03-27 14:01:45', '13');
INSERT INTO `video_play_record_tb` VALUES ('1550', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1000', '2018-03-27 14:02:33', '12');
INSERT INTO `video_play_record_tb` VALUES ('1551', 'cccccd', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', '1000', '2018-03-27 14:03:09', '11');
INSERT INTO `video_play_record_tb` VALUES ('1552', 'ccccc', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1000', '2018-03-27 14:04:55', '10');
INSERT INTO `video_play_record_tb` VALUES ('1553', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1000', '2018-04-03 11:11:59', '14');
INSERT INTO `video_play_record_tb` VALUES ('1554', 'ccc', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1000', '2018-03-27 14:13:50', '8');
INSERT INTO `video_play_record_tb` VALUES ('1555', '测试22', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1000', '2018-03-27 14:13:54', '2');
INSERT INTO `video_play_record_tb` VALUES ('1556', 'cc2', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1000', '2018-03-27 14:14:35', '7');
INSERT INTO `video_play_record_tb` VALUES ('1557', 'cc', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1000', '2018-03-27 14:16:46', '6');
INSERT INTO `video_play_record_tb` VALUES ('1558', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3j6fm3ae1pd21efcf8u1pvq2f.jpg', '00:00:12', '1.54', '1018', '2018-03-27 14:58:52', '15');
INSERT INTO `video_play_record_tb` VALUES ('1559', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-03-31 19:21:29', '13');
INSERT INTO `video_play_record_tb` VALUES ('1560', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3j6fm3ae1pd21efcf8u1pvq2f.jpg', '00:00:12', '1.54', '1010', '2018-04-01 16:51:44', '15');
INSERT INTO `video_play_record_tb` VALUES ('1561', 'cccc', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-04-01 16:42:13', '9');
INSERT INTO `video_play_record_tb` VALUES ('1563', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c9j3j6fm3ae1pd21efcf8u1pvq2f.jpg', '00:00:12', '1.54', '1000', '2018-04-03 11:11:08', '15');
INSERT INTO `video_play_record_tb` VALUES ('1566', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-04-03 09:06:38', '14');
INSERT INTO `video_play_record_tb` VALUES ('1569', '测试视频04031006', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca4k2ng6anh1iovhun12k11jf71d.jpg', '00:00:16', '20.19', '1019', '2018-04-03 10:16:12', '16');
INSERT INTO `video_play_record_tb` VALUES ('1570', 'cc', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1019', '2018-04-03 10:20:23', '6');
INSERT INTO `video_play_record_tb` VALUES ('1574', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca4lqkts56a1tgo1gc1qmokjp1h.jpg', '00:08:02', '83.42', '1000', '2018-04-03 11:12:34', '17');
INSERT INTO `video_play_record_tb` VALUES ('1576', '如何为自己的公司团队提供附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca57ti8d19p893kh1o10tduac22h.jpg', '00:25:08', '191.68', '1010', '2018-04-05 23:13:05', '27');
INSERT INTO `video_play_record_tb` VALUES ('1577', '微商的五件事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca5b08701arf18dl1t82vs315n6316.jpg', '00:25:09', '191.68', '1000', '2018-05-01 16:20:55', '30');
INSERT INTO `video_play_record_tb` VALUES ('1583', '如何计算自己的时间价值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai7se4o14rp18ef1cleu7f197tqu.jpg', '00:25:08', '191.68', '1000', '2018-04-11 10:30:25', '37');
INSERT INTO `video_play_record_tb` VALUES ('1584', '微商当中的各种怂坑', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai67e2ljoa1p5u1gnt1f3i1e8eam.jpg', '00:25:07', '191.67', '1000', '2018-04-11 10:28:56', '35');
INSERT INTO `video_play_record_tb` VALUES ('1585', '成功人士的八个武器', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca534c3v18f7651f85ksr2hgu1.jpg', '00:25:08', '191.72', '1000', '2018-11-23 11:18:35', '21');
INSERT INTO `video_play_record_tb` VALUES ('1586', '如何针对顾客的心理需求', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca522ojmmaq1asoa5hq917dbi8.jpg', '00:25:02', '191.71', '1000', '2018-11-23 11:18:47', '20');
INSERT INTO `video_play_record_tb` VALUES ('1587', '人怎么给到产品附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai2ce0h10ak1v8p1sb51idbujfhr.jpg', '00:25:06', '191.70', '1000', '2018-04-11 10:29:27', '33');
INSERT INTO `video_play_record_tb` VALUES ('1588', '人怎么给到产品附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai2ce0h10ak1v8p1sb51idbujfhr.jpg', '00:25:06', '191.70', '1010', '2018-04-11 19:46:49', '33');
INSERT INTO `video_play_record_tb` VALUES ('1589', '团队老大给到团队的扶持是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai3i3soasdaqt1pfv1l24gkt2n.jpg', '00:25:06', '191.69', '1010', '2018-04-11 21:32:29', '34');
INSERT INTO `video_play_record_tb` VALUES ('1597', '如何借力用力', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai6ss471i11f4ip35fhmgqpiq.jpg', '00:25:06', '191.71', '1021', '2018-04-17 14:39:05', '36');
INSERT INTO `video_play_record_tb` VALUES ('1598', '如何借力用力', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai6ss471i11f4ip35fhmgqpiq.jpg', '00:25:06', '191.71', '1017', '2018-04-17 16:54:11', '36');
INSERT INTO `video_play_record_tb` VALUES ('1599', '如何计算自己的时间价值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai7se4o14rp18ef1cleu7f197tqu.jpg', '00:25:08', '191.68', '1009', '2018-04-17 17:06:53', '37');
INSERT INTO `video_play_record_tb` VALUES ('1600', '微商当中的各种怂坑', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai67e2ljoa1p5u1gnt1f3i1e8eam.jpg', '00:25:07', '191.67', '1009', '2018-04-17 17:07:05', '35');
INSERT INTO `video_play_record_tb` VALUES ('1601', '如何借力用力', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai6ss471i11f4ip35fhmgqpiq.jpg', '00:25:06', '191.71', '1009', '2018-04-17 17:42:02', '36');
INSERT INTO `video_play_record_tb` VALUES ('1603', '团队老大给到团队的扶持是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai3i3soasdaqt1pfv1l24gkt2n.jpg', '00:25:06', '191.69', '1009', '2018-04-17 17:41:54', '34');
INSERT INTO `video_play_record_tb` VALUES ('1605', '如何借力用力', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai6ss471i11f4ip35fhmgqpiq.jpg', '00:25:06', '191.71', '1015', '2018-04-17 17:48:55', '36');
INSERT INTO `video_play_record_tb` VALUES ('1606', '成功人士的八个武器', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca534c3v18f7651f85ksr2hgu1.jpg', '00:25:08', '191.72', '1009', '2018-04-17 17:50:02', '21');
INSERT INTO `video_play_record_tb` VALUES ('1607', '如何搞定自己', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cb9ftd4s14jn1nlo1kbfsjt1c3kg3.jpg', '00:25:08', '191.71', '1000', '2018-04-22 15:14:42', '38');
INSERT INTO `video_play_record_tb` VALUES ('1608', '一个良好的职业形象是你成功的根本', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtubb0q1301178m1fsb17egaf8n2.jpg', '00:25:04', '191.67', '1010', '2018-05-01 15:17:11', '41');
INSERT INTO `video_play_record_tb` VALUES ('1609', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', '1010', '2018-05-15 13:05:56', '43');
INSERT INTO `video_play_record_tb` VALUES ('1610', '通过筛选产品告诉你，你缺的是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1g2vmcph1384tbn7ai61o1en.jpg', '00:25:05', '191.67', '1000', '2018-06-26 23:36:14', '44');
INSERT INTO `video_play_record_tb` VALUES ('1611', '一个人的消费观念和是否跟你购买产品是两回事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1u003pv21fqn1du31ad0stb1md.jpg', '00:25:10', '191.67', '1000', '2018-05-01 16:21:47', '45');
INSERT INTO `video_play_record_tb` VALUES ('1612', '人怎么给到产品附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai2ce0h10ak1v8p1sb51idbujfhr.jpg', '00:25:06', '191.70', '1009', '2018-05-07 13:54:15', '33');
INSERT INTO `video_play_record_tb` VALUES ('1615', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', '1009', '2018-07-04 14:50:05', '43');
INSERT INTO `video_play_record_tb` VALUES ('1616', '如何现身说法', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca51c5fukus20n133e16ok1hplad.jpg', '00:25:07', '191.69', '1000', '2018-05-23 22:29:08', '19');
INSERT INTO `video_play_record_tb` VALUES ('1617', '如何快速转战成为代理', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca4ohvat5v3kc32dr149065k1b.jpg', '00:25:08', '96.33', '1000', '2018-05-23 22:30:25', '18');
INSERT INTO `video_play_record_tb` VALUES ('1618', '如何纳新和管理', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca54lnom1hd09mu131t6bu1maq1f7.jpg', '00:25:08', '191.71', '1000', '2018-05-23 22:30:46', '26');
INSERT INTO `video_play_record_tb` VALUES ('1619', '一个良好的职业形象是你成功的根本', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtubb0q1301178m1fsb17egaf8n2.jpg', '00:25:04', '191.67', '1000', '2018-05-29 18:08:39', '41');
INSERT INTO `video_play_record_tb` VALUES ('1620', '通过筛选产品告诉你，你缺的是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1g2vmcph1384tbn7ai61o1en.jpg', '00:25:05', '191.67', '1009', '2018-05-31 14:28:10', '44');
INSERT INTO `video_play_record_tb` VALUES ('1621', '如何快速转战成为代理', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca4ohvat5v3kc32dr149065k1b.jpg', '00:25:08', '96.33', '1009', '2018-07-04 14:49:57', '18');
INSERT INTO `video_play_record_tb` VALUES ('1622', '一个人的消费观念和是否跟你购买产品是两回事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1u003pv21fqn1du31ad0stb1md.jpg', '00:25:10', '191.67', '1009', '2018-07-04 14:50:47', '45');
INSERT INTO `video_play_record_tb` VALUES ('1623', '老梗的新认知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu3cn7l1apt1s191pkj1i6sov9v.jpg', '00:25:04', '191.71', '1000', '2018-05-31 16:42:54', '47');
INSERT INTO `video_play_record_tb` VALUES ('1624', '老梗的新认知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu3cn7l1apt1s191pkj1i6sov9v.jpg', '00:25:04', '191.71', '1038', '2018-05-31 17:03:19', '47');
INSERT INTO `video_play_record_tb` VALUES ('1625', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2vugj1vna19f03r6e5p1lnk226.jpg', '00:25:06', '191.71', '1038', '2018-05-31 17:03:20', '46');
INSERT INTO `video_play_record_tb` VALUES ('1626', '微商的五件事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca5b08701arf18dl1t82vs315n6316.jpg', '00:25:09', '191.68', '1009', '2018-06-05 11:19:43', '30');
INSERT INTO `video_play_record_tb` VALUES ('1627', '如何针对顾客的心理需求', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca522ojmmaq1asoa5hq917dbi8.jpg', '00:25:02', '191.71', '1009', '2018-06-08 13:44:56', '20');
INSERT INTO `video_play_record_tb` VALUES ('1628', '如何搞定自己', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cb9ftd4s14jn1nlo1kbfsjt1c3kg3.jpg', '00:25:08', '191.71', '1009', '2018-06-08 13:41:56', '38');
INSERT INTO `video_play_record_tb` VALUES ('1629', '人怎么给到产品附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai2ce0h10ak1v8p1sb51idbujfhr.jpg', '00:25:06', '191.70', '1038', '2018-06-12 16:14:23', '33');
INSERT INTO `video_play_record_tb` VALUES ('1630', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', '1016', '2018-11-23 12:34:03', '43');
INSERT INTO `video_play_record_tb` VALUES ('1631', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', '1041', '2018-07-20 16:33:52', '43');
INSERT INTO `video_play_record_tb` VALUES ('1632', '如何为自己的公司团队提供附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca57ti8d19p893kh1o10tduac22h.jpg', '00:25:08', '191.68', '1014', '2018-06-26 23:22:28', '27');
INSERT INTO `video_play_record_tb` VALUES ('1633', '微商的四个现代化', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai19htf1shrslm10hc1tb61jd9n.jpg', '00:25:08', '191.72', '1000', '2018-06-26 23:36:17', '32');
INSERT INTO `video_play_record_tb` VALUES ('1634', '云商和支商有什么不同？', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtrefa11gpcki4kjrp9inn41.jpg', '00:25:06', '191.67', '1000', '2018-06-26 23:38:21', '39');
INSERT INTO `video_play_record_tb` VALUES ('1635', '微商的五件事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca5b08701arf18dl1t82vs315n6316.jpg', '00:25:09', '191.68', '1014', '2018-06-28 10:49:11', '30');
INSERT INTO `video_play_record_tb` VALUES ('1636', '营销和谈恋爱的相似度', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtv9o2i1l82n7o1gg5nn27t0v1.jpg', '00:25:06', '191.67', '1009', '2018-07-04 14:49:43', '42');
INSERT INTO `video_play_record_tb` VALUES ('1637', '关于线下市场开拓', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca59j35o7kd3vr19uo6hfogq2o1.jpg', '00:25:05', '191.67', '1009', '2018-07-04 14:48:06', '29');
INSERT INTO `video_play_record_tb` VALUES ('1638', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1chkl1kot1hcu46f7kt11nm1so65e.gif', '00:16:50', '16.50', '1016', '2018-07-05 17:51:23', '49');
INSERT INTO `video_play_record_tb` VALUES ('1639', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1chkl1kot1hcu46f7kt11nm1so65e.gif', '00:16:50', '16.50', '1041', '2018-07-27 09:45:14', '49');
INSERT INTO `video_play_record_tb` VALUES ('1640', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1chkl1kot1hcu46f7kt11nm1so65e.gif', '00:16:50', '16.50', '1014', '2018-07-26 09:23:17', '49');
INSERT INTO `video_play_record_tb` VALUES ('1641', '如何纳新和管理', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca54lnom1hd09mu131t6bu1maq1f7.jpg', '00:25:08', '191.71', '1014', '2018-07-16 18:09:08', '26');
INSERT INTO `video_play_record_tb` VALUES ('1642', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', '1014', '2018-09-06 21:46:48', '43');
INSERT INTO `video_play_record_tb` VALUES ('1643', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1chkl1kot1hcu46f7kt11nm1so65e.gif', '00:16:50', '16.50', '1052', '2018-07-26 14:04:55', '49');
INSERT INTO `video_play_record_tb` VALUES ('1644', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', '1052', '2018-07-31 16:37:21', '43');
INSERT INTO `video_play_record_tb` VALUES ('1645', '如何借力用力', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai6ss471i11f4ip35fhmgqpiq.jpg', '00:25:06', '191.71', '1052', '2018-07-31 16:24:20', '36');
INSERT INTO `video_play_record_tb` VALUES ('1646', '人怎么给到产品附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai2ce0h10ak1v8p1sb51idbujfhr.jpg', '00:25:06', '191.70', '1052', '2018-07-17 13:54:53', '33');
INSERT INTO `video_play_record_tb` VALUES ('1647', '通过筛选产品告诉你，你缺的是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1g2vmcph1384tbn7ai61o1en.jpg', '00:25:05', '191.67', '1041', '2018-07-30 17:16:29', '44');
INSERT INTO `video_play_record_tb` VALUES ('1648', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', '1042', '2018-07-31 16:07:04', '43');
INSERT INTO `video_play_record_tb` VALUES ('1649', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1chkl1kot1hcu46f7kt11nm1so65e.gif', '00:16:50', '16.50', '1042', '2018-07-20 16:36:27', '49');
INSERT INTO `video_play_record_tb` VALUES ('1650', '一个人的消费观念和是否跟你购买产品是两回事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1u003pv21fqn1du31ad0stb1md.jpg', '00:25:10', '191.67', '1014', '2018-07-26 09:46:35', '45');
INSERT INTO `video_play_record_tb` VALUES ('1651', '一个良好的职业形象是你成功的根本', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtubb0q1301178m1fsb17egaf8n2.jpg', '00:25:04', '191.67', '1014', '2018-07-26 09:37:59', '41');
INSERT INTO `video_play_record_tb` VALUES ('1652', '通过筛选产品告诉你，你缺的是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1g2vmcph1384tbn7ai61o1en.jpg', '00:25:05', '191.67', '1014', '2018-07-26 09:49:34', '44');
INSERT INTO `video_play_record_tb` VALUES ('1653', '通过筛选产品告诉你，你缺的是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1g2vmcph1384tbn7ai61o1en.jpg', '00:25:05', '191.67', '1052', '2018-07-26 14:03:52', '44');
INSERT INTO `video_play_record_tb` VALUES ('1654', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', '1012', '2018-07-31 23:09:13', '43');
INSERT INTO `video_play_record_tb` VALUES ('1655', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1chkl1kot1hcu46f7kt11nm1so65e.gif', '00:16:50', '16.50', '1012', '2018-07-26 22:47:55', '49');
INSERT INTO `video_play_record_tb` VALUES ('1656', '老梗的新认知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu3cn7l1apt1s191pkj1i6sov9v.jpg', '00:25:04', '191.71', '1041', '2018-08-02 10:05:43', '47');
INSERT INTO `video_play_record_tb` VALUES ('1657', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2vugj1vna19f03r6e5p1lnk226.jpg', '00:25:06', '191.71', '1041', '2018-07-30 17:12:19', '46');
INSERT INTO `video_play_record_tb` VALUES ('1658', '如何借力用力', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai6ss471i11f4ip35fhmgqpiq.jpg', '00:25:06', '191.71', '1042', '2018-07-31 16:04:35', '36');
INSERT INTO `video_play_record_tb` VALUES ('1659', '一个良好的职业形象是你成功的根本', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtubb0q1301178m1fsb17egaf8n2.jpg', '00:25:04', '191.67', '1052', '2018-07-31 16:58:48', '41');
INSERT INTO `video_play_record_tb` VALUES ('1660', '如何快速转战成为代理', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca4ohvat5v3kc32dr149065k1b.jpg', '00:25:08', '96.33', '1052', '2018-07-31 16:37:43', '18');
INSERT INTO `video_play_record_tb` VALUES ('1661', '一个人的消费观念和是否跟你购买产品是两回事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1u003pv21fqn1du31ad0stb1md.jpg', '00:25:10', '191.67', '1052', '2018-07-31 16:43:18', '45');
INSERT INTO `video_play_record_tb` VALUES ('1662', '如何搞定自己', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cb9ftd4s14jn1nlo1kbfsjt1c3kg3.jpg', '00:25:08', '191.71', '1014', '2018-08-23 15:02:45', '38');
INSERT INTO `video_play_record_tb` VALUES ('1663', '老梗的新认知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu3cn7l1apt1s191pkj1i6sov9v.jpg', '00:25:04', '191.71', '1016', '2018-11-23 10:50:30', '47');
INSERT INTO `video_play_record_tb` VALUES ('1664', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', '1000', '2018-11-23 11:18:51', '43');
INSERT INTO `video_play_record_tb` VALUES ('1665', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', '1055', '2018-11-23 13:20:18', '43');
INSERT INTO `video_play_record_tb` VALUES ('1666', '老梗的新认知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu3cn7l1apt1s191pkj1i6sov9v.jpg', '00:25:04', '191.71', '1055', '2018-11-23 13:39:54', '47');
INSERT INTO `video_play_record_tb` VALUES ('1667', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2vugj1vna19f03r6e5p1lnk226.jpg', '00:25:06', '191.71', '1055', '2018-11-23 13:21:37', '46');

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
INSERT INTO `video_set_cate_tb` VALUES ('1000', '婚姻家庭', '婚姻家庭咨询师是为在恋爱、婚姻、家庭生活中遇到各种问题的求助者提供咨询和辅导服务的人员，他们会恪守职业道德，保护求助者的个人隐私，更好地为求助者服务。', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5a23rgp1lttge8ogq13c717cf1f.png', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca2n8cap1au411v01r20ldo1vvq2l.jpg', '110', '2018-04-02 23:10:29');
INSERT INTO `video_set_cate_tb` VALUES ('1001', '子女教育', '教育子女要以引导，引诱，方法，在游戏中学习，娱乐中提高，比赛中锻炼，人才共生就是要吧学习的人放在一起所以他们就爱学习，所以你要运用适当的方法和技巧去引导他，当上学的时候就可以竞争中提高了。', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5a239ko11im15na1gr0b5n1uec1a.png', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca2na7dt14pi1fedorkbkf1nf833.jpg', '195', '2018-11-23 13:20:18');
INSERT INTO `video_set_cate_tb` VALUES ('1002', '演讲口才', '《演讲与口才》是一个杂志出刊。该杂志创始人为邵守义，他对我国演讲与口才理论的研究做出了巨大的贡献，被誉为“新时期演讲事业的开拓者”。', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5a22n7t17de8g913e7gghnou15.png', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca2oj4m5o5e4h01l3g1b951uv1v.jpg', '103', '2018-11-23 11:18:35');
INSERT INTO `video_set_cate_tb` VALUES ('1003', '自我成长', '人一生的主线基本围绕家庭，工作，情感三个方面，其中工作是实现自我最直接的一条线，身边总会有一些成功或是不成功的案例。多数人对成功的理解就是拥有更多的财富，而作为一个从事多年猎头顾问以及心理咨询的我来说，如何将自我成长发挥到极致才是真正的成功。', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5a224rvlcnqfr1h5ao11p4610.png', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca2ljoqjac3lgt8k9hac1e0i1e.jpg', '151', '2018-07-31 16:43:18');
INSERT INTO `video_set_cate_tb` VALUES ('1004', '人际关系', '人际关系这个词是在20世纪初由美国人事管理协会率先提出的，也被称为人际关系论，1933年由美国哈佛大学教授梅约创立。这个概念可以从三个方面理解：\n1、人际关系表明人与人相互交往过程中心理关系的亲密性、融洽性和协调性的程度\n2、人际关系有三种心理成分组成。认知、情感和行为成分\n3、人际关系是在彼此交往的过程中建立和发展起来的。', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5a21jr7r8aang1ih21na11ol8r.png', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca2mu711v441qd6m6hg54vgi2g.jpg', '77', '2018-11-23 11:18:47');
INSERT INTO `video_set_cate_tb` VALUES ('1005', '企业管理', '企业管理是对企业生产经营活动进行计划、组织、指挥、协调和控制等一系列活动的总称，是社会化大生产的客观要求。企业管理是尽可能利用企业的人力、物力、财力、信息等资源，实现多、快、好、省的目标，取得最大的投入产出效率。', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5a21642lig1i7a12siea1m01m.png', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca2mi8he10qf1unb1auq1jobgso2b.jpg', '59', '2018-07-31 16:24:20');
INSERT INTO `video_set_cate_tb` VALUES ('1006', '团队打造', '“没有行动的远见只能是一种梦想，没有远见的行动只能是一种苦役，远见和行动才是世界的希望”', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c5a20f1q9ka31d1acl1l7h18ioh.png', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca2jpt5g1r6t18lb19026l71thi38.jpg', '147', '2018-06-28 10:49:11');
INSERT INTO `video_set_cate_tb` VALUES ('1007', '市场营销', '市场营销（Marketing），又称作市场学、市场行销或行销学，MBA、EMBA等经典商管课程均将市场营销作为对管理者进行管理和教育的重要模块包含在内。市场营销是在创造、沟通、传播和交换产品中，为顾客、客户、合作伙伴以及整个社会带来经济价值的活动、过程和体系。主要是指营销人员针对市场开展经营活动、销售行为的过程。', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c58i4jkm123t1mpa2bkgp8i17h.png', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca2mhl8qg0h18hm1anr124q17t126.jpg', '140', '2018-11-23 13:39:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=1099 DEFAULT CHARSET=utf8 COMMENT='视频集收藏表';

-- ----------------------------
-- Records of video_set_collect_tb
-- ----------------------------
INSERT INTO `video_set_collect_tb` VALUES ('1029', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1000', '2018-03-27 13:59:48', '1007');
INSERT INTO `video_set_collect_tb` VALUES ('1030', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1000', '2018-03-27 14:15:09', '1008');
INSERT INTO `video_set_collect_tb` VALUES ('1033', 'cccccd', 'http://laoyeshuovideo.laoyeshuo.cn/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', '1019', '2018-04-03 10:18:28', '1000');
INSERT INTO `video_set_collect_tb` VALUES ('1038', '如何借力用力', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai6sc6hag12041i4oc8h1ep5hk.jpg', '00:25:06', '191.71', '1021', '2018-04-17 14:39:18', '1024');
INSERT INTO `video_set_collect_tb` VALUES ('1039', '如何借力用力', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai6ss471i11f4ip35fhmgqpiq.jpg', '00:25:06', '191.71', '1017', '2018-04-17 16:47:15', '1024');
INSERT INTO `video_set_collect_tb` VALUES ('1040', '如何搞定自己', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cb9ftd4s14jn1nlo1kbfsjt1c3kg3.jpg', '00:25:08', '191.71', '1019', '2018-04-18 09:21:07', '1025');
INSERT INTO `video_set_collect_tb` VALUES ('1041', '一个良好的职业形象是你成功的根本', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbttv6bl1obfqtavof1p691k6om1.jpg', '00:25:04', '191.67', '1010', '2018-05-01 14:43:22', '1028');
INSERT INTO `video_set_collect_tb` VALUES ('1049', '团队老大给到团队的扶持是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai3i3soasdaqt1pfv1l24gkt2n.jpg', '00:25:06', '191.69', '1012', '2018-05-03 21:01:36', '1022');
INSERT INTO `video_set_collect_tb` VALUES ('1063', '一个良好的职业形象是你成功的根本', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbttv6bl1obfqtavof1p691k6om1.jpg', '00:25:04', '191.67', '1009', '2018-05-07 14:15:04', '1028');
INSERT INTO `video_set_collect_tb` VALUES ('1068', '云商和支商有什么不同？', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtrefa11gpcki4kjrp9inn41.jpg', '00:25:06', '191.67', '1012', '2018-05-12 20:33:56', '1026');
INSERT INTO `video_set_collect_tb` VALUES ('1086', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0ave654k196h3aaev0crj15r.jpg', '00:25:04', '191.67', '1009', '2018-05-13 13:50:06', '1029');
INSERT INTO `video_set_collect_tb` VALUES ('1087', '一个人的消费观念和是否跟你购买产品是两回事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1u003pv21fqn1du31ad0stb1md.jpg', '00:25:10', '191.67', '1013', '2018-05-13 13:55:25', '1027');
INSERT INTO `video_set_collect_tb` VALUES ('1095', '如何计算自己的时间价值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai7ruuu1oird2p5pk1h04rtmpk.jpg', '00:25:08', '191.71', '1009', '2018-06-08 13:42:02', '1025');
INSERT INTO `video_set_collect_tb` VALUES ('1096', '人怎么给到产品附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai2ce0h10ak1v8p1sb51idbujfhr.jpg', '00:25:06', '191.70', '1038', '2018-06-12 16:14:15', '1021');
INSERT INTO `video_set_collect_tb` VALUES ('1097', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0ave654k196h3aaev0crj15r.jpg', '00:25:04', '191.67', '1016', '2018-06-23 13:49:18', '1029');
INSERT INTO `video_set_collect_tb` VALUES ('1098', '测试', 'http://laoyeshuovideo.laoyeshuo.cn/o_1chkktjmc1icccfd1fv4cob1fomo.jpg', '00:16:50', '16.50', '1052', '2018-07-26 14:04:48', '1034');

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
) ENGINE=InnoDB AUTO_INCREMENT=1075 DEFAULT CHARSET=utf8 COMMENT='视频集搜索表';

-- ----------------------------
-- Records of video_set_search_tb
-- ----------------------------
INSERT INTO `video_set_search_tb` VALUES ('1000', '人才', '26', '2018-06-08 13:22:26');
INSERT INTO `video_set_search_tb` VALUES ('1001', '团队', '352', '2018-06-08 13:22:28');
INSERT INTO `video_set_search_tb` VALUES ('1002', '亲子', '11', '2018-04-05 23:16:08');
INSERT INTO `video_set_search_tb` VALUES ('1003', '教育', '12335', '2018-06-08 13:22:32');
INSERT INTO `video_set_search_tb` VALUES ('1004', '人生', '1239', '2018-06-08 13:22:30');
INSERT INTO `video_set_search_tb` VALUES ('1005', '打造', '13444', '2018-06-08 13:22:40');
INSERT INTO `video_set_search_tb` VALUES ('1006', '口才', '13459', '2018-06-08 13:22:36');
INSERT INTO `video_set_search_tb` VALUES ('1007', '成长', '12332', '2018-06-08 13:22:21');
INSERT INTO `video_set_search_tb` VALUES ('1008', '营销', '12338', '2018-06-08 13:22:43');
INSERT INTO `video_set_search_tb` VALUES ('1009', '222', '7', '2018-04-08 16:32:28');
INSERT INTO `video_set_search_tb` VALUES ('1010', '如何', '37', '2018-07-30 15:09:43');
INSERT INTO `video_set_search_tb` VALUES ('1011', '没有', '1', '2018-04-08 16:37:06');
INSERT INTO `video_set_search_tb` VALUES ('1012', '如何借力', '2', '2018-04-11 21:14:17');
INSERT INTO `video_set_search_tb` VALUES ('1013', 'r', '7', '2018-04-11 19:13:45');
INSERT INTO `video_set_search_tb` VALUES ('1014', 'ru', '4', '2018-04-11 19:13:45');
INSERT INTO `video_set_search_tb` VALUES ('1016', '1', '8', '2018-05-01 15:51:15');
INSERT INTO `video_set_search_tb` VALUES ('1017', '12', '5', '2018-05-01 15:51:12');
INSERT INTO `video_set_search_tb` VALUES ('1018', 'ruh', '2', '2018-04-11 19:13:45');
INSERT INTO `video_set_search_tb` VALUES ('1019', 'ruhe', '1', '2018-04-11 19:13:43');
INSERT INTO `video_set_search_tb` VALUES ('1020', 'Ruhr ', '2', '2018-04-11 19:13:45');
INSERT INTO `video_set_search_tb` VALUES ('1021', '2', '1', '2018-04-11 19:13:58');
INSERT INTO `video_set_search_tb` VALUES ('1022', '3', '2', '2018-04-11 19:14:02');
INSERT INTO `video_set_search_tb` VALUES ('1023', '33', '1', '2018-04-11 19:14:01');
INSERT INTO `video_set_search_tb` VALUES ('1024', '4', '2', '2018-04-11 19:14:08');
INSERT INTO `video_set_search_tb` VALUES ('1025', '44', '1', '2018-04-11 19:14:05');
INSERT INTO `video_set_search_tb` VALUES ('1026', '1234', '5', '2018-05-01 15:51:09');
INSERT INTO `video_set_search_tb` VALUES ('1027', '123', '4', '2018-05-01 15:51:11');
INSERT INTO `video_set_search_tb` VALUES ('1028', '12344', '1', '2018-04-11 19:30:55');
INSERT INTO `video_set_search_tb` VALUES ('1029', '我', '37', '2018-06-08 13:22:54');
INSERT INTO `video_set_search_tb` VALUES ('1030', '我要', '3', '2018-04-11 19:33:12');
INSERT INTO `video_set_search_tb` VALUES ('1031', '我要好好', '3', '2018-04-11 19:33:10');
INSERT INTO `video_set_search_tb` VALUES ('1032', '我要好好照顾自己', '2', '2018-04-11 19:33:04');
INSERT INTO `video_set_search_tb` VALUES ('1033', '我要好好照顾自己。', '1', '2018-04-11 19:33:03');
INSERT INTO `video_set_search_tb` VALUES ('1034', '我要好好照顾自', '1', '2018-04-11 19:33:04');
INSERT INTO `video_set_search_tb` VALUES ('1035', '我要好好照顾', '1', '2018-04-11 19:33:05');
INSERT INTO `video_set_search_tb` VALUES ('1036', '我要好好照', '1', '2018-04-11 19:33:05');
INSERT INTO `video_set_search_tb` VALUES ('1037', '我要好', '2', '2018-04-11 19:33:11');
INSERT INTO `video_set_search_tb` VALUES ('1038', '我如何', '1', '2018-04-11 19:33:15');
INSERT INTO `video_set_search_tb` VALUES ('1039', '我如', '1', '2018-04-11 19:33:16');
INSERT INTO `video_set_search_tb` VALUES ('1040', '去', '1', '2018-04-11 19:33:19');
INSERT INTO `video_set_search_tb` VALUES ('1041', '如', '24', '2018-04-11 20:39:57');
INSERT INTO `video_set_search_tb` VALUES ('1042', '如何让', '3', '2018-04-11 20:00:17');
INSERT INTO `video_set_search_tb` VALUES ('1043', '如何才', '1', '2018-04-11 19:45:06');
INSERT INTO `video_set_search_tb` VALUES ('1044', 'rug', '2', '2018-04-11 19:46:45');
INSERT INTO `video_set_search_tb` VALUES ('1045', '我们', '7', '2018-04-11 20:07:39');
INSERT INTO `video_set_search_tb` VALUES ('1046', '恋爱', '1', '2018-04-11 19:55:10');
INSERT INTO `video_set_search_tb` VALUES ('1047', '恋', '1', '2018-04-11 19:55:11');
INSERT INTO `video_set_search_tb` VALUES ('1048', '在', '4', '2018-04-11 20:06:01');
INSERT INTO `video_set_search_tb` VALUES ('1049', '在乎', '1', '2018-04-11 19:55:15');
INSERT INTO `video_set_search_tb` VALUES ('1050', '在乎的', '1', '2018-04-11 19:55:17');
INSERT INTO `video_set_search_tb` VALUES ('1051', '你', '7', '2018-04-11 20:07:30');
INSERT INTO `video_set_search_tb` VALUES ('1052', '你们', '2', '2018-04-11 20:07:29');
INSERT INTO `video_set_search_tb` VALUES ('1053', '我的', '4', '2018-04-11 19:59:07');
INSERT INTO `video_set_search_tb` VALUES ('1054', '我的手机', '1', '2018-04-11 19:58:54');
INSERT INTO `video_set_search_tb` VALUES ('1055', '我的人生', '2', '2018-04-11 19:59:13');
INSERT INTO `video_set_search_tb` VALUES ('1056', '我的人生是', '2', '2018-04-11 19:59:13');
INSERT INTO `video_set_search_tb` VALUES ('1057', '我的人生是不', '1', '2018-04-11 19:59:11');
INSERT INTO `video_set_search_tb` VALUES ('1058', '我的人生是不是', '1', '2018-04-11 19:59:12');
INSERT INTO `video_set_search_tb` VALUES ('1059', '我的人', '1', '2018-04-11 19:59:14');
INSERT INTO `video_set_search_tb` VALUES ('1060', '不', '5', '2018-04-11 20:06:02');
INSERT INTO `video_set_search_tb` VALUES ('1061', '这', '2', '2018-04-11 20:06:04');
INSERT INTO `video_set_search_tb` VALUES ('1062', '我们的', '1', '2018-04-11 20:07:38');
INSERT INTO `video_set_search_tb` VALUES ('1063', '我在', '1', '2018-04-11 20:07:49');
INSERT INTO `video_set_search_tb` VALUES ('1064', '如何计算', '1', '2018-04-11 20:09:51');
INSERT INTO `video_set_search_tb` VALUES ('1065', '如何计', '1', '2018-04-11 20:09:53');
INSERT INTO `video_set_search_tb` VALUES ('1066', '业务', '1', '2018-04-11 20:40:06');
INSERT INTO `video_set_search_tb` VALUES ('1067', '何', '1', '2018-04-11 21:13:56');
INSERT INTO `video_set_search_tb` VALUES ('1068', '哈哈', '4', '2018-04-12 14:41:55');
INSERT INTO `video_set_search_tb` VALUES ('1069', '哈哈哈', '1', '2018-04-12 14:40:05');
INSERT INTO `video_set_search_tb` VALUES ('1070', '12341', '1', '2018-05-01 15:51:08');
INSERT INTO `video_set_search_tb` VALUES ('1071', '了', '1', '2018-05-07 13:54:07');
INSERT INTO `video_set_search_tb` VALUES ('1072', '微商', '1', '2018-05-07 14:18:13');
INSERT INTO `video_set_search_tb` VALUES ('1073', '(null)', '2', '2018-06-08 13:22:15');
INSERT INTO `video_set_search_tb` VALUES ('1074', '测试', '2', '2018-06-08 13:23:01');

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
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8 COMMENT='视频集表';

-- ----------------------------
-- Records of video_set_tb
-- ----------------------------
INSERT INTO `video_set_tb` VALUES ('1010', '如何快速转战成为代理', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca4hjuhu9s9sqo1pcn6f41bkl2r.jpg', '老爷', '如何快速转战成为代理，微商的朋友圈是个人的广告版，个人的日记本，个人的衣食住行。在别人做的不好还要死撑着的情况下，我是否要去戳破它。不戳破就看着他硬撑死扛，戳破又怕吵架...', '2', '1', '0.00', '1', '29', '1', '1007', '2018-04-03 09:29:49', '2018-04-03 13:57:38');
INSERT INTO `video_set_tb` VALUES ('1011', '如何现身说法', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca5135uloi51foo19br1pvu7ci97.jpg', '老爷', '如何现身说法。就比如从哪个方面去推广，加入市场这个问题。不管什么产品，什么模式，什么团队，你加入就有你加入的理由，在你加入之后写一份对此的说明，你为什么要做这个模式或者这个产品...', '1', '1', '0.00', '1', '3', '1', '1006', '2018-04-03 13:54:38', '2018-04-03 15:56:05');
INSERT INTO `video_set_tb` VALUES ('1012', '如何针对顾客的心理需求', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca51s6bp1l0as0615vp1hai1gdbh7.jpg', '老爷', '如何针对顾客的心理需求。在你与顾客沟通的时候，顾客的心里到底是如何想的，而不是只根据嘴上说的。比如顾客常说的我需要考虑考虑，我现在正用着某产品，等用完再找你买等等。那么在这些言语的背后到底是真是假...', '2', '1', '0.00', '1', '8', '1', '1004', '2018-04-03 14:10:37', '2018-04-03 15:38:27');
INSERT INTO `video_set_tb` VALUES ('1013', '成功人士的八个武器', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca52rkb860733hkbfe191ddpsr.jpg', '老爷', '大实话听起来都像废话，但是这些废话恰恰是我们要反复去听的话。因为往往在我们遇到事情的时候，回过头看着写废话就变成了最有用的话。就向我推荐的这本成功人士的八个武器，热爱、努力、专注、自我强迫、创新、不断学习、服务团队、坚持到底...', '2', '1', '0.00', '1', '10', '1', '1002', '2018-04-03 14:29:20', '2018-04-03 15:55:26');
INSERT INTO `video_set_tb` VALUES ('1014', '如何纳新和管理', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca54fvfd10mpij13sr2fl1ru01e1.jpg', '老爷', '家人、聊天、沟通、群发、私聊都有做到一定的量，也经常分析自我身上的问题，但是纳新还是非常的慢，感觉努力和回报严重不对等。关于每天要做到的量，以及课程频率要达到多少...', '2', '1', '0.00', '1', '6', '1', '1005', '2018-04-03 14:56:18', '2018-04-03 14:58:40');
INSERT INTO `video_set_tb` VALUES ('1015', '如何为自己的公司团队提供附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca57ivknb3tvp817j21ut0lo7217.jpg', '老爷', '为什么自己的微信朋友人很多，却没人买，连懒人分红都没有收入，这属于半封积状态。微信上的利润空间比在其他的网站或者线下的专柜上都要大得多。而顾客不是因为便宜或者名气来买这个商品，之所以轮到在我们这边买是因为我们的主动销售及推荐...', '1', '1', '0.00', '1', '2', '1', '1005', '2018-04-03 15:52:56', '2018-04-03 15:59:18');
INSERT INTO `video_set_tb` VALUES ('1016', '如何更好的与意向代理沟通', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca58hnhkct915ga18vs7668t629f.jpg', '老爷', '经常和意向代理或者意向代理聊天，三两句就聊死了，总是觉得自己和对方聊天无话可说，不知道怎么继续，往往以失败告终，老感觉自己不适合做微商。当你没有办法继续聊下去，就可以用这个话题无限的聊下去，那就是让客户对你产生无限的兴趣...', '0', '1', '0.00', '1', '0', '1', '1003', '2018-04-03 16:07:05', '2018-04-03 16:12:39');
INSERT INTO `video_set_tb` VALUES ('1017', '关于线下市场开拓', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca59b618tn13saiejd1ops82lh.jpg', '老爷', '想要开拓线下市场，那么在没有经验的情况下，又如何去开拓这个市场。微商要落地，其实是一个误区。落地是指在线下开店，在大街上能买到这个产品，因而觉得很骄傲。但是微商这种业界形态的落地跟落到地面是两回事...', '0', '1', '0.00', '1', '2', '1', '1007', '2018-04-03 16:22:04', '2018-04-03 16:28:01');
INSERT INTO `video_set_tb` VALUES ('1018', '微商的五件事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca5aoakhcf341rgaivirugu2ur.jpg', '老爷', '微商该怎么做的五件事：朋友圈该怎么发，人该怎么加，怎么开公开课，内部管理怎么管，私聊沟通该怎么沟通。原理循环都是这些，讲来讲去都是这五件事，很容易疲惫去听，那么就要推陈出新，用案例或者故事来讲同一个原理引起好奇...', '3', '1', '0.00', '1', '5', '1', '1006', '2018-04-03 16:46:43', '2018-04-03 16:49:10');
INSERT INTO `video_set_tb` VALUES ('1019', '微商必备的三点条件', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai0e4t414pn1g5jug35a02ddh.jpg', '老爷', '用酒吧撩汉子论来讲述怎么将微商做的更好。微商的基本三点条件，也可以说是所有营销人员的基本三点条件，叫做脸皮厚，嘴皮溜，执行透，这九个字。', '0', '1', '0.00', '2', '5', '1', '1007', '2018-04-08 14:55:41', '2018-04-25 16:46:18');
INSERT INTO `video_set_tb` VALUES ('1020', '微商的四个现代化', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai1720c4j01tmqn8n6qg1u328h.jpg', '老爷', '微商的趋势及发展总结为微商的四个现代化，分别为：产品碎片化，团队集中化，客户成熟化，模式多样化。未来也是按这样的两个大思路来发展...', '0', '1', '0.00', '1', '1', '1', '1003', '2018-04-08 15:07:21', '2018-04-08 15:09:57');
INSERT INTO `video_set_tb` VALUES ('1021', '人给到产品的附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai1vqd2pe9128lpov4o21216gh.jpg', '老爷', '用一个问题入手，比如说顾客嫌价格贵，顾客觉得有品牌贵还好，怎么样是顾客觉得划算，值得这个价。不是知名品牌就贵，不是知名品牌就不贵,就像人们熟知的大宝这一款产品，他难道不是知名品牌吗？是啊，但是它的价格并不高啊...', '3', '1', '0.00', '1', '8', '1', '1004', '2018-04-08 15:26:21', '2018-04-08 15:29:30');
INSERT INTO `video_set_tb` VALUES ('1022', '团队老大给到团队的扶持是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai39n60ldr414lek19i71gl8op.jpg', '老爷', '高层有两种人：一个是业绩最好，销售最好，货走的很快的，但对代理并不体贴，扶持也不尽心。另一种是比前者业绩差，但是对代理尽心体贴，扶持也很上心。要选其中一种，要如何抉择？', '3', '1', '0.00', '1', '4', '1', '1006', '2018-04-08 15:46:17', '2018-04-08 15:54:19');
INSERT INTO `video_set_tb` VALUES ('1023', '微商当中的各种怂坑', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai5tped1k1o1eh514mrb1usa9c.jpg', '老爷', '微商当中的怂坑，我们要怎么从这个怂坑里面爬出来。大家都还记得的是微商有四个非常重要的基本技能：不要怂，脸皮厚，嘴皮溜，执行透，12字箴言...', '0', '1', '0.00', '1', '3', '1', '1003', '2018-04-08 16:33:34', '2018-04-08 16:35:46');
INSERT INTO `video_set_tb` VALUES ('1024', '如何借力用力', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai6sc6hag12041i4oc8h1ep5hk.jpg', '老爷', '思维格局气场，如果要做成一件事，道法术器四个层面都必须要可以。如果要 别人对你更感兴趣，就要用一个公式：取势明道 优术践行。取一个大的趋势，明确你的道路，优化你的战术，用你的实践性动来达到最终的结果...', '0', '1', '0.00', '1', '32', '1', '1005', '2018-04-08 16:45:17', '2018-04-25 13:56:27');
INSERT INTO `video_set_tb` VALUES ('1025', '如何计算自己的时间价值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai7ruuu1oird2p5pk1h04rtmpk.jpg', '老爷', '如何行之有效的利用每天的时间做有效率的事情，关于时间管理，有一个问题，你认为是时间更重要还是金钱跟重要？认为时间更重要的人会拿时间来换金钱，认为金钱更重要的人会拿金钱换时间...', '0', '1', '0.00', '2', '9', '1', '1001', '2018-04-08 17:02:31', '2018-04-17 17:48:20');
INSERT INTO `video_set_tb` VALUES ('1026', '云商和支商有什么不同？', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtmls013e01qif6mm153l1ju62n.jpg', '老爷', '云商和支商有什么不一样的地方，云商可能是类似于微商的另一种叫法，在微信做生意在微商，在支付宝里做生意叫支商，在什么渠道进行销售并且成交，就叫什么渠道的商人，其实没什么不一样，我们这一票人在什么渠道能成单就可以...', '0', '1', '0.00', '1', '1', '1', '1002', '2018-04-25 15:31:42', '2018-04-25 15:38:17');
INSERT INTO `video_set_tb` VALUES ('1027', '如何克服内心恐惧的干货', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtsajhu15lj1gqvsod1n0c4jhav.jpg', '老爷', '很多人的问题都趋向于做A事情要怕，做B事情要怕，做C事情还是要怕。例如有人想在微商做高级别，让自己有一些改变，但是又过不了自己的那一关，她就是害怕，害怕自己做不好，害怕自己的货卖不出去，一直犹豫，一直纠结...', '0', '1', '0.00', '2', '6', '1', '1003', '2018-04-25 15:54:15', '2018-04-25 17:30:31');
INSERT INTO `video_set_tb` VALUES ('1028', '一个良好的职业形象是你成功的根本', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbttv6bl1obfqtavof1p691k6om1.jpg', '老爷', '形象是关系到一个集团企业利益的根本，必须打造自己相对比较高大上的形象，再也不要那种屌丝一样或者办公很累的样子出现在大众的视野之内。脸上干净，着装正经这个非常重要，一个良好的职业化的形象是你成功的根本...', '0', '1', '0.00', '1', '17', '1', '1001', '2018-04-25 16:22:28', '2018-04-25 16:24:39');
INSERT INTO `video_set_tb` VALUES ('1029', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0ave654k196h3aaev0crj15r.jpg', '老爷', '团队老大的对代理的误区就是要像代理的妈妈一样把他们带着成长。总结来说，这一部分人可以称为团队老妈子。这是最错的一种做法，掏心掏肺听起来是很不错，能够成长到今天全部拜你父母所赐吗，当然客观因素是因为他们...', '2', '0', '0.00', '1', '85', '1', '1001', '2018-04-25 17:03:50', '2018-07-05 15:13:59');
INSERT INTO `video_set_tb` VALUES ('1030', '通过筛选产品告诉你，你缺的是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1csvlbnfl13vi1scp1ij51qed1tva1r.png', '老爷', '凡是选产品的同学，请反思几个问题。第一，你为什么要换产品或者加一个产品。第二，只做一款产品的同学，你是不是这一款产品里最里害收入最高的那一个，如果不是，请你想想，这个最厉害的人为什么不是你...', '0', '2', '0.00', '2', '17', '1', '1003', '2018-04-25 17:17:31', '2018-11-23 15:17:33');
INSERT INTO `video_set_tb` VALUES ('1031', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2obr21opijfc18ar1m6fuch1vm.jpg', '老爷', '真正的大咖在碰到这类的问题的时候在大脑里想的就是这些大环境与他毫无关系。小白喜欢研究大趋势，大咖喜欢营造小环境。小白总觉得大环境能跟他怎么样，举个例子，GDP每年上涨8%，跟他是什么关系...', '1', '2', '0.01', '2', '20', '1', '1007', '2018-04-25 17:43:32', '2018-07-30 17:11:48');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='视频表';

-- ----------------------------
-- Records of video_tb
-- ----------------------------
INSERT INTO `video_tb` VALUES ('18', '如何快速转战成为代理', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca4ohvat5v3kc32dr149065k1b.jpg', '00:25:08', '96.33', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca4vpsn21coa9k01gnn11t31ckvv.mp4', '13', '1', '1010', '2018-04-03 11:26:32', '2018-04-03 14:16:55');
INSERT INTO `video_tb` VALUES ('19', '如何现身说法', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca51c5fukus20n133e16ok1hplad.jpg', '00:25:07', '191.69', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca51d2541sl415gdd4h8pf1prvan.mp4', '3', '1', '1011', '2018-04-03 14:01:12', '2018-04-03 14:16:41');
INSERT INTO `video_tb` VALUES ('20', '如何针对顾客的心理需求', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca522ojmmaq1asoa5hq917dbi8.jpg', '00:25:02', '191.71', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca524a29141n1ei516ne1ttc1i6gid.mp4', '8', '1', '1012', '2018-04-03 14:14:31', '2018-04-03 14:14:31');
INSERT INTO `video_tb` VALUES ('21', '成功人士的八个武器', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca534c3v18f7651f85ksr2hgu1.jpg', '00:25:08', '191.72', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca5355qk1efh1g9q1clk19831qvsub.mp4', '10', '1', '1013', '2018-04-03 14:32:33', '2018-04-03 14:32:33');
INSERT INTO `video_tb` VALUES ('26', '如何纳新和管理', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca54lnom1hd09mu131t6bu1maq1f7.jpg', '00:25:08', '191.71', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca54mmgca7q1lqh13rvk1ug8d1fh.mp4', '6', '1', '1014', '2018-04-03 14:58:40', '2018-04-03 14:58:40');
INSERT INTO `video_tb` VALUES ('27', '如何为自己的公司团队提供附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca57ti8d19p893kh1o10tduac22h.jpg', '00:25:08', '191.68', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca57ucbc9prbkbbco1kdv11k122v.mp4', '2', '1', '1015', '2018-04-03 15:55:18', '2018-04-03 15:55:18');
INSERT INTO `video_tb` VALUES ('28', '如何更好的与意向代理沟通', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca58nlk51io6grl1ooolbbtfm2bq.jpg', '00:25:07', '191.70', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca58o01l1e61m8a1pbf10op57n2bv.mp4', '0', '1', '1016', '2018-04-03 16:12:39', '2018-04-03 16:12:39');
INSERT INTO `video_tb` VALUES ('29', '关于线下市场开拓', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca59j35o7kd3vr19uo6hfogq2o1.jpg', '00:25:05', '191.67', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca59q5be1ehs11ns1qr2mfh163m2ob.mp4', '2', '1', '1017', '2018-04-03 16:28:01', '2018-04-03 16:28:01');
INSERT INTO `video_tb` VALUES ('30', '微商的五件事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca5b08701arf18dl1t82vs315n6316.jpg', '00:25:09', '191.68', 'http://laoyeshuovideo.laoyeshuo.cn/o_1ca5b0sug1rv9vbup4ge4j81b31b.mp4', '5', '1', '1018', '2018-04-03 16:49:10', '2018-04-03 16:49:10');
INSERT INTO `video_tb` VALUES ('31', '微商必备的三点条件', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai0k82tp9q8j61plrpj91b5u1n.jpg', '00:25:05', '191.71', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai0kulg1ec5tgu179bcp019tm21.mp4', '0', '1', '1019', '2018-04-08 14:59:37', '2018-04-08 14:59:37');
INSERT INTO `video_tb` VALUES ('32', '微商的四个现代化', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai19htf1shrslm10hc1tb61jd9n.jpg', '00:25:08', '191.72', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai1a3hrf9t1680mtlfpe1u8na1.mp4', '1', '1', '1020', '2018-04-08 15:09:57', '2018-04-08 15:09:57');
INSERT INTO `video_tb` VALUES ('33', '人怎么给到产品附加值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai2ce0h10ak1v8p1sb51idbujfhr.jpg', '00:25:06', '191.70', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai2d7o8na813921vfvedk1bsoi9.mp4', '8', '1', '1021', '2018-04-08 15:29:30', '2018-04-08 15:29:30');
INSERT INTO `video_tb` VALUES ('34', '团队老大给到团队的扶持是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai3i3soasdaqt1pfv1l24gkt2n.jpg', '00:25:06', '191.69', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai3ijom1c00l83as91pt5rvj2s.mp4', '4', '1', '1022', '2018-04-08 15:54:19', '2018-04-08 15:54:19');
INSERT INTO `video_tb` VALUES ('35', '微商当中的各种怂坑', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai67e2ljoa1p5u1gnt1f3i1e8eam.jpg', '00:25:07', '191.67', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai680l1q7bklp1iu3md816knb4.mp4', '3', '1', '1023', '2018-04-08 16:35:46', '2018-04-08 16:35:46');
INSERT INTO `video_tb` VALUES ('36', '如何借力用力', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai6ss471i11f4ip35fhmgqpiq.jpg', '00:25:06', '191.71', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai7124e1jkp1vqrma9s4ql18j4.mp4', '32', '1', '1024', '2018-04-08 16:49:24', '2018-04-08 16:49:24');
INSERT INTO `video_tb` VALUES ('37', '如何计算自己的时间价值', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai7se4o14rp18ef1cleu7f197tqu.jpg', '00:25:08', '191.68', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cai85lii1n3855k5ln131317j411e.mp4', '6', '1', '1025', '2018-04-08 17:10:23', '2018-04-08 17:10:23');
INSERT INTO `video_tb` VALUES ('38', '如何搞定自己', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cb9ftd4s14jn1nlo1kbfsjt1c3kg3.jpg', '00:25:08', '191.71', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cb9fug6d1kobefnuhrd9o54ggd.mp4', '3', '1', '1025', '2018-04-17 17:48:20', '2018-04-17 17:48:20');
INSERT INTO `video_tb` VALUES ('39', '云商和支商有什么不同？', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtrefa11gpcki4kjrp9inn41.jpg', '00:25:06', '191.67', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtrf9lp5g1185t1cp0vko1ch74f.mp4', '1', '1', '1026', '2018-04-25 15:38:17', '2018-04-25 15:38:17');
INSERT INTO `video_tb` VALUES ('40', '如何克服内心恐惧的干货', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtso8ns72f1bl916us142pgcldf.jpg', '00:25:10', '191.68', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtt2kfc3k41cope6o11qv6ccdp.mp4', '0', '1', '1027', '2018-04-25 16:03:12', '2018-04-25 16:03:12');
INSERT INTO `video_tb` VALUES ('41', '一个良好的职业形象是你成功的根本', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtubb0q1301178m1fsb17egaf8n2.jpg', '00:25:04', '191.67', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtubra6v8r14o41hig1jo61ajan7.mp4', '17', '1', '1028', '2018-04-25 16:24:39', '2018-04-25 16:24:39');
INSERT INTO `video_tb` VALUES ('42', '营销和谈恋爱的相似度', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtv9o2i1l82n7o1gg5nn27t0v1.jpg', '00:25:06', '191.67', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbtvajdv1n2j1e1p1jib1li71aulvb.mp4', '5', '1', '1019', '2018-04-25 16:46:06', '2018-04-25 16:46:06');
INSERT INTO `video_tb` VALUES ('43', '带领团队跟父母教育的雷同', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0n12cb6iueihh33vs1t1l16s.jpg', '00:25:04', '191.67', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu0npf9o5t1jd51l7j1toj5sc171.mp4', '85', '1', '1029', '2018-04-25 17:06:29', '2018-04-25 17:06:29');
INSERT INTO `video_tb` VALUES ('44', '通过筛选产品告诉你，你缺的是什么', 'http://laoyeshuovideo.laoyeshuo.cn/o_1csvknq2214kq15ftkhg1i8g1hhe51.jpg', '00:25:05', '191.67', 'http://laoyeshuovideo.laoyeshuo.cn/o_1csvkkil29m412lg1vqjhukpvtv.mp4', '17', '1', '1030', '2018-04-25 17:21:02', '2018-11-23 14:40:01');
INSERT INTO `video_tb` VALUES ('45', '一个人的消费观念和是否跟你购买产品是两回事', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1u003pv21fqn1du31ad0stb1md.jpg', '00:25:10', '191.67', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu1uoao1o3ir931cvl10lc1a0c1mi.mp4', '6', '1', '1027', '2018-04-25 17:30:31', '2018-04-25 17:30:31');
INSERT INTO `video_tb` VALUES ('46', '关于微商的趋势', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu2vugj1vna19f03r6e5p1lnk226.jpg', '00:25:06', '191.71', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu310vl1amo116c6dk136gqm322g.mp4', '3', '1', '1031', '2018-04-25 17:46:16', '2018-04-25 17:46:16');
INSERT INTO `video_tb` VALUES ('47', '老梗的新认知', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu3cn7l1apt1s191pkj1i6sov9v.jpg', '00:25:04', '191.71', 'http://laoyeshuovideo.laoyeshuo.cn/o_1cbu3d7fu1f02p3p1htlojd1lmq14.mp4', '17', '1', '1031', '2018-04-25 17:53:00', '2018-04-25 17:53:00');
INSERT INTO `video_tb` VALUES ('50', '团队作用的解答', 'http://laoyeshuovideo.laoyeshuo.cn/o_1csvkoekaros1n2ctr81f03bj56.jpg', '00:20:02', '127.97', 'http://laoyeshuovideo.laoyeshuo.cn/o_1csvkqdh0vh2et21e4j1t5g1fvh5d.mp4', '0', '1', '1030', '2018-11-23 14:49:34', '2018-11-23 14:49:34');

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
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8 COMMENT='vip成长记录表';

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
INSERT INTO `vip_growth_record_tb` VALUES ('1008', '普通vip', '1', '365.00', '2018-05-31 17:11:40', '1038');
INSERT INTO `vip_growth_record_tb` VALUES ('1009', '普通vip', '1', '365.00', '2018-06-01 11:05:13', '1019');
INSERT INTO `vip_growth_record_tb` VALUES ('1010', '普通vip', '1', '365.00', '2018-06-01 17:46:32', '1042');
INSERT INTO `vip_growth_record_tb` VALUES ('1011', '普通vip', '1', '365.00', '2018-06-27 10:18:52', '1052');
INSERT INTO `vip_growth_record_tb` VALUES ('1012', '普通vip', '1', '365.00', '2018-07-20 15:38:46', '1041');

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
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='vip购买次数表';

-- ----------------------------
-- Records of vip_number_tb
-- ----------------------------
INSERT INTO `vip_number_tb` VALUES ('1000', '3', '2018-06-01 16:27:02', '2018-07-20 15:36:02', '1041', '1038', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=1048 DEFAULT CHARSET=utf8 COMMENT='vip表';

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
INSERT INTO `vip_tb` VALUES ('1011', '普通vip', '1', '1', '2019-06-01 11:05:13', '2018-06-01 11:05:13', '2018-06-01 11:05:13', '1019');
INSERT INTO `vip_tb` VALUES ('1012', '学徒', '0', '0', '2018-03-13 16:20:27', '2018-03-13 16:20:27', '2018-03-13 16:20:27', '1020');
INSERT INTO `vip_tb` VALUES ('1013', '学徒', '0', '0', '2018-03-27 14:27:41', '2018-03-27 14:27:41', '2018-03-27 14:27:41', '1021');
INSERT INTO `vip_tb` VALUES ('1014', '学徒', '0', '0', '2018-04-01 23:34:49', '2018-04-01 23:34:49', '2018-04-01 23:34:49', '1022');
INSERT INTO `vip_tb` VALUES ('1015', '学徒', '0', '0', '2018-04-02 16:53:56', '2018-04-02 16:53:56', '2018-04-02 16:53:56', '1023');
INSERT INTO `vip_tb` VALUES ('1016', '学徒', '0', '0', '2018-04-03 11:01:55', '2018-04-03 11:01:55', '2018-04-03 11:01:55', '1024');
INSERT INTO `vip_tb` VALUES ('1017', '学徒', '0', '0', '2018-04-08 10:18:52', '2018-04-08 10:18:52', '2018-04-08 10:18:52', '1025');
INSERT INTO `vip_tb` VALUES ('1018', '学徒', '0', '0', '2018-04-17 17:25:05', '2018-04-17 17:25:05', '2018-04-17 17:25:05', '1026');
INSERT INTO `vip_tb` VALUES ('1019', '学徒', '0', '0', '2018-05-03 22:18:28', '2018-05-03 22:18:28', '2018-05-03 22:18:28', '1027');
INSERT INTO `vip_tb` VALUES ('1020', '学徒', '0', '0', '2018-05-29 18:46:14', '2018-05-29 18:46:14', '2018-05-29 18:46:14', '1028');
INSERT INTO `vip_tb` VALUES ('1021', '学徒', '0', '0', '2018-05-30 16:06:28', '2018-05-30 16:06:28', '2018-05-30 16:06:28', '1029');
INSERT INTO `vip_tb` VALUES ('1022', '学徒', '0', '0', '2018-05-30 16:10:51', '2018-05-30 16:10:51', '2018-05-30 16:10:51', '1030');
INSERT INTO `vip_tb` VALUES ('1023', '学徒', '0', '0', '2018-05-30 17:06:42', '2018-05-30 17:06:42', '2018-05-30 17:06:42', '1031');
INSERT INTO `vip_tb` VALUES ('1024', '学徒', '0', '0', '2018-05-30 17:07:30', '2018-05-30 17:07:30', '2018-05-30 17:07:30', '1032');
INSERT INTO `vip_tb` VALUES ('1025', '学徒', '0', '0', '2018-05-30 17:08:05', '2018-05-30 17:08:05', '2018-05-30 17:08:05', '1033');
INSERT INTO `vip_tb` VALUES ('1026', '学徒', '0', '0', '2018-05-30 17:08:33', '2018-05-30 17:08:33', '2018-05-30 17:08:33', '1034');
INSERT INTO `vip_tb` VALUES ('1027', '学徒', '0', '0', '2018-05-30 17:10:54', '2018-05-30 17:10:54', '2018-05-30 17:10:54', '1035');
INSERT INTO `vip_tb` VALUES ('1028', '学徒', '0', '0', '2018-05-30 17:11:46', '2018-05-30 17:11:46', '2018-05-30 17:11:46', '1036');
INSERT INTO `vip_tb` VALUES ('1029', '学徒', '0', '0', '2018-05-30 17:12:15', '2018-05-30 17:12:15', '2018-05-30 17:12:15', '1037');
INSERT INTO `vip_tb` VALUES ('1030', '普通vip', '1', '1', '2019-05-31 17:11:40', '2018-05-31 17:11:40', '2018-05-31 17:11:40', '1038');
INSERT INTO `vip_tb` VALUES ('1031', '学徒', '0', '0', '2018-05-31 14:20:08', '2018-05-31 14:20:08', '2018-05-31 14:20:08', '1039');
INSERT INTO `vip_tb` VALUES ('1032', '学徒', '0', '0', '2018-06-01 14:43:35', '2018-06-01 14:43:35', '2018-06-01 14:43:35', '1040');
INSERT INTO `vip_tb` VALUES ('1033', '普通vip', '1', '1', '2019-07-20 15:38:46', '2018-07-20 15:38:46', '2018-07-20 15:38:46', '1041');
INSERT INTO `vip_tb` VALUES ('1034', '普通vip', '1', '1', '2019-06-01 17:46:32', '2018-06-01 17:46:32', '2018-06-01 17:46:32', '1042');
INSERT INTO `vip_tb` VALUES ('1035', '学徒', '0', '0', '2018-06-04 13:39:47', '2018-06-04 13:39:47', '2018-06-04 13:39:47', '1043');
INSERT INTO `vip_tb` VALUES ('1036', '学徒', '0', '0', '2018-06-13 14:09:14', '2018-06-13 14:09:14', '2018-06-13 14:09:14', '1044');
INSERT INTO `vip_tb` VALUES ('1037', '学徒', '0', '0', '2018-06-24 11:36:11', '2018-06-24 11:36:11', '2018-06-24 11:36:11', '1045');
INSERT INTO `vip_tb` VALUES ('1038', '学徒', '0', '0', '2018-06-25 09:15:33', '2018-06-25 09:15:33', '2018-06-25 09:15:33', '1046');
INSERT INTO `vip_tb` VALUES ('1039', '学徒', '0', '0', '2018-06-25 09:16:20', '2018-06-25 09:16:20', '2018-06-25 09:16:20', '1047');
INSERT INTO `vip_tb` VALUES ('1040', '学徒', '0', '0', '2018-06-25 09:20:30', '2018-06-25 09:20:30', '2018-06-25 09:20:30', '1048');
INSERT INTO `vip_tb` VALUES ('1041', '学徒', '0', '0', '2018-06-25 09:20:53', '2018-06-25 09:20:53', '2018-06-25 09:20:53', '1049');
INSERT INTO `vip_tb` VALUES ('1042', '学徒', '0', '0', '2018-06-25 09:22:16', '2018-06-25 09:22:16', '2018-06-25 09:22:16', '1050');
INSERT INTO `vip_tb` VALUES ('1043', '学徒', '0', '0', '2018-06-25 09:35:22', '2018-06-25 09:35:22', '2018-06-25 09:35:22', '1051');
INSERT INTO `vip_tb` VALUES ('1044', '普通vip', '1', '1', '2019-06-27 10:18:52', '2018-06-27 10:18:52', '2018-06-27 10:18:52', '1052');
INSERT INTO `vip_tb` VALUES ('1045', '学徒', '0', '0', '2018-07-04 10:54:56', '2018-07-04 10:54:56', '2018-07-04 10:54:56', '1053');
INSERT INTO `vip_tb` VALUES ('1046', '学徒', '0', '0', '2018-07-04 13:54:55', '2018-07-04 13:54:55', '2018-07-04 13:54:55', '1054');
INSERT INTO `vip_tb` VALUES ('1047', '学徒', '0', '0', '2018-11-23 10:35:15', '2018-11-23 10:35:15', '2018-11-23 10:35:15', '1055');

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
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8 COMMENT='提现信息表';

-- ----------------------------
-- Records of withdrawals_tb
-- ----------------------------
INSERT INTO `withdrawals_tb` VALUES ('1000', '测试', '<UITextField: 0x10b82f400; frame = (20 22; 374 38); text = \'15068747539\'; opaque = NO; autoresize = RM BM; gestureRecognizers = <NSArray: 0x1cc05a970>; layer = <CALayer: 0x1cc033760>>', '1065');
INSERT INTO `withdrawals_tb` VALUES ('1001', '刘哥', '<UITextField: 0x1021b7200; frame = (20 22; 335 38); text = \'18300700000\'; opaque = NO; autoresize = RM BM; gestureRecognizers = <NSArray: 0x1c4459230>; layer = <CALayer: 0x1c0624a80>>', '1094');
INSERT INTO `withdrawals_tb` VALUES ('1002', '刘哥', '<UITextField: 0x7fc6d0833800; frame = (20 22; 374 38); text = \'2703687170@qq.com\'; opaque = NO; autoresize = RM BM; gestureRecognizers = <NSArray: 0x60800065d490>; layer = <CALayer: 0x60000043c540>>', '1095');
INSERT INTO `withdrawals_tb` VALUES ('1003', '梁未', '<UITextField: 0x7f82e7c5a600; frame = (20 22; 374 38); text = \'2703687170@qq.com\'; opaque = NO; autoresize = RM BM; gestureRecognizers = <NSArray: 0x60c000443000>; layer = <CALayer: 0x60c000638f80>>', '1099');
INSERT INTO `withdrawals_tb` VALUES ('1004', '梁未', '2703687170@qq.com', '1100');
INSERT INTO `withdrawals_tb` VALUES ('1005', '刘哥', '18300700235', '1101');
INSERT INTO `withdrawals_tb` VALUES ('1006', '刘哥', '18300700235', '1102');
INSERT INTO `withdrawals_tb` VALUES ('1007', '测试', '15068747539', '1107');
INSERT INTO `withdrawals_tb` VALUES ('1008', '梁威', '986211891@qq.com', '1118');
INSERT INTO `withdrawals_tb` VALUES ('1009', '梁威', '986211891@qq.com', '1119');
INSERT INTO `withdrawals_tb` VALUES ('1010', '刘哥', '18300700235', '1121');
INSERT INTO `withdrawals_tb` VALUES ('1011', '测试', '15068747539', '1126');
INSERT INTO `withdrawals_tb` VALUES ('1012', '刘哥', '18300700235', '1131');
INSERT INTO `withdrawals_tb` VALUES ('1013', '梁威', '2703687170@qq.com', '1132');
INSERT INTO `withdrawals_tb` VALUES ('1014', '梁威', '2703687170@qq.com', '1134');
