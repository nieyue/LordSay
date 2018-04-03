# 数据库 
#创建数据库
DROP DATABASE IF EXISTS lord_say_db;
CREATE DATABASE lord_say_db;

#使用数据库 
use lord_say_db;

#创建角色表
CREATE TABLE role_tb(
role_id int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
name varchar(255) COMMENT '角色名',
duty varchar(255) COMMENT '角色职责',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (role_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='角色表';

#创建等级表
CREATE TABLE account_level_tb(
account_level_id int(11) NOT NULL AUTO_INCREMENT COMMENT '账户等级id',
name varchar(255) COMMENT '等级名',
level tinyint(4) DEFAULT 0 COMMENT '等级,默认是0，数字越大，等级越高',
img_address varchar(255) COMMENT '等级图片',
team_purchase_price  decimal(11,2) DEFAULT 0 COMMENT '团购金额',
recommend_commission decimal(11,2) DEFAULT 0 COMMENT '推荐佣金,默认是0表示不是推荐，无佣金',
split_reward decimal(11,2) DEFAULT 0 COMMENT '拆分奖励',
split_parent_reward decimal(11,2) DEFAULT 0 COMMENT '拆分上级奖励',
split_platform_reward decimal(11,2) DEFAULT 0 COMMENT '拆分平台奖励',
number int(11) COMMENT 'VIP名额，默认为0表示普通vip',
discount_price decimal(11,2) DEFAULT 0 COMMENT '优惠价格',
total_price decimal(11,2) DEFAULT 0 COMMENT '总价值',
mark varchar(255) COMMENT '备注（权益）',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (account_level_id),
INDEX INDEX_LEVEL (level) USING BTREE,
INDEX INDEX_TEAMPURCHASEPRICE (team_purchase_price) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='等级表';

#创建平台日表
CREATE TABLE platform_day_tb(
platform_day_id int(11) NOT NULL AUTO_INCREMENT COMMENT '平台日id',
team_purchase_price  decimal(11,2) DEFAULT 0 COMMENT '团购金额',
recommend_commission decimal(11,2) DEFAULT 0 COMMENT '推荐佣金',
split_reward decimal(11,2) DEFAULT 0 COMMENT '拆分奖励',
split_parent_reward decimal(11,2) DEFAULT 0 COMMENT '拆分上级奖励',
split_platform_reward decimal(11,2) DEFAULT 0 COMMENT '拆分平台奖励',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (platform_day_id),
INDEX INDEX_CREATEDATE (create_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='平台日表';

#创建vip表
CREATE TABLE vip_tb(
vip_id int(11) NOT NULL AUTO_INCREMENT COMMENT 'vip表id',
name varchar(255) COMMENT '等级名',
level tinyint(4) DEFAULT 0 COMMENT '等级,默认是0，数字越大，等级越高',
status tinyint(4) DEFAULT 0 COMMENT '状态，0到期,1没到期',
expire_date datetime COMMENT '到期时间',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (vip_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_LEVEL (level) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='vip表';

#创建vip成长记录表
CREATE TABLE vip_growth_record_tb(
vip_growth_record_id int(11) NOT NULL AUTO_INCREMENT COMMENT 'vip成长记录id',
name varchar(255) COMMENT '等级名',
level tinyint(4) DEFAULT 0 COMMENT '等级,默认是0，数字越大，等级越高',
price decimal(11,2) DEFAULT 0 COMMENT '金额',
create_date datetime COMMENT '创建时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (vip_growth_record_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_LEVEL (level) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='vip成长记录表';

#创建账户上级表
CREATE TABLE account_parent_tb(
account_parent_id int(11) NOT NULL AUTO_INCREMENT COMMENT '账户上级id',
account_id int(11) COMMENT '账户id',
realname varchar(255) COMMENT '真实姓名',
phone varchar(255) COMMENT '手机号',
subordinate_number int(11) COMMENT '学员数',
master_id int(11) COMMENT '直接上级id',
real_master_id int(11) COMMENT '真实上级id',
account_level_id int(11) COMMENT '账户等级id',
name varchar(255) COMMENT '等级名',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (account_parent_id),
INDEX INDEX_PHONE (phone) USING BTREE,
INDEX INDEX_AOCUNTLEVELID (account_level_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_MASTERID (master_id) USING BTREE,
INDEX INDEX_REALMASTERID (real_master_id) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='账户上级表';

#创建账户表 
CREATE TABLE account_tb(
account_id int(11) NOT NULL AUTO_INCREMENT COMMENT '账户id',
sign varchar(255) COMMENT '签名',
phone varchar(255) COMMENT '注册手机号',
password varchar(255) COMMENT '密码',
contact_phone varchar(255) COMMENT '联系手机号，可以任意修改',
nickname varchar(255) COMMENT '昵称',
icon varchar(255) COMMENT '图像',
sex tinyint(4) DEFAULT 0 COMMENT '性别,默认为0未知，为1男性，为2女性',
age tinyint(4)  COMMENT '年龄',
country varchar(255) COMMENT '国家',
province varchar(255) COMMENT '省',
city varchar(255) COMMENT '城市',
realname varchar(255) COMMENT '真实姓名',
email varchar(255) COMMENT 'email',
auth tinyint(4) COMMENT '认证，0没认证，1审核中，2已认证',
identity_cards varchar(255) COMMENT '身份证',
identity_cards_front_img varchar(255) COMMENT '身份证正面',
identity_cards_back_img varchar(255) COMMENT '身份证反面',
wechat varchar(255) COMMENT '微信号',
alipay varchar(255) COMMENT '支付宝账号',
create_date datetime COMMENT '创建时间',
login_date datetime COMMENT '登陆时间',
status tinyint DEFAULT 0 COMMENT '状态，默认0正常，1锁定，2，异常',
master_id int(11) COMMENT '直接上级id外键',
role_id int(11) COMMENT '角色id外键',
role_name varchar(255) COMMENT '角色名',
PRIMARY KEY (account_id),
INDEX INDEX_AUTH (auth) USING BTREE,
INDEX INDEX_PHONE (phone) USING BTREE,
INDEX INDEX_REALNAME (realname) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_LOGINDATE (login_date) USING BTREE,
INDEX INDEX_ROLEID (role_id) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='账户表';

#创建财务表 
CREATE TABLE finance_tb(
finance_id int(11) NOT NULL AUTO_INCREMENT COMMENT '财务id',
password varchar(255) COMMENT '支付密码',
money decimal(11,2) DEFAULT 0 COMMENT '余额',
recharge decimal(11,2) DEFAULT 0 COMMENT '充值金额',
consume decimal(11,2) DEFAULT 0 COMMENT '消费金额',
withdrawals decimal(11,2) DEFAULT 0 COMMENT '提现金额',
recruiting_commission decimal(11,2) DEFAULT 0 COMMENT '招收学员佣金',
recommend_commission decimal(11,2) DEFAULT 0 COMMENT '推荐佣金',
team_purchase_price decimal(11,2) DEFAULT 0 COMMENT '团购账单',
split_reward decimal(11,2) DEFAULT 0 COMMENT '拆分奖励',
split_parent_reward decimal(11,2) DEFAULT 0 COMMENT '拆分上级奖励',
base_profit decimal(11,2) DEFAULT 0 COMMENT '赠送金钱',
account_id int(11) COMMENT '账户id外键',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (finance_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='财务表';

#创建财务记录表 
CREATE TABLE finance_record_tb(
finance_record_id int(11) NOT NULL AUTO_INCREMENT COMMENT '财务记录id',
method tinyint(4) COMMENT '方式，1支付宝，2微信,3余额支付,4ios内购',
type tinyint(4) COMMENT '类型，1账户充值，2账户提现,3招收学员佣金,4推荐佣金,5团购账单,6拆分账单,7二级团购奖励,8vip购买,9分发奖励，10二级购买vip奖励,11付费课程购买',
transaction_number varchar(255) COMMENT '交易单号',
money decimal(11,2) DEFAULT 0 COMMENT '金额',
status tinyint(4) COMMENT '状态，默认1待处理，2成功，3已拒绝',
create_date datetime   COMMENT '创建时间',
update_date datetime   COMMENT '更新时间',
account_id int(11) COMMENT '账户id,外键',
PRIMARY KEY (finance_record_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE,
INDEX INDEX_METHOD (method) USING BTREE,
INDEX INDEX_TYPE (type) USING BTREE,
INDEX INDEX_TRANSACTIONNUMBER (transaction_number) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='财务记录表 ';

#创建提现信息表 
CREATE TABLE withdrawals_tb(
withdrawals_id int(11) NOT NULL AUTO_INCREMENT COMMENT '提现信息id',
realname varchar(255) COMMENT '真实姓名',
accountname varchar(255) COMMENT '账号名称',
finance_record_id int(11) COMMENT '财务记录id外键',
PRIMARY KEY (withdrawals_id),
INDEX INDEX_FINANCERECORDID (finance_record_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='提现信息表';

#创建积分表 
CREATE TABLE integral_tb(
integral_id int(11) NOT NULL AUTO_INCREMENT COMMENT '积分id',
integral decimal(11,2) DEFAULT 0 COMMENT '剩余积分',
recharge decimal(11,2) DEFAULT 0 COMMENT '充值积分',
consume decimal(11,2) DEFAULT 0 COMMENT '消费积分',
base_profit decimal(11,2) DEFAULT 0 COMMENT '赠送积分',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (integral_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='积分表';

#创建积分详细表 
CREATE TABLE integral_detail_tb(
integral_detail_id int(11) NOT NULL AUTO_INCREMENT COMMENT '积分详细id',
type tinyint(4) DEFAULT 0 COMMENT '类型,0失去，1获得',
integral decimal(11,2) DEFAULT 0 COMMENT '积分',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (integral_detail_id),
INDEX INDEX_TYPE (type) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='积分详细表';

#创建积分榜表 
CREATE TABLE integral_board_tb(
integral_board_id int(11) NOT NULL AUTO_INCREMENT COMMENT '积分榜id',
type tinyint(4) DEFAULT 1 COMMENT '类型,1个人，2团队',
time_type tinyint(4) DEFAULT 1 COMMENT '时间类型,1周，2月，3总',
realname varchar(255) COMMENT '真实姓名',
icon varchar(255) COMMENT '图像',
integral decimal(11,2) DEFAULT 0 COMMENT '积分',
record_time datetime COMMENT '记录时间',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '账户id外键',
PRIMARY KEY (integral_board_id),
INDEX INDEX_TYPE (type) USING BTREE,
INDEX INDEX_TIMETYPE (time_type) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_RECORDTIME (record_time) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='积分榜表';

#创建视频集类型表 
CREATE TABLE video_set_cate_tb(
video_set_cate_id int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集类型id',
name varchar(255) COMMENT '视频集类型名称',
summary varchar(255) COMMENT '简介',
icon varchar(255) COMMENT '视频集类型图标',
imgAddress varchar(255) COMMENT '封面',
play_number int(11) DEFAULT 0  COMMENT '播放总次数',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (video_set_cate_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='视频集类型表';

#创建视频集标签表 
CREATE TABLE video_set_tag_tb(
video_set_tag_id int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集标签id',
name varchar(255) COMMENT '视频集标签名称',
update_date datetime COMMENT '更新时间',
video_set_id int(11) COMMENT '视频集id',
PRIMARY KEY (video_set_tag_id),
INDEX INDEX_VIDEOSETID (video_set_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='视频集标签表';

#创建视频集搜索表 
CREATE TABLE video_set_search_tb(
video_set_search_id int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集搜索id',
name varchar(255) COMMENT '视频集搜索名称',
number int(11) COMMENT '次数',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (video_set_search_id),
INDEX INDEX_NAME (name) USING BTREE,
INDEX INDEX_NUMBER (number) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='视频集搜索表';

#创建视频集表 
CREATE TABLE video_set_tb(
video_set_id int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集id',
name varchar(255) COMMENT '名称',
img_address varchar(255) COMMENT '封面',
author varchar(255) COMMENT '作者',
summary longtext COMMENT '简介',
recommend tinyint(4) DEFAULT 0 COMMENT '推荐，默认0不推，1封推，2热门推荐，3专栏',
cost tinyint(4) DEFAULT 0 COMMENT '是否收费，0免费，1vip免费，2付费课程',
total_price decimal(11,2) DEFAULT 0 COMMENT '总价，默认为0，若为0则免费',
number int(11) DEFAULT 0  COMMENT '视频集数',
play_number int(11) DEFAULT 0  COMMENT '播放总次数',
status tinyint(4) DEFAULT 1 COMMENT '状态0下架,默认1上架',
video_set_cate_id int(11) COMMENT '视频集类型id,外键',
create_date datetime  COMMENT '创建时间',
update_date datetime  COMMENT '更新时间',
PRIMARY KEY (video_set_id),
INDEX INDEX_NAME (name) USING BTREE,
INDEX INDEX_RECOMMEND (recommend) USING BTREE,
INDEX INDEX_COST (cost) USING BTREE,
INDEX INDEX_VIDEOSETCATEID (video_set_cate_id) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='视频集表';

#创建视频表 
CREATE TABLE video_tb(
video_id int(11) NOT NULL AUTO_INCREMENT COMMENT '视频id',
name varchar(255) COMMENT '名称',
img_address varchar(255) COMMENT '封面',
duration varchar(255) COMMENT '时长',
size varchar(255) COMMENT '容量，单位MB',
url varchar(255) COMMENT '链接',
play_number int(11) DEFAULT 0  COMMENT '播放次数',
status tinyint(4) DEFAULT 1 COMMENT '状态0下架,默认1上架',
video_set_id int(11) COMMENT '视频集id,外键',
create_date datetime  COMMENT '创建时间',
update_date datetime  COMMENT '更新时间',
PRIMARY KEY (video_id),
INDEX INDEX_VIDEOSETID (video_set_id) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='视频表';

#创建视频集收藏表 
CREATE TABLE video_set_collect_tb(
video_set_collect_id int(11) NOT NULL AUTO_INCREMENT COMMENT '视频集收藏id',
name varchar(255) COMMENT '名称',
img_address varchar(255) COMMENT '封面',
duration varchar(255) COMMENT '时长',
size varchar(255) COMMENT '容量，单位byte',
account_id int(11) COMMENT '收藏人id外键',
create_date datetime COMMENT '创建时间',
video_set_id int(11) COMMENT '视频集id外键',
PRIMARY KEY (video_set_collect_id),
INDEX INDEX_VIDEOSETID (video_set_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='视频集收藏表';

#创建视频播放记录表 
CREATE TABLE video_play_record_tb(
video_play_record_id int(11) NOT NULL AUTO_INCREMENT COMMENT '视频播放记录id',
name varchar(255) COMMENT '名称',
img_address varchar(255) COMMENT '封面',
duration varchar(255) COMMENT '时长',
size varchar(255) COMMENT '容量，单位byte',
account_id int(11) COMMENT '观看者id外键',
create_date datetime COMMENT '创建时间',
video_id int(11) COMMENT '视频id外键',
PRIMARY KEY (video_play_record_id),
INDEX INDEX_VIDEOID (video_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='视频播放记录表';

#创建视频缓存表 
CREATE TABLE video_cache_tb(
video_cache_id int(11) NOT NULL AUTO_INCREMENT COMMENT '视频缓存id',
name varchar(255) COMMENT '名称',
img_address varchar(255) COMMENT '封面',
duration varchar(255) COMMENT '时长',
size varchar(255) COMMENT '容量，单位byte',
account_id int(11) COMMENT '播放记录id外键',
create_date datetime COMMENT '创建时间',
video_id int(11) COMMENT '视频id外键',
PRIMARY KEY (video_cache_id),
INDEX INDEX_VIDEOID (video_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='视频缓存表';

#vip购买次数
CREATE TABLE vip_number_tb(
vip_number_id int(11) NOT NULL AUTO_INCREMENT COMMENT 'vip购买次数id',
number tinyint(4) COMMENT '次数',
create_date datetime  COMMENT '创建时间',
update_date datetime  COMMENT '更新时间',
account_id int(11) COMMENT '购买人id',
real_master_id int(11) COMMENT '真实上级id',
status tinyint(4) COMMENT '状态，1待处理，2已处理，3已超次',
PRIMARY KEY (vip_number_id),
INDEX INDEX_NUMBER (number) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_REALMASTERID (real_master_id) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='vip购买次数表';


#创建订单表 
CREATE TABLE order_tb(
order_id int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
order_number varchar(255) COMMENT '订单号',
type tinyint(4) DEFAULT 0 COMMENT '类型，1VIP购买，2团购卡团购，3付费课程',
pay_type tinyint(4) COMMENT '支付类型，1支付宝，2微信,3余额支付,4ios内购',
create_date datetime  COMMENT '创建时间',
update_date datetime  COMMENT '更新时间',
account_id int(11) COMMENT '下单人',
status tinyint(4) COMMENT '订单状态，-1待处理删除，0已完成删除,1待处理，2已完成',
PRIMARY KEY (order_id),
INDEX INDEX_TYPE (type) USING BTREE,
INDEX INDEX_PAYTYPE (pay_type) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='视频订单表';

#创建订单详情表 
CREATE TABLE order_detail_tb(
order_detail_id int(11) NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
name varchar(255) COMMENT '名称',
img_address varchar(255) COMMENT '封面',
total_price decimal(11,2) COMMENT '总价',
number int(11) COMMENT '数量/集数',
create_date datetime  COMMENT '创建时间',
update_date datetime  COMMENT '更新时间',
business_id int(11) COMMENT '业务ID',
order_id int(11) COMMENT '订单ID',
PRIMARY KEY (order_detail_id),
INDEX INDEX_ORDERID (order_id) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

#创建文章类型表 
CREATE TABLE article_cate_tb(
article_cate_id int(11) NOT NULL AUTO_INCREMENT COMMENT '文章类型id',
name varchar(255) COMMENT '文章类型名称',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (article_cate_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='文章类型表';

#创建文章表 
CREATE TABLE article_tb(
article_id int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
title varchar(255) COMMENT '标题',
subtitle varchar(255) COMMENT '子标题',
imgAddress varchar(255) COMMENT '封面',
redirect_url varchar(255)  COMMENT '跳转url',
content longtext  COMMENT '内容',
comment_number bigint(20) DEFAULT 0 COMMENT '评论数',
status tinyint(4) COMMENT '状态,下架0，上架1',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
article_cate_id int(11) COMMENT '文章类型id外键',
PRIMARY KEY (article_id),
INDEX INDEX_ARTICLECATEID (article_cate_id) USING BTREE,
INDEX INDEX_COMMENTNUMBER (comment_number) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='文章表';

#创建文章评论表 
CREATE TABLE article_comment_tb(
article_comment_id int(11) NOT NULL AUTO_INCREMENT COMMENT '文章评论id',
content varchar(255) COMMENT '内容',
point_number int(11) DEFAULT 0 COMMENT '点赞数',
create_date datetime COMMENT '创建时间',
article_id int(11) COMMENT '文章id外键',
account_id int(11) COMMENT '评论人id外键',
nickname varchar(255) COMMENT '昵称',
icon varchar(255) COMMENT '图像',
PRIMARY KEY (article_comment_id),
INDEX INDEX_POINTNUMBER (point_number) USING BTREE,
INDEX INDEX_ARTICLEID (article_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='文章评论表';

#创建通知表 
CREATE TABLE notice_tb(
notice_id int(11) NOT NULL AUTO_INCREMENT COMMENT '通知id',
region tinyint(4) COMMENT '范围，1全局，2个人',
title varchar(255) COMMENT '标题，比如：系统通知',
img_address varchar(255) COMMENT '图片地址',
content longtext COMMENT '内容',
status tinyint(4) COMMENT '状态，默认为0未读，1已读',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '通知人id外键',
parent_id int(11) COMMENT '父id',
PRIMARY KEY (notice_id),
INDEX INDEX_REGION (region) USING BTREE,
INDEX INDEX_TITLE (title) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_PARENTID (parent_id) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='通知表';

#创建收货信息表 
CREATE TABLE receipt_info_tb(
receipt_info_id int(11) NOT NULL AUTO_INCREMENT COMMENT '收货信息id',
name varchar(255) COMMENT '收货地址姓名',
phone varchar(255) COMMENT '收货地址手机号',
address varchar(255) COMMENT '收货地址',
is_default tinyint(4) DEFAULT 0 COMMENT '默认为0不是，1是',
create_date datetime   COMMENT '创建时间',
update_date datetime   COMMENT '更新时间',
account_id int(11) COMMENT '账户id,外键',
PRIMARY KEY (receipt_info_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_ISDEFAULT (is_default) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='收货地址表 ';

#创建团购信息表 
CREATE TABLE team_purchase_info_tb(
team_purchase_info_id int(11) NOT NULL AUTO_INCREMENT COMMENT '团购信息id',
team_purchase_card_allowance int(11) COMMENT '团购卡余量',
already_team_purchase int(11) COMMENT '已团购（张）',
wait_dispose int(11) COMMENT '待处理（张）',
wait_dispose_price decimal(11,2) COMMENT '待处理总额',
wait_dispose_update_date datetime   COMMENT '待处理更新时间',
team_purchase_success int(11) COMMENT '团购成功（张）',
team_purchase_success_price decimal(11,2) COMMENT '团购成功总额',
team_purchase_success_update_date datetime  COMMENT '团购成功更新时间',
already_split int(11) COMMENT '已拆分（张）',
already_split_price decimal(11,2) COMMENT '已拆分总额',
already_split_update_date datetime  COMMENT '已拆分更新时间',
already_recommend int(11) COMMENT '已推荐给上级（张）',
already_recommend_price decimal(11,2) COMMENT '已推荐给上级总额',
already_recommend_update_date datetime  COMMENT '已推荐给上级更新时间',
create_date datetime   COMMENT '创建时间',
update_date datetime   COMMENT '更新时间',
account_id int(11) COMMENT '账户id,外键',
PRIMARY KEY (team_purchase_info_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='团购信息表 ';

#创建分发表 
CREATE TABLE distribute_tb(
distribute_id int(11) NOT NULL AUTO_INCREMENT COMMENT '分发id',
realname varchar(255) COMMENT '购买人',
number int(4) COMMENT '数量，默认1张',
price decimal(11,2) COMMENT '金额',
distribute_date datetime COMMENT '分发时间',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
status tinyint(4)  COMMENT '分发状态，默认1已分发',
account_id int(11) COMMENT '账户自身id,邀请码',
buy_account_id int(11) COMMENT '购买者id,外键',
PRIMARY KEY (distribute_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_BUYACCOUNTID (buy_account_id) USING BTREE,
INDEX INDEX_DISTRIBUTEDATE (distribute_date) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='分发表';

#创建拆分表 
CREATE TABLE split_tb(
split_id int(11) NOT NULL AUTO_INCREMENT COMMENT '拆分id',
nickname varchar(255) COMMENT '昵称',
phone varchar(255) COMMENT '会员账号',
contact_phone varchar(255) COMMENT '联系电话',
remark varchar(255) COMMENT '备注',
number int(4) COMMENT '数量',
price decimal(11,2) COMMENT '金额',
apply_date datetime COMMENT '申请时间',
split_date datetime COMMENT '拆分时间',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
status tinyint(4)  COMMENT '拆分状态，默认0已申请，1已拆分，2已拒绝，3已退款，4已推荐给上级',
recommend_account_id int(11) COMMENT '推荐人id',
account_id int(11) COMMENT '购买者上级id',
buy_account_id int(11) COMMENT '申请人邀请码，购买者',
order_id int(11) COMMENT '订单id,外键',
PRIMARY KEY (split_id),
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_BUYACCOUNTID (buy_account_id) USING BTREE,
INDEX INDEX_RECOMMENDACCOUNTID (recommend_account_id) USING BTREE,
INDEX INDEX_APPLYDATE (apply_date) USING BTREE,
INDEX INDEX_SPLITDATE (split_date) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='拆分表';

#创建app版本表 
CREATE TABLE app_version_tb(
app_version_id int(11) NOT NULL AUTO_INCREMENT COMMENT 'app版本id',
platform tinyint(4)  COMMENT 'app平台，默认0安卓，1为IOS',
name varchar(255)  COMMENT 'app版本名',
type tinyint(4) DEFAULT 0 COMMENT 'app类型，默认0普通，1为强制',
content varchar(255)  COMMENT 'app更新内容',
link varchar(255)  COMMENT 'app版本链接',
update_date datetime COMMENT '更新时间',
status tinyint(4)  COMMENT 'app状态，默认0上线，1为未上线',
PRIMARY KEY (app_version_id),
INDEX INDEX_PLATFORM (platform) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='app版本表';

#创建banner表 
CREATE TABLE banner_tb(
banner_id int(11) NOT NULL AUTO_INCREMENT COMMENT 'bannerid',
name varchar(255)  COMMENT '名称',
type tinyint(4) DEFAULT 0 COMMENT '类型，默认1首页轮播，2视频，3文章',
img_address varchar(255)  COMMENT '图片',
content varchar(255)  COMMENT '内容',
link varchar(255)  COMMENT '链接',
update_date datetime COMMENT '更新时间',
status tinyint(4)  COMMENT '状态，默认0下架，1上架',
PRIMARY KEY (banner_id),
INDEX INDEX_TYPE (type) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='banner表';

#创建勋章项表 
CREATE TABLE medal_term_tb(
medal_term_id int(11) NOT NULL AUTO_INCREMENT COMMENT '勋章项id',
name varchar(255) COMMENT '名称',
img_address varchar(255) COMMENT '图片',
content varchar(255) COMMENT '内容',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (medal_term_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='勋章项表';

#创建勋章表 
CREATE TABLE medal_tb(
medal_id int(11) NOT NULL AUTO_INCREMENT COMMENT '勋章id',
name varchar(255) COMMENT '名称',
img_address varchar(255) COMMENT '图片',
content varchar(255) COMMENT '内容',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
account_id int(11) COMMENT '勋章人ID',
medal_term_id int(11) COMMENT '勋章项ID',
PRIMARY KEY (medal_id),
INDEX INDEX_MEDALTERMID (medal_term_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='勋章表';

#创建意见反馈表 
CREATE TABLE feedback_tb(
feedback_id int(11) NOT NULL AUTO_INCREMENT COMMENT '意见反馈id',
content varchar(255) COMMENT '内容',
create_date datetime COMMENT '创建时间',
account_id int(11) COMMENT '提交人账户id外键',
phone varchar(255) COMMENT '提交人注册手机号',
PRIMARY KEY (feedback_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

#创建配置表 
CREATE TABLE config_tb(
config_id int(11) NOT NULL AUTO_INCREMENT COMMENT '配置id',
customer_service_phone varchar(255)  COMMENT '客服电话',
create_date datetime COMMENT '创建时间',
update_date datetime COMMENT '更新时间',
PRIMARY KEY (config_id)
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='配置表';

#创建支付表
CREATE TABLE payment_tb(
payment_id int(11) NOT NULL AUTO_INCREMENT COMMENT '支付id',
subject varchar(255) COMMENT '主题',
body varchar(255) COMMENT '内容',
notify_url varchar(255) COMMENT '异步通知',
type tinyint(4) COMMENT '支付类型，默认1支付宝支付，2微信支付，3银联支付,4ios内购',
order_number varchar(255) COMMENT '平台订单号',
money decimal(11,2) COMMENT '金额',
status tinyint(4) DEFAULT 1 COMMENT '状态，1已下单-未支付，2支付成功，3支付失败,4异常',
business_type tinyint(4) COMMENT '业务类型，1VIP购买，2团购卡团购，3付费课程',
business_id int(11) COMMENT '业务id,外键',
business_notify_url longtext COMMENT '业务回调,外键',
account_id int(11) COMMENT '账户id,外键',
create_date datetime  COMMENT '创建时间',
update_date datetime  COMMENT '更新时间',
PRIMARY KEY (payment_id),
INDEX INDEX_ORDERNUMBER (order_number) USING BTREE,
INDEX INDEX_TYPE (type) USING BTREE,
INDEX INDEX_BUSINESSTYPE (business_type) USING BTREE,
INDEX INDEX_BUSINESSID (business_id) USING BTREE,
INDEX INDEX_ACCOUNTID (account_id) USING BTREE,
INDEX INDEX_STATUS (status) USING BTREE,
INDEX INDEX_CREATEDATE (create_date) USING BTREE,
INDEX INDEX_UPDATEDATE (update_date) USING BTREE
)ENGINE = InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='支付表';


#设置初始角色
INSERT IGNORE INTO role_tb (name,duty,update_date) 
VALUES ("超级管理员","超级管理员",now());
INSERT IGNORE INTO role_tb (name,duty,update_date) 
VALUES ("普通管理员","普通管理员",now());
INSERT IGNORE INTO role_tb (name,duty,update_date) 
VALUES ("用户","用户",now());

#初始化账户等级
INSERT IGNORE INTO account_level_tb 
(name,level,img_address,team_purchase_price,recommend_commission,split_reward,split_parent_reward,split_platform_reward,number,discount_price,total_price,mark,update_date) 
VALUES ('学徒',0,'',0,0,0,0,0,0,0,0,'学徒，浏览，互动，购买产品，升级vip',now()); 
INSERT IGNORE INTO account_level_tb 
(name,level,img_address,team_purchase_price,recommend_commission,split_reward,split_parent_reward,split_platform_reward,number,discount_price,total_price,mark,update_date) 
VALUES ('普通vip',1,'',0,0,0,0,0,0,0,0,'普通vip，团购权限，推广权益，免费看所有视频（不含售卖视频）',now()); 
INSERT IGNORE INTO account_level_tb 
(name,level,img_address,team_purchase_price,recommend_commission,split_reward,split_parent_reward,split_platform_reward,number,discount_price,total_price,mark,update_date) 
VALUES ('钻石vip',2,'',0,0,0,0,0,0,0,0,'钻石vip,团购权限，推广权益，免费看所有视频（不含售卖视频），分成',now()); 
INSERT IGNORE INTO account_level_tb 
(name,level,img_address,team_purchase_price,recommend_commission,split_reward,split_parent_reward,split_platform_reward,number,discount_price,total_price,mark,update_date) 
VALUES ('联合发起人',3,'',0,0,0,0,0,0,0,0,'联合发起人，团购权限，推广权益，免费看所有视频（不含售卖视频），分成',now()); 
INSERT IGNORE INTO account_level_tb 
(name,level,img_address,team_purchase_price,recommend_commission,split_reward,split_parent_reward,split_platform_reward,number,discount_price,total_price,mark,update_date) 
VALUES ('高级合伙人',4,'',0,0,0,0,0,0,0,0,'高级合伙人，团购权限，推广权益，免费看所有视频（不含售卖视频），分成，有机会与平台合作红利',now()); 
INSERT IGNORE INTO account_level_tb 
(name,level,img_address,team_purchase_price,recommend_commission,split_reward,split_parent_reward,split_platform_reward,number,discount_price,total_price,mark,update_date) 
VALUES ('创始股东',5,'',0,0,0,0,0,0,0,0,'创始股东，团购权限，推广权益，免费看所有视频（不含售卖视频），分成，与平台合作红利。',now()); 
 
#设置初始管理员密码MD5加密123456
INSERT IGNORE INTO account_tb (nickname,phone,email,password,create_date,login_date,role_id,role_name) 
VALUES ("聂跃","15111336587","278076304@qq.com","11874bb6149dd45428da628c9766b252",now(),now(),"1000","超级管理员"); 
#财务
INSERT IGNORE INTO finance_tb (money,recharge,consume,withdrawals,recruiting_commission,recommend_commission,team_purchase_price,split_reward,split_parent_reward,base_profit,create_date,update_date,account_id) 
VALUES (0,0,0,0,0,0,0,0,0,0,now(),now(),1000);   
