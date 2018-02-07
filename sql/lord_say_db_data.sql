/*
Navicat MySQL Data Transfer

Source Server         : centos_10m-2
Source Server Version : 50636
Source Host           : 118.190.133.146:3306
Source Database       : lord_say_db

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2018-02-07 10:29:47
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
) ENGINE=InnoDB AUTO_INCREMENT=1007 DEFAULT CHARSET=utf8 COMMENT='账户上级表';

-- ----------------------------
-- Records of account_parent_tb
-- ----------------------------
INSERT INTO `account_parent_tb` VALUES ('1001', '1009', '谢威', '17702183918', '1', '1000', '1000', '1002', '普通vip', '2018-01-27 18:21:05', '2018-01-27 18:21:05');
INSERT INTO `account_parent_tb` VALUES ('1002', '1010', '舒靖宇', '15211547807', '0', '1000', '1000', '1002', '普通vip', '2018-02-04 20:28:28', '2018-02-04 20:28:28');
INSERT INTO `account_parent_tb` VALUES ('1004', '1000', '聂跃', '15111336587', '3', null, null, '1006', '创始股东', '2018-02-05 13:13:47', '2018-02-05 13:13:52');
INSERT INTO `account_parent_tb` VALUES ('1005', '1011', null, '15111336586', '0', '1000', '1000', '1001', '学徒', '2018-02-06 16:39:35', '2018-02-06 16:39:35');
INSERT INTO `account_parent_tb` VALUES ('1006', '1012', null, '15674830902', '0', '1009', '1009', '1001', '学徒', '2018-02-07 01:15:45', '2018-02-07 01:15:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8 COMMENT='账户表';

-- ----------------------------
-- Records of account_tb
-- ----------------------------
INSERT INTO `account_tb` VALUES ('1000', null, '15111336587', '11874bb6149dd45428da628c9766b252', null, '聂跃', null, '0', null, null, null, null, null, '278076304@qq.com', null, null, null, null, null, null, '2018-01-19 15:46:08', '2018-02-07 09:26:16', '0', null, '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1009', '新婆婆婆婆师兄弟帝王将相洗衣机维修', '17702183918', '11874bb6149dd45428da628c9766b252', '', '我会注意', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722', '2', '25', '', '北京市', '福建省-福州市', '谢威', '', '2', '136494946469476', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180204154022', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180204154038', '', '', '2018-01-27 18:21:05', '2018-02-07 01:38:18', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1010', '-/:;()', '15211547807', '11874bb6149dd45428da628c9766b252', null, '123', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517055943.png', '2', '25', null, '湖北省', '武汉市', '舒靖宇', null, '2', '123456', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517747286.png', 'http://p2bhwwngu.bkt.clouddn.com/ios_1010_1517747301.png', '147852369', 'gmjgdpg123', '2018-01-27 20:23:22', '2018-02-07 10:12:10', '0', '1000', '1001', '用户');
INSERT INTO `account_tb` VALUES ('1011', 'safsdafdsf', '15111336586', '11874bb6149dd45428da628c9766b252', '15111336586', 'vdsfv', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5l472v92qo1849k1h1jec1d6g7v.png', '1', null, '中国', '湖南省', '长沙市', 'sfdsf', '232@gfdgf.bg', '0', '123123123213123', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5l495bc2eqsgf1l6g1l2e1b1d84.png', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5l49rul2nc1gtb1m1m1k861peo89.png', 'dsf', 'sdfsdf', '2018-02-06 16:39:35', '2018-02-06 16:39:35', '0', '1000', '1000', '超级管理员');
INSERT INTO `account_tb` VALUES ('1012', null, '15674830902', '11874bb6149dd45428da628c9766b252', null, '哈哈哈', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180207011738', '1', '26', null, null, '海南省-三亚市', null, null, '0', null, null, null, null, null, '2018-02-07 01:15:45', '2018-02-07 01:37:53', '0', '1009', '1001', '用户');

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
INSERT INTO `app_version_tb` VALUES ('1006', '0', 'sdf', '0', 'sdf', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5kj83gl1b7kviik4u19mvlish.png', '2018-02-06 11:41:28', '0');
INSERT INTO `app_version_tb` VALUES ('1007', '0', 'sdf', '0', 'sdf', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5kj8tnt5pdf453l8oa61daum.png', '2018-02-06 11:41:46', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

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
INSERT INTO `article_comment_tb` VALUES ('10', '你想让我庸人自扰之', '0', '2018-02-02 01:54:55', '2', '1009', '啦啦啦啦', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('11', '5句我自己', '0', '2018-02-03 01:46:15', '3', '1009', '我会注意', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');
INSERT INTO `article_comment_tb` VALUES ('12', 'ggvv记录', '0', '2018-02-07 00:48:20', '4', '1009', '我会注意', 'http://p2bhwwngu.bkt.clouddn.com/fitment_20180127193722');

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
INSERT INTO `article_tb` VALUES ('2', '测试', '测试dsfwef23tfgdsf', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '', '<p>十大法师的</p>', '2', '1', '2018-01-28 16:32:04', '2018-01-28 16:32:04', '1000');
INSERT INTO `article_tb` VALUES ('3', '三大范德萨', '三2323大范23432德萨54235', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5fbqc4hs58jlk1su91g69se2p.png', '', '<ul data-spm-anchor-id=\"a2c4e.11153940.blogrightarea235877.i0.d1ac624fWz3YL\"><li>博主其他文章</li></ul><p><a href=\"https://yq.aliyun.com/users/1867147223053016/own\" target=\"_self\" rel=\"nofollow\">更多&gt;</a></p><div><ul><li><i></i><a href=\"https://yq.aliyun.com/articles/292326\">webstorm激活</a></li><li><i></i><a href=\"https://yq.aliyun.com/articles/278868\">正则表达式应用——实例应用</a></li><li><i></i><a href=\"https://yq.aliyun.com/articles/257445\">事件触发器---dispatchEvent、fireEvent</a></li><li><i></i><a href=\"https://yq.aliyun.com/articles/255054\">策略模式设计表单校验</a></li><li><i></i><a href=\"https://yq.aliyun.com/articles/253170\">阿里云 oss JavaScript客户端签名文件上传 vue2.0</a></li><li><i></i><a href=\"https://yq.aliyun.com/articles/236543\">form 表单提交数据小记</a></li><li><i></i><a href=\"https://yq.aliyun.com/articles/219535\">网页图片加载loading效果实现</a></li><li><i></i><a href=\"https://yq.aliyun.com/articles/143740\">mac 配置本地apache</a></li><li><i></i><a href=\"https://yq.aliyun.com/articles/143730\">display:flex; 布局</a><img src=\"http://p2bhwwngu.bkt.clouddn.com/o_1c5fbr2dra691foh1h2t1ij41nbi16.png\" style=\"max-width:100%;\"></li></ul></div>', '4', '1', '2018-01-28 16:37:30', '2018-01-28 16:37:30', '1001');
INSERT INTO `article_tb` VALUES ('4', '十大法师', '十大法师222的十大法师的3323十大法师的十445大法师的', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52dh7kp1rst17pl1d14i9114meh.jpg', 'http://www.baidu.com', '<div id=\"loginBanner\"><div><div><div><h1>在 SegmentFault，学习技能、解决问题</h1><p>每个月，我们帮助 1000 万的开发者解决各种各样的技术问题。并助力他们在技术能力、职业生涯、影响力上获得提升。</p></div><div><a href=\"https://segmentfault.com/user/login\">免费注册</a>&nbsp;<a href=\"https://segmentfault.com/user/login\">立即登录</a></div></div></div></div><footer id=\"footer\"><div><div><dl><dt>产品</dt><dd><a href=\"https://segmentfault.com/questions/hottest?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=product&amp;utm_content=footer-links-hottest-questions&amp;utm_term=%E7%83%AD%E9%97%A8%E9%97%AE%E7%AD%94\">热门问答</a></dd><dd><a href=\"https://segmentfault.com/blogs/hottest?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=product&amp;utm_content=footer-links-hottest-questions&amp;utm_term=%E7%83%AD%E9%97%A8%E4%B8%93%E6%A0%8F\">热门专栏</a></dd><dd><a href=\"https://segmentfault.com/lives?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=product&amp;utm_content=footer-links-hottest-questions&amp;utm_term=%E7%83%AD%E9%97%A8%E8%AE%B2%E5%A0%82\">热门讲堂</a></dd><dd><a href=\"https://segmentfault.com/events?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=product&amp;utm_content=footer-links-hottest-questions&amp;utm_term=%E6%9C%80%E6%96%B0%E6%B4%BB%E5%8A%A8\">最新活动</a></dd><dd><a href=\"https://segmentfault.com/groups?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=product&amp;utm_content=footer-links-hottest-questions&amp;utm_term=%E6%8A%80%E6%9C%AF%E5%9C%88\">技术圈</a></dd><dd><a href=\"https://segmentfault.com/jobs?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=product&amp;utm_content=footer-links-hottest-questions&amp;utm_term=%E6%89%BE%E5%B7%A5%E4%BD%9C\">找工作</a></dd><dd><a href=\"https://segmentfault.com/app?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=product&amp;utm_content=footer-links-hottest-questions&amp;utm_term=app\">移动客户端</a></dd></dl><dl><dt>资源</dt><dd><a href=\"https://segmentfault.com/weekly?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=resource&amp;utm_content=footer-links-weekly&amp;utm_term=%E6%AF%8F%E5%91%A8%E7%B2%BE%E9%80%89\">每周精选</a></dd><dd><a href=\"https://segmentfault.com/users?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=resource&amp;utm_content=footer-links-users&amp;utm_term=%E7%94%A8%E6%88%B7%E6%8E%92%E8%A1%8C%E6%A6%9C\">用户排行榜</a></dd><dd><a href=\"https://segmentfault.com/badges?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=resource&amp;utm_content=footer-links-badges&amp;utm_term=%E5%BE%BD%E7%AB%A0\">徽章</a></dd><dd><a href=\"https://segmentfault.com/faq?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=resource&amp;utm_content=footer-links-faq&amp;utm_term=%E5%B8%AE%E5%8A%A9%E4%B8%AD%E5%BF%83\">帮助中心</a></dd><dd><a href=\"https://segmentfault.com/repu?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=resource&amp;utm_content=footer-links-repu&amp;utm_term=%E5%A3%B0%E6%9C%9B%E4%B8%8E%E6%9D%83%E9%99%90\">声望与权限</a></dd><dd><a href=\"https://segmentfault.com/community?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=resource&amp;utm_content=footer-links-community&amp;utm_term=%E7%A4%BE%E5%8C%BA%E6%9C%8D%E5%8A%A1%E4%B8%AD%E5%BF%83\">社区服务中心</a></dd><dd><a href=\"https://docs.segmentfault.com/?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=resource&amp;utm_content=footer-links-docs&amp;utm_term=%E5%BC%80%E5%8F%91%E6%89%8B%E5%86%8C\">开发手册</a></dd></dl><dl><dt>商务</dt><dd><a href=\"https://business.segmentfault.com/services.html?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=business&amp;utm_content=footer-links-services-rencai&amp;utm_term=%E4%BA%BA%E6%89%8D%E6%9C%8D%E5%8A%A1\" target=\"_blank\">人才服务</a></dd><dd><a href=\"https://business.segmentfault.com/services.html?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=business&amp;utm_content=footer-links-services-qiyeneixun&amp;utm_term=%E4%BC%81%E4%B8%9A%E6%9C%8D%E5%8A%A1\" target=\"_blank\">企业培训</a></dd><dd><a href=\"https://business.segmentfault.com/services.html?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=business&amp;utm_content=footer-links-services-huodongcehua&amp;utm_term=%E6%B4%BB%E5%8A%A8%E7%AD%96%E5%88%92\" target=\"_blank\">活动策划</a></dd><dd><a href=\"https://business.segmentfault.com/ads.html?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=business&amp;utm_content=footer-links-ads&amp;utm_term=%E5%B9%BF%E5%91%8A%E6%8A%95%E6%94%BE\" target=\"_blank\">广告投放</a></dd><dd><a href=\"https://business.segmentfault.com/contact.html?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=business&amp;utm_content=footer-links-contact&amp;utm_term=%E5%90%88%E4%BD%9C%E8%81%94%E7%B3%BB\" target=\"_blank\">合作联系</a></dd></dl><dl><dt>关于</dt><dd><a href=\"https://about.segmentfault.com/?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=about&amp;utm_content=about-index&amp;utm_term=%E5%85%B3%E4%BA%8E%E6%88%91%E4%BB%AC\">关于我们</a></dd><dd><a href=\"https://about.segmentfault.com/careers.html?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=about&amp;utm_content=about-careers&amp;utm_term=%E5%8A%A0%E5%85%A5%E6%88%91%E4%BB%AC\">加入我们</a></dd><dd><a href=\"https://about.segmentfault.com/contact.html?utm_source=sf-footer&amp;utm_medium=footer-nav&amp;utm_campaign=about&amp;utm_content=about-contact&amp;utm_term=%E8%81%94%E7%B3%BB%E6%88%91%E4%BB%AC\">联系我们</a></dd></dl><dl><dt>关注</dt><dd><a href=\"https://segmentfault.com/blog/segmentfault\" target=\"_blank\">产品技术日志</a></dd><dd><a href=\"https://segmentfault.com/blog/community_admin\" target=\"_blank\">社区运营日志</a></dd><dd><a href=\"https://segmentfault.com/blog/segmentfault_news\" target=\"_blank\">市场运营日志</a></dd><dd><a href=\"https://segmentfault.com/blog/segmentfault_team\" target=\"_blank\">团队日志</a></dd><dd><a href=\"https://segmentfault.com/blog/interview\" target=\"_blank\">社区访谈</a></dd><dd><ul><li><a data-toggle=\"popover\" data-placement=\"top\" data-content=\"\" data-original-title=\"\" title=\"\">微信</a></li>&nbsp;<li><a href=\"http://weibo.com/segmentfault\" target=\"_blank\">新浪微博</a></li>&nbsp;<li><a href=\"https://github.com/SegmentFault\" target=\"_blank\">Github</a></li>&nbsp;<li><a href=\"https://twitter.com/segment_fault\" target=\"_blank\">Twitter</a></li></ul></dd></dl><dl id=\"license\"><dt>条款</dt><dd><a href=\"https://segmentfault.com/tos\">服务条款</a></dd><dd><a href=\"https://creativecommons.org/licenses/by-nc-nd/4.0/\" target=\"_blank\">内容许可</a></dd><dd><a href=\"https://segmentfault.com/app\"><img src=\"https://static.segmentfault.com/v-5a66e7d0/page/img/app/appQrcode.png\"></a><div><p>扫一扫下载 App<img src=\"http://p2bhwwngu.bkt.clouddn.com/o_1c5b5t260do21nkv1n5s12p4157vp.png\" style=\"max-width: 100%;\"><img src=\"http://p2bhwwngu.bkt.clouddn.com/o_1c5b5unsk1ruth507521ri1rtbu.png\" style=\"max-width: 100%;\"></p></div></dd></dl></div></div></footer>', '4', '1', '2018-01-28 17:34:27', '2018-01-28 17:34:27', '1002');

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
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COMMENT='分发表';

-- ----------------------------
-- Records of distribute_tb
-- ----------------------------
INSERT INTO `distribute_tb` VALUES ('1000', '舒靖宇', '1', '365.00', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1', '1000', '1010');
INSERT INTO `distribute_tb` VALUES ('1001', '谢威', '1', '365.00', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1', '1000', '1009');

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
) ENGINE=InnoDB AUTO_INCREMENT=1020 DEFAULT CHARSET=utf8 COMMENT='财务记录表 ';

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
) ENGINE=InnoDB AUTO_INCREMENT=1009 DEFAULT CHARSET=utf8 COMMENT='财务表';

-- ----------------------------
-- Records of finance_tb
-- ----------------------------
INSERT INTO `finance_tb` VALUES ('1000', null, '292.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '292.00', '0.00', '0.00', '1000', '2018-01-19 15:46:08', '2018-02-06 15:35:18');
INSERT INTO `finance_tb` VALUES ('1005', '11874bb6149dd45428da628c9766b252', '65395.00', '769484.00', '1111.00', '700756.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1009', '2018-01-27 18:21:05', '2018-02-07 00:50:13');
INSERT INTO `finance_tb` VALUES ('1006', '11874bb6149dd45428da628c9766b252', '110000.00', '130000.00', '0.00', '20000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1010', '2018-01-27 20:23:22', '2018-02-05 12:41:50');
INSERT INTO `finance_tb` VALUES ('1007', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1011', '2018-02-06 16:39:35', '2018-02-06 16:39:35');
INSERT INTO `finance_tb` VALUES ('1008', null, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1012', '2018-02-07 01:15:45', '2018-02-07 01:15:45');

-- ----------------------------
-- Table structure for `integral_board_tb`
-- ----------------------------
DROP TABLE IF EXISTS `integral_board_tb`;
CREATE TABLE `integral_board_tb` (
  `integral_board_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '积分榜id',
  `type` tinyint(4) DEFAULT '1' COMMENT '类型,1个人，2团队',
  `time_type` tinyint(4) DEFAULT '1' COMMENT '时间类型,1周，2月，3总',
  `integral` decimal(11,2) DEFAULT '0.00' COMMENT '积分',
  `record_time` datetime DEFAULT NULL COMMENT '记录时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `account_id` int(11) DEFAULT NULL COMMENT '账户id外键',
  PRIMARY KEY (`integral_board_id`),
  KEY `INDEX_TYPE` (`type`) USING BTREE,
  KEY `INDEX_TIMETYPE` (`time_type`) USING BTREE,
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='积分榜表';

-- ----------------------------
-- Records of integral_board_tb
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=1044 DEFAULT CHARSET=utf8 COMMENT='积分详细表';

-- ----------------------------
-- Records of integral_detail_tb
-- ----------------------------
INSERT INTO `integral_detail_tb` VALUES ('1000', '1', '1.00', '2018-02-04 19:38:09', '2018-02-04 19:38:09', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1001', '1', '1.00', '2018-02-04 19:38:30', '2018-02-04 19:38:30', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1002', '1', '1.00', '2018-02-05 00:22:30', '2018-02-05 00:22:30', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1003', '1', '1.00', '2018-02-05 00:22:45', '2018-02-05 00:22:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1004', '1', '1.00', '2018-02-05 12:55:03', '2018-02-05 12:55:03', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1005', '1', '1.00', '2018-02-05 12:57:04', '2018-02-05 12:57:04', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1006', '1', '1.00', '2018-02-05 12:57:30', '2018-02-05 12:57:30', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1007', '1', '1.00', '2018-02-05 12:59:22', '2018-02-05 12:59:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1008', '1', '1.00', '2018-02-05 12:59:46', '2018-02-05 12:59:46', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1009', '1', '1.00', '2018-02-05 13:03:19', '2018-02-05 13:03:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1010', '1', '1.00', '2018-02-05 13:07:43', '2018-02-05 13:07:43', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1011', '1', '1.00', '2018-02-05 13:12:55', '2018-02-05 13:12:55', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1012', '1', '1.00', '2018-02-05 13:13:08', '2018-02-05 13:13:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1013', '1', '1.00', '2018-02-05 15:06:29', '2018-02-05 15:06:29', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1014', '1', '1.00', '2018-02-05 15:07:29', '2018-02-05 15:07:29', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1015', '1', '1.00', '2018-02-05 21:04:04', '2018-02-05 21:04:04', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1016', '1', '1.00', '2018-02-05 21:04:48', '2018-02-05 21:04:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1017', '1', '1.00', '2018-02-05 21:57:13', '2018-02-05 21:57:13', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1018', '1', '1.00', '2018-02-05 21:57:34', '2018-02-05 21:57:34', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1019', '1', '1.00', '2018-02-05 21:58:45', '2018-02-05 21:58:45', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1020', '1', '1.00', '2018-02-05 22:38:22', '2018-02-05 22:38:22', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1021', '1', '1.00', '2018-02-05 22:39:00', '2018-02-05 22:39:00', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1022', '1', '1.00', '2018-02-05 22:39:28', '2018-02-05 22:39:28', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1023', '1', '1.00', '2018-02-06 14:31:47', '2018-02-06 14:31:47', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1024', '1', '1.00', '2018-02-06 14:35:42', '2018-02-06 14:35:42', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1025', '1', '1.00', '2018-02-06 14:35:48', '2018-02-06 14:35:48', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1026', '1', '1.00', '2018-02-06 14:35:54', '2018-02-06 14:35:54', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1027', '1', '1.00', '2018-02-06 14:37:35', '2018-02-06 14:37:35', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1028', '1', '1.00', '2018-02-06 15:34:49', '2018-02-06 15:34:49', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1029', '1', '1.00', '2018-02-06 15:35:07', '2018-02-06 15:35:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1030', '1', '1.00', '2018-02-06 15:35:19', '2018-02-06 15:35:19', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1031', '1', '1.00', '2018-02-06 16:18:18', '2018-02-06 16:18:18', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1032', '1', '1.00', '2018-02-06 16:18:37', '2018-02-06 16:18:37', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1033', '1', '1.00', '2018-02-06 21:03:59', '2018-02-06 21:03:59', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1034', '1', '1.00', '2018-02-06 21:04:34', '2018-02-06 21:04:34', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1035', '1', '1.00', '2018-02-06 21:04:57', '2018-02-06 21:04:57', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1036', '1', '1.00', '2018-02-07 00:42:44', '2018-02-07 00:42:44', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1037', '1', '1.00', '2018-02-07 00:43:08', '2018-02-07 00:43:08', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1038', '1', '1.00', '2018-02-07 00:43:29', '2018-02-07 00:43:29', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1039', '1', '1.00', '2018-02-07 00:50:25', '2018-02-07 00:50:25', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1040', '1', '1.00', '2018-02-07 00:50:30', '2018-02-07 00:50:30', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1041', '1', '1.00', '2018-02-07 00:53:07', '2018-02-07 00:53:07', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1042', '1', '1.00', '2018-02-07 00:55:23', '2018-02-07 00:55:23', '1009');
INSERT INTO `integral_detail_tb` VALUES ('1043', '1', '1.00', '2018-02-07 01:16:00', '2018-02-07 01:16:00', '1012');

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
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COMMENT='积分表';

-- ----------------------------
-- Records of integral_tb
-- ----------------------------
INSERT INTO `integral_tb` VALUES ('1000', '43.00', '0.00', '0.00', '0.00', '2018-01-27 18:21:05', '2018-02-07 00:55:23', '1009');
INSERT INTO `integral_tb` VALUES ('1001', '0.00', '0.00', '0.00', '0.00', '2018-01-27 20:23:22', '2018-01-27 20:23:22', '1010');
INSERT INTO `integral_tb` VALUES ('1002', '0.00', '0.00', '0.00', '0.00', '2018-02-06 16:39:35', '2018-02-06 16:39:35', '1011');
INSERT INTO `integral_tb` VALUES ('1003', '1.00', '0.00', '0.00', '0.00', '2018-02-07 01:15:45', '2018-02-07 01:16:00', '1012');

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
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of notice_tb
-- ----------------------------
INSERT INTO `notice_tb` VALUES ('1000', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '欢迎进入老爷说', '0', '2018-02-04 16:48:40', '2018-02-05 17:40:10', null);
INSERT INTO `notice_tb` VALUES ('1002', '系统通知', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5gaqqst68db2j16nno61q3cp.jpg', '这是一个好玩的视频app', '0', '2018-02-05 17:52:14', '2018-02-05 17:52:14', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail_tb
-- ----------------------------
INSERT INTO `order_detail_tb` VALUES ('1000', '普通vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1.00', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1002', '1000');
INSERT INTO `order_detail_tb` VALUES ('1001', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1.00', '2018-02-05 21:04:34', '2018-02-05 21:04:34', '1002', '1001');
INSERT INTO `order_detail_tb` VALUES ('1002', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1.00', '2018-02-05 21:04:37', '2018-02-05 21:04:37', '1002', '1002');
INSERT INTO `order_detail_tb` VALUES ('1003', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '1111.00', '1.00', '2018-02-05 22:39:27', '2018-02-05 22:39:27', '1002', '1003');
INSERT INTO `order_detail_tb` VALUES ('1004', '普通vip', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5i8g62i1d7i5puat0mh99ah14.png', '365.00', '1.00', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1002', '1004');

-- ----------------------------
-- Table structure for `order_tb`
-- ----------------------------
DROP TABLE IF EXISTS `order_tb`;
CREATE TABLE `order_tb` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_number` varchar(255) DEFAULT NULL COMMENT '订单号',
  `type` tinyint(4) DEFAULT '0' COMMENT '类型，1VIP购买，2团购卡团购，3付费课程',
  `pay_type` tinyint(4) DEFAULT NULL COMMENT '支付类型，1支付宝，2微信,3余额支付,4ios内购',
  `status` tinyint(4) DEFAULT NULL COMMENT '订单状态，1待处理，2已完成',
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
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COMMENT='视频订单表';

-- ----------------------------
-- Records of order_tb
-- ----------------------------
INSERT INTO `order_tb` VALUES ('1000', '23942018020517092018792', '1', '2', '0', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1010');
INSERT INTO `order_tb` VALUES ('1001', '28312018020521043312990', '3', '3', '2', '2018-02-05 21:04:34', '2018-02-05 21:04:34', '1009');
INSERT INTO `order_tb` VALUES ('1002', '90292018020521043717342', '3', '3', '0', '2018-02-05 21:04:37', '2018-02-05 21:04:37', '1009');
INSERT INTO `order_tb` VALUES ('1003', '18542018020522392712298', '3', '3', '0', '2018-02-05 22:39:27', '2018-02-05 22:39:27', '1009');
INSERT INTO `order_tb` VALUES ('1004', '32352018020615351817408', '1', '2', '2', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1009');

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
  `realname` varchar(255) DEFAULT NULL COMMENT '购买人',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `number` int(4) DEFAULT NULL COMMENT '数量',
  `price` decimal(11,2) DEFAULT NULL COMMENT '金额',
  `apply_date` datetime DEFAULT NULL COMMENT '申请时间',
  `split_date` datetime DEFAULT NULL COMMENT '拆分时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) DEFAULT NULL COMMENT '拆分状态，默认0已申请，1已拆分，2已拒绝，3已退款，4已推荐给上级',
  `recommend_account_id` int(11) DEFAULT NULL COMMENT '推荐人',
  `account_id` int(11) DEFAULT NULL COMMENT '账户自身id,邀请码',
  `buy_account_id` int(11) DEFAULT NULL COMMENT '购买者id,外键',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`split_id`),
  KEY `INDEX_ACCOUNTID` (`account_id`) USING BTREE,
  KEY `INDEX_BUYACCOUNTID` (`buy_account_id`) USING BTREE,
  KEY `INDEX_APPLYDATE` (`apply_date`) USING BTREE,
  KEY `INDEX_SPLITDATE` (`split_date`) USING BTREE,
  KEY `INDEX_CREATEDATE` (`create_date`) USING BTREE,
  KEY `INDEX_UPDATEDATE` (`update_date`) USING BTREE,
  KEY `INDEX_STATUS` (`status`) USING BTREE,
  KEY `INDEX_RECOMMENDACCOUNTID` (`recommend_account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='拆分表';

-- ----------------------------
-- Records of split_tb
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8 COMMENT='团购信息表 ';

-- ----------------------------
-- Records of team_purchase_info_tb
-- ----------------------------
INSERT INTO `team_purchase_info_tb` VALUES ('1000', '2473', '0', '0', '0.00', '2018-02-05 15:18:48', '0', '0.00', '2018-02-05 15:19:07', '0', '0.00', '2018-02-05 15:20:03', '0', '0.00', '2018-02-05 15:20:20', '2018-02-05 15:20:22', '2018-02-06 15:35:18', '1000');
INSERT INTO `team_purchase_info_tb` VALUES ('1001', '0', '0', '0', '0.00', '2018-02-05 17:09:20', '0', '0.00', '2018-02-05 17:09:20', '0', '0.00', '2018-02-05 17:09:20', '0', '0.00', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1010');
INSERT INTO `team_purchase_info_tb` VALUES ('1002', '0', '0', '0', '0.00', '2018-02-06 15:35:18', '0', '0.00', '2018-02-06 15:35:18', '0', '0.00', '2018-02-06 15:35:18', '0', '0.00', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1009');

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
) ENGINE=InnoDB AUTO_INCREMENT=1029 DEFAULT CHARSET=utf8 COMMENT='视频播放记录表';

-- ----------------------------
-- Records of video_play_record_tb
-- ----------------------------
INSERT INTO `video_play_record_tb` VALUES ('1005', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:25:12', '25', '1009', '2018-02-04 15:26:29', '13');
INSERT INTO `video_play_record_tb` VALUES ('1016', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:45:01', '200', '1009', '2018-02-06 16:18:18', '12');
INSERT INTO `video_play_record_tb` VALUES ('1018', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:00:10', '0.7', '1009', '2018-02-06 21:03:59', '9');
INSERT INTO `video_play_record_tb` VALUES ('1021', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:25:12', '25', '1009', '2018-02-07 00:42:44', '13');
INSERT INTO `video_play_record_tb` VALUES ('1022', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:25:12', '25', '1009', '2018-02-07 00:43:08', '13');
INSERT INTO `video_play_record_tb` VALUES ('1026', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:45:01', '200', '1009', '2018-02-07 00:53:07', '12');
INSERT INTO `video_play_record_tb` VALUES ('1027', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:00:10', '0.7', '1009', '2018-02-07 00:55:23', '2');
INSERT INTO `video_play_record_tb` VALUES ('1028', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:25:12', '25', '1012', '2018-02-07 01:16:00', '13');

-- ----------------------------
-- Table structure for `video_set_cate_tb`
-- ----------------------------
DROP TABLE IF EXISTS `video_set_cate_tb`;
CREATE TABLE `video_set_cate_tb` (
  `video_set_cate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集类型id',
  `name` varchar(255) DEFAULT NULL COMMENT '视频集类型名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`video_set_cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1008 DEFAULT CHARSET=utf8 COMMENT='视频集类型表';

-- ----------------------------
-- Records of video_set_cate_tb
-- ----------------------------
INSERT INTO `video_set_cate_tb` VALUES ('1000', '婚姻家庭', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a23rgp1lttge8ogq13c717cf1f.png', '2018-02-02 09:29:38');
INSERT INTO `video_set_cate_tb` VALUES ('1001', '子女教育', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a239ko11im15na1gr0b5n1uec1a.png', '2018-02-02 09:29:21');
INSERT INTO `video_set_cate_tb` VALUES ('1002', '演讲口才', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a22n7t17de8g913e7gghnou15.png', '2018-02-02 09:29:01');
INSERT INTO `video_set_cate_tb` VALUES ('1003', '自我成长', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a224rvlcnqfr1h5ao11p4610.png', '2018-02-02 09:28:42');
INSERT INTO `video_set_cate_tb` VALUES ('1004', '人际关系', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a21jr7r8aang1ih21na11ol8r.png', '2018-02-02 09:28:24');
INSERT INTO `video_set_cate_tb` VALUES ('1005', '企业管理', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a21642lig1i7a12siea1m01m.png', '2018-02-02 09:28:11');
INSERT INTO `video_set_cate_tb` VALUES ('1006', '团队打造', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5a20f1q9ka31d1acl1l7h18ioh.png', '2018-02-02 09:27:47');
INSERT INTO `video_set_cate_tb` VALUES ('1007', '市场营销', 'http://p2bhwwngu.bkt.clouddn.com/o_1c58i4jkm123t1mpa2bkgp8i17h.png', '2018-02-02 09:19:23');

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
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8 COMMENT='视频集收藏表';

-- ----------------------------
-- Records of video_set_collect_tb
-- ----------------------------
INSERT INTO `video_set_collect_tb` VALUES ('1011', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:00:10', '0.7', '1009', '2018-02-07 00:55:25', '1005');

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
INSERT INTO `video_set_search_tb` VALUES ('1000', '人才', '4', '2018-02-02 19:31:12');
INSERT INTO `video_set_search_tb` VALUES ('1001', '团队', '333', '2018-02-02 19:33:43');
INSERT INTO `video_set_search_tb` VALUES ('1002', '亲子', '1', '2018-02-02 19:33:54');
INSERT INTO `video_set_search_tb` VALUES ('1003', '教育', '12324', '2018-02-07 10:10:16');
INSERT INTO `video_set_search_tb` VALUES ('1004', '人生', '1232', '2018-02-02 19:34:06');
INSERT INTO `video_set_search_tb` VALUES ('1005', '打造', '13434', '2018-02-02 19:34:14');
INSERT INTO `video_set_search_tb` VALUES ('1006', '口才', '13434', '2018-02-02 19:34:31');
INSERT INTO `video_set_search_tb` VALUES ('1007', '成长', '12324', '2018-02-07 10:12:21');
INSERT INTO `video_set_search_tb` VALUES ('1008', '营销', '12324', '2018-02-07 10:12:15');
INSERT INTO `video_set_search_tb` VALUES ('1009', '222', '1', '2018-02-07 09:57:30');

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
INSERT INTO `video_set_tb` VALUES ('1000', '自带流量的IP是个什么鬼？', 'http://p2bhwwngu.bkt.clouddn.com/o_1c529rh8d1sea19b1l9hgfr1p1kh.jpg', '苗庆显', '三只松鼠毫无疑问是电商上最成功的坚果品牌，有数据说2016年销售了49亿元，2017年的双十一又是坚果类销售第一。\n据总结，三只松鼠的成功是IP化的成功，于是为了IP价值的最大化，三只松鼠决定干两件事：一是延伸品类，比如做牙膏，理由是“吃了三只松鼠的坚果，要刷牙，肯定会想到用三只松鼠的牙膏”；二是布局线下店，让三只松鼠的IP价值在线下落地。', '0', '0', '0.00', '1', '1', '1', '1007', '2018-01-30 09:11:57', '2018-01-30 14:23:05');
INSERT INTO `video_set_tb` VALUES ('1001', '如何打造高效团队？最重要的是这三件事', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '多多头 ', '据说二战时德国军队将人分成四类：聪明又懒惰的可做军官，聪明又勤快的可任参谋；愚蠢又懒惰的可当士兵，愚蠢又勤快的赶紧滚蛋。以上说法虽然有失偏颇但是也昭显了一个高效团队的管理思路和用人原则。', '0', '0', '0.00', '1', '1', '1', '1006', '2018-01-30 09:27:07', '2018-01-30 14:21:37');
INSERT INTO `video_set_tb` VALUES ('1002', '企业管理学', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '测试', '企业管理学专业主要是培养能够掌握现代工商管理的理论、方法和技能，熟悉国内外工商管理的历史、现状和最新动态，能用所学知识分析解决我国企业管理中的一些实际问题的高级人才。', '1', '2', '1111.00', '1', '8', '1', '1005', '2018-01-30 10:01:47', '2018-01-30 14:20:52');
INSERT INTO `video_set_tb` VALUES ('1003', '人际关系', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '百科科学词条', '人际关系这个词是在20世纪初由美国人事管理协会率先提出的，也被称为人际关系论，1933年由美国哈佛大学教授梅约创立。这个概念可以从三个方面理解：\n1、人际关系表明人与人相互交往过程中心理关系的亲密性、融洽性和协调性的程度\n2、人际关系有三种心理成分组成。认知、情感和行为成分\n3、人际关系是在彼此交往的过程中建立和发展起来的。', '2', '1', '0.00', '1', '2', '1', '1004', '2018-01-30 10:03:40', '2018-01-30 14:20:19');
INSERT INTO `video_set_tb` VALUES ('1004', '如何定义自我成长', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52ctfj617p11u6hak28j7uttr.jpg', 'SusanKuang', '知识，作为人类集体智慧的结晶，是从古至今所有人类长期探索宇宙万物以及自我所积累的结果。然而并非所有知识都拥有同样的价值，其中最重要的当然非科学知识莫属。与非科学或者伪科学类知识不同，科学知识有几大重要特点：第一，它的涵盖面很广，能够解释的范围也广；第二，它研究的是客观世界，并且可以通过不断自我修正的方式去接近真理；第三，它追求逻辑上的自洽性。因此，当我们以科学知识为基础去了解周围世界时，我们对于世界的理解会更接近其真实的样子。\n\n作者：SusanKuang\n链接：https://www.jianshu.com/p/3bfb8f05d64a\n來源：简书\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。', '0', '0', '0.00', '2', '2', '1', '1003', '2018-01-30 10:04:52', '2018-01-30 14:19:50');
INSERT INTO `video_set_tb` VALUES ('1005', '如何锻炼口才？', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52dh7kp1rst17pl1d14i9114meh.jpg', '知乎用户', '口才像一辆汽车，表达能力是发动机，知识积累、业务能力、敬业精神这些都是汽油。没有汽油，再好的发动机也没用。腹有诗书气自华，随着内在综合实力的提高，你的外在气质也会出现相匹配的分值上升，提升整体战斗力。', '0', '0', '0.00', '4', '2', '1', '1002', '2018-01-30 10:16:25', '2018-01-30 14:26:54');
INSERT INTO `video_set_tb` VALUES ('1006', '恋爱先生', 'http://puui.qpic.cn/tv/0/18009322_188263/0', 'ces', '程皓具有金牌牙医和恋爱专家两种身份，帮客户王宁在比利时举办婚礼派对。派对结束泳池边有美女陷入窒息，程皓为美女做心脏复苏，被即将升任大堂经理的罗玥误会猥亵少女，打晕并报警抓走程皓。罗玥嫉恶如仇在警局仍指责攻击程皓，调取录像证明程皓清白，程皓寄投诉信反击罗玥。经理带罗玥前来道歉赔偿，程皓要罗玥当私人导游。', '1', '0', '0.00', '1', '7', '1', '1000', '2018-02-01 14:06:19', '2018-02-04 14:24:00');
INSERT INTO `video_set_tb` VALUES ('1007', '全职高手', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', 'ss', '作为嘉世战队队长的叶秋被俱乐部逼得交出一叶之秋账号卡，叶秋不愿做陪练，提出解约。俱乐部以叶秋劳苦功高为由，逼他退役来交换赔付违约费。叶秋同意，随后离开了嘉世。苏沐橙追上他表示不舍，叶秋告诉苏沐橙，他会“休息一年，然后回来”。在游荡中，叶修进入兴欣网络会所，因帮陈果打败了连胜陈果的敌手，', '1', '0', '0.00', '1', '11', '1', '1001', '2018-02-01 14:15:36', '2018-02-04 14:23:54');
INSERT INTO `video_set_tb` VALUES ('1008', '斗破苍穹', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', 'dd', '萧炎，主人公，萧家历史上空前绝后的斗气修炼天才。4岁就开始修炼斗之气，10岁拥有了九段斗之气，11岁突破十段斗之气，一跃成为家族百年来最年轻的斗者。然而在12岁那年，他却“丧失”了修炼能力，只拥有三段斗之气。整整三年时间，家族冷遇，旁人轻视，被未婚妻退婚……种种打击接踵而至。 就在他即将绝望的时候，', '0', '0', '0.00', '1', '10', '1', '1002', '2018-02-01 14:18:06', '2018-02-04 14:23:48');

-- ----------------------------
-- Table structure for `video_tb`
-- ----------------------------
DROP TABLE IF EXISTS `video_tb`;
CREATE TABLE `video_tb` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `img_address` varchar(255) DEFAULT NULL COMMENT '封面',
  `duration` varchar(255) DEFAULT NULL COMMENT '时长',
  `size` varchar(255) DEFAULT NULL COMMENT '容量，单位byte',
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
INSERT INTO `video_tb` VALUES ('2', '测试22', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '2', '1', '1005', '2018-01-30 14:01:43', '2018-02-07 10:21:59');
INSERT INTO `video_tb` VALUES ('3', 'cesh3', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:06:32', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '0', '1', '1005', '2018-01-30 14:06:43', '2018-02-07 10:21:50');
INSERT INTO `video_tb` VALUES ('4', 'ces4', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '0', '1', '1005', '2018-01-30 14:12:18', '2018-02-07 10:21:24');
INSERT INTO `video_tb` VALUES ('5', 'cs5', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q1n2e1qc87a3c7r1o8i1v9k1d.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '0', '1', '1005', '2018-01-30 14:18:24', '2018-02-07 10:21:33');
INSERT INTO `video_tb` VALUES ('6', 'cc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '2', '1', '1004', '2018-01-30 14:19:13', '2018-02-07 10:20:16');
INSERT INTO `video_tb` VALUES ('7', 'cc2', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cr6t3mhh1d071ekc11d61sinm.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '0', '1', '1004', '2018-01-30 14:19:50', '2018-02-07 10:20:25');
INSERT INTO `video_tb` VALUES ('8', 'ccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52cfqu4fdk14f31c2u1q7j1dq1h.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '2', '1', '1003', '2018-01-30 14:20:19', '2018-02-07 10:20:02');
INSERT INTO `video_tb` VALUES ('9', 'cccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '8', '1', '1002', '2018-01-30 14:20:52', '2018-02-07 10:20:37');
INSERT INTO `video_tb` VALUES ('10', 'ccccc', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52aoej510601ootgs21vm5jkd9n.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52q5on0t5gbq5a2e11eh18eo1i.mp4', '1', '1', '1001', '2018-01-30 14:21:37', '2018-02-07 10:20:54');
INSERT INTO `video_tb` VALUES ('11', 'cccccd', 'http://p2bhwwngu.bkt.clouddn.com/o_1c52rts8k1kid14su1jaj1qpppc155.jpg', '00:02:03', '0.7', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5n0ssrhbiq12ju1ei0cfa78qkl.mp4', '1', '1', '1000', '2018-01-30 14:23:05', '2018-02-07 10:21:07');
INSERT INTO `video_tb` VALUES ('12', '第一集', 'http://puui.qpic.cn/tv/0/18009322_188263/0', '00:06:32', '200', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '9', '1', '1006', '2018-02-01 14:10:54', '2018-02-07 10:22:46');
INSERT INTO `video_tb` VALUES ('13', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/ttqxo9s3cblgofl1506503143/0', '00:06:32', '25', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '11', '1', '1007', '2018-02-01 14:17:17', '2018-02-07 10:22:30');
INSERT INTO `video_tb` VALUES ('14', '第一集', 'http://puui.qpic.cn/vcover_hz_pic/0/xvlhj7cglyfwx8x1489802187/0', '00:06:32', '25', 'http://p2bhwwngu.bkt.clouddn.com/o_1c5mvem1d87srqe3srno6juv3j.mp4', '10', '1', '1008', '2018-02-01 14:19:07', '2018-02-07 10:22:16');

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
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8 COMMENT='vip成长记录表';

-- ----------------------------
-- Records of vip_growth_record_tb
-- ----------------------------
INSERT INTO `vip_growth_record_tb` VALUES ('1000', '学徒', '1', '365.00', '2018-02-05 17:09:20', '1010');
INSERT INTO `vip_growth_record_tb` VALUES ('1001', '学徒', '1', '365.00', '2018-02-06 15:35:18', '1009');

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
) ENGINE=InnoDB AUTO_INCREMENT=1005 DEFAULT CHARSET=utf8 COMMENT='vip表';

-- ----------------------------
-- Records of vip_tb
-- ----------------------------
INSERT INTO `vip_tb` VALUES ('1000', '普通vip', '1', '1', '2019-02-06 15:35:18', '2018-02-06 15:35:18', '2018-02-06 15:35:18', '1009');
INSERT INTO `vip_tb` VALUES ('1001', '普通vip', '1', '1', '2019-02-05 17:09:20', '2018-02-05 17:09:20', '2018-02-05 17:09:20', '1010');
INSERT INTO `vip_tb` VALUES ('1002', '创始股东', '5', '1', '2030-01-01 13:16:18', '2018-02-05 13:16:35', '2018-02-05 13:16:37', '1000');
INSERT INTO `vip_tb` VALUES ('1003', '学徒', '0', '0', '2018-02-06 16:39:35', '2018-02-06 16:39:35', '2018-02-06 16:39:35', '1011');
INSERT INTO `vip_tb` VALUES ('1004', '学徒', '0', '0', '2018-02-07 01:15:45', '2018-02-07 01:15:45', '2018-02-07 01:15:45', '1012');
