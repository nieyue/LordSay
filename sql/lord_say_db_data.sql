/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : lord_say_db

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2018-02-10 15:56:25
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
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8 COMMENT='账户上级表';

-- ----------------------------
-- Records of account_parent_tb
-- ----------------------------
INSERT INTO `account_parent_tb` VALUES ('1001', '1009', '谢威', '17702183918', '2', '1000', '1000', '1002', '普通vip', '2018-01-27 18:21:05', '2018-01-27 18:21:05');
INSERT INTO `account_parent_tb` VALUES ('1002', '1010', '舒靖宇', '15211547807', '1', '1000', '1000', '1002', '普通vip', '2018-02-04 20:28:28', '2018-02-04 20:28:28');
INSERT INTO `account_parent_tb` VALUES ('1004', '1000', '聂跃', '15111336587', '3', null, null, '1006', '创始股东', '2018-02-05 13:13:47', '2018-02-05 13:13:52');
INSERT INTO `account_parent_tb` VALUES ('1005', '1011', null, '15111336586', '0', '1000', '1000', '1001', '学徒', '2018-02-06 16:39:35', '2018-02-06 16:39:35');
INSERT INTO `account_parent_tb` VALUES ('1006', '1012', null, '15674830902', '0', '1009', '1009', '1001', '学徒', '2018-02-07 01:15:45', '2018-02-07 01:15:45');
INSERT INTO `account_parent_tb` VALUES ('1007', '1014', '普通vip', '18774814879', '0', '1010', '1000', '1002', '学徒', '2018-02-10 13:23:05', '2018-02-10 13:59:05');
INSERT INTO `account_parent_tb` VALUES ('1008', '1013', null, null, '0', '1000', '1000', '1001', '学徒', '2018-02-10 13:31:52', '2018-02-10 13:31:54');

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
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Records of account_tb
-- ----------------------------
INSERT INTO `account_tb` VALUES ('1000', null, '15111336587', '11874bb6149dd45428da628c9766b252', null, '聂跃', null, '0', null, null, null, null, null, '278076304@qq.com', null, null, null, null, null, null, '2018-01-19 15:46:08', '2018-02-10 14:36:32', '0', null, '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1009', '新婆婆婆婆师兄弟帝王将相洗衣机维修', '17702183918', '11874bb6149dd45428da628c9766b252', '', '哦？是吗', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '2', '25', '', '北京市', '福建省-福州市', '谢威', '', '2', '136494946469476', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180204154022', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180204154038', '', '', '2018-01-27 18:21:05', '2018-02-10 13:54:05', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1010', '-/:;()', '15211547807', '11874bb6149dd45428da628c9766b252', null, '123', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '2', '25', null, '湖北省', '武汉市', '舒靖宇', null, '2', '123456', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517747286.png', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517747301.png', '147852369', 'gmjgdpg123', '2018-01-27 20:23:22', '2018-02-10 13:36:12', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1011', 'safsdafdsf', '15111336586', '11874bb6149dd45428da628c9766b252', '15111336586', '搞事情', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5l472v92qo1849k1h1jec1d6g7v.png', '1', '10', '中国', '湖南省', '长沙市', 'sfdsf', '232@gfdgf.bg', '2', '123123123213123', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5l495bc2eqsgf1l6g1l2e1b1d84.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5l49rul2nc1gtb1m1m1k861peo89.png', 'dsf', 'sdfsdf', '2018-02-06 16:39:35', '2018-02-10 14:15:10', '0', '1000', '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1012', '就继续桐木', '15674830902', '11874bb6149dd45428da628c9766b252', '', '哈哈哈', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180207011738', '1', '26', '', '天津市', '天津市', '', '', '0', '', '', '', '', '', '2018-02-07 01:15:45', '2018-02-10 14:06:57', '0', '1009', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1013', null, '17388964490', '11874bb6149dd45428da628c9766b252', '17388964490', null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, '2018-02-10 13:13:19', '2018-02-10 13:13:19', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1014', '', '18774814879', '11874bb6149dd45428da628c9766b252', '18774814879', '', '', null, null, '', '', '', '小胖子', '', '2', '987654321', 'http://p2bhwwngu.bkt.clouddn.com/ios_1014_1518240172.png', 'http://p2bhwwngu.bkt.clouddn.com/ios_1014_1518240182.png', '', '', '2018-02-10 13:19:45', '2018-02-10 14:33:10', '0', '1010', '1001', '用户');

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
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COMMENT='文章类型表';

-- ----------------------------
-- Records of article_cate_tb
-- ----------------------------
INSERT INTO `article_cate_tb` VALUES ('1000', '个性推荐', '2018-01-23 14:44:48');
INSERT INTO `article_cate_tb` VALUES ('1001', '课程', '2018-01-23 14:45:19');
INSERT INTO `article_cate_tb` VALUES ('1002', '微专业', '2018-02-02 08:59:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

-- ----------------------------
-- Records of article_comment_tb
-- ----------------------------
INSERT INTO `article_comment_tb` VALUES ('3', '真有意思啊', '0', '2018-01-29 16:02:37', '4', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('4', '还能好好玩耍不\n', '0', '2018-01-29 16:03:07', '4', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('5', '撒旦飞洒地方', '0', '2018-01-29 16:08:18', '3', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('6', '十大法师的', '0', '2018-01-29 16:08:21', '3', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('7', '士大夫', '0', '2018-01-29 16:08:35', '2', '1000', '聂跃', '');
INSERT INTO `article_comment_tb` VALUES ('8', '你以为所以我现在1', '0', '2018-02-02 00:51:47', '3', '1009', '啦啦啦啦', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('9', '聊几句V53', '0', '2018-02-02 00:54:54', '4', '1009', '啦啦啦啦', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('10', '你想让我庸人自扰之', '1', '2018-02-02 01:54:55', '2', '1009', '啦啦啦啦', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('11', '5句我自己', '0', '2018-02-03 01:46:15', '3', '1009', '我会注意', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('12', 'ggvv记录', '0', '2018-02-07 00:48:20', '4', '1009', '我会注意', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('13', '呵呵', '0', '2018-02-08 16:43:14', '2', '1009', '我会注意', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('15', '我的生活就是一个劲在别人看来很大关系人的问题，我的人生就是一个', '0', '2018-02-09 21:12:30', '2', '1010', null, null);
INSERT INTO `article_comment_tb` VALUES ('16', '我的人生就是一个人和事物的人生态度，我的人生就是一个人和事物的人生态度，我的人生就是一个人和事', '0', '2018-02-09 21:23:16', '2', '1010', '123', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png');
INSERT INTO `article_comment_tb` VALUES ('17', '破给名字呀，你的人生态度就是这样吧。我们都在一起的时候我就不去了。我', '0', '2018-02-09 21:24:03', '2', '1010', '123', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of article_tb
-- ----------------------------
INSERT INTO `article_tb` VALUES ('2', '平昌冬奥会开幕式最全盘点！ 朝韩旗手共同入场，金妍儿点燃圣火', '这是韩国时隔30年后再度举办奥运会，也是其首次举办冬奥会。继1972年札幌冬奥会、1998年长野冬奥会之后，冬奥会第三次落户亚洲。', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1060042918,4007443073&fm=173&s=5786980BC21239EDDA3D9EA903007095&w=218&h=146&img.JPEG', '', '<h3 style=\"text-align: left;\">CD君</h3><h3 style=\"text-align: left;\">中国日报</h3><p style=\"text-align: left;\">为您的资讯保鲜</p><p style=\"text-align: left;\">北京时间2月9日晚19时，2018年平昌冬奥会开幕式在韩国平昌奥林匹克体育场盛大举行。</p><p style=\"text-align: left;\">这是韩国时隔30年后再度举办奥运会，也是其首次举办冬奥会。继1972年札幌冬奥会、1998年长野冬奥会之后，冬奥会第三次落户亚洲。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3848130923,2878233503&amp;fm=173&amp;s=29F2E304DB25BA4F4C5C878E0300E08F&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者吕小炜摄</p><p style=\"text-align: left;\">随着钟声响起，平昌冬奥拉开序幕，奥林匹克运动，也正式进入了东亚时间。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3216895071,2762599730&amp;fm=173&amp;s=E1649346C50ABB477CD4759E03008092&amp;w=640&amp;h=392&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者白雪飞摄</p><p style=\"text-align: left;\">开幕式文艺演出以小朋友作为线索贯穿始终。</p><div style=\"text-align: left;\"><img width=\"405px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3420389651,3085989812&amp;fm=173&amp;s=57B6866400673D2CA6BB64000300E0DA&amp;w=405&amp;h=189&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">五个孩子，象征着奥运五环，同时，他们的名字，分别代表五行：金、木、水、火、土。</p><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3210180365,2649292913&amp;fm=173&amp;s=868697415AA33F265022810E0300D0DB&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">平昌冬奥会开幕式，精彩的短片引出白虎。</p><p style=\"text-align: left;\">本届冬奥会的官方吉祥物就包括有着白老虎形象的“Soohorang”。</p><div style=\"text-align: left;\"><img width=\"199px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3783826903,2739302379&amp;fm=173&amp;s=0134E937CFA552804FCD44DE0100C0A0&amp;w=199&amp;h=287&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">据组委会介绍，老虎象征着朝鲜半岛的地理形状，尤其是白老虎被认为是神圣的守护兽。同时，白老虎的“白”色象征着冰雪体育运动。</p><p style=\"text-align: left;\">而接下来出场的这几位，中国网友纷纷表示，看着有点眼熟......</p><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3236045651,2828225351&amp;fm=173&amp;s=79A2C05D58C73B601C154FBA03007006&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3278899753,3084758734&amp;fm=173&amp;s=29C08A4E52D3187300E4888803001097&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"446px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3871616973,2868584941&amp;fm=173&amp;s=68D08A464173943D78CD459803001086&amp;w=446&amp;h=208&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"401px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3277266357,2652903491&amp;fm=173&amp;s=C4F3A86445140E750ED084920300C083&amp;w=401&amp;h=187&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3226382123,2626722303&amp;fm=173&amp;s=B23831890A132BE53A8604CC0300E097&amp;w=640&amp;h=408&amp;img.JPEG\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3300832316,3025198607&amp;fm=173&amp;s=4DE3AB46ED03B8D4505D8C9F0100C081&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者鞠焕宗摄</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3187533601,1984660226&amp;fm=173&amp;s=4892E81A95B44D821C70F5C3010010B2&amp;w=638&amp;h=188&amp;img.JPEG\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=1796697192,1090035462&amp;fm=173&amp;s=1094ED3313084D431A74A4DB0000C0B3&amp;w=639&amp;h=283&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">据媒体报道，平昌今晚最低温度低达零下十度。大部分运动员出场都是这样的装扮↓↓</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3186095462,2620925207&amp;fm=173&amp;s=FA82408B2E33AEC80E78BAAE0300E005&amp;w=640&amp;h=455&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">据组委会介绍，截至目前，来自92个国家和地区的2925名运动员确认参加本届冬奥会，同时有55684名工作人员、志愿者为本届冬奥会服务，规模均为冬奥历史之最。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3212569064,3318380883&amp;fm=173&amp;s=6552738C0B33BEDC46D0088C03008082&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新西兰代表团在开幕式上入场。 新华社记者鞠焕宗摄</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=2880670162,2566695324&amp;fm=173&amp;s=B6B0308920008EE862385EAE03007084&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3029739630,2619073062&amp;fm=173&amp;s=E38223AB34421CE57699A99C03009083&amp;w=640&amp;h=427&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">尼日利亚代表团在开幕式上入场。 新华社记者吕小炜摄</p><p style=\"text-align: left;\">可是这位......完全不是一个季节↓↓</p><div style=\"text-align: left;\"><img width=\"421px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3340746734,3089634572&amp;fm=173&amp;s=80F553822481195F08ECB58903004085&amp;w=421&amp;h=195&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">平昌冬奥汤加的旗手是越野滑雪运动员陶法托富阿，在里约奥运会的开幕式上，他也担任了汤加旗手，当时他赤裸上身，身着汤加传统服饰，给大家留下了非常深刻的印象。这一次，他再次展现了他强健的肌肉。</p><p style=\"text-align: left;\">千呼万唤~中国队入场啦！</p><div style=\"text-align: left;\"><img width=\"372px\" data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3388659037,2919817021&amp;fm=173&amp;s=C8D4C20302C319552214479803007006&amp;w=372&amp;h=187&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=2135571400,1004292982&amp;fm=173&amp;s=5786980BC21239EDDA3D9EA903007095&amp;w=639&amp;h=434&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">2月9日，中国代表团旗手周洋在开幕式上入场。中国日报记者 冯永斌 摄</p><p style=\"text-align: left;\">平昌冬奥中国代表团开幕式旗手是温哥华、索契两届冬奥会三枚金牌得主 —— 中国短道速滑运动员周洋！</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3354587794,2636390417&amp;fm=173&amp;s=9EA2C003720278EC163001DA03005035&amp;w=640&amp;h=678&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">中国代表团在开幕式上入场。 新华社记者鞠焕宗摄</p><p style=\"text-align: left;\">这也是继大杨扬之后，第二次由短道速滑运动员担任开幕式旗手！</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3802530035,2914429646&amp;fm=173&amp;s=0638188BCC93F9F14E89FCCF03008036&amp;w=639&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">中国代表团在开幕式上入场。 新华社记者鞠焕宗摄</p><p style=\"text-align: left;\">韩朝运动员代表团在朝鲜半岛旗的引导下压轴登场，本次双方选定的旗手分别是韩国雪车（有舵雪橇）运动员元润钟（音译）和朝鲜的冰球联队队员黄忠琴（音译）。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=1785124476,1268930272&amp;fm=173&amp;s=6C51EA0B40593DED02A905DB03008096&amp;w=640&amp;h=430&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">朝韩两国代表团在开幕式上举“朝鲜半岛旗”共同入场。 中国日报记者 冯永斌 摄</p><p style=\"text-align: left;\">这也是朝鲜代表团和韩国代表团第10次在国际体育赛事中共同入场。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3120847989,3041081345&amp;fm=173&amp;s=AFE9AA0B0B934DE50169E5DB030090B6&amp;w=640&amp;h=415&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">继2000年悉尼奥运会，2004年雅典奥运会以及2006年都灵冬奥会之后，韩国和朝鲜的共同组成的朝韩代表团再次携手参加奥运会的开幕式。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3838772237,2660378012&amp;fm=173&amp;s=B7E1BB094C116FEDCA0D2CD1030010B0&amp;w=640&amp;h=442&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">本届平昌冬奥，朝韩双方还联合组成了女子冰球队参赛，这是奥运会历史上的第一次。奥林匹克不能完全停止争端，但是可以在运动场上表达对和平的渴望。</p><p style=\"text-align: left;\">朝韩两国冬奥代表团在开幕式上举“朝鲜半岛旗”共同入场，再次彰显奥林匹克呼唤和平的巨大感召力。</p><p style=\"text-align: left;\">据参考消息，在开幕式现场，韩国总统文在寅身穿韩国国家队服装出席开幕式。朝鲜高级别代表团团长金永南、金正恩胞妹金与正坐在文在寅身后。落座前，文在寅主动与金与正握手。这是文在寅与来访的金与正首次会面。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3431726973,2968159559&amp;fm=173&amp;s=C8D0EA0B5C62908E7A1520DA0100C091&amp;w=640&amp;h=446&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">2月9日，朝鲜劳动党中央委员会第一副部长金与正（右三）在开幕式上。 当日，2018年平昌冬奥会开幕式在平昌奥林匹克体育场举行。新华社记者吕小炜摄</p><p style=\"text-align: left;\">孩子们共同放飞了一只和平鸽，代表着和平！天空被1218架无人机点亮，组成一个闪亮的人形，地面是5位单板滑雪者和100位双板滑雪者在奥运的赛场上疾驰而下！1218架无人机在天空组成硕大的五环！</p><div style=\"text-align: left;\"><img width=\"351px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3761076168,3169558966&amp;fm=173&amp;s=A9F8E206DBC13D6EB6DCE69F03008086&amp;w=351&amp;h=176&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"405px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2995157307,2659938657&amp;fm=173&amp;s=DFE5A9445A833B7412B7D48A0300E09F&amp;w=405&amp;h=203&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">圣火传递的最后时刻，来自朝韩女子冰球队的两名运动员一起拾级而上，将奥林匹克的圣火交给了韩国运动的象征、国民偶像——金妍儿。</p><div style=\"text-align: left;\"><img width=\"377px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2876192277,2248076147&amp;fm=173&amp;s=ACEAEA04ADE1200D6E6D888C010050C2&amp;w=377&amp;h=189&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img width=\"302px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3003303336,2758310655&amp;fm=173&amp;s=65F32A641D01217446F6E59B0300408B&amp;w=302&amp;h=159&amp;img.GIF\" data-loaded=\"0\"></div><p style=\"text-align: left;\">奥林匹克圣火，在希腊点燃之后，经过了2018公里的接力全程，终于到达金妍儿手中，金妍儿在冰上翩翩起舞，将圣火送到主火炬台下的点燃装置上，主火炬就此点燃。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3399876452,2782627847&amp;fm=173&amp;s=2560D204E5148DDC8FF6548F0300A089&amp;w=640&amp;h=820&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者白雪飞摄</p><div style=\"text-align: left;\"><img width=\"304px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3541705125,2771657533&amp;fm=173&amp;s=017971861915B0590C490D9D0300D083&amp;w=304&amp;h=181&amp;img.GIF\" data-loaded=\"0\"></div><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3699897610,3217367235&amp;fm=173&amp;s=25543BC29A3EAEDC4EFDA81F010080C3&amp;w=640&amp;h=443&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">新华社记者鞠焕宗摄</p><p style=\"text-align: left;\">比赛看点</p><p style=\"text-align: left;\">本届冬奥会中国代表团有82名运动员，参加12个项目的比赛，参加比赛的项目总数也是创下了历史新高，其中钢架雪车、雪车是历史上第一次获得参赛资格。</p><div style=\"text-align: left;\"><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2293919715,1214010658&amp;fm=173&amp;s=61F4308D5C7296CA0688628C0300E097&amp;w=640&amp;h=426&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">除了中国，还有两个队伍非常特别。</p><p style=\"text-align: left;\">一支队伍来自尼日利亚。</p><div style=\"text-align: left;\"><img width=\"500px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3507287631,2934023721&amp;fm=173&amp;s=9A922FC14402AF535EA12E120300C0D6&amp;w=500&amp;h=315&amp;img.JPEG\" data-loaded=\"0\"></div><p style=\"text-align: left;\">尼日利亚雪车队</p><p style=\"text-align: left;\">尼日利亚姑娘塞温·阿迪贡和另外两名队友今年2月组成非洲首支雪车队出征韩国平昌冬奥会。</p><p style=\"text-align: left;\">她们平时在得克萨斯州的泥土跑道上训练，直到去年1月才在犹他州帕克城踏上冰面。据英国《星期日泰晤士报》，阿迪贡在谈到比赛经历时曾说：“那是我们的第一场比赛，女士们第一见到了冰、见到雪车、见到雪车跑道”。</p><p style=\"text-align: left;\">去年完成5场资格赛并保持世界前44的排名后，这支尼日利亚雪车队终于取得今年平昌冬奥会的参赛资格。</p><p style=\"text-align: left;\">除了雪车队伍，来自非洲摩洛哥的运动员萨米尔阿兹玛尼也会参加今年冬奥会的滑雪比赛。为备战冬奥会，他利用起伏的沙丘，做强化关节训练，还会穿着装有滚轮的滑雪板在沙漠公路上提升体能和耐力。</p><p style=\"text-align: left;\">来源：CCTV5、新华社、参考消息</p><p style=\"text-align: left;\">编辑：王瑜、侯俊杰</p>', '6', '1', '2018-01-28 16:32:04', '2018-01-28 16:32:04', '1000');
INSERT INTO `article_tb` VALUES ('3', '男子行窃潜逃七年 到派出所办理业务自投罗网', '中新网益阳2月9日电(通讯员 王征 王鹏)湖南益阳市桃江县一男子涉嫌在外地行窃后潜逃七年多，', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=125060028,1933890575&fm=173&s=B2A4F00446424D57508C780A0300E0D0&w=218&h=146&img.JPEG', '', '<ul data-spm-anchor-id=\"a2c4e.11153940.blogrightarea235877.i0.d1ac624fWz3YL\"><li><p>中新网益阳2月9日电(通讯员 王征 王鹏)湖南益阳市桃江县一男子涉嫌在外地行窃后潜逃七年多，自认为桃江县警方不知情，前往派出所办理相关业务，没想到他的行踪早就为民警所掌握，一现身就被逮个正着。<br>　　2月8日，桃江县公安局大栗港派出所民警在工作中发现，辖区居民熊某某(男，51岁)于2010年被湖南宁乡市公安局列为网上逃犯，当即并与宁乡市公安局取得联系，得悉其于当年曾伙同另外两名男子(已被宁乡警方抓获)摸入一建筑工地实施盗窃，已潜逃多年，民警立即对其展开重点侦查。<br>　　经摸排走访，民警发现熊某某已回到家中，准备在家过年，并迅速掌握了其行踪。没想到当日上午，熊某某出现在了大栗港派出所，到所里办理相关业务，已有准备的民警当场将其抓获。<br>　　经讯问，熊某某对其违法事实供认不讳。据交代，因为时间久，又在外地做的案，熊某某自认为不会有危险，遂想趁着春节办理身份证等相关业务，没想到一到派出所，就被逮个正着。<br>　　目前，熊某某已被移送至宁乡市公安局。(完)<br>相关新闻<br>高速上跑上3只羊，4个人送了命，监控还原了事情真相！<br>1月15日 14:242<br>杭州保姆纵火案后 受害者家属林生斌的223天<br><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=4205884569,4087586168&amp;fm=173&amp;s=DF3A6DC80400B55D48DC110A010080D2&amp;w=550&amp;h=309&amp;img.JPEG\" data-loaded=\"0\"><br>1月30日 11:41保姆纵火案1182<br>范冰冰李晨相拥虐狗 “我们来啦”体领跑2018<br><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3084099097,2196793806&amp;fm=173&amp;s=B3B01F8DE8737C984CB830C60300E0B7&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>1月2日 09:11李晨范冰冰6<br>郑保瑞曝林志玲为角色牺牲大 否认言承旭来探班<br><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3296005729,2498333599&amp;fm=173&amp;s=D5D2728D566219114792369F0300808D&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>1月23日 11:19郑保瑞言承旭林志玲<br>赵丽颖迪奥新年宣传片遭除名 最短暂的代言人<br><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=2501000593,2430408944&amp;fm=173&amp;s=C1F2A3660A6E213418DD380B010080C3&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>1月13日 14:58赵丽颖迪奥<br>李小璐首次现身 不受负面困扰与甜馨互动有爱<br><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=3320119781,2564691871&amp;fm=173&amp;s=CB8026C14AF230195E0C0D3E0300E012&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>1月13日 16:15李小璐甜馨<br>改装达人怎么做的喷漆，下雨天就变色，保时捷的出场亮了<br>1月23日 10:25保时捷<br>美国爱德华基地：波音787-10客机正在测试低空飞行空气动力性<br><img width=\"480px\" data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2954588079,259477268&amp;fm=173&amp;s=53968A651EA9012410A1EDD103009082&amp;w=480&amp;h=270&amp;img.JPEG\" data-loaded=\"0\"><br>1月19日 09:37测试<br>韩朝高级别会谈：朝鲜重启黄海军事通信线路<br><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=979611431,3478985351&amp;fm=173&amp;s=CC3296F262A296F81E39F42A0300F050&amp;w=600&amp;h=480&amp;img.JPEG\" data-loaded=\"0\"><br>1月10日 07:18朝鲜<br>西医“判死刑”中医“起死回生” 阿根廷人彻底被中医征服了<br><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3799318434,256223654&amp;fm=173&amp;s=E6B01CC5484309494E11F40E03007041&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>1月18日 17:02中医死刑1<br>美军发布俄军苏-27战机在黑海拦截美国EP-3E侦察机视频<br><img width=\"480px\" data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=1712654024,3399937460&amp;fm=173&amp;s=9F94AC4C42B2C26C54AAA4970300408F&amp;w=480&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>2月1日 10:56战机美军<br>林心如隔天不换衣行程满满 见镜头亲切挥手秀钻戒<br><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2161653777,2135179942&amp;fm=173&amp;s=41C0F2030474259E4128F91201007091&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>1月31日 15:57林心如钻戒4<br>范冰冰抱爱猫出镜曝光“公主房” 梦幻香闺惹人羡<br><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=2792449472,2755169107&amp;fm=173&amp;s=1335598410EC4D1F8337A79A0300809F&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>1月23日 09:22范冰冰<br>女生穿裙子和穿裤子的区别，这差距真是太大了！ 新年新套路搞...<br>1月29日 22:51裙子1<br>土耳其攻击直升机攻击巴尔萨亚高地附近库尔德阵地<br><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=1661552809,4218796662&amp;fm=173&amp;s=1F36C7054CAB57247001ECC10300F0BA&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>1月29日 13:32土耳其1<br>台湾：蔡英文南部不满意度近6成 民进党反感度已超国民党<br><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3404168383,3345166883&amp;fm=173&amp;s=7B944B8D485210C05A25599703001080&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>2017年 12月28日 12:16蔡英文民进党11<br>“大象”火箭弹：叙利亚军队消灭恐怖分子的武器<br><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3120691102,2820646000&amp;fm=173&amp;s=D2920A652E81016C0C00B10F0100E0C3&amp;w=640&amp;h=348&amp;img.JPEG\" data-loaded=\"0\"><br>1月16日 16:09武器叙利亚<br>一岁以下婴儿窒息急救方法<br>2月3日 10:40婴儿<br>杭州市中院：莫焕晶承认放火和盗窃事实<br><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=1844091191,4135988656&amp;fm=173&amp;s=6BAB97454A6B181D02A9B003030010C1&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>2月1日 16:37莫焕晶盗窃<br>美女嫁入豪门，却不能公开，丈夫取走她的存款还去相亲！<br>1月30日 15:41相亲<br>汪峰谈和章子怡在一起的原因称把她看作我的女儿<br><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2315570499,2427383513&amp;fm=173&amp;s=D12A67FA5CF2309451F84418030060D3&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>2017年 12月31日 15:47汪峰章子怡13<br>\"老司机\"冯绍峰不懂\"开车\" 称绯闻不足以成话题<br><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=1858473517,2503854335&amp;fm=173&amp;s=B2A4F00446424D57508C780A0300E0D0&amp;w=640&amp;h=337&amp;img.JPEG\" data-loaded=\"0\"><br>2017年 12月29日 14:33冯绍峰票房403<br>别人家的男朋友 全都是幽默<br>1月22日 19:31男朋友1<br>美国华裔夫妇被杀案：警方逮捕3名涉案嫌疑人<br><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=402040708,968539613&amp;fm=173&amp;s=4A249D0840231B0D638870870300E0A3&amp;w=640&amp;h=356&amp;img.JPEG\" data-loaded=\"0\"><br>1月18日 09:12嫌疑人<br>【3分钟看完人的一生】从0-100岁的一生，几年内的改变或许不大<br>1月25日 11:312<br>时尚美妆潮流 粉色葡萄柚妆容 做一个粉色小仙女吧<br>1月24日 20:41美妆妆容<br>卓伟现身正面回应“李小璐事件” 笑称没拿1400万<br><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3257020041,3473446532&amp;fm=173&amp;s=C0138F740D2253054EF170C2000070B3&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>1月18日 18:01李小璐卓伟6<br>小伙花8千元打造炫酷电动车 最高时速30公里<br><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=352565876,595782625&amp;fm=173&amp;s=33B2398D42894CFCDB0478E203003012&amp;w=570&amp;h=380&amp;img.JPEG\" data-loaded=\"0\"><br>2017年 12月29日 11:285<br>民警脱警服护摔伤少女 自己冻得直搓手<br><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=1851332168,4014784854&amp;fm=173&amp;s=88C2E20122332D84762CAC920300D083&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>2月5日 16:21警服摔伤<br>用嘴和牙当乐器演奏节奏音乐<br>2月4日 23:00乐器<br>朝鲜参加平昌冬奥会——韩方先遣队今将结束考察回国<br><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=1845177104,102436705&amp;fm=173&amp;s=CC90F5B8440692EC0C38D09C0300A0D0&amp;w=600&amp;h=480&amp;img.JPEG\" data-loaded=\"0\"><br>1月25日 08:32朝鲜<br>杭州保姆纵火案再开庭被告人认罪<br><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=4186351383,3896331751&amp;fm=173&amp;s=72B25DCB82F0B2744EF1342F0300C04A&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>2月2日 14:23莫焕晶<br>母亲坐高铁忘带手机 儿子机智订餐传话：妈别怕，有人来接<br><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=3072191577,608878906&amp;fm=173&amp;s=1CD069905E6202929A3D49AF0300A00A&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>2月4日 20:30高铁<br>喂小孩子吃饭真的很需要耐心<br>1月23日 11:30<br>现在的小女孩都这么可爱了吗<br>1月17日 17:211<br>剪监控搬主机 为偷东西费心机：深夜现鬼祟身影 男子竟已三进宫<br><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=2298129038,27470137&amp;fm=173&amp;s=44F530C4F17911863832A49A0300108B&amp;w=600&amp;h=480&amp;img.JPEG\" data-loaded=\"0\"><br>1月27日 19:39三进宫1<br>女子突然晕倒 众人联手相助<br>1月16日 11:021<br>嘟嘴索吻熊抱！关晓彤带鹿晗回家疑已同居<br><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=2370485721,2574009797&amp;fm=173&amp;s=F0D171840870C896BB0AB9DA0300D099&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>2017年 12月29日 10:10关晓彤鹿晗308<br>2018款丰田Yaris GRMN搭载1.8升增压引擎<br><img data-loadfunc=\"0\" src=\"https://t10.baidu.com/it/u=4104536064,431007980&amp;fm=173&amp;s=4D771DC0999A20C02C1FE49F0300809B&amp;w=570&amp;h=380&amp;img.JPEG\" data-loaded=\"0\"><br>2月1日 10:20丰田<br>台湾：蔡英文下乡拉票 却因“过度安保”被炮轰<br><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=3210887791,2438983744&amp;fm=173&amp;s=E562AAE2455295D6DA558C0A0300B0C3&amp;w=640&amp;h=360&amp;img.JPEG\" data-loaded=\"0\"><br>1月16日 12:15蔡英文拉票</p></li></ul>', '4', '1', '2018-01-28 16:37:30', '2018-01-28 16:37:30', '1001');
INSERT INTO `article_tb` VALUES ('4', '威少为了三双遭绝杀？关键时刻又一次让乔治选择变得简单', '与掘金交手，雷霆打出了本赛季最精彩的一场比赛', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=72032686,3494064946&fm=173&s=52C048A44E4E1F5306C0858B03006081&w=218&h=146&img.JPEG', 'https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_10052312347202782283%22%7D&n_type=0&p_from=1', '<div id=\"loginBanner\"><h1></h1><h3></h3><p><span style=\"font-weight: normal;\">与掘金交手，雷霆打出了本赛季最精彩的一场比赛，保罗乔治逆天表现令人感慨万分，掘金队深知乔治手感极佳，却丝毫拿他没办法，篮下得分为所欲为，三分线外兵不血刃，最后时刻飙进三分眼看就要拖进加时赛，然而戏剧性一幕发生在灯亮那一刻。<br></span><span style=\"font-weight: normal;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=700448189,3118158180&amp;fm=173&amp;s=C2C060A444578BD6004585890300B081&amp;w=640&amp;h=503&amp;img.JPEG\" data-loaded=\"0\"><br></span><span style=\"font-weight: normal;\"><img data-loadfunc=\"0\" src=\"https://t11.baidu.com/it/u=1482253396,4075800873&amp;fm=173&amp;s=DED8698596CB38EC6AA999CD0300F011&amp;w=640&amp;h=362&amp;img.JPEG\" data-loaded=\"0\"><br></span><span style=\"font-weight: normal;\"><img data-loadfunc=\"0\" src=\"https://t12.baidu.com/it/u=2089485761,2969476882&amp;fm=173&amp;s=ADD14083C28319F53180A59A03007011&amp;w=637&amp;h=539&amp;img.JPEG\" data-loaded=\"0\"><br></span><span style=\"font-weight: normal;\">保罗乔治不仅进攻无解，而且防守端同样出色，本场他硬生生跳起抢断莱尔斯，助攻威少暴扣。<br></span><span style=\"font-weight: normal;\">最后1.4秒，威少数据正好定格在20分9篮板21助攻，面对哈里斯投篮，威少从篮下扑过来，显然这一球威少太大意，不少球迷再次质疑威少是为了抢下最后一个篮板达成三双。而在约基奇看来，哈里斯投进这记绝杀是因为威少当时睡着了。约基奇的调侃也许还在为最后时刻威少凶狠犯规而耿耿于怀。<br></span><span style=\"font-weight: normal;\">从客观角度上来看，1.4秒关系到球队胜负，威少想要这记篮板也不太现实，就算哈里斯未能投进比赛时间也到了。<br></span><span style=\"font-weight: normal;\">威少最后时刻防守可谓“进退两难”，首先一方面担心哈里斯篮下空接暴扣，另一方面就是对手投三分；但无论如何从慢镜头显示来看，他防守距离哈里斯太远，威少站在篮下也许是想和格兰特两人限制对手空接。<br></span><span style=\"font-weight: normal;\">而赛后威少也表示，哈里斯这记绝杀他有触到球，但还是进了。<br></span><span style=\"font-weight: normal;\">威少今天的表现也许又一次让乔治今夏选择变得更加简单，上一场乔治0出手，威少主动承认错误，今天末节得到了全队最高的8次出手，威少几乎将所有球权交给了了保罗乔治。</span></p><p></p><p></p></div>', '4', '1', '2018-01-28 17:34:27', '2018-01-28 17:34:27', '1002');

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
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='分发表';

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
) ENGINE=InnoDB AUTO_INCREMENT=1031 DEFAULT CHARSET=utf8 COMMENT='财务记录表 ';

-- ----------------------------
-- Records of finance_record_tb
-- ----------------------------
INSERT INTO `finance_record_tb` VALUES ('1000', '2', '1', '12552018020415050511009', '704535.00', '2', '2018-02-04 15:05:06', '2018-02-04 15:05:06', '1009');
INSERT INTO `finance_record_tb` VALUES ('1002', '2', '2', '37442018020415270911009', '200.00', '1', '2018-02-04 15:27:10', '2018-02-04 15:27:10', '1009');
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
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8 COMMENT='财务表';

-- ----------------------------
-- Records of finance_tb
-- ----------------------------
INSERT INTO `finance_tb` VALUES ('1000', '11874bb6149dd45428da628c9766b252', '438.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '438.00', '0.00', '0.00', '1000', '2018-01-19 15:46:08', '2018-02-10 13:59:05');
INSERT INTO `finance_tb` VALUES ('1005', '11874bb6149dd45428da628c9766b252', '60895.00', '769484.00', '5611.00', '700756.00', '0.00', '0.00', '4500.00', '0.00', '0.00', '0.00', '1009', '2018-01-27 18:21:05', '2018-02-09 15:41:55');
INSERT INTO `finance_tb` VALUES ('1006', '11874bb6149dd45428da628c9766b252', '129000.00', '150000.00', '0.00', '21000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1010', '2018-01-27 20:23:22', '2018-02-10 12:37:11');
INSERT INTO `finance_tb` VALUES ('1007', null, '200020001.00', '200020001.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1011', '2018-02-06 16:39:35', '2018-02-08 14:15:42');
INSERT INTO `finance_tb` VALUES ('1008', 'f7acb78963c1859d783b0d8e219e1df8', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1012', '2018-02-07 01:15:45', '2018-02-10 14:07:40');
INSERT INTO `finance_tb` VALUES ('1009', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1013', '2018-02-10 13:13:19', '2018-02-10 13:13:19');
INSERT INTO `finance_tb` VALUES ('1010', 'cbe596fb001a87b80e6502e63db8d584', '9635.00', '10000.00', '365.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1014', '2018-02-10 13:19:45', '2018-02-10 14:01:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8 COMMENT='积分榜表';

-- ----------------------------
-- Records of integral_board_tb
-- ----------------------------
INSERT INTO `integral_board_tb` VALUES ('1000', '1', '1', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '74.00', '2018-02-05 00:00:00', '2018-02-09 16:02:23', '2018-02-10 13:56:49', '1009');
INSERT INTO `integral_board_tb` VALUES ('1001', '1', '2', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '74.00', '2018-02-01 00:00:00', '2018-02-09 16:02:23', '2018-02-10 13:56:49', '1009');
INSERT INTO `integral_board_tb` VALUES ('1002', '1', '3', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '74.00', '2018-01-01 00:00:00', '2018-02-09 16:02:23', '2018-02-10 13:56:49', '1009');
INSERT INTO `integral_board_tb` VALUES ('1003', '2', '2', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '42.00', '2018-01-01 00:00:00', '2018-02-09 16:02:23', '2018-02-09 17:36:34', '1009');
INSERT INTO `integral_board_tb` VALUES ('1004', '2', '2', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '112.00', '2018-01-01 00:00:00', '2018-02-09 16:02:23', '2018-02-10 13:56:49', '1000');
INSERT INTO `integral_board_tb` VALUES ('1005', '1', '1', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '36.00', '2018-02-05 00:00:00', '2018-02-09 22:11:18', '2018-02-10 13:33:30', '1010');
INSERT INTO `integral_board_tb` VALUES ('1006', '1', '2', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '36.00', '2018-02-01 00:00:00', '2018-02-09 22:11:18', '2018-02-10 13:33:30', '1010');
INSERT INTO `integral_board_tb` VALUES ('1007', '1', '3', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '36.00', '2018-01-01 00:00:00', '2018-02-09 22:11:18', '2018-02-10 13:33:30', '1010');
INSERT INTO `integral_board_tb` VALUES ('1008', '2', '2', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '2.00', '2018-01-01 00:00:00', '2018-02-09 22:11:18', '2018-02-09 22:12:17', '1010');
INSERT INTO `integral_board_tb` VALUES ('1009', '1', '1', null, null, '39.00', '2018-02-05 00:00:00', '2018-02-09 22:27:37', '2018-02-10 00:33:13', '1000');
INSERT INTO `integral_board_tb` VALUES ('1010', '1', '2', null, null, '39.00', '2018-02-01 00:00:00', '2018-02-09 22:27:37', '2018-02-10 00:33:13', '1000');
INSERT INTO `integral_board_tb` VALUES ('1011', '1', '3', null, null, '39.00', '2018-01-01 00:00:00', '2018-02-09 22:27:37', '2018-02-10 00:33:13', '1000');
INSERT INTO `integral_board_tb` VALUES ('1012', '2', '3', null, null, '37.00', '2018-01-01 00:00:00', '2018-02-09 23:51:42', '2018-02-10 00:33:13', '1000');
INSERT INTO `integral_board_tb` VALUES ('1013', '2', '3', '谢威', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '32.00', '2018-01-01 00:00:00', '2018-02-10 00:35:54', '2018-02-10 13:56:49', '1009');
INSERT INTO `integral_board_tb` VALUES ('1014', '2', '3', '舒靖宇', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '34.00', '2018-01-01 00:00:00', '2018-02-10 01:00:18', '2018-02-10 13:33:30', '1010');

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
) ENGINE=InnoDB AUTO_INCREMENT=1290 DEFAULT CHARSET=utf8 COMMENT='积分详细表';

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
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8 COMMENT='积分表';

-- ----------------------------
-- Records of integral_tb
-- ----------------------------
INSERT INTO `integral_tb` VALUES ('1004', '39.00', '0.00', '0.00', '0.00', '2018-02-08 21:46:59', '2018-02-10 00:33:13', '1000');
INSERT INTO `integral_tb` VALUES ('1005', '74.00', '0.00', '0.00', '0.00', '2018-02-08 21:47:19', '2018-02-10 13:56:49', '1009');
INSERT INTO `integral_tb` VALUES ('1006', '36.00', '0.00', '0.00', '0.00', '2018-02-08 21:47:33', '2018-02-10 13:33:30', '1010');
INSERT INTO `integral_tb` VALUES ('1007', '0.00', '0.00', '0.00', '0.00', '2018-02-08 21:47:48', '2018-02-08 21:47:50', '1011');
INSERT INTO `integral_tb` VALUES ('1008', '0.00', '0.00', '0.00', '0.00', '2018-02-08 21:48:00', '2018-02-08 21:48:03', '1012');
INSERT INTO `integral_tb` VALUES ('1009', '0.00', '0.00', '0.00', '0.00', '2018-02-10 13:13:19', '2018-02-10 13:13:19', '1013');
INSERT INTO `integral_tb` VALUES ('1010', '0.00', '0.00', '0.00', '0.00', '2018-02-10 13:19:45', '2018-02-10 13:19:45', '1014');

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
  `title` varchar(255) DEFAULT NULL COMMENT '标题，比如：系统通知',
  `img_address` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `content` longtext COMMENT '内容',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态，默认0未读，1已读',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '通知人id外键',
  PRIMARY KEY (`notice_id`),
  KEY `INDEX_TITLE` (`title`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of notice_tb
-- ----------------------------
INSERT INTO `notice_tb` VALUES ('1000', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-02-04 16:48:40', '2018-02-05 17:40:10', null);
INSERT INTO `notice_tb` VALUES ('1002', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是一个好玩的视频app', '0', '2018-02-05 17:52:14', '2018-02-05 17:52:14', null);
INSERT INTO `notice_tb` VALUES ('1004', '团购通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gav4cn173evs35fv1g8f1e6pu.png', '您的4500.0元团购申请已成功，详情请前往您的团购中查看。', '0', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1009');
INSERT INTO `notice_tb` VALUES ('1005', '团购申请', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gb9b7411vottl4am19qm7i81d.png', '您新收到一个来自谢威的4500.0元团购申请，请及时处理。', '0', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1000');

-- ----------------------------
-- Table structure for `order_detail_tb`
-- ----------------------------
DROP TABLE IF EXISTS `order_detail_tb`;
CREATE TABLE `order_detail_tb` (
  `order_detail_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_address` varchar(255) DEFAULT NULL COMMENT '封面',
  `total_price` decimal(11,2) DEFAULT NULL COMMENT '总价',
  `number` decimal(11,2) DEFAULT NULL COMMENT '数量/集数',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `business_id` int(11) DEFAULT NULL COMMENT '业务id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  PRIMARY KEY (`order_detail_id`),
  KEY `INDEX_ORDERID` (`order_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail_tb
-- ----------------------------
INSERT INTO `order_detail_tb` VALUES ('1000', '普通vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1.00', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1002', '1000');
INSERT INTO `order_detail_tb` VALUES ('1001', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1.00', '2018-02-05 21:04:34', '2018-02-05 21:04:34', '1002', '1001');
INSERT INTO `order_detail_tb` VALUES ('1002', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1.00', '2018-02-05 21:04:37', '2018-02-05 21:04:37', '1002', '1002');
INSERT INTO `order_detail_tb` VALUES ('1003', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1.00', '2018-02-05 22:39:27', '2018-02-05 22:39:27', '1002', '1003');
INSERT INTO `order_detail_tb` VALUES ('1004', '普通vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1.00', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1002', '1004');
INSERT INTO `order_detail_tb` VALUES ('1005', '钻石vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8j4o210nm1ip459l127t1gt219.png', '4500.00', '1.00', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1003', '1005');
INSERT INTO `order_detail_tb` VALUES ('1006', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1.00', '2018-02-10 02:04:02', '2018-02-10 02:04:02', '1002', '1006');
INSERT INTO `order_detail_tb` VALUES ('1007', '普通vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1.00', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1002', '1007');

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
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8 COMMENT='视频订单表';

-- ----------------------------
-- Records of order_tb
-- ----------------------------
INSERT INTO `order_tb` VALUES ('1000', '23942018020517092018792', '1', '2', '0', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1010');
INSERT INTO `order_tb` VALUES ('1001', '28312018020521043312990', '3', '3', '2', '2018-02-05 21:04:34', '2018-02-05 21:04:34', '1009');
INSERT INTO `order_tb` VALUES ('1002', '90292018020521043717342', '3', '3', '0', '2018-02-05 21:04:37', '2018-02-05 21:04:37', '1009');
INSERT INTO `order_tb` VALUES ('1003', '18542018020522392712298', '3', '3', '0', '2018-02-05 22:39:27', '2018-02-05 22:39:27', '1009');
INSERT INTO `order_tb` VALUES ('1004', '32352018020615351817408', '1', '2', '2', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1009');
INSERT INTO `order_tb` VALUES ('1005', '48082018020915415513908', '2', '3', '1', '2018-02-09 15:41:55', '2018-02-09 15:41:55', '1009');
INSERT INTO `order_tb` VALUES ('1006', '95912018021002040216777', '3', '2', '2', '2018-02-10 02:04:02', '2018-02-10 02:04:02', '1010');
INSERT INTO `order_tb` VALUES ('1007', '47722018021013590510740', '1', '3', '2', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1014');

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
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='支付表';

-- ----------------------------
-- Records of payment_tb
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='收货地址表 ';

-- ----------------------------
-- Records of receipt_info_tb
-- ----------------------------
INSERT INTO `receipt_info_tb` VALUES ('1002', '协议', '144676494376', '贵州省 安顺市 ;心如止水一样一样', '1', '2018-01-27 19:38:42', '2018-01-27 19:38:55', '1009');

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
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8 COMMENT='拆分表';

-- ----------------------------
-- Records of split_tb
-- ----------------------------
INSERT INTO `split_tb` VALUES ('1000', '哦？是吗', '17702183918', '17702183918', '无', '39', '4500.00', '2018-02-09 15:41:55', null, '2018-02-09 15:41:55', '2018-02-09 15:41:55', '0', null, '1000', '1009', '1005');

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
INSERT INTO `team_purchase_info_tb` VALUES ('1000', '2472', '0', '0', '0.00', '2018-02-05 15:18:48', '0', '0.00', '2018-02-05 15:19:07', '0', '0.00', '2018-02-05 15:20:03', '0', '0.00', '2018-02-05 15:20:20', '2018-02-05 15:20:22', '2018-02-10 13:59:05', '1000');
INSERT INTO `team_purchase_info_tb` VALUES ('1001', '0', '0', '0', '0.00', '2018-02-05 17:09:20', '0', '0.00', '2018-02-05 17:09:20', '0', '0.00', '2018-02-05 17:09:20', '0', '0.00', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1010');
INSERT INTO `team_purchase_info_tb` VALUES ('1002', '0', '39', '39', '4500.00', '2018-02-09 15:41:55', '0', '0.00', '2018-02-06 15:35:18', '0', '0.00', '2018-02-06 15:35:18', '0', '0.00', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '2018-02-09 15:41:55', '1009');
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
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='视频缓存表';

-- ----------------------------
-- Records of video_cache_tb
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=1167 DEFAULT CHARSET=utf8 COMMENT='视频播放记录表';

-- ----------------------------
-- Records of video_play_record_tb
-- ----------------------------
INSERT INTO `video_play_record_tb` VALUES ('1028', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:25:12', '25', '1012', '2018-02-07 01:16:00', '13');
INSERT INTO `video_play_record_tb` VALUES ('1029', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-07 15:35:50', '14');
INSERT INTO `video_play_record_tb` VALUES ('1030', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-07 16:33:02', '12');
INSERT INTO `video_play_record_tb` VALUES ('1031', '全职高手', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-07 16:33:08', '13');
INSERT INTO `video_play_record_tb` VALUES ('1032', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-07 16:33:13', '14');
INSERT INTO `video_play_record_tb` VALUES ('1033', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-07 16:33:18', '14');
INSERT INTO `video_play_record_tb` VALUES ('1034', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-07 16:47:00', '14');
INSERT INTO `video_play_record_tb` VALUES ('1035', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1011', '2018-02-08 14:05:33', '12');
INSERT INTO `video_play_record_tb` VALUES ('1036', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1011', '2018-02-08 14:06:45', '14');
INSERT INTO `video_play_record_tb` VALUES ('1037', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1011', '2018-02-08 14:07:05', '2');
INSERT INTO `video_play_record_tb` VALUES ('1038', 'cs5', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:02:03', '0.7', '1011', '2018-02-08 14:07:15', '5');
INSERT INTO `video_play_record_tb` VALUES ('1040', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1011', '2018-02-08 14:16:43', '10');
INSERT INTO `video_play_record_tb` VALUES ('1041', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-08 14:57:51', '14');
INSERT INTO `video_play_record_tb` VALUES ('1046', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-08 15:16:27', '14');
INSERT INTO `video_play_record_tb` VALUES ('1047', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-08 15:18:18', '14');
INSERT INTO `video_play_record_tb` VALUES ('1048', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-08 15:18:36', '12');
INSERT INTO `video_play_record_tb` VALUES ('1058', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1012', '2018-02-08 16:35:00', '14');
INSERT INTO `video_play_record_tb` VALUES ('1059', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1012', '2018-02-08 16:35:10', '2');
INSERT INTO `video_play_record_tb` VALUES ('1060', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1012', '2018-02-08 16:35:12', '2');
INSERT INTO `video_play_record_tb` VALUES ('1061', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-08 16:49:48', '12');
INSERT INTO `video_play_record_tb` VALUES ('1062', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-08 16:50:04', '12');
INSERT INTO `video_play_record_tb` VALUES ('1063', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-08 16:50:13', '14');
INSERT INTO `video_play_record_tb` VALUES ('1064', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-08 16:52:09', '14');
INSERT INTO `video_play_record_tb` VALUES ('1065', '如何锻炼口才？', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52dh7kp1rst17pl1d14i9114meh.jpg', '00:06:32', '0.7', '1010', '2018-02-08 16:54:03', '2');
INSERT INTO `video_play_record_tb` VALUES ('1066', '如何锻炼口才？', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52dh7kp1rst17pl1d14i9114meh.jpg', '00:02:03', '0.7', '1010', '2018-02-08 16:54:09', '4');
INSERT INTO `video_play_record_tb` VALUES ('1067', '如何锻炼口才？', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52dh7kp1rst17pl1d14i9114meh.jpg', '00:06:32', '0.7', '1010', '2018-02-08 16:54:28', '2');
INSERT INTO `video_play_record_tb` VALUES ('1072', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1010', '2018-02-08 17:29:46', '2');
INSERT INTO `video_play_record_tb` VALUES ('1073', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-08 17:32:10', '14');
INSERT INTO `video_play_record_tb` VALUES ('1074', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-08 17:36:28', '14');
INSERT INTO `video_play_record_tb` VALUES ('1075', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1010', '2018-02-08 17:48:20', '2');
INSERT INTO `video_play_record_tb` VALUES ('1076', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-08 17:58:20', '13');
INSERT INTO `video_play_record_tb` VALUES ('1077', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-08 17:59:44', '13');
INSERT INTO `video_play_record_tb` VALUES ('1078', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-08 17:59:54', '13');
INSERT INTO `video_play_record_tb` VALUES ('1079', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-08 18:00:00', '13');
INSERT INTO `video_play_record_tb` VALUES ('1080', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-08 18:04:49', '12');
INSERT INTO `video_play_record_tb` VALUES ('1081', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-08 18:04:53', '12');
INSERT INTO `video_play_record_tb` VALUES ('1082', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-08 18:07:27', '13');
INSERT INTO `video_play_record_tb` VALUES ('1083', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-08 18:11:38', '12');
INSERT INTO `video_play_record_tb` VALUES ('1084', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-08 18:11:46', '12');
INSERT INTO `video_play_record_tb` VALUES ('1085', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-08 18:18:23', '13');
INSERT INTO `video_play_record_tb` VALUES ('1086', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-08 18:19:41', '13');
INSERT INTO `video_play_record_tb` VALUES ('1087', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-08 18:19:47', '13');
INSERT INTO `video_play_record_tb` VALUES ('1088', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-08 18:50:08', '12');
INSERT INTO `video_play_record_tb` VALUES ('1090', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-08 20:32:56', '13');
INSERT INTO `video_play_record_tb` VALUES ('1091', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-08 20:33:05', '9');
INSERT INTO `video_play_record_tb` VALUES ('1092', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-08 20:33:21', '9');
INSERT INTO `video_play_record_tb` VALUES ('1093', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-08 20:33:24', '9');
INSERT INTO `video_play_record_tb` VALUES ('1094', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-08 20:47:24', '9');
INSERT INTO `video_play_record_tb` VALUES ('1095', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-08 20:49:38', '12');
INSERT INTO `video_play_record_tb` VALUES ('1096', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-08 20:49:42', '14');
INSERT INTO `video_play_record_tb` VALUES ('1097', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-08 20:49:46', '13');
INSERT INTO `video_play_record_tb` VALUES ('1098', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-08 20:49:49', '9');
INSERT INTO `video_play_record_tb` VALUES ('1099', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1010', '2018-02-08 20:51:02', '2');
INSERT INTO `video_play_record_tb` VALUES ('1104', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1010', '2018-02-08 22:55:25', '2');
INSERT INTO `video_play_record_tb` VALUES ('1107', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1009', '2018-02-09 00:02:40', '13');
INSERT INTO `video_play_record_tb` VALUES ('1108', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1009', '2018-02-09 00:04:18', '12');
INSERT INTO `video_play_record_tb` VALUES ('1109', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1010', '2018-02-09 13:13:57', '2');
INSERT INTO `video_play_record_tb` VALUES ('1110', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1010', '2018-02-09 15:35:25', '8');
INSERT INTO `video_play_record_tb` VALUES ('1111', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1010', '2018-02-09 15:59:20', '8');
INSERT INTO `video_play_record_tb` VALUES ('1112', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', '1010', '2018-02-09 15:59:29', '2');
INSERT INTO `video_play_record_tb` VALUES ('1113', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1009', '2018-02-09 16:02:23', '9');
INSERT INTO `video_play_record_tb` VALUES ('1114', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1009', '2018-02-09 16:06:10', '7');
INSERT INTO `video_play_record_tb` VALUES ('1115', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1009', '2018-02-09 16:10:48', '14');
INSERT INTO `video_play_record_tb` VALUES ('1116', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1009', '2018-02-09 17:00:31', '10');
INSERT INTO `video_play_record_tb` VALUES ('1117', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1009', '2018-02-09 17:21:36', '7');
INSERT INTO `video_play_record_tb` VALUES ('1118', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1009', '2018-02-09 17:36:29', '8');
INSERT INTO `video_play_record_tb` VALUES ('1119', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1010', '2018-02-09 22:08:39', '8');
INSERT INTO `video_play_record_tb` VALUES ('1120', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1010', '2018-02-09 22:11:18', '8');
INSERT INTO `video_play_record_tb` VALUES ('1121', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1000', '2018-02-09 22:27:36', '7');
INSERT INTO `video_play_record_tb` VALUES ('1122', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1000', '2018-02-09 23:51:42', '8');
INSERT INTO `video_play_record_tb` VALUES ('1123', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1000', '2018-02-09 23:55:32', '10');
INSERT INTO `video_play_record_tb` VALUES ('1124', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1000', '2018-02-10 00:06:38', '7');
INSERT INTO `video_play_record_tb` VALUES ('1125', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1000', '2018-02-10 00:10:41', '10');
INSERT INTO `video_play_record_tb` VALUES ('1126', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1000', '2018-02-10 00:17:28', '7');
INSERT INTO `video_play_record_tb` VALUES ('1127', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1000', '2018-02-10 00:23:31', '10');
INSERT INTO `video_play_record_tb` VALUES ('1128', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1000', '2018-02-10 00:30:40', '7');
INSERT INTO `video_play_record_tb` VALUES ('1129', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1000', '2018-02-10 00:32:34', '10');
INSERT INTO `video_play_record_tb` VALUES ('1130', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1000', '2018-02-10 00:32:48', '12');
INSERT INTO `video_play_record_tb` VALUES ('1131', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1009', '2018-02-10 00:35:54', '10');
INSERT INTO `video_play_record_tb` VALUES ('1132', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1009', '2018-02-10 00:47:11', '7');
INSERT INTO `video_play_record_tb` VALUES ('1133', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1009', '2018-02-10 00:55:05', '12');
INSERT INTO `video_play_record_tb` VALUES ('1134', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', '1010', '2018-02-10 01:00:18', '8');
INSERT INTO `video_play_record_tb` VALUES ('1135', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1009', '2018-02-10 01:01:41', '7');
INSERT INTO `video_play_record_tb` VALUES ('1136', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', '1009', '2018-02-10 01:03:25', '7');
INSERT INTO `video_play_record_tb` VALUES ('1137', 'cccccd', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', '1009', '2018-02-10 01:03:45', '11');
INSERT INTO `video_play_record_tb` VALUES ('1138', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 01:04:15', '12');
INSERT INTO `video_play_record_tb` VALUES ('1139', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 01:04:27', '12');
INSERT INTO `video_play_record_tb` VALUES ('1140', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 01:07:44', '12');
INSERT INTO `video_play_record_tb` VALUES ('1141', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 01:07:51', '12');
INSERT INTO `video_play_record_tb` VALUES ('1142', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 01:09:08', '12');
INSERT INTO `video_play_record_tb` VALUES ('1143', 'cccccd', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', '1009', '2018-02-10 01:12:16', '11');
INSERT INTO `video_play_record_tb` VALUES ('1144', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 01:12:23', '12');
INSERT INTO `video_play_record_tb` VALUES ('1145', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 01:14:03', '12');
INSERT INTO `video_play_record_tb` VALUES ('1146', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 02:03:41', '12');
INSERT INTO `video_play_record_tb` VALUES ('1147', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-10 02:04:33', '9');
INSERT INTO `video_play_record_tb` VALUES ('1148', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-10 02:07:14', '9');
INSERT INTO `video_play_record_tb` VALUES ('1149', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-10 11:09:14', '9');
INSERT INTO `video_play_record_tb` VALUES ('1150', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 12:39:39', '12');
INSERT INTO `video_play_record_tb` VALUES ('1151', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 12:41:09', '12');
INSERT INTO `video_play_record_tb` VALUES ('1152', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-10 12:42:05', '9');
INSERT INTO `video_play_record_tb` VALUES ('1153', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 12:42:27', '12');
INSERT INTO `video_play_record_tb` VALUES ('1154', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 12:44:10', '12');
INSERT INTO `video_play_record_tb` VALUES ('1155', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 12:46:23', '12');
INSERT INTO `video_play_record_tb` VALUES ('1156', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-10 12:47:14', '9');
INSERT INTO `video_play_record_tb` VALUES ('1157', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', '1010', '2018-02-10 12:56:22', '9');
INSERT INTO `video_play_record_tb` VALUES ('1158', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', '1010', '2018-02-10 12:58:38', '12');
INSERT INTO `video_play_record_tb` VALUES ('1159', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-10 13:05:19', '13');
INSERT INTO `video_play_record_tb` VALUES ('1160', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-10 13:05:25', '13');
INSERT INTO `video_play_record_tb` VALUES ('1161', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-10 13:32:40', '13');
INSERT INTO `video_play_record_tb` VALUES ('1162', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-10 13:33:19', '13');
INSERT INTO `video_play_record_tb` VALUES ('1163', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-10 13:33:23', '13');
INSERT INTO `video_play_record_tb` VALUES ('1164', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1010', '2018-02-10 13:33:29', '13');
INSERT INTO `video_play_record_tb` VALUES ('1165', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', '1009', '2018-02-10 13:54:13', '13');
INSERT INTO `video_play_record_tb` VALUES ('1166', 'cccccd', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', '1009', '2018-02-10 13:56:39', '11');

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
INSERT INTO `video_set_cate_tb` VALUES ('1000', '婚姻家庭', '婚姻家庭咨询师是为在恋爱、婚姻、家庭生活中遇到各种问题的求助者提供咨询和辅导服务的人员，他们会恪守职业道德，保护求助者的个人隐私，更好地为求助者服务。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a23rgp1lttge8ogq13c717cf1f.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5s9o8r4nqj1uaf1n3p18dh1svu5b.jpg', '16', '2018-02-10 12:58:38');
INSERT INTO `video_set_cate_tb` VALUES ('1001', '子女教育', '教育子女要以引导，引诱，方法，在游戏中学习，娱乐中提高，比赛中锻炼，人才共生就是要吧学习的人放在一起所以他们就爱学习，所以你要运用适当的方法和技巧去引导他，当上学的时候就可以竞争中提高了。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a239ko11im15na1gr0b5n1uec1a.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5s9revogh31sm5o1a3d719et5g.jpg', '7', '2018-02-10 13:54:13');
INSERT INTO `video_set_cate_tb` VALUES ('1002', '演讲口才', '《演讲与口才》是一个杂志出刊。该杂志创始人为邵守义，他对我国演讲与口才理论的研究做出了巨大的贡献，被誉为“新时期演讲事业的开拓者”。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a22n7t17de8g913e7gghnou15.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5s9sfdf172u1h7v1jaf114u4c75l.jpg', '1', '2018-02-09 16:10:48');
INSERT INTO `video_set_cate_tb` VALUES ('1003', '自我成长', '人一生的主线基本围绕家庭，工作，情感三个方面，其中工作是实现自我最直接的一条线，身边总会有一些成功或是不成功的案例。多数人对成功的理解就是拥有更多的财富，而作为一个从事多年猎头顾问以及心理咨询的我来说，如何将自我成长发挥到极致才是真正的成功。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a224rvlcnqfr1h5ao11p4610.png', 'https://image.xinli001.com/20160115/100404ru964l7hjfz8r5mz.jpg', '9', '2018-02-10 01:03:25');
INSERT INTO `video_set_cate_tb` VALUES ('1004', '人际关系', '人际关系这个词是在20世纪初由美国人事管理协会率先提出的，也被称为人际关系论，1933年由美国哈佛大学教授梅约创立。这个概念可以从三个方面理解：\n1、人际关系表明人与人相互交往过程中心理关系的亲密性、融洽性和协调性的程度\n2、人际关系有三种心理成分组成。认知、情感和行为成分\n3、人际关系是在彼此交往的过程中建立和发展起来的。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a21jr7r8aang1ih21na11ol8r.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5s9uppvhmi1jl4slu1pv9pdh5q.jpg', '4', '2018-02-10 01:00:18');
INSERT INTO `video_set_cate_tb` VALUES ('1005', '企业管理', '企业管理是对企业生产经营活动进行计划、组织、指挥、协调和控制等一系列活动的总称，是社会化大生产的客观要求。企业管理是尽可能利用企业的人力、物力、财力、信息等资源，实现多、快、好、省的目标，取得最大的投入产出效率。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a21642lig1i7a12siea1m01m.png', 'https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D220/sign=d8b6210d8313632711edc531a18ea056/c8ea15ce36d3d5397f69b2123387e950342ab08f.jpg', '7', '2018-02-10 12:56:22');
INSERT INTO `video_set_cate_tb` VALUES ('1006', '团队打造', '“没有行动的远见只能是一种梦想，没有远见的行动只能是一种苦役，远见和行动才是世界的希望”', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a20f1q9ka31d1acl1l7h18ioh.png', 'https://gss0.baidu.com/9fo3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/f9198618367adab480e717ba80d4b31c8701e410.jpg', '6', '2018-02-10 00:35:54');
INSERT INTO `video_set_cate_tb` VALUES ('1007', '市场营销', '市场营销（Marketing），又称作市场学、市场行销或行销学，MBA、EMBA等经典商管课程均将市场营销作为对管理者进行管理和教育的重要模块包含在内。市场营销是在创造、沟通、传播和交换产品中，为顾客、客户、合作伙伴以及整个社会带来经济价值的活动、过程和体系。主要是指营销人员针对市场开展经营活动、销售行为的过程。', 'http://p2bhwwngu.bkt.clouddn.com/o_1c58i4jkm123t1mpa2bkgp8i17h.png', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2098464012,1630838369&fm=173&s=9BA046870C1138DC56A73FA10300B00E&w=218&h=146&img.JPEG', '3', '2018-02-10 13:56:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8 COMMENT='视频集收藏表';

-- ----------------------------
-- Records of video_set_collect_tb
-- ----------------------------
INSERT INTO `video_set_collect_tb` VALUES ('1015', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', '1010', '2018-02-07 16:33:20', '1008');

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
INSERT INTO `video_set_search_tb` VALUES ('1000', '人才', '6', '2018-02-07 10:35:22');
INSERT INTO `video_set_search_tb` VALUES ('1001', '团队', '333', '2018-02-02 19:33:43');
INSERT INTO `video_set_search_tb` VALUES ('1002', '亲子', '3', '2018-02-07 10:33:30');
INSERT INTO `video_set_search_tb` VALUES ('1003', '教育', '12327', '2018-02-07 11:03:24');
INSERT INTO `video_set_search_tb` VALUES ('1004', '人生', '1232', '2018-02-02 19:34:06');
INSERT INTO `video_set_search_tb` VALUES ('1005', '打造', '13434', '2018-02-02 19:34:14');
INSERT INTO `video_set_search_tb` VALUES ('1006', '口才', '13441', '2018-02-10 13:33:35');
INSERT INTO `video_set_search_tb` VALUES ('1007', '成长', '12324', '2018-02-07 10:12:21');
INSERT INTO `video_set_search_tb` VALUES ('1008', '营销', '12325', '2018-02-07 10:35:06');
INSERT INTO `video_set_search_tb` VALUES ('1009', '222', '2', '2018-02-07 11:03:28');

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
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8 COMMENT='视频集表';

-- ----------------------------
-- Records of video_set_tb
-- ----------------------------
INSERT INTO `video_set_tb` VALUES ('1000', '自带流量的IP是个什么鬼？', 'http://p2bhwwngu.bkt.clouddn.com/o_1c529rh8d1sea19b1l9hgfr1p1kh.jpg', '苗庆显', '三只松鼠毫无疑问是电商上最成功的坚果品牌，有数据说2016年销售了49亿元，2017年的双十一又是坚果类销售第一。\n据总结，三只松鼠的成功是IP化的成功，于是为了IP价值的最大化，三只松鼠决定干两件事：一是延伸品类，比如做牙膏，理由是“吃了三只松鼠的坚果，要刷牙，肯定会想到用三只松鼠的牙膏”；二是布局线下店，让三只松鼠的IP价值在线下落地。', '0', '1', '0.00', '1', '3', '1', '1007', '2018-01-30 09:11:57', '2018-02-08 18:48:14');
INSERT INTO `video_set_tb` VALUES ('1001', '如何打造高效团队？最重要的是这三件事', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '多多头 ', '据说二战时德国军队将人分成四类：聪明又懒惰的可做军官，聪明又勤快的可任参谋；愚蠢又懒惰的可当士兵，愚蠢又勤快的赶紧滚蛋。以上说法虽然有失偏颇但是也昭显了一个高效团队的管理思路和用人原则。', '0', '1', '0.00', '1', '6', '1', '1006', '2018-01-30 09:27:07', '2018-02-08 18:48:19');
INSERT INTO `video_set_tb` VALUES ('1002', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '测试', '企业管理学专业主要是培养能够掌握现代工商管理的理论、方法和技能，熟悉国内外工商管理的历史、现状和最新动态，能用所学知识分析解决我国企业管理中的一些实际问题的高级人才。', '1', '2', '1111.00', '1', '7', '1', '1005', '2018-01-30 10:01:47', '2018-01-30 14:20:52');
INSERT INTO `video_set_tb` VALUES ('1003', '人际关系', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '百科科学词条', '人际关系这个词是在20世纪初由美国人事管理协会率先提出的，也被称为人际关系论，1933年由美国哈佛大学教授梅约创立。这个概念可以从三个方面理解：\n1、人际关系表明人与人相互交往过程中心理关系的亲密性、融洽性和协调性的程度\n2、人际关系有三种心理成分组成。认知、情感和行为成分\n3、人际关系是在彼此交往的过程中建立和发展起来的。', '2', '1', '0.00', '1', '4', '1', '1004', '2018-01-30 10:03:40', '2018-01-30 14:20:19');
INSERT INTO `video_set_tb` VALUES ('1004', '如何定义自我成长', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52ctfj617p11u6hak28j7uttr.jpg', 'SusanKuang', '知识，作为人类集体智慧的结晶，是从古至今所有人类长期探索宇宙万物以及自我所积累的结果。然而并非所有知识都拥有同样的价值，其中最重要的当然非科学知识莫属。与非科学或者伪科学类知识不同，科学知识有几大重要特点：第一，它的涵盖面很广，能够解释的范围也广；第二，它研究的是客观世界，并且可以通过不断自我修正的方式去接近真理；第三，它追求逻辑上的自洽性。因此，当我们以科学知识为基础去了解周围世界时，我们对于世界的理解会更接近其真实的样子。\n\n作者：SusanKuang\n链接：https://www.jianshu.com/p/3bfb8f05d64a\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '0', '1', '0.00', '2', '9', '1', '1003', '2018-01-30 10:04:52', '2018-02-08 18:48:26');
INSERT INTO `video_set_tb` VALUES ('1005', '如何锻炼口才？', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52dh7kp1rst17pl1d14i9114meh.jpg', '知乎用户', '口才像一辆汽车，表达能力是发动机，知识积累、业务能力、敬业精神这些都是汽油。没有汽油，再好的发动机也没用。腹有诗书气自华，随着内在综合实力的提高，你的外在气质也会出现相匹配的分值上升，提升整体战斗力。', '0', '1', '0.00', '4', '0', '1', '1002', '2018-01-30 10:16:25', '2018-02-08 18:48:09');
INSERT INTO `video_set_tb` VALUES ('1006', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', 'ces', '程皓具有金牌牙医和恋爱专家两种身份，帮客户王宁在比利时举办婚礼派对。派对结束泳池边有美女陷入窒息，程皓为美女做心脏复苏，被即将升任大堂经理的罗玥误会猥亵少女，打晕并报警抓走程皓。罗玥嫉恶如仇在警局仍指责攻击程皓，调取录像证明程皓清白，程皓寄投诉信反击罗玥。经理带罗玥前来道歉赔偿，程皓要罗玥当私人导游。', '1', '2', '0.01', '1', '16', '1', '1000', '2018-02-01 14:06:19', '2018-02-10 12:37:39');
INSERT INTO `video_set_tb` VALUES ('1007', '全职高手', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', 'ss', '作为嘉世战队队长的叶秋被俱乐部逼得交出一叶之秋账号卡，叶秋不愿做陪练，提出解约。俱乐部以叶秋劳苦功高为由，逼他退役来交换赔付违约费。叶秋同意，随后离开了嘉世。苏沐橙追上他表示不舍，叶秋告诉苏沐橙，他会“休息一年，然后回来”。在游荡中，叶修进入兴欣网络会所，因帮陈果打败了连胜陈果的敌手，', '1', '1', '0.00', '1', '7', '1', '1001', '2018-02-01 14:15:36', '2018-02-08 18:47:45');
INSERT INTO `video_set_tb` VALUES ('1008', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', 'dd', '萧炎，主人公，萧家历史上空前绝后的斗气修炼天才。4岁就开始修炼斗之气，10岁拥有了九段斗之气，11岁突破十段斗之气，一跃成为家族百年来最年轻的斗者。然而在12岁那年，他却“丧失”了修炼能力，只拥有三段斗之气。整整三年时间，家族冷遇，旁人轻视，被未婚妻退婚……种种打击接踵而至。 就在他即将绝望的时候，', '0', '1', '0.00', '1', '1', '1', '1002', '2018-02-01 14:18:06', '2018-02-08 18:48:02');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='视频表';

-- ----------------------------
-- Records of video_tb
-- ----------------------------
INSERT INTO `video_tb` VALUES ('2', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '0', '1', '1005', '2018-01-30 14:01:43', '2018-02-07 10:21:59');
INSERT INTO `video_tb` VALUES ('3', 'cesh3', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '0', '1', '1005', '2018-01-30 14:06:43', '2018-02-07 10:21:50');
INSERT INTO `video_tb` VALUES ('4', 'ces4', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '0', '1', '1005', '2018-01-30 14:12:18', '2018-02-07 10:21:24');
INSERT INTO `video_tb` VALUES ('5', 'cs5', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '0', '1', '1005', '2018-01-30 14:18:24', '2018-02-07 10:21:33');
INSERT INTO `video_tb` VALUES ('6', 'cc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '0', '1', '1004', '2018-01-30 14:19:13', '2018-02-07 10:20:16');
INSERT INTO `video_tb` VALUES ('7', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '9', '1', '1004', '2018-01-30 14:19:50', '2018-02-07 10:20:25');
INSERT INTO `video_tb` VALUES ('8', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '4', '1', '1003', '2018-01-30 14:20:19', '2018-02-07 10:20:02');
INSERT INTO `video_tb` VALUES ('9', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '7', '1', '1002', '2018-01-30 14:20:52', '2018-02-07 10:20:37');
INSERT INTO `video_tb` VALUES ('10', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q5on0t5gbq5a2e11eh18eo1i.mp4', '6', '1', '1001', '2018-01-30 14:21:37', '2018-02-07 10:20:54');
INSERT INTO `video_tb` VALUES ('11', 'cccccd', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '3', '1', '1000', '2018-01-30 14:23:05', '2018-02-07 10:21:07');
INSERT INTO `video_tb` VALUES ('12', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '16', '1', '1006', '2018-02-01 14:10:54', '2018-02-07 10:22:46');
INSERT INTO `video_tb` VALUES ('13', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '7', '1', '1007', '2018-02-01 14:17:17', '2018-02-07 10:22:30');
INSERT INTO `video_tb` VALUES ('14', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '1', '1', '1008', '2018-02-01 14:19:07', '2018-02-07 10:22:16');

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
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='vip成长记录表';

-- ----------------------------
-- Records of vip_growth_record_tb
-- ----------------------------
INSERT INTO `vip_growth_record_tb` VALUES ('1000', '学徒', '1', '365.00', '2018-02-05 17:09:20', '1010');
INSERT INTO `vip_growth_record_tb` VALUES ('1001', '学徒', '1', '365.00', '2018-02-06 15:35:18', '1009');
INSERT INTO `vip_growth_record_tb` VALUES ('1002', '学徒', '1', '365.00', '2018-02-10 13:59:05', '1014');

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
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8 COMMENT='vip表';

-- ----------------------------
-- Records of vip_tb
-- ----------------------------
INSERT INTO `vip_tb` VALUES ('1000', '普通vip', '1', '1', '2019-02-06 15:35:18', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1009');
INSERT INTO `vip_tb` VALUES ('1001', '普通vip', '1', '1', '2019-02-05 17:09:20', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1010');
INSERT INTO `vip_tb` VALUES ('1002', '创始股东', '5', '1', '2030-01-01 13:16:18', '2018-02-05 13:16:35', '2018-02-05 13:16:37', '1000');
INSERT INTO `vip_tb` VALUES ('1003', '学徒', '0', '0', '2018-02-06 16:39:35', '2018-02-06 16:39:35', '2018-02-06 16:39:35', '1011');
INSERT INTO `vip_tb` VALUES ('1004', '学徒', '0', '0', '2018-02-07 01:15:45', '2018-02-07 01:15:45', '2018-02-07 01:15:45', '1012');
INSERT INTO `vip_tb` VALUES ('1005', '学徒', '0', '0', '2018-02-10 13:13:19', '2018-02-10 13:13:19', '2018-02-10 13:13:19', '1013');
INSERT INTO `vip_tb` VALUES ('1006', '普通vip', '1', '1', '2019-02-10 13:59:05', '2018-02-10 13:59:05', '2018-02-10 13:59:05', '1014');
